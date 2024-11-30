import argparse
import os

# Define a mapping of valid arguments to specific strings
VALID_ARGUMENTS_MAPPING = {
    "sum": "#define SUM",
    "sub": "#define SUB",
    "mul": "#define MUL",
    "div": "#define DIV",
    "mod": "#define MOD",
}


def get_key_by_value(d, value):
    for key, val in d.items():
        if val == value:
            return key
    return None


def enable_feature(filename, features):
    """Enable features for the main app in configuration file, skipping duplicates."""
    enabled_features = set()
    if os.path.exists(filename):
        with open(filename, 'r') as file:
            enabled_features = {line.strip() for line in file}

    with open(filename, 'a') as file:
        for feature in features:
            if feature in enabled_features:
                print(f"Skipped (already exists): '{get_key_by_value(VALID_ARGUMENTS_MAPPING,feature)}'")
            else:
                file.write(feature + '\n')
                print(f"Enabled: '{get_key_by_value(VALID_ARGUMENTS_MAPPING,feature)}'")
                enabled_features.add(feature)


def delete_string_from_file(filename, target_feature):
    """Disable features for the main app in configuration file. without leaving a blank line."""
    if not os.path.exists(filename):
        print(f"File '{filename}' does not exist.")
        return

    with open(filename, 'r') as file:
        lines = file.readlines()

    with open(filename, 'w') as file:
        for line in lines:
            if line.strip() != target_feature:
                file.write(line)
            else:
                print(f"Disabled: '{get_key_by_value(VALID_ARGUMENTS_MAPPING,target_feature)}'")


def process_on_flag(filename, arguments):
    """Process the --on flag."""
    if "all" in arguments:
        # Append all mapped strings
        feature_to_enable = list(VALID_ARGUMENTS_MAPPING.values())
    else:
        # Validate arguments and append corresponding strings
        feature_to_enable = [VALID_ARGUMENTS_MAPPING[arg]
                             for arg in arguments if arg in VALID_ARGUMENTS_MAPPING]

    enable_feature(filename, feature_to_enable)


def process_off_flag(filename, arguments):
    """Process the --off flag."""
    if "all" in arguments:
        # Delete all mapped strings
        strings_to_delete = list(VALID_ARGUMENTS_MAPPING.values())
    else:
        # Validate arguments and delete corresponding strings
        strings_to_delete = [VALID_ARGUMENTS_MAPPING[arg]
                             for arg in arguments if arg in VALID_ARGUMENTS_MAPPING]

    for string in strings_to_delete:
        delete_string_from_file(filename, string)


def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(
        description="Enable or disable a feature in a main application using --on or --off flags.")
    parser.add_argument("--on", nargs='*', help="Valid features to be enabled")
    parser.add_argument("--off", nargs='*',
                        help="Valid Valid features to be disabled")

    args = parser.parse_args()
    filename = 'Configuration.h'

    if args.on:
        process_on_flag(filename, args.on)

    if args.off:
        process_off_flag(filename, args.off)


if __name__ == "__main__":
    main()

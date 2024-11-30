import argparse

def generate_config(features, output_file):
    """
    Generate a config.h file based on the enabled features.
    """
    with open(output_file, 'w') as f:
        f.write("// Auto-generated configuration header\n")
        f.write("#ifndef CONFIG_H\n")
        f.write("#define CONFIG_H\n\n")
        for feature, enabled in features.items():
            if enabled:  # Only define the feature if it's enabled
                macro = f"#define {feature}"
                f.write(macro + "\n")
        f.write("\n#endif // CONFIG_H\n")
    print(f"Configuration written to {output_file}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate config.h for calculator project.")
    parser.add_argument('--add', action='store_true', help="Enable addition feature")
    parser.add_argument('--sub', action='store_true', help="Enable subtraction feature")
    parser.add_argument('--mul', action='store_true', help="Enable multiplication feature")
    parser.add_argument('--div', action='store_true', help="Enable division feature")
    parser.add_argument('--mod', action='store_true', help="Enable modulus feature")
    parser.add_argument('--output', type=str, default="configuration.h", help="Output configuration file")

    args = parser.parse_args()

    features = {
        "ADD": args.add,
        "SUB": args.sub,
        "MUL": args.mul,
        "DIV": args.div,
        "MOD": args.mod
    }

    generate_config(features, args.output)

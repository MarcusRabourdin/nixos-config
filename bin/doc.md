# bin/ configuration rules

## Architecture rules
  - Each bin category must be located in a specific directory
  - Each category must document all its scripts in a `<category_name>.md` file

## Script rules
  - Each script must use `set -e` to avoid undefined behavior
  - Each script must be named using this format: `<category_name_first_letter><binary_name>`

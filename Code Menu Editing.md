## Editing the Code Menu

### Adding Ex characters to the code menu

1. In **CodeMenu.h**, go to Line 109, and type **#define RIDLEY**. This will ensure your custom character list will be included when compiling. After doing this the first time, you won’t need to do this again.

2. Keeping **CodeMenu.h** open, go to Line 111. Here, you’ll insert your character names in alphabetical order. Afterwards, go to Line 112 and insert the Slot IDs (converted to Decimal) in the same order you have your character names in. Make sure both names and IDs are separated with commas, or else you’ll be given an error when compiling.

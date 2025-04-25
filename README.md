# Project Overview

This project is still being developed. Here’s an update on what works and what’s still in progress.

## Features

### 1. `lock` - **Fully Working**
- **What it does**: The `lock` feature makes sure that some parts of the code doesn't run with unpredictable optimizations. This is important when you have an intended outcome and need to avoid inconsistencies.
- **Why LuaJIT without JIT?**: LuaJIT is a faster version of Lua bt utilizing the just in time compilation to turn it to machine code but I am using it without the JIT compiler to keep things more predictable. Why still use it? Well luajits interpreter has a faster speed even though its not going to be getting the full capabilites.

### 2. `buffer` - **Partially Working**
- **What it does**: The `buffer` lets you load files into memory so you can work with them more easily. It is still being improved especially for reopening files after they’ve been loaded.
- **What’s next?**: I may split this module into separate parts as it’s doing a lot of things right now (like sanitizing and normalizing data).

### 3. `imports` - **Fully Working**
- **What it does**: The `imports` function makes it easy to bring in other files in your code. The files you import are only available in the file that imported them. It uses `require` under the hood but makes it easier with a special syntax: `imports("<filename>")`.
- **How it works**: All imported items are added to the global function list. This means you don’t have to keep `require`-ing them in other parts of your project. To have a non global version using `local imports("<filename>")`

### Global Setup
- **How it’s set up**: In each folder I have an `init.lua` file that sets up the global functions like `lock`, `buffer`, and `imports`. This ensures everything is available to use anywhere in the project.

---

## Future Work

There’s still a lot to do especially with the `buffer` feature. It’s not finished yet and I am still working on making file reopening better.

---

## License

This project is licensed under the MIT License. Check the [LICENSE](LICENSE) file for more details.

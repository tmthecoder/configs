require('leetcode').setup({
    lang = "cpp",
    injector = {
        ["python3"] = {
            before = true
        },
        ["cpp"] = {
            before = { "#include <vector>", "#include <queue>", "#include <iostream>", "#include <list>", "using namespace std;" },
            after = "int main() {}",
        },
        ["java"] = {
            before = "import java.util.*;",
        },
    }
})

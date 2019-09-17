name = "vscode"

version = "1.x.x"

authors = [
    "Microsoft"
]

description = \
    """
    Visual Studio Code is a source-code editor developed by Microsoft for Windows, Linux and macOS. It includes support
    for debugging, embedded Git control and GitHub, syntax highlighting, intelligent code completion, snippets,
    and code refactoring.
    """

requires = [
    "cmake-3"
]

variants = [
    ["platform-linux"]
]

tools = [
    "code"
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "vscode-1.x.x"

def commands():
    env.PATH.prepend("{root}/bin")

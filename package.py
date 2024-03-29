name = "vscode"

version = "1.39.2"

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
    "cmake-3+"
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

uuid = "vscode-{version}".format(version=str(version))

def commands():
    env.PATH.prepend("{root}/bin")

    # Helper environment variables.
    env.VSCODE_BINARY_PATH.set("{root}/bin")

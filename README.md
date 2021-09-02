# vscode-workspace

> :package: VSCode workspace files 

This repository contains settings and metadata files for building a [Workspace in Visual Studio Code](https://code.visualstudio.com/docs/editor/workspaces).

## Usage

Create a directory structure like the following:

```
wog-js/
└── vscode-workspace <-- this is the cloned repository
    ├── gen-workspace.sh
    ├── LICENSE
    ├── README.md
    └── settings.json

1 directory, 4 files
```

For the sake of simplicity you could rename `vscode-workspace` to just `workspace`.

Then `cd` into the `vscode-workspace`  directory and just run the bash script:

```
./gen-workspace.sh
```

A `.code-workspace` file will be generated pointing at all directories contained in the top-level `wog-js` directory. That file can be opened with VSCode.

## License

[MIT](LICENSE)

















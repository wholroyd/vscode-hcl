# HCL for Visual Studio Code

## Development Status
> ***The ownership of this extension has been transfered to HashiCorp and it's replacement can now be found at https://github.com/hashicorp/vscode-hcl. If you are interested in skipping straight to the extension for Visual Studio Code, it's available in the marketplace at https://marketplace.visualstudio.com/items?itemName=HashiCorp.HCL.***

> ***As far as this repository is concerned, it will remain for public transparency and research purposes only, and will not be developed further***

## Overview

This extension adds language colorization support for the HCL language to VS Code.

![IDE](https://raw.githubusercontent.com/wholroyd/vscode-hcl/master/example.png)

## Using

First, you will need to install Visual Studio Code `0.10`. In the command palette (`cmd-shift-p`) select `Install Extension` and choose `HCL`.  

## Contributing

If you are interested in making this extension better, I will gladly take pull requests that expand it to add intellisense, hovers and validators. If you're not familiar with working on Visual Studio Code extensions, check out the VS Code extenders documentation at
https://code.visualstudio.com/docs.

To get started on the extension...

1. Go to the Debug viewlet and select `Launch Extension` then hit run (`F5`). This will launch a second instance of Code with the extension from the first window loaded.

2. As you make changes, you can also reload (`Ctrl+R` or `Cmd+R` on Mac) the second Code window to load any changes.

If you have a previous release of the extension installed and you perform these steps, Code will temporarily override the locally installed version instead for the one you're working on for the second window. The first (main) window will remain to have the locally installed, prior version installed and enabled until an update is available.

## License
[MIT](LICENSE)

# HCL for Visual Studio Code

[![Join the chat at https://gitter.im/wholroyd/vscode-hcl](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/wholroyd/vscode-hcl?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This extension adds language colorization support for the HCL language to VS Code.

![IDE](http://imgur.com/Mm0SBoK.png)

## Using

First, you will need to install Visual Studio Code `0.10`. In the command palette (`cmd-shift-p`) select `Install Extension` and choose `HCL`.  

## Extending the Extension

You can set up a development environment for debugging the extension during extension development.

First make sure you do not have the extension installed in `~/.vscode/extensions`.  

```bash
rm -rf ~/.vscode/extensions/wholroyd.HCL
cd ~
git clone https://github.com/wholroyd/vscode-hcl
cd vscode-hcl
code . 
```

You can now go to the Debug viewlet and select `Launch Extension` then hit run (`F5`).

### What's in the folder
* This folder contains all of the files necessary for your extension
* `package.json` - this is the manifest file in which you declare your language support and define
the location of the grammar file that has been copied into you extension.
* `syntaxes/hcl.json` - this is the TextMate grammar file that is used for tokenization
* `hcl.configuration.json` - this the language configuration, defining the tokens that are used for
comments and brackets.

### Make changes
* you can relaunch the extension from the debug toolbar after making changes to the files listed above
* you can also reload (`Ctrl+R` or `Cmd+R` on Mac) the VS Code window with your extension to load your changes

### Add more language features
* To add features such as intellisense, hovers and validators check out the VS Code extenders documentation at
https://code.visualstudio.com/docs

## License
[MIT](LICENSE)
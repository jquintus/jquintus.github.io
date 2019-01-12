---
layout: post
comments: true
categories: 
    - mermaid
    - tools
disqus_identifier: #5

---

{% include mermaid.html %}

[Mermaid](https://knsv.github.io/mermaid/) is a tool that will generate diagrams from a basic definition language.  

The mermaid website has full description of the language and features:  https://knsv.github.io/mermaid/#syntax

## A Simple Example

The following snippet will create a simple sequence diagram.

```
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
```

The above diagram renders as:

<div class="mermaid">
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
</div>

## Tools

There are various tools that you can use to edit and save diagrams as images
* [Mermaid CLI](#mermaid-cli)
* [Visual Studio Code](#visual-studio-code)
* [Atom](#atom)

### Mermaid CLI
#### Pros and Cons

**Pros**
* Export diagram as an image

**Cons**
* No live updating diagram as you type
* Syntax requires a non-standard but simple header of <code> ```mermaid </code>

#### Setup and Use
1. Install [node.js](https://nodejs.org/en/download/)
1. Install the mermaid npm package
    ```
    npm install -g mermaid
    ```
1. Install the phantomjs npm package
    ```
    npm install -g phantomjs
    ```
1. Save the following diagram definition to a file sequence.mmd
    ```
    sequenceDiagram
        Alice->>John: Hello John, how are you?
        John-->>Alice: Great!
    ```
1. Run mermaid command
    ```
    mermaid sequence.mmd
    ```
1. Open the image found at sequence.mmd.png

![sequence.mmd.png](/images/posts/2017/2017-12-10-Diagraming-with-Mermaid/sequence_cli.png)

### Visual Studio Code

#### Pros and Cons

**Pros**
* Live updating diagram as you type

**Cons**
* No easy way to export diagram as an image
* Syntax requires a non-standard but simple header of <code> ```mermaid </code>
* Supports the `activate`/`deactivate` keywords that are unsupported by other processors

#### Setup and Use

1. Download and install [Visual Studio Code](https://code.visualstudio.com/) (this is entirely different than the "normal" Visual Studio you use to write C# code)
1. In Visual Studio Code download and install the [Mermaid Preview extension](https://marketplace.visualstudio.com/items?itemName=vstirbu.vscode-mermaid-preview)
1. Restart Visual Studio Code when prompted
1. Create a new markdown file named **sequence.md**
1. Paste in the following diagram definition (including the lines that start with three backticks)
    ```
        ```mermaid
        sequenceDiagram
            Alice->>John: Hello John, how are you?
            John-->>Alice: Great!
        ```
    ```
1. Press `<control-p>` to bring up the Visual Studio Code command window
1. Type in `> Preview Mermaid Diagram` 
    * Include the `>` character
    * You only need to type enough of the command that it shows up in the menu
    * You can type in various short cuts that will also bring up the command quickly
        * `> Mermaid`
        * `> PMD` (just the initials)
1. Click on any of the text in the left pane that is part of the diagram definition

![Sample Diagram in Visual Studio](/images/posts/2017/2017-12-10-Diagraming-with-Mermaid/sequence_vs.png)

### Atom

#### Pros and Cons
**Pros**
* Live updating diagram as you type
* Export diagram to PNG or SVG

**Cons**
* Exported diagram has a blank background (you need to manually open the file and add a non-transparent background to be able to view the image)

#### Setup and Use

1. Install [Atom editor](https://flight-manual.atom.io/getting-started/sections/installing-atom/)
1. Install [Mermaid Preview extension](https://atom.io/packages/atom-mermaid)
1. Create a new markdown file named **sequence.mmd**
1. Paste in the following diagram definition
    ```
    sequenceDiagram
        Alice->>John: Hello John, how are you?
        John-->>Alice: Great!
    ```
1. Press the `Packages -> Mermaid Preview -> Toggle Preview` button
1. To export as image right click the diagram and select `Save as PNG`

![Sample Diagram in Atom](/images/posts/2017/2017-12-10-Diagraming-with-Mermaid/sequence_atom.png)



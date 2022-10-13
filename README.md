# Thesis template - WI PB

The template for master/engineering thesis for IT Department in Bialystok University of Technology

## Authors and Mainteainters

Jakub Zaprzałka <j.zaprzalka@student.pb.edu.pl>

## Recommended software

It is recommended to use Visual Studio Code. The recommended extensions are:

- [torn4dom4n.latex-support](https://marketplace.visualstudio.com/items?itemName=torn4dom4n.latex-support) - LaTeX language support for Visual Studio Code
- [James-Yu.latex-workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) - Boost LaTeX typesetting efficiency with preview, compile, autocomplete, colorize, and more.
- [valentjn.vscode-ltex](https://marketplace.visualstudio.com/items?itemName=valentjn.vscode-ltex) - Grammar/spell checker using LanguageTool with support for LaTeX, Markdown, and others

## Usage 

The main file is [main.tex](./main.tex). There one can modify the parameters for the thisis and follow the comments in the file. 

```latex
\title          {Praca Inżynierska}
\author         {Autor}
\date           {\today}
% ---------------------------------------------
\katedra        {Katedra}
\thesistype     {Inżynierska}
\subject        {Temat pracy dyplomowej}
\thesisauthor   {Autor}
\supervisor     {Promotor}
\thesisyear     {2022} % Rok złożenia pracy dyplomowej w dziekanacie
```

One should also prepare pdf files for the first pages of the thesis: 
- [statement.pdf](./statement.pdf) - prepare based on [statement.docx](./statement.docx)
- [karta_dyplomowa.pdf](./karta_dyplomowa.pdf) - download from SRPD

Part of the first pages is the abstract. It sould be filled out in [summary.tex](./summary.tex). 

The compiled file will be renered in [main.pdf](./main.pdf). 


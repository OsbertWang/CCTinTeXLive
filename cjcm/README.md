# 计算数学

## 下载

[计算数学期刊](http://www.computmath.com/Jwk_jssx/CN/column/column84.shtml)

[vatola.sty](https://liam.page/attachment/attachment/LaTeX-useful-tools/old_style/vatola.sty)

[headrule.sty](https://liam.page/attachment/attachment/LaTeX-useful-tools/old_style/headrule.sty)

[slashbox.sty](http://mirrors.ctan.org/macros/latex/contrib/slashbox.zip)

[CJKCCT.sty](https://liam.page/attachment/attachment/LaTeX-useful-tools/CCT_TDS.zip)


## cjcmltx.cls

改 `\DeclareOption*{\PassOptionsToClass{\CurrentOption}{cctart}}` 为 `\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}`

改 `\LoadClass[a4paper,twoside]{cctart}` 为 `\LoadClass[a4paper,twoside]{ctexart}`

加 `\RequirePackage{CJKCCT}`


## CJKCCT.sty
删 `\newcommand{\songti}{\ziti{A}}`

删 `\newcommand{\heiti}{\ziti{B}}`

删 `\newcommand{\kaishu}{\ziti{C}}`

删 `\newcommand{\fangsong}{\ziti{D}}`

删 `\newlength{\ccwd} \setlength{\ccwd}{2em}`

删 `\newcommand\zihao[1]{\write16{Warning: command \string \zihao \space not yet implemented!}}`

删 `\newcommand\ziju[1]{\write16{Warning: command \string \ziju \space not yet implemented!!}}`

## cjcmsample.tex
用 `pdflatex` 编译，保持源文件 `GBK` 编码
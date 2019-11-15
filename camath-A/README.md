# 数学年刊

## 下载

[数学年刊](http://camath.fudan.edu.cn/config/camacn/news_category/2017-08-09/A%E8%BE%91%E6%A8%A1%E7%89%88-2017-8.rar)

[vatola.sty](https://liam.page/attachment/attachment/LaTeX-useful-tools/old_style/vatola.sty)

[headrule.sty](https://liam.page/attachment/attachment/LaTeX-useful-tools/old_style/headrule.sty)

[slashbox.sty](http://mirrors.ctan.org/macros/latex/contrib/slashbox.zip)

[cchead.sty, ccdummy.tfm, ccfntd.tfm, ccfnte.tfm, ccfntf.tfm, ccfntg.tfm, ccfnti.tfm](https://liam.page/attachment/attachment/LaTeX-useful-tools/CCT_TDS.zip)


## ASTYLE.CTX

改 `\sbox{\mygraphic}{\includegraphics[scale=1.8]{\figno.ps}}` 为 `\sbox{\mygraphic}{\includegraphics[scale=1.8]{\figno.pdf}}`

## correction4.ps

命令行 `ps2pdf correction4.ps` 生成 `correction4.pdf`

## A_example.tex

改 `\documentclass[twoside]{cctart}` 为 `\documentclass[twoside]{ctexart}`

改 `\input astyle` 为 `\input{ASTYLE.CTX}`

用 `pdflatex` 编译，保持源文件 `GBK` 编码

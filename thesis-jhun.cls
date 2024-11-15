% !Mode:: "TeX:UTF-8"

%  Copyright 2023-2024 Chaos Liu <liushichao@stu.jhun.edu.cn>
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
%  This work has the GPL-3 maintenance status `maintained'.
%
%  The Current Maintainer of this work is Chaos Liu <liushichao@stu.jhun.edu.cn>.
%
%  This work consists of the files thesis-jhun.cls, thesis-jhun.bst.

\ProvidesClass{thesis-jhun}[2024/04/23 v0.1
    The LaTeX template for thesis of JHUN]

% 打印一条消息到控制台，告知用户正在使用jhun_thesis文档类，以及版本和作者信息。
\typeout{Document Class 'jhun_thesis' v0.1 by Chaos (2024/04)}

% 加载ctexbook文档类，这是一个用于编写中文书籍的文档类。
% 选项 zihao=-4 设置了默认的字号为小四号。
% 选项 a4paper 设置了纸张大小为A4。
% 选项 openany 允许章节在奇数页或偶数页开始。
% 选项 twoside 启用双面打印模式。
\LoadClass[zihao=-4, a4paper, openany, twoside]{ctexbook}

% check XETEX
\RequirePackage{ifxetex}
\ifxetex\else
    \ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
        Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

% 引入xcolor包，用于颜色的定义和使用。
% 选项 dvipsnames, svgnames, table允许使用预定义的颜色集。
\RequirePackage[dvipsnames,svgnames,table]{xcolor}

% 设置浮动体（如图表）的标题样式。
% font={doublespacing, small} 设置标题字体为双倍行距和小号字体。
% labelsep=space 设置标题和编号之间的分隔符为空格。
% skip=6pt 设置标题和文本之间的距离为6pt。
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6pt]{caption}

% 引入tabularx和array包，用于创建和自定义表格。
\RequirePackage{tabularx, array}
% booktabs提供了更专业的表格线条命令，如\toprule。
\RequirePackage{booktabs}

% 引入setspace包，用于设置文档的行距。
\RequirePackage{setspace}
% 引入multirow包，支持在表格中跨行合并单元格。
\RequirePackage{multirow}
% 引入amsmath包，提供数学公式的扩展功能。
\RequirePackage[tbtags]{amsmath}
% 引入amssymb包，在amsfonts基础上提供更多的数学符号。
\RequirePackage{amssymb}
% 引入glossaries包，用于创建和管理术语表。
\RequirePackage[nopostdot]{glossaries}

% 超链接
\usepackage{hyperref}

% 下划线
\RequirePackage{ulem}

% 设置行距
\RequirePackage{setspace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% font %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 设置文档的主要字体为Times New Roman。
\setmainfont{Times New Roman}

% 重新定义宋体和黑体，使其支持文本加粗（AutoFakeBold选项用于模拟粗体）。
\let\songti\relax
\let\heiti\relax
\setCJKfamilyfont{songti}[AutoFakeBold = {2.17}]{SimSun}
\setCJKfamilyfont{heiti}[AutoFakeBold = {2.17}]{SimHei}
% 重新定义华文行楷和华文楷体，同样支持文本加粗。
\setCJKfamilyfont{hwxingkai}[AutoFakeBold = {2.17}]{STXingkai}
\setCJKfamilyfont{hwkaiti}[AutoFakeBold = {2.17}]{STKaiti}

% 创建新命令以便在文档中使用这些字体。
\newcommand{\songti}{\CJKfamily{songti}}
\newcommand{\heiti}{\CJKfamily{heiti}}
\newcommand{\hwxingkai}{\CJKfamily{hwxingkai}}
\newcommand{\hwkaiti}{\CJKfamily{hwkaiti}}

% 预定义各种字号的命令，方便在文档中设置字体大小。
\newcommand{\xiaochuhao}{\fontsize{32pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26pt}{39pt}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24pt}{36pt}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{33pt}\selectfont}
\newcommand{\xiaoer}{\fontsize{18pt}{27pt}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{24pt}\selectfont}
\newcommand{\xiaosan}{\fontsize{15pt}{22.5pt}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{21pt}\selectfont}
\newcommand{\xiaosi}{\fontsize{12pt}{18pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{15.75pt}\selectfont}
\newcommand{\xiaowu}{\fontsize{9pt}{13.5pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{11.25pt}\selectfont}

% 中文空格
\newcommand{\chinesespace}{\char"3000}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% header & footer %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 引入fancyhdr包，用于自定义页眉和页脚。
\RequirePackage{fancyhdr}

% 自定义名为frontmatter的页面样式，通常用于文档的前言部分。
% 页眉、页脚无分割线，清空内容。
% 页眉左边位置（L）显示学校LOGO。
% 页脚中间位置（C）显示当前页码。
\fancypagestyle{frontmatter}{
    \fancyhf{} % 清空页眉和页脚的内容。
    \fancyhead[L]{ % 在页眉左侧添加内容。
        \includegraphics{style/jhun_mark.jpg}\hfill % 包含学校LOGO图片，并右对齐。
    }
    \fancyfoot[C]{\Roman{\thepage}} % 在页脚中间位置显示大写罗马数字页码。

    \renewcommand{\headrulewidth}{0pt} % 设置页眉的下划线宽度为0pt，即不显示。
    \renewcommand{\footrulewidth}{0pt} % 设置页脚的上划线宽度为0pt，即不显示。
}

% 设置前言部分的页码为大写罗马数字。
\renewcommand{\frontmatter}{
    \cleardoublepage % 清除当前页，开始新的一页，确保章节开始于奇数页。
    \@mainmatterfalse % 设置一个标志，表示当前不是正文部分。
    \pagenumbering{Roman} % 设置页码为大写罗马数字。
}

% 自定义名为mainmatter的页面样式，通常用于文档的正文部分。
\fancypagestyle{mainmatter}{
    \fancyhf{} % 清空页眉和页脚的内容。

    \fancyhead[L]{ % 在页眉左侧添加内容。
        \includegraphics{style/jhun_mark.jpg}\\ \vspace*{1cm} % 包含学校LOGO图片，并在下方增加1cm的垂直空间。
    }
    \fancyfoot[C]{\thepage} % 在页脚中间位置显示阿拉伯数字页码。

    \renewcommand{\headrulewidth}{0pt} % 设置页眉的下划线宽度为0pt，即不显示。
    \renewcommand{\footrulewidth}{0pt} % 设置页脚的上划线宽度为0pt，即不显示。
}

% 重定义plain页面样式，通常用于章节开始前的空白页。
\fancypagestyle{plain}{
    \pagestyle{fancy} % 应用fancy样式。
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% cover %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{
    \pagestyle{empty}
    \songti
    \zihao{-4}

    \makecover
}

% 本科生首页底部的填写内容居中
% cvcbc : CoVer - Center - Bottom - Center
\newcommand{\ulinecvcbc}[1]{\uline{\makebox[14em][c]{#1}}}
\newcommand{\underlineWithSpace}[2][4cm]% #1 是下划线宽度，默认为 4cm；#2 是要下划线的文本
{%
\hspace{1pt}% 在下划线前添加 1pt 的空白
\underline{% 开始下划线
  \makebox[#1][c]{#2}% 创建一个宽度为 #1 的盒子，并将 #2 居中
}%
\hspace{3pt}% 在下划线后添加 3pt 的空白
}

\newcommand{\makecover}{
    \pagestyle{frontmatter}
    \frontmatter
    \begin{titlepage}

        \begin{flushleft}
            % \sihao\songti 
            \fontsize{14pt}{\baselineskip}\bf 二○二四 届学生毕业论文（设计）\hfill 存档编号：\uline{\makebox[9em]{\hfill}}
            \vskip 30bp
            \includegraphics[width=0.5\textwidth]{jhun_mark.jpg}
        \end{flushleft}

        \vskip 45bp
        \centerline{\fontsize{48pt}{\baselineskip} {毕业论文（设计）}}

        \vskip 50bp
        \begin{center}
            \zihao{3}
            \begin{tabular}{rl}
            题目:
            &\underlineWithSpace[10cm]{基于\LaTeX 的江汉大学} 	\\
            &\underlineWithSpace[10cm] {人工智能学院毕业论文模板}							\\[2cm]
            &\makebox[4em][s]{学院}    \hspace{0.2cm}	\underlineWithSpace[5.5cm]{\sihao \zhtheschool} \\
            &\makebox[4em][s]{专业}	\hspace{0.2cm}		\underlineWithSpace[5.5cm]{\sihao \zhthemajor}      \\
            &\makebox[4em][s]{学生姓名}	\hspace{0.2cm}	\underlineWithSpace[5.5cm]{\sihao \zhtheauthor}   \\
            % &\makebox[4em][s]{学号}	\hspace{0.2cm}	\underlineWithSpace[5.5cm]{20177740}   \\ 
            &\makebox[4em][s]{指导教师}	\hspace{0.2cm}	\underlineWithSpace[5.5cm]{\sihao \zhtheadvisor}   \\
            \end{tabular}
        \end{center}

        \vskip 60bp
        \centerline{\fontsize{12pt}{12pt}\selectfont \thedatesubmit}
        \centerline{\sanhao \thedateconfer}
    \end{titlepage}

    \setcounter{page}{1}
    \setlength{\extrarowheight}{2pt}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% table %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\heavyrulewidth}{0.9pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\arrayrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% picture %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{graphicx}
\graphicspath{{style/}}
\RequirePackage{pifont} % “秘级”后的五角星
\RequirePackage{subfigure}

% -------------- Infomation ------------------

\newcommand{\zhthetitle}{\chinesespace}
\newcommand{\zhtheauthor}{\chinesespace}
\newcommand{\zhthedate}{\chinesespace}
\newcommand{\zhtheschool}{\chinesespace}
\newcommand{\zhthemajor}{\chinesespace}
\newcommand{\zhtheadvisor}{\chinesespace}

\newcommand{\enthetitle}{\chinesespace}
\newcommand{\entheauthor}{\chinesespace}
\newcommand{\enthedate}{\chinesespace}
\newcommand{\entheschool}{\chinesespace}
\newcommand{\enthemajor}{\chinesespace}
\newcommand{\entheadvisor}{\chinesespace}

\newcommand{\thestudentnumber}{\chinesespace}

\renewcommand{\title}[2]{
    \renewcommand{\zhthetitle}{#1}
    \renewcommand{\enthetitle}{#2}
}

\renewcommand{\author}[2]{
    \renewcommand{\zhtheauthor}{#1}
    \renewcommand{\entheauthor}{#2}
}

\renewcommand{\date}[2]{
    \renewcommand{\zhthedate}{#1}
    \renewcommand{\enthedate}{#2}
}

\newcommand{\major}[2]{
    \renewcommand{\zhthemajor}{#1}
    \renewcommand{\enthemajor}{#2}
}

\newcommand{\school}[2]{
    \renewcommand{\zhtheschool}{#1}
    \renewcommand{\entheschool}{#2}
}

\newcommand{\advisor}[2]{
    \renewcommand{\zhtheadvisor}{#1}
    \renewcommand{\entheadvisor}{#2}
}

\newcommand{\studentnumber}[1]{
    \renewcommand{\thestudentnumber}{#1}
}

\newcommand{\thedateoral}{}
\newcommand{\thedatesubmit}{}
\newcommand{\thedateconfer}{年\chinesespace 月}

\newcommand{\setdate}[2][]{
    \ifthenelse{\equal{#1}{oral}}{
        \renewcommand{\thedateoral}{#2}
    }{}
    \ifthenelse{\equal{#1}{submit}}{
        \renewcommand{\thedatesubmit}{#2}
    }{}
    \ifthenelse{\equal{#1}{confer}}{
        \renewcommand{\thedateconfer}{#2}
    }{}
}
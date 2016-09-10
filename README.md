# プロジェクトの使い方
- ## このプロジェクトについて  
    
    Makefileを書くことによプロジェクト形式でプログラムすることができる。
    各ディレクトリ


- ## プロジェクトツリー
~~~:txt
.
├── Inc
│   ├── README.md
│   └── main.h
├── Src
│   ├── README.md
│   └── main.c
├── lib
│   ├── README.md
│   └── sample
│       ├── Inc
│       │   └── sub.h
│       └── Src
│           └── sub.c
├── Makefile
├── README.md
~~~
- ## 各ディレクトリの説明
    - Inc・・・Srcディレクトリに含まれるソースファイルのプロトタイプ、定数などを宣言します。　
        
    - Src・・・メインのプログラムを 

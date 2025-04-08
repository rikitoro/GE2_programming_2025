# 第 1 章 : 序論

## コンピュータに仕事をさせるための手順

C言語で記述されたプログラムは、そのままではコンピュータで実行することができません。
C言語で書いたプログラム(ソースコード)を、コンパイル(Complile)、リンク(Link)と呼ばれる処理を行い、コンピュータで実行可能な機械語のプログラム(実行コード)を作成する必要があります。

- ソースコード : C言語などのプログラミング言語でプログラムを記述したもの
- オブジェクトコード : ソースコードをコンパイルし機械語に翻訳したもの
- 実行コード : オブジェクトコードを結合し、実行に必要な情報を付与したりして、コンピュータで実際に実行可能とした機械語のコード

### 例題 1-1 : プログラムの作成・コンパイル・実行

C 言語でプログラムを作成してコンパイルを行って実行コードを生成し、実行するまでの手順を体験してみましょう。

初めにソースコードを作成します。
エディタ(Emacs, Vim, VSCode など)で次のプログラムを作成を作成し、ファイル名を `first.c` として保存してください。
なお、 C 言語のソースコードのファイル(ソースファイル)の拡張子は `.c` とする必要があります。

``` c : first.c
#include <stdio.h>

int main(void) {
  printf("This is my first C program!\n");

  return 0;
}
```


gcc コマンドを用いてソースファイルを指定し、コンパイル(とリンク)を行います。
端末で以下のように入力しましょう。

``` : 端末
$ gcc first.c -o first
$ ls
first  first.c
```

gcc コマンドの `-o` オプションでは、コンパイルしてできる実行コードのファイル名を指定しています。
ファイルの一覧を取得する ls コマンドで実行コード `first` があることを確認しましょう。  

コンパイルができたら、実際に実行コード `first` を実行してみましょう。
端末で以下のように入力し、実行コード `first` を実行します。

プログラムに誤りがなければ、標準出力に `This is my first C program!` と表示され、改行されます。

``` : 端末
$ ./first
This is my first C program!
$
```

> **tips**
> ソースコードに構文エラー(文法上の誤り)があると、コンパイラはコンパイルに失敗し、次のようなエラーメッセージやヒントを表示します。
> エラーメッセージをよく確認し、ソースコードを修正したうえで再度コンパイルを行いましょう。

``` : 端末
$ gcc first.c -o first
first.c: In function ‘main’:
first.c:4:42: error: expected ‘;’ before ‘return’
    4 |   printf("This is my first C program!\n")
      |                                          ^
      |                                          ;
    5 | 
    6 |   return 0;
      |   ~~~~~~      
```

---

C言語のプログラミングおよびそのコンパイルと実行の手順に慣れるためにもう一つ例題に取り組みましょう。

### 例題 1-2 : プログラムの作成・コンパイル・実行 (その2)

以下のソースコード `second.c` を作成しましょう。

``` c : second.c
#include <stdio.h>

int main(void) {
  printf("This is\nmy second project\n");
  printf("WoW!");
  printf("Cool!\n");
  return 0;
}
```

gcc で `second.c` をコンパイル(とリンク)し、実行コード `second` を作成しましょう。

``` : 端末
$ gcc second.c -o second
$ ls
second  second.c
```

実行コードを実際に実行し、どのような実行結果となるかを確認しましょう。

``` : 端末
$ ./second
This is
my second project
WoW!Cool!
```

---


gcc にはコンパイラとリンカの両方の機能が備わっています。
プログラミング基礎で扱うような小規模なプログラムの開発では、
例題 1-1 で行ったように gcc でソースコードから直接実行コードを作成しても問題ありませんが、複数のソースコードを必要とする大規模な開発では、コンパイルとリンクを分けて行うことが多いです。

参考のために、コンパイルとリンクを分けて実行コードを作成する方法を体験しておきましょう。

### 例題 1-3 : (**optional**) コンパイルとリンク 

まず、プロジェクト用のディレクトリを作成し、そのディレクトリに移動します。(プロジェクトごとに適宜ディレクトリを作成するとよいでしょう)

``` : 端末
$ mkdir proj1
$ mv proj
```

次に示す、2つのソースコード `main.c` と `myfunc.c` を作成してそれぞれ保存してください。

``` c : main.c
#include <stdio.h>

void myfunc(void);

int main(void) {
  printf("Hello, Here main.c!\n");
  myfunc();
  return 0;
}
```

``` c : myfunc.c
#include <stdio.h>

void myfunc(void) {
  printf("Here, myfunc.c\n");
}
```

gcc の `-c` オプションを用いて、2つのソースコードに対してコンパイルのみを行い、オブジェクトコードを作成します。

``` : 端末
$ gcc -c main.c myfunc.c
$ ls
main.c  main.o  myfunc.c  myfunc.o
```

ls でファイルを確認すると、2つのオブジェクトコード `main.o` と `myfunc.o` が作成されているのがわかります。


次にリンカを用いて、オブジェクトコードを結合し実行コードを咲く作成します。

リンカは複数のオブジェクトコードやライブラリを結合して、コンピュータ上で直接実行できる実行コードを作成するものです。

以下のように gcc で2つのオブジェクトコード `main.o` と `myfunc.o` を指定してリンクし、`-o` オプションで指定した実行コード `main` を作成しましょう。

``` : 端末
$ gcc main.o myfunc.o -o main
$ ls
main  main.c  main.o  myfunc.c  myfunc.o
```

実行コード `second` を実行すると次のように表示されるはずです。

``` : 端末
$ ./main
Hello, Here main.c!
Here, myfunc.c
$
```
---

## 演習

### 演習 1-1 : 10までカウント

次のソースコード `count10.c` をコンパイルして実行し、プログラムの動作を確認しましょう。

``` c : count10.c
// IS2 99 愛子花子
#include <stdio.h>

int main(void) {
  int count;

  for (count = 1; count <= 10; count++) {
    printf("%d ", count);
  }

  printf("end!\n");

  return 0;
}
```

端末に表示された実行結果の部分をコピーして、テキストファイルを作成し、ファイル名 `count10_log.txt` として保存してください。

``` : 端末
$ ./count10
1 2 3 4 5 6 7 8 9 10 end!
$ 
```

ソースコード `count10.c` と実行結果 `count10_log.txt` の2つのファイルを課題へ提出してください。
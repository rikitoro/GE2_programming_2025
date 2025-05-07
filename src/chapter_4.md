# 第 4 章 : 標準入出力

## 標準出力

コンソールなどの標準出力へ文字列を出力するときは printf 関数を使います。
文字列の中に書式を指定して、数値や文字を表示することができます。

### 例題 4-1 : `printf` の使い方

次のプログラムは printf を用いて、Hello World と表示して改行するプログラムです。
printf の引数に、表示したい書式文字列 `"Hello, World\n"` を指定します(\nは改行を表します)。
なお、文字列はダブルクォーテーション`"`で囲みます。

```c : hello_world.c
#include <stdio.h>

int main(void) {

  printf("Hello, World!\n"); // Hello, World と表示される
  return 0;
}
```

実行結果は次の通りです。

``` : 端末
Hello, World!
```

---

### 例題 4-2 変数に格納された値の表示

printf では、変数に格納された値や式の値を
書式文字列に埋め込んで表示することもできます。
書式文字列中に出力変換指定 (`%c`, `%d`, `%f` など) を埋め込むと、
printf の第 2 引数以降に指定した式や変数の値を
その場所に埋め込んで表示することができます。

``` c : printf_sample0.c
#include <stdio.h>

int main(void) {
  char atmark = '@';
  int ans = 42;
  double x = 3.1, y = 2.7;

  printf("%c is cute character.\n", atmark);  // @ is cute character. と表示
  printf("The answer is %d.\n", ans);         // The answer is 42. と表示
  printf("(%f, %f)\n", x, y);                 // (3.100000, 2.700000) と表示 

  return 0;
}
```

最初の printf では、書式文字列 `"%c is cute character.\n"` の
`%c` の部分へ、char 型の変数 `atmark` に格納されている値 `'@'` が埋め込まれて
`@ is cute character.` と表示され改行されます。
なお、出力変換指定 `%c` は文字 (Ascii文字) を表示するときに用います。

```c :
  printf("%c is my favorite character.\n", atmark); 
  // @ is my favorite character. と表示
```

2 番目の printf でも同様に、書式文字列 `"The answer is %d.\n"` の
`%d` の部分へ、int 型の変数 `ans` の値 `42` が埋め込まれて、
`The answer is 42.` と表示されます。
`%d` は整数値を十進数で表示するときに用いる出力変換指定です。

```c :
  printf("The answer is %d.\n", score);      
  // The answer is 42. と表示
```

最後の printf では、書式文字列 `"(%f, %f)\n"` に二か所出力変換指定 `%f` が使われています。
初めの `%f` のところには double 型の変数 `x` の値が埋め込まれ、
2 番目の `%f` のところには double 型の変数 `y` の値が埋め込まれます。
`%f` は小数点数表示を行うための出力変換指定です。

```c :
  printf("(%f, %f)\n", x, y);                
  // (3.100000, 2.700000) と表示 
```

プログラムの実行結果です。

``` : 端末
@ is cute character.
The answer is 42.
(3.100000, 2.700000)
```

よく使う代表的な出力変換指定を以下の表に示します。

| 変換指定子 | 扱う型・値 | 出力例 (printf の呼び出し) |
|-----------|-----------|-----------------------------|
| `%d` | 符号付き 10 進整数 (int) | `printf("%d\n", -42);` → `-42` |
| `%x` / `%X` | 16 進整数（小文字 / 大文字） | `printf("%x\n", 255);` → `ff` |
| `%f` | 固定小数点実数 (double) | `printf("%f\n", 3.14);` → `3.140000` |
| `%e` / `%E` | 指数表記 | `printf("%e\n", 3.14);` → `3.140000e+00` |
| `%c` | 1 文字 (char) | `printf("%c\n", 'A');` → `A` |


---
### 例題 4-3 : 表示桁数の指定

出力変換指定子で、表示する数値の桁数などを指定することができます。
また、16 進数や指数形式での表示を指定することもできます。

次のプログラムを実行して、プログラム中のコメントを参考に実行結果を確認してください。

``` c : printf_sample1.c
#include <stdio.h>

int main(void) {
  int score = 91;
  double value = 123.45678;

  printf("12345678901234567890\n");
  printf("%4d\n", score);   // 整数 4 桁で表示
  printf("%6.2f\n", value); // 実数 全体 6 桁(小数点含む)，小数点以下 2 桁で表示
  printf("%x\n", score);    // 整数 16進法で表示
  printf("%e\n", value);    // 実数 指数形式で表示

  return 0;
}
```

プログラムの実行結果です。

``` : 端末
12345678901234567890
  91
123.46
5b
1.234568e+02
```

---

ここで紹介したもの以外にも出力変換指定子は存在します。
`printf` および出力変換指定の詳細な使い方については以下のリンク先などを参照してください。
- [Microsoft Learn, 書式指定構文: printf および wprintf 関数](https://learn.microsoft.com/ja-jp/cpp/c-runtime-library/format-specification-syntax-printf-and-wprintf-functions?view=msvc-170)
- [gnu c library manual, 12.12 Formatted Output](https://www.gnu.org/software/libc/manual/html_mono/libc.html#Formatted-Output)


---

## 標準入力

コンソールなどの標準入力から入力された値を受け取り、
変数に格納したい場合、 `scanf` 関数を用います。

### 例題 4-4 : `scanf` の使い方

次のプログラムは、標準入力から入力された 1 文字(1バイト文字)を
受け取り、その文字を `"The character you entered : "` に続けて
表示するものです。

``` c : scanf_sample0.c
#include <stdio.h>

int main(void) {
  char character; // 1 文字を格納する変数 character を宣言
  
  scanf("%c", &character); // 変数 character に入力された文字を格納

  printf("The character you entered : %c\n", character);

  return 0;
}
```


scanf は以下のように書式文字列と変数のポインタを渡して用います。
この scanf が実行されると、端末から入力された 1 文字が `char` 型の変数 `character` に格納されます。
(変数 `character` は事前に `char character;` と宣言されていることに注意してください。)
``` c :
  scanf("%c", &character) // 変数 character に入力された文字を格納
```
第 1 引数の書式文字列には入力する値の形式を入力変換指定で指定します。
文字(1バイト文字)の場合、入力変換指定は `%c` となります。
入力変換子と出力変換しはほぼ同じものとなります。

第 2 引数には、入力された値を格納する変数のポインタを渡します。
ポインタとは、その変数が主記憶装置 (メモリー) 上のどこに割り当てられているか
その場所(アドレス)を示す値のことです (詳しくは 3 学年で学びます)。
変数名の前に `&` をつけるとその変数のポインタが得られます。
ここでは、`char` 型の変数 `character` に入力された文字を格納したいので、
変数 `character` のポインタ `&character` を `scanf` の第 2 引数に渡しています。

`scanf` では入力された値を格納したい**変数に `&` をつけてポインタを渡す**ことを忘れないようにしましょう。


プログラムの実行結果です。
1 行目はユーザーからの入力です。

``` : 端末
Q
The character you entered : Q
```

---

### 例題 4-5 : 実数値の入力

`scanf` を使って、`double` 型の変数へ入力された値を格納する場合、
入力変換子は `%lf` を使います。(`%f` ではないことに注意)

次のプログラムは、2 つの実数値が入力されると、
それらを底辺と高さとする長方形の面積を計算して出力するプログラムです。

```c : rectangle.c
#include <stdio.h>

int main(void) {
  double width, height;
  double area;

  printf("Enter width height : \n");

  scanf("%lf %lf", &width, &height);　// 2 つの実数値を入力

  area = width * height;
  printf("Area of the rectagle : %f\n", area);

  return 0;
}
```

`scanf` では入力を複数受け取って、それぞれを別の変数に格納することもできます。
``` c :
  scanf("%lf %lf", &width, &height);
```
この `scanf` の文が実行されると、標準入力からの入力待ちとなり、
ユーザーから 2 つの値が順に入力されると、
はじめに入力された値は変数 `width` に格納され、
次に入力された値は変数 `height` に格納されます。

実行結果の例は次の通りです。
2 行目の `2.3` と 3 行目の `10.0` がユーザーからの入力です。
`scanf` により、それぞれの値が `double` 型の変数 `width` と `height` に格納されます。

``` : 端末
Enter width height : 
2.3
10.0
Area of the rectagle : 23.000000
```

参考として、プログラムの処理の流れを表したフローチャートを示します。
プログラムへのデータの入力や出力は平行四辺形のデータを用いて記述しましょう。

![flowchart](./assets/chap04_flowchart_rectangle.svg)


---

## コメント


プログラム中にコメントを記述することができます。
コメントはプログラムの説明やメモなどを記述するために使います。
また、コメントはプログラムの実行には影響しません。

### 例題 4-6 : コメントの使い方

コメントは、`//` から行末までの部分をコメントとして扱います。
また、`/*` から `*/` までの部分をコメントとして扱うこともできます。

``` c : comment.c
#include <stdio.h>

/* これは
    複数行にわたる
    コメントです。 */

int main(void) {
  // これはコメントです。
  printf("Hello, World!\n"); // これもコメントです。
  return 0;
}
```

---

## 演習

### 演習 4-1 

半径を入力すると、円の面積を計算して表示するプログラムを作成しましょう。
入力する半径の値は実数値(浮動小数点数)とし、円周率は 3.14 とします。
出力される円の面積の値も実数値(浮動小数点数)となることに注意しましょう。
出力される円の面積は小数点以下 3 桁まで表示するようにしてください。

プログラムの処理の流れをフローチャートを作成して検討し、
そのフローチャートに基づいてプログラムを作成してください。

実行例を示します。
1 行目はユーザーからの入力(半径)で、2 行目がプログラムからの出力(円の面積)です。

``` : 端末
5.0
78.500
```

---

### 演習 4-2

標準入力から文字( char 型の値)を 3 つ受け取ったら、
受け取った 3 つの文字を横方向へ逆順に横に並べて表示するプログラムを作成し、
動作を確認してください。

実行例を以下に示します。
1 ~ 3 行目はユーザーからの入力で、4 行目はプログラムの出力です。

``` : 端末
a
b
c
cba
```

---

### 演習 4-3 

次は掛け算の九九の表を表示するプログラムです。
プログラムを作成して実行し、その動作を確認しましょう。

``` c : table99.c
#include <stdio.h>

int main(void) {
  for (int i = 1; i <= 9; i++) {
    for (int j = 1; j <= 9; j++) {
      printf("%3d", i * j);
    }
    printf("\n");
  }

  return 0;
}
```
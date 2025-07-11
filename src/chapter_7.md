# 第 7 章 : 繰り返し処理

この章では、繰り返し処理を行うための文である while 文、do-while 文、および for 文について学びます。

## while 文

while 文は設定した条件が真である間処理を繰り返し行うための文です。
次のような場合によく利用されます。
- あらかじめ繰り返しの回数が決まっていない場合
- 繰り返しの回数が実行時に決まる場合
- 繰り返しの回数がユーザーの入力によって決まる場合  

while 文の構文は次の通りです。

```c : 
while (継続条件式) { // 継続条件式が真である間、処理を繰り返す
  処理;  // 繰り返し実行される処理
}
```

while 文の処理の流れを示したフローチャートは次のようになります。

![flowchart](./assets/ch07_while.svg)

- 継続条件式 : 繰り返し処理を行うかどうかを判断するための条件式です。例) `n <= 42`

継続条件式が真である間、処理が繰り返し実行されます。
継続条件式が偽となると while 文の実行を終了します。

なお、while 文は、処理の前に継続条件式が評価されるため、
継続条件式が最初から偽であった場合、処理は一度も実行されません。

### 例題 7-1 : while 文

次のプログラムは、while 文を利用したプログラムです。
このプログラムでは、まずユーザーから整数値の入力を受け付けます。
その値が 42 以下である限り、値を 2 倍にして表示する処理を繰り返します。
2 倍する処理を繰り返して値が 42 を超えると、`Exit` と表示してプログラムを終了します。

```c : double_while.c
#include <stdio.h>

int main(void) {
  int n;
  scanf("%d", &n); // ユーザーから整数値を入力

  while (n <= 42) { // n が 42 以下である限り繰り返す
    n *= 2; // n を 2 倍にする n <- n * 2
    printf("n = %d\n", n);
  }

  printf("Exit\n"); // 42 を超えたら while のループを抜け Exit と表示

  return 0;
}
```

while 文の継続条件式は `n <= 42` です。
この条件式が真である間、`n` の値を 2 倍にして表示する処理が繰り返されます。

プログラムの処理の流れを示したフローチャートは次のようになります。

![flowchart](./assets/ch07_while_double.svg)

実行結果例を示します。
1 行目は、ユーザーからの整数値の入力を示しています。
2 行目以降はプログラムからの出力です。

- 8 を入力した場合:

``` : 端末
8
n = 16
n = 32
n = 64
Exit
```

入力値が 8 の場合、最初の 2 倍の処理で 16 が表示され、次の 2 倍の処理で 32 が表示されます。
その後、2 倍の処理で 64 が表示され、この時点で 42 を超えたため while 文のループを抜けて、`Exit` と表示されプログラムが終了します。


- 43 を入力した場合:

``` : 端末
43
Exit
```

入力値が 43 の場合、最初から継続条件式 `n <= 42` が偽となるため、while 文の処理は一度も実行されず、すぐに `Exit` と表示されてプログラムが終了します。

---

## do-while 文

do-while 文は、while 文と似ていますが、処理の流れが異なります。
do-while 文は、少なくとも一度は処理を実行したい場合に利用されます。
do-while 文は、次のような場合に利用されます。
- まずは処理を一度実行し、その後に継続条件式を評価して、処理を繰り返すかどうかを決定したい場合

do-while 文の構文は次の通りです。

```c : 
do {
  処理; // 繰り返し実行される処理
} while (継続条件式); // 継続条件式が真である間、処理を繰り返す
```

do-while 文の処理の流れを示したフローチャートは次のようになります。

![flowchart](./assets/ch07_do_while.svg)

- 継続条件式 : 繰り返し処理を行うかどうかを判断するための条件式です。例) `n <= 42`

継続条件式が真である間、処理が繰り返し実行されます。
継続条件式が偽となると do-while 文の実行を終了します。
なお、do-while 文は、処理の後に継続条件式が評価されるため、
少なくとも一度は処理が実行されます。


### 例題 7-2 : do-while 文

次のプログラムは、do-while 文を利用したプログラムです。
このプログラムでは、まずユーザーから整数値の入力を受け付けます。
入力された値を 2 倍にして表示し、その値が 42 以下である限り、
再度 2 倍にして表示する処理を繰り返します。

```c : double_do_while.c
#include <stdio.h> 
int main(void) {
  int n;

  scanf("%d", &n); // ユーザーから整数値を入力

  do {
    n *= 2; // n を 2 倍にする n <- n * 2
    printf("n = %d\n", n);
  } while (n <= 42); // n が 42 以下である限り繰り返す

  printf("Exit\n"); // 42 を超えたら do-while のループを抜け Exit と表示

  return 0;
}
```

プログラムの処理の流れを示したフローチャートは次のようになります。

![flowchart](./assets/ch07_do_while_double.svg)


実行結果例を示します。
1 行目は、ユーザーからの整数値の入力を示しています。
2 行目以降はプログラムからの出力です。

- 8 を入力した場合:

``` : 端末
8
n = 16
n = 32
n = 64
Exit
```

入力値が 8 の場合、最初の 2 倍の処理で 16 が表示され、次の 2 倍の処理で 32 が表示されます。
その後、2 倍の処理で 64 が表示され、この時点で 42 を超えたため do-while 文のループを抜けて、`Exit` と表示されプログラムが終了します。


- 43 を入力した場合:

``` : 端末
43
n = 86
Exit
```

入力値が 43 の場合、最初の 2 倍の処理で 86 が表示されます。
その後、継続条件式 `n <= 42` が偽となるため、do-while 文のループを抜けて、`Exit` と表示されてプログラムが終了します。 

---

## for 文

for 文は、繰り返し処理を行うための文です。
決まった回数の繰り返し処理を行う場合によく利用されます。

for 文は、初期設定式、継続条件式、再設定式、処理の 4 つの部分から構成されます。

```c
for (初期設定式; 継続条件式; 再設定式) {
  処理;
}
```

処理の流れを示すフローチャートは次のようになります。

![flowchart](./assets/ch07_for.svg) 

- 初期設定式 : 繰り返し処理を行う前に一度だけ実行される式です。 例) `int i = 0`
- 継続条件式 : 繰り返し処理を行うかどうかを判断するための条件式です。例) `i < 10`
- 再設定式 : 繰り返し処理のたびに実行される式です。 例) `i++`

for 文では、初期設定式を実行した後、継続条件式を評価します。
継続条件式が真であれば、処理が実行され、その後再設定式が実行されます。
その後、再び継続条件式が評価され、真であれば処理が繰り返されます。
継続条件式が偽となると、for 文の実行を終了します。


### 例題 7-3 : for 文

for 文は、決まった回数の繰り返し処理を行う場合によく利用されます。

繰り返しの回数をカウントするための制御変数を用意して、その変数を初期設定式で初期化し、繰り返しが行われるたびに再設定式でカウント値を 1 ずつ増やしていき、
継続条件式でカウント値が繰り返しの回数に達しているかどうかを判断するという方法がよく用いられます。

次のプログラムは、for 文を利用して 1 から 10 までの整数の和を、途中の計算結果を表示しながら求めるプログラムです。

```c : sum.c
#include <stdio.h>

int main(void) {
  int sum = 0;
  int i;

  for (i = 1; i <= 10; i++) {
    sum += i;
    printf("i = %d, sum = %d\n", i, sum);
  }

  printf("sum = %d\n", sum);

  return 0;
}
```


例題のプログラムでは、for 文の初期設定式、継続条件式、再設定式はそれぞれ次のようになります。

- 初期設定式 : `i = 1`
- 継続条件式 : `i <= 10`
- 再設定式 : `i++`

for 文のはじめでカウント値を保持する変数 `i` を 1 に初期化し、1 回繰り返し処理が終わるごとに再設定式でカウント値を 1 ずつ増やしていきます。
継続条件式 `i <= 10` が真である間、すなわちカウント値が 10 以下の間は処理が繰り返されるので、ちょうど 10 回の繰り返し処理が行われます。

プログラム全体の処理の流れを示したフローチャートは次のようになります。
for 文の初期設定式、継続条件式、再設定式、処理の部分がそれぞれフローチャートの
どこに対応するかを確認してください。


![flowchart](./assets/ch07_for_sum10.svg)

実行結果は次の通りです。

``` : 端末
i = 1, sum = 1
i = 2, sum = 3
i = 3, sum = 6
i = 4, sum = 10
i = 5, sum = 15
i = 6, sum = 21
i = 7, sum = 28
i = 8, sum = 36
i = 9, sum = 45
i = 10, sum = 55
sum = 55
```

~~~admonish tip

for 文の初期設定式の部分でカウント用の変数を宣言し初期化することができます。
先ほどのプログラムは次のように書き換えることができます。

```c : sum.c
#include <stdio.h>

int main(void) {
  int sum = 0;

  for (int i = 1; i <= 10; i++) { // 初期設定式で変数 i を宣言し初期化
    sum += i;
    printf("i = %d, sum = %d\n", i, sum);
  }

  printf("sum = %d\n", sum);

  return 0;
}
```

このよう初期設定式で宣言された変数は、その for 文の内でのみ有効な変数となります。

~~~

----

### 例題 7-4 : for 文 (制御変数に double 型の変数を利用)

例題7-3 では、for 文で繰り返し回数をカウントする制御変数として int 型の変数を利用しました。
ここでは、for 文の制御変数に double 型の変数を利用して、実数値の範囲で繰り返し処理を行う例を示します。

次のプログラムは、for 文を利用して、\\(x\\) の値を -1.0 から 2.0 まで 0.3 ずつ増やしながら、
\\(y = x^2\\) の値を計算して表示するプログラムです。

```c : square.c
#include <stdio.h>

int main(void) {

  double x; 
  double y;

  for (x = -1.0; x <= 2.01; x += 0.3) { // x の初期値を -1.0 に設定し、2.01 以下の間 0.3 ずつ増やす
    y = x * x;                // y を計算
    printf("%f %f\n", x, y);  // x と y の値を表示
  }

  return 0;
}
```

プログラム中の for 文において
- 初期設定式 : `double x = -1.0`
- 継続条件式 : `x <= 2.01`
- 再設定式 : `x += 0.3`

と設定することで、\\(x\\) の値を -1.0 から 2.0 まで 0.3 ずつ増やしながら処理を繰り返します。

プログラムの処理の流れを示したフローチャートは次のようになります。

![flowchart](./assets/ch07_for_square.svg)

実行結果は次の通りです。
1 列目の \\(x\\) の値が -1.0 から 2.0 まで 0.3 ずつ増加し、2 列目の \\(y\\) の値が \\(y = x^2\\) の計算結果となっています。

``` : 端末
-1.000000 1.000000
-0.700000 0.490000
-0.400000 0.160000
-0.100000 0.010000
0.200000 0.040000
0.500000 0.250000
0.800000 0.640000
1.100000 1.210000
1.400000 1.960000
1.700000 2.890000
2.000000 4.000000
```

---

### 例題 7-5 : 繰り返しの中での条件分岐

繰り返し処理の中で条件分岐を利用することで、特定の条件に応じて処理を変えることができます。
次のプログラムは、1 から 20 までの整数のうち、3 の倍数と 5 の倍数を表示するプログラムです。

```c : multiples.c
#include <stdio.h>
int main(void) {
  int i;

  for (i = 1; i <= 20; i++) {  // i は 1 から 42 までの整数
    if (i % 3 == 0 || i % 5 == 0) { // i が 3 の倍数または 5 の倍数である場合
      printf("%d\n", i); // i を表示
    } 
  }

  return 0;
}
```

プログラムの処理の流れを示したフローチャートは次のようになります。

![flowchart](./assets/ch07_for_multiple.svg)

実行結果は次の通りです。
1 から 20 までの整数のうち、3 の倍数と 5 の倍数のみが表示されています。

``` : 端末
3
5
6
9
10
12
15
18
20
```

---

### 例題 7-6 : 二重ループ

for 文の処理の中でさらに for 文を利用することで、
いわゆる二重ループを実現することができます。

次のプログラムは、for文による二重ループを利用して、
正の整数 \(m, n\) を入力すると、\(m\) 行 \(n\) 列の長方形の領域を * で描画するプログラムです。

```c : rectangle.c
#include <stdio.h>

int main(void) {
  int n, m;

  scanf("%d %d", &m, &n); // ユーザーから m, n の値を入力

  for (int i = 0; i < m; i++) {   // 1 行目から m 行目までを描画するためのループ
    for (int j = 0; j < n; j++) { // 各行ごとに n 個の * を描画するためのループ
      printf("*"); // * を表示
    }
    printf("\n"); // 各行の描画が終わったら改行
  }

  return 0;
}
```

外側の for 文は 1 行目から順に \\(m\\) 行目までを描画するためのループです。
行をカウントする制御変数として int 型の `i` を用意し、その値は 0 から \\(m - 1\\) まで 1 ずつ増えていきます。

内側の for 文は各行ごとに \\(n\\) 個の `*` を描画するためのループです。
何列目の `*` を描画するかをカウントする制御変数として int 型の `j` を用意し、その値は 0 から \\(n - 1\\) まで 1 ずつ増えていきます。


プログラムの処理の流れを示したフローチャートは次のようになります。

![flowchart](./assets/ch07_rect.svg)

実行結果の例を示します。

1行目はユーザーからの \\(m, n\\) の値の入力を示しています。
2 行目以降がプログラムからの出力です。

- \\(m = 4, n = 7\\) を入力した場合 :

``` : 端末
4 7
*******
*******
*******
*******
```

4 行 7 列の長方形の領域が `*` で描画されています。

----


## break 文と continue 文

繰り返し処理の中で、特定の条件に応じてループを終了したり、次の繰り返しに移るための文として、break 文と continue 文があります。

### 例題 7-7 : break 文

break 文は、繰り返し処理を即座に終了するための文です。

次のプログラムは、ユーザーが入力した文字を 2 回表示する処理を 5 回繰り返し行うプログラムです。
ただし、入力された文字が q の場合は、break 文によってループを終了します。

```c : break.c
#include <stdio.h>

int main(void) {
  int i;
  char c;

  for (i = 0; i < 5; i++) { // 5 回繰り返す
    scanf(" %c", &c); // ユーザーから文字を入力 ( %c の前にスペースを入れておくとよい)
    printf("i = %d, c = %c\n", i, c); // 入力された文字を表示

    if (c == 'q') { // 入力された文字が 'q' の場合
      break; // ループを終了
    }

    printf("i = %d, c = %c\n", i, c); // もう一度入力された文字を表示
  }

  printf("Exit\n"); // ループを抜けた後に Exit と表示
  return 0;
}
```

プログラムの処理の流れを示したフローチャートは次のようになります。

![flowchart](./assets/ch07_break.svg)

q が入力された場合、break 文によって for 文から抜け出します。
そのため、q の入力に対しては 2 回目の表示は行われません。


実行結果は次の通りです。
1 行目は、ユーザーからの文字の入力を示しています。
2 行目以降はプログラムからの出力です。

- a, l, p, h, a を順に入力した場合 :

``` : 端末
a
i = 0, c = a
i = 0, c = a
l
i = 1, c = l
i = 1, c = l
p
i = 2, c = p
i = 2, c = p
h
i = 3, c = h
i = 3, c = h
a
i = 4, c = a
i = 4, c = a
Exit
```  

この実行例では 5 回 ( i = 0 から i = 4 ) の繰り返しが行われ、
各入力値が 2 回ずつ表示されます。

- 途中で q を入力した場合 (a, l, q を入力した場合) :

``` : 端末
a
i = 0, c = a
i = 0, c = a
l
i = 1, c = l
i = 1, c = l
q 
i = 2, c = q
Exit
```

入力値が q の場合、break 文によってループが終了します。
そのため、q の入力に対しては 2 回目の表示は行われず、`Exit` と表示されてプログラムが終了します。

---

### 例題 7-8 : continue 文

`continue` 文は、現在の繰り返しを中断し、次の繰り返しに移るための文です。

次のプログラムは、例題 7-7 と同様に、 ユーザーが入力した文字を 2 回表示する処理を 5 回繰り返し行うプログラムです。
ただし、入力された文字が s の場合は、2 回目の表示を行わずに次の繰り返しに移ります。

```c : continue.c
#include <stdio.h>
int main(void) {
  int i;
  char c;

  for (i = 0; i < 5; i++) { // 5 回繰り返す
    scanf(" %c", &c); // ユーザーから文字を入力 ( %c の前にスペースを入れておくとよい)
    printf("i = %d, c = %c\n", i, c); // 入力された文字を表示

    if (c == 's') { // 入力された文字が 's' の場合
      continue; // 現在の繰り返しを中断し、次の繰り返しに移る
    }

    printf("i = %d, c = %c\n", i, c); // もう一度入力された文字を表示
  }

  return 0;
}
```

プログラムの処理の流れを示したフローチャートは次のようになります。

![flowchart](./assets/ch07_continue.svg)


実行結果例を示します。

- l, a, s, e, r を順に入力した場合 :

``` : 端末
l
i = 0, c = l
i = 0, c = l
a
i = 1, c = a
i = 1, c = a
s
i = 2, c = s
e
i = 3, c = e
i = 3, c = e
r
i = 4, c = r
i = 4, c = r
```

入力値が l, a, e, r の場合は、それぞれ 2 回目の表示が行われていますが、
s の場合は 1回目の表示の後 continue 文によって現在の繰り返しが中断され、2 回目の表示は行われません。

---

## 演習

### 演習 7-1

1 以上の自然数 \\(n\\) に対して、\\(E_n\\) を
\\[ E_n = \left(1 + \dfrac{1}{n}\right)^n \\]
と定義します。

この時、正の整数値 \\(n\\) を入力すると、\\(E_n\\) の値を計算して表示するプログラムを作成してください。
プログラムの処理の流れをフローチャートを用いて設計・検討し、それに基づいてプログラムを作成しましょう。

実行例を示します。
1 行目はユーザーからの \\(n\\) の値の入力を示しています。
2 行目は計算結果の表示です。

- \\( n = 1 \\) の場合 :
``` : 端末
1
E_1 = 2.00000
```

- \\( n = 5 \\) の場合 :
``` : 端末
5
E_5 = 2.488320
```


---

### 演習 7-2

演習 6-2 では、プログラムを実行すると、"Enter your order number: Coffee (0), Tea (1) or Milk (2)" と表示し、
ユーザーが整数値を入力すると、以下のように対応する飲み物の名前を表示するプログラムを作成しました。
- 0 の場合 : Coffee
- 1 の場合 : Tea
- 2 の場合 : Milk
- それ以外の場合 : Water

ここでは、オーダーの入力と対応する飲み物の名前の表示を繰り返し行うプログラムを作成してください。
ただし、ユーザーから 0, 1, 2 以外の値が入力されたときは、Water と表示して、繰り返しを終了してください。

プログラムの処理の流れをフローチャートを用いて設計・検討し、それに基づいてプログラムを作成しましょう。

実行例を示します。

``` : 端末
Enter your order number: Coffee (0), Tea (1) or Milk (2)
0
Coffee
Enter your order number: Coffee (0), Tea (1) or Milk (2)
2
Milk
Enter your order number: Coffee (0), Tea (1) or Milk (2)
5
Water
```

ユーザーの入力が 0, 1, 2 のいずれか場合はそれぞれ対応する飲み物の名前が表示され、再度オーダーの入力を促すメッセージが表示されます。
0, 1, 2 以外の 5 を入力した場合は Water と表示され、繰り返しが終了します。

---

### 演習 7-3

正の整数値 \\(n\\) を入力すると、以下の実行例のように、高さ \\(n\\) 幅 \\(n\\) の直角三角形の領域を文字 `*` で描画するプログラムを作成してください。
プログラムの処理の流れをフローチャートを用いて設計・検討し、それに基づいてプログラムを作成しましょう。

実行例を示します。
1 行目は、ユーザーからの \\(n\\) の値の入力を示しています。

- \\( n = 6 \\) の場合 :

``` : 端末 
6
*
**
***
****
*****
******
```

--- 

### 演習 7-4

1 以上の整数 \\(n\\) を入力すると、1 から \\(n\\) までの整数を順に表示するプログラムを作成してください。
ただし、次の条件に従って表示内容を変えてください。

- 3 の倍数の時は "Fizz" と表示
- 5 の倍数の時は "Buzz" と表示
- 3 の倍数かつ 5 の倍数の時は "FizzBuzz" と表示
- それ以外の時はその整数値を表示

プログラムの処理の流れをフローチャートを用いて設計・検討し、それに基づいてプログラムを作成しましょう。

実行例を示します。
1 行目は、ユーザーからの \\(n\\) の値の入力を示しています。
2 行目以降はプログラムからの出力です。

- \\( n = 16 \\) の場合 :

``` : 端末
16
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
```


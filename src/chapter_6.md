# 第 6 章 : 分岐処理

## if 文

ある条件が成り立つ場合のみ特定の処理を実行したい場合は、if 文を使います。
if 文は、条件式と、条件式が真のときに実行する文を指定します。
条件式が偽の場合は、何も実行されません。
if 文は、次のような構文で記述します。

```c :
if (条件式) {
  処理; // 条件式が真のときに実行する文
}
```
条件式には通常、`==` や `!=` などの比較演算子を使って、数値や文字を比較する式を指定します。

フローチャートを使って、if 文の処理の流れを示すと次のようになります。

![flowchart](./assets/chap06_flowchart_if.svg)

指定した条件が成り立つ場合と成り立たない場合で処理を分岐させたい場合は、`else` を使います。
`else` の後に続く文は、条件式が偽のときに実行されます。
`else` を使った if 文は、次のような構文で記述します。

```c :
if (条件式) {
  処理1; // 条件式が真のときに実行する文
} else {
  処理2; // 条件式が偽のときに実行する文
}
```

フローチャートを使って、if-else 文の処理の流れを示すと次のようになります。

![flowchart](./assets/chap06_flowchart_ifelse.svg)

### 例題 6-1 : if 文

次のプログラムは if 文を使って、入力された数値が正の数かどうかを判定し、
正の数であれば positive number と表示し、
そうでなければ何も表示しないプログラムです。

``` c : positive.c
#include <stdio.h>

int main(void) {
  int number;

  scanf("%d", &number);

  if (number > 0) { // 条件式
    printf("positive number\n"); // 条件式が真のときに実行する文
  }

  return 0;
}
```

if 文で指定されている条件式は `number > 0` です。
この条件式が真となる場合、すなわち `mumber` の値が正となる場合は、`printf("positive number\n");` が実行されて
`positive number` と表示されます。

一方、条件式が成り立たない場合、すなわち、`mumber` がゼロまたは負の数の場合は処理がスキップされ、なにも表示されません。

このプログラムの処理の流れを示すフローチャートを次に示します。

![flowchart](./assets/chap06_flowchart_positive.svg)

プログラムの実行結果を示します。
1 行目は、入力された数値を表しています。

- 正の数を入力した場合 : 
`positive number` と表示されます。

``` : 端末
42
positive number
```

- 負の数を入力した場合 : 
何も表示されません。

``` : 端末
-1
```

---

### 例題 6-2 : if-else

if 文の後に `else` を続けることで、
条件式が偽の場合に実行する文を指定できます。

次のプログラムは、入力された数値が正の数かどうかを判定し、
正の数であれば `positive number` と表示し、
そうでなければ `zero or negative number` と表示するプログラムです。

```c : positive_negative.c
#include <stdio.h>

int main(void) {
  int number;

  scanf("%d", &number);

  if (number > 0) {
    printf("positive number\n");
  } else {
    printf("zero or negative number\n");
  }

  return 0;
}
```

if 文の条件式 `number > 0` が成り立つときは、
 `printf("positive number\n");` が実行されます。
条件式が成り立たないとき、すなわち、`number` がゼロまたは負の数のときは、
`else` の後に続くブロック内の文
`printf("zero or negative number\n");` が実行されます。

このプログラムの処理の流れを示すフローチャートを次に示します。

![flowchart](./assets/chap06_flowchart_pos_npos.svg)


プログラムの実行結果を示します。
1 行目は、入力された数値を表しています。

-  正の数を入力した場合 : 
`positive number` と表示されます。

``` : 端末
42
positive number
```

- 負の数を入力した場合 :
`zero or negative number` と表示されます。

``` : 端末
-1
zero or negative number
```

- ゼロを入力した場合 : 
`zero or negative number` と表示されます。

``` : 端末
0
zero or negative number
```

---

### 例題 6-3 : else if

if 文の `else` のあとに if 文 ( if-else 文) を続けることで、
最初の条件式が偽の場合に、
さらに別の条件式を指定して処理を分岐させることができます。

次のプログラムは、入力された数値が正の数か、負の数か、ゼロかを判定し、
それぞれの場合に応じて、`positive number` , `negative number` , `zero` と表示するプログラムです。

```c : positive_negative_zero.c
#include <stdio.h>

int main(void) {
  int number;

  scanf("%d", &number);

  if (number > 0) {
    printf("positive number\n");
  } else if (number < 0) {  // 最初の条件式が偽のときに実行される
    printf("negative number\n");
  } else {
    printf("zero\n");
  }

  return 0;
}
```

最初のif 文の条件式 `number > 0` が成り立つときは、`printf("positive number\n");` が実行されます。
この条件式が成り立たないときは、`else` に続く if 文が実行されます。
すなわち 2 番目の条件式 `number < 0` が成り立つか成り立たないかが評価されて、
条件が成り立つときは `printf("negative number\n");` が実行され、
条件式が成り立たないときは、最後の `else` に続く文 `printf("zero\n");` が実行されます。

このプログラムの処理の流れを示すフローチャートを次に示します。

![flowchart](./assets/chap06_flowchart_posnegzero.svg)

プログラムの実行結果を示します。
1 行目は、入力された数値を表しています。

- 正の数を入力した場合 : 
`positive number` と表示されます。
``` : 端末
42
positive number
```

- 負の数を入力した場合 :
`negative number` と表示されます。

``` : 端末
-1
negative number
```

- ゼロを入力した場合 : 
`zero` と表示されます。

``` : 端末
0
zero
```

---

### 例題 6-4 : 複雑な条件式

if 文の条件式には、複数の条件を組み合わせることができます。
次のプログラムは、室温として実数値を入力したときに、
入力された数値が 15.0 以上 25.0 未満であれば、
`comfortable` と表示し、
そうでなければ `uncomfortable` と表示するプログラムです。

```c : room_temperature.c
#include <stdio.h>

int main(void) {
  double temperature;
  
  printf("temperature? ");
  scanf("%lf", &temperature);
  
  if (15.0 <= temperature && temperature < 25.0) {
    printf("comfortable\n");
  } else {
    printf("uncomfortable\n");
  }

  return 0;
}
```

if 文の条件式 `15.0 <= temperature && temperature < 25.0` は、
論理積( AND ) `&&`  で結合された 2 つの条件式 `15.0 <= temperature` と
`temperature < 25.0` が両方とも成り立つときに真となります。
すなわち、`temperature` が 15.0 以上 25.0 未満のときに真となります。

条件式を `15.0 <= temperature < 25.0` のようには記述しないことに注意してください。
このように記述すると意図した通りには動作しません。

このプログラムの処理の流れを示すフローチャートを次に示します。
![flowchart](./assets/chap06_flowchart_temperature.svg)


プログラムの実行結果を示します。
1 行目は入力された数値(室温)を表しています。

- 21.5 を入力した場合 :
条件式が真となるので comfortable と表示されます。

``` : 端末
temperature? 21.5
comfortable
```

- 30.0 を入力した場合: 
条件式が偽となるので、uncomfortable と表示されます。

``` : 端末
temperature? 30.0
uncomfortable
```

---

## switch 文

条件によって分ける処理の分岐が多い場合、switch 文を使うとプログラムを簡潔に書くことができます。
整数値を取る制御式の値によって、処理を分岐させることができます。

```c :
switch (制御式) {
  case 値1:
    処理1;  // 制御式の値が 値1 のときに実行する処理
    break;  // switch 文を抜ける
  case 値2: 
    処理2;  // 制御式の値が 値2 のときに実行する処理
    break;  // switch 文を抜ける
  default:  
    処理3;  // 制御式の値が 値1, 値2 のいずれでもないときに実行する処理
    break;  // switch 文を抜ける
}
```

制御式には整数値や文字をとる変数や式を指定します。
制御式の値が `case` で指定した値と一致する場合に、
その `case` に続く処理が実行されます。
各 `case` での処理の最後に `break` を記述することで、switch 文を抜けることができます。
`break` がない場合は、次の `case` の処理が続けて実行されます。

`default:` は、制御式の値が `case` で指定した値と一致しない場合に、
実行される処理を指定するためのラベルです。
(`default:` は省略することもできます。)

フローチャートを使って、switch 文の処理の流れを示すと次のようになります。
![flowchart](./assets/chap06_switch.svg)


### 例題 6-5 : switch 文


次のプログラムは、`char` 型の値を入力して、
入力された値に応じて曜日を表示するプログラムです。

各曜日 Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday の
頭文字の大文字 `M`, `T`, `W`, `F`, `S` を入力すると
該当する曜日を表示し、それ以外の文字を入力すると `invalid` と表示します。

``` c : weekday1.c
#include <stdio.h>

int main(void) {
  char day_ch;

  scanf("%c", &day_ch);　

  switch (day_ch) { // 制御式 day_ch の値によって分岐
    case 'M':
      printf("Monday\n");
      break;
    case 'T':
      printf("Tuesday or Thursday\n");
      break;
    case 'W':
      printf("Wednesday\n");
      break;
    case 'F':
      printf("Friday\n");
      break;
    case 'S':
      printf("Saturday or Sunday\n");
      break;
    default:
      printf("invalid\n");
      break;
  }

  return 0;
}
```

このプログラムでは、 scanf によってユーザーから入力された曜日の頭文字が
char 型の変数 `day_ch` に格納されます。
switch 文では制御式としてこの `day_ch` を指定しています。

例えば、`day_ch` の値が `T` である場合を考えましょう。
このとき、ラベル `case 'T':` の場所に処理がジャンプし、
`printf("Tuesday or Thursday\n");` が実行されます。
続いて、`break;` があるので、switch 文を抜けます。

もし、`day_ch` の値が `t` であった場合には、
いずれの `case` にも当てはまらないので、
`default:` に処理がジャンプし、
`printf("invalid\n");` が実行され、続く `break;` により switch 文を抜けます。


プログラムの処理の流れをフローチャートに示すと次のようになります。

![flowchart](./assets/chap06_weekday.svg)


プログラムの実行結果を示します。
1 行目は入力された文字を表しています。

- `M` を入力した場合 :

``` : 端末
M
Monday
```

- `T` を入力した場合 :

``` : 端末
T
Tuesday or Thursday
```

- `t` を入力した場合 :

``` : 端末 
t
invalid
```

---

### 例題 6-6 : switch 文の fall-through

例題 6-5 のプログラムでは、
各曜日 Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday の
頭文字の大文字 `M`, `T`, `W`, `F`, `S` を入力すると
該当する曜日を表示してくれました。
次のプログラムは、各曜日の頭文字の小文字 `m`, `t`, `w`, `f`, `s` 
の入力にも対応できるよう拡張したものです。

```c : weekday2.c

#include <stdio.h>

int main(void) {
  char day_ch;

  scanf("%c", &day_ch);

  switch (day_ch) { // 制御式 day_ch の値によって分岐
    case 'M':  
    case 'm': 
      printf("Monday\n"); 
      break;  
    case 'T':   // day_ch の値が T のときはここに処理がジャンプ
    case 't':   // day_ch の値が t のときはここに処理がジャンプ
      printf("Tuesday or Thursday\n");  // day_ch の値が T または t のときに実行
      break;                            // switch 文を抜ける
    case 'W':
    case 'w':
      printf("Wednesday\n");
      break;
    case 'F':
    case 'f':
      printf("Friday\n");
      break;
    case 'S':
    case 's':
      printf("Saturday or Sunday\n");
      break;
    default:
      printf("invalid\n");
      break;
  }

  return 0;
}
```

このプログラム中の switch 文では、例題 6-6 と同様に
char 型の変数 `day_ch` を制御式として指定しています。

`day_ch` の値が `t` の場合には、処理が `case 't':` にジャンプするので、
`Tuesday or Thursday` と表示され、続く `break` により switch 文での処理は終了します。

もし、変数 `day_ch` の値が `T` である場合にはラベル `case 'T':` の場所に処理がジャンプします。
このラベル `case 'T':` の後には、命令が無く、特に `break` もありません。
したがって、処理は次の `case 't':` の場所に移ります。
ここには、`printf("Tuesday or Thursday\n");` という命令があるので、`Tuesday or Thursday` と表示されます。
続いて、`break` があるので、switch 文を抜けます。

このように、`case` の後に `break` がない場合では、処理は次の `case` に続きます。
このような動作を fall-through と呼びます。
fall-through を利用することで、同じ処理を複数の `case` に対して指定することができます。


このプログラムの処理の流れをフローチャートに示すと次のようになります。
![flowchart](./assets/chap06_weekday2.svg)


このプログラムの実行例を示します。
1 行目は、入力された文字を表しています。

- `t` を入力した場合 :
``` : 端末
t
Tuesday or Thursday
```

- `T` を入力した場合 :
``` : 端末
T
Tuesday or Thursday
```

大文字の `T` と小文字の `t` のどちらを入力した場合も、
`Tuesday or Thursday` と表示されているのがわかります。

---

## 演習

### 演習 6-1

M県S市のとある水族館は、入場者の年齢によって入場料が決まります。
年齢と入場料の対応は以下の表のとおりです。

| 券種 | 年齢 | 入場料(円) |
| --- | --- | --- |
| 大人 | 13歳以上65歳未満 | 2400 |
| 子供 | 13歳未満 | 1200 |
| シニア | 65歳以上 | 1800 |

年齢を入力すると、入場料を出力するプログラムを作成してください。
なお、年齢は0以上の整数で入力されるものとします。

プログラムの処理の流れをフローチャートを作成して検討し、
そのフローチャートに基づいてプログラムを作成してください。

期待される実行結果の例を示します。
1行目はプログラムへ入力する年齢を示しています。

- 13 歳の場合 : 大人料金
``` : 端末
13
2400 yen
```

- 10 歳の場合 : 子供料金
``` : 端末
10
1200 yen
```

- 65 歳の場合 : シニア料金
``` : 端末
65
1800 yen
```

---

### 演習 6-2

switch 文を使って、次のようなプログラムを作成しましょう。

プログラムを実行すると "Enter your order number: Coffee (0), Tea (1) or milk (2)" と表示し、
ユーザーからの入力を待ちます。入力は整数値です。
入力された値に応じて、次のように表示します。
- 0 の場合 : Coffee
- 1 の場合 : Tea
- 2 の場合 : Milk
- それ以外の場合 : Water


プログラムの処理の流れをフローチャートを作成して検討し、
そのフローチャートに基づいてプログラムを作成してください。

期待される実行結果の例を示します。
1 行目はプログラムからの出力で、2 行目はユーザーからの入力を示しています。
3 行目はプログラムからの出力です。

- 1 を入力した場合 : Tea と表示
``` : 端末
Enter your order number: Coffee (0), Tea (1) or milk (2)
1
Tea
```

 - 5 を入力した場合 : Water と表示
``` : 端末 
Enter your order number: Coffee (0), Tea (1) or milk (2)
5
Water
```


---

### 演習 6-3

次のプログラムを作成して、実行結果を確認してください。

```c : fizzbuzz.c
#include <stdio.h>

int main(void) {
  int max_count;

  printf("Enter the maximum count: ");
  scanf("%d", &max_count);
  
  for (int count = 1; count <= max_count; count++) {
    if ((count % 3 == 0) && (count % 5 == 0)) {
      printf("FizzBuzz\n");
    } else if (count % 3 == 0) {
      printf("Fizz\n");
    } else if (count % 5 == 0) {
      printf("Buzz\n");
    } else {
      printf("%d\n", count);
    }
  }

  return 0;
}
```

---
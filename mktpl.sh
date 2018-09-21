#!/bin/bash

#引数：$1 プロジェクトディレクトリ名
#引数：$2 プロジェクトディレクトリ作成パス(なければカレント)

# プロジェクトディレクトリ名が存在しない場合はexit
if [ "$1" = "" ]; then
  echo "プロジェクトディレクトリ名を第一引数に指定してください。"
  exit 0
fi

# 上書き防止プロジェクトディレクトリが存在したらexit
if [ -e $1 ]; then
  echo "$1 は既に存在します。"
  exit 0
fi

# パスの宣言があれば移動する
if [ "$2" != "" ]; then
  echo "$2 に移動します。"
  cd $2
fi

#HTMLプロジェクトディレクトリを作成する
mkdir $1
echo "$1を作成しました。"

cd $1
mkdir js
mkdir css


#HTMLテンプレート作成
cat << EOF > ./index.html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <title>$1</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  Hello World!
  <script src="js/main.js"></script>
</body>
</html>
EOF
echo "HTMLテンプレートを作成しました。"

#jsテンプレート作成
cat << EOF > ./js/main.js
(function(){
  'use strict';

})();

EOF
echo "jsテンプレートを作成しました。"

#cssテンプレート作成
cat <<EOF > ./css/styles.css
@charset 'utf-8';

EOF
echo "cssテンプレートを作成しました。"


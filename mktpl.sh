#!/bin/bash

#引数：$1 プロジェクトディレクトリ名
#引数：$2 プロジェクトディレクトリ作成パス(なければカレント)

# パスの宣言があれば移動する
if [ "$2" != "" ]; then
  cd $2
fi

#HTMLプロジェクトディレクトリを作成する
mkdir $1

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
  <script src="js/main.js"></script>
</body>
</html>
EOF

#jsテンプレート作成
cat << EOF > ./js/main.js
(function(){
  'use strict';

})();

EOF

#cssテンプレート作成
cat <<EOF > ./css/styles.css
@charset 'utf-8';

EOF

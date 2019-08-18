SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# SQLファイル作成
echo "create table T(C blob);
insert into T values(x'FF');" > create_0.sql

# バイナリデータを出力してみる
#   デフォルトOFFなのに出力される
sqlite3 :memory: \
".read create_0.sql" \
"select * from T;"

# バイナリをファイル出力してodコマンドで表示
sqlite3 :memory: \
".read create_0.sql" \
"select * from T;" > 0.bin
od -h 0.bin


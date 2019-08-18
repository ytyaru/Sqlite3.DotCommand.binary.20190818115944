SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# SQLファイル作成
echo "create table T(C blob);
insert into T values(x'FF');
insert into T values(randomblob(16));" > create_1.sql

# `.binary on`で`.dump`する
sqlite3 :memory: \
".binary on" \
".read create_1.sql" \
".dump"

# `.binary off`で`.dump`する
sqlite3 :memory: \
".binary off" \
".read create_1.sql" \
".dump"


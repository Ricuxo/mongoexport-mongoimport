### MONGOEXPORT
candidates=$(echo "show databases" | mongo -u <usuario> --host <hostname>:27017 --authenticationDatabase admin  -p <senha> | grep -Ev "^(MongoDB|connecting|admin|local|test|bye)" | awk '{print $1}')
for candidate in $candidates; do
    collections=`echo "show collections" | mongo -u <usuario> --host <hostname>:27017 --authenticationDatabase admin  -p <senha> $candidate --quiet`
    var=0
    for collection in $collections; do
        var=$((var + 1))
        mongoexport -u <usuario> --host <hostname>:27017 --authenticationDatabase admin  -p <senha> --db $candidate -c $collection --limit=100 --out json/$var"_"$candidate"_"$collection"_export.json"
    done
done

### MONGOIMPORT
for i in `ls json`;
do
    database=`echo $i | awk -F "__" '{print $2}'`
    collection=`echo $i | awk -F "__" '{print $3}'`
    echo -e "mongoimport -d $database -c $collection --file json/$i"
done

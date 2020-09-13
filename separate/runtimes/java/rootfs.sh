apk add bash openjdk8

cp /runtime/lib/*.jar /bin/
cp /runtime/lib/*.so /bin/

cp /runtime/workload.class /bin/workload.class
cp /runtime/workload.sh /bin/runtime-workload
chmod +x /bin/runtime-workload

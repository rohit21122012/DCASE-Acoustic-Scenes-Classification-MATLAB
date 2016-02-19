mkdir KNNHO
for i in  1 4 16 64 128 512 1024
do
	mkdir KNNHO/KNN$i
        echo "KNNClassify($i)" > KNNHO/KNN$i/in.txt
	nohup matlab2013 -nodesktop -singleCompThread < KNNHO/KNN$i/in.txt > KNNHO/KNN$i/out.txt 2> KNNHO/KNN$i/er.txt &
done

<<C1
mkdir KNN2
echo "KNNClassify(2)" > KNN2/in.txt
nohup matlab2013 -nodesktop -singleCompThread < KNN2/in.txt > KNN2/out.txt 2> KNN2/er.txt &

mkdir KNN4
echo "KNNClassify(4)" > KNN4/in.txt
nohup matlab2013 -nodesktop -singleCompThread < KNN4/in.txt > KNN4/out.txt 2> KNN4/er.txt &

mkdir KNN8
echo "KNNClassify(8)" > KNN8/in.txt
nohup matlab2013 -nodesktop -singleCompThread < KNN8/in.txt > KNN8/out.txt 2> KNN8/er.txt &

mkdir KNN16
echo "KNNClassify(16)" > KNN16/in.txt
nohup matlab2013 -nodesktop -singleCompThread < KNN16/in.txt > KNN16/out.txt 2> KNN16/er.txt &

mkdir KNN32
echo "KNNClassify(32)" > KNN32/in.txt
nohup matlab2013 -nodesktop -singleCompThread < KNN32/in.txt > KNN32/out.txt 2> KNN32/er.txt &

mkdir KNN64
echo "KNNClassify(64)" > KNN64/in.txt
nohup matlab2013 -nodesktop -singleCompThread < KNN64/in.txt > KNN64/out.txt 2> KNN64/er.txt &

mkdir KNN128
echo "KNNClassify(128)" > KNN128/in.txt
nohup matlab2013 -nodesktop -singleCompThread < KNN128/in.txt > KNN128/out.txt 2> KNN128/er.txt &
C1



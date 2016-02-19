mkdir SVMHO
for i in  0.01 0.1 1 128 1024
do
	mkdir SVMHO/SVM$i
        echo "SVMClassify($i)" > SVMHO/SVM$i/in.txt
	nohup matlab2013 -nodesktop -singleCompThread < SVMHO/SVM$i/in.txt > SVMHO/SVM$i/out.txt 2> SVMHO/SVM$i/er.txt &
done

<<C1
mkdir SVM2
echo "SVMClassify(2)" > SVM2/in.txt
nohup matlab2013 -nodesktop -singleCompThread < SVM2/in.txt > SVM2/out.txt 2> SVM2/er.txt &

mkdir SVM4
echo "SVMClassify(4)" > SVM4/in.txt
nohup matlab2013 -nodesktop -singleCompThread < SVM4/in.txt > SVM4/out.txt 2> SVM4/er.txt &

mkdir SVM8
echo "SVMClassify(8)" > SVM8/in.txt
nohup matlab2013 -nodesktop -singleCompThread < SVM8/in.txt > SVM8/out.txt 2> SVM8/er.txt &

mkdir SVM16
echo "SVMClassify(16)" > SVM16/in.txt
nohup matlab2013 -nodesktop -singleCompThread < SVM16/in.txt > SVM16/out.txt 2> SVM16/er.txt &

mkdir SVM32
echo "SVMClassify(32)" > SVM32/in.txt
nohup matlab2013 -nodesktop -singleCompThread < SVM32/in.txt > SVM32/out.txt 2> SVM32/er.txt &

mkdir SVM64
echo "SVMClassify(64)" > SVM64/in.txt
nohup matlab2013 -nodesktop -singleCompThread < SVM64/in.txt > SVM64/out.txt 2> SVM64/er.txt &

mkdir SVM128
echo "SVMClassify(128)" > SVM128/in.txt
nohup matlab2013 -nodesktop -singleCompThread < SVM128/in.txt > SVM128/out.txt 2> SVM128/er.txt &
C1



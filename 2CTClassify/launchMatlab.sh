mkdir CTHO
for i in  1 2 4 10 16
do
	mkdir CTHO/CT$i
        echo "CTClassify($i)" > CTHO/CT$i/in.txt
	nohup matlab2013 -nodesktop -singleCompThread < CTHO/CT$i/in.txt > CTHO/CT$i/out.txt 2> CTHO/CT$i/er.txt &
done

<<C1
mkdir CT2
echo "CTClassify(2)" > CT2/in.txt
nohup matlab2013 -nodesktop -singleCompThread < CT2/in.txt > CT2/out.txt 2> CT2/er.txt &

mkdir CT4
echo "CTClassify(4)" > CT4/in.txt
nohup matlab2013 -nodesktop -singleCompThread < CT4/in.txt > CT4/out.txt 2> CT4/er.txt &

mkdir CT8
echo "CTClassify(8)" > CT8/in.txt
nohup matlab2013 -nodesktop -singleCompThread < CT8/in.txt > CT8/out.txt 2> CT8/er.txt &

mkdir CT16
echo "CTClassify(16)" > CT16/in.txt
nohup matlab2013 -nodesktop -singleCompThread < CT16/in.txt > CT16/out.txt 2> CT16/er.txt &

mkdir CT32
echo "CTClassify(32)" > CT32/in.txt
nohup matlab2013 -nodesktop -singleCompThread < CT32/in.txt > CT32/out.txt 2> CT32/er.txt &

mkdir CT64
echo "CTClassify(64)" > CT64/in.txt
nohup matlab2013 -nodesktop -singleCompThread < CT64/in.txt > CT64/out.txt 2> CT64/er.txt &

mkdir CT128
echo "CTClassify(128)" > CT128/in.txt
nohup matlab2013 -nodesktop -singleCompThread < CT128/in.txt > CT128/out.txt 2> CT128/er.txt &
C1



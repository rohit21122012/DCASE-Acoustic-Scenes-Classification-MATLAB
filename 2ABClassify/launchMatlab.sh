mkdir ABHO
for i in  2 20 200 2000
do
	mkdir ABHO/AB$i
        echo "ABClassify($i)" > ABHO/AB$i/in.txt
	nohup matlab2013 -nodesktop -singleCompThread < ABHO/AB$i/in.txt > ABHO/AB$i/out.txt 2> ABHO/AB$i/er.txt &
done

<<C1
mkdir AB2
echo "ABClassify(2)" > AB2/in.txt
nohup matlab2013 -nodesktop -singleCompThread < AB2/in.txt > AB2/out.txt 2> AB2/er.txt &

mkdir AB4
echo "ABClassify(4)" > AB4/in.txt
nohup matlab2013 -nodesktop -singleCompThread < AB4/in.txt > AB4/out.txt 2> AB4/er.txt &

mkdir AB8
echo "ABClassify(8)" > AB8/in.txt
nohup matlab2013 -nodesktop -singleCompThread < AB8/in.txt > AB8/out.txt 2> AB8/er.txt &

mkdir AB16
echo "ABClassify(16)" > AB16/in.txt
nohup matlab2013 -nodesktop -singleCompThread < AB16/in.txt > AB16/out.txt 2> AB16/er.txt &

mkdir AB32
echo "ABClassify(32)" > AB32/in.txt
nohup matlab2013 -nodesktop -singleCompThread < AB32/in.txt > AB32/out.txt 2> AB32/er.txt &

mkdir AB64
echo "ABClassify(64)" > AB64/in.txt
nohup matlab2013 -nodesktop -singleCompThread < AB64/in.txt > AB64/out.txt 2> AB64/er.txt &

mkdir AB128
echo "ABClassify(128)" > AB128/in.txt
nohup matlab2013 -nodesktop -singleCompThread < AB128/in.txt > AB128/out.txt 2> AB128/er.txt &
C1



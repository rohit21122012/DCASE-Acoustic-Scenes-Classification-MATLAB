mkdir LDHO
for i in  'Linear' 'pseudoLinear' 'diagLinear' 'Quadratic' 'pseudoQuadratic' 'diagQuadratic'
do
	mkdir LDHO/LD$i
        echo "LDClassify('$i')" > LDHO/LD$i/in.txt
	nohup matlab2013 -nodesktop -singleCompThread < LDHO/LD$i/in.txt > LDHO/LD$i/out.txt 2> LDHO/LD$i/er.txt &
done

<<C1
mkdir LD2
echo "LDClassify(2)" > LD2/in.txt
nohup matlab2013 -nodesktop -singleCompThread < LD2/in.txt > LD2/out.txt 2> LD2/er.txt &

mkdir LD4
echo "LDClassify(4)" > LD4/in.txt
nohup matlab2013 -nodesktop -singleCompThread < LD4/in.txt > LD4/out.txt 2> LD4/er.txt &

mkdir LD8
echo "LDClassify(8)" > LD8/in.txt
nohup matlab2013 -nodesktop -singleCompThread < LD8/in.txt > LD8/out.txt 2> LD8/er.txt &

mkdir LD16
echo "LDClassify(16)" > LD16/in.txt
nohup matlab2013 -nodesktop -singleCompThread < LD16/in.txt > LD16/out.txt 2> LD16/er.txt &

mkdir LD32
echo "LDClassify(32)" > LD32/in.txt
nohup matlab2013 -nodesktop -singleCompThread < LD32/in.txt > LD32/out.txt 2> LD32/er.txt &

mkdir LD64
echo "LDClassify(64)" > LD64/in.txt
nohup matlab2013 -nodesktop -singleCompThread < LD64/in.txt > LD64/out.txt 2> LD64/er.txt &

mkdir LD128
eciho "LDClassify(128)" > LD128/in.txt
nohup matlab2013 -nodesktop -singleCompThread < LD128/in.txt > LD128/out.txt 2> LD128/er.txt &
C1



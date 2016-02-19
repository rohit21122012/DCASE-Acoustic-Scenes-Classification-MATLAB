mkdir GMM2
echo "GMMClassify(2)" > GMM2/in.txt
nohup matlab2013 -nodesktop -singleCompThread < GMM2/in.txt > GMM2/out.txt 2> GMM2/er.txt &

mkdir GMM4
echo "GMMClassify(4)" > GMM4/in.txt
nohup matlab2013 -nodesktop -singleCompThread < GMM4/in.txt > GMM4/out.txt 2> GMM4/er.txt &

mkdir GMM8
echo "GMMClassify(8)" > GMM8/in.txt
nohup matlab2013 -nodesktop -singleCompThread < GMM8/in.txt > GMM8/out.txt 2> GMM8/er.txt &

mkdir GMM16
echo "GMMClassify(16)" > GMM16/in.txt
nohup matlab2013 -nodesktop -singleCompThread < GMM16/in.txt > GMM16/out.txt 2> GMM16/er.txt &

mkdir GMM32
echo "GMMClassify(32)" > GMM32/in.txt
nohup matlab2013 -nodesktop -singleCompThread < GMM32/in.txt > GMM32/out.txt 2> GMM32/er.txt &

mkdir GMM64
echo "GMMClassify(64)" > GMM64/in.txt
nohup matlab2013 -nodesktop -singleCompThread < GMM64/in.txt > GMM64/out.txt 2> GMM64/er.txt &

mkdir GMM128
echo "GMMClassify(128)" > GMM128/in.txt
nohup matlab2013 -nodesktop -singleCompThread < GMM128/in.txt > GMM128/out.txt 2> GMM128/er.txt &


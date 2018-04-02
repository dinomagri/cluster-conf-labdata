from pyspark import SparkContext, SparkConf
from pyspark.sql import Row, SQLContext


if __name__ == "__main__":
    conf = SparkConf()
    conf.setAppName("MinhaAPP")
    sc = SparkContext(conf=conf)


    linhas = sc.textFile('hdfs://elephant:8020/user/labdata/pessoas.txt')

    cols = linhas.map(lambda linha: linha.split(';'))

    dados = cols.map(lambda coluna: Row(nome=str(coluna[0]), idade=int(coluna[1]), altura=float(coluna[2])))

    sqlContext = SQLContext(sc)
    
    df = sqlContext.createDataFrame(dados)

    df.registerTempTable("pessoas")

    pessoas = sqlContext.sql("SELECT nome FROM pessoas WHERE idade >= 20 AND idade <= 30")

    nomes = pessoas.collect()

    print("Imprimindo os nomes: ")
    for n in nomes:
    	print(n.nome)

    print("Existem {} pessoas que tem entre 20 e 30 anos".format(len(nomes)))


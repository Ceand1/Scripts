##################TESTE 1####################
#Autor: Antonio César
#Data: 29/05/2022
#Baixa arquivos de urls específicas e comprime todos em um arquivo zip


import zipfile
import urllib.request
import os


#variáveis que recebem as urls do pdfs dos anexos 1, 2, 3 e 4
url1 = "https://www.gov.br/ans/pt-br/arquivos/assuntos/consumidor/o-que-seu-plano-deve-cobrir/Anexo_I_Rol_2021RN_465.2021_RN473_RN478_RN480_RN513_RN536.pdf"
url2 = "https://www.gov.br/ans/pt-br/arquivos/assuntos/consumidor/o-que-seu-plano-deve-cobrir/Anexo_II_DUT_2021_RN_465.2021_tea.br_RN473_RN477_RN478_RN480_RN513_RN536.pdf"
url3 = "https://www.gov.br/ans/pt-br/arquivos/assuntos/consumidor/o-que-seu-plano-deve-cobrir/Anexo_III_DC_2021_RN_465.2021.v2.pdf"
url4 = "https://www.gov.br/ans/pt-br/arquivos/assuntos/consumidor/o-que-seu-plano-deve-cobrir/Anexo_IV_PROUT_2021_RN_465.2021.v2.pdf"

#função que zippa os arquivos 
def compress():

    #baixa os PDFs em testes/cacheTeste1
    file1 = urllib.request.urlretrieve(url=url1, filename="../cacheTeste1/anexo1.pdf")
    file2 = urllib.request.urlretrieve(url=url2, filename="../cacheTeste1/anexo2.pdf")
    file3 = urllib.request.urlretrieve(url=url3, filename="../cacheTeste1/anexo3.pdf")
    file4 = urllib.request.urlretrieve(url=url4, filename="../cacheTeste1/anexo4.pdf")

    #cria o arquivo anexos.zip, com permissão de escrita, em testes/cacheTeste1
    zp_fl = zipfile.ZipFile("../cacheTeste1/anexos.zip", "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9)

    #coloca os CSVs no arquivo zipado anexos.zip
    zp_fl.write(file1[0], arcname="anexo1.pdf")
    zp_fl.write(file2[0], arcname="anexo2.pdf")
    zp_fl.write(file3[0], arcname="anexo3.pdf")
    zp_fl.write(file4[0], arcname="anexo4.pdf")

    #remove os arquivos PDF de cacheTeste1
    os.remove("../cacheTeste1/anexo1.pdf")
    os.remove("../cacheTeste1/anexo2.pdf")
    os.remove("../cacheTeste1/anexo3.pdf")
    os.remove("../cacheTeste1/anexo4.pdf")

    #fecha o arquivo zipado
    zp_fl.close()

if __name__ == "__main__":

    compress()

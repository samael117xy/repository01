#!/bin/bash
#Josue Olmedo--08/01/2022

echo "***Instalador LibreOffice***"
#Esperar 5 seg.
echo "***..dentro de 5 seg se inicia el script, o cierra la terminal***"
sleep 5s

#Cambia a capeta Descargas
cd ~/Descargas

#Crea capeta de Trabajo
echo "***Crear carpeta de trabajo***"
read nomdir

if [ ! -d "$nomdir" ]
then
    echo "***Carpeta no existe. Carpeta Creada***"
    mkdir ./$nomdir
    echo "***Carpeta Creada***"
else
    echo "***Ya existe carpeta***"
fi

#Descarga LibreOffice
echo "***Versiona para descargar de LibreOffice x.x.x***"
read verlibof
sleep 3s
wget https://www.mirrorservice.org/sites/download.documentfoundation.org/tdf/libreoffice/stable/$verlibof/deb/x86_64/LibreOffice_${verlibof}_Linux_x86-64_deb.tar.gz -P ~/Descargas
sleep 3s
wget https://download.documentfoundation.org/libreoffice/stable/$verlibof/deb/x86_64/LibreOffice_${verlibof}_Linux_x86-64_deb_langpack_es.tar.gz -P ~/Descargas
sleep 3s
wget https://download.documentfoundation.org/libreoffice/stable/$verlibof/deb/x86_64/LibreOffice_${verlibof}_Linux_x86-64_deb_helppack_es.tar.gz -P ~/Descargas

#Mueve Archivos descargados al directorio de trabajo
mv ~/Descargas/LibreOffice_* ~/Descargas/$nomdir
cd ~/Descargas/$nomdir

#Desisntala Version Anterior
sudo apt-get remove --purge libreoffice* && sudo apt-get clean && sudo apt-get autoremove

#Descomprime *.tar
for x in *.tar.gz; do tar xfv $x; done

#Instala La Nueva Version
sudo dpkg -i LibreOffice_*/DEBS/*.deb

#Esperar 3 seg.
sleep 3s

#Borra Archivos descargados
rm -r LibreOffice_*

#Borrar carpeta de trabajo
cd ..
rmdir $nomdir

echo "***Instalacion terminada LibreOffice***"

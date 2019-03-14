#!/bin/bash
FONT_NAME="SourceCodePro"
URL="https://github.com/adobe-fonts/source-code-pro/archive/variable-fonts.zip"
FONT_NAME1="SourceSansPro"
URL1="https://github.com/adobe-fonts/source-sans-pro/archive/variable-fonts.zip"
FONT_NAME2="SourceSerifPro"
URL2="https://github.com/adobe-fonts/source-serif-pro/archive/variable-fonts.zip"
mkdir /tmp/adodefont
cd /tmp/adodefont

#wget ${URL} -O ${FONT_NAME}.zip
unzip -o -j ${FONT_NAME}.zip

#wget ${URL1} -O ${FONT_NAME1}.zip
unzip -o -j ${FONT_NAME1}.zip

#wget ${URL2} -O ${FONT_NAME2}.zip
unzip -o -j ${FONT_NAME2}.zip

mkdir -p ~/.fonts

cp *.otf ~/.fonts
fc-cache -f -v


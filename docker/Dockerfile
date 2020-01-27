#
# fiji with plugins
#

# Pull base fiji JDK 8 image
FROM fiji/fiji:fiji-openjdk-8

RUN ./entrypoint.sh --update add-update-site PTBIOP http://biop.epfl.ch/Fiji-Update
RUN ./entrypoint.sh --update update
COPY --chown=root:root plugins/BIOP_Operetta_Import.groovy /opt/fiji/Fiji.app/plugins/Scripts/Plugins/BIOP/Importers/BIOP_Operetta_Import.groovy
RUN curl https://c4scdn.ch/file/download/da6siowyzc5ipr2gkd5s/PHID-FILE-7im33k5443eymzoavkfn/groovy-swing-2.4.12.jar --output /opt/fiji/Fiji.app/jars/groovy-swing-2.4.12.jar

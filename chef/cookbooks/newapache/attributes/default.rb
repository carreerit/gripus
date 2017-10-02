default['newapache']['PACK_LIST']= ['httpd', 'httpd-devel', 'gcc']
default['newapache']['SERV_NAME']= 'httpd'
default['newapache']['MODJK']['URL']='http://redrockdigimark.com/apachemirror/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.42-src.tar.gz'
TARFILE_URL=default['newapache']['MODJK']['URL']

TARFILE=TARFILE_URL.split('/')
default['newapache']['MODJK']['DOWN_LOC']='/opt'
default['newapache']['MODJK']['TAR_FILE']=TARFILE.last
default['newapache']['MODJK']['TAR_DIR']=TARFILE.last.chomp(".tar.gz")
default['newapache']['IPADDR'] = '10.128.100.12'
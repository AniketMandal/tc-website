CP=../../resources:../../build/classes:$CLASSPATH:../../lib/jars/log4j-1.2.7.jar:../../lib/jars/log4j-boot.jar:../../lib/jars/ifxjdbc.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.shared.util.sql.BlobFixUtility -xmlfile blobFix.xml $@ > ./nohup.out 2>&1 &
tail -f nohup.out

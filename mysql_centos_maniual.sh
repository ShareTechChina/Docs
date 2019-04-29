# Specification: https://dev.mysql.com/doc/refman/5.5/en/binary-installation.html

# 1. Download mysql install zip.
wget https://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-5.5.59-linux-glibc2.12-x86_64.tar.gz

# 2. Add mysql group and user.
groupadd mysql
useradd -r -g mysql -s /bin/false mysql

# 3. Unzip mysql installation zip.
cd /usr/local
tar -zxyf ~/mysql-5.5.59-linux-glibc2.12-X86_64.tar.gz
ln -s mysql-5.5.59-linux-glibc2.12-X86_64 mysql

# 4. Copy global launch configuration into /etc directory.
cp support-files/my-medium.cnf /etc/my.cnf

# 5. update /etc/my.cnf file.
# [client]下添加：
#    default-character-set=utf8
# [mysqld]下添加：
#    character-set-server=utf8
#    lower_case_table_names=1
# [mysql]下添加：
#    default-character-set=utf8

# 6. Initialize data directory.
cd mysql
sudo chown -R mysql:mysql .
scripts/mysql_install_db --user=mysql

# 7. Change current folder owner as the root user.
sudo chown -R root:root .

# 8. change data directory owner as mysql in mysql group.
sudo chown -R mysql:mysql data

# 9. start mysql server
sudo /usr/local/mysql/support-files/mysql.server start
# 9.1 or, you can start mysql server like this:
# bin/mysqld_safe --user=mysql &

# 10, mysql start with system boot
cp support-files/mysql.server /etc/init.d/mysql.server

# 11. Test if server starts success
ps -ef | grep mysql

# 12. Update admin password
./bin/mysqladmin -u root password 'new-password'

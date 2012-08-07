#!/bin/sh

#Requirement
#export PATH=/Users/jeanfei/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin

#todo : check if /usr/local/bin folder exists

# init path variables
bin_path="/usr/local/bin"
php52="/Applications/MAMP/bin/php/php5.2.17/bin"
php53="/Applications/MAMP/bin/php/php5.3.6/bin"
mysql_bin="/Applications/MAMP/Library/bin"


# check php5.2 bin path
if [ ! -d $php52 ] ; then
    echo "Your path $php52 is not valid, please check the path"
    exit 1;
fi

# check php5.3 bin path
if [ ! -d $php53 ] ; then
    echo "Your path $php53 is not valid, please check the path"
    exit 2;
fi

php=$php53

# re-create symlink for each bin founded in php5.2 or 5.3 bin folder
for path_to_bin in `find $php -type f -maxdepth 1`
do
  bin=`basename $path_to_bin`
  echo "Creating symlink $bin_path/$bin to $php/$bin"
  ln -fs $php/$bin $bin_path/$bin
done


ln -fs $mysql_bin/mysql $bin_path/mysql
ln -fs $mysql_bin/mysqldump $bin_path/mysqldump

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
cd $DIR/public
# function lnfile (file) {
# 	ln -s ../ixhan.com.wp/$file $file
# }

ln -s ../ixhan.com.wp/app app
ln -s ../ixhan.com.wp/wp-content wp-content
# lnfile(app)
# lnfile(wp-content)

echo "ErrorDocument 404 /404.html" > .htaccess

rake deploy
由于定制iso时，许多文件都比较大，这里都删掉了，如果需要重新定制ISO，需要将centos dvd中相应的文件拷贝回来。
需要拷贝回来的文件有：
1，isolinux/initrd.img
2. isolinux/vmlinuz
3. Packages中需要使用的安装包，可以使用shell/cp_packages.sh脚本重新拷贝
4. images目录
5. repodata目录

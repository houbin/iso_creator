## centos iso定制

## centos version supported
- centos 6.*
- centos 7

## steps
1. 挂载对应版本的Centos DVD ISO到/mnt/cdrom，所有文件都从该目录拷贝
2. 若DVD ISO中没有需要的rpm包，将需要的包拷贝到/tmp/my_rpms，该目录中的包会自动拷贝
3. 修改shell/ks.cfg文件，将所需要的rpm名称放到packages段的末尾
4. 执行shell/rebuild_iso.sh, 则会在iso_create的上层目录生成定制的ISO


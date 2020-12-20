function generateUplaodCommand(){
    local_dir=$1
    remote_dir=$2
    echo "put -r ${local_dir} ${remote_dir}" > /tmp/upload.batch
}
function uploadDir() {
    local_dir=$1
    remote_dir=$2
    generateUplaodCommand ${local_dir} ${remote_dir}
    sftp -b /tmp/upload.batch -o StrictHostKeyChecking=no ftpserver
}

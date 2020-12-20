function generateUplaodCommand(){
    local_dir=$1
    remote_dir=$2
    echo "put -r ${local_dir} ${remote_dir}" > /tmp/upload.batch
}

function generateDownloadCommand(){
    local_dir=$1
    remote_dir=$2
    echo "get -r ${remote_dir} ${local_dir}" > /tmp/download.batch
}
function uploadDir() {
    local_dir=$1
    remote_dir=$2
    generateUplaodCommand ${local_dir} ${remote_dir}
    sftp -b /tmp/upload.batch -o StrictHostKeyChecking=no ftpserver
}

function downloadDir() {
    local_dir=$1
    remote_dir=$2
    generateDownloadCommand ${local_dir} ${remote_dir}
    sftp -b /tmp/download.batch -o StrictHostKeyChecking=no ftpserver
}
function tunnel_lab {
    if [ -z "$1" ]; then
        echo "Usage: tunnel_lab <url>"
        return 1
    fi
    url_port="$1"
    # Extracting URL and port number from the parameter
    new_url=$(echo $url_port | cut -d':' -f2 | cut -d'/' -f3)
    port=$(echo $url_port | cut -d':' -f3 | cut -d'/' -f1)
    echo ssh -N -f -L 8888:${new_url}:${port} xxxxx@midway3.rcc.uchicago.edu
    ssh -N -f -L 8888:${new_url}:${port} xxxxx@midway3.rcc.uchicago.edu
}

install() {
    echo "Starting WordPress Application + Monitoring"
    helm install wordpress wp-assignment/ -n my-sample-namespace
    helm install prometheus monitoring-release/prometheus -n monitoring 
    helm install grafana monitoring-release/grafana -n monitoring 
}

uninstall() {
    echo "Uninstalling WordPress Application + Monitoring"
    helm uninstall wordpress -n my-sample-namespace
    helm uninstall prometheus -n monitoring 
    helm uninstall grafana -n monitoring 
}


if [ "$1" == "install" ]; then
    install
elif [ "$1" == "uninstall" ]; then
    uninstall
else
    echo "Invalid argument! Usage: ./scripts.sh [install|uninstall]"
    exit 1
fi

exit 0
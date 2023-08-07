#!/bin/sh
CHART_DIR="./charts"
RELEASES_DIR="./releases"
GITHUB_ROOT="https://github.com/acidbotmaker/kfirfer-helm.git"

echo "Clearing old builds"
rm -rf $RELEASES_DIR/*.tgz

echo "Testing charts"
ls $CHART_DIR | xargs -I {} helm lint $CHART_DIR/{}

echo "Generating packages"
ls $CHART_DIR | xargs -I {} helm package -d $RELEASES_DIR $CHART_DIR/{}

echo "Generating index files"
helm repo index --url $GITHUB_ROOT .
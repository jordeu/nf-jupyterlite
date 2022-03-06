
process jupyterlite {
  publishDir "${params.outdir}", mode: 'copy'

  output:
    path("_output/*")

  script:
    '''
    # Install jupyterlite
    pip install jupyterlite
    pip install jupyterlite[contents]

    # Download a demo notebook
    curl -o demo.ipynb https://raw.githubusercontent.com/jakevdp/PythonDataScienceHandbook/master/notebooks/04.00-Introduction-To-Matplotlib.ipynb

    # Build all static resources
    jupyter-lite init
    jupyter-lite build --contents=./demo.ipynb

    # Fix error with using query parameters at index.html
    sed -i 's#index.html)#index.html|\\\\/index.html?.*)?$/, '/');#g' ./_output/config-utils.js
    '''
}


process jupyterlite {
  publishDir "${params.outdir}", mode: 'copy'

  output:
    path("_output/*")

  script:
    """
    # Install jupyterlite
    pip install jupyterlite
    pip install jupyterlite[contents]

    # Download a demo notebook
    curl -o demo.ipynb https://raw.githubusercontent.com/jakevdp/PythonDataScienceHandbook/master/notebooks/04.00-Introduction-To-Matplotlib.ipynb

    # Build all static resources
    jupyter-lite init
    jupyter-lite build --contents=./demo.ipynb
    """
}

let
  jupyter = import (builtins.fetchGit {
    url = https://github.com/tweag/jupyterWith;
    rev = "6021b5d6005e75b0718f1dee52b1ecdb0e9f14d2";
  }) {};

  iPython = jupyter.kernels.iPythonWith {
    name = "python";
    packages = p: with p; [ 
      numpy 
      matplotlib 
      pandas 
      ipympl
    ];
  };

  jupyterEnvironment =
    jupyter.jupyterlabWith {
      kernels = [ iPython ];
      # directory which contains extension
      # making a mutable folder is not elegant here
      directory = /home/bear5/jupyterlab;
    };
in
  jupyterEnvironment.env

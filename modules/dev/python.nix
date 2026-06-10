{ config, pkgs, lib, ...}:
with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    # utils
    tqdm

    # data science 
    pandas
    openpyxl # read write excel 
    numpy
    scipy
    matplotlib
    plotly
    dash
    #sklearn-deap
    seaborn

    ultralytics

    # dl
    torchvision
    opencv4
    
    # optimization
    cvxpy

    # dev
    yapf
  ]; 
  python-with-my-packages = python312.withPackages my-python-packages;
in {
  environment.systemPackages = with pkgs; [
    python-with-my-packages
  ];
}


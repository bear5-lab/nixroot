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
    matplotlib
    plotly
    dash
    #sklearn-deap
    seaborn

    # ml
    pytorch
    torchvision
    
    # optimization
    cvxpy

    # cv
    opencv4

    # dev
    yapf
  ]; 
  python-with-my-packages = python310.withPackages my-python-packages;
in {
  environment.systemPackages = with pkgs; [
    python-with-my-packages
  ];
}


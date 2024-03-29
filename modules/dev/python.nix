{ config, pkgs, lib, ...}:
with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    # utils
    tqdm

    # data science 
    pandas
    openpyxl
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
    imageio

    # dev
    yapf
  ]; 
  python-with-my-packages = python3Full.withPackages my-python-packages;
in {
  environment.systemPackages = with pkgs; [
    python-with-my-packages
  ];
}


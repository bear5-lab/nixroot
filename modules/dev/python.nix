{ config, pkgs, lib, ...}:
with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    # data science 
    pandas
    numpy
    jupyterlab
    matplotlib
    plotly
    dash
    sklearn-deap

    # cv
    opencv4
    imageio

    # dev
    yapf
  ]; 
  python-with-my-packages = python38.withPackages my-python-packages;
in {
  environment.systemPackages = with pkgs; [
    python-with-my-packages
  ];
}


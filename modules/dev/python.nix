{ config, pkgs, lib, ...}:
with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    pandas
    numpy
    jupyterlab
    matplotlib
    plotly
    dash
    sklearn-deap
  ]; 
  python-with-my-packages = python38.withPackages my-python-packages;
in {
  environment.systemPackages = with pkgs; [
    python-with-my-packages
  ];
}


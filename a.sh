#!/usr/bin/env bash

for file in ~/dotfiles/dot_config/*;
do
    source_path="$file"
    prog_name=$(basename "$source_path")

    dest_path="$HOME/.config/"

    echo "Linking $source_path -> $dest_path$prog_name"
    ln -s "$source_path" "$dest_path"
done

echo "Linking $HOME/dotfiles/bin -> $HOME/bin"
ln -s "$HOME/dotfiles/bin" "$HOME/bin"

echo "Linking $HOME/dotfiles/zsh -> $HOME/.zsh"
ln -s "$HOME/dotfiles/zsh" "$HOME/.zsh"

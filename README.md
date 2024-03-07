# Dotfiles

## Instructions

**Cloning the repository**

```sh
git clone git@github.com:alfonsfoubert/dotfiles.git
```

**Install the software**

```sh
cd dotfiles
xargs brew install < leaves.txt
```

**Install and test the task and time apps**

```sh
cp ~/.config/task/hooks/on-modify.timewarrior ~/.task/hooks/
chmod +x ~/.task/hooks/on-modify.timewarrior
task diagnostics
```

**Link files with stow**

```sh
stow .
```

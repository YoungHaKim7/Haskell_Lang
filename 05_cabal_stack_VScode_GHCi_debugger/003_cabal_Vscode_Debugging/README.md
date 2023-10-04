# cabal 디버깅 성공 ( 단서 )

https://github.com/phoityne/hdx4vsc/issues/32

https://marketplace.visualstudio.com/items?itemName=phoityne.phoityne-vscode&ssr=false

https://github.com/phoityne/hdx4vsc


- launch.json

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "ghc",
            "request": "launch",
            "name": "haskell(stack)",
            "internalConsoleOptions": "openOnSessionStart",
            "workspace": "${workspaceFolder}",
            "startup": "${workspaceFolder}/test/Spec.hs",
            "startupFunc": "",
            "startupArgs": "",
            "stopOnEntry": false,
            "mainArgs": "",
            "ghciPrompt": "H>>= ",
            "ghciInitialPrompt": "> ",
            "ghciCmd": "stack ghci --with-ghc=ghci-dap --test --no-load --no-build --main-is TARGET",
            "ghciEnv": {},
            "logFile": "${workspaceFolder}/.vscode/phoityne.log",
            "logLevel": "WARNING",
            "forceInspect": false
        },
        {
            "type": "ghc",
            "request": "launch",
            "name": "haskell(cabal)",
            "internalConsoleOptions": "openOnSessionStart",
            "workspace": "${workspaceFolder}",
            "startup": "${workspaceFolder}/app/Main.hs",
            "startupFunc": "",
            "startupArgs": "",
            "stopOnEntry": false,
            "mainArgs": "",
            "ghciPrompt": "H>>= ",
            "ghciInitialPrompt": "> ",
            "ghciCmd": "cabal repl -w ghci-dap --builddir=${workspaceFolder}/.vscode/dist-cabal-repl",
            "ghciEnv": {},
            "logFile": "${workspaceFolder}/.vscode/phoityne.log",
            "logLevel": "WARNING",
            "forceInspect": false
        }
    ]
}

```


- tasks.json

```json
{
  // Automatically created by phoityne-vscode extension.

  "version": "2.0.0",
  "presentation": {
    "reveal": "always",
    "panel": "new"
  },
  "tasks": [
    {
      // F7
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "label": "haskell build",
      "type": "shell",
      //"command": "cabal configure && cabal build"
      "command": "stack build"
    },
    {
      // F6
      "group": "build",
      "type": "shell",
      "label": "haskell clean & build",
      //"command": "cabal clean && cabal configure && cabal build"
      "command": "stack clean && stack build"
      //"command": "stack clean ; stack build"  // for powershell
    },
    {
      // F8
      "group": {
        "kind": "test",
        "isDefault": true
      },
      "type": "shell",
      "label": "haskell test",
      //"command": "cabal test"
      "command": "stack test"
    },
    {
      // F6
      "isBackground": true,
      "type": "shell",
      "label": "haskell watch",
      "command": "stack build --test --no-run-tests --file-watch"
    }
  ]
}
```
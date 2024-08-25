darklua process --config .darkluabundle.json src/Client/init.client.luau dist/Bundled/Main.client.luau
darklua process --config .darkluabundle.json src/Server/init.server.luau dist/Bundled/Main.server.luau
rojo serve bundle.project.json
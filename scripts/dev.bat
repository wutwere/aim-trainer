rmdir /s /q dist
darklua process --config .darklua.json src/ dist/
@start /b cmd /c darklua process --config .darklua.json --watch src/ dist/
@start /b cmd /c rojo serve build.project.json
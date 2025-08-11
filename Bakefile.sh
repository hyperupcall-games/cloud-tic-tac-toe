# shellcheck shell=bash

task.build-release() {
	mkdir -p './Build/Release/Website'
	godot --export-release 'Linux' './Build/Release/Tic Tac Toe'
	godot --export-release 'Windows' './Build/Release/Tic Tac Toe.exe'
	godot --export-release 'Web' './Build/Release/website/index.html'
}

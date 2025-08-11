# shellcheck shell=bash

task.build-release() {
	mkdir -p './Build/Release/website'
	godot --headless --export-release 'Linux' './Build/Release/Tic Tac Toe'
	godot --headless --export-release 'Windows' './Build/Release/Tic Tac Toe.exe'
	godot --headless --export-release 'Web' './Build/Release/website/index.html'
	tree ./Build
}

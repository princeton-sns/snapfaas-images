mkfile_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all: output.ext2

node_modules: package.json workload
	mkdir -p node_modules
	echo "apk add nodejs npm; npm install" | docker run -i --rm -v $(mkfile_path):/app -w /app alpine:3.10

tesseract: compile_tesseract.sh
	echo "/srv/compile_tesseract.sh" | docker run -i --rm -v $(mkfile_path):/srv -w /tmp alpine:3.10

test:
	echo "apk add nodejs; node -e 'const app = require(\"./workload\"); app.handle({\"img\": \"pitontable.png\"}, console.log);'" | docker run -i --rm -v $(mkfile_path):/srv -w /srv alpine:3.10

output.ext2: node_modules tesseract
	rm -rf output.ext2 /tmp/lorem.out/
	mkdir -p /tmp/lorem.out/
	touch output.ext2
	truncate -s 200M output.ext2
	mkfs.ext2 output.ext2
	sudo mount output.ext2 /tmp/lorem.out/
	sudo cp -r tesseract node_modules workload linuxboot.png pitontable.png /tmp/lorem.out/
	sudo umount /tmp/lorem.out/

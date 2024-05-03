clean:
	rm -f tmp/pids/server.pid

run:
	lsof -i :3000 | awk 'NR!=1 {print $$2}' | xargs -r kill -9
	rails s

help:
	@echo "Available targets:"
	@echo "  run        : Start the server"
	@echo "  clean      : Clean up generated files"

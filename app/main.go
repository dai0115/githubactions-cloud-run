package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, World2!")
}

func main() {
	http.HandleFunc("/", handler)

	port := "8080" // Cloud Run ではデフォルトでポート8080が利用されます
	log.Printf("Starting server on port %s", port)
	if err := http.ListenAndServe(":"+port, nil); err != nil {
		log.Fatal(err)
	}
}

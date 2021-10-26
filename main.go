package main

import (
	"log"
	"net/http"
)

func main() {
	http.Handle("/", http.RedirectHandler("/hello", http.StatusMovedPermanently))
	http.HandleFunc("/hello", func(writer http.ResponseWriter, request *http.Request) {
		_, _ = writer.Write([]byte("world"))
	})
	http.HandleFunc("/health", func(writer http.ResponseWriter, request *http.Request) {
		_, _ = writer.Write([]byte("ok"))
	})
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalln(err)
	}
}

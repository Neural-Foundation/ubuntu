package main

import (
	"fmt"
	"time"
)

func main() {
	go func() {
		c := time.Tick(1 * time.Second)
		for range c {
			fmt.Println("tick")
		}
	}()
	go func() {
		c := time.Tick(1 * time.Second)
		for t := range c {
			fmt.Println(t)
		}
	}()
	time.Sleep(5 * time.Second)
}

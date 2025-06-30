package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"paytm-backend/paytm"
)

func main() {
	// Load .env file
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	r := gin.Default()

	// Route to handle Paytm transaction token generation
	r.POST("/generate_txn_token", paytm.GenerateTxnToken)

	r.Run() // Runs on port 8080 by default
}
package paytm

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/go-resty/resty/v2"
)

var (
	mid         = os.Getenv("PAYTM_MID")
	merchantKey = os.Getenv("PAYTM_KEY")
)

func GenerateTxnToken(c *gin.Context) {
	var body struct {
		OrderID    string `json:"orderId"`
		Amount     string `json:"amount"`
		CustomerID string `json:"customerId"`
	}

	if err := c.BindJSON(&body); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid input"})
		return
	}

	payload := map[string]interface{}{
		"mid":    mid,
		"orderId": body.OrderID,
		"amount":  body.Amount,
		"custId":  body.CustomerID,
	}

	client := resty.New()
	resp, err := client.R().
		SetHeader("Content-Type", "application/json").
		SetBody(payload).
		Post(fmt.Sprintf("https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid=%s&orderId=%s", mid, body.OrderID))

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to call Paytm API"})
		return
	}

	c.Data(resp.StatusCode(), "application/json", resp.Body())
}

# REST API-Integrated NLP Models

A high-performance REST API integrating Natural Language Processing (NLP) models for text analysis and generation. Built using FastAPI and Hugging Face Transformers, this project demonstrates AI/ML integration with scalable backend development.

## Features

- **Sentiment Analysis:** Analyze text sentiment using pre-trained BERT models.
- **Text Generation:** Generate human-like text using GPT models.
- **REST API:** Lightweight, high-performance API with FastAPI.
- **Containerized Deployment:** Docker and Kubernetes support for scalable deployment.

## Tech Stack

- **Programming Language:** Python 3.x
- **API Framework:** FastAPI
- **NLP Models:** Hugging Face Transformers (BERT, GPT)
- **Containerization:** Docker
- **Orchestration:** Kubernetes
- **Deployment:** Uvicorn (ASGI server)

## Getting Started

### Prerequisites

- Python 3.9+
- Docker (optional for containerized deployment)
- Git

### Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/DerekW00/nlp-api-project.git
   cd nlp-api-project
   ```

2. **Set Up Virtual Environment:**

   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install Dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

4. **Run the API Locally:**

   ```bash
   uvicorn app.main:app --reload
   ```

   Access the API at [http://127.0.0.1:8000](http://127.0.0.1:8000)  
   Explore API documentation at [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

### Docker Deployment

1. **Build the Docker Image:**

   ```bash
   docker build -t nlp-api .
   ```

2. **Run the Docker Container:**

   ```bash
   docker run -p 80:80 nlp-api
   ```

### Kubernetes Deployment

1. **Deploy to Kubernetes:**

   ```bash
   kubectl apply -f k8s/deployment.yaml
   kubectl apply -f k8s/service.yaml
   ```

2. **Access the API via Kubernetes Service:**
   
   For **minikube** users:
   ```bash
   minikube service nlp-api-service
   ```

## API Endpoints

### **POST** `/analyze`
Analyze the sentiment of a given text.

- **Request:**
  ```json
  {
    "text": "I love using FastAPI for building APIs!"
  }
  ```
- **Response:**
  ```json
  {
    "results": [
      {
        "label": "POSITIVE",
        "score": 0.99
      }
    ]
  }
  ```

### **POST** `/generate`
Generate text based on a prompt.

- **Request:**
  ```json
  {
    "prompt": "Once upon a time"
  }
  ```
- **Response:**
  ```json
  {
    "generated_text": "Once upon a time, there was a developer who built amazing APIs."
  }
  ```

## Project Structure

```
nlp-api-project/
├── app/
│   ├── __init__.py
│   └── main.py
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── requirements.txt
├── Dockerfile
└── README.md
```

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request for any improvements or bug fixes.

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature-name`.
3. Commit your changes: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin feature/your-feature-name`.
5. Open a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

**Derek Derui Wang**  
[GitHub](https://github.com/DerekW00) | [LinkedIn](https://linkedin.com/in/derekderuiwang)

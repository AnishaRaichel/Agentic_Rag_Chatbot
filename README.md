# Agentic_Rag_Chatbot

A modular Agentic Retrieval-Augmented Generation (RAG) system built using CrewAI, FastAPI, Streamlit, Groq, LlamaIndex, and ChromaDB.

AstraRAG enables grounded, document-aware conversational AI with structured outputs and transparent reasoning.

---

## 🧠 Tech Stack

- **CrewAI** – Agent orchestration  
- **FastAPI** – Backend API  
- **Streamlit** – Frontend UI  
- **Groq (LLaMA 3.3 70B)** – LLM inference  
- **LlamaIndex** – RAG pipeline  
- **ChromaDB** – Vector database  
- **HuggingFace Embeddings** – Text embeddings  
- **Docker** – Containerization  

---

## 🏗️ Architecture Flow

1. User sends query via Streamlit UI  
2. FastAPI receives chat history  
3. CrewAI agent executes RAG task  
4. Retrieval tool queries ChromaDB  
5. Groq LLM generates grounded response  
6. Structured JSON response returned:
   - `answer`
   - `sources`
   - `tool_used`
   - `rationale`

---

## 📂 Project Structure

```
Agentic_Rag_Chatbot/
│
├── agents_src/
│   ├── agents/
│   ├── tasks/
│   ├── tools/
│   └── llm/
│
├── backend_src/
│   ├── api/
│   └── services/
│
├── frontend_src/
├── rag_doc_ingestion/
├── doc_vector_store/
├── docs_dir/
│
├── Dockerfile
├── requirements.txt
└── start.sh
```

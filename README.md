# **🎮 Disciplina**  
A practical and engaging way to track personal growth using **Maslow's hierarchy of needs**.

---

## 🚀 **Features**  
✅ Track progress across different **levels of personal growth**  
✅ Mark checkpoints as **complete**  
✅ View structured **progress insights**  
✅ Fully **self-hosted**—simple setup, no complex configurations  

---

## 🛠 **How to Get Started**  

### 1️⃣ **Clone & Run**  
```bash
git clone https://github.com/petrusjohannesmaas/disciplina.git
cd disciplina
docker-compose up -d
```
Then, open **`http://localhost:3000`** in your browser to start tracking your progress.  

---

## 📦 **Dockerized Setup (Behind the Scenes)**  
Everything is handled inside a **Docker container** with **SQLite for data storage**.

### **Docker Compose Configuration (`docker-compose.yml`)**  
```yaml
version: '3'
services:
  disciplina:
    build: .
    container_name: disciplina_container
    ports:
      - "3000:3000"
    volumes:
      - ./database:/app/database  # Persist user progress
    restart: unless-stopped
```
This ensures **all progress is saved**, even when restarting the container.

---

## 🏗 **Database Schema (`SQLite`)**  
Each **checkpoint** is stored as an entry inside a structured database.

### **Checkpoints Table Schema**
```sql
CREATE TABLE checkpoints (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    level TEXT NOT NULL,
    title TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'incomplete'
);
```

### **Insert Sample Data**
```sql
INSERT INTO checkpoints (level, title, status) VALUES 
('Physiological Needs', 'Find source of food and water', 'incomplete'),
('Safety Needs', 'Learn self-defense techniques', 'incomplete'),
('Love & Belonging Needs', 'Organize social gatherings', 'incomplete');
```

---

## 📊 **How It Works**  
- **Progress tracking** is handled via simple database queries.  
- **Checkpoint completion** updates the database dynamically.  
- **Visualization** (charts, progress bars) provides insights into growth.  

### **Mark Checkpoints as Complete**
```javascript
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('./database.sqlite');

function completeCheckpoint(id) {
    db.run(`UPDATE checkpoints SET status = 'complete' WHERE id = ?`, [id]);
}
```

### **Fetch Completed Checkpoints**
```javascript
db.all("SELECT * FROM checkpoints WHERE status = 'complete'", [], (err, rows) => {
    console.log(rows);  // Use this data for progress tracking
});
```

---

## 🎯 **Future Improvements**  
🔹 Advanced AI insights into personal growth  
🔹 Custom goal-setting features  
🔹 Weekly reflection prompts for better self-awareness  

---

## 📜 **License**  
GNU General Public License v3.0  
See [LICENSE](./LICENSE)  

---

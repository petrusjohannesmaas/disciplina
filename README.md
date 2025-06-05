# disciplina
A practical and engaging way to track personal growth using Maslow's hierarchy of needs.

This is an exciting project! Disciplina sounds like a practical and engaging way to track personal growth using Maslow's hierarchy of needs. Since you want to build it using **HTML, JavaScript, and PocketBase**, here's a structured approach to achieve your vision.

### 1. **Project Structure**
Your app needs:
- A **frontend** built with HTML, CSS, and JavaScript.
- A **backend** powered by **PocketBase** for user authentication, checkpoint tracking, and data storage.

### 2. **Setting Up PocketBase**
1. Download and set up [PocketBase](https://pocketbase.io/).
2. Run PocketBase locally and define a **collection** for users and checkpoints:
   - Users can have attributes like `name`, `email`, and `progress`.
   - Checkpoints can have fields like `level`, `title`, `status` (`complete` or `incomplete`).

3. Expose API endpoints so the frontend can **read and update** checkpoint statuses.

### 3. **Building the Frontend**
1. Create an **index.html** file with sections for each level.
2. Implement a **progress tracker** in the top-right corner using JavaScript.
3. Use **fetch()** to get and update checkpoint statuses via PocketBase.

**Example Code Snippet (Fetching Checkpoints from PocketBase):**
```javascript
async function fetchCheckpoints() {
    const response = await fetch("http://localhost:8090/api/collections/checkpoints/records");
    const data = await response.json();
    console.log(data);
}
fetchCheckpoints();
```

### 4. **Marking Checkpoints as Complete**
Each checkpoint should have a **button** to mark it as complete. When clicked, it should update PocketBase and refresh the tracker.

```javascript
async function markCheckpointComplete(id) {
    await fetch(`http://localhost:8090/api/collections/checkpoints/records/${id}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status: "complete" })
    });
    updateProgressTracker();
}
```

### 5. **Building the Progress Tracker**
- Count **completed checkpoints** and display them in the top-right corner.
- Use a **progress bar or percentage tracker** for visualization.

```javascript
function updateProgressTracker() {
    let completed = document.querySelectorAll(".checkpoint.complete").length;
    document.getElementById("progress-tracker").innerText = `Completed: ${completed}`;
}
```

### 6. **Enhancements**
- Store progress **per user**.
- Use **localStorage** to cache progress if offline.
- Add **animations** when checkpoints are completed.

### Future enhancements:

- Add a Vision section
- Add core goals and dreams
- Add actionable steps and timelines using AI

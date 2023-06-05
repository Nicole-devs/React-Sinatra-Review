import { useEffect, useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [students,setStudents] = useState([])
  const [refresh,setRefresh] = useState([])
  const [name,setName] = useState("")
  const [age,setAge] = useState(0)
  useEffect(() => {
    fetch("http://localhost:9292/students")
    .then(res => res.json())
    .then(data => {
      setStudents(data)
    })
  },[])
  function handleDelete(id) {
        fetch(`http://localhost:9292/students/${id}`,{
          method: "DELETE",
          headers: {
            "Content-Type": "application/json"
          }
        })
        .then(data => {
          let rem = students.filter(stud => stud.id !== id)
          setStudents(rem)
        })


  }
  function handleSubmit(e,id) {
    e.preventDefault()
    const formData = {
      name: name,
      age: age
    }
    fetch(`http://localhost:9292/students/${id}`,{
      method: "PUT",
      headers: {
        "Content-Type" : "application/json"
      },
      body: JSON.stringify(formData)
    })
    .then(res => res.json())
    .then((data) => {
      let updated = students.filter(stud => stud.id === id)
      setRefresh(updated)
    })

  }
  
  return (
    <>
    <h1>Student List</h1>
    <ul>
      {students.map(student => (
        <div key={student.id}>
        <li key={student.id}>{student.name}  {student.age}</li>
        <form onSubmit={(e) => handleSubmit(e,student.id)}>
          <input
          placeholder='update name'
          onChange={(e) => setName(e.target.value)}
          />
          <input
          placeholder='update age'
          onChange={(e) => setAge(e.target.value)}
          />
          <button>Update</button>
        </form>
        <button onClick={() =>handleDelete(student.id)}>Delete</button>
        </div>
      ))}
    </ul>
    </>
  )
}

export default App

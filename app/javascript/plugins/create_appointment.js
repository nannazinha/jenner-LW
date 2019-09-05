const createAppointment = () => {
  document.getElementById('submit_appointment').addEventListener('click', (event) => {
    document.getElementById('new_appointment').submit();
  })
}

export { createAppointment }

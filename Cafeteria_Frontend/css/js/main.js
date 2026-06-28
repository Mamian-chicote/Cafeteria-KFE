// ================= CONTROL DE ACCESO =================
if (sessionStorage.getItem("sesion_activa") !== "true") {
    window.location.href = "login.html";
}

document.addEventListener("DOMContentLoaded", function() {
    console.log("El script ha iniciado.");

    fetch('api.php')
        .then(response => response.json())
        .then(data => {
            console.log("Datos recibidos:", data); // Esto aparecerá en la consola
            
            const tbody = document.getElementById('menu-dinamico');
            if (!tbody) {
                alert("ERROR CRÍTICO: No se encontró el ID 'menu-dinamico' en el HTML");
                return;
            }

            // Forzamos un mensaje si data está vacío
            if (data.length === 0) {
                tbody.innerHTML = '<tr><td colspan="5">No hay productos en la base de datos</td></tr>';
                return;
            }

            tbody.innerHTML = ''; 
            
            data.forEach(prod => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>${prod.nombre}</td>
                    <td>${prod.descripcion}</td>
                    <td>${prod.categoria}</td>
                    <td>$${prod.precio}</td>
                    <td><button>Agregar</button></td>
                `;
                tbody.appendChild(tr);
            });
        })
        .catch(err => {
            alert("Error en el fetch: " + err);
        });
});
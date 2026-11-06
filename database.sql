CREATE DATABASE ia_generativa_db;
USE ia_generativa_db;

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    fecha_inicio DATE NOT NULL,
    descripcion TEXT NOT NULL,
    requisitos TEXT NOT NULL
);

-- Datos de prueba
INSERT INTO cursos (nombre, fecha_inicio, descripcion, requisitos) VALUES
('Introducción a la IA Generativa', '2026-11-20', 'Conceptos básicos, ventajas y desventajas de los modelos de lenguaje (LLMs).', 'Ninguno, ideal para principiantes.'),
('Prompt Engineering para Estudiantes', '2026-12-05', 'Aprende a redactar instrucciones efectivas para obtener mejores resultados con IA.', 'Conocimientos básicos de computación.');
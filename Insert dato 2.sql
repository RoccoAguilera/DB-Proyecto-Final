USE `BD`;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- 1. ACTUALIZAR TABLAS CON DATOS FALTANTES (Descripciones y Preparaciones)
UPDATE `tiposExamenes` SET `descripcion` = 'Análisis completo de sangre para evaluar células sanguíneas.', `preparacion` = 'Ayuno estricto de 8 horas.' WHERE `nombre` = 'Biometría Hemática';
UPDATE `tiposExamenes` SET `descripcion` = 'Imagen de los pulmones, corazón y pared torácica.', `preparacion` = 'Quitarse todos los objetos metálicos.' WHERE `nombre` = 'Radiografía de Tórax';
UPDATE `tiposExamenes` SET `descripcion` = 'Registro de la actividad eléctrica del corazón.', `preparacion` = 'Ropa cómoda, no aplicar cremas en el pecho.' WHERE `nombre` = 'Electrocardiograma';
UPDATE `tiposExamenes` SET `descripcion` = 'Análisis físico, químico y microscópico de la orina.', `preparacion` = 'Recoger la primera orina de la mañana.' WHERE `nombre` = 'Examen de Orina';

UPDATE `serviciosClinicos` SET `descripcion` = 'Evaluación médica inicial para diagnóstico y tratamiento.' WHERE `nombre_servicio` = 'Consulta General';
UPDATE `serviciosClinicos` SET `descripcion` = 'Evaluación médica por especialista según la patología.' WHERE `nombre_servicio` = 'Consulta Especialista';
UPDATE `serviciosClinicos` SET `descripcion` = 'Limpieza, desinfección y vendaje de heridas superficiales.' WHERE `nombre_servicio` = 'Curación Menor';

UPDATE `pagos` SET `referencia_pago` = CONCAT('REF-2026-CAJA-', id), `observacion` = 'Pago validado correctamente mediante sistema.' WHERE `id` > 0;

-- 2. INSERTAR PERSONAL CLÍNICO (Se requieren 10 personas nuevas en la tabla base)
INSERT INTO `personas` (`cedula`, `nombres`, `apellidos`, `genero`, `fecha_nacimiento`, `telefono`, `direccion`, `correo`) VALUES 
('0930000001', 'Karla', 'Mendoza', 'FEMENINO', '1990-05-12', '0970000001', 'Urdesa, Guayaquil', 'karla.m@clinica.com'),
('0930000002', 'Roberto', 'Pino', 'MASCULINO', '1985-11-23', '0970000002', 'Ceibos, Guayaquil', 'roberto.p@clinica.com'),
('0930000003', 'Elena', 'Suarez', 'FEMENINO', '1995-03-08', '0970000003', 'Samanes, Guayaquil', 'elena.s@clinica.com'),
('0930000004', 'Mario', 'Guzman', 'MASCULINO', '1988-07-15', '0970000004', 'Alborada, Guayaquil', 'mario.g@clinica.com'),
('0930000005', 'Diana', 'Lopez', 'FEMENINO', '1992-01-30', '0970000005', 'Garzota, Guayaquil', 'diana.l@clinica.com'),
('0930000006', 'Luis', 'Cedeño', 'MASCULINO', '1980-09-10', '0970000006', 'Sauces, Guayaquil', 'luis.c@clinica.com'),
('0930000007', 'Ana', 'Bustos', 'FEMENINO', '1998-12-05', '0970000007', 'Sur, Guayaquil', 'ana.b@clinica.com'),
('0930000008', 'Kevin', 'Macias', 'MASCULINO', '1991-04-18', '0970000008', 'Centro, Guayaquil', 'kevin.m@clinica.com'),
('0930000009', 'Rosa', 'Villacis', 'FEMENINO', '1986-06-25', '0970000009', 'Pascuales, Guayaquil', 'rosa.v@clinica.com'),
('0930000010', 'Carlos', 'Plaza', 'MASCULINO', '1983-08-14', '0970000010', 'Floresta, Guayaquil', 'carlos.p@clinica.com');

-- Asumiendo que sus IDs son del 81 al 90 basados en las 80 personas anteriores
INSERT INTO `personalClinico` (`persona_id`, `cargo`, `turno`, `area_trabajo`, `fecha_ingreso`) VALUES
(81, 'ENFERMERO', 'MANANA', 'ENFERMERIA', '2025-01-15'), (82, 'LABORATORISTA', 'TARDE', 'LABORATORIO', '2025-02-20'),
(83, 'RECEPCIONISTA', 'MANANA', 'RECEPCION', '2025-03-10'), (84, 'ADMINISTRATIVO', 'MANANA', 'ADMINISTRACION', '2024-11-05'),
(85, 'LIMPIEZA', 'NOCHE', 'LIMPIEZA', '2025-06-01'), (86, 'AUXILIAR', 'TARDE', 'GENERAL', '2026-01-10'),
(87, 'ENFERMERO', 'NOCHE', 'ENFERMERIA', '2025-08-22'), (88, 'LABORATORISTA', 'MANANA', 'LABORATORIO', '2024-09-15'),
(89, 'RECEPCIONISTA', 'TARDE', 'RECEPCION', '2026-02-01'), (90, 'LIMPIEZA', 'MANANA', 'LIMPIEZA', '2025-12-12');

-- 3. INSERTAR DATOS RELACIONALES (Alergias, Horarios, Diagnósticos, Exámenes, Recetas)
-- Pacientes con Alergias (Mapeando pacientes aleatorios a las alergias 1, 2 y 3)
INSERT INTO `pacientes_alergias` (`alergia_id`, `paciente_id`) VALUES
(1, 1), (2, 5), (3, 10), (1, 15), (2, 20), (3, 25), (1, 30), (2, 35), (3, 40), (1, 45);

-- Horarios Médicos (Para los 20 médicos insertados previamente)
INSERT INTO `horariosMedicos` (`medico_id`, `dia_semana`, `hora_inicio`, `hora_fin`) VALUES
(1, 'LUNES', '08:00:00', '16:00:00'), (2, 'MARTES', '08:00:00', '16:00:00'),
(3, 'MIERCOLES', '08:00:00', '16:00:00'), (4, 'JUEVES', '08:00:00', '16:00:00'),
(5, 'VIERNES', '08:00:00', '16:00:00'), (6, 'LUNES', '09:00:00', '17:00:00'),
(7, 'MARTES', '09:00:00', '17:00:00'), (8, 'MIERCOLES', '09:00:00', '17:00:00'),
(9, 'JUEVES', '09:00:00', '17:00:00'), (10, 'VIERNES', '09:00:00', '17:00:00'),
(11, 'LUNES', '10:00:00', '18:00:00'), (12, 'MARTES', '10:00:00', '18:00:00'),
(13, 'MIERCOLES', '10:00:00', '18:00:00'), (14, 'JUEVES', '10:00:00', '18:00:00'),
(15, 'VIERNES', '10:00:00', '18:00:00'), (16, 'LUNES', '08:00:00', '14:00:00'),
(17, 'MARTES', '08:00:00', '14:00:00'), (18, 'MIERCOLES', '08:00:00', '14:00:00'),
(19, 'JUEVES', '08:00:00', '14:00:00'), (20, 'VIERNES', '08:00:00', '14:00:00');

-- Diagnósticos (Tomando las primeras 15 consultas generadas)
INSERT INTO `diagnosticos` (`consulta_id`, `nombre_diagnostico`, `descripcion`, `gravedad`, `fecha_diagnostico`, `estado_diagnostico`)
SELECT id, 'Infección Respiratoria Aguda', 'Cuadro viral con congestión nasal y fiebre leve.', 'BAJA', DATE(fecha_consulta), 'ACTIVO'
FROM `consultas` LIMIT 15;

-- Exámenes (Tomando las consultas del ID 16 al 30 para evitar cruces con la misma patología, enlazando con Biometría ID 1)
INSERT INTO `examenes` (`consulta_id`, `tipoExamen_id`, `fecha_solicitud`, `fecha_examen`, `fecha_resultado`, `estado_examen`, `resultado`)
SELECT id, 1, DATE(fecha_consulta), DATE_ADD(DATE(fecha_consulta), INTERVAL 1 DAY), DATE_ADD(DATE(fecha_consulta), INTERVAL 2 DAY), 'ENTREGADO', 'Valores hematológicos dentro de los parámetros normales.'
FROM `consultas` WHERE id BETWEEN 16 AND 30;

-- Recetas (Generando recetas para las primeras 20 consultas)
INSERT INTO `recetas` (`consulta_id`, `fecha_emision`, `indicaciones_generales`)
SELECT id, DATE(fecha_consulta), 'Guardar reposo relativo, hidratación abundante y dieta ligera.'
FROM `consultas` LIMIT 20;

-- Recetas Medicamentos (Enlazando las recetas generadas con Paracetamol ID 1 e Ibuprofeno ID 2)
INSERT INTO `recetas_medicamentos` (`receta_id`, `medicamento_id`, `dosis`, `frecuencia`, `duracion`, `cantidad`, `instrucciones`)
SELECT id, 1, '500 mg', 'Cada 8 horas', '5 días', 15, 'Tomar estrictamente después de las comidas'
FROM `recetas` WHERE id <= 10;

INSERT INTO `recetas_medicamentos` (`receta_id`, `medicamento_id`, `dosis`, `frecuencia`, `duracion`, `cantidad`, `instrucciones`)
SELECT id, 2, '400 mg', 'Cada 12 horas', '3 días', 6, 'Tomar con abundante agua'
FROM `recetas` WHERE id > 10;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
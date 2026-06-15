/* 1 */
SELECT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente,
    CONCAT(per_m.nombres, ' ', per_m.apellidos) AS medico,
    e.nombre_especialidad AS especialidad,
    cons.numero_consultorio AS consultorio,
    c.fecha,
    c.hora,
    c.estado_cita
FROM bd.citas c
JOIN bd.pacientes p ON c.paciente_id = p.id
JOIN bd.personas per_p ON p.persona_id = per_p.id
JOIN bd.medicos m ON c.medico_id = m.id
JOIN bd.personas per_m ON m.persona_id = per_m.id
JOIN bd.especialidades e ON c.especialidad_id = e.id
JOIN bd.consultorios cons ON c.consultorio_id = cons.id
WHERE c.estado_cita = 'PROGRAMADA';

/* 2 */
SELECT 
    c.motivo AS motivo_consulta,
    d.nombre_diagnostico AS diagnostico,
    CONCAT(per_m.nombres, ' ', per_m.apellidos) AS medico_responsable,
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente_atendido
FROM bd.citas c
JOIN bd.consultas con ON c.id = con.cita_id
JOIN bd.pacientes p ON c.paciente_id = p.id
JOIN bd.personas per_p ON p.persona_id = per_p.id
JOIN bd.medicos m ON c.medico_id = m.id
JOIN bd.personas per_m ON m.persona_id = per_m.id
LEFT JOIN bd.diagnosticos d ON con.id = d.consulta_id
WHERE c.estado_cita = 'ATENDIDA' 
  AND c.fecha BETWEEN '2026-05-01' AND '2026-05-31';

/* 3 */
SELECT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente,
    COUNT(con.id) AS cantidad_consultas,
    MAX(c.fecha) AS ultima_fecha_atencion,
    (SELECT CONCAT(per_m.nombres, ' ', per_m.apellidos)
     FROM bd.citas c2
     JOIN bd.consultas con2 ON c2.id = con2.cita_id
     JOIN bd.medicos m2 ON c2.medico_id = m2.id
     JOIN bd.personas per_m ON m2.persona_id = per_m.id
     WHERE c2.paciente_id = p.id AND c2.estado_cita = 'ATENDIDA'
     ORDER BY c2.fecha DESC, c2.hora DESC LIMIT 1) AS ultimo_medico
FROM bd.pacientes p
JOIN bd.personas per_p ON p.persona_id = per_p.id
JOIN bd.citas c ON p.id = c.paciente_id
JOIN bd.consultas con ON c.id = con.cita_id
WHERE c.estado_cita = 'ATENDIDA'
GROUP BY p.id, per_p.nombres, per_p.apellidos
HAVING COUNT(con.id) > 2;

/* 4 */
SELECT 
    CONCAT(per_m.nombres, ' ', per_m.apellidos) AS medico,
    COUNT(c.id) AS citas_atendidas
FROM bd.medicos m
JOIN bd.personas per_m ON m.persona_id = per_m.id
JOIN bd.citas c ON m.id = c.medico_id
WHERE c.estado_cita = 'ATENDIDA'
GROUP BY m.id, per_m.nombres, per_m.apellidos
ORDER BY citas_atendidas DESC;

/* 5 */
SELECT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente,
    CONCAT(per_m.nombres, ' ', per_m.apellidos) AS medico,
    c.fecha,
    c.hora,
    cons.numero_consultorio AS consultorio_asignado
FROM bd.citas c
JOIN bd.pacientes p ON c.paciente_id = p.id
JOIN bd.personas per_p ON p.persona_id = per_p.id
JOIN bd.medicos m ON c.medico_id = m.id
JOIN bd.personas per_m ON m.persona_id = per_m.id
JOIN bd.consultorios cons ON c.consultorio_id = cons.id
WHERE c.estado_cita = 'CANCELADA';

/* 6 */
SELECT 
    nombre_diagnostico,
    descripcion,
    gravedad,
    CASE 
        WHEN gravedad = 'ALTA' THEN 'Caso crítico'
        ELSE 'Caso regular'
    END AS clasificacion
FROM bd.diagnosticos;

/* 7 */
SELECT DISTINCT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente
FROM bd.pacientes p
JOIN bd.personas per_p ON p.persona_id = per_p.id
JOIN bd.pacientes_alergias pa ON p.id = pa.paciente_id
JOIN bd.citas c ON p.id = c.paciente_id
JOIN bd.consultas con ON c.id = con.cita_id
JOIN bd.recetas r ON con.id = r.consulta_id
JOIN bd.recetas_medicamentos rm ON r.id = rm.receta_id;

/* 8 */
SELECT 
    m.nombre,
    COUNT(rm.medicamento_id) AS veces_recetado,
    m.stock_actual
FROM bd.medicamentos m
JOIN bd.recetas_medicamentos rm ON m.id = rm.medicamento_id
GROUP BY m.id, m.nombre, m.stock_actual
ORDER BY veces_recetado DESC;

/* 9 */
SELECT 
    nombre,
    stock_actual,
    'Requiere reposición' AS etiqueta
FROM bd.medicamentos
WHERE stock_actual < 10;

/* 10 */
SELECT 
    CONCAT(per_m.nombres, ' ', per_m.apellidos) AS medico,
    COUNT(me.especialidad_id) AS numero_especialidades
FROM bd.medicos m
JOIN bd.personas per_m ON m.persona_id = per_m.id
JOIN bd.medicos_especialidades me ON m.id = me.medico_id
GROUP BY m.id, per_m.nombres, per_m.apellidos
HAVING COUNT(me.especialidad_id) > 1;

/* 11 */
SELECT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente,
    te.nombre AS examen,
    e.resultado,
    e.fecha_resultado,
    e.costo
FROM bd.consultas con
JOIN bd.citas c ON con.cita_id = c.id
JOIN bd.pacientes p ON c.paciente_id = p.id
JOIN bd.personas per_p ON p.persona_id = per_p.id
JOIN bd.examenes e ON con.id = e.consulta_id
JOIN bd.tiposExamenes te ON e.tipoExamen_id = te.id;

/* 12 */
SELECT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente,
    SUM(f.total) AS total_acumulado
FROM bd.facturas f
JOIN bd.pacientes p ON f.paciente_id = p.id
JOIN bd.personas per_p ON p.persona_id = per_p.id
GROUP BY p.id, per_p.nombres, per_p.apellidos
ORDER BY total_acumulado DESC;

/* 13 */
SELECT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente,
    f.fecha_emision AS fecha_factura,
    f.total,
    f.monto_pagado,
    f.saldo_pendiente
FROM bd.facturas f
JOIN bd.pacientes p ON f.paciente_id = p.id
JOIN bd.personas per_p ON p.persona_id = per_p.id
WHERE f.estado_factura = 'PENDIENTE';

/* 14 */
SELECT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente
FROM bd.pacientes p
JOIN bd.personas per_p ON p.persona_id = per_p.id
LEFT JOIN bd.citas c ON p.id = c.paciente_id
WHERE c.id IS NULL;

/* 15 */
SELECT 
    cons.numero_consultorio,
    COUNT(c.id) AS numero_citas
FROM bd.consultorios cons
JOIN bd.citas c ON cons.id = c.consultorio_id
GROUP BY cons.id, cons.numero_consultorio
ORDER BY numero_citas DESC;

/* 16 */
SELECT 
    CONCAT(per_m.nombres, ' ', per_m.apellidos) AS medico,
    COUNT(c.id) AS citas_atendidas
FROM bd.medicos m
JOIN bd.personas per_m ON m.persona_id = per_m.id
JOIN bd.citas c ON m.id = c.medico_id
WHERE c.estado_cita = 'ATENDIDA'
GROUP BY m.id, per_m.nombres, per_m.apellidos
HAVING COUNT(c.id) > (
    SELECT COUNT(*) / COUNT(DISTINCT medico_id) 
    FROM bd.citas 
    WHERE estado_cita = 'ATENDIDA'
);

/* 17 */
SELECT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente,
    c.estado_cita,
    cons.numero_consultorio,
    c.fecha,
    c.hora
FROM bd.citas c
JOIN bd.medicos m ON c.medico_id = m.id
JOIN bd.pacientes p ON c.paciente_id = p.id
JOIN bd.personas per_p ON p.persona_id = per_p.id
JOIN bd.consultorios cons ON c.consultorio_id = cons.id
WHERE m.id = 1 /* Reemplazar 1 por el ID del médico específico */
  AND c.fecha BETWEEN '2026-01-01' AND '2026-12-31'; /* Ajustar rango de fechas */

/* 18 */
SELECT 
    CONCAT(per_p.nombres, ' ', per_p.apellidos) AS paciente,
    CONCAT(per_m.nombres, ' ', per_m.apellidos) AS medico,
    r.fecha_emision,
    COUNT(rm.medicamento_id) AS cantidad_total_medicamentos
FROM bd.recetas r
JOIN bd.consultas con ON r.consulta_id = con.id
JOIN bd.citas c ON con.cita_id = c.id
JOIN bd.pacientes p ON c.paciente_id = p.id
JOIN bd.personas per_p ON p.persona_id = per_p.id
JOIN bd.medicos m ON c.medico_id = m.id
JOIN bd.personas per_m ON m.persona_id = per_m.id
JOIN bd.recetas_medicamentos rm ON r.id = rm.receta_id
GROUP BY r.id, per_p.nombres, per_p.apellidos, per_m.nombres, per_m.apellidos, r.fecha_emision
HAVING COUNT(rm.medicamento_id) > 3;

/* 19 */
SELECT 
    metodo_pago,
    SUM(monto) AS total_ingresos
FROM bd.pagos
WHERE estado_pago = 'CONFIRMADO'
GROUP BY metodo_pago;

/* 20 */
SELECT 
    (SELECT COUNT(*) FROM bd.pacientes) AS total_pacientes,
    (SELECT COUNT(*) FROM bd.medicos WHERE estado_medico = 'ACTIVO') AS medicos_activos,
    (SELECT COUNT(*) FROM bd.citas WHERE estado_cita = 'PROGRAMADA') AS citas_programadas,
    (SELECT COUNT(*) FROM bd.citas WHERE estado_cita = 'ATENDIDA') AS citas_atendidas,
    (SELECT COUNT(*) FROM bd.facturas WHERE estado_factura = 'PENDIENTE') AS facturas_pendientes,
    (SELECT COUNT(*) FROM bd.medicamentos WHERE stock_actual < stock_minimo) AS medicamentos_bajos_stock,
    (SELECT IFNULL(SUM(monto), 0) FROM bd.pagos WHERE estado_pago = 'CONFIRMADO') AS total_recaudado;
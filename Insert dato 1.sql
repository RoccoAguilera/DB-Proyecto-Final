-- Script de Inserción de Datos Masivos
-- Rango de fechas: Enero 2026 - Junio 2026
-- Locación base: Guayaquil, Ecuador

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE `BD`;

-- 1. TABLAS PADRE E INDEPENDIENTES
INSERT INTO `especialidades` (`nombre_especialidad`, `descripcion`) VALUES 
('Medicina General', 'Atención primaria y preventiva'),
('Cardiología', 'Enfermedades del corazón'),
('Pediatría', 'Atención infantil'),
('Ginecología', 'Salud femenina'),
('Traumatología', 'Lesiones óseas y musculares');

INSERT INTO `consultorios` (`numero_consultorio`, `piso`, `descripcion`) VALUES 
('101', 1, 'Consultorio Principal'), ('102', 1, 'Consultorio A'), 
('201', 2, 'Consultorio B'), ('202', 2, 'Consultorio C'), ('301', 3, 'Consultorio D');

INSERT INTO `tiposExamenes` (`nombre`, `precio_referencial`, `categoria`) VALUES 
('Biometría Hemática', 15.00, 'LABORATORIO'),
('Radiografía de Tórax', 25.00, 'IMAGEN'),
('Electrocardiograma', 30.00, 'CARDIOLOGIA'),
('Examen de Orina', 10.00, 'LABORATORIO');

INSERT INTO `medicamentos` (`nombre`, `stock_actual`, `precio_unitario`, `fecha_vencimiento`) VALUES 
('Paracetamol 500mg', 500, 0.50, '2028-01-01'),
('Ibuprofeno 400mg', 300, 0.80, '2027-12-01'),
('Amoxicilina 500mg', 200, 1.20, '2027-06-01'),
('Losartán 50mg', 150, 1.50, '2028-05-01');

INSERT INTO `alergias` (`nombre`, `tipo`, `gravedad`) VALUES 
('Penicilina', 'MEDICAMENTO', 'ALTA'),
('Mariscos', 'ALIMENTO', 'MEDIA'),
('Polvo', 'AMBIENTAL', 'BAJA');

INSERT INTO `serviciosClinicos` (`nombre_servicio`, `costo`, `tipo_servicio`) VALUES 
('Consulta General', 30.00, 'CONSULTA'),
('Consulta Especialista', 50.00, 'CONSULTA'),
('Curación Menor', 15.00, 'PROCEDIMIENTO');

-- 2. PERSONAS (ID 1-20: Médicos, ID 21-80: Pacientes)
-- Generando 80 registros con cédulas de Ecuador (Guayas: 09...) y direcciones de Guayaquil
INSERT INTO `personas` (`cedula`, `nombres`, `apellidos`, `genero`, `fecha_nacimiento`, `telefono`, `direccion`, `correo`) VALUES 
-- Médicos (20)
('0910000001', 'Carlos', 'Andrade', 'MASCULINO', '1980-05-10', '0991234501', 'Urdesa Central, Guayaquil', 'carlos.a@med.com'),
('0910000002', 'Maria', 'Gomez', 'FEMENINO', '1982-08-15', '0991234502', 'Los Ceibos, Guayaquil', 'maria.g@med.com'),
('0910000003', 'Luis', 'Perez', 'MASCULINO', '1975-11-20', '0991234503', 'Samborondon, Guayaquil', 'luis.p@med.com'),
('0910000004', 'Ana', 'Torres', 'FEMENINO', '1988-03-05', '0991234504', 'Alborada, Guayaquil', 'ana.t@med.com'),
('0910000005', 'Jorge', 'Vera', 'MASCULINO', '1979-09-12', '0991234505', 'Sauces 8, Guayaquil', 'jorge.v@med.com'),
('0910000006', 'Lucia', 'Mendez', 'FEMENINO', '1985-12-01', '0991234506', 'Urdesa Central, Guayaquil', 'lucia.m@med.com'),
('0910000007', 'Pedro', 'Castro', 'MASCULINO', '1970-04-18', '0991234507', 'Centro, Guayaquil', 'pedro.c@med.com'),
('0910000008', 'Sofia', 'Ruiz', 'FEMENINO', '1990-07-25', '0991234508', 'Los Ceibos, Guayaquil', 'sofia.r@med.com'),
('0910000009', 'Diego', 'Silva', 'MASCULINO', '1983-02-14', '0991234509', 'Garzota, Guayaquil', 'diego.s@med.com'),
('0910000010', 'Elena', 'Rios', 'FEMENINO', '1987-10-30', '0991234510', 'Mucho Lote, Guayaquil', 'elena.r@med.com'),
('0910000011', 'Andres', 'Luna', 'MASCULINO', '1981-06-22', '0991234511', 'Urdesa Central, Guayaquil', 'andres.l@med.com'),
('0910000012', 'Carmen', 'Vega', 'FEMENINO', '1978-01-19', '0991234512', 'Samanes, Guayaquil', 'carmen.v@med.com'),
('0910000013', 'Miguel', 'Mora', 'MASCULINO', '1986-09-08', '0991234513', 'Alborada, Guayaquil', 'miguel.m@med.com'),
('0910000014', 'Laura', 'Ortiz', 'FEMENINO', '1989-11-27', '0991234514', 'Samborondon, Guayaquil', 'laura.o@med.com'),
('0910000015', 'Raul', 'Nuñez', 'MASCULINO', '1976-05-14', '0991234515', 'Centro, Guayaquil', 'raul.n@med.com'),
('0910000016', 'Paula', 'Gil', 'FEMENINO', '1991-03-03', '0991234516', 'Los Ceibos, Guayaquil', 'paula.g@med.com'),
('0910000017', 'Javier', 'Cruz', 'MASCULINO', '1984-08-11', '0991234517', 'Garzota, Guayaquil', 'javier.c@med.com'),
('0910000018', 'Isabel', 'Reyes', 'FEMENINO', '1980-12-20', '0991234518', 'Sauces 8, Guayaquil', 'isabel.r@med.com'),
('0910000019', 'Oscar', 'Salas', 'MASCULINO', '1977-02-09', '0991234519', 'Urdesa Central, Guayaquil', 'oscar.s@med.com'),
('0910000020', 'Diana', 'Tapia', 'FEMENINO', '1988-06-16', '0991234520', 'Centro, Guayaquil', 'diana.t@med.com'),
-- Pacientes (60)
('0920000001', 'Juan', 'Alvarez', 'MASCULINO', '1995-01-10', '0980000001', 'Alborada, Guayaquil', 'p1@mail.com'),
('0920000002', 'Rosa', 'Bermeo', 'FEMENINO', '1990-02-20', '0980000002', 'Sauces, Guayaquil', 'p2@mail.com'),
('0920000003', 'Jose', 'Cardenas', 'MASCULINO', '1985-03-15', '0980000003', 'Centro, Guayaquil', 'p3@mail.com'),
('0920000004', 'Luisa', 'Davila', 'FEMENINO', '2000-04-05', '0980000004', 'Urdesa, Guayaquil', 'p4@mail.com'),
('0920000005', 'Marcos', 'Espinosa', 'MASCULINO', '1992-05-25', '0980000005', 'Garzota, Guayaquil', 'p5@mail.com'),
('0920000006', 'Marta', 'Flores', 'FEMENINO', '1988-06-30', '0980000006', 'Ceibos, Guayaquil', 'p6@mail.com'),
('0920000007', 'Victor', 'Guerrero', 'MASCULINO', '1975-07-12', '0980000007', 'Samanes, Guayaquil', 'p7@mail.com'),
('0920000008', 'Sara', 'Herrera', 'FEMENINO', '1998-08-18', '0980000008', 'Guayacanes, Guayaquil', 'p8@mail.com'),
('0920000009', 'Julio', 'Iglesias', 'MASCULINO', '1980-09-09', '0980000009', 'Mucho Lote, Guayaquil', 'p9@mail.com'),
('0920000010', 'Teresa', 'Jimenez', 'FEMENINO', '1993-10-21', '0980000010', 'Pascuales, Guayaquil', 'p10@mail.com'),
('0920000011', 'Ivan', 'Lara', 'MASCULINO', '1986-11-11', '0980000011', 'Sur, Guayaquil', 'p11@mail.com'),
('0920000012', 'Blanca', 'Molina', 'FEMENINO', '1999-12-05', '0980000012', 'Centenario, Guayaquil', 'p12@mail.com'),
('0920000013', 'Mario', 'Navarro', 'MASCULINO', '1978-01-22', '0980000013', 'Floresta, Guayaquil', 'p13@mail.com'),
('0920000014', 'Irene', 'Ochoa', 'FEMENINO', '1991-02-14', '0980000014', 'Guasmo, Guayaquil', 'p14@mail.com'),
('0920000015', 'Hugo', 'Paredes', 'MASCULINO', '1984-03-08', '0980000015', 'Trinitaria, Guayaquil', 'p15@mail.com'),
('0920000016', 'Silvia', 'Quintero', 'FEMENINO', '1996-04-19', '0980000016', 'Florida, Guayaquil', 'p16@mail.com'),
('0920000017', 'Ramiro', 'Rojas', 'MASCULINO', '1982-05-27', '0980000017', 'Martha Roldos, Guayaquil', 'p17@mail.com'),
('0920000018', 'Nuria', 'Salazar', 'FEMENINO', '1989-06-16', '0980000018', 'Mapasingue, Guayaquil', 'p18@mail.com'),
('0920000019', 'David', 'Tello', 'MASCULINO', '1979-07-03', '0980000019', 'Orquideas, Guayaquil', 'p19@mail.com'),
('0920000020', 'Alicia', 'Urrutia', 'FEMENINO', '2001-08-25', '0980000020', 'Vergeles, Guayaquil', 'p20@mail.com'),
('0920000021', 'Pablo', 'Vargas', 'MASCULINO', '1994-09-14', '0980000021', 'Duran, Guayaquil', 'p21@mail.com'),
('0920000022', 'Clara', 'Yanez', 'FEMENINO', '1987-10-02', '0980000022', 'Samborondon, Guayaquil', 'p22@mail.com'),
('0920000023', 'Emilio', 'Zambrano', 'MASCULINO', '1983-11-28', '0980000023', 'Centro, Guayaquil', 'p23@mail.com'),
('0920000024', 'Luz', 'Acosta', 'FEMENINO', '1997-12-10', '0980000024', 'Urdesa, Guayaquil', 'p24@mail.com'),
('0920000025', 'Ruben', 'Becerra', 'MASCULINO', '1981-01-06', '0980000025', 'Alborada, Guayaquil', 'p25@mail.com'),
('0920000026', 'Gloria', 'Cevallos', 'FEMENINO', '1992-02-17', '0980000026', 'Sauces, Guayaquil', 'p26@mail.com'),
('0920000027', 'Felipe', 'Duarte', 'MASCULINO', '1976-03-31', '0980000027', 'Ceibos, Guayaquil', 'p27@mail.com'),
('0920000028', 'Sonia', 'Escobar', 'FEMENINO', '1995-04-23', '0980000028', 'Garzota, Guayaquil', 'p28@mail.com'),
('0920000029', 'Omar', 'Figueroa', 'MASCULINO', '1988-05-07', '0980000029', 'Samanes, Guayaquil', 'p29@mail.com'),
('0920000030', 'Ruth', 'Gallo', 'FEMENINO', '1990-06-19', '0980000030', 'Guayacanes, Guayaquil', 'p30@mail.com'),
('0920000031', 'Tomas', 'Hurtado', 'MASCULINO', '1985-07-08', '0980000031', 'Mucho Lote, Guayaquil', 'p31@mail.com'),
('0920000032', 'Erika', 'Ibarra', 'FEMENINO', '1999-08-11', '0980000032', 'Pascuales, Guayaquil', 'p32@mail.com'),
('0920000033', 'Simon', 'Jurado', 'MASCULINO', '1980-09-29', '0980000033', 'Sur, Guayaquil', 'p33@mail.com'),
('0920000034', 'Olga', 'Lozano', 'FEMENINO', '1993-10-15', '0980000034', 'Centenario, Guayaquil', 'p34@mail.com'),
('0920000035', 'Cesar', 'Macias', 'MASCULINO', '1977-11-04', '0980000035', 'Floresta, Guayaquil', 'p35@mail.com'),
('0920000036', 'Ines', 'Narvaez', 'FEMENINO', '1996-12-26', '0980000036', 'Guasmo, Guayaquil', 'p36@mail.com'),
('0920000037', 'Martin', 'Olivares', 'MASCULINO', '1982-01-18', '0980000037', 'Trinitaria, Guayaquil', 'p37@mail.com'),
('0920000038', 'Belen', 'Paz', 'FEMENINO', '1989-02-09', '0980000038', 'Florida, Guayaquil', 'p38@mail.com'),
('0920000039', 'Daniel', 'Quiroga', 'MASCULINO', '1994-03-12', '0980000039', 'Martha Roldos, Guayaquil', 'p39@mail.com'),
('0920000040', 'Lorena', 'Rios', 'FEMENINO', '1986-04-20', '0980000040', 'Mapasingue, Guayaquil', 'p40@mail.com'),
('0920000041', 'Arturo', 'Salas', 'MASCULINO', '1981-05-02', '0980000041', 'Orquideas, Guayaquil', 'p41@mail.com'),
('0920000042', 'Milena', 'Toro', 'FEMENINO', '1998-06-08', '0980000042', 'Vergeles, Guayaquil', 'p42@mail.com'),
('0920000043', 'Esteban', 'Ugarte', 'MASCULINO', '1979-07-16', '0980000043', 'Duran, Guayaquil', 'p43@mail.com'),
('0920000044', 'Viviana', 'Vallejo', 'FEMENINO', '1991-08-27', '0980000044', 'Samborondon, Guayaquil', 'p44@mail.com'),
('0920000045', 'Roberto', 'Yepez', 'MASCULINO', '1984-09-05', '0980000045', 'Centro, Guayaquil', 'p45@mail.com'),
('0920000046', 'Tatiana', 'Zuniga', 'FEMENINO', '1995-10-13', '0980000046', 'Urdesa, Guayaquil', 'p46@mail.com'),
('0920000047', 'Gonzalo', 'Aviles', 'MASCULINO', '1987-11-21', '0980000047', 'Alborada, Guayaquil', 'p47@mail.com'),
('0920000048', 'Pamela', 'Bravo', 'FEMENINO', '1992-12-03', '0980000048', 'Sauces, Guayaquil', 'p48@mail.com'),
('0920000049', 'Rodrigo', 'Carrillo', 'MASCULINO', '1978-01-29', '0980000049', 'Ceibos, Guayaquil', 'p49@mail.com'),
('0920000050', 'Brenda', 'Diaz', 'FEMENINO', '1990-02-10', '0980000050', 'Garzota, Guayaquil', 'p50@mail.com'),
('0920000051', 'Alvaro', 'Enriquez', 'MASCULINO', '1985-03-24', '0980000051', 'Samanes, Guayaquil', 'p51@mail.com'),
('0920000052', 'Cynthia', 'Franco', 'FEMENINO', '1999-04-14', '0980000052', 'Guayacanes, Guayaquil', 'p52@mail.com'),
('0920000053', 'Eduardo', 'Guzman', 'MASCULINO', '1980-05-09', '0980000053', 'Mucho Lote, Guayaquil', 'p53@mail.com'),
('0920000054', 'Jessica', 'Hidalgo', 'FEMENINO', '1993-06-11', '0980000054', 'Pascuales, Guayaquil', 'p54@mail.com'),
('0920000055', 'Fernando', 'Izquierdo', 'MASCULINO', '1976-07-28', '0980000055', 'Sur, Guayaquil', 'p55@mail.com'),
('0920000056', 'Monica', 'Jaramillo', 'FEMENINO', '1997-08-30', '0980000056', 'Centenario, Guayaquil', 'p56@mail.com'),
('0920000057', 'Nicolas', 'León', 'MASCULINO', '1982-09-02', '0980000057', 'Floresta, Guayaquil', 'p57@mail.com'),
('0920000058', 'Veronica', 'Mejia', 'FEMENINO', '1989-10-17', '0980000058', 'Guasmo, Guayaquil', 'p58@mail.com'),
('0920000059', 'Samuel', 'Nuñez', 'MASCULINO', '1994-11-06', '0980000059', 'Trinitaria, Guayaquil', 'p59@mail.com'),
('0920000060', 'Daniela', 'Orellana', 'FEMENINO', '1986-12-22', '0980000060', 'Florida, Guayaquil', 'p60@mail.com');

-- 3. MÉDICOS (Asignando IDs 1-20 de la tabla personas)
INSERT INTO `medicos` (`persona_id`, `numero_licencia`, `anios_experiencia`, `codigo_medico`, `tipo_contrato`, `fecha_ingreso`) VALUES 
(1, 'LIC-001', 10, 'MED-001', 'PLANTA', '2016-01-10'), (2, 'LIC-002', 8, 'MED-002', 'CONTRATO', '2018-05-15'),
(3, 'LIC-003', 15, 'MED-003', 'PLANTA', '2011-03-20'), (4, 'LIC-004', 5, 'MED-004', 'MEDIO_TIEMPO', '2021-08-01'),
(5, 'LIC-005', 12, 'MED-005', 'PLANTA', '2014-11-12'), (6, 'LIC-006', 7, 'MED-006', 'CONTRATO', '2019-02-25'),
(7, 'LIC-007', 20, 'MED-007', 'HONORARIOS', '2006-07-18'), (8, 'LIC-008', 4, 'MED-008', 'PLANTA', '2022-09-30'),
(9, 'LIC-009', 9, 'MED-009', 'CONTRATO', '2017-04-05'), (10, 'LIC-010', 6, 'MED-010', 'MEDIO_TIEMPO', '2020-10-10'),
(11, 'LIC-011', 11, 'MED-011', 'PLANTA', '2015-06-22'), (12, 'LIC-012', 14, 'MED-012', 'PLANTA', '2012-01-15'),
(13, 'LIC-013', 8, 'MED-013', 'CONTRATO', '2018-09-08'), (14, 'LIC-014', 5, 'MED-014', 'MEDIO_TIEMPO', '2021-11-27'),
(15, 'LIC-015', 16, 'MED-015', 'HONORARIOS', '2010-05-14'), (16, 'LIC-016', 3, 'MED-016', 'PLANTA', '2023-03-03'),
(17, 'LIC-017', 9, 'MED-017', 'CONTRATO', '2017-08-11'), (18, 'LIC-018', 13, 'MED-018', 'PLANTA', '2013-12-20'),
(19, 'LIC-019', 18, 'MED-019', 'HONORARIOS', '2008-02-09'), (20, 'LIC-020', 6, 'MED-020', 'CONTRATO', '2020-06-16');

-- 4. PACIENTES (Asignando IDs 21-80 de la tabla personas)
INSERT INTO `pacientes` (`persona_id`, `numero_historia`, `tipo_sangre`) VALUES 
(21, 'HC-001', 'O+'), (22, 'HC-002', 'A+'), (23, 'HC-003', 'B+'), (24, 'HC-004', 'O-'), (25, 'HC-005', 'AB+'), (26, 'HC-006', 'O+'), (27, 'HC-007', 'A-'), (28, 'HC-008', 'B-'), (29, 'HC-009', 'O+'), (30, 'HC-010', 'A+'),
(31, 'HC-011', 'O+'), (32, 'HC-012', 'A+'), (33, 'HC-013', 'B+'), (34, 'HC-014', 'O-'), (35, 'HC-015', 'AB+'), (36, 'HC-016', 'O+'), (37, 'HC-017', 'A-'), (38, 'HC-018', 'B-'), (39, 'HC-019', 'O+'), (40, 'HC-020', 'A+'),
(41, 'HC-021', 'O+'), (42, 'HC-022', 'A+'), (43, 'HC-023', 'B+'), (44, 'HC-024', 'O-'), (45, 'HC-025', 'AB+'), (46, 'HC-026', 'O+'), (47, 'HC-027', 'A-'), (48, 'HC-028', 'B-'), (49, 'HC-029', 'O+'), (50, 'HC-030', 'A+'),
(51, 'HC-031', 'O+'), (52, 'HC-032', 'A+'), (53, 'HC-033', 'B+'), (54, 'HC-034', 'O-'), (55, 'HC-035', 'AB+'), (56, 'HC-036', 'O+'), (57, 'HC-037', 'A-'), (58, 'HC-038', 'B-'), (59, 'HC-039', 'O+'), (60, 'HC-040', 'A+'),
(61, 'HC-041', 'O+'), (62, 'HC-042', 'A+'), (63, 'HC-043', 'B+'), (64, 'HC-044', 'O-'), (65, 'HC-045', 'AB+'), (66, 'HC-046', 'O+'), (67, 'HC-047', 'A-'), (68, 'HC-048', 'B-'), (69, 'HC-049', 'O+'), (70, 'HC-050', 'A+'),
(71, 'HC-051', 'O+'), (72, 'HC-052', 'A+'), (73, 'HC-053', 'B+'), (74, 'HC-054', 'O-'), (75, 'HC-055', 'AB+'), (76, 'HC-056', 'O+'), (77, 'HC-057', 'A-'), (78, 'HC-058', 'B-'), (79, 'HC-059', 'O+'), (80, 'HC-060', 'A+');

-- 5. TABLAS INTERMEDIAS
-- medicos_especialidades (Asignando aleatoriamente entre las 5 especialidades)
INSERT INTO `medicos_especialidades` (`medico_id`, `especialidad_id`) VALUES 
(1,1), (2,2), (3,3), (4,4), (5,5), (6,1), (7,2), (8,3), (9,4), (10,5), 
(11,1), (12,2), (13,3), (14,4), (15,5), (16,1), (17,2), (18,3), (19,4), (20,5);

-- 6. TRANSACCIONES (1 Cita, 1 Consulta, 1 Factura por paciente. Rango: Enero - Junio 2026)
-- Citas (ID 1 al 60)
INSERT INTO `citas` (`paciente_id`, `medico_id`, `especialidad_id`, `consultorio_id`, `fecha`, `hora`, `estado_cita`) VALUES 
(1,1,1,1,'2026-01-10','08:00:00','ATENDIDA'), (2,2,2,2,'2026-01-15','09:00:00','ATENDIDA'),
(3,3,3,3,'2026-02-05','10:00:00','ATENDIDA'), (4,4,4,4,'2026-02-20','11:00:00','ATENDIDA'),
(5,5,5,5,'2026-03-01','14:00:00','ATENDIDA'), (6,6,1,1,'2026-03-10','15:00:00','ATENDIDA'),
(7,7,2,2,'2026-04-05','08:30:00','ATENDIDA'), (8,8,3,3,'2026-04-12','09:30:00','ATENDIDA'),
(9,9,4,4,'2026-05-02','10:30:00','ATENDIDA'), (10,10,5,5,'2026-05-20','11:30:00','ATENDIDA'),
(11,11,1,1,'2026-06-01','08:00:00','PROGRAMADA'), (12,12,2,2,'2026-06-02','09:00:00','PROGRAMADA'),
(13,13,3,3,'2026-01-12','10:00:00','ATENDIDA'), (14,14,4,4,'2026-01-22','11:00:00','ATENDIDA'),
(15,15,5,5,'2026-02-08','14:00:00','ATENDIDA'), (16,16,1,1,'2026-02-18','15:00:00','ATENDIDA'),
(17,17,2,2,'2026-03-05','08:30:00','ATENDIDA'), (18,18,3,3,'2026-03-25','09:30:00','ATENDIDA'),
(19,19,4,4,'2026-04-10','10:30:00','ATENDIDA'), (20,20,5,5,'2026-04-22','11:30:00','ATENDIDA'),
(21,1,1,1,'2026-05-05','08:00:00','ATENDIDA'), (22,2,2,2,'2026-05-15','09:00:00','ATENDIDA'),
(23,3,3,3,'2026-06-05','10:00:00','PROGRAMADA'), (24,4,4,4,'2026-06-10','11:00:00','PROGRAMADA'),
(25,5,5,5,'2026-01-05','14:00:00','ATENDIDA'), (26,6,1,1,'2026-01-25','15:00:00','ATENDIDA'),
(27,7,2,2,'2026-02-15','08:30:00','ATENDIDA'), (28,8,3,3,'2026-02-28','09:30:00','ATENDIDA'),
(29,9,4,4,'2026-03-12','10:30:00','ATENDIDA'), (30,10,5,5,'2026-03-30','11:30:00','ATENDIDA'),
(31,11,1,1,'2026-04-15','08:00:00','ATENDIDA'), (32,12,2,2,'2026-04-28','09:00:00','ATENDIDA'),
(33,13,3,3,'2026-05-10','10:00:00','ATENDIDA'), (34,14,4,4,'2026-05-25','11:00:00','ATENDIDA'),
(35,15,5,5,'2026-06-03','14:00:00','PROGRAMADA'), (36,16,1,1,'2026-06-08','15:00:00','PROGRAMADA'),
(37,17,2,2,'2026-01-08','08:30:00','ATENDIDA'), (38,18,3,3,'2026-01-20','09:30:00','ATENDIDA'),
(39,19,4,4,'2026-02-10','10:30:00','ATENDIDA'), (40,20,5,5,'2026-02-22','11:30:00','ATENDIDA'),
(41,1,1,1,'2026-03-08','08:00:00','ATENDIDA'), (42,2,2,2,'2026-03-20','09:00:00','ATENDIDA'),
(43,3,3,3,'2026-04-18','10:00:00','ATENDIDA'), (44,4,4,4,'2026-04-30','11:00:00','ATENDIDA'),
(45,5,5,5,'2026-05-12','14:00:00','ATENDIDA'), (46,6,1,1,'2026-05-28','15:00:00','ATENDIDA'),
(47,7,2,2,'2026-06-04','08:30:00','PROGRAMADA'), (48,8,3,3,'2026-06-12','09:30:00','PROGRAMADA'),
(49,9,4,4,'2026-01-18','10:30:00','ATENDIDA'), (50,10,5,5,'2026-01-30','11:30:00','ATENDIDA'),
(51,11,1,1,'2026-02-12','08:00:00','ATENDIDA'), (52,12,2,2,'2026-02-26','09:00:00','ATENDIDA'),
(53,13,3,3,'2026-03-15','10:00:00','ATENDIDA'), (54,14,4,4,'2026-03-28','11:00:00','ATENDIDA'),
(55,15,5,5,'2026-04-20','14:00:00','ATENDIDA'), (56,16,1,1,'2026-04-25','15:00:00','ATENDIDA'),
(57,17,2,2,'2026-05-18','08:30:00','ATENDIDA'), (58,18,3,3,'2026-05-30','09:30:00','ATENDIDA'),
(59,19,4,4,'2026-06-06','10:30:00','PROGRAMADA'), (60,20,5,5,'2026-06-14','11:30:00','PROGRAMADA');

-- Consultas (Sólo para las citas ATENDIDAS, asumiendo 50 atendidas de las 60)
INSERT INTO `consultas` (`cita_id`, `fecha_consulta`, `sintomas`, `tratamiento`, `estado_consulta`) 
SELECT id, CONCAT(fecha, ' ', hora), 'Dolor general', 'Reposo y medicación', 'CERRADA' 
FROM `citas` WHERE `estado_cita` = 'ATENDIDA';

-- Historias Clínicas (Una por paciente con consulta)
INSERT INTO `historiasClinicas` (`paciente_id`, `consulta_id`, `fecha_registro`, `descripcion`) 
SELECT c.paciente_id, co.id, DATE(co.fecha_consulta), 'Registro de consulta inicial' 
FROM `consultas` co 
JOIN `citas` c ON co.cita_id = c.id;

-- Facturas (Para las consultas realizadas)
INSERT INTO `facturas` (`paciente_id`, `consulta_id`, `fecha_emision`, `total`, `estado_factura`) 
SELECT c.paciente_id, co.id, DATE(co.fecha_consulta), 30.00, 'PAGADA' 
FROM `consultas` co 
JOIN `citas` c ON co.cita_id = c.id;

-- Detalle Factura
INSERT INTO `detalleFactura` (`factura_id`, `servicioClinico_id`, `cantidad`, `precio_unitario`, `subtotal`) 
SELECT id, 1, 1, 30.00, 30.00 FROM `facturas`;

-- Pagos
INSERT INTO `pagos` (`factura_id`, `fecha_pago`, `monto`, `metodo_pago`, `estado_pago`) 
SELECT id, fecha_emision, total, 'EFECTIVO', 'CONFIRMADO' FROM `facturas`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
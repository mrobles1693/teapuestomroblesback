/****** Object:  StoredProcedure [dbo].[pa_ruta]    Script Date: 28/06/2024 14:30:17 ******/
DROP PROCEDURE [dbo].[pa_ruta]
GO
/****** Object:  StoredProcedure [dbo].[pa_reserva_pasajero]    Script Date: 28/06/2024 14:30:17 ******/
DROP PROCEDURE [dbo].[pa_reserva_pasajero]
GO
/****** Object:  StoredProcedure [dbo].[pa_reserva]    Script Date: 28/06/2024 14:30:17 ******/
DROP PROCEDURE [dbo].[pa_reserva]
GO
ALTER TABLE [dbo].[Ruta] DROP CONSTRAINT [FK_Ruta_Ciudad_Origen]
GO
ALTER TABLE [dbo].[Reserva_Programacion] DROP CONSTRAINT [FK_Reserva_Programacion_Reserva]
GO
ALTER TABLE [dbo].[Reserva_Programacion] DROP CONSTRAINT [FK_Reserva_Programacion_Programacion]
GO
ALTER TABLE [dbo].[Reserva_Pasajero] DROP CONSTRAINT [FK_Reserva_Pasajero_Reserva]
GO
ALTER TABLE [dbo].[Reserva_Pasajero] DROP CONSTRAINT [FK_Reserva_Pasajero_Pasajero]
GO
ALTER TABLE [dbo].[Programacion_Vuelo] DROP CONSTRAINT [FK_Horario_Ruta_Aeronave]
GO
ALTER TABLE [dbo].[Programacion_Vuelo] DROP CONSTRAINT [FK_Horario_Ruta]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 28/06/2024 14:30:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
DROP TABLE [dbo].[Ruta]
GO
/****** Object:  Table [dbo].[Reserva_Programacion]    Script Date: 28/06/2024 14:30:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva_Programacion]') AND type in (N'U'))
DROP TABLE [dbo].[Reserva_Programacion]
GO
/****** Object:  Table [dbo].[Reserva_Pasajero]    Script Date: 28/06/2024 14:30:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva_Pasajero]') AND type in (N'U'))
DROP TABLE [dbo].[Reserva_Pasajero]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 28/06/2024 14:30:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva]') AND type in (N'U'))
DROP TABLE [dbo].[Reserva]
GO
/****** Object:  Table [dbo].[Programacion_Vuelo]    Script Date: 28/06/2024 14:30:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Programacion_Vuelo]') AND type in (N'U'))
DROP TABLE [dbo].[Programacion_Vuelo]
GO
/****** Object:  Table [dbo].[Precio_Pasaje]    Script Date: 28/06/2024 14:30:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Precio_Pasaje]') AND type in (N'U'))
DROP TABLE [dbo].[Precio_Pasaje]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 28/06/2024 14:30:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pasajero]') AND type in (N'U'))
DROP TABLE [dbo].[Pasajero]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 28/06/2024 14:30:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ciudad]') AND type in (N'U'))
DROP TABLE [dbo].[Ciudad]
GO
/****** Object:  Table [dbo].[Aeronave]    Script Date: 28/06/2024 14:30:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aeronave]') AND type in (N'U'))
DROP TABLE [dbo].[Aeronave]
GO
/****** Object:  Table [dbo].[Aeronave]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aeronave](
	[nIdAeronave] [int] IDENTITY(1,1) NOT NULL,
	[sAeronave] [varchar](10) NOT NULL,
	[nCapacidad] [int] NOT NULL,
 CONSTRAINT [PK_Aeronave] PRIMARY KEY CLUSTERED 
(
	[nIdAeronave] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[nIdCiudad] [int] IDENTITY(1,1) NOT NULL,
	[sCiudad] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[nIdCiudad] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajero](
	[nIdPasajero] [int] IDENTITY(1,1) NOT NULL,
	[sDNI] [varchar](8) NULL,
	[sPasaporte] [varchar](11) NULL,
	[sApellidoP] [varchar](100) NOT NULL,
	[sApellidoM] [varchar](100) NOT NULL,
	[sPriNombre] [varchar](100) NOT NULL,
	[sSegNombre] [varchar](100) NULL,
	[sCelular] [varchar](9) NULL,
	[sCorreo] [varchar](100) NULL,
	[dFechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Pasajero] PRIMARY KEY CLUSTERED 
(
	[nIdPasajero] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precio_Pasaje]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precio_Pasaje](
	[nIdAeronave] [int] NOT NULL,
	[nIdRuta] [int] NOT NULL,
	[nPrecio] [decimal](13, 4) NOT NULL,
 CONSTRAINT [PK_Precio_Pasaje] PRIMARY KEY CLUSTERED 
(
	[nIdAeronave] ASC,
	[nIdRuta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Precio_Pasaje] UNIQUE NONCLUSTERED 
(
	[nIdAeronave] ASC,
	[nIdRuta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programacion_Vuelo]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programacion_Vuelo](
	[nIdProgramacionVuelo] [int] IDENTITY(1,1) NOT NULL,
	[nIdRuta] [int] NOT NULL,
	[nIdAeronave] [int] NOT NULL,
	[dFechaProgramada] [datetime] NOT NULL,
 CONSTRAINT [PK_Horario_Ruta] PRIMARY KEY CLUSTERED 
(
	[nIdProgramacionVuelo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[nIdReserva] [int] IDENTITY(1,1) NOT NULL,
	[nIdEstado] [int] NOT NULL,
	[nCantidadPax] [int] NOT NULL,
	[dFechaCrea] [datetime] NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[nIdReserva] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva_Pasajero]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva_Pasajero](
	[nIdReserva] [int] NOT NULL,
	[nIdPasajero] [int] NOT NULL,
	[bPrincipal] [bit] NULL,
 CONSTRAINT [PK_Reserva_Pasajero] PRIMARY KEY CLUSTERED 
(
	[nIdReserva] ASC,
	[nIdPasajero] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Reserva_Pasajero] UNIQUE NONCLUSTERED 
(
	[nIdReserva] ASC,
	[nIdPasajero] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva_Programacion]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva_Programacion](
	[nIdReserva] [int] NOT NULL,
	[nIdProgramacionVuelo] [int] NOT NULL,
 CONSTRAINT [PK_Reserva_Programacion] PRIMARY KEY CLUSTERED 
(
	[nIdReserva] ASC,
	[nIdProgramacionVuelo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Reserva_Programacion] UNIQUE NONCLUSTERED 
(
	[nIdReserva] ASC,
	[nIdProgramacionVuelo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ruta](
	[nIdRuta] [int] IDENTITY(1,1) NOT NULL,
	[nIdCiudadOrigen] [int] NOT NULL,
	[nIdCiudadDestino] [int] NOT NULL,
 CONSTRAINT [PK_Ruta] PRIMARY KEY CLUSTERED 
(
	[nIdRuta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Ruta] UNIQUE NONCLUSTERED 
(
	[nIdCiudadOrigen] ASC,
	[nIdCiudadDestino] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Programacion_Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Horario_Ruta] FOREIGN KEY([nIdRuta])
REFERENCES [dbo].[Ruta] ([nIdRuta])
GO
ALTER TABLE [dbo].[Programacion_Vuelo] CHECK CONSTRAINT [FK_Horario_Ruta]
GO
ALTER TABLE [dbo].[Programacion_Vuelo]  WITH CHECK ADD  CONSTRAINT [FK_Horario_Ruta_Aeronave] FOREIGN KEY([nIdAeronave])
REFERENCES [dbo].[Aeronave] ([nIdAeronave])
GO
ALTER TABLE [dbo].[Programacion_Vuelo] CHECK CONSTRAINT [FK_Horario_Ruta_Aeronave]
GO
ALTER TABLE [dbo].[Reserva_Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Pasajero_Pasajero] FOREIGN KEY([nIdPasajero])
REFERENCES [dbo].[Pasajero] ([nIdPasajero])
GO
ALTER TABLE [dbo].[Reserva_Pasajero] CHECK CONSTRAINT [FK_Reserva_Pasajero_Pasajero]
GO
ALTER TABLE [dbo].[Reserva_Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Pasajero_Reserva] FOREIGN KEY([nIdReserva])
REFERENCES [dbo].[Reserva] ([nIdReserva])
GO
ALTER TABLE [dbo].[Reserva_Pasajero] CHECK CONSTRAINT [FK_Reserva_Pasajero_Reserva]
GO
ALTER TABLE [dbo].[Reserva_Programacion]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Programacion_Programacion] FOREIGN KEY([nIdProgramacionVuelo])
REFERENCES [dbo].[Programacion_Vuelo] ([nIdProgramacionVuelo])
GO
ALTER TABLE [dbo].[Reserva_Programacion] CHECK CONSTRAINT [FK_Reserva_Programacion_Programacion]
GO
ALTER TABLE [dbo].[Reserva_Programacion]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Programacion_Reserva] FOREIGN KEY([nIdReserva])
REFERENCES [dbo].[Reserva] ([nIdReserva])
GO
ALTER TABLE [dbo].[Reserva_Programacion] CHECK CONSTRAINT [FK_Reserva_Programacion_Reserva]
GO
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Ciudad_Origen] FOREIGN KEY([nIdCiudadOrigen])
REFERENCES [dbo].[Ciudad] ([nIdCiudad])
GO
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Ciudad_Origen]
GO
/****** Object:  StoredProcedure [dbo].[pa_reserva]    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:      Mario Robles
-- Create Date: 2024-06-26
-- Description: Insertar Reserva
CREATE PROCEDURE [dbo].[pa_reserva] -- EXEC pa_reserva 1, 1
	@nCantidadPax INT,
	@nIdProgramacionVueloIda INT,
	@nIdProgramacionVueloVuelta INT
AS
BEGIN	
	DECLARE @nCod INT, @sMsj VARCHAR(MAX)
	DECLARE @bValido BIT = 1
	DECLARE @nCant INT

	SELECT
		@nCant = (A.nCapacidad - ISNULL(SUM(R.nCantidadPax), 0))
	FROM
		Programacion_Vuelo PV
		INNER JOIN
		Aeronave A ON A.nIdAeronave = PV.nIdAeronave
		LEFT JOIN
		Reserva_Programacion RP ON RP.nIdProgramacionVuelo = PV.nIdProgramacionVuelo
		LEFT JOIN
		Reserva R ON R.nIdReserva = RP.nIdReserva AND R.nIdEstado <> 3
	WHERE
		PV.nIdProgramacionVuelo = @nIdProgramacionVueloIda
	GROUP BY
		PV.nIdProgramacionVuelo
		,A.nCapacidad		

	IF(@nCant < @nCantidadPax)
	BEGIN
		SET @bValido = 0
		SET @nCod = 0
		SET @sMsj = 'No hay cantidad suficiente de asientos disponibles para crear la reserva.'
	END

	IF(@bValido = 1 AND @nIdProgramacionVueloVuelta IS NOT NULL)
	BEGIN
		SELECT
			@nCant = (A.nCapacidad - ISNULL(SUM(R.nCantidadPax), 0))
		FROM
			Programacion_Vuelo PV
			INNER JOIN
			Aeronave A ON A.nIdAeronave = PV.nIdAeronave
			LEFT JOIN
			Reserva_Programacion RP ON RP.nIdProgramacionVuelo = PV.nIdProgramacionVuelo
			LEFT JOIN
			Reserva R ON R.nIdReserva = RP.nIdReserva AND R.nIdEstado <> 3
		WHERE
			PV.nIdProgramacionVuelo = @nIdProgramacionVueloVuelta
		GROUP BY
			PV.nIdProgramacionVuelo
			,A.nCapacidad		

		IF(@nCant < @nCantidadPax)
		BEGIN
			SET @bValido = 0
			SET @nCod = 0
			SET @sMsj = 'No hay cantidad suficiente de asientos disponibles en la vuelta para crear la reserva.'
		END
	END
	
	IF(@bValido = 1)
	BEGIN
		BEGIN TRANSACTION InsReserva
  		BEGIN TRY 
		
			INSERT INTO Reserva 
			(
			nCantidadPax, 
			nIdEstado, 
			dFechaCrea
			) 
			VALUES 
			(
			@nCantidadPax, 
			1, 
			GETDATE()
			)

			SELECT @nCod = scope_identity()

			INSERT INTO Reserva_Programacion 
			(nIdReserva, nIdProgramacionVuelo) 
			VALUES
			(@nCod, @nIdProgramacionVueloIda)

			IF(@nIdProgramacionVueloVuelta IS NOT NULL)
			BEGIN
				INSERT INTO Reserva_Programacion
				(nIdReserva, nIdProgramacionVuelo)
				VALUES
				(@nCod, @nIdProgramacionVueloVuelta)
			END

			SET @sMsj = 'Reserva registrada.'

		END TRY
		BEGIN CATCH
			SET @nCod = 0;
			SELECT @sMsj = ERROR_MESSAGE()  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION InsReserva;  
		END CATCH

		IF @@TRANCOUNT > 0  
			COMMIT TRANSACTION InsReserva;  
	END

	SELECT @nCod AS nCod, @sMsj AS sMsj
END
GO
/****** Object:  NumberedStoredProcedure [dbo].[pa_reserva];2    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:      Mario Robles
-- Create Date: 2024-06-26
-- Description: Cancelar Reserva
CREATE PROCEDURE [dbo].[pa_reserva];2 -- EXEC pa_reserva;2 1
	@nIdReserva INT
AS
BEGIN	
	DECLARE @nCod INT, @sMsj VARCHAR(MAX)
	DECLARE @bValido BIT = 1
	DECLARE @nCant INT

	SELECT
		@nCant = COUNT(*)
	FROM
		Reserva
	WHERE	
		nIdReserva = @nIdReserva

	IF(@nCant = 0)
	BEGIN
		SET @bValido = 0
		SET @nCod = 0
		SET @sMsj = 'No existe la reserva indicada.'
	END
	
	IF(@bValido = 1)
	BEGIN
		BEGIN TRANSACTION CancelarReserva
  		BEGIN TRY 
			
			UPDATE Reserva
			SET
				nIdEstado = 3
			WHERE
				nIdReserva = @nIdReserva

			SELECT @nCod = @nIdReserva
			SET @sMsj = 'Reserva cancelada.'

		END TRY
		BEGIN CATCH
			SET @nCod = 0;
			SELECT @sMsj = ERROR_MESSAGE()  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION CancelarReserva;  
		END CATCH

		IF @@TRANCOUNT > 0  
			COMMIT TRANSACTION CancelarReserva;  
	END

	SELECT @nCod AS nCod, @sMsj AS sMsj
END
GO
/****** Object:  NumberedStoredProcedure [dbo].[pa_reserva];3    Script Date: 28/06/2024 14:30:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:      Mario Robles
-- Create Date: 2024-06-26
-- Description: Finalizar Reserva
CREATE PROCEDURE [dbo].[pa_reserva];3 -- EXEC pa_reserva;3 1
	@nIdReserva INT
AS
BEGIN	
	DECLARE @nCod INT, @sMsj VARCHAR(MAX)
	DECLARE @bValido BIT = 1
	DECLARE @nCant INT

	SELECT
		@nCant = COUNT(*)
	FROM
		Reserva
	WHERE	
		nIdReserva = @nIdReserva

	IF(@nCant = 0)
	BEGIN
		SET @bValido = 0
		SET @nCod = 0
		SET @sMsj = 'No existe la reserva indicada.'
	END

	IF(@bValido = 1)
	BEGIN
		DECLARE @nCantidadPax INT

		SELECT
			@nCantidadPax = nCantidadPax
		FROM
			Reserva
		WHERE	
			nIdReserva = @nIdReserva

		SELECT
			@nCant = COUNT(*)
		FROM
			Reserva_Pasajero
		WHERE
			nIdReserva = @nIdReserva

		IF(@nCantidadPax > @nCant)
		BEGIN
			SET @bValido = 0
			SET @nCod = 0
			SET @sMsj = 'No se puede finalizar por que no ha regitrado la cantidad total de pasajeros.'
		END
	END
	
	IF(@bValido = 1)
	BEGIN
		BEGIN TRANSACTION FinalizarReserva
  		BEGIN TRY 
			
			UPDATE Reserva
			SET
				nIdEstado = 2
			WHERE
				nIdReserva = @nIdReserva

			SELECT @nCod = @nIdReserva
			SET @sMsj = 'Reserva registrada con exito, podrá consultarla con su número de documento.'

		END TRY
		BEGIN CATCH
			SET @nCod = 0;
			SELECT @sMsj = ERROR_MESSAGE()  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION FinalizarReserva;  
		END CATCH

		IF @@TRANCOUNT > 0  
			COMMIT TRANSACTION FinalizarReserva;  
	END

	SELECT @nCod AS nCod, @sMsj AS sMsj
END
GO
/****** Object:  StoredProcedure [dbo].[pa_reserva_pasajero]    Script Date: 28/06/2024 14:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:      Mario Robles
-- Create Date: 2024-06-26
-- Description: Insertar Pasajero en Reserva
CREATE PROCEDURE [dbo].[pa_reserva_pasajero] -- EXEC pa_resera_pasajero
	@nIdReserva INT,
	@bPrincipal BIT,
	@sDNI VARCHAR(8),
	@sPasaporte VARCHAR(11),
	@sApellidoP VARCHAR(100),
	@sApellidoM VARCHAR(100),
	@sPriNombre VARCHAR(100),
	@sSegNombre VARCHAR(100),
	@sCelular VARCHAR(9),
	@sCorreo VARCHAR(100),
	@dFechaNacimiento DATE
AS
BEGIN	
	DECLARE @nCod INT, @sMsj VARCHAR(MAX)
	DECLARE @bValido BIT = 1
	DECLARE @nCant INT

	SELECT
		@nCant = (R.nCantidadPax - COUNT(RP.nIdPasajero))
	FROM
		Reserva R
		LEFT JOIN
		Reserva_Pasajero RP ON RP.nIdReserva = R.nIdReserva
	WHERE
		R.nIdReserva = @nIdReserva
	GROUP BY
		R.nIdReserva,
		R.nCantidadPax

	IF(@nCant = 0)
	BEGIN
		SET @bValido = 0
		SET @nCod = 0
		SET @sMsj = 'Ya no se pueden registrar pasajeros en la reserva.'
	END
	
	IF(@bValido = 1)
	BEGIN
		BEGIN TRANSACTION InsReservaPasajero
  		BEGIN TRY 
			DECLARE @nIdPasajero INT

			IF(@sDNI IS NOT NULL)
			BEGIN
				SELECT @nIdPasajero = nIdPasajero FROM Pasajero WHERE sDNI = @sDNI
			END

			IF(@sPasaporte IS NOT NULL)
			BEGIN
				SELECT @nIdPasajero = nIdPasajero FROM Pasajero WHERE sPasaporte = @sPasaporte
			END
			
			IF(@nIdPasajero IS NULL)
			BEGIN
				INSERT INTO Pasajero
				(
					sDNI
					,sPasaporte
					,sApellidoP
					,sApellidoM
					,sPriNombre
					,sSegNombre
					,sCelular
					,sCorreo
					,dFechaNacimiento		
				)
				VALUES
				(
					@sDNI
					,@sPasaporte
					,@sApellidoP
					,@sApellidoM
					,@sPriNombre
					,@sSegNombre
					,@sCelular
					,@sCorreo
					,@dFechaNacimiento
				)
				
				SELECT @nIdPasajero = scope_identity()
			END
			ELSE
			BEGIN
				UPDATE Pasajero
				SET
					sApellidoP = @sApellidoP
					,sApellidoM = @sApellidoM
					,sPriNombre = @sPriNombre
					,sSegNombre = @sSegNombre
					,sCelular = @sCelular
					,sCorreo = @sCorreo
					,dFechaNacimiento = @dFechaNacimiento
				WHERE
					nIdPasajero = @nIdPasajero
			END
		
			INSERT INTO Reserva_Pasajero 
			(
				nIdReserva
				,nIdPasajero
				,bPrincipal
			) 
			VALUES 
			(
				@nIdReserva, 
				@nIdPasajero, 
				@bPrincipal
			)

			SELECT @nCod = @nIdPasajero
			SET @sMsj = 'Pasajero registrado.'

		END TRY
		BEGIN CATCH
			SET @nCod = 0;
			SELECT @sMsj = ERROR_MESSAGE()  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION InsReservaPasajero;  
		END CATCH

		IF @@TRANCOUNT > 0  
			COMMIT TRANSACTION InsReservaPasajero;  
	END

	SELECT @nCod AS nCod, @sMsj AS sMsj
END
GO
/****** Object:  StoredProcedure [dbo].[pa_ruta]    Script Date: 28/06/2024 14:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:      Mario Robles
-- Create Date: 2024-06-26
-- Description: Obtener Origen de Ruta
CREATE PROCEDURE [dbo].[pa_ruta] -- EXEC pa_ruta
AS
BEGIN
    SELECT DISTINCT
		CO.*
	FROM
		Ruta R
		INNER JOIN
		Ciudad CO ON CO.nIdCiudad = R.nIdCiudadOrigen
END
GO
/****** Object:  NumberedStoredProcedure [dbo].[pa_ruta];2    Script Date: 28/06/2024 14:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:      Mario Robles
-- Create Date: 2024-06-26
-- Description: Obtener Origen de Ruta
CREATE PROCEDURE [dbo].[pa_ruta];2 -- EXEC pa_ruta;2 1
	@nIdCiudadOrigen INT
AS
BEGIN
    SELECT DISTINCT
		CD.*
	FROM
		Ruta R
		INNER JOIN
		Ciudad CD ON CD.nIdCiudad = R.nIdCiudadDestino
	WHERE
		R.nIdCiudadOrigen = @nIdCiudadOrigen
END
GO
/****** Object:  NumberedStoredProcedure [dbo].[pa_ruta];3    Script Date: 28/06/2024 14:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:      Mario Robles
-- Create Date: 2024-06-26
-- Description: Obtener Programación disponible para Ruta
CREATE PROCEDURE [dbo].[pa_ruta];3 -- EXEC pa_ruta;3 1, 2, 2, NULL
	@nIdCiudadOrigen INT,
	@nIdCiudadDestino INT,
	@nCantidadPax INT,
	@nIdProgramacionVueloIda INT
AS
BEGIN
    SELECT DISTINCT
		PV.*
	FROM
		Programacion_Vuelo PV
		INNER JOIN
		Ruta R ON R.nIdRuta = PV.nIdRuta
		INNER JOIN
		(
			SELECT
				PV.nIdProgramacionVuelo
				,A.nCapacidad - ISNULL(SUM(R.nCantidadPax), 0) AS nDisponibles
			FROM
				Programacion_Vuelo PV
				INNER JOIN
				Aeronave A ON A.nIdAeronave = PV.nIdAeronave
				LEFT JOIN
				Reserva_Programacion RP ON RP.nIdProgramacionVuelo = PV.nIdProgramacionVuelo
				LEFT JOIN
				Reserva R ON R.nIdReserva = RP.nIdReserva AND R.nIdEstado <> 3
			GROUP BY
				PV.nIdProgramacionVuelo
				,A.nCapacidad
		) Disp ON Disp.nIdProgramacionVuelo = PV.nIdProgramacionVuelo
	WHERE
		R.nIdCiudadOrigen = @nIdCiudadOrigen
		AND
		R.nIdCiudadDestino = @nIdCiudadDestino
		AND
		Disp.nDisponibles >= @nCantidadPax
		AND
		PV.dFechaProgramada > IIF(@nIdProgramacionVueloIda IS NULL, GETDATE(), (SELECT PVI.dFechaProgramada FROM Programacion_Vuelo PVI WHERE PVI.nIdProgramacionVuelo = @nIdProgramacionVueloIda))
END
GO
/****** Object:  NumberedStoredProcedure [dbo].[pa_ruta];4    Script Date: 28/06/2024 14:30:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:      Mario Robles
-- Create Date: 2024-06-26
-- Description: Obtener disponibilidad de asientos
CREATE PROCEDURE [dbo].[pa_ruta];4 -- EXEC pa_ruta;4 1, 1, NULL
	@nCantidadPax INT,
	@nIdProgramacionVueloIda INT,
	@nIdProgramacionVueloVuelta INT
AS
BEGIN
	DECLARE @nPrecioIda DECIMAL(11,2)
	DECLARE @nPrecioVuelta DECIMAL(11,2)

    SELECT
		@nPrecioIda = (PP.nPrecio)*@nCantidadPax
	FROM
		Programacion_Vuelo PV
		INNER JOIN
		Precio_Pasaje PP ON PP.nIdAeronave = PV.nIdAeronave AND PP.nIdRuta = PV.nIdRuta
	WHERE
		PV.nIdProgramacionVuelo = @nIdProgramacionVueloIda

	SELECT
		@nPrecioVuelta = (PP.nPrecio)*@nCantidadPax
	FROM
		Programacion_Vuelo PV
		INNER JOIN
		Precio_Pasaje PP ON PP.nIdAeronave = PV.nIdAeronave AND PP.nIdRuta = PV.nIdRuta
	WHERE
		PV.nIdProgramacionVuelo = @nIdProgramacionVueloVuelta

	SELECT (@nPrecioIda + ISNULL(@nPrecioVuelta, 0))
END
GO

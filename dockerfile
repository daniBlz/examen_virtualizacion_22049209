# Pull de la última versión oficial de Kali
  FROM kalilinux/kali-rolling

  # Información sobre la imagen
	LABEL authors = "danielblazquez 22049209"
	LABEL version = "1.0"
	LABEL description = "Dockerfile for a custom image of Kali Linux OS for the exam."
	
	# Actualizamos imagen y dependencias
	RUN apt-get update && apt-get upgrade -y
	
  # Instalamos los siguientes paquetes
  RUN apt-get install -y \
	    nmap \
      nano \
      python3 \
      python3-pip

  # Instalamos los paquetes de python3-pip
  RUN pip3 install jupyter
  RUN pip3 install pipenv
	
	# Establecemos credenciales para el OS
  ENV USER root
	ENV PASSWORD 22049209
	
	# Reducimos el tamaño de la imagen haciendo limpieza del buffer.
	RUN apt-get clean
	
	# Exponemos los puertos seleccionados
	EXPOSE 600 700
	
	# Ejecutar el siguiente comando cuando se inicie el container
    CMD ["bash"]

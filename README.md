# VariantDB

<p align="justify">
VariantDB is a variant annotation and comparison tool built to process genetic testing results, compare results between two individuals (a female and male couple) to identify any genetic risk factors.
</p>

<br />

<p align="justify">
Disclaimer: This workflow was custom built and may require modification for screening of other datasets. The workflow implements gnomAD_DB (https://github.com/KalinNonchev/gnomAD_DB) to query the gnomAD SQL database.
</p>

## Installation

## Running from a Macbook:

Install Anaconda Continuum with Jupyter Notebook for Mac:
https://www.anaconda.com/download

Go into the directory where VariantDB is located. 

From the command line:

1.	Run the following command:

	```console
	conda env create -f environment_step2.yml
	```
	
	This will create a conda environment, with dependencies, to run VariantDB.

2.	Run the following command to activate the environment:

	```console
	conda activate VariantDB
	```

3.	Run the following command to open Jupyter notebook:

	```console
	jupyter notebook
	```

4.	Open each notebook and run the workflows as required

5.	To exit Jupyter close the brower tab, use ctrl-C within jupyter notebook prompt to shut down jupyter and then to deactivate the environment, run the following command:

	```console
	conda deactivate
	```

## Running from Windows:

Install Anaconda Continuum with Jupyter Notebook for Windows:
https://www.anaconda.com/download

Go into the directory where VariantDB is located. 

From the command line:

1.	Run the following command:

	```console
	conda env create -f environment_step1.yml
	```console

	This will set up the initial environment.

2.	Run the following command to update the environment:
	
	```console
	conda env update -f environment_step2.yml
	```

	This will further update the environment with the required dependencies to run VariantDB.

3.	Run the following command to activate the environment:

	```console
	activate VariantDB
	```

4.	Run the following command to open Jupyter notebook:

	```console
	jupyter notebook
	```

5.	Open each notebook and run the workflows as required

6.	To exit Jupyter close the brower tab, use ctrl-C within jupyter notebook prompt to shut down jupyter and then to deactivate the environment, run the following command:

	```console
	conda deactivate
	```

## Running from Docker:

1.	Download and install Docker for your operating system: https://docs.docker.com/get-docker/

2.	From the VariantDB folder, run these commands:

	```console
	docker build -t variantdb .
	```

3.	Once the Docker build of VariantDB is installed, run:
	
	If running from Linux/Mac:

	```console	
	docker run -i -t -p 8888:8888 -w "${PWD}" -v "${PWD}":"${PWD}" variantdb
	```	

	If running from Windows:
	
	```console
	set pwd=%cd%
	set pwd=%pwd:C:=%
	set pwd=/c%pwd%
	set pwd=%pwd:\=/%
	```

	Then
	```console
	docker run -i --rm -t -p 8888:8888 -w %pwd% -v %pwd%:%pwd% variantdb
	```
	Note: The directory structure between the container and windows is different, that is why we need to manipulate the path using the series of set commands above.

4.	Once the docker container is deployed and running, run the following command within the container:
	
	```console
	jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
	```

	This will deploy jupyter notebook, but will only be accessible by manually directing your browser to the correct IP and port, as the docker container has no browser.

5.	Direct your browser to the URL starting with http://127.0.0.1:8888, displayed on the screen:

6.	Open each notebook and run the workflows as required.

7.	To exit Jupyter and exit the docker environment, close the brower tab, use ctrl-C within jupyter notebook prompt to shut down jupyter, and type ‘exit’ to exit out of the docker container.

## Uninstalling VariantDB from conda:

From the command line:

1.	First deactivate the environment, then run the following command:

	```console
	conda remove -n VariantDB --all
	```

	This will completely remove the conda environment.

## Uninstalling VariantDB from Docker:

1.	After exiting the docker container, as described above, from the Docker GUI, select the installed container and then select delete.

## Running the workflows

Note: If running from a Docker container, when setting any folder paths it would be best to place the gnomad SQLite database file within the VariantDB folder or within a sub folder. This is because of the mounted paths and the differences between directory structures between the Docker container and Windows.

### Step 1. Download Clinvar DB
	Run the Jupyter notebook download_clinvar.ipynb

### Step 2. Download gnomAD
	Run the the Jupyter notebook download_gnomad.ipynb.
	Note: You need to specify a download location for the gnomad SQLite database and will need at least 100Gb of space. If downloading within a Docker container, then it would be best to save the database in the VariantDB folder, or a sub folder such as VariantDB/gnomad_db/.

### Step 3. Run variantdb_parser.
	Place all input CSV files into the input_csv folder. Specify the location of gnomad database, internal database CSV, and genes of interest CSV file. The annotated CSV files will be generated and placed in the output_annotated_csv folder.

### Step 4. Run variant_compare.
	Specify the couples CSV pairing file in the input_couples_csv folder. Each paired annotated CSV file from the output_annotated_csv folder, will then be compared and a couples report generated in the output_couples_report folder.

## TODO write wrapper script with parameter lists to streamline the whole interface

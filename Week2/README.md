# START UP
## Öncelikle Docker'dan SQL Serverımızı ayağa kaldırıyoruz.

`docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=DockerSifre11" -p 1433:1433 --name sql1 --hostname sql1 -d mcr.microsoft.com/mssql/server:2019-latest`
![image](https://user-images.githubusercontent.com/34526335/164567758-77a08c3d-9468-4af9-90f6-af3fb43aa217.png)
## DBFirst Project Olucak

![image](https://user-images.githubusercontent.com/34526335/164567777-75be6040-2b8f-4753-9735-23b969d4ab8b.png)

## EF Ekliyoruz

`Scaffold-DbContext "server=localhost, 1433;user=sa;password=DockerSifre11;database=BookAuthor"Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models`

### GET api/Author
![image](https://user-images.githubusercontent.com/34526335/164568897-13412edb-5871-4f42-a00f-0fe78e54079b.png)

### GET /api/Author/{id}
![image](https://user-images.githubusercontent.com/34526335/164568975-0eab689a-36ee-49a4-8541-e8f4f42b79af.png)

### PUT /api/Author/{id}
![image](https://user-images.githubusercontent.com/34526335/164569024-1ef1e573-cdee-485c-9ee1-116a7f49f87f.png)

### POST api/Author
![image](https://user-images.githubusercontent.com/34526335/164569108-f0c44e6f-c5b9-4ccc-93b7-c070f30c6d50.png)

### DELETE /api/Author/{id}
![image](https://user-images.githubusercontent.com/34526335/164569241-43b2970e-00da-4b03-b94c-6bdec073f9a7.png)

Sadece Yazara bağlı bir book kaydı varsa silinemez. Exception Döndürmüyor.
Yeni eklediğimiz kayıtı da başarıyla sildik.


use('directorio_talento');
db.perfiles.find();

//Un documento en concreto
use('directorio_talento');
db.perfiles.find(
    {
        alumno: 'Cristobal Alejandro Loncón Cataldo'
    }
);


//Hoy veremos comparadores
//Operadores lógicos
use('directorio_talento');
db.empresas.insertMany(
    [
        {
            nombre : 'DuocUc', rubro: 'Educación', empleados: 156, 
            ciudad : 'Puerto Montt', 
            creado_por: 'Carlos Orellana'
        },
         {
            nombre : 'BurberKing', rubro: 'Comida Rápida', empleados: 25, 
            ciudad : 'Puerto Montt', 
            creado_por: 'Carlos Orellana'
        }
    ]
);


//JSON - JavaScript Object Notation
//XML
use('directorio_talento');
db.ofertas.insertMany(
    [
      {
        cargo : 'Cientifico de datos', 
        empresa : 'SpaceX', 
        modalidad: 'PREsencial', 
        sueldo : 15000000, 
        vacantes: 2, 
        requisitos: [
            'R',
            'Python',
            'PowerBI',
            'Excel',
            'Git'
        ], 
        activa: true, 
        creado_por: 'Carlos Orellana'
      },
      {
        cargo : 'Científico de datos', 
        empresa : 'Gobierno regional', 
        modalidad: 'presenCiAl', 
        sueldo : 1800000, 
        vacantes: 1, 
        requisitos: [
            {
                nombre: 'Python',
                seniority: 'semi-senior',
                bibliotecas: [
                    'Pandas',
                    'Numpy',
                    'Matplotlib',
                    'Pytorch'
                ]
            },
            {
                nombre: "Java",
                seniority : "senior",
                frameworks: ["Spring"]
            }
        ], 
        activa: true, 
        creado_por: 'Carlos Orellana'
      }    
    ]
);

//Operador igual a
use('directorio_talento');
db.ofertas.find(
    {
        sueldo : 20000000
    }
);

//Operador $GT
use('directorio_talento');
db.ofertas.find(
    {
        sueldo : {$gt : 10000000}
    }
);

//16920000
use('directorio_talento');
db.ofertas.find(
    {
        sueldo : {$gte : 16920000}
    }
);

//menor a
use('directorio_talento');
db.ofertas.find(
    {
        sueldo : {$lte : 500000}
    }
);

//Not equals
use('directorio_talento');
db.ofertas.find(
    {
        sueldo : {$ne : 500000}
    }
);

//Not in, para cadenas de texto
use('directorio_talento');
db.ofertas.find(
    {
        modalidad : {$nin : ['Presencial', 'precencial', 'presencial']}
    }
);


//Como me traigo todas las psoibles formas
//de presencial

//Operador igual a
use('directorio_talento');
db.ofertas.find(
    {
        modalidad : /presencial/i
    }
);

use('directorio_talento');
db.ofertas.find(
    {
        cargo : /^cient[ií]fico/i
    }
);
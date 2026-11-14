import 'reflect-metadata';
import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';
async function bootstrap(){const app=await NestFactory.create(AppModule);app.enableCors({origin:true});app.useGlobalPipes(new ValidationPipe({whitelist:true,forbidNonWhitelisted:true,transform:true}));const cfg=new DocumentBuilder().setTitle('Mis Recordatorios API').setVersion('1.0.0').build();SwaggerModule.setup('docs',app,SwaggerModule.createDocument(app,cfg));await app.listen(Number(process.env.PORT||3000),'0.0.0.0');}
bootstrap();
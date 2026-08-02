-- brennanCreateTable.sql
-- CSD430 - Create database and table for States data

CREATE DATABASE IF NOT EXISTS CSD430;
USE CSD430;

CREATE TABLE brennanstatesdata (
    state_id INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(50) NOT NULL,
    capital VARCHAR(50) NOT NULL,
    population INT NOT NULL,
    region VARCHAR(20) NOT NULL,
    year_admitted INT NOT NULL
);
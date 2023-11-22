## Pando2 Measure 

### Overview 

Pando2 Measure is a Ruby on Rails application designed for visualizing environmental data measurements. The application leverages Chart.js to display interactive charts, and Tailwind CSS for styling. It is built with Ruby 3.1.2 and Rails 7.0.8, and uses SQLite as the database. This application is also Dockerized for easy setup and deployment.
Features

1. Visualize environmental data (CO2, Humidity, etc.) in interactive charts.
2. Filter data based on room and measurement type.
3. Design with Tailwind CSS.

### Prerequisites

1. Docker and Docker Compose
2. Alternatively, Ruby 3.1.2 and Rails 7.0.8 if running without Docker

### Installation and Setup
Using Docker (Recommended)

1. Clone the repository:
   ```bash
   git clone https://github.com/francilobbie/pando2-measure.git
   cd pando2-measure

2. Build the Docker images:
   ```bash
   docker-compose build
   
3. Start the Docker containers:
   ```bash
   docker-compose up
   
4. Access the application at [http://localhost:3000](http://localhost:3000).

### Manual Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/francilobbie/pando2-measure.git
   cd pando2-measure

  2. Install dependencies:
     ```bash
     bundle install
3. Setup database:
   ```bash
   rails db:create db:migrate
   rails import:import_csvs
   
### Database Setup

After setting up the project, you'll need to populate the database with initial data. This project includes a custom Rake task that imports data from CSV files.

1. To run the import task, execute the following command:
    ```bash
    rails import:import_csvs

2. Start the Rails server:
   ```bash
   bin/dev

3. Access the application at [http://localhost:3000](http://localhost:3000).

### Usage

  Select a room and a parameter (e.g., CO2, VOCT) from the dropdown menus.
  Click on 'Mettre à jour' to view the corresponding data in a chart format.
  Hover over the chart to see detailed data points.

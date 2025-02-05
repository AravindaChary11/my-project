<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .calculator {
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        .calculator h1 {
            margin-bottom: 20px;
            color: #1d4ed8;
        }
        .calculator label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            text-align: left;
        }
        .calculator input, .calculator select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .calculator input[type="submit"] {
            background-color: #1d4ed8;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        .calculator input[type="submit"]:hover {
            background-color: #2563eb;
        }
        .result, .error {
            margin-top: 20px;
            font-size: 18px;
            padding: 15px;
            border-radius: 5px;
        }
        .result {
            background-color: #d1fae5;
            color: #065f46;
        }
        .error {
            background-color: #fee2e2;
            color: #b91c1c;
        }
    </style>
</head>
<body>
    <div class="calculator">
        <h1>Simple Calculator</h1>
        <form method="post">
            <label for="num1">Enter First Number:</label>
            <input type="number" name="num1" id="num1" required>

            <label for="num2">Enter Second Number:</label>
            <input type="number" name="num2" id="num2" required>

            <label for="operation">Choose Operation:</label>
            <select name="operation" id="operation" required>
                <option value="add">Add</option>
                <option value="subtract">Subtract</option>
                <option value="multiply">Multiply</option>
                <option value="divide">Divide</option>
            </select>

            <input type="submit" value="Calculate">
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String num1Str = request.getParameter("num1");
                String num2Str = request.getParameter("num2");
                String operation = request.getParameter("operation");

                double result = 0;
                boolean valid = true;
                String message = "";

                try {
                    double num1 = Double.parseDouble(num1Str);
                    double num2 = Double.parseDouble(num2Str);

                    switch (operation) {
                        case "add":
                            result = num1 + num2;
                            message = "Addition";
                            break;
                        case "subtract":
                            result = num1 - num2;
                            message = "Subtraction";
                            break;
                        case "multiply":
                            result = num1 * num2;
                            message = "Multiplication";
                            break;
                        case "divide":
                            if (num2 != 0) {
                                result = num1 / num2;
                                message = "Division";
                            } else {
                                message = "Error: Division by zero is not allowed.";
                                valid = false;
                            }
                            break;
                    }
                } catch (NumberFormatException e) {
                    message = "Invalid input. Please enter valid numbers.";
                    valid = false;
                }

                if (valid) {
        %>
        <div class="result">
            <p><strong>Operation:</strong> <%= message %></p>
            <p><strong>Result:</strong> <%= result %></p>
        </div>
        <%
                } else {
        %>
        <div class="error">
            <p><%= message %></p>
        </div>
        <%
                }
            }
        %>
    </div>
</body>
</html>

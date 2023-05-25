<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tic Tac Toe</title>
    <style>
        .board {
            display: flex;
            flex-wrap: wrap;
            width: 306px;
            height: 306px;
        }

        .cell {
            border: 1px solid #000;
            width: 100px;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 40px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Tic Tac Toe</h1>

    <div class="board">
        <%-- Cells --%>
        <% for (int i = 0; i < 9; i++) { %>
            <div class="cell" onclick="makeMove(<%= i%>)"></div>
        <% } %> 
    </div>


    <script>
        var currentPlayer = "X";
        var cells = document.getElementsByClassName("cell");

        function makeMove(cellIndex) {
            var cell = cells[cellIndex];
            if (cell.innerHTML === "") {
                cell.innerHTML = currentPlayer;
                cell.style.pointerEvents = "none"; // Disable further clicks on the cell
                checkWinner();
                currentPlayer = (currentPlayer === "X") ? "O" : "X";
            }
        }

        function checkWinner() {
            var winningCombinations = [
                [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
                [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
                [0, 4, 8], [2, 4, 6] // Diagonals
            ];

            for (var i = 0; i < winningCombinations.length; i++) {
                var combination = winningCombinations[i];
                var a = cells[combination[0]].innerHTML;
                var b = cells[combination[1]].innerHTML;
                var c = cells[combination[2]].innerHTML;

                if (a !== "" && a === b && a === c) {
                    alert("Player " + a + " wins!");
                    resetBoard();
                    return;
                }
            }

            if (isBoardFull()) {
                alert("It's a tie!");
                resetBoard();
            }
        }

        function resetBoard() {
            for (var i = 0; i < cells.length; i++) {
                cells[i].innerHTML = "";
                cells[i].style.pointerEvents = "auto";
            }
        }

        function isBoardFull() {
            for (var i = 0; i < cells.length; i++) {
                if (cells[i].innerHTML === "") {
                    return false;
                }
            }
            return true;
        }
        
    </script>
</body>
</html>

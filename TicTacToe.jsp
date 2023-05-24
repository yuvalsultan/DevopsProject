<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Tic Tac Toe</title>
<style>
table, td {
    border: 1px solid black;
    padding: 10px;
    text-align: center;
    font-size: 60px;
}
.center {
    margin: auto;
    width: 75%;
    padding: 20px;
}
</style>
</head>
<body>

<h2>Tic Tac Toe</h2>

<%
String[][] board = new String[3][3];
for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
        board[i][j] = "";
    }
}

String turn = "X";
if (request.getParameter("row") != null && request.getParameter("col") != null) {
    int row = Integer.parseInt(request.getParameter("row"));
    int col = Integer.parseInt(request.getParameter("col"));
    if (board[row][col].isEmpty()) {
        board[row][col] = turn;
        if (turn.equals("X")) {
            turn = "O";
        } else {
            turn = "X";
        }
    }
}
%>

<table>
<%
for (int i = 0; i < 3; i++) {
%>
    <tr>
    <%
    for (int j = 0; j < 3; j++) {
    %>
        <td>
            <a href="?row=<%=i%>&col=<%=j%>">
                <%=board[i][j]%>
            </a>
        </td>
    <%
    }
    %>
    </tr>
<%
}
%>
</table>

<%
String winner = "";
for (int i = 0; i < 3; i++) {
    if (board[i][0].equals(board[i][1]) && board[i][0].equals(board[i][2])
            && !board[i][0].equals("")) {
        winner = board[i][0];
        break;
    }
}
for (int i = 0; i < 3; i++) {
    if (board[0][i].equals(board[1][i]) && board[0][i].equals(board[2][i])
            && !board[0][i].equals("")) {
        winner = board[0][i];
        break;
    }
}
if (board[0][0].equals(board[1][1]) && board[0][0].equals(board[2][2])
        && !board[0][0].equals("")) {
    winner = board[0][0];
}
if (board[0][2].equals(board[1][1]) && board[0][2].equals(board[2][0])
        && !board[0][2].equals("")) {
    winner = board[0][2];
}
%>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/result">
        <html>
            <head>
                <style>
                    body {background: #acf3f3}

                    *{
                        box-sizing: border-box;
                    }

                    .form-io{
                        padding: 50px;
                        background-color: white;
                        width: 500px;
                        margin: auto;
                        margin-top: 275px;
                        margin-bottom: 275px;
                        border-style: solid;
                        border-radius: 10px;
                        text-align: center;
                        font-size: 24px;
                        font-family: Arial, sans-serif;
                    }

                    .textarea {
                        display: block;
                        width: 100%;
                        padding: 0 20px;
                        margin-bottom: 10px;
                        margin-top: 30px;
                        background: #E9EFF6;
                        line-height: 40px;
                        border-width: 0;
                        border-radius: 20px;
                        font-size: 20px;
                    }

                    .button {
                        margin-top: 20px;
                        background: #acf3f3;
                        border-bottom: 4px solid #78acac;
                        color: rgb(0, 0, 0);
                        font-size: 20px;
                        width: 50%;
                        border-radius: 20px;
                        height: 40px;   
                    }

                    table {
                        font-family: Arial, sans-serif;
                        font-size: 14px;
                        border-radius: 10px;
                        border-spacing: 0;
                        text-align: center;
                        width: 100%;
                        margin-top: 30px;
                        margin-bottom: 10px;
                    }

                    th {
                        background: #acf3f3;
                        color: rgb(0, 0, 0);
                        padding: 10px 20px;
                    }

                    th, td {
                        border-style: solid;
                        border-width: 0 1px 1px 0;
                        border-color: #93dddd;
                    }

                    th:first-child {
                        border-top-left-radius: 10px;
                    }

                    th:last-child {
                        border-top-right-radius: 10px;
                        border-right: none;
                    }

                    td {
                        padding: 10px 20px;
                        background: #e2ffff;
                    }

                    tr:last-child td:first-child {
                        border-bottom-left-radius: 10px;
                    }

                    tr:last-child td:last-child {
                        border-bottom-right-radius: 10px;
                    }

                </style>
            </head>
            <body>
                <div class="form-io">
                        <xsl:if test="count(element)=0">
                            <b>Ошибка ввода</b>
                        </xsl:if>
                        <xsl:if test="count(element)!=0">
                            <b>Результат</b>
                            <table>
                            <tr>
                                <th>Индекс</th>
                                <th>Число</th>
                                <th>Квадрат</th>
                            </tr>
                            <xsl:for-each select="element">
                                <tr>
                                <td><xsl:value-of select="index"/></td>
                                <td><xsl:value-of select="value"/></td>
                                <td><xsl:value-of select="square"/></td>
                                </tr>
                            </xsl:for-each>
                            </table>
                        </xsl:if>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
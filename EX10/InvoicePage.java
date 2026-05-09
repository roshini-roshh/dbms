package prj2;
import javax.swing.*;
import javax.swing.text.JTextComponent;

import java.awt.*;
import java.sql.*;

public class InvoicePage extends JFrame {

    JTextArea area;
    JButton printBtn = new JButton("Print");
    public InvoicePage(int orderId) {
        setTitle("Invoice");
        setSize(500,600);

        area = new JTextArea();
        area.setFont(new Font("Monospaced", Font.PLAIN, 14));
        area.setEditable(false);
        
        printBtn.addActionListener(e -> {
            try {
				area.print();
            } catch(Exception ex) {
                ex.printStackTrace();
            }
        });

        add(new JScrollPane(area));

        generateInvoice(orderId);
        printBtn.addActionListener(e -> {
            try {
				area.print();
            } catch(Exception ex) {
                ex.printStackTrace();
            }
        });


        setVisible(true);
    }

    void generateInvoice(int orderId) {
        try {
            Connection con = DBConnection.getConnection();

            StringBuilder invoice = new StringBuilder();

            // Header
            invoice.append("=========== INVOICE ===========\n");
            invoice.append("Order ID: ").append(orderId).append("\n");

            // Order Info
            PreparedStatement ps = con.prepareStatement(
                "SELECT order_date, total_amount FROM Orders WHERE order_id=?"
            );
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                invoice.append("Date: ").append(rs.getDate(1)).append("\n");
                invoice.append("Time:").append(rs.getTime(1)).append("\n");
                invoice.append("-----------------------------------\n");
            }

            // Items
            ps = con.prepareStatement(
                "SELECT p.product_name, oi.quantity, oi.price " +
                "FROM Order_Items oi JOIN Products p ON oi.product_id=p.product_id " +
                "WHERE oi.order_id=?"
            );
            ps.setInt(1, orderId);
            rs = ps.executeQuery();

            invoice.append(String.format("%-15s %-5s %-10s\n", "Product", "Qty", "Price"));
            invoice.append("-----------------------------------\n");

            double total = 0;

            while(rs.next()) {
                String name = rs.getString(1);
                int qty = rs.getInt(2);
                double price = rs.getDouble(3);

                double sub = qty * price;
                total += sub;

                invoice.append(String.format("%-15s %-5d %-10.2f\n", name, qty, sub));
            }
            
            invoice.append("-----------------------------------\n");
            invoice.append("TOTAL: ₹ ").append(String.format("%.2f", total)).append("\n");
            invoice.append("===================================\n");
            invoice.append("Thank you for shopping!\n");

            area.setText(invoice.toString());
            saveToFile(invoice.toString(), orderId);

        } catch(Exception e) {
            area.setText("Error generating invoice: " + e.getMessage());
        }
    }
    void saveToFile(String content, int orderId) {
        try {
            java.io.FileWriter fw = new java.io.FileWriter("Invoice_" + orderId + ".txt");
            fw.write(content);
            fw.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
}
}


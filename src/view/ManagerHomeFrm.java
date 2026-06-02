package view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import model.User;

public class ManagerHomeFrm extends JFrame {
    private User currentUser;
    private JButton btnManageDish;
    private JButton btnLogout;

    public ManagerHomeFrm(User currentUser) {
        this.currentUser = currentUser;
        initComponents();
    }

    private void initComponents() {
        setTitle("Màn hình chính quản lý");
        setSize(500, 250);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());

        JLabel lblWelcome = new JLabel("Xin chào: " + currentUser.getFullName() + " - " + currentUser.getPosition(), JLabel.CENTER);
        add(lblWelcome, BorderLayout.NORTH);

        JPanel panel = new JPanel(new FlowLayout());
        btnManageDish = new JButton("Quản lý món ăn");
        btnLogout = new JButton("Đăng xuất");
        panel.add(btnManageDish);
        panel.add(btnLogout);
        add(panel, BorderLayout.CENTER);

        btnManageDish.addActionListener(e -> {
            new ManageDishFrm().setVisible(true);
            dispose();
        });

        btnLogout.addActionListener(e -> {
            new LoginFrm().setVisible(true);
            dispose();
        });
    }
}

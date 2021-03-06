package servlet;

import dao.UserTempDAO;
import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.UserTemp;
import model.Usuario;
import org.apache.commons.mail.EmailException;
import util.CommonsMail;

/**
 *
 * @author eduardo
 */
@WebServlet(name = "EnviaEmailServlet", urlPatterns = {"/EnviaEmailServlet"})
public class EnviaEmailServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        List<Usuario> usuarios;

        if (!"".equals(req.getParameter("email")) && !"".equals(req.getParameter("nome")) && !"".equals(req.getParameter("senha"))) {
            Usuario usuario = new Usuario();

            usuario.setEmail(req.getParameter("email"));

            UsuarioDAO dao = new UsuarioDAO();

            usuarios = dao.buscar2(usuario);

            if (!usuarios.isEmpty()) {

                out.println("<html>");
                out.println("<head>");
                out.println("<title>Adopets</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<script language = 'JavaScript'>");
                out.println("    alert('Conta já existente, tente outra.'); window.location.href='../adopets/entrada/cadastro.html';");
                out.println(" </script>");
                out.println("</body>");
                out.println("</html>");
                out.close();

            } else {

                try {
                    UserTemp userTemp = new UserTemp();
                    userTemp.setEmail(req.getParameter("email"));
                    userTemp.setNome(req.getParameter("nome"));
                    userTemp.setSenha(req.getParameter("senha"));

                    String email2 = req.getParameter("email");
                    String codigo;
                    try {
                        MessageDigest m = MessageDigest.getInstance("MD5");

                        m.update(email2.getBytes(), 0, email2.length());

                        byte[] digest = m.digest();

                        codigo = new BigInteger(1, digest).toString(16);
                        userTemp.setCodigo(codigo);

                        UserTempDAO dao2 = new UserTempDAO();
                        dao2.inserir(userTemp);

                        System.out.println("Usuário temporário cadastrado.");

                        CommonsMail.enviarEmail(req.getParameter("email"), codigo);

                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Adopets</title>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<script language = 'JavaScript'>");
                        out.println("    alert('Enviamos código de confirmação de conta para o seu email!'); window.location.href='../adopets/entrada/cadastro.html';");
                        out.println(" </script>");
                        out.println("</body>");
                        out.println("</html>");
                        out.close();
                    } catch (NoSuchAlgorithmException e) {
                    }

                } catch (EmailException ex) {
                    Logger.getLogger(EnviaEmailServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

        }

    }

}
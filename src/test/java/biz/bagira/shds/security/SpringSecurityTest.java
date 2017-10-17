package biz.bagira.shds.security;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class SpringSecurityTest {

    private MockMvc mockMvc;
    @Autowired
    private WebApplicationContext context;

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders
                .webAppContextSetup(context)
                .apply(springSecurity())
                .build();
    }

    @Test
    @WithMockUser
    public void testAccessToAdminPage() throws Exception {
        this.mockMvc.perform(get("/admin"))
                .andExpect(status().isForbidden());

    }

    @Test
    @WithMockUser
    public void testAccessToIndexPage() throws Exception {
        this.mockMvc.perform(get("/index"))
                .andExpect(status().isOk());

    }

    @Test
    @WithMockUser(username="admin",roles={"USER","ADMIN"})
    public void testAccessToAdminPageWithRoleAdmin() throws Exception {
        this.mockMvc.perform(get("/admin"))
                .andExpect(status().isOk());

    }

}
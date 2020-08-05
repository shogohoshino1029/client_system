package models;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "clients")
@NamedQueries({
    @NamedQuery(
            name = "getAllClients",
            query = "SELECT c FROM Client AS c ORDER BY c.id DESC"
            ),
    @NamedQuery(
            name = "getReportCount",
            query = "SELECT COUNT(r) FROM Client AS r"
            ),
    @NamedQuery(
            name = "getMyAllClients",
            query = "SELECT c FROM Client AS c WHERE c.associate = :associate ORDER BY c.id DESC"
            ),
    @NamedQuery(
            name = "getMyClientsCount",
            query = "SELECT COUNT(c) FROM Client AS c WHERE c.associate = :associate"
            )
})
@Entity
public class Client {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "associate_id", nullable = false)
    private Associate associate;

    @Column(name = "client_date", nullable = false)
    private Date client_date;

    @Column(name = "title", length = 255, nullable = false)
    private String title;

    @Lob
    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Associate getAssociate() {
        return associate;
    }

    public void setEmployee(Associate associate) {
        this.associate = associate;
    }

    public Date getClient_date() {
        return client_date;
    }

    public void setClient_date(Date client_date) {
        this.client_date = client_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

}

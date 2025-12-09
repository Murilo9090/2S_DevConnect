using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace DevConnectTorlonii.Models;

[Table("tb_publicacao")]
public partial class TbPublicacao
{
    [Key]
    [Column("id_publicacao")]
    public int IdPublicacao { get; set; }

    [Column("descricao")]
    [StringLength(500)]
    public string? Descricao { get; set; }

    [Column("imagemUrl")]
    [StringLength(255)]
    public string ImagemUrl { get; set; } = null!;

    [Column("data_Publicacao")]
    public DateOnly DataPublicacao { get; set; }

    [Column("id_usuario")]
    public int? IdUsuario { get; set; }

    [ForeignKey("IdUsuario")]
    [InverseProperty("TbPublicacao")]
    public virtual TbUsuario? IdUsuarioNavigation { get; set; }

    [InverseProperty("IdPublicacaoNavigation")]
    public virtual ICollection<TbComentario> TbComentario { get; set; } = new List<TbComentario>();

    [InverseProperty("IdPublicacaoNavigation")]
    public virtual ICollection<TbCurtida> TbCurtida { get; set; } = new List<TbCurtida>();
}

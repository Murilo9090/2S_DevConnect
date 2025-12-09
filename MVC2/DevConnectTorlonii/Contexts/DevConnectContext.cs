using System;
using System.Collections.Generic;
using DevConnectTorlonii.Models;
using Microsoft.EntityFrameworkCore;

namespace DevConnectTorlonii.Contexts;

public partial class DevConnectContext : DbContext
{
    public DevConnectContext()
    {
    }

    public DevConnectContext(DbContextOptions<DevConnectContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TbComentario> TbComentario { get; set; }

    public virtual DbSet<TbCurtida> TbCurtida { get; set; }

    public virtual DbSet<TbPublicacao> TbPublicacao { get; set; }

    public virtual DbSet<TbUsuario> TbUsuario { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=DevCon_Windows");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TbComentario>(entity =>
        {
            entity.HasKey(e => e.IdComentario).HasName("PK__tb_comen__1BA6C6F41C9B39C0");

            entity.HasOne(d => d.IdPublicacaoNavigation).WithMany(p => p.TbComentario)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_coment__id_pu__5812160E");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbComentario)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_coment__id_us__59063A47");
        });

        modelBuilder.Entity<TbCurtida>(entity =>
        {
            entity.HasKey(e => e.IdCurtida).HasName("PK__tb_curti__0AC033CADA7FC095");

            entity.HasOne(d => d.IdPublicacaoNavigation).WithMany(p => p.TbCurtida)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_curtid__id_pu__5535A963");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbCurtida)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_curtid__id_us__5441852A");
        });

        modelBuilder.Entity<TbPublicacao>(entity =>
        {
            entity.HasKey(e => e.IdPublicacao).HasName("PK__tb_publi__EA81BC3A73F3C627");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbPublicacao).HasConstraintName("FK__tb_public__id_us__5070F446");
        });

        modelBuilder.Entity<TbUsuario>(entity =>
        {
            entity.HasKey(e => e.IdUsuario).HasName("PK__tb_usuar__4E3E04AD0C684E7B");

            entity.HasMany(d => d.IdUsuarioSeguido).WithMany(p => p.IdUsuarioSeguidor)
                .UsingEntity<Dictionary<string, object>>(
                    "TbSeguidor",
                    r => r.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguido")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_seguid__id_us__1AD3FDA4"),
                    l => l.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguidor")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_seguid__id_us__19DFD96B"),
                    j =>
                    {
                        j.HasKey("IdUsuarioSeguidor", "IdUsuarioSeguido").HasName("PK__tb_segui__1132BEEC3EBB63FE");
                        j.ToTable("tb_seguidor");
                        j.IndexerProperty<int>("IdUsuarioSeguidor").HasColumnName("id_usuario_seguidor");
                        j.IndexerProperty<int>("IdUsuarioSeguido").HasColumnName("id_usuario_seguido");
                    });

            entity.HasMany(d => d.IdUsuarioSeguidor).WithMany(p => p.IdUsuarioSeguido)
                .UsingEntity<Dictionary<string, object>>(
                    "TbSeguidor",
                    r => r.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguidor")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_seguid__id_us__19DFD96B"),
                    l => l.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguido")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_seguid__id_us__1AD3FDA4"),
                    j =>
                    {
                        j.HasKey("IdUsuarioSeguidor", "IdUsuarioSeguido").HasName("PK__tb_segui__1132BEEC3EBB63FE");
                        j.ToTable("tb_seguidor");
                        j.IndexerProperty<int>("IdUsuarioSeguidor").HasColumnName("id_usuario_seguidor");
                        j.IndexerProperty<int>("IdUsuarioSeguido").HasColumnName("id_usuario_seguido");
                    });
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

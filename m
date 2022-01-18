Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9fpH-0005f5-9N
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 23:10:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9fpF-0005cx-93
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 23:10:29 -0500
Received: from [2607:f8b0:4864:20::62d] (port=34754
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9fpA-0002Gy-Aq
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 23:10:28 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a7so20471553plh.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 20:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GHd8dHGoi4128grtqPFh6ljfVKpEmfirx0BzMHaY1aM=;
 b=PQ9BBbigDTAvkVoXfe2EP+Kbz3OR/XjZiXdFpB8CrE1cUK1W/74X50BVevObSEX+oT
 G86OyixmCuBt6nmbn/iYGy/KvrnueAn6KN61SDyqVuYZX8DnUx2S1/XpBnWEwbFrJXej
 wrntTlxWocj7zZio6jJTHE7jDesZwtNcB8TdP4kjcCJQcFTSgi6Wa45Q7rfwnhSFTU6O
 RvuwgM+b1SWH4HknPS4T9RmLI4LO+6j0B/85bmox0GYvKKHCOWcNgs75aGCTVczPGbyy
 WMwNn+Gg17XQmKgcr2m/1ANnApGwhoMfmqq3ipypmPmfJEQx8d8YCQlFAbbyNAcZIfcQ
 /3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GHd8dHGoi4128grtqPFh6ljfVKpEmfirx0BzMHaY1aM=;
 b=YcgHDU//dmfOIzyQINLUfYDcsUDV0JLOQDi2N3hp9uJm9c9ag/HKB312l3T37ErZTA
 d6dH3S+FeVgNlz4KDLRyiDu+sJhdOqKzuwMfK7W23p+Jw2c/pfA82hIZoLZbLefHkaPU
 oIajpqxS70WtqL4hG8AhXB7xRWIOWS5c4YuVU+uJHAn5OwxY2htqItI6MudjFiRA18Y1
 tu+IwVH9VMoFw2PHdkphbTvRVRBaZLsi0HuyabOb1cTS0XYVaiSFzlWbBu2yQxe5kVGA
 Jd/8bbUXyOHPX4YZO3lGm4H9NDmqv8q0Em4LOT/SU/NYCSYaGVX0UkCJCgnXNV767A4e
 /Alw==
X-Gm-Message-State: AOAM531HsHZfEYMdqsztdLOmbiWaSu2Pj4LhJkNMvJ6SKyvK6VJV82TJ
 EAT6+IwZgIjQuk9snkvrDg3RWoHxIfv04WTQ
X-Google-Smtp-Source: ABdhPJxUOgFapdcYZPmn+8h346w0TeZNM7n44LlQcg6WvMOGP5REFWdx6qOlYVYKOxeY2zuTquSGpQ==
X-Received: by 2002:a17:902:6ac4:b0:14a:b3e8:6a14 with SMTP id
 i4-20020a1709026ac400b0014ab3e86a14mr9281927plt.163.1642479022508; 
 Mon, 17 Jan 2022 20:10:22 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50])
 by smtp.gmail.com with ESMTPSA id n12sm8288201pgs.24.2022.01.17.20.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 20:10:21 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id
 w12-20020a17090a528c00b001b276aa3aabso1147606pjh.0; 
 Mon, 17 Jan 2022 20:10:21 -0800 (PST)
X-Received: by 2002:a17:90b:224a:: with SMTP id
 hk10mr10207042pjb.83.1642479020942; 
 Mon, 17 Jan 2022 20:10:20 -0800 (PST)
MIME-Version: 1.0
References: <20220117132826.426418-1-anup@brainfault.org>
 <20220117132826.426418-16-anup@brainfault.org>
In-Reply-To: <20220117132826.426418-16-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 18 Jan 2022 12:10:10 +0800
X-Gmail-Original-Message-ID: <CANzO1D3wsbRVW8misi9L+4U2Q548ba4fmnZixOD57gR3k_Wsuw@mail.gmail.com>
Message-ID: <CANzO1D3wsbRVW8misi9L+4U2Q548ba4fmnZixOD57gR3k_Wsuw@mail.gmail.com>
Subject: Re: [PATCH v7 15/23] target/riscv: Implement AIA IMSIC interface CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="0000000000009828f005d5d372ce"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jan 2022 04:10:29 -0000

--0000000000009828f005d5d372ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2022=E5=B9=B41=E6=9C=8817=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:18=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA specification defines IMSIC interface CSRs for easy access
> to the per-HART IMSIC registers without using indirect xiselect and
> xireg CSRs. This patch implements the AIA IMSIC interface CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  target/riscv/csr.c | 203 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 203 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 7a787d3a3f..68e6009006 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -923,6 +923,16 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, in=
t
> csrno)
>          return CSR_VSISELECT;
>      case CSR_SIREG:
>          return CSR_VSIREG;
> +    case CSR_SSETEIPNUM:
> +        return CSR_VSSETEIPNUM;
> +    case CSR_SCLREIPNUM:
> +        return CSR_VSCLREIPNUM;
> +    case CSR_SSETEIENUM:
> +        return CSR_VSSETEIENUM;
> +    case CSR_SCLREIENUM:
> +        return CSR_VSCLREIENUM;
> +    case CSR_STOPEI:
> +        return CSR_VSTOPEI;
>      default:
>          return csrno;
>      };
> @@ -1075,6 +1085,178 @@ done:
>      return RISCV_EXCP_NONE;
>  }
>
> +static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong
> *val,
> +                            target_ulong new_val, target_ulong wr_mask)
> +{
> +    int ret =3D -EINVAL;
> +    bool set, pend, virt;
> +    target_ulong priv, isel, vgein, xlen, nval, wmask;
> +
> +    /* Translate CSR number for VS-mode */
> +    csrno =3D aia_xlate_vs_csrno(env, csrno);
> +
> +    /* Decode register details from CSR number */
> +    virt =3D set =3D pend =3D false;
> +    switch (csrno) {
> +    case CSR_MSETEIPNUM:
> +        priv =3D PRV_M;
> +        set =3D true;
> +        pend =3D true;
> +        break;
> +    case CSR_MCLREIPNUM:
> +        priv =3D PRV_M;
> +        pend =3D true;
> +        break;
> +    case CSR_MSETEIENUM:
> +        priv =3D PRV_M;
> +        set =3D true;
> +        break;
> +    case CSR_MCLREIENUM:
> +        priv =3D PRV_M;
> +        break;
> +    case CSR_SSETEIPNUM:
> +        priv =3D PRV_S;
> +        set =3D true;
> +        pend =3D true;
> +        break;
> +    case CSR_SCLREIPNUM:
> +        priv =3D PRV_S;
> +        pend =3D true;
> +        break;
> +    case CSR_SSETEIENUM:
> +        priv =3D PRV_S;
> +        set =3D true;
> +        break;
> +    case CSR_SCLREIENUM:
> +        priv =3D PRV_S;
> +        break;
> +    case CSR_VSSETEIPNUM:
> +        priv =3D PRV_S;
> +        virt =3D true;
> +        set =3D true;
> +        pend =3D true;
> +        break;
> +    case CSR_VSCLREIPNUM:
> +        priv =3D PRV_S;
> +        virt =3D true;
> +        pend =3D true;
> +        break;
> +    case CSR_VSSETEIENUM:
> +        priv =3D PRV_S;
> +        virt =3D true;
> +        set =3D true;
> +        break;
> +    case CSR_VSCLREIENUM:
> +        priv =3D PRV_S;
> +        virt =3D true;
> +        break;
> +    default:
> +         goto done;
> +    };
> +
> +    /* IMSIC CSRs only available when machine implements IMSIC. */
> +    if (!env->aia_ireg_rmw_fn[priv]) {
> +        goto done;
> +    }
> +
> +    /* Find the selected guest interrupt file */
> +    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
> +
> +    /* Selected guest interrupt file should be valid */
> +    if (virt && (!vgein || env->geilen < vgein)) {
> +        goto done;
> +    }
> +
> +    /* Set/Clear CSRs always read zero */
> +    if (val) {
> +        *val =3D 0;
> +    }
> +
> +    if (wr_mask) {
> +        /* Get interrupt number */
> +        new_val &=3D wr_mask;
> +
> +        /* Find target interrupt pending/enable register */
> +        xlen =3D riscv_cpu_mxl_bits(env);
> +        isel =3D (new_val / xlen);
> +        isel *=3D (xlen / IMSIC_EIPx_BITS);
> +        isel +=3D (pend) ? ISELECT_IMSIC_EIP0 : ISELECT_IMSIC_EIE0;
> +
> +        /* Find the interrupt bit to be set/clear */
> +        wmask =3D ((target_ulong)1) << (new_val % xlen);
> +        nval =3D (set) ? wmask : 0;
> +
> +        /* Call machine specific IMSIC register emulation */
> +        ret =3D env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv=
],
> +                                         AIA_MAKE_IREG(isel, priv, virt,
> +                                                       vgein, xlen),
> +                                         NULL, nval, wmask);
> +    } else {
> +        ret =3D 0;
> +    }
> +
> +done:
> +    if (ret) {
> +        return (riscv_cpu_virt_enabled(env) && virt) ?
> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT :
> RISCV_EXCP_ILLEGAL_INST;
> +    }
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
> +                      target_ulong new_val, target_ulong wr_mask)
> +{
> +    bool virt;
> +    int ret =3D -EINVAL;
> +    target_ulong priv, vgein;
> +
> +    /* Translate CSR number for VS-mode */
> +    csrno =3D aia_xlate_vs_csrno(env, csrno);
> +
> +    /* Decode register details from CSR number */
> +    virt =3D false;
> +    switch (csrno) {
> +    case CSR_MTOPEI:
> +        priv =3D PRV_M;
> +        break;
> +    case CSR_STOPEI:
> +        priv =3D PRV_S;
> +        break;
> +    case CSR_VSTOPEI:
> +        priv =3D PRV_S;
> +        virt =3D true;
> +        break;
> +    default:
> +        goto done;
> +    };
> +
> +    /* IMSIC CSRs only available when machine implements IMSIC. */
> +    if (!env->aia_ireg_rmw_fn[priv]) {
> +        goto done;
> +    }
> +
> +    /* Find the selected guest interrupt file */
> +    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
> +
> +    /* Selected guest interrupt file should be valid */
> +    if (virt && (!vgein || env->geilen < vgein)) {
> +        goto done;
> +    }
> +
> +    /* Call machine specific IMSIC register emulation for TOPEI */
> +    ret =3D env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
> +                    AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgein=
,
> +                                  riscv_cpu_mxl_bits(env)),
> +                    val, new_val, wr_mask);
> +
> +done:
> +    if (ret) {
> +        return (riscv_cpu_virt_enabled(env) && virt) ?
> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT :
> RISCV_EXCP_ILLEGAL_INST;
> +    }
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> @@ -2856,6 +3038,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      /* Machine-Level Interrupts (AIA) */
>      [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
>
> +    /* Machine-Level IMSIC Interface (AIA) */
> +    [CSR_MSETEIPNUM] =3D { "mseteipnum", aia_any, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_MCLREIPNUM] =3D { "mclreipnum", aia_any, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_MSETEIENUM] =3D { "mseteienum", aia_any, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_MCLREIENUM] =3D { "mclreienum", aia_any, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_MTOPEI]     =3D { "mtopei",     aia_any, NULL, NULL, rmw_xtopei=
 },
> +
>      /* Virtual Interrupts for Supervisor Level (AIA) */
>      [CSR_MVIEN]      =3D { "mvien", aia_any, read_zero, write_ignore },
>      [CSR_MVIP]       =3D { "mvip",  aia_any, read_zero, write_ignore },
> @@ -2892,6 +3081,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      /* Supervisor-Level Interrupts (AIA) */
>      [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
>
> +    /* Supervisor-Level IMSIC Interface (AIA) */
> +    [CSR_SSETEIPNUM] =3D { "sseteipnum", aia_smode, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_SCLREIPNUM] =3D { "sclreipnum", aia_smode, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_SSETEIENUM] =3D { "sseteienum", aia_smode, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_SCLREIENUM] =3D { "sclreienum", aia_smode, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_STOPEI]     =3D { "stopei",     aia_smode, NULL, NULL, rmw_xtop=
ei
> },
> +
>      /* Supervisor-Level High-Half CSRs (AIA) */
>      [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh }=
,
>      [CSR_SIPH]       =3D { "siph",   aia_smode32, NULL, NULL, rmw_siph }=
,
> @@ -2937,6 +3133,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      /* VS-Level Interrupts (H-extension with AIA) */
>      [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
>
> +    /* VS-Level IMSIC Interface (H-extension with AIA) */
> +    [CSR_VSSETEIPNUM] =3D { "vsseteipnum", aia_hmode, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_VSCLREIPNUM] =3D { "vsclreipnum", aia_hmode, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_VSSETEIENUM] =3D { "vsseteienum", aia_hmode, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_VSCLREIENUM] =3D { "vsclreienum", aia_hmode, NULL, NULL,
> rmw_xsetclreinum },
> +    [CSR_VSTOPEI]     =3D { "vstopei",     aia_hmode, NULL, NULL,
> rmw_xtopei },
> +
>      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>      [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL,
> rmw_hidelegh },
>      [CSR_HVIENH]      =3D { "hvienh",      aia_hmode32, read_zero,
> write_ignore },
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--0000000000009828f005d5d372ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2022=E5=B9=B41=E6=9C=881=
7=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:18=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The AIA specification defines IMSIC interface CSRs for easy access<br>
to the per-HART IMSIC registers without using indirect xiselect and<br>
xireg CSRs. This patch implements the AIA IMSIC interface CSRs.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/csr.c | 203 ++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 203 insertions(+)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 7a787d3a3f..68e6009006 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -923,6 +923,16 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, int =
csrno)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return CSR_VSISELECT;<br>
=C2=A0 =C2=A0 =C2=A0case CSR_SIREG:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return CSR_VSIREG;<br>
+=C2=A0 =C2=A0 case CSR_SSETEIPNUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return CSR_VSSETEIPNUM;<br>
+=C2=A0 =C2=A0 case CSR_SCLREIPNUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return CSR_VSCLREIPNUM;<br>
+=C2=A0 =C2=A0 case CSR_SSETEIENUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return CSR_VSSETEIENUM;<br>
+=C2=A0 =C2=A0 case CSR_SCLREIENUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return CSR_VSCLREIENUM;<br>
+=C2=A0 =C2=A0 case CSR_STOPEI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return CSR_VSTOPEI;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return csrno;<br>
=C2=A0 =C2=A0 =C2=A0};<br>
@@ -1075,6 +1085,178 @@ done:<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *v=
al,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, target_ulong wr_mask)<br>
+{<br>
+=C2=A0 =C2=A0 int ret =3D -EINVAL;<br>
+=C2=A0 =C2=A0 bool set, pend, virt;<br>
+=C2=A0 =C2=A0 target_ulong priv, isel, vgein, xlen, nval, wmask;<br>
+<br>
+=C2=A0 =C2=A0 /* Translate CSR number for VS-mode */<br>
+=C2=A0 =C2=A0 csrno =3D aia_xlate_vs_csrno(env, csrno);<br>
+<br>
+=C2=A0 =C2=A0 /* Decode register details from CSR number */<br>
+=C2=A0 =C2=A0 virt =3D set =3D pend =3D false;<br>
+=C2=A0 =C2=A0 switch (csrno) {<br>
+=C2=A0 =C2=A0 case CSR_MSETEIPNUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_M;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pend =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_MCLREIPNUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_M;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pend =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_MSETEIENUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_M;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_MCLREIENUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_M;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_SSETEIPNUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pend =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_SCLREIPNUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pend =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_SSETEIENUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_SCLREIENUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_VSSETEIPNUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pend =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_VSCLREIPNUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pend =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_VSSETEIENUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_VSCLREIENUM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 /* IMSIC CSRs only available when machine implements IMSIC. =
*/<br>
+=C2=A0 =C2=A0 if (!env-&gt;aia_ireg_rmw_fn[priv]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Find the selected guest interrupt file */<br>
+=C2=A0 =C2=A0 vgein =3D (virt) ? get_field(env-&gt;hstatus, HSTATUS_VGEIN)=
 : 0;<br>
+<br>
+=C2=A0 =C2=A0 /* Selected guest interrupt file should be valid */<br>
+=C2=A0 =C2=A0 if (virt &amp;&amp; (!vgein || env-&gt;geilen &lt; vgein)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Set/Clear CSRs always read zero */<br>
+=C2=A0 =C2=A0 if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (wr_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get interrupt number */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_val &amp;=3D wr_mask;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Find target interrupt pending/enable regist=
er */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xlen =3D riscv_cpu_mxl_bits(env);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 isel =3D (new_val / xlen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 isel *=3D (xlen / IMSIC_EIPx_BITS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 isel +=3D (pend) ? ISELECT_IMSIC_EIP0 : ISELEC=
T_IMSIC_EIE0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Find the interrupt bit to be set/clear */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wmask =3D ((target_ulong)1) &lt;&lt; (new_val =
% xlen);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nval =3D (set) ? wmask : 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Call machine specific IMSIC register emulat=
ion */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D env-&gt;aia_ireg_rmw_fn[priv](env-&gt;=
aia_ireg_rmw_fn_arg[priv],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AI=
A_MAKE_IREG(isel, priv, virt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vgein, xlen),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NU=
LL, nval, wmask);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+done:<br>
+=C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (riscv_cpu_virt_enabled(env) &amp;&amp;=
 virt) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RISCV_EXCP_VIRT_INS=
TRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 target_ulong new_val, target_ulong wr_mask)<br>
+{<br>
+=C2=A0 =C2=A0 bool virt;<br>
+=C2=A0 =C2=A0 int ret =3D -EINVAL;<br>
+=C2=A0 =C2=A0 target_ulong priv, vgein;<br>
+<br>
+=C2=A0 =C2=A0 /* Translate CSR number for VS-mode */<br>
+=C2=A0 =C2=A0 csrno =3D aia_xlate_vs_csrno(env, csrno);<br>
+<br>
+=C2=A0 =C2=A0 /* Decode register details from CSR number */<br>
+=C2=A0 =C2=A0 virt =3D false;<br>
+=C2=A0 =C2=A0 switch (csrno) {<br>
+=C2=A0 =C2=A0 case CSR_MTOPEI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_M;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_STOPEI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_VSTOPEI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 /* IMSIC CSRs only available when machine implements IMSIC. =
*/<br>
+=C2=A0 =C2=A0 if (!env-&gt;aia_ireg_rmw_fn[priv]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Find the selected guest interrupt file */<br>
+=C2=A0 =C2=A0 vgein =3D (virt) ? get_field(env-&gt;hstatus, HSTATUS_VGEIN)=
 : 0;<br>
+<br>
+=C2=A0 =C2=A0 /* Selected guest interrupt file should be valid */<br>
+=C2=A0 =C2=A0 if (virt &amp;&amp; (!vgein || env-&gt;geilen &lt; vgein)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Call machine specific IMSIC register emulation for TOPEI =
*/<br>
+=C2=A0 =C2=A0 ret =3D env-&gt;aia_ireg_rmw_fn[priv](env-&gt;aia_ireg_rmw_f=
n_arg[priv],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AIA_=
MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgein,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_mxl_bits(env)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val,=
 new_val, wr_mask);<br>
+<br>
+done:<br>
+=C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (riscv_cpu_virt_enabled(env) &amp;&amp;=
 virt) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RISCV_EXCP_VIRT_INS=
TRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
=C2=A0static RISCVException read_mtvec(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
=C2=A0{<br>
@@ -2856,6 +3038,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0/* Machine-Level Interrupts (AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MTOPI]=C2=A0 =C2=A0 =3D { &quot;mtopi&quot;,=C2=A0=
 =C2=A0 aia_any,=C2=A0 =C2=A0read_mtopi },<br>
<br>
+=C2=A0 =C2=A0 /* Machine-Level IMSIC Interface (AIA) */<br>
+=C2=A0 =C2=A0 [CSR_MSETEIPNUM] =3D { &quot;mseteipnum&quot;, aia_any, NULL=
, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_MCLREIPNUM] =3D { &quot;mclreipnum&quot;, aia_any, NULL=
, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_MSETEIENUM] =3D { &quot;mseteienum&quot;, aia_any, NULL=
, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_MCLREIENUM] =3D { &quot;mclreienum&quot;, aia_any, NULL=
, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_MTOPEI]=C2=A0 =C2=A0 =C2=A0=3D { &quot;mtopei&quot;,=C2=
=A0 =C2=A0 =C2=A0aia_any, NULL, NULL, rmw_xtopei },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Virtual Interrupts for Supervisor Level (AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MVIEN]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mvien&quot;=
, aia_any, read_zero, write_ignore },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MVIP]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;mvip&q=
uot;,=C2=A0 aia_any, read_zero, write_ignore },<br>
@@ -2892,6 +3081,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0/* Supervisor-Level Interrupts (AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_STOPI]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;stopi&quot;=
,=C2=A0 =C2=A0 =C2=A0 aia_smode, read_stopi },<br>
<br>
+=C2=A0 =C2=A0 /* Supervisor-Level IMSIC Interface (AIA) */<br>
+=C2=A0 =C2=A0 [CSR_SSETEIPNUM] =3D { &quot;sseteipnum&quot;, aia_smode, NU=
LL, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_SCLREIPNUM] =3D { &quot;sclreipnum&quot;, aia_smode, NU=
LL, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_SSETEIENUM] =3D { &quot;sseteienum&quot;, aia_smode, NU=
LL, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_SCLREIENUM] =3D { &quot;sclreienum&quot;, aia_smode, NU=
LL, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_STOPEI]=C2=A0 =C2=A0 =C2=A0=3D { &quot;stopei&quot;,=C2=
=A0 =C2=A0 =C2=A0aia_smode, NULL, NULL, rmw_xtopei },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Supervisor-Level High-Half CSRs (AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_SIEH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;sieh&q=
uot;,=C2=A0 =C2=A0aia_smode32, NULL, NULL, rmw_sieh },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_SIPH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;siph&q=
uot;,=C2=A0 =C2=A0aia_smode32, NULL, NULL, rmw_siph },<br>
@@ -2937,6 +3133,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0/* VS-Level Interrupts (H-extension with AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_VSTOPI]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;vstopi&quo=
t;,=C2=A0 =C2=A0 =C2=A0 aia_hmode, read_vstopi },<br>
<br>
+=C2=A0 =C2=A0 /* VS-Level IMSIC Interface (H-extension with AIA) */<br>
+=C2=A0 =C2=A0 [CSR_VSSETEIPNUM] =3D { &quot;vsseteipnum&quot;, aia_hmode, =
NULL, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_VSCLREIPNUM] =3D { &quot;vsclreipnum&quot;, aia_hmode, =
NULL, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_VSSETEIENUM] =3D { &quot;vsseteienum&quot;, aia_hmode, =
NULL, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_VSCLREIENUM] =3D { &quot;vsclreienum&quot;, aia_hmode, =
NULL, NULL, rmw_xsetclreinum },<br>
+=C2=A0 =C2=A0 [CSR_VSTOPEI]=C2=A0 =C2=A0 =C2=A0=3D { &quot;vstopei&quot;,=
=C2=A0 =C2=A0 =C2=A0aia_hmode, NULL, NULL, rmw_xtopei },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Hypervisor and VS-Level High-Half CSRs (H-extension =
with AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HIDELEGH]=C2=A0 =C2=A0 =3D { &quot;hidelegh&quot;,=
=C2=A0 =C2=A0 aia_hmode32, NULL, NULL, rmw_hidelegh },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HVIENH]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;hvienh&quo=
t;,=C2=A0 =C2=A0 =C2=A0 aia_hmode32, read_zero, write_ignore },<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--0000000000009828f005d5d372ce--


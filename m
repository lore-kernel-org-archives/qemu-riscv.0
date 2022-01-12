Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7gfw-0006WO-6Z
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 11:40:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7gfi-0006Su-MX
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 11:40:36 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37710
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7gfb-0007mF-IO
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 11:40:23 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so13234075pjj.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 08:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CfWntzpwH15J5ehPH1meNChk1iAXVBiZt+MbfCMbQY0=;
 b=J5XkA37Ati1IX+30f2ZWc2a8guZa1xGZIfO5KBb32YrMe7/UYLXso8e14hxSVVrbUd
 0K8LofHulI22upZqtJhnec8f5afJQrIr6qPi/A1SpVWRnXALSGyNUbOra6NHb8ps0agz
 n7LlxTiRj5/dLpzFz0sYjF1dmPBo13lFZkUjGJ+EO1MZ5xgpst3cAU93mXrrZS9YjnZR
 OqQNInIYDL9iNrp2DoaohvA1+wNT5eyFOPTqUbkZuUsWLnyCjKJBQjgoePjVMbmhYNq4
 2uqJ+1a/dgHkKJgSzqb/4zALsVzGTe8QOk6/aQOkOC0p1j4/ry6cmeHjjXIx9ev2vzfd
 mHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CfWntzpwH15J5ehPH1meNChk1iAXVBiZt+MbfCMbQY0=;
 b=l6AraIvO4ccSnzs3U56j4QA8FT6KXMy8Wlh87Bg1tdzVtZ08Ev/evYWtBkirrZqzkZ
 Di/T22D15X24RbJ79VZ84nixdSsZLc2u0ayZw/dTZKXWoRa2wAHalLZ+jHYt8wRw7Y5g
 e55mx0LYGQe7cEyaLazSrOYFEHfFZMdJ3dc2HyENw8EDrhNgpAhggkCtyXOlHuwb7G8+
 wm3UaLIiSLpU8sqjR+btq2FwhjJ6dWJ/Yx9ynUO1MVoqg12c5qTXwiZ2ngeXiZi9qWSG
 SmaRu7XaMO9FjwTzdY74VG8VJ7EiViXVuzZ9fvKD56yG8/QPI906YhcR1zTS9wszGghx
 hMew==
X-Gm-Message-State: AOAM530JlY9qpR991WoJabIpQoV7ru/XRT2pKXtGCHJ7n1lILsz2Bv55
 SggMLtrHM+h0F0YdwapSC9FI76/Tx8F1VzdR
X-Google-Smtp-Source: ABdhPJyf53KAAlRkFCqObhkRv+0wrutjmsclXOODWva+7OYEATswet9UGdWqF/1E0KP2+DrZT4i/ow==
X-Received: by 2002:a17:90a:cc0c:: with SMTP id
 b12mr337447pju.103.1642005614848; 
 Wed, 12 Jan 2022 08:40:14 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com.
 [209.85.216.45])
 by smtp.gmail.com with ESMTPSA id gt22sm199632pjb.35.2022.01.12.08.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 08:40:14 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id
 59-20020a17090a09c100b001b34a13745eso13162554pjo.5; 
 Wed, 12 Jan 2022 08:40:13 -0800 (PST)
X-Received: by 2002:a63:741a:: with SMTP id p26mr427887pgc.181.1642005613381; 
 Wed, 12 Jan 2022 08:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-15-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-15-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 13 Jan 2022 00:40:01 +0800
X-Gmail-Original-Message-ID: <CANzO1D14e7GpTD9RctrgCWQBimgGrswbrLgHRk96z=Bqa9P7Ng@mail.gmail.com>
Message-ID: <CANzO1D14e7GpTD9RctrgCWQBimgGrswbrLgHRk96z=Bqa9P7Ng@mail.gmail.com>
Subject: Re: [PATCH v6 14/23] target/riscv: Implement AIA xiselect and xireg
 CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="0000000000004e122b05d565394b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Jan 2022 16:40:37 -0000

--0000000000004e122b05d565394b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:51=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
> which allow indirect access to interrupt priority arrays and per-HART
> IMSIC registers. This patch implements AIA xiselect and xireg CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  target/riscv/cpu.h     |   7 ++
>  target/riscv/csr.c     | 175 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c |   3 +
>  3 files changed, 185 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 721727c577..82272f99fd 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -186,6 +186,10 @@ struct CPURISCVState {
>      uint8_t miprio[64];
>      uint8_t siprio[64];
>
> +    /* AIA CSRs */
> +    target_ulong miselect;
> +    target_ulong siselect;
> +
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
>      target_ulong hedeleg;
> @@ -215,6 +219,9 @@ struct CPURISCVState {
>      target_ulong vstval;
>      target_ulong vsatp;
>
> +    /* AIA VS-mode CSRs */
> +    target_ulong vsiselect;
> +
>      target_ulong mtval2;
>      target_ulong mtinst;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5a27c3bfbb..488877e89c 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -895,6 +895,169 @@ static int read_mtopi(CPURISCVState *env, int csrno=
,
> target_ulong *val)
>      return RISCV_EXCP_NONE;
>  }
>
> +static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_cpu_virt_enabled(env)) {
> +        return csrno;
> +    }
> +
> +    switch (csrno) {
> +    case CSR_SISELECT:
> +        return CSR_VSISELECT;
> +    case CSR_SIREG:
> +        return CSR_VSIREG;
> +    default:
> +        return csrno;
> +    };
> +}
> +
> +static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val=
,
> +                        target_ulong new_val, target_ulong wr_mask)
> +{
> +    target_ulong *iselect;
> +
> +    /* Translate CSR number for VS-mode */
> +    csrno =3D aia_xlate_vs_csrno(env, csrno);
> +
> +    /* Find the iselect CSR based on CSR number */
> +    switch (csrno) {
> +    case CSR_MISELECT:
> +        iselect =3D &env->miselect;
> +        break;
> +    case CSR_SISELECT:
> +        iselect =3D &env->siselect;
> +        break;
> +    case CSR_VSISELECT:
> +        iselect =3D &env->vsiselect;
> +        break;
> +    default:
> +         return RISCV_EXCP_ILLEGAL_INST;
> +    };
> +
> +    if (val) {
> +        *val =3D *iselect;
> +    }
> +
> +    wr_mask &=3D ISELECT_MASK;
> +    if (wr_mask) {
> +        *iselect =3D (*iselect & ~wr_mask) | (new_val & wr_mask);
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int rmw_iprio(target_ulong xlen,
> +                     target_ulong iselect, uint8_t *iprio,
> +                     target_ulong *val, target_ulong new_val,
> +                     target_ulong wr_mask, int ext_irq_no)
> +{
> +    int i, firq, nirqs;
> +    target_ulong old_val;
> +
> +    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
> +        return -EINVAL;
> +    }
> +    if (xlen !=3D 32 && iselect & 0x1) {
> +        return -EINVAL;
> +    }
> +
> +    nirqs =3D 4 * (xlen / 32);
> +    firq =3D ((iselect - ISELECT_IPRIO0) / (xlen / 32)) * (nirqs);
> +
> +    old_val =3D 0;
> +    for (i =3D 0; i < nirqs; i++) {
> +        old_val |=3D ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BITS =
*
> i);
> +    }
> +
> +    if (val) {
> +        *val =3D old_val;
> +    }
> +
> +    if (wr_mask) {
> +        new_val =3D (old_val & ~wr_mask) | (new_val & wr_mask);
> +        for (i =3D 0; i < nirqs; i++) {
> +            /*
> +             * M-level and S-level external IRQ priority always read-onl=
y
> +             * zero. This means default priority order is always preferr=
ed
> +             * for M-level and S-level external IRQs.
> +             */
> +            if ((firq + i) =3D=3D ext_irq_no) {
> +                continue;
> +            }
> +            iprio[firq + i] =3D (new_val >> (IPRIO_IRQ_BITS * i)) & 0xff=
;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
> +                     target_ulong new_val, target_ulong wr_mask)
> +{
> +    bool virt;
> +    uint8_t *iprio;
> +    int ret =3D -EINVAL;
> +    target_ulong priv, isel, vgein;
> +
> +    /* Translate CSR number for VS-mode */
> +    csrno =3D aia_xlate_vs_csrno(env, csrno);
> +
> +    /* Decode register details from CSR number */
> +    virt =3D false;
> +    switch (csrno) {
> +    case CSR_MIREG:
> +        iprio =3D env->miprio;
> +        isel =3D env->miselect;
> +        priv =3D PRV_M;
> +        break;
> +    case CSR_SIREG:
> +        iprio =3D env->siprio;
> +        isel =3D env->siselect;
> +        priv =3D PRV_S;
> +        break;
> +    case CSR_VSIREG:
> +        iprio =3D env->hviprio;
> +        isel =3D env->vsiselect;
> +        priv =3D PRV_S;
> +        virt =3D true;
> +        break;
> +    default:
> +         goto done;
> +    };
> +
> +    /* Find the selected guest interrupt file */
> +    vgein =3D (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
> +
> +    if (ISELECT_IPRIO0 <=3D isel && isel <=3D ISELECT_IPRIO15) {
> +        /* Local interrupt priority registers not available for VS-mode =
*/
> +        if (!virt) {
> +            ret =3D rmw_iprio(riscv_cpu_mxl_bits(env),
> +                            isel, iprio, val, new_val, wr_mask,
> +                            (priv =3D=3D PRV_M) ? IRQ_M_EXT : IRQ_S_EXT)=
;
> +        }
> +    } else if (ISELECT_IMSIC_FIRST <=3D isel && isel <=3D ISELECT_IMSIC_=
LAST)
> {
> +        /* IMSIC registers only available when machine implements it. */
> +        if (env->aia_ireg_rmw_fn[priv]) {
> +            /* Selected guest interrupt file should not be zero */
> +            if (virt && (!vgein || env->geilen < vgein)) {
> +                goto done;
> +            }
> +            /* Call machine specific IMSIC register emulation */
> +            ret =3D
> env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
> +                                    AIA_MAKE_IREG(isel, priv, virt, vgei=
n,
> +
> riscv_cpu_mxl_bits(env)),
> +                                    val, new_val, wr_mask);
> +        }
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
>  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> @@ -2536,6 +2699,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval   =
 },
>      [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip       =
 },
>
> +    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
> +    [CSR_MISELECT] =3D { "miselect", aia_any,   NULL, NULL,    rmw_xisel=
ect
> },
> +    [CSR_MIREG]    =3D { "mireg",    aia_any,   NULL, NULL,    rmw_xireg=
 },
> +
>      /* Machine-Level Interrupts (AIA) */
>      [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
>
> @@ -2566,6 +2733,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      /* Supervisor Protection and Translation */
>      [CSR_SATP]     =3D { "satp",     smode, read_satp,    write_satp    =
  },
>
> +    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
> +    [CSR_SISELECT]   =3D { "siselect",   aia_smode, NULL, NULL,
> rmw_xiselect },
> +    [CSR_SIREG]      =3D { "sireg",      aia_smode, NULL, NULL, rmw_xire=
g },
> +
>      /* Supervisor-Level Interrupts (AIA) */
>      [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
>
> @@ -2607,6 +2778,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,
>  write_hviprio1 },
>      [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,
>  write_hviprio2 },
>
> +    /* VS-Level Window to Indirectly Accessed Registers (H-extension wit=
h
> AIA) */
> +    [CSR_VSISELECT]   =3D { "vsiselect",   aia_hmode, NULL, NULL,
> rmw_xiselect },
> +    [CSR_VSIREG]      =3D { "vsireg",      aia_hmode, NULL, NULL,
> rmw_xireg },
> +
>      /* VS-Level Interrupts (H-extension with AIA) */
>      [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index f027d5e307..376a02a36f 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -103,6 +103,7 @@ static const VMStateDescription vmstate_hyper =3D {
>          VMSTATE_UINTTL(env.vscause, RISCVCPU),
>          VMSTATE_UINTTL(env.vstval, RISCVCPU),
>          VMSTATE_UINTTL(env.vsatp, RISCVCPU),
> +        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
>
>          VMSTATE_UINTTL(env.mtval2, RISCVCPU),
>          VMSTATE_UINTTL(env.mtinst, RISCVCPU),
> @@ -210,6 +211,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          VMSTATE_UINTTL(env.mepc, RISCVCPU),
>          VMSTATE_UINTTL(env.mcause, RISCVCPU),
>          VMSTATE_UINTTL(env.mtval, RISCVCPU),
> +        VMSTATE_UINTTL(env.miselect, RISCVCPU),
> +        VMSTATE_UINTTL(env.siselect, RISCVCPU),
>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--0000000000004e122b05d565394b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" targe=
t=3D"_blank">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:51=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Anu=
p Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=3D"_blank">anup.pa=
tel@wdc.com</a>&gt;<br>
<br>
The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs<br>
which allow indirect access to interrupt priority arrays and per-HART<br>
IMSIC registers. This patch implements AIA xiselect and xireg CSRs.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 ++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0| 175 +++++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A0target/riscv/machine.c |=C2=A0 =C2=A03 +<br>
=C2=A03 files changed, 185 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 721727c577..82272f99fd 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -186,6 +186,10 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0uint8_t miprio[64];<br>
=C2=A0 =C2=A0 =C2=A0uint8_t siprio[64];<br>
<br>
+=C2=A0 =C2=A0 /* AIA CSRs */<br>
+=C2=A0 =C2=A0 target_ulong miselect;<br>
+=C2=A0 =C2=A0 target_ulong siselect;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Hypervisor CSRs */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hstatus;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong hedeleg;<br>
@@ -215,6 +219,9 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong vstval;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong vsatp;<br>
<br>
+=C2=A0 =C2=A0 /* AIA VS-mode CSRs */<br>
+=C2=A0 =C2=A0 target_ulong vsiselect;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtval2;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtinst;<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 5a27c3bfbb..488877e89c 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -895,6 +895,169 @@ static int read_mtopi(CPURISCVState *env, int csrno, =
target_ulong *val)<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return csrno;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (csrno) {<br>
+=C2=A0 =C2=A0 case CSR_SISELECT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return CSR_VSISELECT;<br>
+=C2=A0 =C2=A0 case CSR_SIREG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return CSR_VSIREG;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return csrno;<br>
+=C2=A0 =C2=A0 };<br>
+}<br>
+<br>
+static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 target_ulong new_val, target_ulong wr_mask)<br>
+{<br>
+=C2=A0 =C2=A0 target_ulong *iselect;<br>
+<br>
+=C2=A0 =C2=A0 /* Translate CSR number for VS-mode */<br>
+=C2=A0 =C2=A0 csrno =3D aia_xlate_vs_csrno(env, csrno);<br>
+<br>
+=C2=A0 =C2=A0 /* Find the iselect CSR based on CSR number */<br>
+=C2=A0 =C2=A0 switch (csrno) {<br>
+=C2=A0 =C2=A0 case CSR_MISELECT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iselect =3D &amp;env-&gt;miselect;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_SISELECT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iselect =3D &amp;env-&gt;siselect;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_VSISELECT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iselect =3D &amp;env-&gt;vsiselect;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D *iselect;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 wr_mask &amp;=3D ISELECT_MASK;<br>
+=C2=A0 =C2=A0 if (wr_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *iselect =3D (*iselect &amp; ~wr_mask) | (new_=
val &amp; wr_mask);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static int rmw_iprio(target_ulong xlen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0target_ulong iselect, uint8_t *iprio,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0target_ulong *val, target_ulong new_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0target_ulong wr_mask, int ext_irq_no)<br>
+{<br>
+=C2=A0 =C2=A0 int i, firq, nirqs;<br>
+=C2=A0 =C2=A0 target_ulong old_val;<br>
+<br>
+=C2=A0 =C2=A0 if (iselect &lt; ISELECT_IPRIO0 || ISELECT_IPRIO15 &lt; isel=
ect) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (xlen !=3D 32 &amp;&amp; iselect &amp; 0x1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 nirqs =3D 4 * (xlen / 32);<br>
+=C2=A0 =C2=A0 firq =3D ((iselect - ISELECT_IPRIO0) / (xlen / 32)) * (nirqs=
);<br>
+<br>
+=C2=A0 =C2=A0 old_val =3D 0;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; nirqs; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_val |=3D ((target_ulong)iprio[firq + i]) &=
lt;&lt; (IPRIO_IRQ_BITS * i);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D old_val;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (wr_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_val =3D (old_val &amp; ~wr_mask) | (new_va=
l &amp; wr_mask);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nirqs; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* M-level and S-level exte=
rnal IRQ priority always read-only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* zero. This means default=
 priority order is always preferred<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for M-level and S-level =
external IRQs.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((firq + i) =3D=3D ext_irq_no=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio[firq + i] =3D (new_val &gt=
;&gt; (IPRIO_IRQ_BITS * i)) &amp; 0xff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0target_ulong new_val, target_ulong wr_mask)<br>
+{<br>
+=C2=A0 =C2=A0 bool virt;<br>
+=C2=A0 =C2=A0 uint8_t *iprio;<br>
+=C2=A0 =C2=A0 int ret =3D -EINVAL;<br>
+=C2=A0 =C2=A0 target_ulong priv, isel, vgein;<br>
+<br>
+=C2=A0 =C2=A0 /* Translate CSR number for VS-mode */<br>
+=C2=A0 =C2=A0 csrno =3D aia_xlate_vs_csrno(env, csrno);<br>
+<br>
+=C2=A0 =C2=A0 /* Decode register details from CSR number */<br>
+=C2=A0 =C2=A0 virt =3D false;<br>
+=C2=A0 =C2=A0 switch (csrno) {<br>
+=C2=A0 =C2=A0 case CSR_MIREG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D env-&gt;miprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 isel =3D env-&gt;miselect;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_M;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_SIREG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D env-&gt;siprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 isel =3D env-&gt;siselect;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CSR_VSIREG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D env-&gt;hviprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 isel =3D env-&gt;vsiselect;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D PRV_S;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 /* Find the selected guest interrupt file */<br>
+=C2=A0 =C2=A0 vgein =3D (virt) ? get_field(env-&gt;hstatus, HSTATUS_VGEIN)=
 : 0;<br>
+<br>
+=C2=A0 =C2=A0 if (ISELECT_IPRIO0 &lt;=3D isel &amp;&amp; isel &lt;=3D ISEL=
ECT_IPRIO15) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Local interrupt priority registers not avai=
lable for VS-mode */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!virt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rmw_iprio(riscv_cpu_mxl_=
bits(env),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 isel, iprio, val, new_val, wr_mask,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (priv =3D=3D PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (ISELECT_IMSIC_FIRST &lt;=3D isel &amp;&amp; isel =
&lt;=3D ISELECT_IMSIC_LAST) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IMSIC registers only available when machine=
 implements it. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;aia_ireg_rmw_fn[priv]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Selected guest interrupt file=
 should not be zero */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virt &amp;&amp; (!vgein || e=
nv-&gt;geilen &lt; vgein)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Call machine specific IMSIC r=
egister emulation */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D env-&gt;aia_ireg_rmw_fn[=
priv](env-&gt;aia_ireg_rmw_fn_arg[priv],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AIA_MAKE_IREG(isel, pr=
iv, virt, vgein,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_mxl_bits(env)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val, new_val, wr_mask)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
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
=C2=A0static RISCVException read_mtvec(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
=C2=A0{<br>
@@ -2536,6 +2699,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_MTVAL]=C2=A0 =C2=A0 =3D { &quot;mtval&quot;,=C2=A0=
 =C2=A0 any,=C2=A0 read_mtval,=C2=A0 =C2=A0 write_mtval=C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MIP]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mip&quot;,=C2=
=A0 =C2=A0 =C2=A0 any,=C2=A0 NULL,=C2=A0 =C2=A0 NULL, rmw_mip=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 },<br>
<br>
+=C2=A0 =C2=A0 /* Machine-Level Window to Indirectly Accessed Registers (AI=
A) */<br>
+=C2=A0 =C2=A0 [CSR_MISELECT] =3D { &quot;miselect&quot;, aia_any,=C2=A0 =
=C2=A0NULL, NULL,=C2=A0 =C2=A0 rmw_xiselect },<br>
+=C2=A0 =C2=A0 [CSR_MIREG]=C2=A0 =C2=A0 =3D { &quot;mireg&quot;,=C2=A0 =C2=
=A0 aia_any,=C2=A0 =C2=A0NULL, NULL,=C2=A0 =C2=A0 rmw_xireg },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Machine-Level Interrupts (AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MTOPI]=C2=A0 =C2=A0 =3D { &quot;mtopi&quot;,=C2=A0=
 =C2=A0 aia_any,=C2=A0 =C2=A0read_mtopi },<br>
<br>
@@ -2566,6 +2733,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0/* Supervisor Protection and Translation */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_SATP]=C2=A0 =C2=A0 =C2=A0=3D { &quot;satp&quot;,=
=C2=A0 =C2=A0 =C2=A0smode, read_satp,=C2=A0 =C2=A0 write_satp=C2=A0 =C2=A0 =
=C2=A0 },<br>
<br>
+=C2=A0 =C2=A0 /* Supervisor-Level Window to Indirectly Accessed Registers =
(AIA) */<br>
+=C2=A0 =C2=A0 [CSR_SISELECT]=C2=A0 =C2=A0=3D { &quot;siselect&quot;,=C2=A0=
 =C2=A0aia_smode, NULL, NULL, rmw_xiselect },<br>
+=C2=A0 =C2=A0 [CSR_SIREG]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;sireg&quot;,=C2=
=A0 =C2=A0 =C2=A0 aia_smode, NULL, NULL, rmw_xireg },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Supervisor-Level Interrupts (AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_STOPI]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;stopi&quot;=
,=C2=A0 =C2=A0 =C2=A0 aia_smode, read_stopi },<br>
<br>
@@ -2607,6 +2778,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_HVIPRIO1]=C2=A0 =C2=A0 =3D { &quot;hviprio1&quot;,=
=C2=A0 =C2=A0 aia_hmode, read_hviprio1,=C2=A0 =C2=A0write_hviprio1 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HVIPRIO2]=C2=A0 =C2=A0 =3D { &quot;hviprio2&quot;,=
=C2=A0 =C2=A0 aia_hmode, read_hviprio2,=C2=A0 =C2=A0write_hviprio2 },<br>
<br>
+=C2=A0 =C2=A0 /* VS-Level Window to Indirectly Accessed Registers (H-exten=
sion with AIA) */<br>
+=C2=A0 =C2=A0 [CSR_VSISELECT]=C2=A0 =C2=A0=3D { &quot;vsiselect&quot;,=C2=
=A0 =C2=A0aia_hmode, NULL, NULL,=C2=A0 =C2=A0 =C2=A0 rmw_xiselect },<br>
+=C2=A0 =C2=A0 [CSR_VSIREG]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;vsireg&quot;,=
=C2=A0 =C2=A0 =C2=A0 aia_hmode, NULL, NULL,=C2=A0 =C2=A0 =C2=A0 rmw_xireg }=
,<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* VS-Level Interrupts (H-extension with AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_VSTOPI]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;vstopi&quo=
t;,=C2=A0 =C2=A0 =C2=A0 aia_hmode, read_vstopi },<br>
<br>
diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
index f027d5e307..376a02a36f 100644<br>
--- a/target/riscv/machine.c<br>
+++ b/target/riscv/machine.c<br>
@@ -103,6 +103,7 @@ static const VMStateDescription vmstate_hyper =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.vscause, RISCVCPU),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.vstval, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.vsatp, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.vsiselect, RISCVCPU),<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mtval2, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mtinst, RISCVCPU),<br>
@@ -210,6 +211,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mepc, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mcause, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mtval, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.miselect, RISCVCPU),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.siselect, RISCVCPU),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.scounteren, RISCVCPU),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mcounteren, RISCVCPU),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.sscratch, RISCVCPU),<b=
r>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--0000000000004e122b05d565394b--


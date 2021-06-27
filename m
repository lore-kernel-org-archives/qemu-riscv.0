Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxRhV-0004qk-GJ
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 06:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxRhT-0004qS-IV
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 06:07:39 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxRhQ-0005TO-Mv
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 06:07:39 -0400
Received: by mail-pg1-x532.google.com with SMTP id t9so12680627pgn.4
 for <qemu-riscv@nongnu.org>; Sun, 27 Jun 2021 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G8mHFPDahVjOfkmgDuGDFhZcYai2eKHPSalroRM7M90=;
 b=hddLmjxlKrHorDBmWrOXnILRQiPsXQY9gqK1CdRwgaw9uN1IKWy1krcwCjDEvp4GGJ
 eHCpixuKkLtM37IAAdUeJOdh869372BrOmhj6PfkxszcPfeOkkFaXDggT3Q7A/4fV/CR
 X+WAhyVFBRK7Cig/10KuEfY3YXoGQNlE+5CsEeVt8DkGxcB7T5aVtnuFxHwsx2JGE/+5
 72WEOSDGvx04EEDAPGbEcr5E+0M4sr/DGIdxAukw+HUFU7g4Oe5NgUv2gSlEVco2ONtB
 dLnbhkqYgCu44Eg34VdUe+TwNSUrtvM/0tGh+v+f7DIwrFUC7dfGJ3PvMby4nSS/68eJ
 GECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G8mHFPDahVjOfkmgDuGDFhZcYai2eKHPSalroRM7M90=;
 b=Iin42ZLdZJEORP2D7TzeCOKmb3sOsrMtcYrAJiHTxvTZhbBRjk9tS9HKWcw/PSWu4j
 j8fDzUVKtHf/rftriHgC+QLaXd4TP5Gxq/5/31+OWJEIYDNERRbZq2PxDMoW77nj6i5b
 Uo+yW5eF0JYT4Q0zuXz4ex9rei+Wub29BmWbkNTSF/qQV8mbqrRiefen0ct5viCm09q8
 pwb3bA1/UNdP2lGWdvl0A6U7sLr/CP0GZEeVnZQn0U1y+eTU5sOXTyC5OSUPKddNRC9P
 lJQQP/eVVXAs3s8e21U9rtjW5mbUK0OsxiXcJ1f9rgkM5wwPaQ41e6zVIhs2TgM9XxMa
 jYOg==
X-Gm-Message-State: AOAM531xd71m1EvHkX2MoEBPf2gAe9FNgfvOMVqO8N4Gzqt19IhQwGF+
 IkVHYOigYvjP+hpDVrDV6NzmqQ==
X-Google-Smtp-Source: ABdhPJwIED5vYLA1hLFaA4rHn7VzH2F22xSD/JqBDc2yg6hLxqfFwFuM1XK+/RbXOsKoXYFYub4ZFQ==
X-Received: by 2002:a63:de02:: with SMTP id f2mr18352672pgg.32.1624788454882; 
 Sun, 27 Jun 2021 03:07:34 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com.
 [209.85.216.52])
 by smtp.gmail.com with ESMTPSA id n23sm10580058pfv.56.2021.06.27.03.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 03:07:34 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso8382691pjb.4; 
 Sun, 27 Jun 2021 03:07:34 -0700 (PDT)
X-Received: by 2002:a17:90a:6be6:: with SMTP id
 w93mr21156020pjj.171.1624788454045; 
 Sun, 27 Jun 2021 03:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-9-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-9-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 18:07:23 +0800
X-Gmail-Original-Message-ID: <CANzO1D2dLjmvr_19zE_fbk0UpSrvD4O10RHh4m2BXiY-UkCG_g@mail.gmail.com>
Message-ID: <CANzO1D2dLjmvr_19zE_fbk0UpSrvD4O10RHh4m2BXiY-UkCG_g@mail.gmail.com>
Subject: Re: [RFC PATCH 08/11] target/riscv: Update CSR xnxti in CLIC mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000a37d5105c5bc8aa0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Jun 2021 10:07:39 -0000

--000000000000a37d5105c5bc8aa0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A

> The CSR can be used by software to service the next horizontal interrupt
> when it has greater level than the saved interrupt context
> (held in xcause`.pil`) and greater level than the interrupt threshold of
> the corresponding privilege mode,
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu_bits.h |  16 ++++++
>  target/riscv/csr.c      | 114 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7922097776..494e41edc9 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -166,6 +166,7 @@
>  #define CSR_MCAUSE          0x342
>  #define CSR_MTVAL           0x343
>  #define CSR_MIP             0x344
> +#define CSR_MNXTI           0x345 /* clic-spec-draft */
>  #define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
>  #define CSR_MINTTHRESH      0x347 /* clic-spec-draft */
>
> @@ -187,6 +188,7 @@
>  #define CSR_SCAUSE          0x142
>  #define CSR_STVAL           0x143
>  #define CSR_SIP             0x144
> +#define CSR_SNXTI           0x145 /* clic-spec-draft */
>  #define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
>  #define CSR_SINTTHRESH      0x147 /* clic-spec-draft */
>
> @@ -596,10 +598,24 @@
>  #define MINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
>  #define MINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
>
> +/* mcause */
> +#define MCAUSE_MINHV                       0x40000000 /* minhv */
> +#define MCAUSE_MPP                         0x30000000 /* mpp[1:0] */
> +#define MCAUSE_MPIE                        0x08000000 /* mpie */
> +#define MCAUSE_MPIL                        0x00ff0000 /* mpil[7:0] */
> +#define MCAUSE_EXCCODE                     0x00000fff /* exccode[11:0] *=
/
> +
>  /* sintstatus */
>  #define SINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
>  #define SINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
>
> +/* scause */
> +#define SCAUSE_SINHV                       0x40000000 /* sinhv */
> +#define SCAUSE_SPP                         0x10000000 /* spp */
> +#define SCAUSE_SPIE                        0x08000000 /* spie */
> +#define SCAUSE_SPIL                        0x00ff0000 /* spil[7:0] */
> +#define SCAUSE_EXCCODE                     0x00000fff /* exccode[11:0] *=
/
> +
>  /* MIE masks */
>  #define MIE_SEIE                           (1 << IRQ_S_EXT)
>  #define MIE_UEIE                           (1 << IRQ_U_EXT)
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e12222b77f..72cba080bf 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -774,6 +774,80 @@ static int rmw_mip(CPURISCVState *env, int csrno,
> target_ulong *ret_value,
>      return 0;
>  }
>
> +static bool get_xnxti_status(CPURISCVState *env)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +    int clic_irq, clic_priv, clic_il, pil;
> +
> +    if (!env->exccode) { /* No interrupt */
> +        return false;
> +    }
> +    /* The system is not in a CLIC mode */
> +    if (!riscv_clic_is_clic_mode(env)) {
> +        return false;
> +    } else {
> +        riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
> +                                  &clic_irq);
> +
> +        if (env->priv =3D=3D PRV_M) {
> +            pil =3D MAX(get_field(env->mcause, MCAUSE_MPIL),
> env->mintthresh);

+        } else if (env->priv =3D=3D PRV_S) {
> +            pil =3D MAX(get_field(env->scause, SCAUSE_SPIL),
> env->sintthresh);
>

Same here, for v0.8 CLIC[1],
both mintthresh and sintthresh valuse should be retrieved from
CLIC mintthresh memory-mapped register.

+        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "CSR: rmw xnxti with unsupported mode\n");
> +            exit(1);
> +        }
> +
> +        if ((clic_priv !=3D env->priv) || /* No horizontal interrupt */
> +            (clic_il <=3D pil) || /* No higher level interrupt */
> +            (riscv_clic_shv_interrupt(env->clic, clic_priv, cs->cpu_inde=
x,
> +                                      clic_irq))) { /* CLIC vector mode =
*/
> +            return false;
> +        } else {
> +            return true;
> +        }
> +    }
> +}
> +
> +static int rmw_mnxti(CPURISCVState *env, int csrno, target_ulong
> *ret_value,
> +                     target_ulong new_value, target_ulong write_mask)
> +{
> +    int clic_priv, clic_il, clic_irq;
> +    bool ready;
> +    CPUState *cs =3D env_cpu(env);
> +    if (write_mask) {
> +        env->mstatus |=3D new_value & (write_mask & 0b11111);
> +    }
> +
> +    qemu_mutex_lock_iothread();
> +    ready =3D get_xnxti_status(env);
> +    if (ready) {
> +        riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
> +                                  &clic_irq);
> +        if (write_mask) {
> +            bool edge =3D riscv_clic_edge_triggered(env->clic, clic_priv=
,
> +                                                  cs->cpu_index,
> clic_irq);
> +            if (edge) {
> +                riscv_clic_clean_pending(env->clic, clic_priv,
> +                                         cs->cpu_index, clic_irq);
> +            }
> +            env->mintstatus =3D set_field(env->mintstatus,
> +                                        MINTSTATUS_MIL, clic_il);
> +            env->mcause =3D set_field(env->mcause, MCAUSE_EXCCODE,
> clic_irq);
> +        }
> +        if (ret_value) {
> +            *ret_value =3D (env->mtvt & ~0x3f) + sizeof(target_ulong) *
> clic_irq;
> +        }
> +    } else {
> +        if (ret_value) {
> +            *ret_value =3D 0;
> +        }
> +    }
> +    qemu_mutex_unlock_iothread();
> +    return 0;
> +}
> +
>  static int read_mintstatus(CPURISCVState *env, int csrno, target_ulong
> *val)
>  {
>      *val =3D env->mintstatus;
> @@ -982,6 +1056,44 @@ static int rmw_sip(CPURISCVState *env, int csrno,
> target_ulong *ret_value,
>      return ret;
>  }
>
> +static int rmw_snxti(CPURISCVState *env, int csrno, target_ulong
> *ret_value,
> +                     target_ulong new_value, target_ulong write_mask)
>

snxti does not exist in v0.8 CLIC spec[1].

[1] https://github.com/riscv/riscv-fast-interrupt/blob/74f86c3858/clic.adoc

Regards,
Frank Chang


> +{
> +    int clic_priv, clic_il, clic_irq;
> +    bool ready;
> +    CPUState *cs =3D env_cpu(env);
> +    if (write_mask) {
> +        env->mstatus |=3D new_value & (write_mask & 0b11111);
> +    }
> +
> +    qemu_mutex_lock_iothread();
> +    ready =3D get_xnxti_status(env);
> +    if (ready) {
> +        riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
> +                                  &clic_irq);
> +        if (write_mask) {
> +            bool edge =3D riscv_clic_edge_triggered(env->clic, clic_priv=
,
> +                                                  cs->cpu_index,
> clic_irq);
> +            if (edge) {
> +                riscv_clic_clean_pending(env->clic, clic_priv,
> +                                         cs->cpu_index, clic_irq);
> +            }
> +            env->mintstatus =3D set_field(env->mintstatus,
> +                                        MINTSTATUS_SIL, clic_il);
> +            env->scause =3D set_field(env->scause, SCAUSE_EXCCODE,
> clic_irq);
> +        }
> +        if (ret_value) {
> +            *ret_value =3D (env->stvt & ~0x3f) + sizeof(target_ulong) *
> clic_irq;
> +        }
> +    } else {
> +        if (ret_value) {
> +            *ret_value =3D 0;
> +        }
> +    }
> +    qemu_mutex_unlock_iothread();
> +    return 0;
> +}
> +
>  static int read_sintstatus(CPURISCVState *env, int csrno, target_ulong
> *val)
>  {
>      target_ulong mask =3D SINTSTATUS_SIL | SINTSTATUS_UIL;
> @@ -1755,6 +1867,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>
>      /* Machine Mode Core Level Interrupt Controller */
>      [CSR_MTVT] =3D { "mtvt", clic,  read_mtvt,  write_mtvt      },
> +    [CSR_MNXTI] =3D { "mnxti", clic,  NULL,  NULL,  rmw_mnxti   },
>      [CSR_MINTSTATUS] =3D { "mintstatus", clic,  read_mintstatus },
>      [CSR_MINTTHRESH] =3D { "mintthresh", clic,  read_mintthresh,
>                           write_mintthresh },
> @@ -1766,6 +1879,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>
>      /* Supervisor Mode Core Level Interrupt Controller */
>      [CSR_STVT] =3D { "stvt", clic,  read_stvt, write_stvt       },
> +    [CSR_SNXTI] =3D { "snxti", clic,  NULL,  NULL,  rmw_snxti   },
>
>  #endif /* !CONFIG_USER_ONLY */
>  };
> --
> 2.25.1
>
>
>

--000000000000a37d5105c5bc8aa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The CSR can be used by software to service the next ho=
rizontal interrupt<br>
when it has greater level than the saved interrupt context<br>
(held in xcause`.pil`) and greater level than the interrupt threshold of<br=
>
the corresponding privilege mode,<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_bits.h |=C2=A0 16 ++++++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 114 ++++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A02 files changed, 130 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 7922097776..494e41edc9 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -166,6 +166,7 @@<br>
=C2=A0#define CSR_MCAUSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x342<br>
=C2=A0#define CSR_MTVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x343<br>
=C2=A0#define CSR_MIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x344<=
br>
+#define CSR_MNXTI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x345 /* clic-sp=
ec-draft */<br>
=C2=A0#define CSR_MINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x346 /* clic-spec-draft *=
/<br>
=C2=A0#define CSR_MINTTHRESH=C2=A0 =C2=A0 =C2=A0 0x347 /* clic-spec-draft *=
/<br>
<br>
@@ -187,6 +188,7 @@<br>
=C2=A0#define CSR_SCAUSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x142<br>
=C2=A0#define CSR_STVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x143<br>
=C2=A0#define CSR_SIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x144<=
br>
+#define CSR_SNXTI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x145 /* clic-sp=
ec-draft */<br>
=C2=A0#define CSR_SINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x146 /* clic-spec-draft *=
/<br>
=C2=A0#define CSR_SINTTHRESH=C2=A0 =C2=A0 =C2=A0 0x147 /* clic-spec-draft *=
/<br>
<br>
@@ -596,10 +598,24 @@<br>
=C2=A0#define MINTSTATUS_SIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000ff00 /* sil[7:0] */<br>
=C2=A0#define MINTSTATUS_UIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000ff /* uil[7:0] */<br>
<br>
+/* mcause */<br>
+#define MCAUSE_MINHV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x40000000 /* minhv */<br>
+#define MCAUSE_MPP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x30000000 /* mpp[1:0] */<br>
+#define MCAUSE_MPIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x08000000 /* mpie */<br>
+#define MCAUSE_MPIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00ff0000 /* mpil[7:0] */<br>
+#define MCAUSE_EXCCODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x00000fff /* exccode[11:0] */<br>
+<br>
=C2=A0/* sintstatus */<br>
=C2=A0#define SINTSTATUS_SIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000ff00 /* sil[7:0] */<br>
=C2=A0#define SINTSTATUS_UIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000ff /* uil[7:0] */<br>
<br>
+/* scause */<br>
+#define SCAUSE_SINHV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x40000000 /* sinhv */<br>
+#define SCAUSE_SPP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x10000000 /* spp */<br>
+#define SCAUSE_SPIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x08000000 /* spie */<br>
+#define SCAUSE_SPIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00ff0000 /* spil[7:0] */<br>
+#define SCAUSE_EXCCODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x00000fff /* exccode[11:0] */<br>
+<br>
=C2=A0/* MIE masks */<br>
=C2=A0#define MIE_SEIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_S_EXT)<br>
=C2=A0#define MIE_UEIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_U_EXT)<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index e12222b77f..72cba080bf 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -774,6 +774,80 @@ static int rmw_mip(CPURISCVState *env, int csrno, targ=
et_ulong *ret_value,<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+static bool get_xnxti_status(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+=C2=A0 =C2=A0 int clic_irq, clic_priv, clic_il, pil;<br>
+<br>
+=C2=A0 =C2=A0 if (!env-&gt;exccode) { /* No interrupt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* The system is not in a CLIC mode */<br>
+=C2=A0 =C2=A0 if (!riscv_clic_is_clic_mode(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_decode_exccode(env-&gt;exccode, &am=
p;clic_priv, &amp;clic_il,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;clic_irq);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_M) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pil =3D MAX(get_field(env-&gt;mc=
ause, MCAUSE_MPIL), env-&gt;mintthresh);=C2=A0</blockquote><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (env-&gt;priv =3D=3D PRV_S) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pil =3D MAX(get_field(env-&gt;sc=
ause, SCAUSE_SPIL), env-&gt;sintthresh);<br></blockquote><div><br></div><di=
v>Same here, for v0.8 CLIC[1],</div><div>both mintthresh and sintthresh val=
use should be retrieved from</div><div>CLIC mintthresh memory-mapped regist=
er.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;CSR: rmw xnxti with unsupported mode\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((clic_priv !=3D env-&gt;priv) || /* No hor=
izontal interrupt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (clic_il &lt;=3D pil) || /* No h=
igher level interrupt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (riscv_clic_shv_interrupt(env-&g=
t;clic, clic_priv, cs-&gt;cpu_index,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clic_irq))) { /=
* CLIC vector mode */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int rmw_mnxti(CPURISCVState *env, int csrno, target_ulong *ret_valu=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0target_ulong new_value, target_ulong write_mask)<br>
+{<br>
+=C2=A0 =C2=A0 int clic_priv, clic_il, clic_irq;<br>
+=C2=A0 =C2=A0 bool ready;<br>
+=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+=C2=A0 =C2=A0 if (write_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mstatus |=3D new_value &amp; (write_ma=
sk &amp; 0b11111);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 ready =3D get_xnxti_status(env);<br>
+=C2=A0 =C2=A0 if (ready) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_decode_exccode(env-&gt;exccode, &am=
p;clic_priv, &amp;clic_il,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;clic_irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (write_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool edge =3D riscv_clic_edge_tr=
iggered(env-&gt;clic, clic_priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;cpu_index, clic_irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (edge) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_clean_p=
ending(env-&gt;clic, clic_priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs=
-&gt;cpu_index, clic_irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mintstatus =3D set_field=
(env-&gt;mintstatus,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MINTSTAT=
US_MIL, clic_il);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mcause =3D set_field(env=
-&gt;mcause, MCAUSE_EXCCODE, clic_irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret_value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value =3D (env-&gt;mtvt &am=
p; ~0x3f) + sizeof(target_ulong) * clic_irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret_value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0static int read_mintstatus(CPURISCVState *env, int csrno, target_ulon=
g *val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0*val =3D env-&gt;mintstatus;<br>
@@ -982,6 +1056,44 @@ static int rmw_sip(CPURISCVState *env, int csrno, tar=
get_ulong *ret_value,<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
+static int rmw_snxti(CPURISCVState *env, int csrno, target_ulong *ret_valu=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0target_ulong new_value, target_ulong write_mask)<br></blockquote><div><b=
r></div><div>snxti does not exist in v0.8 CLIC spec[1].</div><div><br></div=
><div>[1]=C2=A0<a href=3D"https://github.com/riscv/riscv-fast-interrupt/blo=
b/74f86c3858/clic.adoc" target=3D"_blank">https://github.com/riscv/riscv-fa=
st-interrupt/blob/74f86c3858/clic.adoc</a><br></div><div><div><br class=3D"=
gmail-Apple-interchange-newline">Regards,</div><div>Frank Chang</div></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 int clic_priv, clic_il, clic_irq;<br>
+=C2=A0 =C2=A0 bool ready;<br>
+=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+=C2=A0 =C2=A0 if (write_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mstatus |=3D new_value &amp; (write_ma=
sk &amp; 0b11111);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 ready =3D get_xnxti_status(env);<br>
+=C2=A0 =C2=A0 if (ready) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_decode_exccode(env-&gt;exccode, &am=
p;clic_priv, &amp;clic_il,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;clic_irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (write_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool edge =3D riscv_clic_edge_tr=
iggered(env-&gt;clic, clic_priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;cpu_index, clic_irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (edge) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_clean_p=
ending(env-&gt;clic, clic_priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs=
-&gt;cpu_index, clic_irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mintstatus =3D set_field=
(env-&gt;mintstatus,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MINTSTAT=
US_SIL, clic_il);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;scause =3D set_field(env=
-&gt;scause, SCAUSE_EXCCODE, clic_irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret_value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value =3D (env-&gt;stvt &am=
p; ~0x3f) + sizeof(target_ulong) * clic_irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret_value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_value =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0static int read_sintstatus(CPURISCVState *env, int csrno, target_ulon=
g *val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mask =3D SINTSTATUS_SIL | SINTSTATUS_UIL;<=
br>
@@ -1755,6 +1867,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0/* Machine Mode Core Level Interrupt Controller */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MTVT] =3D { &quot;mtvt&quot;, clic,=C2=A0 read_mtv=
t,=C2=A0 write_mtvt=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_MNXTI] =3D { &quot;mnxti&quot;, clic,=C2=A0 NULL,=C2=A0=
 NULL,=C2=A0 rmw_mnxti=C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MINTSTATUS] =3D { &quot;mintstatus&quot;, clic,=C2=
=A0 read_mintstatus },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MINTTHRESH] =3D { &quot;mintthresh&quot;, clic,=C2=
=A0 read_mintthresh,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 write_mintthresh },<br>
@@ -1766,6 +1879,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0/* Supervisor Mode Core Level Interrupt Controller */<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_STVT] =3D { &quot;stvt&quot;, clic,=C2=A0 read_stv=
t, write_stvt=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 [CSR_SNXTI] =3D { &quot;snxti&quot;, clic,=C2=A0 NULL,=C2=A0=
 NULL,=C2=A0 rmw_snxti=C2=A0 =C2=A0},<br>
<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000a37d5105c5bc8aa0--


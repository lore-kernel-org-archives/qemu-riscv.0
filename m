Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrcK7-0005RO-8E
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jun 2021 04:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <0xc0de0125@gmail.com>)
 id 1lrcK4-0005NK-9t; Fri, 11 Jun 2021 04:15:24 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <0xc0de0125@gmail.com>)
 id 1lrcK1-0007b7-Ii; Fri, 11 Jun 2021 04:15:24 -0400
Received: by mail-pl1-x635.google.com with SMTP id h1so2470334plt.1;
 Fri, 11 Jun 2021 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3tXvt6cYcrousbwkempzsTxbEX0NlbANJc0X2aPHvwE=;
 b=ss6PYv1gpJ31ZvpjOnTj5nbUWZZELP/4mSydC02HR8cmgWGtT3DaZu31zXqQ6+4Ai/
 0wa/OxH7E1+mHhha65eqCA0tTQdtkUIy+ka8K45yMPmstvBDgsi7dWme6NeaGbxxg9qx
 C0gXM3QlvdfaOfxkzjV0Ic2SsLpMTvtL4mVvKrxa0dz2bYWMT6NEVDjSKkyrVoi5DEqa
 Kzb9wBODeiZTxxp9EF7dn5MUcV0Xm3HU7b9qFNRYrAoTmglGhusaHClJvbsfwg0tDp0W
 z+YSy6+KQDoQ/VcE27C8MiZlkxDHXaJMqEC/er/yWZofnpSY7cUwAyrbCiLsCVczoT10
 Xymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tXvt6cYcrousbwkempzsTxbEX0NlbANJc0X2aPHvwE=;
 b=aWQdXfVbYs3eunxmTC1Qh5emMMGkVBAhnyoQlYhqFIJ4KHX5YB+RMEb6DaFc18aOmK
 xY4gquTbsFEuwsflwpZ6DLDU9wWL2iabEnwKJlicI4QRsYDtmknhaJ45C34Fx4r8o0tm
 QKVKdlEYrRQbwbOX6NrsaAiXsEujePl0aKJpks/OMBaNgQJ7psEUZOcFjVnRNEA3aIAx
 VALNrc/FC0mRdSjaqNzeAbrZt/WZqGRxJLg9DfJzMlYL9lK/Fb263pmb6QcXEVsXFNY6
 EfNLjwTStRPIib6H84QvsfhNM2hmyLl41RItk2ecMGSrFsZZfF97LlInQk9VyVf/0IR2
 ohCg==
X-Gm-Message-State: AOAM533gbyIC7dgn1sfrBKT8w0Tt6BRETjAUMI9HTdDeEgXuHEftaW/z
 t4OFDCJuxCI9mKmCzUb5v/SLSYoOhZzF3uF3KSI=
X-Google-Smtp-Source: ABdhPJy7lMA2FvB2Q+N6+ODqrkoafmzSsD/GPGpJprH7KEpNxw18nkucbskNAn4T6Vq04OU0rd9gBlkX3b6TUpuBDUk=
X-Received: by 2002:a17:90a:8581:: with SMTP id
 m1mr3334375pjn.47.1623399318502; 
 Fri, 11 Jun 2021 01:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-9-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-9-zhiwei_liu@c-sky.com>
From: Frank Chang <0xc0de0125@gmail.com>
Date: Fri, 11 Jun 2021 16:15:07 +0800
Message-ID: <CANzO1D1jotPbDxJj3ZxJZ7BdT0je64A9DAudEfm8=-m4DQFzoA@mail.gmail.com>
Subject: Re: [RFC PATCH 08/11] target/riscv: Update CSR xnxti in CLIC mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000b540f705c4791bbe"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=0xc0de0125@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 11 Jun 2021 08:15:24 -0000

--000000000000b540f705c4791bbe
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
> +        } else if (env->priv =3D=3D PRV_S) {
> +            pil =3D MAX(get_field(env->scause, SCAUSE_SPIL),
> env->sintthresh);
> +        } else {
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
>

Hi Zhiwei,

May I ask what's the purpose to request the BQL here with
*qemu_mutex_lock_iothread()*?
Is there any critical data we need to protect in *rmw_mnxti()*?
As far I see, *rmw_mnxti()* won't call *cpu_interrupt()* which need BQL to
be held before calling.
Am I missing anything?

Regard,
Frank Chang


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

--000000000000b540f705c4791bbe
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
ause, MCAUSE_MPIL), env-&gt;mintthresh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (env-&gt;priv =3D=3D PRV_S) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pil =3D MAX(get_field(env-&gt;sc=
ause, SCAUSE_SPIL), env-&gt;sintthresh);<br>
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
+=C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br></blockquote><div><br></div><=
div>Hi Zhiwei,</div><div><br></div><div>May I ask what&#39;s the purpose to=
 request the BQL here with=C2=A0<i>qemu_mutex_lock_iothread()</i>?</div><di=
v>Is there any critical data we need to protect in=C2=A0<i>rmw_mnxti()</i>?=
</div><div>As far I see,=C2=A0<i>rmw_mnxti()</i> won&#39;t call <i>cpu_inte=
rrupt()</i> which need BQL to be held before calling.</div><div>Am I missin=
g anything?</div><div><br></div><div>Regard,</div><div>Frank Chang</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--000000000000b540f705c4791bbe--


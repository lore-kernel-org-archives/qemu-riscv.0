Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7cYS-0007G6-Ta
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 07:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7cYH-0007AK-Bu
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 07:16:33 -0500
Received: from [2607:f8b0:4864:20::62e] (port=44817
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7cYC-0002uz-8a
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 07:16:26 -0500
Received: by mail-pl1-x62e.google.com with SMTP id h1so3831444pls.11
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FflJJQR1bIEfAjFZrkfVguAgNYceNgBaeALKHcVZ5wI=;
 b=AXdWeAICj6ssHttQZJ9w9U8z9RxTDNfoSaZuhzxAeR0sf9L6WU2Rla8OqUzxTvUrhz
 HjRX0c8SQ60bX5ssrUycdQB1HxMwn6MQF4OgWKZOJkYbLZPFWRYYAEWtj6+7S4n1roFa
 y6+WuMR4jieGNc9LTch0Q6HxhgBM0jqIddE8Uhxx3byx8vTrxHUq1uyTxcLL8VVAmVzV
 Od6VWr2tHC/zbUlQotk4wYp8/1nQEDkmbPAVyRnjkFg3rs4oyhWYiF9jANB7zoN1lVS/
 ENfa5YFE+CANsO/7AbT3flhxxZ7tWsKjZeLnMu4wvxAY2U97/Drf+OGxlwmjMd9VI4Lj
 j1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FflJJQR1bIEfAjFZrkfVguAgNYceNgBaeALKHcVZ5wI=;
 b=lb1tJlK7BkMpWtqX5oyV5KOc4o4IyCCd+0Tw1351fqjAJ2tQHNMEplR3ptXimBFJ+R
 VPeGwjVRkSfb5uaShycctnPsSWQ+G2fF7pGue8866WITb48EoD0IM6jJ/HQXB9ybGxlm
 0hRGsWy6Nm9hv7otIwwVHYsZ6RBCZaT+sGKytv5vofwsRNnZTo73ytu0i+5W2iNlU62Q
 cqoG/gvk2hIAQ8Ov5CuhHYIsKjyLU6Amffe8i6njUWD+moDitHYEjbUtXrpMoet3Zs1T
 haA6AR82hvgq3A2kQKxxEkfgsbrgLAPNuAaQkON3SWXUIvEPUDkJhNLsPgMiL3oOFf1q
 TMWA==
X-Gm-Message-State: AOAM533hDjqQajzwCy9I9ZKSjF5dpMZRp1cqSdzLaDjiHY3zy3izGmmn
 H4KeQd44poHIGYT3FvKzGfyzs2sOBw/9vw==
X-Google-Smtp-Source: ABdhPJzAtv3wXHE25SBjDyI7zk7I8eL7mz63eaDErWp0uPQTHlfLFynzv+6A0seSS/R+VAQK9uZKPg==
X-Received: by 2002:a05:6a00:10cd:b0:4bc:a950:41e2 with SMTP id
 d13-20020a056a0010cd00b004bca95041e2mr9354181pfu.30.1641989770462; 
 Wed, 12 Jan 2022 04:16:10 -0800 (PST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com.
 [209.85.214.176])
 by smtp.gmail.com with ESMTPSA id g16sm14335461pfv.159.2022.01.12.04.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:16:09 -0800 (PST)
Received: by mail-pl1-f176.google.com with SMTP id p14so3913829plf.3;
 Wed, 12 Jan 2022 04:16:09 -0800 (PST)
X-Received: by 2002:a65:6ab8:: with SMTP id x24mr8209597pgu.50.1641989768560; 
 Wed, 12 Jan 2022 04:16:08 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-14-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-14-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 20:15:57 +0800
X-Gmail-Original-Message-ID: <CANzO1D2vuO6RRafcPy6AhjOgoRk4LE3M8iAnXvdMrYXaWVTQUA@mail.gmail.com>
Message-ID: <CANzO1D2vuO6RRafcPy6AhjOgoRk4LE3M8iAnXvdMrYXaWVTQUA@mail.gmail.com>
Subject: Re: [PATCH v6 13/23] target/riscv: Implement AIA mtopi, stopi, and
 vstopi CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="000000000000e1475905d5618873"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Wed, 12 Jan 2022 12:16:35 -0000

--000000000000e1475905d5618873
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:47=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA specification introduces new [m|s|vs]topi CSRs for
> reporting pending local IRQ number and associated IRQ priority.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  target/riscv/csr.c | 156 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 156 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 55e747fbf7..5a27c3bfbb 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -190,6 +190,15 @@ static int smode32(CPURISCVState *env, int csrno)
>      return smode(env, csrno);
>  }
>
> +static int aia_smode(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
>  static int aia_smode32(CPURISCVState *env, int csrno)
>  {
>      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> @@ -502,6 +511,8 @@ static RISCVException read_timeh(CPURISCVState *env,
> int csrno,
>  #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP=
))
>  #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
>
> +#define VSTOPI_NUM_SRCS 5
>

Nit:
VSTOPI_NUM_SRCS can be reduced to 2 as AIA spec says:
  The list of candidate interrupts can be reduced to two finalists
relatively.
But it's fine to keep it to 5 if you think it has better readability.


> +
>  static const uint64_t delegable_ints =3D S_MODE_INTERRUPTS |
>                                             VS_MODE_INTERRUPTS;
>  static const uint64_t vs_delegable_ints =3D VS_MODE_INTERRUPTS;
> @@ -862,6 +873,28 @@ static RISCVException rmw_mieh(CPURISCVState *env,
> int csrno,
>      return ret;
>  }
>
> +static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int irq;
> +    uint8_t iprio;
> +
> +    irq =3D riscv_cpu_mirq_pending(env);
> +    if (irq <=3D 0 || irq > 63) {
> +       *val =3D 0;
> +    } else {
> +       iprio =3D env->miprio[irq];
> +       if (!iprio) {
> +           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
> +               iprio =3D IPRIO_MMAXIPRIO;
> +           }
> +       }
> +       *val =3D (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> +       *val |=3D iprio;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> @@ -1391,6 +1424,120 @@ static RISCVException write_satp(CPURISCVState
> *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int irq, ret;
> +    target_ulong topei;
> +    uint64_t vseip, vsgein;
> +    uint32_t iid, iprio, hviid, hviprio, gein;
> +    uint32_t s, scount =3D 0, siid[VSTOPI_NUM_SRCS],
> siprio[VSTOPI_NUM_SRCS];
> +
> +    gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> +    hviid =3D get_field(env->hvictl, HVICTL_IID);
> +    hviprio =3D get_field(env->hvictl, HVICTL_IPRIO);
> +
> +    if (gein) {
> +        vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +        vseip =3D env->mie & (env->mip | vsgein) & MIP_VSEIP;
> +        if (gein <=3D env->geilen && vseip) {
> +            siid[scount] =3D IRQ_S_EXT;
> +            siprio[scount] =3D IPRIO_MMAXIPRIO + 1;
> +            if (env->aia_ireg_rmw_fn[PRV_S]) {
> +                /*
> +                 * Call machine specific IMSIC register emulation for
> +                 * reading TOPEI.
> +                 */
> +                ret =3D env->aia_ireg_rmw_fn[PRV_S](
> +                        env->aia_ireg_rmw_fn_arg[PRV_S],
> +                        AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true,
> gein,
> +                                      riscv_cpu_mxl_bits(env)),
> +                        &topei, 0, 0);
> +                if (!ret && topei) {
> +                    siprio[scount] =3D topei & IMSIC_TOPEI_IPRIO_MASK;
> +                }
> +            }
> +            scount++;
> +        }
> +    } else {
> +        if (hviid =3D=3D IRQ_S_EXT && hviprio) {
> +            siid[scount] =3D IRQ_S_EXT;
> +            siprio[scount] =3D hviprio;
> +            scount++;
> +        }
> +    }
> +
> +    if (env->hvictl & HVICTL_VTI) {
> +        if (hviid !=3D IRQ_S_EXT) {
> +            siid[scount] =3D hviid;
> +            siprio[scount] =3D hviprio;
> +            scount++;
> +        }
> +    } else {
> +        irq =3D riscv_cpu_vsirq_pending(env);
> +        if (irq !=3D IRQ_S_EXT && 0 < irq && irq <=3D 63) {
> +           siid[scount] =3D irq;
> +           siprio[scount] =3D env->hviprio[irq];
> +           scount++;
> +        }
> +    }
> +
> +    iid =3D 0;
> +    iprio =3D UINT_MAX;
> +    for (s =3D 0; s < scount; s++) {
> +        if (siprio[s] < iprio) {
> +            iid =3D siid[s];
> +            iprio =3D siprio[s];
> +        }
> +    }
> +
> +    if (iid) {
> +        if (env->hvictl & HVICTL_IPRIOM) {
> +            if (iprio > IPRIO_MMAXIPRIO) {
> +                iprio =3D IPRIO_MMAXIPRIO;
> +            }
> +            if (!iprio) {
> +                if (riscv_cpu_default_priority(iid) > IPRIO_DEFAULT_S) {
> +                    iprio =3D IPRIO_MMAXIPRIO;
> +                }
> +            }
> +        } else {
> +            iprio =3D 1;
> +        }
> +    } else {
> +        iprio =3D 0;
> +    }
> +
> +    *val =3D (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> +    *val |=3D iprio;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int irq;
> +    uint8_t iprio;
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return read_vstopi(env, CSR_VSTOPI, val);
> +    }
> +
> +    irq =3D riscv_cpu_sirq_pending(env);
> +    if (irq <=3D 0 || irq > 63) {
> +       *val =3D 0;
> +    } else {
> +       iprio =3D env->siprio[irq];
> +       if (!iprio) {
> +           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_S) {
> +               iprio =3D IPRIO_MMAXIPRIO;
> +           }
> +       }
> +       *val =3D (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> +       *val |=3D iprio;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /* Hypervisor Extensions */
>  static RISCVException read_hstatus(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
> @@ -2389,6 +2536,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval   =
 },
>      [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip       =
 },
>
> +    /* Machine-Level Interrupts (AIA) */
> +    [CSR_MTOPI]    =3D { "mtopi",    aia_any,   read_mtopi },
> +
>      /* Virtual Interrupts for Supervisor Level (AIA) */
>      [CSR_MVIEN]      =3D { "mvien", aia_any, read_zero, write_ignore },
>      [CSR_MVIP]       =3D { "mvip",  aia_any, read_zero, write_ignore },
> @@ -2416,6 +2566,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      /* Supervisor Protection and Translation */
>      [CSR_SATP]     =3D { "satp",     smode, read_satp,    write_satp    =
  },
>
> +    /* Supervisor-Level Interrupts (AIA) */
> +    [CSR_STOPI]      =3D { "stopi",      aia_smode, read_stopi },
> +
>      /* Supervisor-Level High-Half CSRs (AIA) */
>      [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh }=
,
>      [CSR_SIPH]       =3D { "siph",   aia_smode32, NULL, NULL, rmw_siph }=
,
> @@ -2454,6 +2607,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,
>  write_hviprio1 },
>      [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,
>  write_hviprio2 },
>
> +    /* VS-Level Interrupts (H-extension with AIA) */
> +    [CSR_VSTOPI]      =3D { "vstopi",      aia_hmode, read_vstopi },
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

--000000000000e1475905d5618873
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org" target=3D"_blank">anup@brainfault.org</a>&gt; =E6=96=BC 2021=
=E5=B9=B412=E6=9C=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:47=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Anup Patel &lt;<a href=3D"mail=
to:anup.patel@wdc.com" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The AIA specification introduces new [m|s|vs]topi CSRs for<br>
reporting pending local IRQ number and associated IRQ priority.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
---<br>
=C2=A0target/riscv/csr.c | 156 ++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 156 insertions(+)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 55e747fbf7..5a27c3bfbb 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -190,6 +190,15 @@ static int smode32(CPURISCVState *env, int csrno)<br>
=C2=A0 =C2=A0 =C2=A0return smode(env, csrno);<br>
=C2=A0}<br>
<br>
+static int aia_smode(CPURISCVState *env, int csrno)<br>
+{<br>
+=C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return smode(env, csrno);<br>
+}<br>
+<br>
=C2=A0static int aia_smode32(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (!riscv_feature(env, RISCV_FEATURE_AIA)) {<br>
@@ -502,6 +511,8 @@ static RISCVException read_timeh(CPURISCVState *env, in=
t csrno,<br>
=C2=A0#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VS=
EIP))<br>
=C2=A0#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS=
))<br>
<br>
+#define VSTOPI_NUM_SRCS 5<br></blockquote><div><br></div><div>Nit:</div><d=
iv>VSTOPI_NUM_SRCS can be reduced to 2 as AIA spec says:</div><div>=C2=A0 T=
he list of candidate interrupts can be reduced to two finalists relatively.=
</div><div>But it&#39;s fine to keep it to 5 if you think it has better rea=
dability.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
=C2=A0static const uint64_t delegable_ints =3D S_MODE_INTERRUPTS |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 VS_MODE_INTERRUPTS;<br>
=C2=A0static const uint64_t vs_delegable_ints =3D VS_MODE_INTERRUPTS;<br>
@@ -862,6 +873,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int=
 csrno,<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
+static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)<br=
>
+{<br>
+=C2=A0 =C2=A0 int irq;<br>
+=C2=A0 =C2=A0 uint8_t iprio;<br>
+<br>
+=C2=A0 =C2=A0 irq =3D riscv_cpu_mirq_pending(env);<br>
+=C2=A0 =C2=A0 if (irq &lt;=3D 0 || irq &gt; 63) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D 0;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iprio =3D env-&gt;miprio[irq];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!iprio) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_cpu_default_priority(ir=
q) &gt; IPRIO_DEFAULT_M) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iprio =3D IPRIO_MMA=
XIPRIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D (irq &amp; TOPI_IID_MASK) &lt;&lt; TOP=
I_IID_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*val |=3D iprio;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
=C2=A0static RISCVException read_mtvec(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
=C2=A0{<br>
@@ -1391,6 +1424,120 @@ static RISCVException write_satp(CPURISCVState *env=
, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)<b=
r>
+{<br>
+=C2=A0 =C2=A0 int irq, ret;<br>
+=C2=A0 =C2=A0 target_ulong topei;<br>
+=C2=A0 =C2=A0 uint64_t vseip, vsgein;<br>
+=C2=A0 =C2=A0 uint32_t iid, iprio, hviid, hviprio, gein;<br>
+=C2=A0 =C2=A0 uint32_t s, scount =3D 0, siid[VSTOPI_NUM_SRCS], siprio[VSTO=
PI_NUM_SRCS];<br>
+<br>
+=C2=A0 =C2=A0 gein =3D get_field(env-&gt;hstatus, HSTATUS_VGEIN);<br>
+=C2=A0 =C2=A0 hviid =3D get_field(env-&gt;hvictl, HVICTL_IID);<br>
+=C2=A0 =C2=A0 hviprio =3D get_field(env-&gt;hvictl, HVICTL_IPRIO);<br>
+<br>
+=C2=A0 =C2=A0 if (gein) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vsgein =3D (env-&gt;hgeip &amp; (1ULL &lt;&lt;=
 gein)) ? MIP_VSEIP : 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vseip =3D env-&gt;mie &amp; (env-&gt;mip | vsg=
ein) &amp; MIP_VSEIP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gein &lt;=3D env-&gt;geilen &amp;&amp; vse=
ip) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siid[scount] =3D IRQ_S_EXT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siprio[scount] =3D IPRIO_MMAXIPR=
IO + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;aia_ireg_rmw_fn[PRV_=
S]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Call machi=
ne specific IMSIC register emulation for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* reading TO=
PEI.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D env-&gt;ai=
a_ireg_rmw_fn[PRV_S](<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 env-&gt;aia_ireg_rmw_fn_arg[PRV_S],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true, gein,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_mxl_b=
its(env)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;topei, 0, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret &amp;&amp=
; topei) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sipr=
io[scount] =3D topei &amp; IMSIC_TOPEI_IPRIO_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scount++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hviid =3D=3D IRQ_S_EXT &amp;&amp; hviprio)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siid[scount] =3D IRQ_S_EXT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siprio[scount] =3D hviprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scount++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (env-&gt;hvictl &amp; HVICTL_VTI) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hviid !=3D IRQ_S_EXT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siid[scount] =3D hviid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siprio[scount] =3D hviprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scount++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D riscv_cpu_vsirq_pending(env);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq !=3D IRQ_S_EXT &amp;&amp; 0 &lt; irq &=
amp;&amp; irq &lt;=3D 63) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0siid[scount] =3D irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0siprio[scount] =3D env-&gt;hvipri=
o[irq];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scount++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 iid =3D 0;<br>
+=C2=A0 =C2=A0 iprio =3D UINT_MAX;<br>
+=C2=A0 =C2=A0 for (s =3D 0; s &lt; scount; s++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (siprio[s] &lt; iprio) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iid =3D siid[s];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D siprio[s];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (iid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;hvictl &amp; HVICTL_IPRIOM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iprio &gt; IPRIO_MMAXIPRIO) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D IPRIO_MM=
AXIPRIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!iprio) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_defa=
ult_priority(iid) &gt; IPRIO_DEFAULT_S) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ipri=
o =3D IPRIO_MMAXIPRIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 *val =3D (iid &amp; TOPI_IID_MASK) &lt;&lt; TOPI_IID_SHIFT;<=
br>
+=C2=A0 =C2=A0 *val |=3D iprio;<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)<br=
>
+{<br>
+=C2=A0 =C2=A0 int irq;<br>
+=C2=A0 =C2=A0 uint8_t iprio;<br>
+<br>
+=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return read_vstopi(env, CSR_VSTOPI, val);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 irq =3D riscv_cpu_sirq_pending(env);<br>
+=C2=A0 =C2=A0 if (irq &lt;=3D 0 || irq &gt; 63) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D 0;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iprio =3D env-&gt;siprio[irq];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!iprio) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_cpu_default_priority(ir=
q) &gt; IPRIO_DEFAULT_S) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iprio =3D IPRIO_MMA=
XIPRIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D (irq &amp; TOPI_IID_MASK) &lt;&lt; TOP=
I_IID_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*val |=3D iprio;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
=C2=A0/* Hypervisor Extensions */<br>
=C2=A0static RISCVException read_hstatus(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val)<br>
@@ -2389,6 +2536,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0[CSR_MTVAL]=C2=A0 =C2=A0 =3D { &quot;mtval&quot;,=C2=A0=
 =C2=A0 any,=C2=A0 read_mtval,=C2=A0 =C2=A0 write_mtval=C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MIP]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mip&quot;,=C2=
=A0 =C2=A0 =C2=A0 any,=C2=A0 NULL,=C2=A0 =C2=A0 NULL, rmw_mip=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 },<br>
<br>
+=C2=A0 =C2=A0 /* Machine-Level Interrupts (AIA) */<br>
+=C2=A0 =C2=A0 [CSR_MTOPI]=C2=A0 =C2=A0 =3D { &quot;mtopi&quot;,=C2=A0 =C2=
=A0 aia_any,=C2=A0 =C2=A0read_mtopi },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Virtual Interrupts for Supervisor Level (AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MVIEN]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;mvien&quot;=
, aia_any, read_zero, write_ignore },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MVIP]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;mvip&q=
uot;,=C2=A0 aia_any, read_zero, write_ignore },<br>
@@ -2416,6 +2566,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0/* Supervisor Protection and Translation */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_SATP]=C2=A0 =C2=A0 =C2=A0=3D { &quot;satp&quot;,=
=C2=A0 =C2=A0 =C2=A0smode, read_satp,=C2=A0 =C2=A0 write_satp=C2=A0 =C2=A0 =
=C2=A0 },<br>
<br>
+=C2=A0 =C2=A0 /* Supervisor-Level Interrupts (AIA) */<br>
+=C2=A0 =C2=A0 [CSR_STOPI]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;stopi&quot;,=C2=
=A0 =C2=A0 =C2=A0 aia_smode, read_stopi },<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Supervisor-Level High-Half CSRs (AIA) */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_SIEH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;sieh&q=
uot;,=C2=A0 =C2=A0aia_smode32, NULL, NULL, rmw_sieh },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_SIPH]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;siph&q=
uot;,=C2=A0 =C2=A0aia_smode32, NULL, NULL, rmw_siph },<br>
@@ -2454,6 +2607,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0[CSR_HVIPRIO1]=C2=A0 =C2=A0 =3D { &quot;hviprio1&quot;,=
=C2=A0 =C2=A0 aia_hmode, read_hviprio1,=C2=A0 =C2=A0write_hviprio1 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HVIPRIO2]=C2=A0 =C2=A0 =3D { &quot;hviprio2&quot;,=
=C2=A0 =C2=A0 aia_hmode, read_hviprio2,=C2=A0 =C2=A0write_hviprio2 },<br>
<br>
+=C2=A0 =C2=A0 /* VS-Level Interrupts (H-extension with AIA) */<br>
+=C2=A0 =C2=A0 [CSR_VSTOPI]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;vstopi&quot;,=
=C2=A0 =C2=A0 =C2=A0 aia_hmode, read_vstopi },<br>
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
</a>&gt;<br></div></div></div>

--000000000000e1475905d5618873--


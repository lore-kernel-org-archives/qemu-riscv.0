Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7dEp-0005Mi-S7
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 08:00:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dEo-0005JZ-53
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:00:26 -0500
Received: from [2607:f8b0:4864:20::1035] (port=40793
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dEb-0000rv-Hp
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:00:25 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 59-20020a17090a09c100b001b34a13745eso11841930pjo.5
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 05:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ga/m7rGgmvYUW6ixTGoGe2RozmYRTevgfkjuEEa5qw=;
 b=ltcU47XQHgnQPb0wD/6IdAGRKHfM5Zt4V+u0R8/02JWXXe4u5JSrrIMvhMoUGDegM2
 ahECTqeHiwoq4yy7U7I/5quboW/AOcB0dE+tYMHZlJ8O7elavdndsj3xIaFbArezyb3I
 x6Idb/iG9X/aNLsKaHJ+pio6h/VOrLM0zIWhMpZaLxKs6bQbnfMC7fUFqRGfgqvntDse
 RmH2Z7bokX+VwhOK9yFwRb82mcIArdNBFVA2qQD4RRPa2T/L5XsxVSsnDCPm9NBOi7C/
 tr0CGNvzraoI6F/JwAJGuhG8WEpuK2r2HKnUJLg4iYKVaduUG5EiTKPdLoCUkUMilKi2
 as6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ga/m7rGgmvYUW6ixTGoGe2RozmYRTevgfkjuEEa5qw=;
 b=lZFBGf6qFfGr+3pmcv8wWIgxgdAa5kgBPyppo7udI/lKCxQibcoUGERK4HrtrhImil
 x/eN+8IU9UCgkPx5NLv8O/fMe7V3D9OhlmMglGkCvi5qdZMLuqHqkh1Qur2qzVwtrp8K
 JJhGqTPcDU7GxLavZAjzmgDonh67WLOEd959tdGMj8L4DAjm8JjVbBUOk8OurebOSpA5
 l0XbMHr5a9VbeJLeYpHxOAzgfWSHjsTWJYZcSuqMyak4BGwyKZy1Xkh4AJTBbs/nB1Dt
 XJ1/fLLgxtZnaKjrEVvtbMBliMuHqIOynKfIxH9j55jyRBGRAQHM8VhpHLeyLI/YFOK0
 qoGg==
X-Gm-Message-State: AOAM531DKrRqVKxxkSWkHTz0112IZ6Tlbu5dAdXUQt4255DzIQ9IN20Y
 R/gdY6J288z/ioD8tFUbjAINq/Y0TAbE+53B
X-Google-Smtp-Source: ABdhPJw+9qbN+L9Dkl7uX/Q1ObE+Dh+ANLfdDCrZcRq/9nOzfwNYvV7cOSIiRWiOZL4Ip1YnxUF/eg==
X-Received: by 2002:a17:90b:4b0e:: with SMTP id
 lx14mr8690456pjb.66.1641992410211; 
 Wed, 12 Jan 2022 05:00:10 -0800 (PST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com.
 [209.85.216.47])
 by smtp.gmail.com with ESMTPSA id c19sm9551863pfo.91.2022.01.12.05.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 05:00:09 -0800 (PST)
Received: by mail-pj1-f47.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso11869728pjm.4; 
 Wed, 12 Jan 2022 05:00:09 -0800 (PST)
X-Received: by 2002:a17:902:ab8e:b0:14a:2fef:2cf3 with SMTP id
 f14-20020a170902ab8e00b0014a2fef2cf3mr9318728plr.52.1641992408825; Wed, 12
 Jan 2022 05:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-9-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-9-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 20:59:57 +0800
X-Gmail-Original-Message-ID: <CANzO1D2s1piAWNB=Sbini58a7E3NBGXOB1s1J2qiysifC-32aA@mail.gmail.com>
Message-ID: <CANzO1D2s1piAWNB=Sbini58a7E3NBGXOB1s1J2qiysifC-32aA@mail.gmail.com>
Subject: Re: [PATCH v6 08/23] target/riscv: Allow AIA device emulation to set
 ireg rmw callback
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004084ba05d562268a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 12 Jan 2022 13:00:26 -0000

--0000000000004084ba05d562268a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The AIA device emulation (such as AIA IMSIC) should be able to set
> (or provide) AIA ireg read-modify-write callback for each privilege
> level of a RISC-V HART.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        | 23 +++++++++++++++++++++++
>  target/riscv/cpu_helper.c | 14 ++++++++++++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d0c1725eaf..02f3ef2c3c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -242,6 +242,22 @@ struct CPURISCVState {
>      uint64_t (*rdtime_fn)(uint32_t);
>      uint32_t rdtime_fn_arg;
>
> +    /* machine specific AIA ireg read-modify-write callback */
> +#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
> +    ((((__xlen) & 0xff) << 24) | \
> +     (((__vgein) & 0x3f) << 20) | \
> +     (((__virt) & 0x1) << 18) | \
> +     (((__priv) & 0x3) << 16) | \
> +     (__isel & 0xffff))
> +#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
> +#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
> +#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
> +#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
> +#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
> +    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
> +        target_ulong *val, target_ulong new_val, target_ulong write_mask=
);
> +    void *aia_ireg_rmw_fn_arg[4];
> +
>      /* True if in debugger mode.  */
>      bool debugger;
>
> @@ -397,6 +413,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_=
t
> mask, uint32_t value);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip valu=
e
> */
>  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t=
),
>                               uint32_t arg);
> +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> +                                   int (*rmw_fn)(void *arg,
> +                                                 target_ulong reg,
> +                                                 target_ulong *val,
> +                                                 target_ulong new_val,
> +                                                 target_ulong write_mask=
),
> +                                   void *rmw_fn_arg);
>  #endif
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 43d6311e49..f94a36fa89 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -395,6 +395,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env,
> uint64_t (*fn)(uint32_t),
>      env->rdtime_fn_arg =3D arg;
>  }
>
> +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> +                                   int (*rmw_fn)(void *arg,
> +                                                 target_ulong reg,
> +                                                 target_ulong *val,
> +                                                 target_ulong new_val,
> +                                                 target_ulong write_mask=
),
> +                                   void *rmw_fn_arg)
> +{
> +    if (priv <=3D PRV_M) {
> +        env->aia_ireg_rmw_fn[priv] =3D rmw_fn;
> +        env->aia_ireg_rmw_fn_arg[priv] =3D rmw_fn_arg;
> +    }
> +}
> +
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>  {
>      if (newpriv > PRV_M) {
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--0000000000004084ba05d562268a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The AIA device emulation (such as AIA IMSIC) should be able to set<br>
(or provide) AIA ireg read-modify-write callback for each privilege<br>
level of a RISC-V HART.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 ++++++++++++++++++=
+++++<br>
=C2=A0target/riscv/cpu_helper.c | 14 ++++++++++++++<br>
=C2=A02 files changed, 37 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index d0c1725eaf..02f3ef2c3c 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -242,6 +242,22 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0uint64_t (*rdtime_fn)(uint32_t);<br>
=C2=A0 =C2=A0 =C2=A0uint32_t rdtime_fn_arg;<br>
<br>
+=C2=A0 =C2=A0 /* machine specific AIA ireg read-modify-write callback */<b=
r>
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \<br>
+=C2=A0 =C2=A0 ((((__xlen) &amp; 0xff) &lt;&lt; 24) | \<br>
+=C2=A0 =C2=A0 =C2=A0(((__vgein) &amp; 0x3f) &lt;&lt; 20) | \<br>
+=C2=A0 =C2=A0 =C2=A0(((__virt) &amp; 0x1) &lt;&lt; 18) | \<br>
+=C2=A0 =C2=A0 =C2=A0(((__priv) &amp; 0x3) &lt;&lt; 16) | \<br>
+=C2=A0 =C2=A0 =C2=A0(__isel &amp; 0xffff))<br>
+#define AIA_IREG_ISEL(__ireg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ((__ireg) &amp; 0xffff)<br>
+#define AIA_IREG_PRIV(__ireg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (((__ireg) &gt;&gt; 16) &amp; 0x3)<br>
+#define AIA_IREG_VIRT(__ireg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (((__ireg) &gt;&gt; 18) &amp; 0x1)<br>
+#define AIA_IREG_VGEIN(__ireg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(((__ireg) &gt;&gt; 20) &amp; 0x3f)<br>
+#define AIA_IREG_XLEN(__ireg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (((__ireg) &gt;&gt; 24) &amp; 0xff)<br>
+=C2=A0 =C2=A0 int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *val, target_ulong new_val, targe=
t_ulong write_mask);<br>
+=C2=A0 =C2=A0 void *aia_ireg_rmw_fn_arg[4];<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* True if in debugger mode.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0bool debugger;<br>
<br>
@@ -397,6 +413,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t =
mask, uint32_t value);<br>
=C2=A0#define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip v=
alue */<br>
=C2=A0void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint3=
2_t),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t arg);<br>
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int (*rmw_fn)(void *arg=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong reg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong write_mask),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *rmw_fn_arg);<br>
=C2=A0#endif<br>
=C2=A0void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);<br=
>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 43d6311e49..f94a36fa89 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -395,6 +395,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint6=
4_t (*fn)(uint32_t),<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;rdtime_fn_arg =3D arg;<br>
=C2=A0}<br>
<br>
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int (*rmw_fn)(void *arg=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong reg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong write_mask),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *rmw_fn_arg)<br>
+{<br>
+=C2=A0 =C2=A0 if (priv &lt;=3D PRV_M) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;aia_ireg_rmw_fn[priv] =3D rmw_fn;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;aia_ireg_rmw_fn_arg[priv] =3D rmw_fn_a=
rg;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (newpriv &gt; PRV_M) {<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--0000000000004084ba05d562268a--


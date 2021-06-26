Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxC2G-0005rA-Jg
	for mharc-qemu-riscv@gnu.org; Sat, 26 Jun 2021 13:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxC2E-0005r2-Up
 for qemu-riscv@nongnu.org; Sat, 26 Jun 2021 13:24:02 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:47067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxC2C-0002Mr-5O
 for qemu-riscv@nongnu.org; Sat, 26 Jun 2021 13:24:02 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso7453690pjp.5
 for <qemu-riscv@nongnu.org>; Sat, 26 Jun 2021 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5mjOcfTJtfkjGI0ujAA0+Zj4+kGTeM0Q12KmHQKNS3w=;
 b=LhM1/GcorusOQRq907uoQ3xu5sYgW3SnTI3CmNCE6aIcQmJPOdtcVLo212JlB9qM5P
 jxXEuZLxEOUfYaNrxFPjSd72XILugEE4Pnd428gguf01vX9E4aIqkpibC0l5rKuQuq2V
 xX//uAwl8xP9HevTQTpjFJIjr26x/8GpcVkIc2nPBUh1TyIXPkujzNv9lFClFm/6MOm1
 s4NmuoW1ahK+Hy2FHQIZnVEpPVm56DifucoPzhZpMequBjbXdKcCmk2rBy63HTNiZKBi
 8yeGoYfJh4dhBj14GANQMcykuruYpK78lxg0h08TiHOd/9SRQOzJ3qmz68pUs4ZB1DO0
 vs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5mjOcfTJtfkjGI0ujAA0+Zj4+kGTeM0Q12KmHQKNS3w=;
 b=RsgI2W8GrETF7GYXcyL66M7gE452yh6LhInI0Q9T43xvaUgilHGujywPmpg694xWhi
 C0jIkE+MM5qh05Kj6pAeGemrd/sX52qeODqKBNA1S/i4Pmhr/MWCpV+Iil+0KKP6U5Nr
 t/xWqNzgiL5nnlgeYOIlSrbGK2JaSsr5uOL0aubPr27jRZ1KbIWSjv00TNcSr9BNONjF
 L6HbhqjmQ6CjRn5Bi8vsVm/wZHTpOjnOOam9s+EcB7Zuj/d50sn/Wp/+mrBWyyZ4WM4X
 x1nsOd48i52Hdi/GdG0rRaOVtRj6Us5Iar3rTEBQD5KM4F9Uojvtte2K1t0thhcgpWEu
 phEg==
X-Gm-Message-State: AOAM531LthjHzMcBxtGUMiN7T5jwxx3QcNMEmp2Vf81+mOlERTuOBSLJ
 bX/zPafX8pn/z+grjGPtP6nk0A==
X-Google-Smtp-Source: ABdhPJyVLvnEqED3HA+Gza2CKJdqGRThocOTuw1GksUZsm5SAQHk21Y77gE8BpA5cxFS62DBFUZWhQ==
X-Received: by 2002:a17:90a:db16:: with SMTP id
 g22mr17757980pjv.111.1624728238715; 
 Sat, 26 Jun 2021 10:23:58 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com.
 [209.85.216.42])
 by smtp.gmail.com with ESMTPSA id x190sm9663058pfx.198.2021.06.26.10.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 10:23:58 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id
 bv12-20020a17090af18cb029016fb18e04cfso1923986pjb.0; 
 Sat, 26 Jun 2021 10:23:57 -0700 (PDT)
X-Received: by 2002:a17:902:728e:b029:101:c3b7:a47f with SMTP id
 d14-20020a170902728eb0290101c3b7a47fmr14472844pll.21.1624728237385; Sat, 26
 Jun 2021 10:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-3-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-3-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 01:23:46 +0800
X-Gmail-Original-Message-ID: <CANzO1D0kMsGwXWMHZrSQQdX3yDAScE6_psJPK+854TvWx4tW=A@mail.gmail.com>
Message-ID: <CANzO1D0kMsGwXWMHZrSQQdX3yDAScE6_psJPK+854TvWx4tW=A@mail.gmail.com>
Subject: Re: [RFC PATCH 02/11] target/riscv: Update CSR xintthresh in CLIC mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000722bad05c5ae85f0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Sat, 26 Jun 2021 17:24:03 -0000

--000000000000722bad05c5ae85f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A

> The interrupt-level threshold (xintthresh) CSR holds an 8-bit field
> for the threshold level of the associated privilege mode.
>
> For horizontal interrupts, only the ones with higher interrupt levels
> than the threshold level are allowed to preempt.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>

Reviewed-by: Frank Chang <frank.chang@sifive.com>


> ---
>  target/riscv/cpu.h      |  2 ++
>  target/riscv/cpu_bits.h |  2 ++
>  target/riscv/csr.c      | 28 ++++++++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1a44ca62c7..a5eab26a69 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -160,6 +160,7 @@ struct CPURISCVState {
>
>      uint32_t miclaim;
>      uint32_t mintstatus; /* clic-spec */
> +    target_ulong mintthresh; /* clic-spec */
>
>      target_ulong mie;
>      target_ulong mideleg;
> @@ -173,6 +174,7 @@ struct CPURISCVState {
>      target_ulong stvec;
>      target_ulong sepc;
>      target_ulong scause;
> +    target_ulong sintthresh; /* clic-spec */
>
>      target_ulong mtvec;
>      target_ulong mepc;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index c4ce6ec3d9..9447801d22 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -166,6 +166,7 @@
>  #define CSR_MTVAL           0x343
>  #define CSR_MIP             0x344
>  #define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
> +#define CSR_MINTTHRESH      0x347 /* clic-spec-draft */
>
>  /* Legacy Machine Trap Handling (priv v1.9.1) */
>  #define CSR_MBADADDR        0x343
> @@ -185,6 +186,7 @@
>  #define CSR_STVAL           0x143
>  #define CSR_SIP             0x144
>  #define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
> +#define CSR_SINTTHRESH      0x147 /* clic-spec-draft */
>
>  /* Legacy Supervisor Trap Handling (priv v1.9.1) */
>  #define CSR_SBADADDR        0x143
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 320b18ab60..4c31364967 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -746,6 +746,18 @@ static int read_mintstatus(CPURISCVState *env, int
> csrno, target_ulong *val)
>      return 0;
>  }
>
> +static int read_mintthresh(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    *val =3D env->mintthresh;
> +    return 0;
> +}
> +
> +static int write_mintthresh(CPURISCVState *env, int csrno, target_ulong
> val)
> +{
> +    env->mintthresh =3D val;
> +    return 0;
> +}
> +
>  /* Supervisor Trap Setup */
>  static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val=
)
>  {
> @@ -912,6 +924,18 @@ static int read_sintstatus(CPURISCVState *env, int
> csrno, target_ulong *val)
>      return 0;
>  }
>
> +static int read_sintthresh(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    *val =3D env->sintthresh;
> +    return 0;
> +}
> +
> +static int write_sintthresh(CPURISCVState *env, int csrno, target_ulong
> val)
> +{
> +    env->sintthresh =3D val;
> +    return 0;
> +}
> +
>  /* Supervisor Protection and Translation */
>  static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -1666,9 +1690,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>
>      /* Machine Mode Core Level Interrupt Controller */
>      [CSR_MINTSTATUS] =3D { "mintstatus", clic,  read_mintstatus },
> +    [CSR_MINTTHRESH] =3D { "mintthresh", clic,  read_mintthresh,
> +                         write_mintthresh },
>
>      /* Supervisor Mode Core Level Interrupt Controller */
>      [CSR_SINTSTATUS] =3D { "sintstatus", clic,  read_sintstatus },
> +    [CSR_SINTTHRESH] =3D { "sintthresh", clic,  read_sintthresh,
> +                         write_sintthresh },
>
>  #endif /* !CONFIG_USER_ONLY */
>  };
> --
> 2.25.1
>
>
>

--000000000000722bad05c5ae85f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The interrupt-level threshold (xintthresh) CSR holds a=
n 8-bit field<br>
for the threshold level of the associated privilege mode.<br>
<br>
For horizontal interrupts, only the ones with higher interrupt levels<br>
than the threshold level are allowed to preempt.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br></blockquote><div><br></div><d=
iv>Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com">f=
rank.chang@sifive.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/riscv/cpu_bits.h |=C2=A0 2 ++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 28 +++++++++++++++++++++++++=
+++<br>
=C2=A03 files changed, 32 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 1a44ca62c7..a5eab26a69 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -160,6 +160,7 @@ struct CPURISCVState {<br>
<br>
=C2=A0 =C2=A0 =C2=A0uint32_t miclaim;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mintstatus; /* clic-spec */<br>
+=C2=A0 =C2=A0 target_ulong mintthresh; /* clic-spec */<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mie;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mideleg;<br>
@@ -173,6 +174,7 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong stvec;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong sepc;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong scause;<br>
+=C2=A0 =C2=A0 target_ulong sintthresh; /* clic-spec */<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtvec;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mepc;<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index c4ce6ec3d9..9447801d22 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -166,6 +166,7 @@<br>
=C2=A0#define CSR_MTVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x343<br>
=C2=A0#define CSR_MIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x344<=
br>
=C2=A0#define CSR_MINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x346 /* clic-spec-draft *=
/<br>
+#define CSR_MINTTHRESH=C2=A0 =C2=A0 =C2=A0 0x347 /* clic-spec-draft */<br>
<br>
=C2=A0/* Legacy Machine Trap Handling (priv v1.9.1) */<br>
=C2=A0#define CSR_MBADADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x343<br>
@@ -185,6 +186,7 @@<br>
=C2=A0#define CSR_STVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x143<br>
=C2=A0#define CSR_SIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x144<=
br>
=C2=A0#define CSR_SINTSTATUS=C2=A0 =C2=A0 =C2=A0 0x146 /* clic-spec-draft *=
/<br>
+#define CSR_SINTTHRESH=C2=A0 =C2=A0 =C2=A0 0x147 /* clic-spec-draft */<br>
<br>
=C2=A0/* Legacy Supervisor Trap Handling (priv v1.9.1) */<br>
=C2=A0#define CSR_SBADADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x143<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 320b18ab60..4c31364967 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -746,6 +746,18 @@ static int read_mintstatus(CPURISCVState *env, int csr=
no, target_ulong *val)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+static int read_mintthresh(CPURISCVState *env, int csrno, target_ulong *va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;mintthresh;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int write_mintthresh(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 env-&gt;mintthresh =3D val;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0/* Supervisor Trap Setup */<br>
=C2=A0static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *=
val)<br>
=C2=A0{<br>
@@ -912,6 +924,18 @@ static int read_sintstatus(CPURISCVState *env, int csr=
no, target_ulong *val)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+static int read_sintthresh(CPURISCVState *env, int csrno, target_ulong *va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;sintthresh;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int write_sintthresh(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 env-&gt;sintthresh =3D val;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0/* Supervisor Protection and Translation */<br>
=C2=A0static int read_satp(CPURISCVState *env, int csrno, target_ulong *val=
)<br>
=C2=A0{<br>
@@ -1666,9 +1690,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0/* Machine Mode Core Level Interrupt Controller */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MINTSTATUS] =3D { &quot;mintstatus&quot;, clic,=C2=
=A0 read_mintstatus },<br>
+=C2=A0 =C2=A0 [CSR_MINTTHRESH] =3D { &quot;mintthresh&quot;, clic,=C2=A0 r=
ead_mintthresh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0write_mintthresh },<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Supervisor Mode Core Level Interrupt Controller */<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_SINTSTATUS] =3D { &quot;sintstatus&quot;, clic,=C2=
=A0 read_sintstatus },<br>
+=C2=A0 =C2=A0 [CSR_SINTTHRESH] =3D { &quot;sintthresh&quot;, clic,=C2=A0 r=
ead_sintthresh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0write_sintthresh },<br>
<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000722bad05c5ae85f0--


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxQEb-0005VD-NM
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 04:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxQEa-0005Tx-63
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 04:33:44 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxQEV-00056q-DA
 for qemu-riscv@nongnu.org; Sun, 27 Jun 2021 04:33:43 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v13so7113821ple.9
 for <qemu-riscv@nongnu.org>; Sun, 27 Jun 2021 01:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vnDSym/DEjgiJYr/DsFs2PUzrGSS5GSfwJPY1wN4CU4=;
 b=ID4Q9LmQYlaiOXDm92qjHP9K3uKMPx71IAuT3bRkqkOqadUKOS65lmmqzp7bd3ayIa
 UP575YME2iYfrrh05rxUBHI+WcBp4YEojtqatXNTiG21Bv+wko9HhDciMALlTaahHtsJ
 Gn3qVn1IkHqvYHu6qVvtRY503bUarDHxZ519oT9M2X9H0kCLu/VEwacRtmmKzEVDzemL
 vAdFnxgIlV+ZI8UUdoSn3clIe50dgO1cP5/cMngZBCaQmYnCKAmJjkb+btTI9tGIGTXX
 +EhEZkk0qOsL6gYeRGSVFSEql7JdLvjnCTgawSBm+xpEyrKIyBgXy3JIUJ7G0vKt74Fs
 nTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vnDSym/DEjgiJYr/DsFs2PUzrGSS5GSfwJPY1wN4CU4=;
 b=sR6Agm/PDWAUMUtt5Eggpd8FGbFpu6BXiDK2L1eX2PSNxt8uKlwSKOUlcv8Ywn2uvz
 ZHpQc8gGccgjx32E/sJNVek34A7i11bmcZ2BTSvDzriVwdvv9xvFvsm4B0d2MO7eGsXH
 +nrjeexHskaDJ0L2PFtWSrnvyBTryEBqAz4a9o9VBu6yPBL6zQemQ4rR9Mim5xmzzM5x
 9W7oeKuexQ8PBMPgJCX/GSzagS1JBJHvWpMMk/aOtYeA18XL1MF8xLskbLGTpgXWF4u6
 WwJtDtCY1b7HwzQ/WivOPxlbokkpE1ggI4FKKtFVAuZaSYuroOxhOOj74txUSR3U2Tdq
 ngmg==
X-Gm-Message-State: AOAM530kMMVWvQU50Es/r4tyc6aWC5wKSlejp/Rh94Ct35B+dU9dDQao
 V+TJvzsbvdHUZ9vdTSFUsbGmUg==
X-Google-Smtp-Source: ABdhPJzezIL0gU+bVSYBhch2Oq97S3YJmZoRkBgORsfQ1dZ3kRfVwQLEG0sqHd5SPy5lHfGKgR8+WA==
X-Received: by 2002:a17:90a:9485:: with SMTP id
 s5mr21297762pjo.102.1624782817533; 
 Sun, 27 Jun 2021 01:33:37 -0700 (PDT)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com.
 [209.85.210.170])
 by smtp.gmail.com with ESMTPSA id m1sm16707356pjk.35.2021.06.27.01.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 01:33:37 -0700 (PDT)
Received: by mail-pf1-f170.google.com with SMTP id d12so3700925pfj.2;
 Sun, 27 Jun 2021 01:33:37 -0700 (PDT)
X-Received: by 2002:a63:cc03:: with SMTP id x3mr17828612pgf.133.1624782816920; 
 Sun, 27 Jun 2021 01:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-8-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-8-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 16:33:26 +0800
X-Gmail-Original-Message-ID: <CANzO1D3=c3PqA5VG=ORM3KsddDcFLMqCWZ3azpShXFsaBgXtaA@mail.gmail.com>
Message-ID: <CANzO1D3=c3PqA5VG=ORM3KsddDcFLMqCWZ3azpShXFsaBgXtaA@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] target/riscv: Update CSR xtvt in CLIC mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000a3c71105c5bb3af3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Sun, 27 Jun 2021 08:33:44 -0000

--000000000000a3c71105c5bb3af3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A

> The xtvt WARL XLEN-bit CSR holds the base address of the trap vector tabl=
e,
> aligned on a 64-byte or greater power-of-two boundary.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.h      |  2 ++
>  target/riscv/cpu_bits.h |  2 ++
>  target/riscv/csr.c      | 28 ++++++++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9e389d7bbf..b5fd796f98 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -173,11 +173,13 @@ struct CPURISCVState {
>      target_ulong medeleg;
>
>      target_ulong stvec;
> +    target_ulong stvt; /* clic-spec */
>      target_ulong sepc;
>      target_ulong scause;
>      target_ulong sintthresh; /* clic-spec */
>
>      target_ulong mtvec;
> +    target_ulong mtvt; /* clic-spec */
>      target_ulong mepc;
>      target_ulong mcause;
>      target_ulong mtval;  /* since: priv-1.10.0 */
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 9447801d22..7922097776 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -149,6 +149,7 @@
>  #define CSR_MIE             0x304
>  #define CSR_MTVEC           0x305
>  #define CSR_MCOUNTEREN      0x306
> +#define CSR_MTVT            0x307 /* clic-spec-draft */
>
>  /* 32-bit only */
>  #define CSR_MSTATUSH        0x310
> @@ -178,6 +179,7 @@
>  #define CSR_SIE             0x104
>  #define CSR_STVEC           0x105
>  #define CSR_SCOUNTEREN      0x106
> +#define CSR_STVT            0x107 /* clic-spec-draft */
>
>  /* Supervisor Trap Handling */
>  #define CSR_SSCRATCH        0x140
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 39ff72041a..e12222b77f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -667,6 +667,18 @@ static int write_mcounteren(CPURISCVState *env, int
> csrno, target_ulong val)
>      return 0;
>  }
>
> +static int read_mtvt(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val =3D env->mtvt;
> +    return 0;
> +}
> +
> +static int write_mtvt(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->mtvt =3D val & ~((1ULL << 6) - 1);
>

mtvt CSR has additional minimum alignment restriction in v0.8 CLIC spec[1]:
  2^ceiling(log2(N)) x 4 bytes, where N is the maximum number of interrupt
sources.


> +    return 0;
> +}
> +
>  /* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
>  static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong
> *val)
>  {
> @@ -876,6 +888,18 @@ static int write_scounteren(CPURISCVState *env, int
> csrno, target_ulong val)
>      return 0;
>  }
>
> +static int read_stvt(CPURISCVState *env, int csrno, target_ulong *val)


stvt CSR seems not to exist in v0.8 CLIC spec[1].

[1] https://github.com/riscv/riscv-fast-interrupt/blob/74f86c3858/clic.adoc

Regards,
Frank Chang


>

+{
> +    *val =3D env->stvt;
> +    return 0;
> +}
> +
> +static int write_stvt(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->stvt =3D val & ~((1ULL << 6) - 1);
> +    return 0;
> +}
> +
>  /* Supervisor Trap Handling */
>  static int read_sscratch(CPURISCVState *env, int csrno, target_ulong *va=
l)
>  {
> @@ -1730,6 +1754,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", any32,  read_zero },
>
>      /* Machine Mode Core Level Interrupt Controller */
> +    [CSR_MTVT] =3D { "mtvt", clic,  read_mtvt,  write_mtvt      },
>      [CSR_MINTSTATUS] =3D { "mintstatus", clic,  read_mintstatus },
>      [CSR_MINTTHRESH] =3D { "mintthresh", clic,  read_mintthresh,
>                           write_mintthresh },
> @@ -1739,5 +1764,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_SINTTHRESH] =3D { "sintthresh", clic,  read_sintthresh,
>                           write_sintthresh },
>
> +    /* Supervisor Mode Core Level Interrupt Controller */
> +    [CSR_STVT] =3D { "stvt", clic,  read_stvt, write_stvt       },
> +
>  #endif /* !CONFIG_USER_ONLY */
>  };
> --
> 2.25.1
>
>
>

--000000000000a3c71105c5bb3af3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The xtvt WARL XLEN-bit CSR holds the base address of t=
he trap vector table,<br>
aligned on a 64-byte or greater power-of-two boundary.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/riscv/cpu_bits.h |=C2=A0 2 ++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 28 +++++++++++++++++++++++++=
+++<br>
=C2=A03 files changed, 32 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 9e389d7bbf..b5fd796f98 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -173,11 +173,13 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong medeleg;<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong stvec;<br>
+=C2=A0 =C2=A0 target_ulong stvt; /* clic-spec */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong sepc;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong scause;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong sintthresh; /* clic-spec */<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtvec;<br>
+=C2=A0 =C2=A0 target_ulong mtvt; /* clic-spec */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mepc;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mcause;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mtval;=C2=A0 /* since: priv-1.10.0 */<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 9447801d22..7922097776 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -149,6 +149,7 @@<br>
=C2=A0#define CSR_MIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x304<=
br>
=C2=A0#define CSR_MTVEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x305<br>
=C2=A0#define CSR_MCOUNTEREN=C2=A0 =C2=A0 =C2=A0 0x306<br>
+#define CSR_MTVT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x307 /* clic-sp=
ec-draft */<br>
<br>
=C2=A0/* 32-bit only */<br>
=C2=A0#define CSR_MSTATUSH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x310<br>
@@ -178,6 +179,7 @@<br>
=C2=A0#define CSR_SIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x104<=
br>
=C2=A0#define CSR_STVEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x105<br>
=C2=A0#define CSR_SCOUNTEREN=C2=A0 =C2=A0 =C2=A0 0x106<br>
+#define CSR_STVT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x107 /* clic-sp=
ec-draft */<br>
<br>
=C2=A0/* Supervisor Trap Handling */<br>
=C2=A0#define CSR_SSCRATCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x140<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 39ff72041a..e12222b77f 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -667,6 +667,18 @@ static int write_mcounteren(CPURISCVState *env, int cs=
rno, target_ulong val)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+static int read_mtvt(CPURISCVState *env, int csrno, target_ulong *val)<br>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;mtvt;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int write_mtvt(CPURISCVState *env, int csrno, target_ulong val)<br>
+{<br>
+=C2=A0 =C2=A0 env-&gt;mtvt =3D val &amp; ~((1ULL &lt;&lt; 6) - 1);<br></bl=
ockquote><div><br></div><div>mtvt CSR has additional minimum alignment rest=
riction in v0.8 CLIC spec[1]:</div><div>=C2=A0=C2=A02^ceiling(log2(N)) x 4 =
bytes, where N is the maximum number of interrupt sources.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */<br>
=C2=A0static int read_mscounteren(CPURISCVState *env, int csrno, target_ulo=
ng *val)<br>
=C2=A0{<br>
@@ -876,6 +888,18 @@ static int write_scounteren(CPURISCVState *env, int cs=
rno, target_ulong val)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+static int read_stvt(CPURISCVState *env, int csrno, target_ulong *val)</bl=
ockquote><div><br></div><div>stvt CSR seems not to exist in v0.8 CLIC spec[=
1].</div><div><br></div><div>[1]=C2=A0<a href=3D"https://github.com/riscv/r=
iscv-fast-interrupt/blob/74f86c3858/clic.adoc" target=3D"_blank">https://gi=
thub.com/riscv/riscv-fast-interrupt/blob/74f86c3858/clic.adoc</a><br></div>=
<div><br></div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;stvt;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int write_stvt(CPURISCVState *env, int csrno, target_ulong val)<br>
+{<br>
+=C2=A0 =C2=A0 env-&gt;stvt =3D val &amp; ~((1ULL &lt;&lt; 6) - 1);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0/* Supervisor Trap Handling */<br>
=C2=A0static int read_sscratch(CPURISCVState *env, int csrno, target_ulong =
*val)<br>
=C2=A0{<br>
@@ -1730,6 +1754,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0[CSR_MHPMCOUNTER31H] =3D { &quot;mhpmcounter31h&quot;, =
any32,=C2=A0 read_zero },<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Machine Mode Core Level Interrupt Controller */<br>
+=C2=A0 =C2=A0 [CSR_MTVT] =3D { &quot;mtvt&quot;, clic,=C2=A0 read_mtvt,=C2=
=A0 write_mtvt=C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MINTSTATUS] =3D { &quot;mintstatus&quot;, clic,=C2=
=A0 read_mintstatus },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MINTTHRESH] =3D { &quot;mintthresh&quot;, clic,=C2=
=A0 read_mintthresh,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 write_mintthresh },<br>
@@ -1739,5 +1764,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0[CSR_SINTTHRESH] =3D { &quot;sintthresh&quot;, clic,=C2=
=A0 read_sintthresh,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 write_sintthresh },<br>
<br>
+=C2=A0 =C2=A0 /* Supervisor Mode Core Level Interrupt Controller */<br>
+=C2=A0 =C2=A0 [CSR_STVT] =3D { &quot;stvt&quot;, clic,=C2=A0 read_stvt, wr=
ite_stvt=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000a3c71105c5bb3af3--


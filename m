Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkdXu-0001Zp-Uu
	for mharc-qemu-riscv@gnu.org; Fri, 29 Apr 2022 23:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdXq-0001ZK-P3
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 23:13:19 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:36727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdXo-0006GW-4n
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 23:13:18 -0400
Received: by mail-vs1-xe36.google.com with SMTP id a127so9223812vsa.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Apr 2022 20:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4yrHGeS8uGjD7aY4scQ7itb3XXxGebl4fRnP0cCwIv4=;
 b=jnhLktFV0OVYYbTcE7fAUxWJLLVdhYW9wVBi90TVUV8GSEZIphfVfQofO+KZYZFKui
 HyeJkdOxzONbfUnN/lPjzisoj8RzVHzfG2LpaI07CUEu4CEnxi4pAeA4Y8nWvENz8HH0
 qI8BfdThjDmJyv8U6pYOOrQoyKQv4vdTWgX1IajakfoW0v/WdrUETLLxOoaMmseJ1ibA
 3rjiPll/hxrRp91a6AXouvDrDag9/PnuiVIYksY3lyTNCatFSfV8ZXGX7wk2N6AhqBDx
 mkl4QO13ut9rCr+rtI8aJ8gCvkb7fMPNGpIAj1ZShfkNbLbsWE2MDWqvZN9j0n2LCfW0
 KMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4yrHGeS8uGjD7aY4scQ7itb3XXxGebl4fRnP0cCwIv4=;
 b=wdgdBI4F8BLc1RWMExZ10ZETkbTHKipmT2V20ejNGfxWROtVUJBLbfh31y2Nc3maEP
 I3Cb1nU0PVhGBQURUQriHQmC92bmk2QkDk7DhZxqBR9qDER15aU/uqCcbI4buaXAOBO6
 SyDyjIGFss9YoegqqV1oU1xS0ttib5d1y+YEloluj2xR02ccECuREP3kDLyaGChf1jkQ
 cDARLzYM1Evxh5Aag9rAiCs6peUC9Of8KIMwDR6PEkRvUol5ozg210Br1CepdoUcLNol
 6OvdboRbyaN+fM5QGMfJH428e+ZbKfod2FZyJ3JW/orXsIICkVvF9YLqH7cayCPGq2tk
 43fA==
X-Gm-Message-State: AOAM530W5f6mclc0XlUXKMr8kPB2p3Xt5QZjGckztK2iBp8acsMIMOdd
 0UmAlLrt3a8E2pQL9qWRqpc+YTlnoDx+DHoRs88=
X-Google-Smtp-Source: ABdhPJygsrdR7R9K7WNs8G0pVtbiBFX4Qw7UEQsHVcRYvuPp9YQG0YAlZg9Ek+Ftt0czq5MM3lvMrw==
X-Received: by 2002:a67:e252:0:b0:32c:c072:523c with SMTP id
 w18-20020a67e252000000b0032cc072523cmr614941vse.74.1651288393655; 
 Fri, 29 Apr 2022 20:13:13 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177]) by smtp.gmail.com with ESMTPSA id
 v123-20020a1f4881000000b0034e6f1fd06csm166110vka.54.2022.04.29.20.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 20:13:12 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id m203so4528238vke.13;
 Fri, 29 Apr 2022 20:13:12 -0700 (PDT)
X-Received: by 2002:a1f:43d2:0:b0:345:12db:2f26 with SMTP id
 q201-20020a1f43d2000000b0034512db2f26mr667524vka.23.1651288392109; Fri, 29
 Apr 2022 20:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-3-apatel@ventanamicro.com>
In-Reply-To: <20220429153431.308829-3-apatel@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 30 Apr 2022 11:13:01 +0800
X-Gmail-Original-Message-ID: <CANzO1D3bzVyp_bb83zi_p4bRTnMOyzsSbzfi8GXk12vUk6RwJA@mail.gmail.com>
Message-ID: <CANzO1D3bzVyp_bb83zi_p4bRTnMOyzsSbzfi8GXk12vUk6RwJA@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="0000000000000892ba05ddd68a8f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=frank.chang@sifive.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 30 Apr 2022 03:13:20 -0000

--0000000000000892ba05ddd68a8f
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Fri, Apr 29, 2022 at 11:44 PM Anup Patel <apatel@ventanamicro.com> wrote:

> The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
> implementation that don't want to implement can simply have a dummy
> mcountinhibit which always zero.
>
> Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in
> the CSR ops.")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu_bits.h | 3 +++
>  target/riscv/csr.c      | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 4d04b20d06..4a55c6a709 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -159,6 +159,9 @@
>  #define CSR_MTVEC           0x305
>  #define CSR_MCOUNTEREN      0x306
>
> +/* Machine Counter Setup */
> +#define CSR_MCOUNTINHIBIT   0x320
> +
>  /* 32-bit only */
>  #define CSR_MSTATUSH        0x310
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2bf0a97196..e144ce7135 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie
>          },
>      [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,
>  write_mtvec       },
>      [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,
> write_mcounteren  },
> +    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
> +                                             .min_priv_ver =
> PRIV_VERSION_1_11_0 },
>
>      [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,
> write_mstatush    },
>
> --
> 2.34.1
>
>
>

--0000000000000892ba05ddd68a8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"m=
ailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 29,=
 2022 at 11:44 PM Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com"=
>apatel@ventanamicro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">The mcountinhibit CSR is mandatory for priv spec v1=
.11 or higher. For<br>
implementation that don&#39;t want to implement can simply have a dummy<br>
mcountinhibit which always zero.<br>
<br>
Fixes: a4b2fa433125 (&quot;target/riscv: Introduce privilege version field =
in<br>
the CSR ops.&quot;)<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com" ta=
rget=3D"_blank">apatel@ventanamicro.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_bits.h | 3 +++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A02 files changed, 5 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 4d04b20d06..4a55c6a709 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -159,6 +159,9 @@<br>
=C2=A0#define CSR_MTVEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x305<br>
=C2=A0#define CSR_MCOUNTEREN=C2=A0 =C2=A0 =C2=A0 0x306<br>
<br>
+/* Machine Counter Setup */<br>
+#define CSR_MCOUNTINHIBIT=C2=A0 =C2=A00x320<br>
+<br>
=C2=A0/* 32-bit only */<br>
=C2=A0#define CSR_MSTATUSH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x310<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 2bf0a97196..e144ce7135 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0[CSR_MIE]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;=
mie&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 any,=C2=A0 =C2=A0NULL,=C2=A0 =C2=A0 N=
ULL,=C2=A0 =C2=A0 rmw_mie=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MTVEC]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { &quot;mtvec=
&quot;,=C2=A0 =C2=A0 =C2=A0 any,=C2=A0 =C2=A0read_mtvec,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0write_mtvec=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MCOUNTEREN]=C2=A0 =3D { &quot;mcounteren&quot;, an=
y,=C2=A0 =C2=A0read_mcounteren,=C2=A0 write_mcounteren=C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_MCOUNTINHIBIT] =3D { &quot;mcountinhibit&quot;, any, re=
ad_zero, write_ignore,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.min_priv_ver =3D PRIV_VERSION_1_11_0 },<br>
<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MSTATUSH]=C2=A0 =C2=A0 =3D { &quot;mstatush&quot;,=
=C2=A0 =C2=A0any32, read_mstatush,=C2=A0 =C2=A0 write_mstatush=C2=A0 =C2=A0=
 },<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000000892ba05ddd68a8f--


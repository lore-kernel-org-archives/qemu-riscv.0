Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7dXo-0005zs-BJ
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 08:20:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dXh-0005uD-3Q
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:19:58 -0500
Received: from [2607:f8b0:4864:20::1031] (port=44770
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dXe-00048p-Gr
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:19:56 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so4663419pji.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 05:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IKRnPBwvStuYmtP9VBY0hs/lBM87YEuHTI8MryYLbEs=;
 b=DprAxNNugwyaysm5Xrv7hpwMGAR4RpxznvuTEL2/GOTEnyyAAZk5UpkEZcdRo4YvOh
 UzDJVaiq90o1TNyaTaOSETtuotjKmy43CyzOh71WXdWzXSeXzdrfHncBulYbfRHgaUuu
 CM0zJ2hm1THjUEFwkCBsUX8eN0X6aGitqJgi/gfd4DEqMwBeUkq0sNHK/yHIVwvp4MOk
 A30GAViMdrDdq9gja25QD7/xTANl6790XU0xIDqgIPzfMKdLMC3sfoDpapr3qlmSikZL
 pvFNR0Ab741Jgo7D2bU+ba8bkfID0o9q7bYKS9uZCkWvCqzLzIFy7UfEcCL9g8S+jF5A
 BrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IKRnPBwvStuYmtP9VBY0hs/lBM87YEuHTI8MryYLbEs=;
 b=F/H6EOQIArtDsAJeWmbFU4ZzSmNNJjbZUBoWqeeMlJ8IFChzXqV9vn0vjBzOFVMGZE
 pMgKaL4z/xQ9tV1KY/HXM9IvBMC+fzIbk+odRZbz1QZuXvxX/x7DS4FPLAcrQMUvM3/b
 KIEItvsshkFYy0e9qgX/Hn8FDZCj8x7dGu9lm4lz2ETG4NriKOe4NYX1S1rIIeOiJ1JO
 vN4uzJdaFnwtrO2njwNvlSpiUHiC90mCAsw+m+vOcgLi7FCE1XOVP/jDwNXiDVlbWHG8
 twBb7U2A7ctTLkXSsftxyQ/IHFllUz+Ixi9PFvV1lw41uqMFpmb/LxxuKzAorQMx4YCK
 R8FA==
X-Gm-Message-State: AOAM530yYt0HmwYmNVq981ex5MASqlcvYeAWWoYltEySactjbgsugu8C
 SOqbknL4rc/HoNNoL2tyK3D2jBLi4Ktf/PhX
X-Google-Smtp-Source: ABdhPJwbYIDqVbONQFCKZ9tQKMq8tTFrt3yKAqQG2qFHm83zQsTH0dgGltMeguc4hypOkn73G6Lxrg==
X-Received: by 2002:a17:902:8d82:b0:149:a740:d8d0 with SMTP id
 v2-20020a1709028d8200b00149a740d8d0mr9453840plo.5.1641993591604; 
 Wed, 12 Jan 2022 05:19:51 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com.
 [209.85.216.53])
 by smtp.gmail.com with ESMTPSA id x6sm2691016pge.50.2022.01.12.05.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 05:19:51 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id pj2so4811989pjb.2;
 Wed, 12 Jan 2022 05:19:50 -0800 (PST)
X-Received: by 2002:a17:902:b710:b0:14a:28ee:fe6b with SMTP id
 d16-20020a170902b71000b0014a28eefe6bmr9188968pls.119.1641993590486; Wed, 12
 Jan 2022 05:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-18-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-18-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 21:19:39 +0800
X-Gmail-Original-Message-ID: <CANzO1D2woQKeqP8XnJ9c8z0MvBjiUAPnYVGLJMZX5sMGwj=_Aw@mail.gmail.com>
Message-ID: <CANzO1D2woQKeqP8XnJ9c8z0MvBjiUAPnYVGLJMZX5sMGwj=_Aw@mail.gmail.com>
Subject: Re: [PATCH v6 17/23] target/riscv: Allow users to force enable AIA
 CSRs in HART
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000af405805d5626c9d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Wed, 12 Jan 2022 13:20:00 -0000

--000000000000af405805d5626c9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:57=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> We add "x-aia" command-line option for RISC-V HART using which
> allows users to force enable CPU AIA CSRs without changing the
> interrupt controller available in RISC-V machine.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 5 +++++
>  target/riscv/cpu.h | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9ad26035e1..1ae9e15b27 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -463,6 +463,10 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r
> **errp)
>          }
>      }
>
> +    if (cpu->cfg.aia) {
> +        riscv_set_feature(env, RISCV_FEATURE_AIA);
> +    }
> +
>      set_resetvec(env, cpu->cfg.resetvec);
>
>      /* Validate that MISA_MXL is set properly. */
> @@ -691,6 +695,7 @@ static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> +    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec,
> DEFAULT_RSTVEC),
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 82272f99fd..0b24c4324b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -362,6 +362,7 @@ struct RISCVCPU {
>          bool mmu;
>          bool pmp;
>          bool epmp;
> +        bool aia;
>          uint64_t resetvec;
>      } cfg;
>  };
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000af405805d5626c9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:57=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
We add &quot;x-aia&quot; command-line option for RISC-V HART using which<br=
>
allows users to force enable CPU AIA CSRs without changing the<br>
interrupt controller available in RISC-V machine.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 5 +++++<br>
=C2=A0target/riscv/cpu.h | 1 +<br>
=C2=A02 files changed, 6 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 9ad26035e1..1ae9e15b27 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -463,6 +463,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (cpu-&gt;cfg.aia) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_set_feature(env, RISCV_FEATURE_AIA);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0set_resetvec(env, cpu-&gt;cfg.resetvec);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Validate that MISA_MXL is set properly. */<br>
@@ -691,6 +695,7 @@ static Property riscv_cpu_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-j&quot;, RISCVCPU, cfg.ext_j, =
false),<br>
=C2=A0 =C2=A0 =C2=A0/* ePMP 0.9.3 */<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-epmp&quot;, RISCVCPU, cfg.epmp=
, false),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;x-aia&quot;, RISCVCPU, cfg.aia, false=
),<br>
<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT64(&quot;resetvec&quot;, RISCVCPU, cfg.=
resetvec, DEFAULT_RSTVEC),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 82272f99fd..0b24c4324b 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -362,6 +362,7 @@ struct RISCVCPU {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool mmu;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool pmp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool epmp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool aia;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t resetvec;<br>
=C2=A0 =C2=A0 =C2=A0} cfg;<br>
=C2=A0};<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--000000000000af405805d5626c9d--


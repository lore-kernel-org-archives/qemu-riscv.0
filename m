Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7utU-0006M8-90
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 02:51:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7utK-0006K3-WC
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 02:51:34 -0500
Received: from [2607:f8b0:4864:20::629] (port=36695
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7utJ-0000TW-CT
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 02:51:26 -0500
Received: by mail-pl1-x629.google.com with SMTP id p14so8472560plf.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 23:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1l0ZQ9g90jUyomU5z3SoVoFHNNYAF9oAdzWfgbujbJg=;
 b=OZtKh1Iv4dC0KW9hhDe4GXrSII4vxgwdasOm9Eoajf2qJeADp/Sfo9RjERrdqVveam
 NvGFB1iNsWF3RSPtP6Yff/u1Xf0VW9LyX9d5/dtn3sR/6WYIMAIBcYzm0G41rB1xWc22
 J6MHPKtcZTRQy9v30mVoI4PhLcnOrcmijx2ZF/rs6PoMhIA8suqYcDjgUzW86+0r8dzQ
 5h8V9eh3IDPsSYP77mm4yMb+vcBcQl+ERGufB/0Furvdw/onI4fEz/DwYTn5IclAo5jF
 TxKbDypkoYUBJBeVGt3Gn5AokauIdCnyXmCTnTMaPa1AIp4j4Gcn0kDXJh9A48utkt/M
 kRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1l0ZQ9g90jUyomU5z3SoVoFHNNYAF9oAdzWfgbujbJg=;
 b=kw52Gd4DuRjDYKlbgJnmbengBwDNdMOge7PdgPHSTuxHRuEiCL4vZH+4AcUQSuAER6
 7EFu4ngcuo+KPXBo2h8eNBDoGJcHM/3py4Fm0pDt4KdPqk9UxJiu3icEn1beOdr0+Hk+
 WONVZ22rsmMmUkQfUGqJm5ZEldSNTSF0kGHlYnyzESThrnec/x0OVGCPEaIBLBVVYboy
 C/Smn+5SSKxGhHJGRcgBJqpABmNv1xgIQ0xNzxDmi1w7kwUnTUuIcB7MLwvJ1YM14lSm
 Jq2KxgB3oW4FMv1QOF3ZH1ZJIYhySzanWK/lp4AZ4KVa3cQFU/RR693ppQn++6EOJ33D
 DLRw==
X-Gm-Message-State: AOAM5316cA1YB7aGBx3hE1u7PEZbBtf1cfuap2MueVEPeED+yMbADJyP
 KOV5IEF/GwliECunHoTfGydNNdk0ikCYzyJ0
X-Google-Smtp-Source: ABdhPJw2uHM6QKhvodRlCq6nCz3O0hYKmcZwDxBfPVPUltnj6x1oz4UC6SQrLJShklwuT7RO9I4s7A==
X-Received: by 2002:a62:1884:0:b0:4c1:3c05:3170 with SMTP id
 126-20020a621884000000b004c13c053170mr3163281pfy.78.1642060282868; 
 Wed, 12 Jan 2022 23:51:22 -0800 (PST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com.
 [209.85.216.48])
 by smtp.gmail.com with ESMTPSA id q16sm1856397pfu.31.2022.01.12.23.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 23:51:22 -0800 (PST)
Received: by mail-pj1-f48.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so17642739pjf.3; 
 Wed, 12 Jan 2022 23:51:21 -0800 (PST)
X-Received: by 2002:a65:6ab8:: with SMTP id x24mr2932472pgu.50.1642060281410; 
 Wed, 12 Jan 2022 23:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-5-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-5-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 13 Jan 2022 15:51:10 +0800
X-Gmail-Original-Message-ID: <CANzO1D3FmZJVwmZmaxNS1SDYBGvEUYbahzbA2th_RtiB=z2jkg@mail.gmail.com>
Message-ID: <CANzO1D3FmZJVwmZmaxNS1SDYBGvEUYbahzbA2th_RtiB=z2jkg@mail.gmail.com>
Subject: Re: [PATCH v6 04/23] target/riscv: Improve delivery of guest external
 interrupts
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c5fbfc05d571f382"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Thu, 13 Jan 2022 07:51:35 -0000

--000000000000c5fbfc05d571f382
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:48=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The guest external interrupts from an interrupt controller are
> delivered only when the Guest/VM is running (i.e. V=3D1). This means
> any guest external interrupt which is triggered while the Guest/VM
> is not running (i.e. V=3D0) will be missed on QEMU resulting in Guest
> with sluggish response to serial console input and other I/O events.
>
> To solve this, we check and inject interrupt after setting V=3D1.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index bf50699b1f..43d6311e49 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -325,6 +325,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env,
> bool enable)
>      }
>
>      env->virt =3D set_field(env->virt, VIRT_ONOFF, enable);
> +
> +    if (enable) {
> +       /*
> +        * The guest external interrupts from an interrupt controller are
> +        * delivered only when the Guest/VM is running (i.e. V=3D1). This
> means
> +        * any guest external interrupt which is triggered while the
> Guest/VM
> +        * is not running (i.e. V=3D0) will be missed on QEMU resulting i=
n
> guest
> +        * with sluggish response to serial console input and other I/O
> events.
> +        *
> +        * To solve this, we check and inject interrupt after setting V=
=3D1.
> +        */
> +        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
> +    }
>  }
>
>  bool riscv_cpu_two_stage_lookup(int mmu_idx)
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000c5fbfc05d571f382
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:48=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The guest external interrupts from an interrupt controller are<br>
delivered only when the Guest/VM is running (i.e. V=3D1). This means<br>
any guest external interrupt which is triggered while the Guest/VM<br>
is not running (i.e. V=3D0) will be missed on QEMU resulting in Guest<br>
with sluggish response to serial console input and other I/O events.<br>
<br>
To solve this, we check and inject interrupt after setting V=3D1.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_helper.c | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index bf50699b1f..43d6311e49 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -325,6 +325,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bo=
ol enable)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;virt =3D set_field(env-&gt;virt, VIRT_ONOFF, en=
able);<br>
+<br>
+=C2=A0 =C2=A0 if (enable) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The guest external interrupts from an interr=
upt controller are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * delivered only when the Guest/VM is running =
(i.e. V=3D1). This means<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * any guest external interrupt which is trigge=
red while the Guest/VM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is not running (i.e. V=3D0) will be missed o=
n QEMU resulting in guest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * with sluggish response to serial console inp=
ut and other I/O events.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * To solve this, we check and inject interrupt=
 after setting V=3D1.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_mip(env_archcpu(env), 0, 0);<=
br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0bool riscv_cpu_two_stage_lookup(int mmu_idx)<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--000000000000c5fbfc05d571f382--


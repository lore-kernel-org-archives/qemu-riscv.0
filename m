Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxAI0-00038M-Sc
	for mharc-qemu-riscv@gnu.org; Sat, 26 Jun 2021 11:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxAHy-000381-TW
 for qemu-riscv@nongnu.org; Sat, 26 Jun 2021 11:32:10 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxAHx-0006aM-4H
 for qemu-riscv@nongnu.org; Sat, 26 Jun 2021 11:32:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so9774854pjb.5
 for <qemu-riscv@nongnu.org>; Sat, 26 Jun 2021 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+NLk3q/cwf45H3zVt7xOm1DcHB8kLvt9582VeNChsg0=;
 b=mJoa0CuZvxFckMWmcXJWty4iuIXGOgBnpXeOTG66Xuj0b2vBj3VBK9L6sbU+hptXPP
 g35d5dLU0/ER6ph+bgwXxfrc+qzaS1LMifU4A0rOiltTzmbR6TDGEZP/yLKwy3qQTkIu
 4Fll0keneTJnxrBrSgxYKk4vDMZwWHuwOz5U0n0lS+ro/6XrMQQPIEO7j6sEpWGKUGzH
 E/28OcSMf8uiIf7cyfn+wP4WgAmCJhoezZpAMJBCcH0wdLKH/9VNUbccAjHpthe4emoT
 2rA69RH6OFN+7QJVnY2zhzSGppt6HUEY2IX4G84irLvdjDWNzRIVc5SNmtS5io0WVlIk
 V6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+NLk3q/cwf45H3zVt7xOm1DcHB8kLvt9582VeNChsg0=;
 b=PhJ9QLZRpiGnKL0wAv78DbZI8KIOQfHnfyAJRaP697DP8/6ZozwUTse6qMr2JsYnoe
 soOrZprOgHbGnxhsv1/GjQUvuaKAEeBdluO67IO5FClUM5o4iOpgXPL+jKb9VVpTZiRX
 BeCIDBcaoO4ZSbUCQBHXttv/qbBnxplVpoOFkGkWz+s+g9TTNCfHbGzzvG7WDI8EpMZF
 h4IrofSsiBY71YgMlrrbgrXEohxkTSHBdC4vqaU0CFGULgbx30NywtoQH4oPmr8S4CC/
 FD7r0Dot3q3as8pnzleYeqlta2gdiQFZRqxUgBg67xHOsytAFhCG6F1I1H8ZZZNVuEqR
 hT9Q==
X-Gm-Message-State: AOAM530o0rFrJ0VM1i7EGjf/YYZnaHi/5ZX7iEguzHYuDNub/mwwolO8
 pQJeArr5eT3qiVf3YzDnLnA/rQ==
X-Google-Smtp-Source: ABdhPJyjGeli7svl3MakfM9zFS9F6OQ/5DLv7dD+4oqdRLo/KvSFy5/f8sbfpEr0hufP0iv+CgyGog==
X-Received: by 2002:a17:902:8ec9:b029:11f:f1dc:6c8d with SMTP id
 x9-20020a1709028ec9b029011ff1dc6c8dmr13986900plo.34.1624721527377; 
 Sat, 26 Jun 2021 08:32:07 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com.
 [209.85.215.181])
 by smtp.gmail.com with ESMTPSA id k7sm3678731pfp.65.2021.06.26.08.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 08:32:06 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id u190so10908217pgd.8;
 Sat, 26 Jun 2021 08:32:06 -0700 (PDT)
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr14693981pgb.110.1624721526461; 
 Sat, 26 Jun 2021 08:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-10-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-10-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 26 Jun 2021 23:31:55 +0800
X-Gmail-Original-Message-ID: <CANzO1D3WGPPUB2XUq3XSO3DYFb8D_bN9rtt_uvq3QaUuE9fAaQ@mail.gmail.com>
Message-ID: <CANzO1D3WGPPUB2XUq3XSO3DYFb8D_bN9rtt_uvq3QaUuE9fAaQ@mail.gmail.com>
Subject: Re: [RFC PATCH 09/11] target/riscv: Update CSR mclicbase in CLIC mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000719c3c05c5acf5a5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Sat, 26 Jun 2021 15:32:11 -0000

--000000000000719c3c05c5acf5a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A

> The machine mode mclicbase CSR is an XLEN-bit read-only register providin=
g
> the base address of CLIC memory mapped registers.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  hw/intc/riscv_clic.c | 1 +
>  target/riscv/cpu.h   | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/hw/intc/riscv_clic.c b/hw/intc/riscv_clic.c
> index 8ad534c506..e902dd4062 100644
> --- a/hw/intc/riscv_clic.c
> +++ b/hw/intc/riscv_clic.c
> @@ -715,6 +715,7 @@ static void riscv_clic_realize(DeviceState *dev, Erro=
r
> **errp)
>                                           &cpu->env, 1);
>          qdev_connect_gpio_out(dev, i, irq);
>          cpu->env.clic =3D clic;
> +        cpu->env.mclicbase =3D clic->mclicbase;
>      }
>  }
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b5fd796f98..b0b8565649 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -162,6 +162,7 @@ struct CPURISCVState {
>      uint32_t miclaim;
>      uint32_t mintstatus; /* clic-spec */
>      target_ulong mintthresh; /* clic-spec */
> +    target_ulong mclicbase; /* clic-spec */
>
>      target_ulong mie;
>      target_ulong mideleg;
> --
> 2.25.1
>
>
>
Is it because current spec doesn't specify the number of mclicbase CSR
(0x3??)
so you are not adding it into csr.c?

If so,

Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000719c3c05c5acf5a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The machine mode mclicbase CSR is an XLEN-bit read-onl=
y register providing<br>
the base address of CLIC memory mapped registers.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0hw/intc/riscv_clic.c | 1 +<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0| 1 +<br>
=C2=A02 files changed, 2 insertions(+)<br>
<br>
diff --git a/hw/intc/riscv_clic.c b/hw/intc/riscv_clic.c<br>
index 8ad534c506..e902dd4062 100644<br>
--- a/hw/intc/riscv_clic.c<br>
+++ b/hw/intc/riscv_clic.c<br>
@@ -715,6 +715,7 @@ static void riscv_clic_realize(DeviceState *dev, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;cpu-&gt;env, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_connect_gpio_out(dev, i, irq);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;env.clic =3D clic;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;env.mclicbase =3D clic-&gt;mclicbase;<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index b5fd796f98..b0b8565649 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -162,6 +162,7 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t miclaim;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t mintstatus; /* clic-spec */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mintthresh; /* clic-spec */<br>
+=C2=A0 =C2=A0 target_ulong mclicbase; /* clic-spec */<br>
<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mie;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mideleg;<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Is it because current spec doesn&#39;t=
 specify the number of mclicbase CSR (0x3??)</div><div>so you are not addin=
g it into csr.c?</div><div><br></div><div>If so,</div><div><br></div><div>R=
eviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com">frank=
.chang@sifive.com</a>&gt;</div></div></div>

--000000000000719c3c05c5acf5a5--


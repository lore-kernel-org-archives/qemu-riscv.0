Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7db5-00026W-48
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 08:23:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dav-00022h-Hq
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:23:22 -0500
Received: from [2607:f8b0:4864:20::102b] (port=39617
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dat-0004pN-FD
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:23:17 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso12015807pjm.4
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 05:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=27fNSMg2VqF3iINeXPKi+bPCAJxOUAoNPZl8wQE/2PQ=;
 b=g2iKNKlhnV4ZRcLBBZzuYIERXxlXkjop5FXykX15I0uUgnbLpGg4D2iZpjzFbafFxJ
 xzD91pAGFCWyA4Pr/ZUhMoAWekzpNmAUMAtWEq9r2oCXddL88oQkYoChHbBXGLjhDhQj
 olyW4VfhmjgkhVceaQ1zkE2tttPxrfzP4ycT81rch8uZMTF4r9XNQlnIuTjnYCyxergi
 0SPfRUUwKrrEd5L/qe1+KKe9ZcoP467dl+P7dY7Ttps4E41q0xWc8KdqwkK18534tgxP
 9PVJd1cc//LUCDjqk+YwMOeOhJDfz9fXdbN91atfm/KlbDDIIMZkD0azugI0AvZry0z/
 vC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=27fNSMg2VqF3iINeXPKi+bPCAJxOUAoNPZl8wQE/2PQ=;
 b=pGfj3fd8ZxQlgq4k7ovwy6GWqb29c/FZgrOJ2BLfjzHLfx9iVCH4HRWjiYMEQARaR9
 V09XJL8g6og5z4Fheiqrk7+A/ZC1prxnsZIiMnoGjbfMZ+FN651XpfxtrSJB8yMWAPqL
 c7P1MzOj+9izKfsQAkM0xrK6J/l5dtQM7gr7JDieJJ7DoylAZ//LlyUJzZXsKWogsV92
 C3t/GMDKcFyuL9SdUiGAA4QndorkKhE1Bh8bp/lAxzwLQ9M3ygzYXS6+OZ9Y5OTDukAR
 vQ5ys4v5eioGnMvO/WNAWvhWMzvD4PeUq7+A+U7TlwNiL5/3VjkVO7LO5W7ybpML1RgV
 7mvg==
X-Gm-Message-State: AOAM533gZ5VvKxZig+Ijp9j2SBfGjHeqiorhhOiDpV/cSi2a1UyMLOQG
 9Lo2ZwLLzO/cSn7ylvlopx62ds1mc080tfKV
X-Google-Smtp-Source: ABdhPJxie+1SBLyXV0DN1szo6HasmBWrUpaculF6M82XzbFt88yA8pyuNgmfMJ2m9LQmavfKQhGWkw==
X-Received: by 2002:a17:90b:17c6:: with SMTP id
 me6mr5422786pjb.141.1641993793639; 
 Wed, 12 Jan 2022 05:23:13 -0800 (PST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com.
 [209.85.216.43])
 by smtp.gmail.com with ESMTPSA id g14sm2671011pgp.76.2022.01.12.05.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 05:23:13 -0800 (PST)
Received: by mail-pj1-f43.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so4661859pjb.5; 
 Wed, 12 Jan 2022 05:23:12 -0800 (PST)
X-Received: by 2002:a05:6a00:26c5:b0:4bd:4ad6:9c71 with SMTP id
 p5-20020a056a0026c500b004bd4ad69c71mr9380126pfw.45.1641993792356; Wed, 12 Jan
 2022 05:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-23-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-23-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 21:23:01 +0800
X-Gmail-Original-Message-ID: <CANzO1D2uubuM5gc0n3YbMQ-J2PmUa8djLxsGcPrVT4AKOsZR7A@mail.gmail.com>
Message-ID: <CANzO1D2uubuM5gc0n3YbMQ-J2PmUa8djLxsGcPrVT4AKOsZR7A@mail.gmail.com>
Subject: Re: [PATCH v6 22/23] docs/system: riscv: Document AIA options for
 virt machine
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b7853605d562781c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Wed, 12 Jan 2022 13:23:23 -0000

--000000000000b7853605d562781c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:03=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> We have two new machine options "aia" and "aia-guests" available
> for the RISC-V virt machine so let's document these options.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  docs/system/riscv/virt.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index fa016584bf..373645513a 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -63,6 +63,22 @@ The following machine-specific options are supported:
>    When this option is "on", ACLINT devices will be emulated instead of
>    SiFive CLINT. When not specified, this option is assumed to be "off".
>
> +- aia=3D[none|aplic|aplic-imsic]
> +
> +  This option allows selecting interrupt controller defined by the AIA
> +  (advanced interrupt architecture) specification. The "aia=3Daplic" sel=
ects
> +  APLIC (advanced platform level interrupt controller) to handle wired
> +  interrupts whereas the "aia=3Daplic-imsic" selects APLIC and IMSIC
> (incoming
> +  message signaled interrupt controller) to handle both wired interrupts
> and
> +  MSIs. When not specified, this option is assumed to be "none" which
> selects
> +  SiFive PLIC to handle wired interrupts.
> +
> +- aia-guests=3Dnnn
> +
> +  The number of per-HART VS-level AIA IMSIC pages to be emulated for a
> guest
> +  having AIA IMSIC (i.e. "aia=3Daplic-imsic" selected). When not specifi=
ed,
> +  the default number of per-HART VS-level AIA IMSIC pages is 0.
> +
>  Running Linux kernel
>  --------------------
>
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000b7853605d562781c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:03=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
We have two new machine options &quot;aia&quot; and &quot;aia-guests&quot; =
available<br>
for the RISC-V virt machine so let&#39;s document these options.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0docs/system/riscv/virt.rst | 16 ++++++++++++++++<br>
=C2=A01 file changed, 16 insertions(+)<br>
<br>
diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst<br>
index fa016584bf..373645513a 100644<br>
--- a/docs/system/riscv/virt.rst<br>
+++ b/docs/system/riscv/virt.rst<br>
@@ -63,6 +63,22 @@ The following machine-specific options are supported:<br=
>
=C2=A0 =C2=A0When this option is &quot;on&quot;, ACLINT devices will be emu=
lated instead of<br>
=C2=A0 =C2=A0SiFive CLINT. When not specified, this option is assumed to be=
 &quot;off&quot;.<br>
<br>
+- aia=3D[none|aplic|aplic-imsic]<br>
+<br>
+=C2=A0 This option allows selecting interrupt controller defined by the AI=
A<br>
+=C2=A0 (advanced interrupt architecture) specification. The &quot;aia=3Dap=
lic&quot; selects<br>
+=C2=A0 APLIC (advanced platform level interrupt controller) to handle wire=
d<br>
+=C2=A0 interrupts whereas the &quot;aia=3Daplic-imsic&quot; selects APLIC =
and IMSIC (incoming<br>
+=C2=A0 message signaled interrupt controller) to handle both wired interru=
pts and<br>
+=C2=A0 MSIs. When not specified, this option is assumed to be &quot;none&q=
uot; which selects<br>
+=C2=A0 SiFive PLIC to handle wired interrupts.<br>
+<br>
+- aia-guests=3Dnnn<br>
+<br>
+=C2=A0 The number of per-HART VS-level AIA IMSIC pages to be emulated for =
a guest<br>
+=C2=A0 having AIA IMSIC (i.e. &quot;aia=3Daplic-imsic&quot; selected). Whe=
n not specified,<br>
+=C2=A0 the default number of per-HART VS-level AIA IMSIC pages is 0.<br>
+<br>
=C2=A0Running Linux kernel<br>
=C2=A0--------------------<br>
<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--000000000000b7853605d562781c--


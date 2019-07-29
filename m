Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hs9VW-0007ts-E4
	for mharc-qemu-riscv@gnu.org; Mon, 29 Jul 2019 13:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hs9VU-0007te-2K
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 13:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hs9VS-00085w-U9
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 13:32:20 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:35472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hs9VS-00083P-ND
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 13:32:18 -0400
Received: by mail-io1-xd36.google.com with SMTP id m24so121875236ioo.2
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2019 10:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O2HTUKYvHlRqmkm0dGzs7uXFFIWYFCO+j7nCy0iZr+Y=;
 b=Jt8bmjjDBUyPEIQDTjb3JJUwMG4vN3vCLFDnLSQXlygo6NIfinEp3cLjInQU7r9g2u
 CZJkWjKNbSYPov8R/Es667P/7DWMJVKwN45nRnWYKa0u992sQ4lAA2uQHa/ZW5wu6cgr
 l/ooypM/dGlhGqv8YeneBCHCQJtP+5XdTYnajGfyYq8EPwiRVFofO5eEN6ub3W1SvG4j
 ctcJnP2K0oLsrY1LqB9G5/TrenahRHec4seVp5QA8syh59JCzmFcFykFbBOg9jYp9iSW
 t98w2ZQjd2eXsYNkXbP+qXfUgp1Xi3NpNOpArMapoTCV7lluA8OMI/CEI/sY/8AK5h3z
 /rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O2HTUKYvHlRqmkm0dGzs7uXFFIWYFCO+j7nCy0iZr+Y=;
 b=m6Tg/5DRgFqItAHBqOuK8GbwAlKiWuGkkPd7LZx6j3Adv7RMCDb3ySz/snzWAdu4uL
 PGMV0NPOOEWcacyc346Tto5JZ5vh5fzK6NZUmuYH7NrEIA4YGA0fGiK1H+/81ZMteUVs
 DGfgOWSj2iMKxGC/QFztlvPIgEC2lMB/0vxetFV2a6U074WgdJ1z5oeZfBM6Pknc2+cC
 mGuMJg/E/UKhVkCkm+vVhHHNwdy9RTLhxG4ylfTbeOY71c4207fA3D/x3BADCoKKzeoO
 XPqOsyTBMaK3LOKIax1hupj6nrGRSAQ9ef9Cc8UbA9gCiygR/OoHJRVKXiNsNKJrY13K
 QO1g==
X-Gm-Message-State: APjAAAUTs0rQfWe7+HeV2WoPLXxc/JtsTGQbMp4mTajCz9eHUNrSRrtH
 Tf2weWnjPSdzvGXtRJ8cNXzdcQlfQPUddJr3l72pAw==
X-Google-Smtp-Source: APXvYqx7vQww1lnLSXxVrSaztwX3rwhtlgRsyRFAHjX26zQblXRZh4Wo/Bbm/m2yUPiZC8yClhN3qURtTla4uIFgYcY=
X-Received: by 2002:a05:6638:5:: with SMTP id z5mr43147299jao.58.1564421537790; 
 Mon, 29 Jul 2019 10:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <50c1c6a3ace8b40f7b9d5395a2c3457cf1852721.1564080680.git.alistair.francis@wdc.com>
In-Reply-To: <50c1c6a3ace8b40f7b9d5395a2c3457cf1852721.1564080680.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 30 Jul 2019 01:32:06 +0800
Message-ID: <CAEiOBXVO1W1p_K_ETC_x==9t0pZ2sctvp820M8FYwpXsXGuFgQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000000a1089058ed54661"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d36
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v1 3/6] riscv: plic:
 Remove unused interrupt functions
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
X-List-Received-Date: Mon, 29 Jul 2019 17:32:21 -0000

--0000000000000a1089058ed54661
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 26, 2019 at 2:55 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_plic.c         | 12 ------------
>  include/hw/riscv/sifive_plic.h |  3 ---
>  2 files changed, 15 deletions(-)
>
> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> index 0950e89e15..864a1bed42 100644
> --- a/hw/riscv/sifive_plic.c
> +++ b/hw/riscv/sifive_plic.c
> @@ -161,18 +161,6 @@ static void sifive_plic_update(SiFivePLICState *plic)
>      }
>  }
>
> -void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq)
> -{
> -    sifive_plic_set_pending(plic, irq, true);
> -    sifive_plic_update(plic);
> -}
> -
> -void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq)
> -{
> -    sifive_plic_set_pending(plic, irq, false);
> -    sifive_plic_update(plic);
> -}
> -
>  static uint32_t sifive_plic_claim(SiFivePLICState *plic, uint32_t addrid)
>  {
>      int i, j;
> diff --git a/include/hw/riscv/sifive_plic.h
> b/include/hw/riscv/sifive_plic.h
> index ce8907f6aa..3b8a623919 100644
> --- a/include/hw/riscv/sifive_plic.h
> +++ b/include/hw/riscv/sifive_plic.h
> @@ -69,9 +69,6 @@ typedef struct SiFivePLICState {
>      uint32_t aperture_size;
>  } SiFivePLICState;
>
> -void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq);
> -void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq);
> -
>  DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>      uint32_t num_sources, uint32_t num_priorities,
>      uint32_t priority_base, uint32_t pending_base,
> --
> 2.22.0
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--0000000000000a1089058ed54661
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 26, 2019 at 2:55 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.franci=
s@wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.f=
rancis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/sifive_plic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 --------=
----<br>
=C2=A0include/hw/riscv/sifive_plic.h |=C2=A0 3 ---<br>
=C2=A02 files changed, 15 deletions(-)<br>
<br>
diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c<br>
index 0950e89e15..864a1bed42 100644<br>
--- a/hw/riscv/sifive_plic.c<br>
+++ b/hw/riscv/sifive_plic.c<br>
@@ -161,18 +161,6 @@ static void sifive_plic_update(SiFivePLICState *plic)<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq)<br>
-{<br>
-=C2=A0 =C2=A0 sifive_plic_set_pending(plic, irq, true);<br>
-=C2=A0 =C2=A0 sifive_plic_update(plic);<br>
-}<br>
-<br>
-void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq)<br>
-{<br>
-=C2=A0 =C2=A0 sifive_plic_set_pending(plic, irq, false);<br>
-=C2=A0 =C2=A0 sifive_plic_update(plic);<br>
-}<br>
-<br>
=C2=A0static uint32_t sifive_plic_claim(SiFivePLICState *plic, uint32_t add=
rid)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i, j;<br>
diff --git a/include/hw/riscv/sifive_plic.h b/include/hw/riscv/sifive_plic.=
h<br>
index ce8907f6aa..3b8a623919 100644<br>
--- a/include/hw/riscv/sifive_plic.h<br>
+++ b/include/hw/riscv/sifive_plic.h<br>
@@ -69,9 +69,6 @@ typedef struct SiFivePLICState {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t aperture_size;<br>
=C2=A0} SiFivePLICState;<br>
<br>
-void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq);<br>
-void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq);<br>
-<br>
=C2=A0DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,<br>
=C2=A0 =C2=A0 =C2=A0uint32_t num_sources, uint32_t num_priorities,<br>
=C2=A0 =C2=A0 =C2=A0uint32_t priority_base, uint32_t pending_base,<br>
-- <br>
2.22.0<br><br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &=
lt;<a href=3D"mailto:chihmin.chao@sifive.com">chihmin.chao@sifive.com</a>&g=
t;=C2=A0</div></div></div>

--0000000000000a1089058ed54661--


Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvHnV-0000kP-Ht
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 04:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49384)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHnT-0000k2-OD
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:59:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHnS-0001LP-PY
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:59:51 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hvHnS-0001Kj-JP
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 04:59:50 -0400
Received: by mail-ot1-x343.google.com with SMTP id x21so8060756otq.12
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eacNwtaXWw/Hsq3kq5Twu3UW189Htkm1zesFhiJ/biY=;
 b=QzcKYxFC781REm3liC3WhNwjXElyj3n3hGP7AwBrkx3npX4MsE/OBota3ecvB0XFiP
 gpy1DaUQMR2JCyWnF6j504fsMsViSMN91ttZIvqcnAVnR5DavKcJQt87djQ2AMZNEtKt
 7RgjLaTohJswTFfEXWgC0lS3R+v++Ahdbky1KQsEYNXfMgXvqI8pM1wgg1bYZHsZUsAb
 jzuVdqCtnzcYcFbbn45nbRLZLX+tbl5iu9tg6UtNw0UN3KZbYGRZTuLbpeXufEfUGZ1n
 HvdvsPvJumcIBEZkAjzok+nlkEkvQ0bp0nsUt7bjUbM36B2sddeOVCCvMIQDNYxU5vfN
 8DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eacNwtaXWw/Hsq3kq5Twu3UW189Htkm1zesFhiJ/biY=;
 b=q4CtqFAqVpbzhZ0g9C1PNMzbLuOCyypMkpc2oe8TMmjGZGBHMTQhfbfM2f7o0licHU
 VWS4e3SrSBNBI0rtHXaZLn2T0Da0e8tHG+7jXAfLDYZD8Sp2LjWm0IcvIJGJtcUBtgwM
 LRoVpMCMXIEAzGP6RY/uNPJZqiyBqjeIZiXR0UwRJHIvE/0RFqhQ4tuabjLADYx7K2LG
 m5BanaKhkjpKjLZV464Cd04dnwaucZQ2bTMjt8ZmjRtpgQUpV/io2UvpEaQPq+ujozim
 yMugF7e5Zfa72jhSDNgPcL6hy20npa2Ql40qqlPgSEZ1+Fj9M5iJd0kVXmdZA178/kOr
 ILiw==
X-Gm-Message-State: APjAAAVIUQVBT7h0yamQ9KQPmwvS7oKNPGFGXlxxrm3f8M0cBHa5YvQN
 rds4Pr5qh3Ykp+BA5aNV9WzGtxmiOIMIQoArANjLfA==
X-Google-Smtp-Source: APXvYqzVQWpFZJ+b3RyKX/TemCFmTTPYfDg88isRmjIaZzzCWs5VuT8jbgIgpOWCaMdwOPkCRt3ERlgGVv6JGsB7ZDo=
X-Received: by 2002:a5d:91d7:: with SMTP id k23mr8303949ior.163.1565168389566; 
 Wed, 07 Aug 2019 01:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-13-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565163924-18621-13-git-send-email-bmeng.cn@gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 7 Aug 2019 16:59:38 +0800
Message-ID: <CAEiOBXV9cxVEboMNsvEoHgW3BiFm697BL68YHC49U41V3Hewfg@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000dfe0ae058f83291e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 12/28] riscv: sifive_e:
 prci: Fix a typo of hfxosccfg register programming
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
X-List-Received-Date: Wed, 07 Aug 2019 08:59:52 -0000

--000000000000dfe0ae058f83291e
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 3:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> It should use SIFIVE_PRCI_HFXOSCCFG_RDY and SIFIVE_PRCI_HFXOSCCFG_EN
> for hfxosccfg register programming.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> Changes in v2: None
>
>  hw/riscv/sifive_e_prci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
> index acb914d..c906f11 100644
> --- a/hw/riscv/sifive_e_prci.c
> +++ b/hw/riscv/sifive_e_prci.c
> @@ -89,7 +89,7 @@ static void sifive_prci_init(Object *obj)
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>
>      s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
> -    s->hfxosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
> +    s->hfxosccfg = (SIFIVE_PRCI_HFXOSCCFG_RDY | SIFIVE_PRCI_HFXOSCCFG_EN);
>      s->pllcfg = (SIFIVE_PRCI_PLLCFG_REFSEL | SIFIVE_PRCI_PLLCFG_BYPASS |
>                  SIFIVE_PRCI_PLLCFG_LOCK);
>      s->plloutdiv = SIFIVE_PRCI_PLLOUTDIV_DIV1;
> --
> 2.7.4
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--000000000000dfe0ae058f83291e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 3:48 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It should us=
e SIFIVE_PRCI_HFXOSCCFG_RDY and SIFIVE_PRCI_HFXOSCCFG_EN<br>
for hfxosccfg register programming.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
Acked-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" =
target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
<br>
Changes in v2: None<br>
<br>
=C2=A0hw/riscv/sifive_e_prci.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c<br>
index acb914d..c906f11 100644<br>
--- a/hw/riscv/sifive_e_prci.c<br>
+++ b/hw/riscv/sifive_e_prci.c<br>
@@ -89,7 +89,7 @@ static void sifive_prci_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(SYS_BUS_DEVICE(obj), &amp;s-&gt;mmio);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;hfrosccfg =3D (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE=
_PRCI_HFROSCCFG_EN);<br>
-=C2=A0 =C2=A0 s-&gt;hfxosccfg =3D (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI=
_HFROSCCFG_EN);<br>
+=C2=A0 =C2=A0 s-&gt;hfxosccfg =3D (SIFIVE_PRCI_HFXOSCCFG_RDY | SIFIVE_PRCI=
_HFXOSCCFG_EN);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;pllcfg =3D (SIFIVE_PRCI_PLLCFG_REFSEL | SIFIVE_PR=
CI_PLLCFG_BYPASS |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SIFIVE_PRCI_P=
LLCFG_LOCK);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;plloutdiv =3D SIFIVE_PRCI_PLLOUTDIV_DIV1;<br>
-- <br>
2.7.4<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.c=
om</a>&gt;=C2=A0=C2=A0=C2=A0</div></div></div>

--000000000000dfe0ae058f83291e--


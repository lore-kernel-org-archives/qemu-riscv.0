Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvICa-0006iK-Bn
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 05:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvICX-0006gi-OG
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:25:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvICW-00044o-MT
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:25:45 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42851)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hvICW-00044I-Ft
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:25:44 -0400
Received: by mail-ot1-x344.google.com with SMTP id l15so101636666otn.9
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 02:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B3BxVxXRR8OppXaEHTSAKIRifJOgdZlpHc1CA19aAiw=;
 b=BbAVFfeKgbgEwm3lEGj8uVGdsXvpvmEwXZvfmOSWIw/ZZ08O29uS5V+GxC5Z1nRdJJ
 yIpAv2pQrMLj9PD/s8ulzeJQoKyUgSfCg4WgMvIyMNOqGS/plXwNxiOp+8tlkfmU5wc6
 2i8r0uzLncACsDsa4PuhAWjzcMUMCaHUh7t1p6nebMlnhOFaq9YJZnlU2JXsKN9yh9+d
 ZAnINKqTZLQZz2/eVyEaK1b/Ei51bS1I4zq7211TKZh1lLI5AmwwAHsdqEwehFndNeCX
 EE0uxwoNMKra/wxl6k4MpNxxYjp5MOQt5emCskTiLfUXOVh1s4CS5HwuGR0y/eTI1kRt
 vqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B3BxVxXRR8OppXaEHTSAKIRifJOgdZlpHc1CA19aAiw=;
 b=Zw1JP0Qtx3+2QlLqJKpEdlkn08WZn6T7aZv5Y7hqm78IAgjepOhMOSXPi72BgE+Nw1
 Sd3pVHgnA59PLcx6hHUnesA5mt7u2hcvFuMrHA/zI9CszA4fMYQ5F7i8BoPc5gS9L6S7
 Hj9hgELFvNccyjzloEak1wlzPi9ur364Q2akhnJOsj+IZUp/Ax0luktOzHBA3fqwSBgB
 EKYEgL7euX0ZMjOXLBm9O3BBztXDifDW32MVhlrA8ASQzjOoJshfNi6hsCE0K99/4qu5
 VG83vCANXD/y8ZZGKrFjga3cUNGU9Ha8LY6Deyq+JWdaywDg+ECal91ocqH3y3vP4Wqi
 pDIA==
X-Gm-Message-State: APjAAAXfpXdkGSEiyJWOl2T39W1kPhhxIY8D/jlZJVddyOrD0n43JN9V
 KNDWCDPmGrRwJGknP3CdJ0+Hl0ESFLtkGcIc5/fdIw==
X-Google-Smtp-Source: APXvYqwQ81a3lC0CYbp9ciReu4P8ZDnNUj6OYrD5ThUxPRAE1PeNTVs6XWE6WdmCd3E4ErL/8/CbhS+B66wPvXqjHqk=
X-Received: by 2002:a02:662f:: with SMTP id k47mr9131387jac.4.1565169943521;
 Wed, 07 Aug 2019 02:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-10-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565163924-18621-10-git-send-email-bmeng.cn@gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 7 Aug 2019 17:25:32 +0800
Message-ID: <CAEiOBXV1S_hOesF65YTi6EqKeYHjW+rByPgfcEg1yeET696KRw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007f66f1058f838673"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 09/28] riscv: sifive_u:
 Update UART base addresses
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
X-List-Received-Date: Wed, 07 Aug 2019 09:25:46 -0000

--0000000000007f66f1058f838673
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 3:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> This updates the UART base address to match the hardware.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> Changes in v2: None
>
>  hw/riscv/sifive_u.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index fe8dd3e..ea45e77 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -61,8 +61,8 @@ static const struct MemmapEntry {
>      [SIFIVE_U_MROM] =     {     0x1000,    0x11000 },
>      [SIFIVE_U_CLINT] =    {  0x2000000,    0x10000 },
>      [SIFIVE_U_PLIC] =     {  0xc000000,  0x4000000 },
> -    [SIFIVE_U_UART0] =    { 0x10013000,     0x1000 },
> -    [SIFIVE_U_UART1] =    { 0x10023000,     0x1000 },
> +    [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
> +    [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
>      [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
>      [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
>  };
> --
> 2.7.4
>
>
>
By the way,  OpenSBI also needs a patch to fix the same problem.

Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--0000000000007f66f1058f838673
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 3:48 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This updates=
 the UART base address to match the hardware.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
Reviewed-by: Jonathan Behrens &lt;<a href=3D"mailto:fintelia@gmail.com" tar=
get=3D"_blank">fintelia@gmail.com</a>&gt;<br>
Acked-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" =
target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
<br>
Changes in v2: None<br>
<br>
=C2=A0hw/riscv/sifive_u.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c<br>
index fe8dd3e..ea45e77 100644<br>
--- a/hw/riscv/sifive_u.c<br>
+++ b/hw/riscv/sifive_u.c<br>
@@ -61,8 +61,8 @@ static const struct MemmapEntry {<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_U_MROM] =3D=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =
=C2=A00x1000,=C2=A0 =C2=A0 0x11000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_U_CLINT] =3D=C2=A0 =C2=A0 {=C2=A0 0x2000000,=C2=
=A0 =C2=A0 0x10000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_U_PLIC] =3D=C2=A0 =C2=A0 =C2=A0{=C2=A0 0xc00000=
0,=C2=A0 0x4000000 },<br>
-=C2=A0 =C2=A0 [SIFIVE_U_UART0] =3D=C2=A0 =C2=A0 { 0x10013000,=C2=A0 =C2=A0=
 =C2=A00x1000 },<br>
-=C2=A0 =C2=A0 [SIFIVE_U_UART1] =3D=C2=A0 =C2=A0 { 0x10023000,=C2=A0 =C2=A0=
 =C2=A00x1000 },<br>
+=C2=A0 =C2=A0 [SIFIVE_U_UART0] =3D=C2=A0 =C2=A0 { 0x10010000,=C2=A0 =C2=A0=
 =C2=A00x1000 },<br>
+=C2=A0 =C2=A0 [SIFIVE_U_UART1] =3D=C2=A0 =C2=A0 { 0x10011000,=C2=A0 =C2=A0=
 =C2=A00x1000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_U_DRAM] =3D=C2=A0 =C2=A0 =C2=A0{ 0x80000000,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_U_GEM] =3D=C2=A0 =C2=A0 =C2=A0 { 0x100900FC,=C2=
=A0 =C2=A0 =C2=A00x2000 },<br>
=C2=A0};<br>
-- <br>
2.7.4<br>
<br><br></blockquote><div><br></div><div>By the way,=C2=A0 OpenSBI also nee=
ds a patch to fix the same problem.</div><div><br></div><div class=3D"gmail=
-gs" style=3D"margin:0px;padding:0px 0px 20px;width:1717.59px;font-family:R=
oboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:medium"><div class=
=3D"gmail-"><div id=3D"gmail-:3o3" class=3D"gmail-ii gmail-gt gmail-adP" st=
yle=3D"font-size:0.875rem;direction:ltr;margin:8px 0px 0px;padding:0px"><di=
v id=3D"gmail-:3o2" class=3D"gmail-a3s gmail-aXjCH" style=3D"overflow:hidde=
n;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:n=
ormal;font-size:small;line-height:1.5;font-family:Arial,Helvetica,sans-seri=
f"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Reviewed-by: Chih-Min C=
hao &lt;<a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmi=
n.chao@sifive.com</a>&gt;=C2=A0 =C2=A0=C2=A0</div></div></div></div></div><=
/div></div></div></div>

--0000000000007f66f1058f838673--


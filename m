Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1huWGH-0008H7-AM
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 02:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1huWGF-0008GM-I4
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 02:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1huWGE-0004I4-HB
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 02:14:23 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:42022)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1huWGE-0004HY-DU
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 02:14:22 -0400
Received: by mail-io1-xd41.google.com with SMTP id e20so31946360iob.9
 for <qemu-riscv@nongnu.org>; Sun, 04 Aug 2019 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Y7WcXkyB2SsSCuxnbdm58cZx75IvMUDQfLeylZQwF8=;
 b=BKv1SsZ3DQft4EMwl0rdlX61+WUPZwPbxotZpozeU0puOcEwt04XMsOPzFWEgn4dxX
 Itc8CIu23Q/D1qNqtH5JJIlPHWS8ekVjvPjHq7/j6+xZo2pzcm/51QKWqjiG+YvaWtsq
 Jlqr9v5K1L/1X2ss7sUEPO919YdFSJ0WnadrRcFrbPcUIq70anC1wsmkR0oXFUJMr6ka
 2NimW2eJcdGdT2X4yZ8kJ5SW7J2ycLxLikdlEMzQzN9hTaYRYaupcCIuV5UGEm3PZesz
 7QOOOXjau8NOOjNWMZT3oViGDlx86NfVfk84yUNkc6z7ern2dK8kqv9BboI+G0LX1D4n
 8+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Y7WcXkyB2SsSCuxnbdm58cZx75IvMUDQfLeylZQwF8=;
 b=ZrMVGjVBomXnRzWrRpkEnxTHkATiP5hJpjzYpZ+HPwEAFH40KxmusdNQs9Sx9wFSD8
 /QH1+N6enyukTmWRmAXXBMwTwNGZNrAo/4TEOwDK1SQXCh665cn/VSBPZtH2uHE0YpDe
 rbzP9cZLDH7njg49HHNOKi5Ohx9QcPwdw7j4LrBpqCBXvFF4eYQAoduJX05beJU74CRi
 OQOa8YHDyMHtmJiVmKjMk4zy6tHgvvNaTOndEvy2n5ooDhTLeSlVnBGQ1B52y+fDD5WS
 aRq9VeEKNDxz2XLpAxl3ezfHgtOd2fXiVU9+jbvZ8gKSVjHrq9Muxaydf7XtBsjHbSMR
 Q18w==
X-Gm-Message-State: APjAAAXfz3057cdGBCVT7MHNRUPbUIaGFY4nE/xtQ1enSVP7sLlVPL3s
 qT1CuSL7dqMhOj+kDnWqtmLEGzrD96NQDUyQzv2d/g==
X-Google-Smtp-Source: APXvYqwhH8Gy7RhdSjCAEYn9//rXzJtQA1xuW178I6YEy+5tRPmnUKwI/tp7qCVhQML8iCdDcutWlMcG1tEtWdtcZYg=
X-Received: by 2002:a02:b395:: with SMTP id p21mr37874965jan.31.1564985660493; 
 Sun, 04 Aug 2019 23:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <1564792052-6469-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1564792052-6469-1-git-send-email-bmeng.cn@gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Mon, 5 Aug 2019 14:14:07 +0800
Message-ID: <CAEiOBXWQ02uRQQOpP=Rauq8WZnYtoxNqjM--Rpi5tHX2W0bGsw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000005f66ad058f589e50"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Subject: Re: [Qemu-riscv] [PATCH] riscv: sifive_e: Correct various SoC IP
 block sizes
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
X-List-Received-Date: Mon, 05 Aug 2019 06:14:24 -0000

--0000000000005f66ad058f589e50
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 3, 2019 at 8:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> Some of the SoC IP block sizes are wrong. Correct them according
> to the FE310 manual.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/riscv/sifive_e.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 2a499d8..9655847 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -53,13 +53,13 @@ static const struct MemmapEntry {
>      hwaddr base;
>      hwaddr size;
>  } sifive_e_memmap[] = {
> -    [SIFIVE_E_DEBUG] =    {        0x0,      0x100 },
> +    [SIFIVE_E_DEBUG] =    {        0x0,     0x1000 },
>      [SIFIVE_E_MROM] =     {     0x1000,     0x2000 },
>      [SIFIVE_E_OTP] =      {    0x20000,     0x2000 },
>      [SIFIVE_E_CLINT] =    {  0x2000000,    0x10000 },
>      [SIFIVE_E_PLIC] =     {  0xc000000,  0x4000000 },
> -    [SIFIVE_E_AON] =      { 0x10000000,     0x8000 },
> -    [SIFIVE_E_PRCI] =     { 0x10008000,     0x8000 },
> +    [SIFIVE_E_AON] =      { 0x10000000,     0x1000 },
> +    [SIFIVE_E_PRCI] =     { 0x10008000,     0x1000 },
>      [SIFIVE_E_OTP_CTRL] = { 0x10010000,     0x1000 },
>      [SIFIVE_E_GPIO0] =    { 0x10012000,     0x1000 },
>      [SIFIVE_E_UART0] =    { 0x10013000,     0x1000 },
> --
> 2.7.4
>
>
It seems the modification follows  E310-G002(Hifive1 Rev B) spec and the
origin is for E310-G000(Hifive1) spec.
There should be some way to specify different board version with different
memory map or we have policy, always support the latest spec.

chihmin

--0000000000005f66ad058f589e50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 3, 2019 at 8:27 AM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Some of the =
SoC IP block sizes are wrong. Correct them according<br>
to the FE310 manual.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
<br>
=C2=A0hw/riscv/sifive_e.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c<br>
index 2a499d8..9655847 100644<br>
--- a/hw/riscv/sifive_e.c<br>
+++ b/hw/riscv/sifive_e.c<br>
@@ -53,13 +53,13 @@ static const struct MemmapEntry {<br>
=C2=A0 =C2=A0 =C2=A0hwaddr base;<br>
=C2=A0 =C2=A0 =C2=A0hwaddr size;<br>
=C2=A0} sifive_e_memmap[] =3D {<br>
-=C2=A0 =C2=A0 [SIFIVE_E_DEBUG] =3D=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x0,=C2=A0 =C2=A0 =C2=A0 0x100 },<br>
+=C2=A0 =C2=A0 [SIFIVE_E_DEBUG] =3D=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x0,=C2=A0 =C2=A0 =C2=A00x1000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_E_MROM] =3D=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =
=C2=A00x1000,=C2=A0 =C2=A0 =C2=A00x2000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_E_OTP] =3D=C2=A0 =C2=A0 =C2=A0 {=C2=A0 =C2=A0 0=
x20000,=C2=A0 =C2=A0 =C2=A00x2000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_E_CLINT] =3D=C2=A0 =C2=A0 {=C2=A0 0x2000000,=C2=
=A0 =C2=A0 0x10000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_E_PLIC] =3D=C2=A0 =C2=A0 =C2=A0{=C2=A0 0xc00000=
0,=C2=A0 0x4000000 },<br>
-=C2=A0 =C2=A0 [SIFIVE_E_AON] =3D=C2=A0 =C2=A0 =C2=A0 { 0x10000000,=C2=A0 =
=C2=A0 =C2=A00x8000 },<br>
-=C2=A0 =C2=A0 [SIFIVE_E_PRCI] =3D=C2=A0 =C2=A0 =C2=A0{ 0x10008000,=C2=A0 =
=C2=A0 =C2=A00x8000 },<br>
+=C2=A0 =C2=A0 [SIFIVE_E_AON] =3D=C2=A0 =C2=A0 =C2=A0 { 0x10000000,=C2=A0 =
=C2=A0 =C2=A00x1000 },<br>
+=C2=A0 =C2=A0 [SIFIVE_E_PRCI] =3D=C2=A0 =C2=A0 =C2=A0{ 0x10008000,=C2=A0 =
=C2=A0 =C2=A00x1000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_E_OTP_CTRL] =3D { 0x10010000,=C2=A0 =C2=A0 =C2=
=A00x1000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_E_GPIO0] =3D=C2=A0 =C2=A0 { 0x10012000,=C2=A0 =
=C2=A0 =C2=A00x1000 },<br>
=C2=A0 =C2=A0 =C2=A0[SIFIVE_E_UART0] =3D=C2=A0 =C2=A0 { 0x10013000,=C2=A0 =
=C2=A0 =C2=A00x1000 },<br>
-- <br>
2.7.4<br><br></blockquote><div><br></div><div>It seems the modification fol=
lows=C2=A0 E310-G002(Hifive1 Rev B) spec and the origin is for E310-G000(Hi=
five1) spec.</div><div>There should be some way to specify different board =
version with different memory map or we have policy, always support the lat=
est spec.</div><div><br></div><div>chihmin</div><div><br></div><div><br></d=
iv><div><br></div><div><br></div></div></div>

--0000000000005f66ad058f589e50--


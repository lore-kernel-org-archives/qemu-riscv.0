Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hug6U-0006E9-Ld
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hug6S-0006BU-NP
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:44:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hug6R-00025p-Gk
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:44:56 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40566)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1hug6P-00023T-AH; Mon, 05 Aug 2019 12:44:53 -0400
Received: by mail-lj1-x241.google.com with SMTP id m8so46252098lji.7;
 Mon, 05 Aug 2019 09:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9FruRi6Xu7OT2SB3a0nBpyGnFSd5DR+quxKjBlWmUO0=;
 b=SqBySKDtvDhA5TRsCeHaCgrsqU6MQfn0EpNush9xmeNRQo701+ccRDZB2TqVpddpqC
 wLf2ZoOeIRaQrJjI7ImTCKbB4yKtSxl7BiV34WZd08vRjfVfXpAy/pQOEM7sgR1e6ZvF
 nV+t2rQTkAyr7S7q+SZzaEJw4O3ddLkPWuUhvt2CnVsxEjRTYMzjrhDkKLeEYrjzwsDq
 6GK5AYABOWGj/Ib7ifRVQCh2m7JrU5oFM18MbTBtez7IbmhfZJReF620QroHHJEkahXy
 stvh/BKc5CynjtTsZQQ2qWBeL37NpR1qoDDBlVDZPbuMhRrKY27tnZcfDtCJkK4g+MfX
 3Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FruRi6Xu7OT2SB3a0nBpyGnFSd5DR+quxKjBlWmUO0=;
 b=esKsLdf0WNLSGQuEd2Kavb0kuGbcFgaNne2N2WWpqp8CgpnFzHZcf9n6XJ+lZYH3R9
 L/g51x3VuwUFuPvBX3AwV4m/M1rw2Ezuz1yWhlJ0hvu6tXnHP2fQicWZAt951iRDT2FR
 nVfJw3suq7ftCdbNG6Vv5NCLbPbqvfJpUfUuLB8efSjswQHn7hjhb+B6zf/KNO89OR6u
 wA6ARRAsYeNMRh8SRtMYUwo0z6q2owUg2ef2lTD9OLcNlWM6u1hXdrn2HBartqaaNuwW
 CLI4736htpWO8jA3F+mo4i6lu5LeiZDo6MIMKQZzoYlM2HaeGJTitni5xDonRc2pi0MQ
 8Z/w==
X-Gm-Message-State: APjAAAUwiADyc+FCtaYrUtsn6Ub8+cDKizajLf+zXrL9nAxcbD6mSNt3
 DtyMCOdFGePIx+svCXRxS61AWW0CGbEE6YIx6a8=
X-Google-Smtp-Source: APXvYqzeZgZOP1DZbznXLublw5CLWW/xmO+ZTeR/jqJsBR6ppyxkM2qMAM+soqtJ6soaGzygDfQKUzf+UuYTuVvzb5I=
X-Received: by 2002:a2e:9d8a:: with SMTP id c10mr54537104ljj.147.1565023491117; 
 Mon, 05 Aug 2019 09:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
 <1565020823-24223-10-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565020823-24223-10-git-send-email-bmeng.cn@gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Mon, 5 Aug 2019 12:44:05 -0400
Message-ID: <CANnJOVEg6J=ZiZ7cO+s6x2UBwBZ5fteJeKDhn38RcFCPiuTn7g@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000040d94a058f616df4"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [PATCH 09/28] riscv: sifive_u: Update UART base
 addresses
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
X-List-Received-Date: Mon, 05 Aug 2019 16:44:57 -0000

--00000000000040d94a058f616df4
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Jonathan Behrens <fintelia@gmail.com> <chihmin.chao@sifive.com>

On Mon, Aug 5, 2019 at 12:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> This updates the UART base address to match the hardware.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/riscv/sifive_u.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index b235f29..9f05e09 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -60,8 +60,8 @@ static const struct MemmapEntry {
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

--00000000000040d94a058f616df4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-il">Reviewed</span>-<span class=3D"gm=
ail-il">by</span>: Jonathan Behrens &lt;<a href=3D"mailto:fintelia@gmail.co=
m">fintelia@gmail.com</a>&gt;<a href=3D"mailto:chihmin.chao@sifive.com" tar=
get=3D"_blank"></a><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Aug 5, 2019 at 12:07 PM Bin Meng &lt;<a href=
=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">This updates the UART base=
 address to match the hardware.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
<br>
=C2=A0hw/riscv/sifive_u.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c<br>
index b235f29..9f05e09 100644<br>
--- a/hw/riscv/sifive_u.c<br>
+++ b/hw/riscv/sifive_u.c<br>
@@ -60,8 +60,8 @@ static const struct MemmapEntry {<br>
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
<br>
<br>
</blockquote></div>

--00000000000040d94a058f616df4--


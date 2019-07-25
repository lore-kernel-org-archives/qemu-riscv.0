Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqlav-0003on-Po
	for mharc-qemu-riscv@gnu.org; Thu, 25 Jul 2019 17:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47581)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hqlat-0003bb-01
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 17:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hqlar-00081F-Mb
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2019 17:48:10 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:42057)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1hqlap-0007tI-1e; Thu, 25 Jul 2019 17:48:07 -0400
Received: by mail-lf1-x132.google.com with SMTP id s19so35614004lfb.9;
 Thu, 25 Jul 2019 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KQ9NrAyyE67UHe5LvMVajFoTQKbRA85crMNldZTKBZs=;
 b=t7PB8zxQGS6wSoa4fWtzhi8bg8pAcyhWhDQdyJkyWrohtwbMU5u1yfE6skVMn/J+Dm
 CrXf2O6NXF4Wjm20ZJDH3DGywE0BLvWweTzku3mHito/mo6vcZSQmPZW9HGAMALQyjns
 ZdJcLocJef/aLmd+BNbK7JnToNEB5GcuqIWaWwwPklWwlRpozgvWjXUu6K7PuDQldAz+
 BkTcUiCQdbhmd6OIMv+nsJwLDkIfk4Y+7IboPKC4Hy4ZpJ4otK6eM0XRmd812ZeiLbQw
 Wro1yYUxTfA2chEQraZoFp3k+okzB/bBbnsVPDDhyvJuSWOAwQaigBDrfv3LJCeF+gH0
 hvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQ9NrAyyE67UHe5LvMVajFoTQKbRA85crMNldZTKBZs=;
 b=hBW8aGHt8AClz+b+XwcDIrd8Lse2kadKop5idhGn4rIdociQ9Dnz7RzfkWa6BZaU/h
 pd8A12BQ2V+jEVbrau/DMK51DIudCfLGd5nwliBpNBAalVCrgAs2kxgnnPyLSs6Q5aDt
 P5vVmS4OON2VJBjujphgyk+Z02Hmy8BVZJ1FViQKSHRN11KY1BkU54oVKHO8fuiBYvUx
 xAN0vzlOx1q6m1XJHFrFYs3g6wC0GZii42B8Rsd24zTYERdVeIjeM/XW5Nm/3OrVGkrY
 flRLnuGbC9YE6hQaxACzb6BaAqB0yQvKnWOqm1lrzche/3BsrgdnVH2C5Seysebh4hsP
 2j3A==
X-Gm-Message-State: APjAAAWM5Z10ct7rH4aBZnMVNh9+M8hsB5rJ+JUtbVIA0Ohq5pVNh4yQ
 6iXyhvIkwMxMiWOu0rwx4B9dvkjA+MBE2V88Mzs=
X-Google-Smtp-Source: APXvYqxODWyKLClnp8PVPuxX8SxuRov3MhFN8gQaJl2QPMazaDhMVlWZladWksDXVFmyIuaE8tNliya5M2v2BSVqZA4=
X-Received: by 2002:a19:7006:: with SMTP id h6mr41856589lfc.5.1564091285088;
 Thu, 25 Jul 2019 14:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <b415f5b51e09418760b95e5c73fad5e68b97f173.1564080680.git.alistair.francis@wdc.com>
In-Reply-To: <b415f5b51e09418760b95e5c73fad5e68b97f173.1564080680.git.alistair.francis@wdc.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Thu, 25 Jul 2019 17:47:22 -0400
Message-ID: <CANnJOVEyy7wb74eEucj5t=xonOvUFTPWuty9R+-KP0DLc+L7zQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="00000000000071b005058e8861e9"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::132
Subject: Re: [Qemu-riscv] [PATCH-4.2 v1 2/6] target/riscv: Remove strict
 perm checking for CSR R/W
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
X-List-Received-Date: Thu, 25 Jul 2019 21:48:12 -0000

--00000000000071b005058e8861e9
Content-Type: text/plain; charset="UTF-8"

Unless I'm missing something, this is the only place that QEMU checks the
privilege level for read and writes to CSRs. The exact computation used
here won't work with the hypervisor extension, but we also can't just get
rid of privilege checking entirely...

Jonathan

On Thu, Jul 25, 2019 at 2:56 PM Alistair Francis <alistair.francis@wdc.com>
wrote:

> The privledge check based on the CSR address mask 0x300 doesn't work
> when using Hypervisor extensions so remove the check
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e0d4586760..af3b762c8b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -797,9 +797,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno,
> target_ulong *ret_value,
>
>      /* check privileges and return -1 if check fails */
>  #if !defined(CONFIG_USER_ONLY)
> -    int csr_priv = get_field(csrno, 0x300);
>      int read_only = get_field(csrno, 0xC00) == 3;
> -    if ((write_mask && read_only) || (env->priv < csr_priv)) {
> +    if (write_mask && read_only) {
>          return -1;
>      }
>  #endif
> --
> 2.22.0
>
>
>

--00000000000071b005058e8861e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Unless I&#39;m missing something, this is the only pl=
ace that QEMU checks the privilege level for read and writes to CSRs. The e=
xact computation used here won&#39;t work with the hypervisor extension, bu=
t we also can&#39;t just get rid of privilege checking entirely...</div><di=
v><br></div><div>Jonathan<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 25, 2019 at 2:56 PM Alistair=
 Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.francis@w=
dc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">The privledge check based on the CSR address mask 0x300 doesn&#39;t w=
ork<br>
when using Hypervisor extensions so remove the check<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/csr.c | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index e0d4586760..af3b762c8b 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -797,9 +797,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_u=
long *ret_value,<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* check privileges and return -1 if check fails */<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 int csr_priv =3D get_field(csrno, 0x300);<br>
=C2=A0 =C2=A0 =C2=A0int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;<br>
-=C2=A0 =C2=A0 if ((write_mask &amp;&amp; read_only) || (env-&gt;priv &lt; =
csr_priv)) {<br>
+=C2=A0 =C2=A0 if (write_mask &amp;&amp; read_only) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
-- <br>
2.22.0<br>
<br>
<br>
</blockquote></div>

--00000000000071b005058e8861e9--


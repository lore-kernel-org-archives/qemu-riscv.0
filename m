Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvHoH-0001wl-C9
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 05:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49560)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHoE-0001uP-A9
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:00:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHoD-0001ta-4L
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:00:38 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39230)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hvHoC-0001tJ-V3
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:00:37 -0400
Received: by mail-ot1-x343.google.com with SMTP id r21so95386214otq.6
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 02:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/CCm4A5Olufvollna31VV9arJaJ3pA9JKUKma77ctzM=;
 b=YSdPLmLfT4fThFHNds2eNrcZ1LOfcAfLqvpBAodR3yylq9/JcDUr+oOVzgKXilJobH
 4ACC2ZM3ikM9qNsqvPU0J446etVN6kjrG6xlwuxZe5fRppJPmgBUm1VFcct7dVuYZJYb
 GCbZfFn7K6oASCPc5or3GSSYrdaw5br7m0CMyjy9svCF9cLjBLVs6ITenhOzcunw94kW
 sWFEn4FU4Se1COZjb4zDjwouLFp+EP5M857N3QI94aFxVnaoFlI6VAO2cgaPtGXI3/di
 +Mn/ce/Hv+Gqv1WJfELRK1+OrQ+JZZTr0lwLeU6uGN6NqfXPyfEYCzjvzvS0enMkoH6T
 KaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/CCm4A5Olufvollna31VV9arJaJ3pA9JKUKma77ctzM=;
 b=bdsXChWJb+SQmEwZEMicq7kh9nwTPSUZCH/3onLSKZE97zgkhtqX44YuwNx/oqKSRD
 yIFstRB/sJm18YVWH6/gdJgnzFic2aKY5VqEKX5Aiqkx1GFbekh+kLDVxe1Ee/Q5gemG
 Wy/5rWB5Vp5beL7syPhjwgjdg8sm4eLb6ZBx7aogz7XeTDz+fbBvqZxGEgFsgfZXDI+F
 YmD/FF9ZoJqtbcf1xmlvKeyZeuT3e0VsCpuH9qiCjo5SLC3cOzTjNxlXqpREF5oQoM9E
 uiw0OoDEwDtssvFqdBqrB3Euk4+lPW1LNFixx/Amloa4uyIwUR41Gx6hcimQqJPDPBze
 53cA==
X-Gm-Message-State: APjAAAUfGX07+oLOm9SPtqm7KInP4LEKDQl5suQTRspNaomEDgqBj0gO
 vF69ce1HN+FwPAmGlDvWJXyVxv3jgPQF+Z8Y41PgPw==
X-Google-Smtp-Source: APXvYqzkE3gQZZK7bSSpv7qx9tFtv3olJqCAgyhFjIlkUz7l3m6Rt6XIWRVxLG0FSM0l7q8RPsEhd2Hy+a/AOZCxqBE=
X-Received: by 2002:a5e:881a:: with SMTP id l26mr8086636ioj.185.1565168436343; 
 Wed, 07 Aug 2019 02:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-14-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565163924-18621-14-git-send-email-bmeng.cn@gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 7 Aug 2019 17:00:25 +0800
Message-ID: <CAEiOBXWAvHyrxTFQryH2ChSCTk_iZU9mQstcmh+DT2bmS3pp+Q@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a98c3e058f832c30"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 13/28] riscv: sifive_e:
 prci: Update the PRCI register block size
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
X-List-Received-Date: Wed, 07 Aug 2019 09:00:39 -0000

--000000000000a98c3e058f832c30
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 3:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> Currently the PRCI register block size is set to 0x8000, but in fact
> 0x1000 is enough, which is also what the manual says.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
> Changes in v2: None
>
>  hw/riscv/sifive_e_prci.c         | 2 +-
>  include/hw/riscv/sifive_e_prci.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
> index c906f11..4cbce48 100644
> --- a/hw/riscv/sifive_e_prci.c
> +++ b/hw/riscv/sifive_e_prci.c
> @@ -85,7 +85,7 @@ static void sifive_prci_init(Object *obj)
>      SiFivePRCIState *s = SIFIVE_E_PRCI(obj);
>
>      memory_region_init_io(&s->mmio, obj, &sifive_prci_ops, s,
> -                          TYPE_SIFIVE_E_PRCI, 0x8000);
> +                          TYPE_SIFIVE_E_PRCI, SIFIVE_E_PRCI_REG_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>
>      s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
> diff --git a/include/hw/riscv/sifive_e_prci.h
> b/include/hw/riscv/sifive_e_prci.h
> index 7932fe7..81e506b 100644
> --- a/include/hw/riscv/sifive_e_prci.h
> +++ b/include/hw/riscv/sifive_e_prci.h
> @@ -47,6 +47,8 @@ enum {
>      SIFIVE_PRCI_PLLOUTDIV_DIV1  = (1 << 8)
>  };
>
> +#define SIFIVE_E_PRCI_REG_SIZE  0x1000
> +
>  #define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
>
>  #define SIFIVE_E_PRCI(obj) \
> --
> 2.7.4
>
>
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--000000000000a98c3e058f832c30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 3:49 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Currently th=
e PRCI register block size is set to 0x8000, but in fact<br>
0x1000 is enough, which is also what the manual says.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
<br>
Changes in v2: None<br>
<br>
=C2=A0hw/riscv/sifive_e_prci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0include/hw/riscv/sifive_e_prci.h | 2 ++<br>
=C2=A02 files changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c<br>
index c906f11..4cbce48 100644<br>
--- a/hw/riscv/sifive_e_prci.c<br>
+++ b/hw/riscv/sifive_e_prci.c<br>
@@ -85,7 +85,7 @@ static void sifive_prci_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0SiFivePRCIState *s =3D SIFIVE_E_PRCI(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;mmio, obj, &amp;sifive=
_prci_ops, s,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_SIFIVE_E_PRCI, 0x8000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_SIFIVE_E_PRCI, SIFIVE_E_PRCI_REG_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(SYS_BUS_DEVICE(obj), &amp;s-&gt;mmio);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;hfrosccfg =3D (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE=
_PRCI_HFROSCCFG_EN);<br>
diff --git a/include/hw/riscv/sifive_e_prci.h b/include/hw/riscv/sifive_e_p=
rci.h<br>
index 7932fe7..81e506b 100644<br>
--- a/include/hw/riscv/sifive_e_prci.h<br>
+++ b/include/hw/riscv/sifive_e_prci.h<br>
@@ -47,6 +47,8 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0SIFIVE_PRCI_PLLOUTDIV_DIV1=C2=A0 =3D (1 &lt;&lt; 8)<br>
=C2=A0};<br>
<br>
+#define SIFIVE_E_PRCI_REG_SIZE=C2=A0 0x1000<br>
+<br>
=C2=A0#define TYPE_SIFIVE_E_PRCI=C2=A0 =C2=A0 =C2=A0 &quot;riscv.sifive.e.p=
rci&quot;<br>
<br>
=C2=A0#define SIFIVE_E_PRCI(obj) \<br>
-- <br>
2.7.4<br>
<br>
<br></blockquote><div>Reviewed-by: Chih-Min Chao &lt;<a href=3D"mailto:chih=
min.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;=C2=
=A0=C2=A0=C2=A0</div></div></div>

--000000000000a98c3e058f832c30--


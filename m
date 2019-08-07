Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvHrx-0003Lw-7A
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 05:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50349)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHru-0003KG-Lh
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hvHrt-00051I-9N
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:04:26 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43511)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hvHrs-00050n-MY
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:04:25 -0400
Received: by mail-ot1-x341.google.com with SMTP id j11so1019113otp.10
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JSywJq/uk7DlIuNSp1YJQO69w6sCtKmOtpr9rDm7AC0=;
 b=nZ2GP2LY/qLcc5Z2Hf7UEM1NBnaEhweuBZxae8J3l6IverIp17mJCm0i+NNc/9N1P0
 0GhvkEiiFW2xKxqwBIYmgfb6jT1od5h2sYGBZt/PNaUlW6PN7QlE4e92KrasvCeHL69R
 neO6IAhZTL2XQOVEShHkRbPSf/ykI72fuDC/jRq3HJaRhbpELI1bFtfxfVmY1cEjzplO
 jrHBzxKR4BEuVyiaj/DIyaS/3lyBIaIU8BKbw7OmWIKkey+rDDZ/VFFyptvlZ/M+fsCX
 uk5LGqxWdwFHmbw1iqE990O89CBgL89XeuG2T59GpUEr6IYhq/8su6/LKj6OSSLzVT2K
 UrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JSywJq/uk7DlIuNSp1YJQO69w6sCtKmOtpr9rDm7AC0=;
 b=RLy8yfLOhTlnGwao86hcYuog9D3lv/sRQChKNyO3Yvx05X3bxXNt2Pe4qa5FcPviW9
 OxbhaG/Kw2kX0hgTdmlXG1WFf3l+pJODG8aC0t4wXh4x6RzcwF5OMWXGr/saRHx5VBtP
 LkN8n4IQ9WjRK5wKuC3e21nXCO7gzV3Z0CXP06C37zdo3bf2yxsV9lWQSxZWju7O3a5L
 +IFoYZHezV6T+8+D2xtiRXHBKxUACclY0mSJJLZRwLrtXEh0cBZ80Q1UfZ1/nQRFsjqN
 AfRS4gYexEWJT4x2ln5/NmiPN3LXchHjLWp2Rdu5xbY294bRjmskX44xhv14HCskSU1S
 2APA==
X-Gm-Message-State: APjAAAWESuN0rD21LlNmn2BiMtCwUGms5g/WcN/tB5vsnirfjhePC5NE
 BZlXl+7xvq46e5nXKMSuoUyCtcZTlqzJEv1E/QBspw==
X-Google-Smtp-Source: APXvYqwNpwUQ+BrgxmmnHHP+/T46SS3huN19+qpIMEGzPi703fSKP87jd4qgzOn419nqxckuVtkGsqnQwCopi+f2s64=
X-Received: by 2002:a6b:d008:: with SMTP id x8mr7735405ioa.129.1565168663924; 
 Wed, 07 Aug 2019 02:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-25-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565163924-18621-25-git-send-email-bmeng.cn@gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 7 Aug 2019 17:04:12 +0800
Message-ID: <CAEiOBXU5La=+Q6ZQ+BQZEjVkE1Ga=-m3_B0EJbRVwCrgSobRBw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003a3620058f833a14"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 24/28] riscv: sifive_u:
 Support loading initramfs
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
X-List-Received-Date: Wed, 07 Aug 2019 09:04:27 -0000

--0000000000003a3620058f833a14
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 3:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> The loading of initramfs is currently not supported on 'sifive_u'.
> Add the support to make '-initrd' command line parameter useful.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
> Changes in v2: None
>
>  hw/riscv/sifive_u.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ce6eba5..30e6c43 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -328,7 +328,18 @@ static void riscv_sifive_u_init(MachineState *machine)
>                                   memmap[SIFIVE_U_DRAM].base);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine->kernel_filename);
> +        uint64_t kernel_entry =
> riscv_load_kernel(machine->kernel_filename);
> +
> +        if (machine->initrd_filename) {
> +            hwaddr start;
> +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> +                                           machine->ram_size,
> kernel_entry,
> +                                           &start);
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen",
> +                                  "linux,initrd-start", start);
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
> +                                  end);
> +        }
>      }
>
>      /* reset vector */
> --
> 2.7.4
>
>
>
virt also does the same thing.

Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--0000000000003a3620058f833a14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 3:56 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The loading =
of initramfs is currently not supported on &#39;sifive_u&#39;.<br>
Add the support to make &#39;-initrd&#39; command line parameter useful.<br=
>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D=
"_blank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
<br>
Changes in v2: None<br>
<br>
=C2=A0hw/riscv/sifive_u.c | 13 ++++++++++++-<br>
=C2=A01 file changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c<br>
index ce6eba5..30e6c43 100644<br>
--- a/hw/riscv/sifive_u.c<br>
+++ b/hw/riscv/sifive_u.c<br>
@@ -328,7 +328,18 @@ static void riscv_sifive_u_init(MachineState *machine)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memmap[SIFIVE_U_DRAM].base);<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0if (machine-&gt;kernel_filename) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_load_kernel(machine-&gt;kernel_filename)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t kernel_entry =3D riscv_load_kernel(ma=
chine-&gt;kernel_filename);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (machine-&gt;initrd_filename) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr start;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr end =3D riscv_load_initrd=
(machine-&gt;initrd_filename,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0machine-&gt;ram_size, kernel_entry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;start);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(s-&gt;fdt,=
 &quot;/chosen&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;linux,initrd-start&quot=
;, start);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cell(s-&gt;fdt,=
 &quot;/chosen&quot;, &quot;linux,initrd-end&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* reset vector */<br>
-- <br>
2.7.4<br>
<br>
<br></blockquote><div><br></div><div>virt also does the same thing.</div><d=
iv><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.=
chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;=C2=A0=C2=
=A0=C2=A0</div></div></div>

--0000000000003a3620058f833a14--


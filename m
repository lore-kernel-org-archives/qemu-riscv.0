Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hs7RI-00029u-1M
	for mharc-qemu-riscv@gnu.org; Mon, 29 Jul 2019 11:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hs7RF-00023w-Ut
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 11:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hs7RE-000350-RG
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 11:19:49 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:35979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hs7RE-00034N-IN
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 11:19:48 -0400
Received: by mail-io1-xd29.google.com with SMTP id o9so17240958iom.3
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2019 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WAiALMNkzL5uN9MeA97W3K0oNByFyZcmznPBDqq7Mfg=;
 b=MNUgdHA+VXLTXnxNT+CZ3mZ35wgasz0fMgnC0vyczUFKyLa5LhpUlxtB/Uhfi6zjJt
 qOjWaaQuEjGcV12AAsiSu7zzVqZpFkI21eFhUo2F3kUnshknd6Rt5qNbPmpabXoDd3TA
 JOUHO/vVZTLhVN1ainlSyS+PQ5KbxWvSM4/7OgOlkMbKIQH1Wr55N5F86kofYESycsJr
 OSI3MizvrE5DOo+1+DOHvYXfotFfQQEQwdIMyVXYFtYHOo0KxE8uPQuhwWzkpy2pxrS2
 71nQDttFpNOydnfczve0ip9zfzgOuTP4MPkUDwklNwobL393FHo3OKZgOlNkDubYZCcM
 op6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WAiALMNkzL5uN9MeA97W3K0oNByFyZcmznPBDqq7Mfg=;
 b=CSAkMF4y/c3zAn4EpaBDYXzLiIEdQysXSKYxougaXBN6Pu746MMyM7PK43HRR69Pla
 5MZZjmJegjWzABhsuMgbvOFmPaoW3u425m5wz74eyzKm/5+OeI41NI8aJOJ4GAOPV9DB
 cnf/3jfycxWVWaj8chRIbD81fqMC1zNC12nBmkb12rLFrTH8lKydMQmDAATfJWKT4U57
 YUec42MiFqlHYiSl5J85h9y2E81r4c5Aaf/nA+I2vRzUBQ0IeFPWwl9WbF83I2nSfKIm
 gCYHDHMXEPnSXOCWZYyw6gLVr1s+4h5ouYEjvUns8bvbbST1L0HHlxVobmf6vpemnxYA
 yMiw==
X-Gm-Message-State: APjAAAU2MyeZEtjq/pRGaexYAgcyPR74ruM02tiQAZHsVeIULxnIp0pX
 cFsNvORklYi3OCgl8PmuxjUsKepGb3I1D1Q6Hn+FAw==
X-Google-Smtp-Source: APXvYqwDxlwzlziWG2rmZ3MYHWHVSrbJZoc2VKOT+ol4vPkJ036OR/oV9QpSRV2XOPC4wAOhLpEj0H2Urmw2MPMj+58=
X-Received: by 2002:a6b:4e1a:: with SMTP id c26mr54148491iob.178.1564413587616; 
 Mon, 29 Jul 2019 08:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <4116c27c037b5e7f4822cfd7199724450dc6b5da.1564080680.git.alistair.francis@wdc.com>
In-Reply-To: <4116c27c037b5e7f4822cfd7199724450dc6b5da.1564080680.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Mon, 29 Jul 2019 23:19:36 +0800
Message-ID: <CAEiOBXUcwp5rZbdH7VuQjnM3Xq5-ONTWmcDp1Da+C1n_-w95Uw@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000002c1d7c058ed36ca1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d29
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v1 6/6] target/riscv: Fix
 Floating Point register names
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
X-List-Received-Date: Mon, 29 Jul 2019 15:19:51 -0000

--0000000000002c1d7c058ed36ca1
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 26, 2019 at 2:56 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> From: Atish Patra <atish.patra@wdc.com>
>
> As per the RISC-V spec, Floating Point registers are named as f0..f31
> so lets fix the register names accordingly.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f8d07bd20a..af1e9b7690 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -40,10 +40,10 @@ const char * const riscv_int_regnames[] = {
>  };
>
>  const char * const riscv_fpr_regnames[] = {
> -  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
> -  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
> -  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
> -  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
> +  "f0", "f1", "f2",  "f3",  "f4", "f5", "f6", "f7",
> +  "f8", "f9", "f10",  "f11",  "f12", "f13", "f14", "f15",
> +  "f16", "f17", "f18",  "f19",  "f20", "f21", "f22", "f23",
> +  "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31"
>  };
>

Could you indicate the section of the spec ?
By chapter 20 of user spec, the patch changes the floating register name to
architecture name but leave the integer register use the ABI name.

chihmin

>  const char * const riscv_excp_names[] = {
> --
> 2.22.0
>
>
>

--0000000000002c1d7c058ed36ca1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 26, 2019 at 2:56 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.francis@wd=
c.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">From: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" target=3D=
"_blank">atish.patra@wdc.com</a>&gt;<br>
<br>
As per the RISC-V spec, Floating Point registers are named as f0..f31<br>
so lets fix the register names accordingly.<br>
<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" targe=
t=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index f8d07bd20a..af1e9b7690 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -40,10 +40,10 @@ const char * const riscv_int_regnames[] =3D {<br>
=C2=A0};<br>
<br>
=C2=A0const char * const riscv_fpr_regnames[] =3D {<br>
-=C2=A0 &quot;ft0&quot;, &quot;ft1&quot;, &quot;ft2&quot;,=C2=A0 &quot;ft3&=
quot;,=C2=A0 &quot;ft4&quot;, &quot;ft5&quot;, &quot;ft6&quot;,=C2=A0 &quot=
;ft7&quot;,<br>
-=C2=A0 &quot;fs0&quot;, &quot;fs1&quot;, &quot;fa0&quot;,=C2=A0 &quot;fa1&=
quot;,=C2=A0 &quot;fa2&quot;, &quot;fa3&quot;, &quot;fa4&quot;,=C2=A0 &quot=
;fa5&quot;,<br>
-=C2=A0 &quot;fa6&quot;, &quot;fa7&quot;, &quot;fs2&quot;,=C2=A0 &quot;fs3&=
quot;,=C2=A0 &quot;fs4&quot;, &quot;fs5&quot;, &quot;fs6&quot;,=C2=A0 &quot=
;fs7&quot;,<br>
-=C2=A0 &quot;fs8&quot;, &quot;fs9&quot;, &quot;fs10&quot;, &quot;fs11&quot=
;, &quot;ft8&quot;, &quot;ft9&quot;, &quot;ft10&quot;, &quot;ft11&quot;<br>
+=C2=A0 &quot;f0&quot;, &quot;f1&quot;, &quot;f2&quot;,=C2=A0 &quot;f3&quot=
;,=C2=A0 &quot;f4&quot;, &quot;f5&quot;, &quot;f6&quot;, &quot;f7&quot;,<br=
>
+=C2=A0 &quot;f8&quot;, &quot;f9&quot;, &quot;f10&quot;,=C2=A0 &quot;f11&qu=
ot;,=C2=A0 &quot;f12&quot;, &quot;f13&quot;, &quot;f14&quot;, &quot;f15&quo=
t;,<br>
+=C2=A0 &quot;f16&quot;, &quot;f17&quot;, &quot;f18&quot;,=C2=A0 &quot;f19&=
quot;,=C2=A0 &quot;f20&quot;, &quot;f21&quot;, &quot;f22&quot;, &quot;f23&q=
uot;,<br>
+=C2=A0 &quot;f24&quot;, &quot;f25&quot;, &quot;f26&quot;, &quot;f27&quot;,=
 &quot;f28&quot;, &quot;f29&quot;, &quot;f30&quot;, &quot;f31&quot;<br>
=C2=A0};<br></blockquote><div><br></div><div>Could you indicate the section=
 of the spec ?=C2=A0=C2=A0</div><div>By chapter 20 of user spec, the patch =
changes the floating register name to architecture name but leave the integ=
er register use the ABI name.=C2=A0</div><div><br></div><div>chihmin</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0const char * const riscv_excp_names[] =3D {<br>
-- <br>
2.22.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000002c1d7c058ed36ca1--


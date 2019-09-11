Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i83xy-0007pe-LN
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 10:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i83xu-0007kq-Sk
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 10:51:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i83xt-00087p-39
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 10:51:26 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:44773)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i83xs-00087B-Qa
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 10:51:25 -0400
Received: by mail-io1-xd44.google.com with SMTP id j4so46438402iog.11
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DKg/pSa5KC6awsuIG5WpCszhbi2ykvLdh1jfm7RlOCU=;
 b=frtVqm702iDRzV8joEeyIpQ9Pi1rDX+RygW3q+YfAQuJFhRn1nNM3JAZeJyaswBki1
 aMAU3Q+jUeM+FQf1Nk90G2M5hjUlH88tZDjT/XuJYUdjRLpipXJJQRbCdw4aWXfr/e9f
 AeNiKgY+8vIeVf20AT7zwXLK0U6vITabDzzdDDPLj0C+UJ8PNnVkrwP2ILrZieAHjEGH
 xKW3kGJ3A9h7vIlLUyhsXuUYF/iqIdRFYpoGTj++Qm1/m9bgEeCnNTfJJ+G+9R1XeVPm
 PZ9nxFXQ/kWIz6VtDFvzhSYGKffMl3nD/vRRlqJeKlmPSbLrMMh37AhIiNWiEHLBND9Q
 e9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKg/pSa5KC6awsuIG5WpCszhbi2ykvLdh1jfm7RlOCU=;
 b=ov3ESYCzFJsbBDjN8PU7B5DwPU2qYFHk2gmGinVcFWgYdLgbBfV/zY5BXrm6Lz/oUF
 Hja9nY39HuWIzbSO1AtgQUr0ln7kdtuier/at1yQ6ZPzFnFz8XFB49hWzlyY4BUUBStn
 g4xot280OHxrxoDgb9eD0F63NmNMczs/av3/oc2NW8V625N5sTtBkJ54RY2BkEM/jVBy
 42+H6gOgFqqY4a4c7sZgHjFqXFWUF2dM6TO5ZXo6Mw283UMFarLDehbsOEDFZBCNYIGW
 LlukGLzRkZ/SwQ6ZdgjV9P9dvfyI7JdCQsP5i7/BMwLSh5Dg2tWQcSvTi44EGQsVpXPj
 DTjw==
X-Gm-Message-State: APjAAAU1bgksoZdxXFQZPsjWpfbI5DCsvvKBbzk53/0uRtzXLh7OsEy+
 3xfJ7gptFIzQjzei26iGM2t9VxvIL8Gj7BUl0AbPyQ==
X-Google-Smtp-Source: APXvYqwri+DYLseY2oPTtom1S3OAAdSW6dcHn0TjPIFLGUqPSESwd9knfGxQAXag8H3drs2ZDdzwiAFuoVSYEjv8u9A=
X-Received: by 2002:a05:6602:2516:: with SMTP id
 i22mr2906275ioe.129.1568213483487; 
 Wed, 11 Sep 2019 07:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
In-Reply-To: <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 11 Sep 2019 22:51:12 +0800
Message-ID: <CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com>
To: liuzhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, riku.voipio@iki.fi,
 laurent@vivier.eu, 
 wenmeng_zhang@c-sky.com, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="0000000000009da4de05924827c5"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 01/17] RISC-V: add vfp
 field in CPURISCVState
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
X-List-Received-Date: Wed, 11 Sep 2019 14:51:29 -0000

--0000000000009da4de05924827c5
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 11, 2019 at 2:35 PM liuzhiwei <zhiwei_liu@c-sky.com> wrote:

> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0adb307..c992b1d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -93,9 +93,37 @@ typedef struct CPURISCVState CPURISCVState;
>
>  #include "pmp.h"
>
> +#define VLEN 128
> +#define VUNIT(x) (VLEN / x)
> +
>  struct CPURISCVState {
>      target_ulong gpr[32];
>      uint64_t fpr[32]; /* assume both F and D extensions */
> +
> +    /* vector coprocessor state.  */
> +    struct {
> +        union VECTOR {
> +            float64  f64[VUNIT(64)];
> +            float32  f32[VUNIT(32)];
> +            float16  f16[VUNIT(16)];
> +            uint64_t u64[VUNIT(64)];
> +            int64_t  s64[VUNIT(64)];
> +            uint32_t u32[VUNIT(32)];
> +            int32_t  s32[VUNIT(32)];
> +            uint16_t u16[VUNIT(16)];
> +            int16_t  s16[VUNIT(16)];
> +            uint8_t  u8[VUNIT(8)];
> +            int8_t   s8[VUNIT(8)];
> +        } vreg[32];
> +        target_ulong vxrm;
> +        target_ulong vxsat;
> +        target_ulong vl;
> +        target_ulong vstart;
> +        target_ulong vtype;
> +        float_status fp_status;
> +    } vfp;
> +
> +    bool         foflag;
>      target_ulong pc;
>      target_ulong load_res;
>      target_ulong load_val;
> --
> 2.7.4
>
>
Could  the VLEN be configurable in cpu initialization but not fixed in
compilation phase ?
Take the integer element as example  and the difference should be the
stride of vfp.vreg[x] isn't continuous

    struct {
        union VECTOR {
            uint64_t *u64;
            uint16_t *u16;
            uint8_t  *u8;
        } vreg[32];
    } vfp;

   initialization

    int vlen = 256;  //parameter from cpu command line option
    int elem = vlen / 8;
    int size = elem * 32;

    uint8_t *mem = malloc(size)
    for (int idx = 0; idx < 32; ++idx) {
        vfp.vreg[idx].u64 = (void *)&mem[idx * elem];
        vfp.vreg[idx].u32 = (void *)&mem[idx * elem];
        vfp.vreg[idx].u16 = (void *)&mem[idx * elem];
   }

  chihmin

--0000000000009da4de05924827c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 11, 2019 at 2:35 PM liuzh=
iwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zhiwei_l=
iu@c-sky.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" ta=
rget=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h | 28 ++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 28 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 0adb307..c992b1d 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -93,9 +93,37 @@ typedef struct CPURISCVState CPURISCVState;<br>
<br>
=C2=A0#include &quot;pmp.h&quot;<br>
<br>
+#define VLEN 128<br>
+#define VUNIT(x) (VLEN / x)<br>
+<br>
=C2=A0struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0target_ulong gpr[32];<br>
=C2=A0 =C2=A0 =C2=A0uint64_t fpr[32]; /* assume both F and D extensions */<=
br>
+<br>
+=C2=A0 =C2=A0 /* vector coprocessor state.=C2=A0 */<br>
+=C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 union VECTOR {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float64=C2=A0 f64[VUNIT(64)];<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float32=C2=A0 f32[VUNIT(32)];<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float16=C2=A0 f16[VUNIT(16)];<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t u64[VUNIT(64)];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t=C2=A0 s64[VUNIT(64)];<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t u32[VUNIT(32)];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int32_t=C2=A0 s32[VUNIT(32)];<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t u16[VUNIT(16)];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int16_t=C2=A0 s16[VUNIT(16)];<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 u8[VUNIT(8)];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int8_t=C2=A0 =C2=A0s8[VUNIT(8)];=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } vreg[32];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong vxrm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong vxsat;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong vl;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong vstart;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong vtype;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 float_status fp_status;<br>
+=C2=A0 =C2=A0 } vfp;<br>
+<br>
+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0foflag;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong pc;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong load_res;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong load_val;<br>
-- <br>
2.7.4<br><br></blockquote><div><br></div><div>Could=C2=A0 the VLEN be confi=
gurable in cpu initialization but not fixed in compilation phase ?</div><di=
v>Take the integer element as example=C2=A0 and the difference should be th=
e stride of vfp.vreg[x] isn&#39;t continuous</div><div><br></div><div>=C2=
=A0 =C2=A0 struct {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 union VECTOR {<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *u64;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 uint16_t *u16;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint8_t=C2=A0 *u8;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 } vreg[32];<br>=C2=
=A0 =C2=A0 } vfp;=C2=A0=C2=A0<br></div><div><br></div><div>=C2=A0 =C2=A0ini=
tialization</div><div>=C2=A0</div>=C2=A0 =C2=A0 int vlen =3D 256;=C2=A0 //p=
arameter from cpu command line option<br>=C2=A0 =C2=A0 int elem =3D vlen / =
8;<br>=C2=A0 =C2=A0 int size =3D elem * 32;<br><br>=C2=A0 =C2=A0 uint8_t *m=
em =3D malloc(size)<br>=C2=A0 =C2=A0 for (int idx =3D 0; idx &lt; 32; ++idx=
) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vfp.vreg[idx].u64 =3D (void *)&amp;mem[i=
dx * elem];<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vfp.vreg[idx].u32 =3D (void *)&a=
mp;mem[idx * elem];<br><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vfp.vreg[idx].u16 =
=3D (void *)&amp;mem[idx * elem];<br></div><div>=C2=A0 =C2=A0}</div><div><b=
r></div><div>=C2=A0 chihmin</div></div></div>

--0000000000009da4de05924827c5--


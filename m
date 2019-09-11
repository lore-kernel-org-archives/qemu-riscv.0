Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i84VD-0005dG-G4
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 11:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54922)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i84V8-0005XG-OP
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 11:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i84V6-0000Pl-KU
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 11:25:46 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:40286)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i84V6-0000PH-Dj
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 11:25:44 -0400
Received: by mail-io1-xd43.google.com with SMTP id h144so46667602iof.7
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WDXxo7RChx1Yedny8qFMElJwnL7cMFzyo3wfJ0zwgjk=;
 b=Zb0oQ47/+P1wa+mjC6AdQ3unyt/Z99GBT2SLffyBL8pROPEDPrc5RA2FkHfvBl5h8r
 L0fuKYYMYcRnY/KzS8fk9avB1uKW+Jq7nRs6G8+jLXq26r09M9Ist+O29/lYQ1vk8zLx
 VlFxOs18FXVW+9ScNZ3cqe4kz8qR4LZo9nda+TR55edmKGlMfyYqWI9819o0r+8O9LS+
 i3MsGxTNudvbRum6dJE6S6o7QwUq3FWnQTgomqC+xJklGAuHPzQEg36sarTyncB8OzyS
 nd6v1Kfhyuot5xdHebYVs6njJ1AsrSxm5iDzcrNsGiv7ySIfDpvOnuZeoZHsITotejn8
 2Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WDXxo7RChx1Yedny8qFMElJwnL7cMFzyo3wfJ0zwgjk=;
 b=oqcoLzrZMp06WpPt36Z/LUrUABxh83+pP2zSbtLiRyoX7OfDn8ELOj23xXLaAKd3iT
 TVhIdtR07UBkmxzfoGxixSQR9ejA67ID5h7m7OUWq61uucWcPiv3hZRxyvVKYW4WqgzU
 a7QeDazru7spO1aKP+jK1l1TbWX9jL4nr/OF+cnqpmeBVAFwUGGf/Eqqzuobh6OHY++W
 htiqQOJ5xXHXnbgeII3uNvwJidy3PGOzuW7i63ngkHNsjXUTESXoXGL8Emsv4mFk7aJU
 zjsIjFpwsV7pEVHcSCInKQt/n1A6uk5jL1Rf+2KYcNmRvJtax8KZ9P3qlRebcCXCU34p
 b1Lw==
X-Gm-Message-State: APjAAAUGvfI4j786/nY4803qWEa7MLHli8NSIiw5hcEOqAzFgUgjrVBo
 orAIKaW/WwS0XDgUomPCnqlI/k1TWsOHf7+J9i4wqQ==
X-Google-Smtp-Source: APXvYqwmrchLaUawFJaNqlPBFrAFk1kmYTK8WctTcZDjfjl0TKZpAGBqbCj0a6yxPGpBLzbTsgJ2MZse2nprmURRtLk=
X-Received: by 2002:a6b:ec16:: with SMTP id c22mr1362431ioh.185.1568215543429; 
 Wed, 11 Sep 2019 08:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-4-git-send-email-zhiwei_liu@c-sky.com>
In-Reply-To: <1568183141-67641-4-git-send-email-zhiwei_liu@c-sky.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 11 Sep 2019 23:25:32 +0800
Message-ID: <CAEiOBXUoYKPes+BoDCWdDw60nyaqzW2qtgTVAdQ4Sbf_QuNTJA@mail.gmail.com>
To: liuzhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, riku.voipio@iki.fi,
 laurent@vivier.eu, 
 wenmeng_zhang@c-sky.com, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="00000000000065dbcd059248a27b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
Subject: Re: [Qemu-riscv] [PATCH v2 03/17] RISC-V: support vector extension
 csr
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
X-List-Received-Date: Wed, 11 Sep 2019 15:25:50 -0000

--00000000000065dbcd059248a27b
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 11, 2019 at 2:38 PM liuzhiwei <zhiwei_liu@c-sky.com> wrote:

> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu_bits.h | 15 ++++++++++++
>  target/riscv/csr.c      | 65
> ++++++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 76 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 11f971a..9eb43ec 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -29,6 +29,14 @@
>  #define FSR_NXA             (FPEXC_NX << FSR_AEXC_SHIFT)
>  #define FSR_AEXC            (FSR_NVA | FSR_OFA | FSR_UFA | FSR_DZA |
> FSR_NXA)
>
> +/* Vector Fixed-Point round model */
> +#define FSR_VXRM_SHIFT      9
> +#define FSR_VXRM            (0x3 << FSR_VXRM_SHIFT)
> +
> +/* Vector Fixed-Point saturation flag */
> +#define FSR_VXSAT_SHIFT     8
> +#define FSR_VXSAT           (0x1 << FSR_VXSAT_SHIFT)
> +
>  /* Control and Status Registers */
>
>  /* User Trap Setup */
> @@ -48,6 +56,13 @@
>  #define CSR_FRM             0x002
>  #define CSR_FCSR            0x003
>
> +/* User Vector CSRs */
> +#define CSR_VSTART          0x008
> +#define CSR_VXSAT           0x009
> +#define CSR_VXRM            0x00a
> +#define CSR_VL              0xc20
> +#define CSR_VTYPE           0xc21
> +
>  /* User Timers and Counters */
>  #define CSR_CYCLE           0xc00
>  #define CSR_TIME            0xc01
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e0d4586..a6131ff 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -87,12 +87,12 @@ static int ctr(CPURISCVState *env, int csrno)
>      return 0;
>  }
>
> -#if !defined(CONFIG_USER_ONLY)
>  static int any(CPURISCVState *env, int csrno)
>  {
>      return 0;
>  }
>
> +#if !defined(CONFIG_USER_ONLY)
>  static int smode(CPURISCVState *env, int csrno)
>  {
>      return -!riscv_has_ext(env, RVS);
> @@ -158,8 +158,10 @@ static int read_fcsr(CPURISCVState *env, int csrno,
> target_ulong *val)
>          return -1;
>      }
>  #endif
> -    *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
> -        | (env->frm << FSR_RD_SHIFT);
> +    *val = (env->vfp.vxrm << FSR_VXRM_SHIFT)
> +            | (env->vfp.vxsat << FSR_VXSAT_SHIFT)
> +            | (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
> +            | (env->frm << FSR_RD_SHIFT);
>      return 0;
>  }
>
> @@ -172,10 +174,60 @@ static int write_fcsr(CPURISCVState *env, int csrno,
> target_ulong val)
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
> +    env->vfp.vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
> +    env->vfp.vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
>      riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
>      return 0;
>  }
>
> +static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vfp.vtype;
> +    return 0;
> +}
> +
> +static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vfp.vl;
> +    return 0;
> +}
> +
> +static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vfp.vxrm;
> +    return 0;
> +}
> +
> +static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vfp.vxsat;
> +    return 0;
> +}
> +
> +static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vfp.vstart;
> +    return 0;
> +}
> +
> +static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vfp.vxrm = val;
> +    return 0;
> +}
> +
> +static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vfp.vxsat = val;
> +    return 0;
> +}
> +
> +static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vfp.vstart = val;
> +    return 0;
> +}
> +
>  /* User Timers and Counters */
>  static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -873,7 +925,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
> {
>      [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags
>   },
>      [CSR_FRM] =                 { fs,   read_frm,         write_frm
>    },
>      [CSR_FCSR] =                { fs,   read_fcsr,        write_fcsr
>   },
> -
> +    /* Vector CSRs */
> +    [CSR_VSTART] =              { any,   read_vstart,     write_vstart
>   },
> +    [CSR_VXSAT] =               { any,   read_vxsat,      write_vxsat
>    },
> +    [CSR_VXRM] =                { any,   read_vxrm,       write_vxrm
>   },
> +    [CSR_VL] =                  { any,   read_vl
>   },
> +    [CSR_VTYPE] =               { any,   read_vtype
>    },
>      /* User Timers and Counters */
>      [CSR_CYCLE] =               { ctr,  read_instret
>   },
>      [CSR_INSTRET] =             { ctr,  read_instret
>   },
> --
> 2.7.4
>
>
>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--00000000000065dbcd059248a27b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 11, 2019 at 2:38 PM liuzh=
iwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com">zhiwei_liu@c-sky.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zh=
iwei_liu@c-sky.com</a>&gt;<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_bits.h | 15 ++++++++++++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 65 +++++++++++++++++++++++++=
+++++++++++++++++++++---<br>
=C2=A02 files changed, 76 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 11f971a..9eb43ec 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -29,6 +29,14 @@<br>
=C2=A0#define FSR_NXA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(FPEXC=
_NX &lt;&lt; FSR_AEXC_SHIFT)<br>
=C2=A0#define FSR_AEXC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (FSR_NVA | =
FSR_OFA | FSR_UFA | FSR_DZA | FSR_NXA)<br>
<br>
+/* Vector Fixed-Point round model */<br>
+#define FSR_VXRM_SHIFT=C2=A0 =C2=A0 =C2=A0 9<br>
+#define FSR_VXRM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x3 &lt;&lt; FS=
R_VXRM_SHIFT)<br>
+<br>
+/* Vector Fixed-Point saturation flag */<br>
+#define FSR_VXSAT_SHIFT=C2=A0 =C2=A0 =C2=A08<br>
+#define FSR_VXSAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; FS=
R_VXSAT_SHIFT)<br>
+<br>
=C2=A0/* Control and Status Registers */<br>
<br>
=C2=A0/* User Trap Setup */<br>
@@ -48,6 +56,13 @@<br>
=C2=A0#define CSR_FRM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x002<=
br>
=C2=A0#define CSR_FCSR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x003<br>
<br>
+/* User Vector CSRs */<br>
+#define CSR_VSTART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x008<br>
+#define CSR_VXSAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x009<br>
+#define CSR_VXRM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00a<br>
+#define CSR_VL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xc20<br>
+#define CSR_VTYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xc21<br>
+<br>
=C2=A0/* User Timers and Counters */<br>
=C2=A0#define CSR_CYCLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xc00<br>
=C2=A0#define CSR_TIME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xc01<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index e0d4586..a6131ff 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -87,12 +87,12 @@ static int ctr(CPURISCVState *env, int csrno)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
-#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0static int any(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0static int smode(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return -!riscv_has_ext(env, RVS);<br>
@@ -158,8 +158,10 @@ static int read_fcsr(CPURISCVState *env, int csrno, ta=
rget_ulong *val)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 *val =3D (riscv_cpu_get_fflags(env) &lt;&lt; FSR_AEXC_SHIFT)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 | (env-&gt;frm &lt;&lt; FSR_RD_SHIFT);<br>
+=C2=A0 =C2=A0 *val =3D (env-&gt;vfp.vxrm &lt;&lt; FSR_VXRM_SHIFT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (env-&gt;vfp.vxsat &lt;&lt; FS=
R_VXSAT_SHIFT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (riscv_cpu_get_fflags(env) &lt=
;&lt; FSR_AEXC_SHIFT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | (env-&gt;frm &lt;&lt; FSR_RD_S=
HIFT);<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
@@ -172,10 +174,60 @@ static int write_fcsr(CPURISCVState *env, int csrno, =
target_ulong val)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mstatus |=3D MSTATUS_FS;<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;frm =3D (val &amp; FSR_RD) &gt;&gt; FSR_RD_SHIF=
T;<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vxrm =3D (val &amp; FSR_VXRM) &gt;&gt; FSR_VXRM_=
SHIFT;<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vxsat =3D (val &amp; FSR_VXSAT) &gt;&gt; FSR_VXS=
AT_SHIFT;<br>
=C2=A0 =C2=A0 =C2=A0riscv_cpu_set_fflags(env, (val &amp; FSR_AEXC) &gt;&gt;=
 FSR_AEXC_SHIFT);<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)<br=
>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;vfp.vtype;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)<br>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;vfp.vl;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int read_vxrm(CPURISCVState *env, int csrno, target_ulong *val)<br>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;vfp.vxrm;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int read_vxsat(CPURISCVState *env, int csrno, target_ulong *val)<br=
>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;vfp.vxsat;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int read_vstart(CPURISCVState *env, int csrno, target_ulong *val)<b=
r>
+{<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;vfp.vstart;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)<br>
+{<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vxrm =3D val;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)<br=
>
+{<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vxsat =3D val;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)<b=
r>
+{<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vstart =3D val;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0/* User Timers and Counters */<br>
=C2=A0static int read_instret(CPURISCVState *env, int csrno, target_ulong *=
val)<br>
=C2=A0{<br>
@@ -873,7 +925,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0[CSR_FFLAGS] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 { fs,=C2=A0 =C2=A0read_fflags,=C2=A0 =C2=A0 =C2=A0 write_fflags=
=C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_FRM] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{ fs,=C2=A0 =C2=A0read_frm,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0write_frm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0[CSR_FCSR] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 { fs,=C2=A0 =C2=A0read_fcsr,=C2=A0 =C2=A0 =C2=A0 =C2=A0 writ=
e_fcsr=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
-<br>
+=C2=A0 =C2=A0 /* Vector CSRs */<br>
+=C2=A0 =C2=A0 [CSR_VSTART] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 { any,=C2=A0 =C2=A0read_vstart,=C2=A0 =C2=A0 =C2=A0write_vstart=C2=
=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_VXSAT] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{ any,=C2=A0 =C2=A0read_vxsat,=C2=A0 =C2=A0 =C2=A0 write_vxsat=C2=
=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 [CSR_VXRM] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 { any,=C2=A0 =C2=A0read_vxrm,=C2=A0 =C2=A0 =C2=A0 =C2=A0write_vx=
rm=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_VL] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 { any,=C2=A0 =C2=A0read_vl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [CSR_VTYPE] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{ any,=C2=A0 =C2=A0read_vtype=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0 =C2=A0 =C2=A0/* User Timers and Counters */<br>
=C2=A0 =C2=A0 =C2=A0[CSR_CYCLE] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0{ ctr,=C2=A0 read_instret=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_INSTRET] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{ ctr,=C2=A0 read_instret=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
-- <br>
2.7.4<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.c=
om</a>&gt;=C2=A0=C2=A0=C2=A0</div></div></div>

--00000000000065dbcd059248a27b--


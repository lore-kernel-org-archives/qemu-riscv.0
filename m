Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i8576-0004MB-7f
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 12:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i856z-0004D9-IV
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 12:04:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i856w-0001RP-Id
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 12:04:53 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:40112)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i856w-0001Qx-9T
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 12:04:50 -0400
Received: by mail-io1-xd43.google.com with SMTP id h144so46985342iof.7
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NpxJWpS8/LST6Afz5+sKG/0CQ6l7N8dpKlYJAnkHE2s=;
 b=DACrEz6OkERkS6gR2xU5YRmirFivqPY9qFgdMh8ao+EyXzX10TJtMauo+WSrfnP53r
 fdXLxmDIfgwYCN4X0acigDQRV7IyupVQrlySBdb9cUYvd22tnSVk2M/9yzjeggptBK9q
 TtG0ztm874dQM5yvFkYX2lZ3hqm9TGbodXhmSKx3lb/LcQkQRRgS8m4uS31xSlrxqtHp
 2YvvGWzGo0OJdUGKuQNL59qf79IOkJH7hVToztGHxr6PRdDY9vppZrpgch/zec7GCnq3
 Dz5e/z09K8m/1jbTZiiyblWt62n+Qt4Bzda8ePRFMhvUNixUph6q/g1Tjkks/GGIcX1b
 ww6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpxJWpS8/LST6Afz5+sKG/0CQ6l7N8dpKlYJAnkHE2s=;
 b=cQ+VZ3skrVqVFwoiNtqx28wCM6LGnvLieB7X7TZVWo6WRfhCpIA6ofCcFcclqJOMY6
 76f1BlM1c7M0nQqv0TsrUMkVoeL0MF9X61LInyQIgeF9caAV63v21soStf6jXQjrgQM1
 yYEsyGs2+G+PnpAHiByiW8sJeXyR3PjRClTj3QLslkBKlAIi1tBzsPh80busivnmiOLX
 w3cGcQg0w5m8BCIcFrgZ8jlLNS0EOBsK7h8UwFM9uVGWA1rNXuu5E5gFcFVJnP8ZzKS9
 IZWDOHlzb9YWBJJSHQIQxeztDxvmwilEHi+/9b/IDn5jN4g/3MG1Np4n/OmY/z543JFr
 rZXA==
X-Gm-Message-State: APjAAAW45yBQBJ9Mzty3tT3HwGXlMXiHGZUO0zTSq27q11menV311yN8
 XurWsa7m37xiEf3tv45ur2ZCywTZ3M+IFGxGxpjaTg==
X-Google-Smtp-Source: APXvYqycntMLAPsX39w2VHJ6TCzDl3rB2FHJ96lRCR2v/iJwJwyZF6k6fn/tMOPkVCAeuRAtbepGu73HgjyqcS3ksEQ=
X-Received: by 2002:a5d:9f0f:: with SMTP id q15mr2397000iot.163.1568217889497; 
 Wed, 11 Sep 2019 09:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-5-git-send-email-zhiwei_liu@c-sky.com>
In-Reply-To: <1568183141-67641-5-git-send-email-zhiwei_liu@c-sky.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 12 Sep 2019 00:04:38 +0800
Message-ID: <CAEiOBXWsuVeQ82ockYf=Vwqaxfzoc9fin+w3itNZZho2tO+6Mg@mail.gmail.com>
To: liuzhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, riku.voipio@iki.fi,
 laurent@vivier.eu, 
 wenmeng_zhang@c-sky.com, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="0000000000003bf7110592492ecb"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
Subject: Re: [Qemu-riscv] [PATCH v2 04/17] RISC-V: add vector extension
 configure instruction
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
X-List-Received-Date: Wed, 11 Sep 2019 16:04:58 -0000

--0000000000003bf7110592492ecb
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 11, 2019 at 2:38 PM liuzhiwei <zhiwei_liu@c-sky.com> wrote:

> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/Makefile.objs              |   2 +-
>  target/riscv/helper.h                   |   3 +
>  target/riscv/insn32.decode              |   5 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |  46 ++++++++++++
>  target/riscv/translate.c                |   1 +
>  target/riscv/vector_helper.c            | 126
> ++++++++++++++++++++++++++++++++
>  6 files changed, 182 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c
>  create mode 100644 target/riscv/vector_helper.c
>
> diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
> index b1c79bc..d577cef 100644
> --- a/target/riscv/Makefile.objs
> +++ b/target/riscv/Makefile.objs
> @@ -1,4 +1,4 @@
> -obj-y += translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o
> gdbstub.o pmp.o
> +obj-y += translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o
> vector_helper.o gdbstub.o pmp.o
>
>  DECODETREE = $(SRC_PATH)/scripts/decodetree.py
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index debb22a..652f8c3 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -76,3 +76,6 @@ DEF_HELPER_2(mret, tl, env, tl)
>  DEF_HELPER_1(wfi, void, env)
>  DEF_HELPER_1(tlb_flush, void, env)
>  #endif
> +/* Vector functions */
> +DEF_HELPER_4(vector_vsetvli, void, env, i32, i32, i32)
> +DEF_HELPER_4(vector_vsetvl, void, env, i32, i32, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 77f794e..5dc009c 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -62,6 +62,7 @@
>  @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
>  @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
>  @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
> +@r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
>
>  @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
>  @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
> @@ -203,3 +204,7 @@ fcvt_w_d   1100001  00000 ..... ... ..... 1010011
> @r2_rm
>  fcvt_wu_d  1100001  00001 ..... ... ..... 1010011 @r2_rm
>  fcvt_d_w   1101001  00000 ..... ... ..... 1010011 @r2_rm
>  fcvt_d_wu  1101001  00001 ..... ... ..... 1010011 @r2_rm
> +
> +# *** RV32V Extension ***
> +vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
> +vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c
> b/target/riscv/insn_trans/trans_rvv.inc.c
> new file mode 100644
> index 0000000..82e7ad6
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -0,0 +1,46 @@
> +/*
> + * RISC-V translation routines for the RVV Standard Extension.
> + *
> + * Copyright (c) 2019 C-SKY Limited. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define GEN_VECTOR_R(INSN) \
> +static bool trans_##INSN(DisasContext *ctx, arg_##INSN * a) \
> +{                                                      \
> +    TCGv_i32 s1 = tcg_const_i32(a->rs1);               \
> +    TCGv_i32 s2 = tcg_const_i32(a->rs2);               \
> +    TCGv_i32 d  = tcg_const_i32(a->rd);                \
> +    gen_helper_vector_##INSN(cpu_env, s1, s2, d);    \
> +    tcg_temp_free_i32(s1);                             \
> +    tcg_temp_free_i32(s2);                             \
> +    tcg_temp_free_i32(d);                              \
> +    return true;                                       \
> +}
> +
> +#define GEN_VECTOR_R2_ZIMM(INSN) \
> +static bool trans_##INSN(DisasContext *ctx, arg_##INSN * a) \
> +{                                                      \
> +    TCGv_i32 s1 = tcg_const_i32(a->rs1);               \
> +    TCGv_i32 zimm = tcg_const_i32(a->zimm);            \
> +    TCGv_i32 d  = tcg_const_i32(a->rd);                \
> +    gen_helper_vector_##INSN(cpu_env, s1, zimm, d);      \
> +    tcg_temp_free_i32(s1);                             \
> +    tcg_temp_free_i32(zimm);                           \
> +    tcg_temp_free_i32(d);                              \
> +    return true;                                       \
> +}
> +
> +GEN_VECTOR_R2_ZIMM(vsetvli)
> +GEN_VECTOR_R(vsetvl)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8d6ab73..587c23e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -706,6 +706,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>  #include "insn_trans/trans_rva.inc.c"
>  #include "insn_trans/trans_rvf.inc.c"
>  #include "insn_trans/trans_rvd.inc.c"
> +#include "insn_trans/trans_rvv.inc.c"
>  #include "insn_trans/trans_privileged.inc.c"
>
>  /*
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> new file mode 100644
> index 0000000..b279e6f
> --- /dev/null
> +++ b/target/riscv/vector_helper.c
> @@ -0,0 +1,126 @@
> +/*
> + * RISC-V Vectore Extension Helpers for QEMU.
> + *
> + * Copyright (c) 2019 C-SKY Limited. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include <math.h>
> +
> +#define VECTOR_HELPER(name) HELPER(glue(vector_, name))
> +
> +static inline void vector_vtype_set_ill(CPURISCVState *env)
> +{
> +    env->vfp.vtype = ((target_ulong)1) << (sizeof(target_ulong) - 1);
> +    return;
> +}
> +
>
   env->vfp.vtype = ((target_ulong)1) << (sizeof(target_ulong) * 8 - 1);

> +static inline int vector_vtype_get_sew(CPURISCVState *env)
> +{
> +    return (env->vfp.vtype >> 2) & 0x7;
> +}
> +
>
 extract64(env->vfp.vtype, 2, 3);

> +static inline int vector_get_width(CPURISCVState *env)
> +{
> +    return  8 * (1 << vector_vtype_get_sew(env));
> +}
> +
> +static inline int vector_get_lmul(CPURISCVState *env)
> +{
> +    return 1 << (env->vfp.vtype & 0x3);
> +}
> +
>
 extract64(env->vfp.vtype, 0, 2);

> +static inline int vector_get_vlmax(CPURISCVState *env)
> +{
> +    return vector_get_lmul(env) * VLEN / vector_get_width(env);
> +}
> +
> +void VECTOR_HELPER(vsetvl)(CPURISCVState *env, uint32_t rs1, uint32_t rs2,
> +    uint32_t rd)
> +{
> +    int sew, max_sew, vlmax, vl;
> +
> +    if (rs2 == 0) {
> +        vector_vtype_set_ill(env);
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +        return;
> +    }
> +    env->vfp.vtype = env->gpr[rs2];
> +    sew = 1 << vector_get_width(env) / 8;
> +    max_sew = sizeof(target_ulong);
> +
> +    if (env->misa & RVD) {
> +        max_sew = max_sew > 8 ? max_sew : 8;
> +    } else if (env->misa & RVF) {
> +        max_sew = max_sew > 4 ? max_sew : 4;
> +    }


As far as i understand, max_sew is defined by ELEN but not by existing
floating-point extensions.
ELEN should be configurable through command line cpu parameter.



+    if (sew > max_sew) {
> +        vector_vtype_set_ill(env);
> +        return;
> +    }
> +
> +    vlmax = vector_get_vlmax(env);
> +    if (rs1 == 0) {
> +        vl = vlmax;
> +    } else if (env->gpr[rs1] <= vlmax) {
> +        vl = env->gpr[rs1];
> +    } else if (env->gpr[rs1] < 2 * vlmax) {
> +        vl = ceil(env->gpr[rs1] / 2);
> +    } else {
> +        vl = vlmax;
> +    }
> +    env->vfp.vl = vl;
> +    env->gpr[rd] = vl;
> +    env->vfp.vstart = 0;
> +    return;
> +}
> +
> +void VECTOR_HELPER(vsetvli)(CPURISCVState *env, uint32_t rs1, uint32_t
> zimm,
> +    uint32_t rd)
> +{
> +    int sew, max_sew, vlmax, vl;
> +
> +    env->vfp.vtype = zimm;
> +    sew = vector_get_width(env) / 8;
> +    max_sew = sizeof(target_ulong);
> +
> +    if (env->misa & RVD) {
> +        max_sew = max_sew > 8 ? max_sew : 8;
> +    } else if (env->misa & RVF) {
> +        max_sew = max_sew > 4 ? max_sew : 4;
> +    }
> +    if (sew > max_sew) {
> +        vector_vtype_set_ill(env);
> +        return;
> +    }
> +

The same comment described above.

> +    vlmax = vector_get_vlmax(env);
> +    if (rs1 == 0) {
> +        vl = vlmax;
> +    } else if (env->gpr[rs1] <= vlmax) {
> +        vl = env->gpr[rs1];
> +    } else if (env->gpr[rs1] < 2 * vlmax) {
> +        vl = ceil(env->gpr[rs1] / 2);
> +    } else {
> +        vl = vlmax;
> +    }
> +    env->vfp.vl = vl;
> +    env->gpr[rd] = vl;
> +    env->vfp.vstart = 0;
> +    return;
> +}
> --
> 2.7.4
>
>
>

--0000000000003bf7110592492ecb
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
=C2=A0target/riscv/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 ++<br>
=C2=A0target/riscv/insn_trans/trans_rvv.inc.c |=C2=A0 46 ++++++++++++<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 126 ++++++++++++++++++++++++++++++++<br>
=C2=A06 files changed, 182 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c<br>
=C2=A0create mode 100644 target/riscv/vector_helper.c<br>
<br>
diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs<br>
index b1c79bc..d577cef 100644<br>
--- a/target/riscv/Makefile.objs<br>
+++ b/target/riscv/Makefile.objs<br>
@@ -1,4 +1,4 @@<br>
-obj-y +=3D translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o g=
dbstub.o pmp.o<br>
+obj-y +=3D translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o v=
ector_helper.o gdbstub.o pmp.o<br>
<br>
=C2=A0DECODETREE =3D $(SRC_PATH)/scripts/decodetree.py<br>
<br>
diff --git a/target/riscv/helper.h b/target/riscv/helper.h<br>
index debb22a..652f8c3 100644<br>
--- a/target/riscv/helper.h<br>
+++ b/target/riscv/helper.h<br>
@@ -76,3 +76,6 @@ DEF_HELPER_2(mret, tl, env, tl)<br>
=C2=A0DEF_HELPER_1(wfi, void, env)<br>
=C2=A0DEF_HELPER_1(tlb_flush, void, env)<br>
=C2=A0#endif<br>
+/* Vector functions */<br>
+DEF_HELPER_4(vector_vsetvli, void, env, i32, i32, i32)<br>
+DEF_HELPER_4(vector_vsetvl, void, env, i32, i32, i32)<br>
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<br>
index 77f794e..5dc009c 100644<br>
--- a/target/riscv/insn32.decode<br>
+++ b/target/riscv/insn32.decode<br>
@@ -62,6 +62,7 @@<br>
=C2=A0@r_rm=C2=A0 =C2=A0 .......=C2=A0 =C2=A0..... ..... ... ..... ....... =
%rs2 %rs1 %rm %rd<br>
=C2=A0@r2_rm=C2=A0 =C2=A0.......=C2=A0 =C2=A0..... ..... ... ..... ....... =
%rs1 %rm %rd<br>
=C2=A0@r2=C2=A0 =C2=A0 =C2=A0 .......=C2=A0 =C2=A0..... ..... ... ..... ...=
.... %rs1 %rd<br>
+@r2_zimm . zimm:11=C2=A0 ..... ... ..... ....... %rs1 %rd<br>
<br>
=C2=A0@sfence_vma ....... ..... .....=C2=A0 =C2=A0... ..... ....... %rs2 %r=
s1<br>
=C2=A0@sfence_vm=C2=A0 ....... ..... .....=C2=A0 =C2=A0... ..... ....... %r=
s1<br>
@@ -203,3 +204,7 @@ fcvt_w_d=C2=A0 =C2=A01100001=C2=A0 00000 ..... ... ....=
. 1010011 @r2_rm<br>
=C2=A0fcvt_wu_d=C2=A0 1100001=C2=A0 00001 ..... ... ..... 1010011 @r2_rm<br=
>
=C2=A0fcvt_d_w=C2=A0 =C2=A01101001=C2=A0 00000 ..... ... ..... 1010011 @r2_=
rm<br>
=C2=A0fcvt_d_wu=C2=A0 1101001=C2=A0 00001 ..... ... ..... 1010011 @r2_rm<br=
>
+<br>
+# *** RV32V Extension ***<br>
+vsetvli=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 ........... ..... 111 ..... 101=
0111=C2=A0 @r2_zimm<br>
+vsetvl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000 ..... ..... 111 ..... 101=
0111=C2=A0 @r<br>
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_tr=
ans/trans_rvv.inc.c<br>
new file mode 100644<br>
index 0000000..82e7ad6<br>
--- /dev/null<br>
+++ b/target/riscv/insn_trans/trans_rvv.inc.c<br>
@@ -0,0 +1,46 @@<br>
+/*<br>
+ * RISC-V translation routines for the RVV Standard Extension.<br>
+ *<br>
+ * Copyright (c) 2019 C-SKY Limited. All rights reserved.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#define GEN_VECTOR_R(INSN) \<br>
+static bool trans_##INSN(DisasContext *ctx, arg_##INSN * a) \<br>
+{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 TCGv_i32 s1 =3D tcg_const_i32(a-&gt;rs1);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 TCGv_i32 s2 =3D tcg_const_i32(a-&gt;rs2);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 TCGv_i32 d=C2=A0 =3D tcg_const_i32(a-&gt;rd);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 gen_helper_vector_##INSN(cpu_env, s1, s2, d);=C2=A0 =C2=A0 \=
<br>
+=C2=A0 =C2=A0 tcg_temp_free_i32(s1);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 tcg_temp_free_i32(s2);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 tcg_temp_free_i32(d);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 return true;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+}<br>
+<br>
+#define GEN_VECTOR_R2_ZIMM(INSN) \<br>
+static bool trans_##INSN(DisasContext *ctx, arg_##INSN * a) \<br>
+{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 TCGv_i32 s1 =3D tcg_const_i32(a-&gt;rs1);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 TCGv_i32 zimm =3D tcg_const_i32(a-&gt;zimm);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 TCGv_i32 d=C2=A0 =3D tcg_const_i32(a-&gt;rd);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 gen_helper_vector_##INSN(cpu_env, s1, zimm, d);=C2=A0 =C2=A0=
 =C2=A0 \<br>
+=C2=A0 =C2=A0 tcg_temp_free_i32(s1);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 tcg_temp_free_i32(zimm);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 tcg_temp_free_i32(d);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 return true;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+}<br>
+<br>
+GEN_VECTOR_R2_ZIMM(vsetvli)<br>
+GEN_VECTOR_R(vsetvl)<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index 8d6ab73..587c23e 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -706,6 +706,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,<br>
=C2=A0#include &quot;insn_trans/trans_rva.inc.c&quot;<br>
=C2=A0#include &quot;insn_trans/trans_rvf.inc.c&quot;<br>
=C2=A0#include &quot;insn_trans/trans_rvd.inc.c&quot;<br>
+#include &quot;insn_trans/trans_rvv.inc.c&quot;<br>
=C2=A0#include &quot;insn_trans/trans_privileged.inc.c&quot;<br>
<br>
=C2=A0/*<br>
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c<br=
>
new file mode 100644<br>
index 0000000..b279e6f<br>
--- /dev/null<br>
+++ b/target/riscv/vector_helper.c<br>
@@ -0,0 +1,126 @@<br>
+/*<br>
+ * RISC-V Vectore Extension Helpers for QEMU.<br>
+ *<br>
+ * Copyright (c) 2019 C-SKY Limited. All rights reserved.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;cpu.h&quot;<br>
+#include &quot;exec/exec-all.h&quot;<br>
+#include &quot;exec/helper-proto.h&quot;<br>
+#include &lt;math.h&gt;<br>
+<br>
+#define VECTOR_HELPER(name) HELPER(glue(vector_, name))<br>
+<br>
+static inline void vector_vtype_set_ill(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vtype =3D ((target_ulong)1) &lt;&lt; (sizeof(tar=
get_ulong) - 1);<br>
+=C2=A0 =C2=A0 return;<br>
+}<br>
+<br></blockquote><div>=C2=A0 =C2=A0env-&gt;vfp.vtype =3D ((target_ulong)1)=
 &lt;&lt; (sizeof(target_ulong) * 8 - 1);</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
+static inline int vector_vtype_get_sew(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 return (env-&gt;vfp.vtype &gt;&gt; 2) &amp; 0x7;<br>
+}<br>
+<br></blockquote><div>=C2=A0extract64(env-&gt;vfp.vtype, 2, 3);=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
+static inline int vector_get_width(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 return=C2=A0 8 * (1 &lt;&lt; vector_vtype_get_sew(env));<br>
+}<br>
+<br>
+static inline int vector_get_lmul(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 return 1 &lt;&lt; (env-&gt;vfp.vtype &amp; 0x3);<br>
+}<br>
+<br></blockquote><div>=C2=A0extract64(env-&gt;vfp.vtype, 0, 2);=C2=A0=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+static inline int vector_get_vlmax(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 return vector_get_lmul(env) * VLEN / vector_get_width(env);<=
br>
+}<br>
+<br>
+void VECTOR_HELPER(vsetvl)(CPURISCVState *env, uint32_t rs1, uint32_t rs2,=
<br>
+=C2=A0 =C2=A0 uint32_t rd)<br>
+{<br>
+=C2=A0 =C2=A0 int sew, max_sew, vlmax, vl;<br>
+<br>
+=C2=A0 =C2=A0 if (rs2 =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vector_vtype_set_ill(env);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_=
INST, GETPC());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vtype =3D env-&gt;gpr[rs2];<br>
+=C2=A0 =C2=A0 sew =3D 1 &lt;&lt; vector_get_width(env) / 8;<br>
+=C2=A0 =C2=A0 max_sew =3D sizeof(target_ulong);<br>
+<br>
+=C2=A0 =C2=A0 if (env-&gt;misa &amp; RVD) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_sew =3D max_sew &gt; 8 ? max_sew : 8;<br>
+=C2=A0 =C2=A0 } else if (env-&gt;misa &amp; RVF) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_sew =3D max_sew &gt; 4 ? max_sew : 4;<br>
+=C2=A0 =C2=A0 }</blockquote><div><br></div><div>As far as i understand, ma=
x_sew is defined by ELEN but not by existing floating-point extensions.</di=
v><div>ELEN should be configurable through command line cpu parameter.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 if (sew &gt; max_sew) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vector_vtype_set_ill(env);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 vlmax =3D vector_get_vlmax(env);<br>
+=C2=A0 =C2=A0 if (rs1 =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vl =3D vlmax;<br>
+=C2=A0 =C2=A0 } else if (env-&gt;gpr[rs1] &lt;=3D vlmax) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vl =3D env-&gt;gpr[rs1];<br>
+=C2=A0 =C2=A0 } else if (env-&gt;gpr[rs1] &lt; 2 * vlmax) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vl =3D ceil(env-&gt;gpr[rs1] / 2);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vl =3D vlmax;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vl =3D vl;<br>
+=C2=A0 =C2=A0 env-&gt;gpr[rd] =3D vl;<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vstart =3D 0;<br>
+=C2=A0 =C2=A0 return;<br>
+}<br>
+<br>
+void VECTOR_HELPER(vsetvli)(CPURISCVState *env, uint32_t rs1, uint32_t zim=
m,<br>
+=C2=A0 =C2=A0 uint32_t rd)<br>
+{<br>
+=C2=A0 =C2=A0 int sew, max_sew, vlmax, vl;<br>
+<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vtype =3D zimm;<br>
+=C2=A0 =C2=A0 sew =3D vector_get_width(env) / 8;<br>
+=C2=A0 =C2=A0 max_sew =3D sizeof(target_ulong);<br>
+<br>
+=C2=A0 =C2=A0 if (env-&gt;misa &amp; RVD) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_sew =3D max_sew &gt; 8 ? max_sew : 8;<br>
+=C2=A0 =C2=A0 } else if (env-&gt;misa &amp; RVF) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_sew =3D max_sew &gt; 4 ? max_sew : 4;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (sew &gt; max_sew) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vector_vtype_set_ill(env);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+</blockquote><div>The same comment described above.=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 vlmax =3D vector_get_vlmax(env);<br>
+=C2=A0 =C2=A0 if (rs1 =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vl =3D vlmax;<br>
+=C2=A0 =C2=A0 } else if (env-&gt;gpr[rs1] &lt;=3D vlmax) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vl =3D env-&gt;gpr[rs1];<br>
+=C2=A0 =C2=A0 } else if (env-&gt;gpr[rs1] &lt; 2 * vlmax) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vl =3D ceil(env-&gt;gpr[rs1] / 2);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vl =3D vlmax;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vl =3D vl;<br>
+=C2=A0 =C2=A0 env-&gt;gpr[rd] =3D vl;<br>
+=C2=A0 =C2=A0 env-&gt;vfp.vstart =3D 0;<br>
+=C2=A0 =C2=A0 return;<br>
+}<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--0000000000003bf7110592492ecb--


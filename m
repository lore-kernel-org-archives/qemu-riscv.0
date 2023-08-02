Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5190EC001E0
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 14:31:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRCs6-00030q-W6; Wed, 02 Aug 2023 10:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRCru-0002wy-8J; Wed, 02 Aug 2023 10:30:31 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRCrr-00016C-Rm; Wed, 02 Aug 2023 10:30:29 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-79a0b4c6314so629150241.1; 
 Wed, 02 Aug 2023 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690986624; x=1691591424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRhI5QUpRR7bFhwvlogvexgaM3PYKysartor8ZELIs8=;
 b=FnSBT072GMNZ3jOzT0hSc3JkOfopar+u/5xArXBUsV/B+p1ZPOiZRYwyWBLQm4wWqy
 cP866WWauDuJoDK3199nnV3lhielicZodx6gXujBm1A6BZg/t2Qo97qjglgqBhiRVDOS
 1iS2CC6OMyzF5QjEnYR0ZhP2Wbqmpr/SD86jtYKKckZQZ8GLS5+4B6E26bqllfs8rCwL
 J9LGt9q7qaukcS8T1OrXXfZTxiUAymadx6nlI87pgloJpGDkKY+AUdo0Ih8DgWkyKfjs
 7O7kkkgljQTresT73h7oDFzz+v6KAxh5jDmUqbW86L1nFCXjbHo2aJ70h+TD1ElQR3Lx
 V9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690986624; x=1691591424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRhI5QUpRR7bFhwvlogvexgaM3PYKysartor8ZELIs8=;
 b=AZ5f7xRqizmxIG6PV7ePXdNOOr0ftVWU+wSIDjuBT1RHmz/CMfuugBq9AtWcdT4ZtR
 ETi59SPiPERy1+fqpCmh2WKJbT16u4TqaCUBqNC3HX1NB0x43af3y3bpOOKQNodjRpgX
 NLaG1WsVS4BKsZQ4nGTeXPUmt1wKZ+rnK4iZDUVi8wdflrSC6wyzUEqgGSuDGi+lL9sq
 d2OaUWzEDwUdByD3GPSXAVNX6oZ4gZHs1iPbzAsqJShDE0Mlj8GBc/BeMNA8kbM+8yKg
 9IowigRoHXclm5Wnq/op+bWIuplseA1WKoevpSeVaHSPJTyLQ4j/l55xnA5lRKcDH8yv
 uRDg==
X-Gm-Message-State: ABy/qLZirWnr+18/R0+u0dkeXzTYSi6IOtZYON2GeHstf36TCd9WvVl6
 yS8Ye3c9xOh5AagzmdflLAA+OqZ4L/Zq3cUKbgo=
X-Google-Smtp-Source: APBJJlFMnRftXgx8G3XL1sQUBIOU5MZ/c7sV9JvvpH7hKNH0LWP7vna6CuWruB9WgWixhZiWEbfo6e49MR0OUa3f9CY=
X-Received: by 2002:a67:fe0d:0:b0:444:d7f0:d27c with SMTP id
 l13-20020a67fe0d000000b00444d7f0d27cmr1998195vsr.14.1690986623677; Wed, 02
 Aug 2023 07:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230711165917.2629866-1-max.chou@sifive.com>
 <20230711165917.2629866-5-max.chou@sifive.com>
In-Reply-To: <20230711165917.2629866-5-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Aug 2023 10:29:57 -0400
Message-ID: <CAKmqyKMc4AqVFp5aLEbo6rmPwqnvaV+Nvi1mr+Pd9KjFUittSg@mail.gmail.com>
Subject: Re: [PATCH v8 04/15] target/riscv: Add Zvbc ISA extension support
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, dbarboza@ventanamicro.com, 
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>, 
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jul 11, 2023 at 1:00=E2=80=AFPM Max Chou <max.chou@sifive.com> wrot=
e:
>
> From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
>
> This commit adds support for the Zvbc vector-crypto extension, which
> consists of the following instructions:
>
> * vclmulh.[vx,vv]
> * vclmul.[vx,vv]
>
> Translation functions are defined in
> `target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
> `target/riscv/vcrypto_helper.c`.
>
> Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Co-authored-by: Max Chou <max.chou@sifive.com>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> [max.chou@sifive.com: Exposed x-zvbc property]

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                       |  9 ++++
>  target/riscv/cpu_cfg.h                   |  1 +
>  target/riscv/helper.h                    |  6 +++
>  target/riscv/insn32.decode               |  6 +++
>  target/riscv/insn_trans/trans_rvvk.c.inc | 62 ++++++++++++++++++++++++
>  target/riscv/meson.build                 |  3 +-
>  target/riscv/translate.c                 |  1 +
>  target/riscv/vcrypto_helper.c            | 59 ++++++++++++++++++++++
>  8 files changed, 146 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvvk.c.inc
>  create mode 100644 target/riscv/vcrypto_helper.c
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9339c0241d6..d1dc78d483f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(zksed, PRIV_VERSION_1_12_0, ext_zksed),
>      ISA_EXT_DATA_ENTRY(zksh, PRIV_VERSION_1_12_0, ext_zksh),
>      ISA_EXT_DATA_ENTRY(zkt, PRIV_VERSION_1_12_0, ext_zkt),
> +    ISA_EXT_DATA_ENTRY(zvbc, PRIV_VERSION_1_12_0, ext_zvbc),
>      ISA_EXT_DATA_ENTRY(zve32f, PRIV_VERSION_1_10_0, ext_zve32f),
>      ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
>      ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
> @@ -1268,6 +1269,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
>          return;
>      }
>
> +    if (cpu->cfg.ext_zvbc && !cpu->cfg.ext_zve64f) {
> +        error_setg(errp, "Zvbc extension requires V or Zve64{f,d} extens=
ions");
> +        return;
> +    }
> +
>      if (cpu->cfg.ext_zk) {
>          cpu->cfg.ext_zkn =3D true;
>          cpu->cfg.ext_zkr =3D true;
> @@ -1845,6 +1851,9 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
>      DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
>
> +    /* Vector cryptography extensions */
> +    DEFINE_PROP_BOOL("x-zvbc", RISCVCPU, cfg.ext_zvbc, false),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 2bd9510ba3e..d25b36a5128 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -85,6 +85,7 @@ struct RISCVCPUConfig {
>      bool ext_zve32f;
>      bool ext_zve64f;
>      bool ext_zve64d;
> +    bool ext_zvbc;
>      bool ext_zmmul;
>      bool ext_zvfbfmin;
>      bool ext_zvfbfwma;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c95adaf08ac..6776777c4eb 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1182,3 +1182,9 @@ DEF_HELPER_5(vfwcvtbf16_f_f_v, void, ptr, ptr, ptr,=
 env, i32)
>
>  DEF_HELPER_6(vfwmaccbf16_vv, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfwmaccbf16_vf, void, ptr, ptr, i64, ptr, env, i32)
> +
> +/* Vector crypto functions */
> +DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vclmulh_vv, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vclmulh_vx, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index e341fa92139..dd50d5a48c7 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -946,3 +946,9 @@ vfwcvtbf16_f_f_v  010010 . ..... 01101 001 ..... 1010=
111 @r2_vm
>  # *** Zvfbfwma Standard Extension ***
>  vfwmaccbf16_vv    111011 . ..... ..... 001 ..... 1010111 @r_vm
>  vfwmaccbf16_vf    111011 . ..... ..... 101 ..... 1010111 @r_vm
> +
> +# *** Zvbc vector crypto extension ***
> +vclmul_vv   001100 . ..... ..... 010 ..... 1010111 @r_vm
> +vclmul_vx   001100 . ..... ..... 110 ..... 1010111 @r_vm
> +vclmulh_vv  001101 . ..... ..... 010 ..... 1010111 @r_vm
> +vclmulh_vx  001101 . ..... ..... 110 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn=
_trans/trans_rvvk.c.inc
> new file mode 100644
> index 00000000000..552b08a2fd1
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvvk.c.inc
> @@ -0,0 +1,62 @@
> +/*
> + * RISC-V translation routines for the vector crypto extension.
> + *
> + * Copyright (C) 2023 SiFive, Inc.
> + * Written by Codethink Ltd and SiFive.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +/*
> + * Zvbc
> + */
> +
> +#define GEN_VV_MASKED_TRANS(NAME, CHECK)                     \
> +    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)   \
> +    {                                                        \
> +        if (CHECK(s, a)) {                                   \
> +            return opivv_trans(a->rd, a->rs1, a->rs2, a->vm, \
> +                               gen_helper_##NAME, s);        \
> +        }                                                    \
> +        return false;                                        \
> +    }
> +
> +static bool vclmul_vv_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return opivv_check(s, a) &&
> +           s->cfg_ptr->ext_zvbc =3D=3D true &&
> +           s->sew =3D=3D MO_64;
> +}
> +
> +GEN_VV_MASKED_TRANS(vclmul_vv, vclmul_vv_check)
> +GEN_VV_MASKED_TRANS(vclmulh_vv, vclmul_vv_check)
> +
> +#define GEN_VX_MASKED_TRANS(NAME, CHECK)                     \
> +    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)   \
> +    {                                                        \
> +        if (CHECK(s, a)) {                                   \
> +            return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, \
> +                               gen_helper_##NAME, s);        \
> +        }                                                    \
> +        return false;                                        \
> +    }
> +
> +static bool vclmul_vx_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return opivx_check(s, a) &&
> +           s->cfg_ptr->ext_zvbc =3D=3D true &&
> +           s->sew =3D=3D MO_64;
> +}
> +
> +GEN_VX_MASKED_TRANS(vclmul_vx, vclmul_vx_check)
> +GEN_VX_MASKED_TRANS(vclmulh_vx, vclmul_vx_check)
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index c3801ee5e04..660078bda1f 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -21,7 +21,8 @@ riscv_ss.add(files(
>    'translate.c',
>    'm128_helper.c',
>    'crypto_helper.c',
> -  'zce_helper.c'
> +  'zce_helper.c',
> +  'vcrypto_helper.c'
>  ))
>  riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: file=
s('kvm-stub.c'))
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 697df1be9e2..7dbf173adb5 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1094,6 +1094,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
>  #include "insn_trans/trans_rvzfa.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_rvk.c.inc"
> +#include "insn_trans/trans_rvvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
>  #include "insn_trans/trans_svinval.c.inc"
>  #include "insn_trans/trans_rvbf16.c.inc"
> diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.=
c
> new file mode 100644
> index 00000000000..8b7c63d4997
> --- /dev/null
> +++ b/target/riscv/vcrypto_helper.c
> @@ -0,0 +1,59 @@
> +/*
> + * RISC-V Vector Crypto Extension Helpers for QEMU.
> + *
> + * Copyright (C) 2023 SiFive, Inc.
> + * Written by Codethink Ltd and SiFive.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/host-utils.h"
> +#include "qemu/bitops.h"
> +#include "cpu.h"
> +#include "exec/memop.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "internals.h"
> +#include "vector_internals.h"
> +
> +static uint64_t clmul64(uint64_t y, uint64_t x)
> +{
> +    uint64_t result =3D 0;
> +    for (int j =3D 63; j >=3D 0; j--) {
> +        if ((y >> j) & 1) {
> +            result ^=3D (x << j);
> +        }
> +    }
> +    return result;
> +}
> +
> +static uint64_t clmulh64(uint64_t y, uint64_t x)
> +{
> +    uint64_t result =3D 0;
> +    for (int j =3D 63; j >=3D 1; j--) {
> +        if ((y >> j) & 1) {
> +            result ^=3D (x >> (64 - j));
> +        }
> +    }
> +    return result;
> +}
> +
> +RVVCALL(OPIVV2, vclmul_vv, OP_UUU_D, H8, H8, H8, clmul64)
> +GEN_VEXT_VV(vclmul_vv, 8)
> +RVVCALL(OPIVX2, vclmul_vx, OP_UUU_D, H8, H8, clmul64)
> +GEN_VEXT_VX(vclmul_vx, 8)
> +RVVCALL(OPIVV2, vclmulh_vv, OP_UUU_D, H8, H8, H8, clmulh64)
> +GEN_VEXT_VV(vclmulh_vv, 8)
> +RVVCALL(OPIVX2, vclmulh_vx, OP_UUU_D, H8, H8, clmulh64)
> +GEN_VEXT_VX(vclmulh_vx, 8)
> --
> 2.34.1
>


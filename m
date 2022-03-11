Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSUvF-0000jT-1f
	for mharc-qemu-riscv@gnu.org; Thu, 10 Mar 2022 21:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSUvA-0000hE-Fk; Thu, 10 Mar 2022 21:22:24 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=35535
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSUv8-0002K6-9r; Thu, 10 Mar 2022 21:22:24 -0500
Received: by mail-io1-xd2b.google.com with SMTP id l18so1419538ioj.2;
 Thu, 10 Mar 2022 18:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJltIwpFBiaeA5SswOW/KzyY1SbIjtmYXwXrjGgAsNI=;
 b=GSuJeohvnY7yGeTxXp4reW9jRpYbplskLEa/wylY0dKDiNinNC07t2aNwy3xSQZ+G/
 HGV5s0/OtZtgPs5vTuI2xn90YUn7tVQtlEpOHefhtZL1/xVNywvf1b5g7Hq0PLO5Hu3H
 Neq7O5u0H9wUj2+Dw/GKQFB5jJwuWGTHz5WWiy8v9zpuhm/03FGl802Bkp+ayysIiF2h
 ozjoU7m9QUPfoDzM6tng7JtwAk1A8WFj8Br2JGEPY63bT0O87RlQhe3q4hVqgSAGpnGj
 FTmBHGN0bFQZCgXErBAlAy7cqRAz9wJ7Rb+0maJDkqTAOTQ21XkhkpqVpyoZuVd1nvXh
 6Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJltIwpFBiaeA5SswOW/KzyY1SbIjtmYXwXrjGgAsNI=;
 b=p5afju4yhHas6yWl0Zy+QNRjphtohd/f0JRta7a2gxMor8oS/4gA0Ja4W8jz41HDiv
 bMz4/WoYz44DCIRQtBj4vBsQXg1CxjkARrV/czJkf7EBxk33pq0bnVItO8ob7YiPQHGt
 kM2mrtzjcjWHlrhnny5YHB5I/MMQKHGPYNb09xUhdlcS/G5GYIIs24yLKUIk9aV4bCl9
 hosDTJbauPr+lScsq5LmE4fFPn2WcEHh5yrMTPL2GskDih2E6BbqX1g/Ruq04QX6+3lE
 qMoBr4rSKDhQm3598bzHX8PkAvUj8LS1ZTb7Bdl9Gyr1I2eqvtk0Vxx1c8NOUEDhLP53
 5eIg==
X-Gm-Message-State: AOAM530kCqlRTVhDQKiZP+t7lyowQYpUbgnyPYlrDcWotbPF+av7Zpb3
 GK/4xcYwT4MlGAY4a4irI7ymL4G9/vHxC6FUMGY=
X-Google-Smtp-Source: ABdhPJwSYB2bLjlTrMiFjfi2oCfGZBsEoVagw+XMqgAm289I2TZy/iXuJ+0HIb6ooTSzsy8DGU9eZq4WO9znBB7fcTA=
X-Received: by 2002:a6b:d60a:0:b0:63a:be64:c652 with SMTP id
 w10-20020a6bd60a000000b0063abe64c652mr6319301ioa.27.1646965337978; Thu, 10
 Mar 2022 18:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20220301115828.355-1-liweiwei@iscas.ac.cn>
 <20220301115828.355-7-liweiwei@iscas.ac.cn>
In-Reply-To: <20220301115828.355-7-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Mar 2022 12:21:52 +1000
Message-ID: <CAKmqyKOnR2vCtwhk2ZYBPkroxXHhV2X4DOEJFuozez_qQtr=Dw@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] target/riscv: rvk: add support for zknd/zkne
 extension in RV32
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 11 Mar 2022 02:22:26 -0000

On Tue, Mar 1, 2022 at 10:08 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - add aes32esmi, aes32esi, aes32dsmi and aes32dsi instructions
>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/crypto_helper.c            | 105 ++++++++++++++++++++++++
>  target/riscv/helper.h                   |   6 ++
>  target/riscv/insn32.decode              |  11 +++
>  target/riscv/insn_trans/trans_rvk.c.inc |  67 +++++++++++++++
>  target/riscv/meson.build                |   3 +-
>  target/riscv/translate.c                |   1 +
>  6 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/crypto_helper.c
>  create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc
>
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> new file mode 100644
> index 0000000000..220d51c742
> --- /dev/null
> +++ b/target/riscv/crypto_helper.c
> @@ -0,0 +1,105 @@
> +/*
> + * RISC-V Crypto Emulation Helpers for QEMU.
> + *
> + * Copyright (c) 2021 Ruibo Lu, luruibo2000@163.com
> + * Copyright (c) 2021 Zewen Ye, lustrew@foxmail.com
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "crypto/aes.h"
> +#include "crypto/sm4.h"
> +
> +#define AES_XTIME(a) \
> +    ((a << 1) ^ ((a & 0x80) ? 0x1b : 0))
> +
> +#define AES_GFMUL(a, b) (( \
> +    (((b) & 0x1) ? (a) : 0) ^ \
> +    (((b) & 0x2) ? AES_XTIME(a) : 0) ^ \
> +    (((b) & 0x4) ? AES_XTIME(AES_XTIME(a)) : 0) ^ \
> +    (((b) & 0x8) ? AES_XTIME(AES_XTIME(AES_XTIME(a))) : 0)) & 0xFF)
> +
> +static inline uint32_t aes_mixcolumn_byte(uint8_t x, bool fwd)
> +{
> +    uint32_t u;
> +
> +    if (fwd) {
> +        u = (AES_GFMUL(x, 3) << 24) | (x << 16) | (x << 8) |
> +            (AES_GFMUL(x, 2) << 0);
> +    } else {
> +        u = (AES_GFMUL(x, 0xb) << 24) | (AES_GFMUL(x, 0xd) << 16) |
> +            (AES_GFMUL(x, 0x9) << 8) | (AES_GFMUL(x, 0xe) << 0);
> +    }
> +    return u;
> +}
> +
> +#define sext32_xlen(x) (target_ulong)(int32_t)(x)
> +
> +static inline target_ulong aes32_operation(target_ulong shamt,
> +                                           target_ulong rs1, target_ulong rs2,
> +                                           bool enc, bool mix)
> +{
> +    uint8_t si = rs2 >> shamt;
> +    uint8_t so;
> +    uint32_t mixed;
> +    target_ulong res;
> +
> +    if (enc) {
> +        so = AES_sbox[si];
> +        if (mix) {
> +            mixed = aes_mixcolumn_byte(so, true);
> +        } else {
> +            mixed = so;
> +        }
> +    } else {
> +        so = AES_isbox[si];
> +        if (mix) {
> +            mixed = aes_mixcolumn_byte(so, false);
> +        } else {
> +            mixed = so;
> +        }
> +    }
> +    mixed = rol32(mixed, shamt);
> +    res = rs1 ^ mixed;
> +
> +    return sext32_xlen(res);
> +}
> +
> +target_ulong HELPER(aes32esmi)(target_ulong rs1, target_ulong rs2,
> +                               target_ulong shamt)
> +{
> +    return aes32_operation(shamt, rs1, rs2, true, true);
> +}
> +
> +target_ulong HELPER(aes32esi)(target_ulong rs1, target_ulong rs2,
> +                              target_ulong shamt)
> +{
> +    return aes32_operation(shamt, rs1, rs2, true, false);
> +}
> +
> +target_ulong HELPER(aes32dsmi)(target_ulong rs1, target_ulong rs2,
> +                               target_ulong shamt)
> +{
> +    return aes32_operation(shamt, rs1, rs2, false, true);
> +}
> +
> +target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
> +                              target_ulong shamt)
> +{
> +    return aes32_operation(shamt, rs1, rs2, false, false);
> +}
> +#undef sext32_xlen
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index a1d28b257f..d31bfadb3e 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1115,3 +1115,9 @@ DEF_HELPER_5(divu_i128, tl, env, tl, tl, tl, tl)
>  DEF_HELPER_5(divs_i128, tl, env, tl, tl, tl, tl)
>  DEF_HELPER_5(remu_i128, tl, env, tl, tl, tl, tl)
>  DEF_HELPER_5(rems_i128, tl, env, tl, tl, tl, tl)
> +
> +/* Crypto functions */
> +DEF_HELPER_FLAGS_3(aes32esmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
> +DEF_HELPER_FLAGS_3(aes32esi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
> +DEF_HELPER_FLAGS_3(aes32dsmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
> +DEF_HELPER_FLAGS_3(aes32dsi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 75ffac9c81..0f2e661583 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -35,6 +35,7 @@
>  %imm_b    31:s1 7:1 25:6 8:4     !function=ex_shift_1
>  %imm_j    31:s1 12:8 20:1 21:10  !function=ex_shift_1
>  %imm_u    12:s20                 !function=ex_shift_12
> +%imm_bs   30:2                   !function=ex_shift_3
>
>  # Argument sets:
>  &empty
> @@ -52,6 +53,7 @@
>  &rmr       vm rd rs2
>  &r2nfvm    vm rd rs1 nf
>  &rnfvm     vm rd rs1 rs2 nf
> +&k_aes     shamt rs2 rs1 rd
>
>  # Formats 32:
>  @r       .......   ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
> @@ -89,6 +91,8 @@
>  @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
>  @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
>
> +@k_aes   .. ..... ..... .....  ... ..... ....... &k_aes  shamt=%imm_bs   %rs2 %rs1 %rd
> +
>  # Formats 64:
>  @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
>
> @@ -834,3 +838,10 @@ sfence_w_inval    0001100 00000 00000 000 00000 1110011
>  sfence_inval_ir   0001100 00001 00000 000 00000 1110011
>  hinval_vvma       0010011 ..... ..... 000 00000 1110011 @hfence_vvma
>  hinval_gvma       0110011 ..... ..... 000 00000 1110011 @hfence_gvma
> +
> +# *** RV32 Zknd Standard Extension ***
> +aes32dsmi   .. 10111 ..... ..... 000 ..... 0110011 @k_aes
> +aes32dsi    .. 10101 ..... ..... 000 ..... 0110011 @k_aes
> +# *** RV32 Zkne Standard Extension ***
> +aes32esmi   .. 10011 ..... ..... 000 ..... 0110011 @k_aes
> +aes32esi    .. 10001 ..... ..... 000 ..... 0110011 @k_aes
> diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
> new file mode 100644
> index 0000000000..74f9f826b9
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvk.c.inc
> @@ -0,0 +1,67 @@
> +/*
> + * RISC-V translation routines for the Zk[nd,ne,nh,sed,sh] Standard Extension.
> + *
> + * Copyright (c) 2021 Ruibo Lu, luruibo2000@163.com
> + * Copyright (c) 2021 Zewen Ye, lustrew@foxmail.com
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZKND(ctx) do {                  \
> +    if (!ctx->cfg_ptr->ext_zknd) {              \
> +        return false;                           \
> +    }                                           \
> +} while (0)
> +
> +#define REQUIRE_ZKNE(ctx) do {                  \
> +    if (!ctx->cfg_ptr->ext_zkne) {              \
> +        return false;                           \
> +    }                                           \
> +} while (0)
> +
> +static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
> +                          void (*func)(TCGv, TCGv, TCGv, TCGv))
> +{
> +    TCGv shamt = tcg_constant_tl(a->shamt);
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    func(dest, src1, src2, shamt);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
> +{
> +    REQUIRE_ZKNE(ctx);
> +    return gen_aes32_sm4(ctx, a, gen_helper_aes32esmi);
> +}
> +
> +static bool trans_aes32esi(DisasContext *ctx, arg_aes32esi *a)
> +{
> +    REQUIRE_ZKNE(ctx);
> +    return gen_aes32_sm4(ctx, a, gen_helper_aes32esi);
> +}
> +
> +static bool trans_aes32dsmi(DisasContext *ctx, arg_aes32dsmi *a)
> +{
> +    REQUIRE_ZKND(ctx);
> +    return gen_aes32_sm4(ctx, a, gen_helper_aes32dsmi);
> +}
> +
> +static bool trans_aes32dsi(DisasContext *ctx, arg_aes32dsi *a)
> +{
> +    REQUIRE_ZKND(ctx);
> +    return gen_aes32_sm4(ctx, a, gen_helper_aes32dsi);
> +}
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 91f0ac32ff..ef320c9e32 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -19,7 +19,8 @@ riscv_ss.add(files(
>    'vector_helper.c',
>    'bitmanip_helper.c',
>    'translate.c',
> -  'm128_helper.c'
> +  'm128_helper.c',
> +  'crypto_helper.c'
>  ))
>  riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 9afb8a01e7..8be63ae972 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1007,6 +1007,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
> +#include "insn_trans/trans_rvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
>  #include "insn_trans/trans_svinval.c.inc"
>  #include "insn_trans/trans_xventanacondops.c.inc"
> --
> 2.17.1
>
>


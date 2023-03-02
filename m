Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXXZg-0001S2-O9
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 20:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXZf-0001MM-4x
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 20:17:35 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXZc-0000kL-Ti
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 20:17:34 -0500
Received: by mail-pj1-x102e.google.com with SMTP id y2so15249292pjg.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 17:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677719851;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=FDAgXfxbB7h5X48GgeInyy3f0Gph3XGCCAgt58/gBhA=;
 b=FVlzQlZISwDBU9Sgjic7XHAzGzH7JBFprhbbL7neZNAaN0ffZzoehcwzebToZJuEv4
 VkgcqO0FiVIazzipuYeyTj+JcU3H3JVLi5TEkhelKVb+chMRArrHU3PUJwuqcQBjxhjc
 e0etTn9E4VqpVhTmLzee3dtpZAlCQUTAm8l+Nza8g4FQN72DEMVei3xH5TGJyhjU4hlW
 q13Pkl0OsKxMji5BE9AD72WVjkPqiSJeMQRnSrbwkzmP5FGsnOsdqZCea8aQtXIs9g+T
 5Lo0hBtVLmLpY40DFZ6Rf+0lCZ4737IiTQFkXm4QNLOXMunDKWmzPMtY9WgFMgJhe9DE
 SnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677719851;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDAgXfxbB7h5X48GgeInyy3f0Gph3XGCCAgt58/gBhA=;
 b=ISKrQdA6nuwiv9k12ZZD/cR8I5pVr45s8EWphI2L7a/wUHFniwXPnzxqYSAfkerKQf
 lihgLH6QOLulU8xHVnakVJEvSLmfEI/WPuUYlh1Trhu48K8DlfUdf0Pot3beWkUwnVdl
 w/7G2bEvvZEDsJHTeK6S/ew5mTvVs/X6YLJdR+uc3/RO0ROklhE+DhBbDdZZkDbnRWR5
 YQInXzIW+E7OBJVnYvseXurpZS2BJ81qYhwE75gugaym5N/cds7s25Ln7GSeX7NAZdEZ
 Q3pYN8QLsjECOF3fRkbqB1whWG+WEY9Iu99u9UIrC5VVGdmzkGgk0AwQoDDgtN7Tn0QM
 v5QA==
X-Gm-Message-State: AO0yUKXPVUR7lwZu1vMS7Kzx04aeEHSUGd33WLUsM7p+KPVVdzuZAHOV
 UuvpSBKKujr8CuYig14XWJAcuMOnl8BbF5df
X-Google-Smtp-Source: AK7set/WJjvLIXxF2wu/9nPjzWZ9y2qr0WNSo4WNQfKkGNTdlRqgLZU+dxBv4BdiniwHib+Kr84Hbg==
X-Received: by 2002:a17:902:a710:b0:19e:6afd:86eb with SMTP id
 w16-20020a170902a71000b0019e6afd86ebmr630558plq.56.1677719850834; 
 Wed, 01 Mar 2023 17:17:30 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b0019cec7d88c3sm9084151plo.236.2023.03.01.17.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 17:17:30 -0800 (PST)
Date: Wed, 01 Mar 2023 17:17:30 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 17:14:46 PST (-0800)
Subject: Re: [PATCH] target/riscv: Add support for Zicond extension
In-Reply-To: <20230221091009.36545-1-liweiwei@iscas.ac.cn>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 liweiwei@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liweiwei@iscas.ac.cn
Message-ID: <mhng-bef021e9-ca1e-497b-81cc-b0d9bd810a1b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 01:17:35 -0000

On Tue, 21 Feb 2023 01:10:09 PST (-0800), liweiwei@iscas.ac.cn wrote:
> The spec can be found in https://github.com/riscv/riscv-zicond.
> Two instructions are added:
>  - czero.eqz: Moves zero to a register rd, if the condition rs2 is
>    equal to zero, otherwise moves rs1 to rd.
>  - czero.nez: Moves zero to a register rd, if the condition rs2 is
>    nonzero, otherwise moves rs1 to rd.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c                           |  2 +
>  target/riscv/cpu.h                           |  1 +
>  target/riscv/insn32.decode                   |  4 ++
>  target/riscv/insn_trans/trans_rvzicond.c.inc | 49 ++++++++++++++++++++
>  target/riscv/translate.c                     |  1 +
>  5 files changed, 57 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0dd2f0c753..80b92930ae 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -74,6 +74,7 @@ struct isa_ext_data {
>  static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
>      ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
> +    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
>      ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
> @@ -1143,6 +1144,7 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
>
>      /* These are experimental so mark with 'x-' */
> +    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7128438d8e..81b7c92e7a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -447,6 +447,7 @@ struct RISCVCPUConfig {
>      bool ext_zkt;
>      bool ext_ifencei;
>      bool ext_icsr;
> +    bool ext_zicond;
>      bool ext_zihintpause;
>      bool ext_smstateen;
>      bool ext_sstc;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index b7e7613ea2..fb537e922e 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -890,3 +890,7 @@ sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
>  # *** RV32 Zksed Standard Extension ***
>  sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
>  sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
> +
> +# *** RV32 Zicond Standard Extension ***
> +czero_eqz   0000111  ..... ..... 101 ..... 0110011 @r
> +czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/insn_trans/trans_rvzicond.c.inc
> new file mode 100644
> index 0000000000..645260164e
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
> @@ -0,0 +1,49 @@
> +/*
> + * RISC-V translation routines for the Zicond Standard Extension.
> + *
> + * Copyright (c) 2020-2023 PLCT Lab
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
> +#define REQUIRE_ZICOND(ctx) do {          \
> +    if (!ctx->cfg_ptr->ext_zicond) {      \
> +        return false;                     \
> +    }                                     \
> +} while (0)
> +
> +static bool trans_czero_eqz(DisasContext *ctx, arg_czero_eqz *a)
> +{
> +    REQUIRE_ZICOND(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, ctx->zero, ctx->zero, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_czero_nez(DisasContext *ctx, arg_czero_nez *a)
> +{
> +    REQUIRE_ZICOND(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, ctx->zero, ctx->zero, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 772f9d7973..6e65c6afca 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1103,6 +1103,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvh.c.inc"
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
> +#include "insn_trans/trans_rvzicond.c.inc"
>  #include "insn_trans/trans_rvzawrs.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_rvk.c.inc"

Thanks, this is queued up in riscv-to-apply.next .


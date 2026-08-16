Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E637C5DF6D
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 16:32:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvdmn-0003aa-Hl; Sun, 16 Aug 2026 12:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wvdmm-0003aK-Aw
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 12:32:36 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wvdmk-0005zj-DR
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 12:32:35 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-38ea87caafeso1970280a91.3
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786897953; x=1787502753; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jMFvOe0vkNMMUB827U3MP9hJbYJr+1uRJkuSiYxxd3o=;
 b=JEO9r+WLPjATBBcSMJI27TaKGr9SVkelinOpyim2xq8ZpMy9BoqMU60DCzdKeTACTA
 jv5R7ify6z+mAe7wPFp5NNolBJctjGjLkopM9p5TqqWvE9cxkqw8S+0o/EVDTAi/JFYo
 DJqDGt3iIJQQ/by3WOKCJteKcaUmOkVcWfAu4/Po/mmoxK0Xas3Y547sbHeD7c+ncJEo
 kRkjVfJdBfiZ9QFF9862S+qTj6AKnTiR4YKi0ZpC2+UkxrYTVoD4QkJXk4AtfrHBdhJX
 AtVKgz8atADpKm9R3Cri8MLekcEJQR+UZ+RZ+lI6ltcfC2fxmrp2p6yBLSJv1kt/i/8O
 OlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786897953; x=1787502753;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jMFvOe0vkNMMUB827U3MP9hJbYJr+1uRJkuSiYxxd3o=;
 b=ZKs7du4/yEGJyhERaU3kZJn3aH67lHzt9kKYs/XRoFmtYs4b4lGxkxvFx+5UpQdYUm
 eqTAVYeJArNuYMoiZmFHiWlN9mYaevAt02hbA3NG8SsPEXJRRBALUJ523TAHruIKEpqZ
 PXpJE3bOjulnuTnjy0M3zVv2k6OZBDtBQAOe6SVxEySVUcMD+PxL5TyHKggXO4wS92JT
 MuWDCEO3bfImd9lKG74sagXZFdwCx5QlHELHum4ufbMOcgmmXDz39OxwsVLAlIII7ySL
 LDxV8oiuYIWd9uQcrBO9GREg9IQ84P2KpcUeXhrNQ2WoIXMywYvh0gkW9dAMzzvef10l
 TvvA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqOW7E9V+7Pzk6ZfSwWoIfxgd2TgK/xTb/mF+e7AB+zDygPZRvl4sEilfT19wzMjN69XwZgMSFnNam/@nongnu.org
X-Gm-Message-State: AOJu0YzMtJxXtOxj8n5zvigtKRoM6F3AZJ2YjkjpWzEvm6Lhkun6AXA5
 4ACNIu8jSEmn3YUMDZ0lpDlvChkkWPrmh+AjhaPJHEghvml5wFDzY/qw3r+NdvYKdW+Qna04xUe
 jOd9xhtI=
X-Gm-Gg: AR+sD11ghlbcGlQigHzg4/QPX2gmAFxN+XRYquTAaBWyZqc+ZeVGA3pByg/3rcbITD4
 5zYYJ1mr19b7Xj4HLhJlj5QjHMuK3TRG3t2ns6qw+18al+cfvX1KIJknCFIEnEWeirHRle7sxN8
 VFncaJGBuvjWM2/WIW9B5R+mVc9LYPr5mLgWrQn02hmu2VFSx0/JxEoCM+p4iSVQ38rVNA+KY+G
 kcP2wvVa/pDxRuRooA9kEv0d5xDfc/GVbKBfVK0fvTpXzLVxy/QHlUD2UfxmTIDSIy101Nub4Oo
 Kzz/bp0BRCYFL96UaHAKmhL5CkMRezTSCemoWOKTAPFLSyW5TaxXXmGbx3gREvofFulnpvUXM0R
 BsPlWy5IrL7LaybHLsarPQwbPmuMaupN/fWZLU3yn1ijhn6I1vwip56be+uA0ESsqmbb4WMYTsf
 wLVrc5oaqOwMDGPUv7SUpe/EzqcrcJ33eWDCktmPTjnAATWgny6tFrmF3IMTKLs5r2y11hNFmDw
 qo8QbfZAW/hz7fYrcpi9XEv58Jx9RX8Hcf6ZRSAN/3yDoc=
X-Received: by 2002:a17:90b:3c02:b0:380:f389:447b with SMTP id
 98e67ed59e1d1-3933b8938f9mr21172274a91.11.1786897952611; 
 Sun, 16 Aug 2026 09:32:32 -0700 (PDT)
Received: from sifive.com ([136.226.240.165]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39531e8418bsm1952661a91.7.2026.08.16.09.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 09:32:32 -0700 (PDT)
Date: Mon, 17 Aug 2026 00:32:28 +0800
From: Max Chou <max.chou@sifive.com>
To: Molly Chen <xiaoou@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 03/18] target/riscv: Add packed SIMD arithmetic
 instructions
Message-ID: <aoHkpCy_H-vhfcFY@sifive.com>
References: <cover.1784280142.git.xiaoou@iscas.ac.cn>
 <3935baa46fdc44f7b68e2b740c7bedf8b7c0b974.1784280142.git.xiaoou@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3935baa46fdc44f7b68e2b740c7bedf8b7c0b974.1784280142.git.xiaoou@iscas.ac.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2026-07-17 10:06, Molly Chen wrote:
> Signed-off-by: Molly Chen <xiaoou@iscas.ac.cn>
> ---
>  target/riscv/helper.h                       |  41 ++
>  target/riscv/insn32.decode                  |  63 +++
>  target/riscv/tcg/insn_trans/trans_rvp.c.inc | 547 ++++++++++++++++++++
>  target/riscv/tcg/psimd_helper.c             | 114 ++++
>  target/riscv/tcg/translate.c                |   4 +
>  5 files changed, 769 insertions(+)
>  create mode 100644 target/riscv/tcg/insn_trans/trans_rvp.c.inc
...
> diff --git a/target/riscv/tcg/insn_trans/trans_rvp.c.inc b/target/riscv/tcg/insn_trans/trans_rvp.c.inc
> new file mode 100644
> index 00000000000..056ccfb486e
> --- /dev/null
> +++ b/target/riscv/tcg/insn_trans/trans_rvp.c.inc
...
> +#if defined(TARGET_RISCV32)
> +#define GEN_SIMD_TRANS_REG_PAIR_LANE_SCALAR_OP(INSN, HELPER, VXSAT)     \
> +static bool trans_##INSN(DisasContext *ctx, arg_##INSN * a)    \
> +{                                                              \
> +    REQUIRE_32BIT(ctx);                                        \
> +    REQUIRE_RVP(ctx);                                          \
> +    if (VXSAT && !prepare_rvp_vxsat(ctx)) {                    \
> +        return false;                                          \
> +    }                                                          \
> +    TCGv src1_0 = get_gpr(ctx, (a->rs1) * 2, EXT_NONE);        \
> +    TCGv dest_0 = dest_gpr(ctx, (a->rd) * 2);                    \
> +    TCGv src1_1 = get_gpr(ctx, (a->rs1) * 2 + 1, EXT_NONE);        \
> +    TCGv dest_1 = dest_gpr(ctx, (a->rd) * 2 + 1);                  \
> +    TCGv src2   = get_gpr(ctx, a->rs2, EXT_NONE);              \
> +    gen_helper_##HELPER(dest_0, tcg_env, src1_0, src2);        \
> +    gen_helper_##HELPER(dest_1, tcg_env, src1_1, src2);        \
> +    gen_set_gpr(ctx, (a->rd) * 2, dest_0);                     \
> +    gen_set_gpr(ctx, (a->rd) * 2 + 1, dest_1);                 \
> +    return true;                                              \
> +}

There is a read-after-write hazard on src2 when the destination pair
overlaps rs2.

get_gpr(*, EXT_NONE) returns cpu_gpr[n] itself (EXT_NONE takes no
snapshot). And dest_gpr(ctx, rd) also returns cpu_gpr[rd] itself.
So if rd*2 == a->rs2 (or rd*2 + 1 == a->rs2), dest_0/dest_1 and src2
are the same TCG global, and the first gen_helper call op writes it
before the second call op reads it as its source.

I suggest that we could fix it by snapshot rs2:

       TCGv dest_1 = dest_gpr(ctx, (a->rd) * 2 + 1);              \
  -    TCGv src2   = get_gpr(ctx, a->rs2, EXT_NONE);              \
  +    TCGv src2 = tcg_temp_new();                                \
  +    tcg_gen_mov_tl(src2, get_gpr(ctx, a->rs2, EXT_NONE));      \
       gen_helper_##HELPER(dest_0, tcg_env, src1_0, src2);        \

> +#if defined(TARGET_RISCV32)
> +#define GEN_SIMD_TRANS_PN_OP(NAME, SRC2, VXSAT)            \
> +static bool trans_##NAME(DisasContext *ctx, arg_##NAME * a) \
> +{                                                           \
> +    REQUIRE_32BIT(ctx);                                     \
> +    REQUIRE_RVP(ctx);                                       \
> +    if (VXSAT && !prepare_rvp_vxsat(ctx)) {                 \
> +        return false;                                       \
> +    }                                                       \
> +    TCGv_i64 s1 = tcg_temp_new_i64();                       \
> +    if (a->rs1 == 0) {                                      \
> +        tcg_gen_mov_i64(s1, 0);                             \

I think that we should use tcg_gen_movi_i64 here.

rnax

> +    } else {                                                \
> +        get_pair_regs(ctx, s1, a->rs1 * 2);                 \
> +    }                                                       \
> +    TCGv src2 = SRC2;                                       \
> +    TCGv dest = dest_gpr(ctx, a->rd);                       \
> +    gen_helper_##NAME(dest, tcg_env, s1, src2);             \
> +    gen_set_gpr(ctx, a->rd, dest);                          \
> +    return true;                                            \
> +}


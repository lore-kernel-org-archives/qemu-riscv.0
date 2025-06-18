Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B99DC7115A
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 14:23:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uRth1-0004DN-Ih; Wed, 18 Jun 2025 10:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uRtgt-0004Bi-JX
 for qemu-riscv@nongnu.org; Wed, 18 Jun 2025 10:23:05 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uRtgl-0002EM-N9
 for qemu-riscv@nongnu.org; Wed, 18 Jun 2025 10:23:02 -0400
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-23633a6ac50so102113225ad.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Jun 2025 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750256572; x=1750861372; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DknIqKYf/d5KQMcqshNZkkgpnnTskoUbbgAQq1PkHyA=;
 b=EngBmpPzPBkeiTH3Y6deuMdzIBhNKfd/3Tqh+S2mSnLaUdUqklvsIvx0UHRdXlE32+
 bX/huEUAL/CEkKPY6j1XE6y/5AsPYKDHovuKxYYm25sIGh1qklgLLh1+HlFKwwNZlFVp
 FXZAQtA/rZW4cqS4woplo7NUCezEB+jCn636R2FFNfNZz21zudnzQySECxRpogNnAwV2
 DsTPK4ja9hO35igzhp2ihWjLfWl0oRs41N0ISlmQuIpeyNal7Sq3wz6UhKgbGPXo3qi+
 4X9dpG6SH1hFRwdCj5Eee201kLNBg3cHCvxfYHcLW0j36SnRRutHbqdjp6joGf70oK1V
 ZW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750256572; x=1750861372;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DknIqKYf/d5KQMcqshNZkkgpnnTskoUbbgAQq1PkHyA=;
 b=cPsmK5WggVX4owIkao/oU3TPMxXqvDTqgYE9t3Ihd5DS49yNoT/ioTApxNhTO/leq3
 buWEHFGJFG0SDKk0qdGn0W7HxLiusrTkrtBFGzPJxNsSXT6Hwx1erG8mzCIRXpQzzAK1
 4wyVWDMNkBtZfOQtdO0ukRHQuxQz5hxwpPyHYapKF31xCUDc2WuLRZI9g+6Lf4dKtOFj
 624kqZp6htQjhHyxQeaj0UA8X5fqFB04E8s7sYTuGEcKqOzQ+4huzj6cTD0jniYkZQlR
 tlN4T9QJGxX71VSH53rNUkNjWucnRjIycRCbZ5u/vDhqRGRZ28eV7c8ClbXZV/uL4MFW
 fhSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiEct4Zn/BBGG0RApn3s78R7XCu1gT1bSedQr9JJHdF6f67ANK2UW6vF9LeiavcrIY7yvht8S55KtR@nongnu.org
X-Gm-Message-State: AOJu0YzeFZQyAZmb84fz2vVhQMFCHu2vbN3jsuOb7rDXE1pTHbjYM65/
 xB/jgfAOxc71tHh2rBse77S9OORQQNEAssUJExIolJsRTWvS/pUDlyQrDdQeTVOCKQ4=
X-Gm-Gg: ASbGncs8CBVGbabZTr3Eugfi8slQez5P/1hSYUzMMj4WDjCvTaAaeE/tvQrnEQQqInp
 S+oxFvDnQiWtiaS2BThnM+gWLrHc/j4Xkr135jYanZj9jwZ64Sgzi0lYJIrQ0ss/+Zx+kf5kxup
 5k14PSGNjuFrA6x746Rz5n70iHCoK0U5IJCXG+QAneHHWuOhSHlNpz2wCWpKzgMlos8AYNo9XmQ
 ADAh0vItTI+5ySu/AKV5o9Va2/jOwA9sROdYB99rIzODj40Kv/EjU79gZJEbEFcUcUtVk+e4ckQ
 qoDPtLF4b8PZEJhsf9bP7HKR/QhX3bvwhJSE4NFDBF+Njp+btCuWxh/UyC2ZrzRBBTsIaGLiQDd
 e
X-Google-Smtp-Source: AGHT+IEzC2kIAxqDS7lIuIeh2YAmV542Dg0U7NBq4LKBnDkrx0TT4o3F3ZGasoGgHo/oS1lh/zEmPQ==
X-Received: by 2002:a17:902:b681:b0:236:748f:541f with SMTP id
 d9443c01a7336-236748f5ec4mr173147985ad.33.1750256572516; 
 Wed, 18 Jun 2025 07:22:52 -0700 (PDT)
Received: from [192.168.68.110] ([191.255.35.152])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea8ff7sm100719695ad.171.2025.06.18.07.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 07:22:51 -0700 (PDT)
Message-ID: <9812c3c3-c9e4-4b29-968b-9da99891489a@ventanamicro.com>
Date: Wed, 18 Jun 2025 11:22:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Add a property to set vill bit on reserved
 usage of vsetvli instruction
To: Vasilis Liaskovitis <vliaskovitis@suse.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: ajones@ventanamicro.com, alistair.francis@wdc.com, philmd@linaro.org
References: <20250618072500.8469-1-vliaskovitis@suse.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250618072500.8469-1-vliaskovitis@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x643.google.com
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

Hi,

Thanks for putting this into a patch. A comment below:

On 6/18/25 4:25 AM, Vasilis Liaskovitis wrote:
> Usage of vsetvli instruction is reserved if VLMAX is changed when vsetvli rs1
> and rd arguments are x0.
> 
> In this case, if the new property is true, only the vill bit will be set.
> 
> See https://github.com/riscv/riscv-isa-manual/blob/main/src/v-st-ext.adoc#avl-encoding
> According to the spec, the above use cases are reserved, and
> "Implementations may set vill in either case."
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2422
> Signed-off-by: Vasilis Liaskovitis <vliaskovitis@suse.com>
> ---
>   target/riscv/cpu.c                      |  1 +
>   target/riscv/cpu_cfg_fields.h.inc       |  1 +
>   target/riscv/helper.h                   |  2 +-
>   target/riscv/insn_trans/trans_rvv.c.inc |  4 ++--
>   target/riscv/vector_helper.c            | 22 ++++++++++++----------
>   5 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 629ac37501..1c29ed3b2b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2595,6 +2595,7 @@ static const Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>       DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
>       DEFINE_PROP_BOOL("rvv_vl_half_avl", RISCVCPU, cfg.rvv_vl_half_avl, false),
> +    DEFINE_PROP_BOOL("rvv_vsetvl_x0_vill", RISCVCPU, cfg.rvv_vsetvl_x0_vill, false),
>   
>       /*
>        * write_misa() is marked as experimental for now so mark
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index 59f134a419..9c78a797cf 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -114,6 +114,7 @@ BOOL_FIELD(ext_supm)
>   BOOL_FIELD(rvv_ta_all_1s)
>   BOOL_FIELD(rvv_ma_all_1s)
>   BOOL_FIELD(rvv_vl_half_avl)
> +BOOL_FIELD(rvv_vsetvl_x0_vill)
>   /* Named features  */
>   BOOL_FIELD(ext_svade)
>   BOOL_FIELD(ext_zic64b)
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 85d73e492d..f712b1c368 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -159,7 +159,7 @@ DEF_HELPER_FLAGS_3(hyp_hsv_d, TCG_CALL_NO_WG, void, env, tl, tl)
>   #endif
>   
>   /* Vector functions */
> -DEF_HELPER_3(vsetvl, tl, env, tl, tl)
> +DEF_HELPER_4(vsetvl, tl, env, tl, tl, tl)
>   DEF_HELPER_5(vle8_v, void, ptr, ptr, tl, env, i32)
>   DEF_HELPER_5(vle16_v, void, ptr, ptr, tl, env, i32)
>   DEF_HELPER_5(vle32_v, void, ptr, ptr, tl, env, i32)
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 2b6077ac06..87071c5d62 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -202,7 +202,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>           s1 = get_gpr(s, rs1, EXT_ZERO);
>       }
>   
> -    gen_helper_vsetvl(dst, tcg_env, s1, s2);
> +    gen_helper_vsetvl(dst, tcg_env, s1, s2, tcg_constant_tl((int) (rd == 0 && rs1 == 0)));
>       gen_set_gpr(s, rd, dst);
>       finalize_rvv_inst(s);
>   
> @@ -222,7 +222,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
>   
>       dst = dest_gpr(s, rd);
>   
> -    gen_helper_vsetvl(dst, tcg_env, s1, s2);
> +    gen_helper_vsetvl(dst, tcg_env, s1, s2, tcg_constant_tl(0));
>       gen_set_gpr(s, rd, dst);
>       finalize_rvv_inst(s);
>       gen_update_pc(s, s->cur_insn_len);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 5dc1c10012..2545d73cc1 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -35,7 +35,7 @@
>   #include <math.h>
>   
>   target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
> -                            target_ulong s2)
> +                            target_ulong s2, target_ulong x0)
>   {
>       int vlmax, vl;
>       RISCVCPU *cpu = env_archcpu(env);
> @@ -64,15 +64,6 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>           }
>       }
>   
> -    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
> -        /* only set vill bit. */
> -        env->vill = 1;
> -        env->vtype = 0;
> -        env->vl = 0;
> -        env->vstart = 0;
> -        return 0;
> -    }
> -
>       /* lmul encoded as in DisasContext::lmul */
>       lmul = sextract32(FIELD_EX64(s2, VTYPE, VLMUL), 0, 3);
>       vlmax = vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
> @@ -83,6 +74,17 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>       } else {
>           vl = vlmax;
>       }
> +
> +    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0) ||
> +        (cpu->cfg.rvv_vsetvl_x0_vill && x0 && (env->vl != vl))) {

In this particular case I don't mind replicating code. The first existing check can be
left untouched, exiting early before spending time calculating vlmax and vl.

We can then add the new check that depends on vl here, even if we end up copying those
few "env->something =" lines again. If you really want to avoid code duplication I
wouldn't oppose adding a 'vill' label and using 'goto' as an alternative of duplicating
those 6 lines.


Patch LGTM otherwise. Thanks,


Daniel

> +        /* only set vill bit. */
> +        env->vill = 1;
> +        env->vtype = 0;
> +        env->vl = 0;
> +        env->vstart = 0;
> +        return 0;
> +    }
> +
>       env->vl = vl;
>       env->vtype = s2;
>       env->vstart = 0;



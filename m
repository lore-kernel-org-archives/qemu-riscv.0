Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33A9C369AB
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 14:04:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7xBi-0005tT-WC; Thu, 24 Apr 2025 10:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u7xBe-0005t0-Ny
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 10:04:22 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u7xBc-0007nt-8h
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 10:04:22 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2241053582dso16082615ad.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Apr 2025 07:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1745503456; x=1746108256; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AGYEntheI4w8ryaXd2hO9uZl0PRDd5uRKEGjqfQ6Qd4=;
 b=iulREa8wK6uRmUx+tZn/vkyeYmO/KEs/38sziQFnBJJ1KNHB0iC3KZ7pVrS95GMucb
 EInl0h0oqZ41X8KKCdILtoEHPJB5zLvfaHWN753sca+pTC2Ji2QH46/cqwoRPkHf8nZl
 llaW8W1nyRBkX6NPSkScIaV/FtYtz9H2RKEIutybJzDJI12WDRGI5Dsiun0X4PR2odXj
 CO3lsG29mvsZRNKNyf+Nqg9gpRQamsVAmtdJiroxe2B6cAvVUNh2Wy0zwzum7Qj/ivg6
 zJHH/yOVYpyBqJF89SP0FsitRMy6qQZDLDtmboVsNB0z6EHI//9NykvDiXoQAvlJi9Lg
 q2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745503456; x=1746108256;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AGYEntheI4w8ryaXd2hO9uZl0PRDd5uRKEGjqfQ6Qd4=;
 b=oqyrtoxeyBgWCt+DqGgU1AN7P1fJXH0DdjMBaAVP7EM9TFSoOnlpHVRY5Lf9zmZspw
 wjy0iEleV0y4eMyrNg+NJJbyLFZkpmrbPGTTpUkUWAjDgf1Kvzgxu/lB/9UGDwC7aiS0
 n3O+WhDUV1rjVHYth7BX6MrJ0hjV+YJm2tttoyRHAIeyy3Dr/gv5UawY2lBOHeDPX1o9
 t0wPSEVHQKhZEcJcftmrowMkZrxrUHn+GUPSgJTQv2XWSMt+SVzQ1YMX1HW662fDGFxs
 Sd6MkOuxmf0jSpV8ZMHE9APZePrfe0SS2faQmP5mtX3hf0D+dISXqSkt+/URQwKElcWY
 SaKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoDkCP+8NSSz7rtlqFjl6Jl81OJQS0MgLrSksEyTfw4NxjXwc2JM8PvPIeZ2YC895P0vSQyWLhjvod@nongnu.org
X-Gm-Message-State: AOJu0YyYfId8EvvMA1/JbCXNhViTDLvp7cowQ24EtkgjCQx1mMYrBo5r
 k5lJLHYTZF9xhVGdJNhau4DBffrdBIyvvoLvyk44swgLt3OsazZJGDWd6oSccCc=
X-Gm-Gg: ASbGncv+PkuzO1LCS4xFktaEP3UjB/VEKFG4Fm7C5mgXYxvyoOOLVm1YmTi2Kz8pIdG
 cdlI7o6g+7LTa6BBBEFw3tmgh6YR3eHkm0Oaq1f42AiJdZ/Q54cUDJ3Cu4hXRf5rmFEmopYAp/3
 X7nLY+LpAL0i2yhdxO3/DfY9jA4PvTWCZ3qNXz/wRVXXJXPtpoTsHOmgMcoe6xr+iX5wFoFlqhY
 6n7XwjHnyPSOsb6iZhKnfKadoUcNy6F4pxXPnCK4qdiWWjccnfJjgASHwa6p8ZC1Q7W0mYXmsIE
 /wZAIcQS1V1ZooNhtCaIMixyw7hn1hiUrFOZO4pGG9dFeA+O5XaAACBCqYpCvtV1
X-Google-Smtp-Source: AGHT+IGlZ2iWzvIn21ql4vq0ID73iarwSsP3TIhn9+XBoueClbbC09eqH+zwon5x+ZBjJCH8b/7YGg==
X-Received: by 2002:a17:903:1251:b0:224:c46:d166 with SMTP id
 d9443c01a7336-22db3d6a0efmr41440945ad.40.1745503455884; 
 Thu, 24 Apr 2025 07:04:15 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.240.169])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f84a233asm1234132a12.40.2025.04.24.07.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 07:04:15 -0700 (PDT)
Message-ID: <8a379925-93a9-4b4e-9945-f83e7cf0d026@sifive.com>
Date: Thu, 24 Apr 2025 22:04:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv: rvv: Apply vext_check_input_eew to
 vector integer/fp compare instructions
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.or
Cc: dbarboza@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20250415043207.3512209-1-antonb@tenstorrent.com>
 <20250415043207.3512209-2-antonb@tenstorrent.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20250415043207.3512209-2-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62c.google.com
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

LGTM Thanks

Reviewed-by: Max Chou<max.chou@sifive.com>


On 2025/4/15 12:32 PM, Anton Blanchard wrote:
> Handle the overlap of source registers with different EEWs.
>
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 445a0b72a5..4ba6de65f7 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -436,9 +436,10 @@ static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, int vm)
>              require_align(vs1, s->lmul);
>   }
>   
> -static bool vext_check_ms(DisasContext *s, int vd, int vs)
> +static bool vext_check_ms(DisasContext *s, int vd, int vs, int vm)
>   {
> -    bool ret = require_align(vs, s->lmul);
> +    bool ret = require_align(vs, s->lmul) &&
> +               vext_check_input_eew(s, vs, s->sew, -1, 0, vm);
>       if (vd != vs) {
>           ret &= require_noover(vd, 0, vs, s->lmul);
>       }
> @@ -461,9 +462,10 @@ static bool vext_check_ms(DisasContext *s, int vd, int vs)
>    *      with a mask value (e.g., comparisons) or the scalar result
>    *      of a reduction. (Section 5.3)
>    */
> -static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2)
> +static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2, int vm)
>   {
> -    bool ret = vext_check_ms(s, vd, vs2) &&
> +    bool ret = vext_check_ms(s, vd, vs2, vm) &&
> +               vext_check_input_eew(s, vs1, s->sew, vs2, s->sew, vm) &&
>                  require_align(vs1, s->lmul);
>       if (vd != vs1) {
>           ret &= require_noover(vd, 0, vs1, s->lmul);
> @@ -1756,7 +1758,7 @@ static bool opivv_vmadc_check(DisasContext *s, arg_rmrr *a)
>   {
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_mss(s, a->rd, a->rs1, a->rs2);
> +           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
>   
>   GEN_OPIVV_TRANS(vmadc_vvm, opivv_vmadc_check)
> @@ -1792,7 +1794,7 @@ static bool opivx_vmadc_check(DisasContext *s, arg_rmrr *a)
>   {
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_ms(s, a->rd, a->rs2);
> +           vext_check_ms(s, a->rd, a->rs2, a->vm);
>   }
>   
>   GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
> @@ -1966,7 +1968,7 @@ static bool opivv_cmp_check(DisasContext *s, arg_rmrr *a)
>   {
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_mss(s, a->rd, a->rs1, a->rs2);
> +           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
>   
>   GEN_OPIVV_TRANS(vmseq_vv, opivv_cmp_check)
> @@ -1980,7 +1982,7 @@ static bool opivx_cmp_check(DisasContext *s, arg_rmrr *a)
>   {
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_ms(s, a->rd, a->rs2);
> +           vext_check_ms(s, a->rd, a->rs2, a->vm);
>   }
>   
>   GEN_OPIVX_TRANS(vmseq_vx, opivx_cmp_check)
> @@ -2688,7 +2690,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_mss(s, a->rd, a->rs1, a->rs2);
> +           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
>   
>   GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
> @@ -2701,7 +2703,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
>       return require_rvv(s) &&
>              require_rvf(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_ms(s, a->rd, a->rs2);
> +           vext_check_ms(s, a->rd, a->rs2, a->vm);
>   }
>   
>   GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)



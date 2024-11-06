Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF84D59F52
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 16:09:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t8iZr-0004LR-9p; Wed, 06 Nov 2024 11:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t8iZn-0004Ku-KD
 for qemu-riscv@nongnu.org; Wed, 06 Nov 2024 11:08:11 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t8iZl-0004bV-IU
 for qemu-riscv@nongnu.org; Wed, 06 Nov 2024 11:08:10 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20c70abba48so62523815ad.0
 for <qemu-riscv@nongnu.org>; Wed, 06 Nov 2024 08:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1730909288; x=1731514088; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N6XlZQVf/v2kKTiezSZSw/jwpw5t1LN8EjNtZ987N28=;
 b=E12fxLtNb3Yd87oqemSL4wFyertpqvXwETIgotBwFxczETWCxK87xWNoqLQ2/NKXPy
 06uylopg3NTYOeMYuTeXUxWtfT/XZBkRA5w9SAntt87s3hU8JsfBYm9KhHiFhsyYzhY1
 tx2UOUzFYevz/7GH0KThUe2kCCTXuDDbRB/P6CtKe34i+OyWGW/qXsr1VNo/vZaR3jIX
 JX7LXI97KEPrsw6V6qmBSJye8H+66iVCZzjk+z+j/rGAAyAqvd4ZQHj8X1y3WT/kuULT
 jLnqdwIHMGH1HtfSYF3PylNOw5+JFsNCeoXL9M47IhCEC0FYONnmtBfIpyKmdl5BB16U
 +Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730909288; x=1731514088;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N6XlZQVf/v2kKTiezSZSw/jwpw5t1LN8EjNtZ987N28=;
 b=g04pUPT1W97QpiX/myTeL2Bw1TIeoUJIZfd05Gp/vofkSpLN4/3gTjNw15R6uNIrzf
 ctLjsn/7ZtIs5Kip2gKdHeIJ/DliabCsg+RnWE3SRafjQJB9rwMekTlGwygVaU+61I2r
 U2bjSd49DAU2QMDh/mFf/QFVRxllodRtWaIdXShO1ic13N3JtfgqzYFHPo6fbCHK0+qu
 vsRXu827mq5ON/9CU8gj3FsOyhMI6Evr2bwMDD+NAo0+4raQxrgtsvIgS8cIU226bALc
 w886QP4RcnZR/w9wmRm+X6QoxIYTVJ5frFwaeQ7LXHtQYW8cZCiSNwkLx4KUDsAWCobs
 mOew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp3BEnZerRPWVTP+DpscDHmS0xj/v8+Ort0K4gAf1LOYfCDDHcG39QQv4TgDYp90tqwNB6GrZ5shMG@nongnu.org
X-Gm-Message-State: AOJu0YwKvSiGFRIicOxKcKXUAQEMK3i3KRYnmNv3F3ahVSfBvFRPd4sL
 Yccs8MaGHFOnrgQhUkWWq3Zqlzf3F9+zR6IKYLWcXesS7qBj5z8jUqFd8iBcwps=
X-Google-Smtp-Source: AGHT+IG9ISHVLDeXhR8dbi5zUCwSay2UqUeWmCLBDohmkM6pHvyXYnWf+0E8sl8P4McsnsjNqaYBYQ==
X-Received: by 2002:a17:902:e805:b0:202:cbf:2d6f with SMTP id
 d9443c01a7336-2111b0181b5mr276240135ad.57.1730909286235; 
 Wed, 06 Nov 2024 08:08:06 -0800 (PST)
Received: from [192.168.68.110] ([189.79.22.174])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057063f9sm96567335ad.65.2024.11.06.08.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 08:08:05 -0800 (PST)
Message-ID: <b415b395-bdba-43a5-8cd2-d147b59f1e78@ventanamicro.com>
Date: Wed, 6 Nov 2024 13:08:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 1/2] target/riscv: rvv: reduce the overhead for simple
 RISC-V vector unit-stride loads and stores
To: Paolo Savini <paolo.savini@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>
References: <20241029194348.59574-1-paolo.savini@embecosm.com>
 <20241029194348.59574-2-paolo.savini@embecosm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241029194348.59574-2-paolo.savini@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
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



On 10/29/24 4:43 PM, Paolo Savini wrote:
> This patch improves the performance of the emulation of the RVV unit-stride
> loads and stores in the following cases:
> 
> - when the data being loaded/stored per iteration amounts to 8 bytes or less.
> - when the vector length is 16 bytes (VLEN=128) and there's no grouping of the
>    vector registers (LMUL=1).
> 
> The optimization consists of avoiding the overhead of probing the RAM of the
> host machine and doing a loop load/store on the input data grouped in chunks
> of as many bytes as possible (8,4,2,1 bytes).
> 
> Co-authored-by: Helene CHELIN <helene.chelin@embecosm.com>
> Co-authored-by: Paolo Savini <paolo.savini@embecosm.com>
> 
> Signed-off-by: Helene CHELIN <helene.chelin@embecosm.com>
> ---

Paolo,

To merge this patch we need you Signed-off-by tag since you're marked as the
author.

When sending a new version please add your Signed-off-by as well, and also add
a:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/vector_helper.c | 47 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 4479726acf..75c24653f0 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -635,6 +635,53 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>   
>       VSTART_CHECK_EARLY_EXIT(env);
>   
> +#if defined(CONFIG_USER_ONLY) && !HOST_BIG_ENDIAN
> +    /* For data sizes <= 64 bits and for LMUL=1 with VLEN=128 bits we get a
> +     * better performance by doing a simple simulation of the load/store
> +     * without the overhead of prodding the host RAM */
> +    if ((nf == 1) && ((evl << log2_esz) <= 8 ||
> +	((vext_lmul(desc) == 0) && (simd_maxsz(desc) == 16)))) {
> +
> +	uint32_t evl_b = evl << log2_esz;
> +
> +        for (uint32_t j = env->vstart; j < evl_b;) {
> +	    addr = base + j;
> +            if ((evl_b - j) >= 8) {
> +                if (is_load)
> +                    lde_d_tlb(env, adjust_addr(env, addr), j, vd, ra);
> +                else
> +                    ste_d_tlb(env, adjust_addr(env, addr), j, vd, ra);
> +                j += 8;
> +            }
> +            else if ((evl_b - j) >= 4) {
> +                if (is_load)
> +                    lde_w_tlb(env, adjust_addr(env, addr), j, vd, ra);
> +                else
> +                    ste_w_tlb(env, adjust_addr(env, addr), j, vd, ra);
> +                j += 4;
> +            }
> +            else if ((evl_b - j) >= 2) {
> +                if (is_load)
> +                    lde_h_tlb(env, adjust_addr(env, addr), j, vd, ra);
> +                else
> +                    ste_h_tlb(env, adjust_addr(env, addr), j, vd, ra);
> +                j += 2;
> +            }
> +            else {
> +                if (is_load)
> +                    lde_b_tlb(env, adjust_addr(env, addr), j, vd, ra);
> +                else
> +                    ste_b_tlb(env, adjust_addr(env, addr), j, vd, ra);
> +                j += 1;
> +            }
> +        }
> +
> +        env->vstart = 0;
> +        vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
> +        return;
> +    }
> +#endif
> +
>       vext_cont_ldst_elements(&info, base, env->vreg, env->vstart, evl, desc,
>                               log2_esz, false);
>       /* Probe the page(s).  Exit with exception for any invalid page. */


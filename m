Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16962C3DA49
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 12:23:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sXJyE-0006Qb-Ip; Fri, 26 Jul 2024 08:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sXJyD-0006P4-4s
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2024 08:22:49 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sXJyB-0006Rn-Bb
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2024 08:22:48 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1fc5549788eso5167235ad.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2024 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721996566; x=1722601366; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1amohUDCPiTYIIdRIYvUnq0PwPQExwJ5LpZlhWyL0Cw=;
 b=IJ0WViCVDy9he17zPuG5qHCHIUBCKxtip1Yjoweo3RxbDvP5ioz7sVufBjdEhG3kXf
 IqnaEtvEcG1HBVW6wEu4mp9SR976w7NiCEZtSEqx9T2R7BKVXrgfSZa36H+ODfqHpV90
 s/A7pBJDEwX+ReXWwDrh+xSKvCZ02tar2WFDKZ/vmbYCGMAZ/J+XAzhuruI2SRBeEKSb
 LUG6YFR67uC9GXL3nviIDIf19dregJ9bYPFT5IlQQrorFElfUKZAxAMAjzjgflg6bGMC
 69PkLMVW0JkFmnplp/aRFZeS5pzR+uAIPhARY2vWbFFosq9Lj6+BgBY+sw8Lc3OAXNo+
 ZwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721996566; x=1722601366;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1amohUDCPiTYIIdRIYvUnq0PwPQExwJ5LpZlhWyL0Cw=;
 b=nWdBpNlj51JmBCTyRMp8pEoqjvZaZZvEcvRyRgJiIzKsHHZE5nJKcyER9dEB/d+Qb4
 PTS01ab5wIaTKoibg6ZTEnf1jjzE2qFmJAGn2Spvl2FXPJs/txtlnSWBpHoZuvwuNDyn
 jWmjDqeJTJQQxCn4BFaz73YLhg/5g57HmR12kaJeypS287kQ0XdpoyEtwoh7Nv2k78qa
 o+MuHhCXv79q6G96m+noR4l+4Ft4PIQC60Qyi5wpZNaxtUzuJYfus3GPSAlLx40//37R
 cTAgUtX+QAgqcsgdJbBnEb+VSwG0k9rMZG8WGB+oa4bUiQ8pnog2F4rxm7LeXMYMiCcW
 UGOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6n6t4IXP9JmjRwI7n2mDus8mANlY33KsClPVu8PoyRuhJ8ukOQCblhHr3ovzadCCHuKpXR96UqDPR4P+hPta3h2eTns8=
X-Gm-Message-State: AOJu0YynHOXf7Gdhnur9sR8nVfNMOFjSAoiO+WQW7dn9EwNdaxbo9lga
 qvptAYkt08obubJKQzOQ4oo3YP78ajmJUeCJGe4jqn+JfA97tivxgqgkJGxY58k=
X-Google-Smtp-Source: AGHT+IFil65YjmLnILeAzoLEnOYDAkAwc1Wf63tvLIGeEzxqgwwvB+tKk/bLRO/WU/BlJaUYcxgiqQ==
X-Received: by 2002:a17:903:2445:b0:1fc:369b:c1d1 with SMTP id
 d9443c01a7336-1fed90b8fadmr61574305ad.3.1721996565549; 
 Fri, 26 Jul 2024 05:22:45 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:54b1:ce70:829:8c74:d7d4?
 ([2804:7f0:bcc0:54b1:ce70:829:8c74:d7d4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7f1aa0dsm30899155ad.187.2024.07.26.05.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 05:22:45 -0700 (PDT)
Message-ID: <009166f4-22b7-4568-9ffa-978f4138df15@ventanamicro.com>
Date: Fri, 26 Jul 2024 09:22:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] target/riscv: rvv: reduce the overhead for simple
 RISC-V vector unit-stride loads and stores
To: Paolo Savini <paolo.savini@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Max Chou <max.chou@sifive.com>
References: <20240717153040.11073-1-paolo.savini@embecosm.com>
 <20240717153040.11073-2-paolo.savini@embecosm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240717153040.11073-2-paolo.savini@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
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



On 7/17/24 12:30 PM, Paolo Savini wrote:
> From: Helene CHELIN <helene.chelin@embecosm.com>
> 
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
>   target/riscv/vector_helper.c | 46 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 29849a8b66..4b444c6bc5 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -633,6 +633,52 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>   
>       VSTART_CHECK_EARLY_EXIT(env);
>   
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
> +

Aside from the code style remarks that ./scripts/checkpatch.pl will make here (we always
use curly braces in all ifs and elses, regardless of being a single statement or not),
LGTM.


Thanks,


Daniel

> +
>       vext_cont_ldst_elements(&info, base, env->vreg, env->vstart, evl, desc,
>                               log2_esz, false);
>       /* Probe the page(s).  Exit with exception for any invalid page. */


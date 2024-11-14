Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971E9D68B2C
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 14:45:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBb5O-0003Xl-GH; Thu, 14 Nov 2024 09:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tBb5K-0003Ww-Ge
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 09:44:38 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tBb5I-0006vS-DM
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 09:44:38 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-720b2d8bb8dso550817b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 06:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1731595474; x=1732200274; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7F1zSdjVDJYUw8b+Hq1HEc6rzYveR06/3zarq+bgmAM=;
 b=MwnCY8WK6S4i+vmpHNxw0iNca80e4vt5lEyZHy1EMZrm954HQn3/FlvZzzV0KiP1zJ
 14Swz4ObKS5JxfuPyROyFPS/8pXu+/WjYAjg/ryF8Byy252CKH2jcCkjo/R/ryABPFK4
 14HMohd5jkcZvr0SR3BJE0iPGGQUv5I5y694NlfiMXErpKsDlLqAKBddXd+EiiPb+1rZ
 FZETg336k09XW8qbwkEgqwFMDCHC9tjqdpSZx9WE40Agl5QJzwY+KXdQuSYxe8069rVm
 BgkkSLcUKOk3JPmly4b1QXIV04CcUrTC1tsLbkRCdhV/FHjiHt+9bDBpEZ2DsAoORWIA
 yf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731595474; x=1732200274;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7F1zSdjVDJYUw8b+Hq1HEc6rzYveR06/3zarq+bgmAM=;
 b=wzhAjmzZLPskWmjIiOT/2EPw5/n7KpAjTIChOAd4GZbpmUsZZ541/XR3loC9JBXvE3
 Z6KevyHyQ0s2wmNCn1aRs0QCKdk3bEmcL40ArDFqdceUVi+QpirL86alc1c2tKuUlns+
 AKXKljqnLEdgTI58I02Q/DsLpI18O0GqqKBz6+UCAxZQB9+ZO6FdxYQzKhlqJk2KhbR2
 WwbIIi5O2aCuAG0JCTaHkH0nYTtHT1/XLuqJSwSmM/vGgibYuLlfPdIs4JLIv1wuEA0B
 sI4ZID5yfj3hpocLM7MjdN8lJq33Ov200Qs/i1ZUph7maLyd+k/cVjMY7fS/uYaTrc3k
 bGfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkHHdS3BuI9pqq4EEpEP+mhngf/cG9gbvD+kfM/5wi88lLCm2Az4LH6dKey3SjmiwYM8GDG8qu8ukp@nongnu.org
X-Gm-Message-State: AOJu0YxFmAJdYSglScEYHWbeVD7RqplHKLkJBQ9imPhEHHVuciWStSwN
 2HkG9xx3OEvBPShL1bLfUDZ2SSjEdD+lfsaAkBLnrV6L3NwzLsa/8TPGgtgmF0o=
X-Google-Smtp-Source: AGHT+IGbxVTSCRcQTZwedG009BUVDaOxDkK2B2CR9zNz7g4Fdiqd3TDiBwqr+wDkjDNqOPBZgM0vQw==
X-Received: by 2002:a05:6a00:1909:b0:710:5848:8ae1 with SMTP id
 d2e1a72fcca58-7241327d7aamr31085667b3a.4.1731595474290; 
 Thu, 14 Nov 2024 06:44:34 -0800 (PST)
Received: from [100.64.0.1] (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7246a9a8112sm1326498b3a.93.2024.11.14.06.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 06:44:33 -0800 (PST)
Message-ID: <89c5f3fe-1f91-4407-9062-fe20981de4e2@sifive.com>
Date: Thu, 14 Nov 2024 22:44:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 1/1] target/riscv: rvv: reduce the overhead for simple
 RISC-V vector unit-stride loads and stores
To: Paolo Savini <paolo.savini@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>
References: <20241111130324.32487-1-paolo.savini@embecosm.com>
 <20241111130324.32487-2-paolo.savini@embecosm.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20241111130324.32487-2-paolo.savini@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42b.google.com
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



On 2024/11/11 9:03 PM, Paolo Savini wrote:
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
> Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
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
I think there is a potential issue in this patch.
If there is an exception raised by the element covered by this 
optimization, then the vstart CSR will get unexpected value.
Because this flow does not update vstart CSR value.

max


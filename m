Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1581E7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 14:42:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLNuE-0005Q3-L2; Wed, 11 Dec 2024 09:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tLNuD-0005Pp-5z
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 09:41:37 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tLNuA-0003aW-Ui
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 09:41:36 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-728f337a921so605541b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Dec 2024 06:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1733928093; x=1734532893; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/uWhGCbYDIm3fLP49BajDiiIJayqpm4kXtDJna7CH3c=;
 b=FwgyVYAThkg67ijRcOp17iTeClSFWwkKKtcEfcirUIVdUdSZeSqeSscRZbF8Wcr5mq
 Nijxl2nbK7J+Znm05OPBVWvMb+bFvpi5Xn6dzWMg7BPCbQBePHQCC8EhqfzYNa80JLu0
 z3qApDv/ewngNaI4qGK1fGJ7gpCvdON/1s7jXoIIb2MD3aeZJ8txTMukl9eQS0HwOGSt
 vqqCz0FIAP8Ebm/ZNCXWQKnNlUfV7dy5VOXny8QugFuNlt1S/hv9RmyDZniry8Jk3By0
 PkzrmlStqZKva50d7X8DSgHDrKIxgBi6shxv6ZXTWT70Z+e/wA5u47Uq3Q9TqXcXI4Cy
 h0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733928093; x=1734532893;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/uWhGCbYDIm3fLP49BajDiiIJayqpm4kXtDJna7CH3c=;
 b=iI1rUe1OJ9iE+VxHQO4bJFO2U2BFntKeuRJcyGVUBW9lAADEdlFMPQRxmsDCj+rZZC
 zeFpjipA5WdXj5TRWaEN37knOJHQMCNqfWuccj/YXbuC/PMphqY+YswNLoqdILDjkAl7
 InncwcFrBBQF6lTnncfHoIeWow1wPqVGey5WI6/qD0FHZq03owSV0+u/yFruB5vB6dcO
 zq0TXY9jyWBVfLsq7VRuwAl46nzIUURL0Mu8d1tPnaBBTyDaLo9CBYKs7rsBct4ocaeC
 eOH4DhEW4E0tnaalpM/RGBEXECjftfCqGZs7mAj7l56XTZGyDxWtPIM1Tw6NPLkmbCs4
 xkUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzsAC4LB6ioCle0ACZ7lN5+LxN5igrnkson86Zsy2+1SvrdXemAi1KSqAkDC/kLhpgrJUp0MBXiaBT@nongnu.org
X-Gm-Message-State: AOJu0Yy3fXc3/zFzTtmlxXutXieyQwg0CeSvx96ooxXFk31nEEWd1NOe
 6/E2112uR93Y05FgvsctbMFZABH/eKWw1ckogwC0m8+JU12Q/J493XmMaOIzrXs=
X-Gm-Gg: ASbGncvWaI9Zkoy90TTa1cx1saHxPbcKAD4PQu1WD2F8H9tpLBjaozY46dTqaqy4ATi
 1jRaQu6HJ8kfZ9L/+AkBxEA674RoqM3h24ilTQBx9tLpkrnwpfYXHvZaNrROlHxLd0Mv1DnHUE3
 hKh/mAA7cVJ62KIvIwmHPZj3DkiNPspv+9UHPIR0/0pVPK0swuSItYeRVwpLmHUFP8ITYWf1XaZ
 OyCQRNRQcBmZI0Yu+KoPma4pQHEApYRUCEMDa5GxjVAWM70S796UB+tMMl3/MozoGDOVE/+nfPx
 5e27MFHcyZezxPU06YUEcVnu7Q==
X-Google-Smtp-Source: AGHT+IHHPl9YnA3+HHrElgtgPNjO0pocYNuettPyCEfqAF3i2hwtqBoPRnDbefR18g414RMK/v2n7g==
X-Received: by 2002:a05:6a21:e96:b0:1e1:b105:87b with SMTP id
 adf61e73a8af0-1e1c12b0430mr4417723637.23.1733928092810; 
 Wed, 11 Dec 2024 06:41:32 -0800 (PST)
Received: from [100.64.0.1] (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd157d45d3sm10762949a12.80.2024.12.11.06.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 06:41:32 -0800 (PST)
Message-ID: <c24746c9-9d5c-452b-90ba-a125cac91ec1@sifive.com>
Date: Wed, 11 Dec 2024 22:41:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] target/riscv: rvv: speed up small unit-stride
 loads and stores
To: Craig Blackmore <craig.blackmore@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Paolo Savini <paolo.savini@embecosm.com>
References: <20241211125113.583902-1-craig.blackmore@embecosm.com>
 <20241211125113.583902-3-craig.blackmore@embecosm.com>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <20241211125113.583902-3-craig.blackmore@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2024/12/11 8:51 PM, Craig Blackmore wrote:
> Calling `vext_continuous_ldst_tlb` for load/stores smaller than 12 bytes
> significantly improves performance.
>
> Co-authored-by: Helene CHELIN <helene.chelin@embecosm.com>
> Co-authored-by: Paolo Savini <paolo.savini@embecosm.com>
> Co-authored-by: Craig Blackmore <craig.blackmore@embecosm.com>
>
> Signed-off-by: Helene CHELIN <helene.chelin@embecosm.com>
> Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
> Signed-off-by: Craig Blackmore <craig.blackmore@embecosm.com>
> ---
>   target/riscv/vector_helper.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 0f57e48cc5..529b4b261e 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -393,6 +393,22 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>           return;
>       }
>   
> +#if defined(CONFIG_USER_ONLY)
> +    /*
> +     * For data sizes < 12 bits we get better performance by simply calling
I think that the `bits` should be replaced with `bytes` here.

It seems that this patch aims to strike a balance between the overhead 
of checking and probing for the fast path and
the benefits of directly executing load/store operations through the 
slow path.

Could you please share any experiment results (and the steps/commands) 
that illustrate the performance impact when the load/store size exceeds 
12 bytes?

(BTW, this version can pass the vstart test case that I created for the 
unexpected vstart value issue in the previous version.)
(https://github.com/rnax/rise-rvv-tcg-qemu-tooling/commit/bccc43a7be9f636cfdaea3c2bfb020558777c7dc) 

> +     * vext_continuous_ldst_tlb
> +     */
> +    if (nf == 1 && (evl << log2_esz) < 12) {
> +        addr = base + (env->vstart << log2_esz);
> +        vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart, ra,
> +                                 esz, is_load);
> +
> +        env->vstart = 0;
> +        vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
> +        return;
> +    }
> +#endif
> +
>       /* Calculate the page range of first page */
>       addr = base + ((env->vstart * nf) << log2_esz);
>       page_split = -(addr | TARGET_PAGE_MASK);



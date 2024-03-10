Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187ACC54791
	for <qemu-riscv@archiver.kernel.org>; Sun, 10 Mar 2024 07:37:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rjDkY-0005z7-Ge; Sun, 10 Mar 2024 03:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rjDkW-0005yh-PX
 for qemu-riscv@nongnu.org; Sun, 10 Mar 2024 03:37:36 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rjDkT-0007d8-IZ
 for qemu-riscv@nongnu.org; Sun, 10 Mar 2024 03:37:34 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-221e1910c3bso142279fac.1
 for <qemu-riscv@nongnu.org>; Sat, 09 Mar 2024 23:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710056250; x=1710661050; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ulMc/597jVEtb8OQY6aYx97DGbMcRtpP9gNW/40li8=;
 b=CyMTKhVh+dR53jWJ19RVZMcvRz0xSh1TGFNbW/wnzhOJtLdo8I8jIPtze/QnrGPcBz
 lnXFO60LxGX7Yk7GSWrK044qnlrrPMeKBXKSqgCNZjDCJWpqb+iBWxEiVS/uYXFAc1yG
 qIY4hdjz1OKn8q2nmjk2vtKOQ1Y01vU1FlL4vtdZ0iXZQV5cBrtN6/9tuy5xPY0CSgdD
 3ZzFjdyL6/dHQRYGuwStHZ9mVAYewHk+N+pTqgjlerHuufRBgOH37oixyf08ODU+TbfS
 KT8ngvNsBQNUI9me8zRw0FjxnAbjNyrsXHWyiS4mKxNNKH3WTBmv7Mu9/KJtHUoQGW3D
 rQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710056250; x=1710661050;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ulMc/597jVEtb8OQY6aYx97DGbMcRtpP9gNW/40li8=;
 b=dcxZZSU/n11bpKA4/ope0oi/sokPx1HvZVnFSHiSS5JaW1agbyPFxwzz+rskbj8PEJ
 Sof3xT8P8F/gbwRELqYLNGBIc7tOwRI8WyKWzbxWenccGotVDYBBqcwba2XoQWAgy7zW
 1BSUFwYUGcOB6/REeqU3QKy79qzP4V6fG3PSIuqgvloZLs9Bqn5djNZsfhkj3B8dxStz
 c9YwEfiNu/Z2ixt7gldjzuSL6R5p4qk2qCIYSWbrhpFwrKPBKfQznCsxTqIGFqZBEAeI
 gyXGUp8YXMgXEvr78c2dU2M+OAydJtN9/MhhFrSxiIBu7/GIuaQsAI+EXo8PA4CRlL/9
 vR+Q==
X-Gm-Message-State: AOJu0YzO9Hgdk6vqy4tXQzeuVXHshbyniRkIqw6YeQWyJAi80bMJXp+E
 zMRYe4++hK2QQL9tErsDHa02D3NMB+UHhvxt/EX9fqRJ7upVKQ7uEgC6b7peguw=
X-Google-Smtp-Source: AGHT+IEqvT8v5hRQbvMeubXTww35aSdxqoFBWAWXNcuDao/3srXcDFsNKT4g5bGBvWhyZq5MT4Bitw==
X-Received: by 2002:a05:6871:7412:b0:21e:a47f:ec31 with SMTP id
 nw18-20020a056871741200b0021ea47fec31mr4188540oac.43.1710056250623; 
 Sat, 09 Mar 2024 23:37:30 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 e30-20020a63745e000000b005dc832ed816sm2211455pgn.59.2024.03.09.23.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Mar 2024 23:37:30 -0800 (PST)
Message-ID: <6e82f8b3-5a3c-4bb0-8aba-94ad25da3712@linaro.org>
Date: Sat, 9 Mar 2024 21:37:25 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/10] target/riscv: handle vstart >= vl in
 vext_set_tail_elems_1s()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org
References: <20240309204347.174251-1-dbarboza@ventanamicro.com>
 <20240309204347.174251-3-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240309204347.174251-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 3/9/24 10:43, Daniel Henrique Barboza wrote:
> We're going to make changes that will required each helper to be
> responsible for the 'vstart' management, i.e. we will relieve the
> 'vstart < vl' assumption that helpers have today.
> 
> To do that we'll need to deal with how we're updating tail elements
> first. We can't update them if vstart >= vl, but at this moment we're
> not guarding for it.
> 
> We have the vext_set_tail_elems_1s() helper to update tail elements.
> Change it to accept an 'env' pointer, where we can read both vstart and
> vl, and make it a no-op if vstart >= vl. Note that callers will need to
> set env->start = 0 *after* the helper from now on.
> 
> The exception are three helpers: vext_ldst_stride(), vext_ldst_us() and
> vext_ldst_index(). They are are incrementing env->vstart during
> execution and will end up with env->vstart = vl when tail updating. For
> these cases only, do an early check and exit if vstart >= vl, and set
> env->vstart = 0 before updating the tail.
> 
> For everyone else we'll do vext_set_tail_elems_1s() and then clear
> env->vstart. This is the case of vext_ldff() that is already using
> set_tail_elems_1s(), and will be the case for the rest after the next
> patches.
> 
> Let's also simplify the API a little by removing the 'nf' argument since
> it can be derived from 'desc'.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/vector_helper.c | 59 ++++++++++++++++++++++++++++++------
>   1 file changed, 49 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    uint32_t nf = vext_nf(desc);
>       int k;
>   
> -    if (vta == 0) {
> +    /*
> +     * Section 5.4 of the RVV spec mentions:
> +     * "When vstart ≥ vl, there are no body elements, and no
> +     *  elements are updated in any destination vector register
> +     *  group, including that no tail elements are updated
> +     *  with agnostic values."
> +     */
> +    if (vta == 0 || env->vstart >= env->vl) {
>           return;
>       }
>   
>       for (k = 0; k < nf; ++k) {

Existing issue, and we know nf <= 8, but bad form to mix signs on the comparison.

> -        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
> +        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,

You may wish to hoist vl to a local anyway.


r~


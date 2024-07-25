Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B24C3DA49
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 06:04:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWraN-0006SG-Ds; Thu, 25 Jul 2024 02:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sWraI-0006Nn-PZ
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2024 02:04:14 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sWraG-0001YV-RT
 for qemu-riscv@nongnu.org; Thu, 25 Jul 2024 02:04:14 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2cb09dc1dafso422251a91.2
 for <qemu-riscv@nongnu.org>; Wed, 24 Jul 2024 23:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721887451; x=1722492251; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oWkDkUpdfsedtAknncaAt3FaBqUrQBbxtsmdvUKJY5I=;
 b=s2pUpdeA2U7AMws1hWA3xxBJue113IvkwAeXZy5P2zF15jg8X0T4kjhz9mAanFQgmL
 opmbKKuvvbs51+m+dpJU64Iu+DI15doIrHLU0F4h/TUR6fYYzTJH/cP80g7gN58Tkm95
 OFNMwLB9Xlp5M7bVzlTpp9aFLQh4EJgxZ9s7ITWJj51YeIcRMdGzIKGNG2A5Eprhe8iu
 E6NFcQtVFGXiICir8XBVjBgCOQyeSQzKnRW94OeBcGKBlIBbE28UOaExp/JU1PdsoaJi
 5Vf9+KK24abShAf1R2z4sv/LnTLb+Ikmht9/o7QkJ09yFq83ar2PrlEy2FmPspHdVUk8
 ksmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721887451; x=1722492251;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oWkDkUpdfsedtAknncaAt3FaBqUrQBbxtsmdvUKJY5I=;
 b=fDGd14wxxGWDPwQMMz2A1GmJ2IVDDJpkaW7YRxCc7FJ2V0zlxyEcwZ645BFY29OuI3
 hWtfkjIB1HCjupcs8O4mAFw81wdY8AWWtWcFxMFANQwG4khRNucuzrfTz288lFswbPPP
 6wVVBQLory7HEHnN7TYECP5agxvK5vwY5mJknd0V01FsPr8ITLNZxY6ZSxtZrjtpppQo
 iqY52y2khwkrfNT+3kM80Ph/f8dqaRN9ziL13FCBmtpKkh4PXa+TEZkWfPI35wz+ueDj
 i+2dbWnPoCHn4Xm027mc/hmcNv1mgl3hhYqecekDEaQzZgivGqjETmYfwu/b3uh6LT7z
 iyXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcTvq8ujdOTdutnQboZ3a5pAXTvBYxUR/0HJEYkSo21jZSb4ER7hkhK3MddxfI5KIKmqzZKu6o0IkVcuv4t5J4JLoZhyo=
X-Gm-Message-State: AOJu0YweOxi3Z+kxzrGpL0C+VTRl6S1Qy6FZBpBi9kZX1IQr7XNVBYlo
 5PA0R+AmizoqqHpYsgGxynQUtg4AbgNmqfDXYUHuKdlyVmRLZcOyuqmOPDRv0yo=
X-Google-Smtp-Source: AGHT+IFJIYJqqDxZypO/q/Ql0QvmEIMK97ANGIZwOsjYFWQVpwVSJ7vq1npZ49JlPuPVvu2z/NuKRA==
X-Received: by 2002:a17:90b:390f:b0:2c9:999d:a22d with SMTP id
 98e67ed59e1d1-2cf238ebb99mr1884717a91.30.1721887450688; 
 Wed, 24 Jul 2024 23:04:10 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb73b7674sm2667852a91.20.2024.07.24.23.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 23:04:10 -0700 (PDT)
Message-ID: <17b9f3cc-1ad7-4e79-8693-1f327f9bd5a6@linaro.org>
Date: Thu, 25 Jul 2024 16:04:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 4/5] target/riscv: rvv: Provide group continuous
 ld/st flow for unit-stride ld/st instructions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240717133936.713642-1-max.chou@sifive.com>
 <20240717133936.713642-5-max.chou@sifive.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240717133936.713642-5-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 7/17/24 23:39, Max Chou wrote:
> +static inline QEMU_ALWAYS_INLINE void
> +vext_continus_ldst_host(CPURISCVState *env, vext_ldst_elem_fn_host *ldst_host,
> +                        void *vd, uint32_t evl, uint32_t reg_start, void *host,
> +                        uint32_t esz, bool is_load)
> +{
> +#if TARGET_BIG_ENDIAN != HOST_BIG_ENDIAN
> +    for (; reg_start < evl; reg_start++, host += esz) {
> +        uint32_t byte_off = reg_start * esz;
> +        ldst_host(vd, byte_off, host);
> +    }
> +#else
> +    uint32_t byte_offset = reg_start * esz;
> +    uint32_t size = (evl - reg_start) * esz;
> +
> +    if (is_load) {
> +        memcpy(vd + byte_offset, host, size);
> +    } else {
> +        memcpy(host, vd + byte_offset, size);
> +    }
> +#endif

First, TARGET_BIG_ENDIAN is always false, so this reduces to HOST_BIG_ENDIAN.

Second, even if TARGET_BIG_ENDIAN were true, this optimization would be wrong, because of 
the element ordering given in vector_internals.h (i.e. H1 etc).

Third, this can be done with C if, instead of cpp ifdef, so that you always compile-test 
both sides.

Fourth... what are the atomicity guarantees of RVV?  I didn't immediately see anything in 
the RVV manual, which suggests that the atomicity is the same as individual integer loads 
of the same size.  Because there are no atomicity guarantees for memcpy, you can only use 
this for byte load/store.

For big-endian bytes, you can optimize this to 64-bit little-endian operations.
Compare arm gen_sve_ldr.


r~


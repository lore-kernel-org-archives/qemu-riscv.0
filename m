Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B296EC88E64
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 01:07:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x5v9q-0006eE-Ba; Sun, 13 Sep 2026 21:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5v9m-0006do-Mz
 for qemu-riscv@nongnu.org; Sun, 13 Sep 2026 21:06:50 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5v9k-0005vA-HP
 for qemu-riscv@nongnu.org; Sun, 13 Sep 2026 21:06:50 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-cc149372c14so1688857a12.1
 for <qemu-riscv@nongnu.org>; Sun, 13 Sep 2026 18:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789348006; x=1789952806; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ULQuvrUe0mB90Wv3baK1ormQXrZY06F06Pd2Qx32e7A=;
 b=vHqUsooRE412y7jR5rj5+fsUvdQZJ3rxOyRmbBfJvpTDKeludqYnhY8/ToLintvgZH
 rkHzYdcpU9kpeZhnEhw+8ALZHIwuk4kws8FUWHXa8wsLV72U3eV4c76nYk4/v2r9hzzc
 MEQ/pBj6zp9H9BHyH49XxC6uO5ilSQs9VKDob37BGLheb2aBmvnIAqckFseehHz4LHuH
 h32H86niIzcraCQgpx2k7qLpBrW/b8qE+pn12wBO25ip3XICVEQcnggrWHsQxZyzZ3CP
 vpFmCeJ0aWVFw/2a4jwqlvDAEMTJoayU1cyQsphbU/Du6UAcSgG1C0W9mouL8EZi33op
 qg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789348006; x=1789952806;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ULQuvrUe0mB90Wv3baK1ormQXrZY06F06Pd2Qx32e7A=;
 b=Tz7fEvbpGVm2tqsJIh747FqzArxQ3p3mq5d7f+K9ksVpCDgznCOUCrqjPqyz/xLi2c
 qY9gSKVFAQowSyyJYL4QerFtpo3AvjVOTHXj22640IhyGQakhVhxtz7cljT7qL8rDFCt
 m8h8KX60kayOvKdBJJfELc4/D3oxVmSRmyNJ1E6saJwKD6xvkk43tPeVF8QbN5lhOMq9
 3ab2Wjn7r+XvKSYGHIDZ0uZ9aSNfy9aTebqfWcNAYh0ZH631SdHcg3e0df3T/TYvGFHQ
 y26z3nHAv1QA0nOnoPXcTmLra8t9N1vVbItq0JpbLwTU7/oJd6M7HbPglZptlbD9Ock6
 Dxsg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzaKYCr/sCrVeGenv07W1dLvDMqBc55LEYQ8vg0IUb4BYBYRojEwoqXmryDiEzjQPHsTJH3KIe/c02k@nongnu.org
X-Gm-Message-State: AFuF++lERw9MZiesEKqx8y9BJD70tIQE3xDHzxsQ21ixDawGSeYHLSMZ
 xLwBvNfedbM+RtpKVPLP4+DxSNVZfV4K7uI3GIoLBEtYYLYf6MpXwahxmS0kqhKBWkQ=
X-Gm-Gg: AYBFou1aYfezmojWwUkDXZdtTRTYWDrQcrJnlF0V1Vl3salIaOfTqJSWPSWn0LPU6Q8
 2VxG0ooi9WIMNxGWFGLt7efGWFtpow6X6M9pIxmdIzBlTv9zNIpaCT2IANJVa8kKoCiClTPAWC8
 rQSyTCA6NwwDYFEAZvOGQ5v5fPbcrw6o4dgMNxsnEEWxU4fHojHP8KJUnnF6CUWf5eo22cITyy4
 zvp0wwh2QOUBjNodltTHg0e86dTOsj6PkEW1FEQIeQCZjl9ZJbN9yBBGaIGcWFPCA4XWBE84bae
 PVljz2nrTzSQwHwL9HYox8LdNvc1IHKrSoilWdCAi5282vSZcOSdX3MfnFottess11Hs/1ZObsN
 qEe3L8SUAW/AAE3w2Y7BdkdHnD+HVACjyp1hCH+OSiA5D5+rt/DXwt3yHqxYQnVLbSbdPEUFXFi
 LGhlQyByIwzqR2/3efbY43yNFpfSAblV/wdcmHWf/8V0+0O4IKkdmnMv8JjI6bxI8TL5Fw0r8fh
 M2uUeAuBTq+48xy2lzpkHyQuRtaK60YlsfM80YSAYyIxPlbmtzUN463ICyRzA==
X-Received: by 2002:a17:90b:17d0:b0:39d:c3bb:98e7 with SMTP id
 98e67ed59e1d1-39debfa60f6mr896155a91.6.1789348006493; 
 Sun, 13 Sep 2026 18:06:46 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:1665:91c0:9a80:f870?
 ([2603:800c:7900:ed00:1665:91c0:9a80:f870])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b8f1f7sm19691111c88.11.2026.09.13.18.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 18:06:46 -0700 (PDT)
Message-ID: <9b1ff139-7fd5-4678-bc3b-c472faa6b32e@linaro.org>
Date: Sun, 13 Sep 2026 15:06:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] target/riscv: add helper_tlb_flush_page(), use for
 sfence.vma with vaddr operand
To: Trevor Gamblin <tgamblin@baylibre.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260904-riscv_tlb_page_flush-v2-0-defec3f29312@baylibre.com>
 <20260904-riscv_tlb_page_flush-v2-2-defec3f29312@baylibre.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260904-riscv_tlb_page_flush-v2-2-defec3f29312@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

On 9/4/26 08:43, Trevor Gamblin wrote:
> sfence.vma unconditionally called helper_tlb_flush(), regardless of the
> rs1 (vaddr) and rs2 (asid) operands, forcing a page-table walk on the
> next access. Create a page-level counterpart to helper_tlb_flush()
> called helper_tlb_flush_page(), and use it whenever rs1 != 0, falling
> back to the existing full flush for rs1 == 0. This makes RISC-V
> behaviour more similar to ARM's equivalent (tlbi_aa64_vae1_write), which
> already does tlb_flush_page_by_mmuidx() instead of a full flush.
> 
> Pass get_address(ctx, a->rs1, 0) to gen_helper_tlb_flush_page() rather
> than get_gpr(), so that the address being passed matches the current
> addr_xl width regardless of '-cpu' input. Otherwise, the raw register
> value can carry garbage above that width and never match the address the
> TLB entry was actually filled under, so the flush silently misses and a
> stale mapping survives.
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   target/riscv/helper.h                              | 1 +
>   target/riscv/tcg/insn_trans/trans_privileged.c.inc | 6 +++++-
>   target/riscv/tcg/op_helper.c                       | 6 ++++++
>   3 files changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


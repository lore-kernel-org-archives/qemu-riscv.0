Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50051C282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 15:49:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuCiM-0007SO-J7; Mon, 17 Mar 2025 11:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCi7-0007Qf-1X
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 11:49:03 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCi0-0007lV-LH
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 11:49:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so4023832f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742226535; x=1742831335; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o+5W+UssECkTKS4DrzEwRnjDFNiMZjlh6x8JkFvP4I8=;
 b=X8yVZ+5nb7evWa7wcKBvv6qD6dBF87UCwlQakuZzc66SpdaivKoX374cRu+xZv3Bkm
 WwSMtZG5l9pdSlEOZtRphbxuVreaKbyjgxO2JR5iY51XzKF9HvlaX5jKNimdlRQbYVhN
 lN4Z0UasZpS9uqkIp+y5QS5+GY4bw0FUbllQlTjUkdS1GERfDh8EJ/rcXcRUU7pQgMBH
 veG3tvTPmc43zecae8FTX6C4SvV0Qc/+uyqa3jbr8/XGz0YuFUmHQBTS934W4+4tCnJr
 M3choPqocLUr+v8x21PJgqX/YiwDPyIjlRyqK9hV2qF2jKxFBA3ug176uJxVj0IGtY9M
 QZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742226535; x=1742831335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o+5W+UssECkTKS4DrzEwRnjDFNiMZjlh6x8JkFvP4I8=;
 b=M9V4o+e1aHU6MnAy9zaUSP0Cxf0TNB4wcnE9T+uvoh/en+5Mut/F/q/xcrCZ3pRcpv
 lTAOsFBREYVEjEYYEARrneXjlZzitTzsTCD7OtLZGArBNpZWeTztTUF186iyWl0g9Rie
 da0Ry45ikQ9RLocxEVT00QE4Uijy3M1etRm0FA2ZSqDjSo1L2n44gMN9QqLfSBNT5ZbP
 ZedPBX4i6hkVC0qchMs77eiVu1cGEJiQchjPgYoiR1qggOGyARw83qUz55Kux2V7VurN
 z8Te2+PiISxvwASt8SkZDn6bDM0bgAjoUWTnwDpzytRXuzI8sBOZi5QCdOl9J1r51cId
 WCCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6ciWklWP2vPWZgePpZIZuarM0pnHPNk5MA3UzsY0ogNgjCl5fAItRcWNWBMNhrouJLHneOv60xGEw@nongnu.org
X-Gm-Message-State: AOJu0YydImoUjt9F0zbyjpD8/fZz40q/Q6rU5a041nW9BmLpgizzeHxS
 YA1ur3hwOpL6EMvOz78zy9MigZs8W0F/SD2WxLeCGWAcf+E18IjDS0N93YLu/TM=
X-Gm-Gg: ASbGncuIryA7cA/gVGsHOJiqdmxubDpEOxFHlWL7r29vYSTkHF7VsW2Glf3OHGFVPPd
 dFxZ4bxSMXpRzt9fVCmEwWRC6ewrspYHpA/ofFuJ1yukBaJCViGR2QWEkUsU2NgkARkzfOT0XGz
 kg/nxAVIcSbDwpZ4DZa7MKL8wca3tbVqTSkWHKkOQwB9SSC5DCXYiH3J2GOdlIqKTxccA/pbf0o
 5XeUGmWzki4Q0GcCDWs06OmZOnV9dnhPsfzewSSCBrny2AAWzZcvrnjfajLAkcCb+F0Bng5xfDt
 sCB1vHjKcn7N8GDbEA/eGfwiu4RjBoeXf4IlEfwDjBeoaIwzmcqhcMRy8mTUk+uPkEpAQ6/jvtI
 +Bw3wAXgUKg==
X-Google-Smtp-Source: AGHT+IGPYq8a1DX+sutBQTGjwo1ZKdFnw90ZowytYQDXuqZKLeSdwoGehqSW8lE4c/1Od7xg7Lk9Jg==
X-Received: by 2002:a5d:5f4b:0:b0:391:212:459a with SMTP id
 ffacd0b85a97d-3971e781d76mr12793882f8f.22.1742226534980; 
 Mon, 17 Mar 2025 08:48:54 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cdafsm15448541f8f.62.2025.03.17.08.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:48:54 -0700 (PDT)
Message-ID: <d5e2aa98-5b9c-4521-927f-86585b7b2cfa@linaro.org>
Date: Mon, 17 Mar 2025 16:48:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/17] exec/memory.h: make devend_memop "target
 defines" agnostic
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <20250314173139.2122904-6-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250314173139.2122904-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 14/3/25 18:31, Pierrick Bouvier wrote:
> Will allow to make system/memory.c common later.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/memory.h | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index da21e9150b5..069021ac3ff 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -3138,25 +3138,17 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
>   MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
>                                 uint8_t c, hwaddr len, MemTxAttrs attrs);
>   
> -#ifdef COMPILING_PER_TARGET
>   /* enum device_endian to MemOp.  */
>   static inline MemOp devend_memop(enum device_endian end)
>   {
>       QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
>                         DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
>   
> -#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
> -    /* Swap if non-host endianness or native (target) endianness */
> -    return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
> -#else
> -    const int non_host_endianness =
> -        DEVICE_LITTLE_ENDIAN ^ DEVICE_BIG_ENDIAN ^ DEVICE_HOST_ENDIAN;
> -
> -    /* In this case, native (target) endianness needs no swap.  */
> -    return (end == non_host_endianness) ? MO_BSWAP : 0;
> -#endif
> +    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
> +                       ? target_words_bigendian()
> +                       : end == DEVICE_BIG_ENDIAN);

Unnecessary parenthesis?

> +    return big_endian ? MO_BE : MO_LE;
>   }
> -#endif /* COMPILING_PER_TARGET */
>   
>   /*
>    * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C705E77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:00:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwSV-0006Id-Po; Wed, 18 Dec 2024 10:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNwSP-0006EQ-Iw
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 10:59:29 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNwSN-0007t8-V1
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 10:59:29 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-300392cc4caso77331441fa.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 07:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734537565; x=1735142365; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nn9xLwkBXbuaQt1swaArTezbwGajJ0lSyhLeifG5VNk=;
 b=vgM2E58k/Hk964rwEee0gv26+U+h8jhqsQp5QJYJ9JF0spLS9euJX7ti+bsZLynwLi
 +KNc+F1+VE0G/03Xse30emOImBliYGvRR4EV1P06ehm7n5MYxPuUAjjN1/S9l4ooX3JV
 xxjgyjUj7Ytc49B9dMaR1gI/VovKTdAlsAQAqVGOA+jGbr9AIG3G8bqWGMFH2gr61IMS
 uIQ3LaWZ1Kf2BgDcgtleVCJhE+uDtuwYtG859XfhU2CDLmLH/aK6MNG5PN5airnjMjg/
 fqLXjLG9/E9rkYL45aUcQP1jWaUOF+jnl1I1AL/ZfDMmkwHVbxD00zhjDufx8R1Df3yg
 MBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734537565; x=1735142365;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nn9xLwkBXbuaQt1swaArTezbwGajJ0lSyhLeifG5VNk=;
 b=Rd6u1de6BbHfnUDKATGW3jhTMs20nT50Y5itb8YAvCcokmIHZIDvui2cv7SpAVvOd7
 scuCaQkCVj4IOA+2nG+cquIlQijN3nRQFWk49ny/Wfj2layWmSEkbiPK+IMigqwHI04c
 oJI2rRmVP+WuihDuy7mzHLW0BpPoYkv1a6kUvl1xhAATpM9Wh2RwqQjr+kgHAZgoUg/M
 YIacMfV7jdI1L0PfcPLLZN3IVLgj3eROaEzPb1/4ZCv5fxjZ/3K7JdEWm2NxNcfAWIEy
 UANaOs56KrFHl0Di+6BKIgsnsYv8opFP9rBs4kkKbE6AKCDMXHVzCgNdFKTIP5v1hgIV
 6h+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2aGvtM0q6Cj6US80fHXEMO19jS+kak78kC2BNfVyyHACZNhFGk57plswgNbykVxlpn94zPGMTSHPL@nongnu.org
X-Gm-Message-State: AOJu0Yy+HqNe2sq11sYyjtAPpYEXVyjAo9ndUlq8tMy1E724Z3Kc5lJZ
 FeZ0LBwYl92Wmk9piFtRqw91MOV7shU48D/QvILlZmW/PXf1nyfNY1Pn51VourM=
X-Gm-Gg: ASbGnctI7SDhsQf6LkA/7lk7nUuoPy9zH+CLPkSo9P0BW40/n0etBTdMW+A6X/7fm/H
 SICpLi5a7qsttICDCoApb259e5Rtkr40cNO+VhGk2D33Y3ONj08XxLhgAAqhYfXhSdFfSGmcO0y
 Sryaipeif1k+B61QdLwz/CnmAYX6glnLrS+CH+qlM16yaU57e0EJtr9wOjkJE9L/NQx6J+SzBkp
 BaWKTHDYczQ//biXrDjg08uW52SfljY62wfhk6tqGWqiOfVPbI2iDoprUgEFlbLhLZzsd7nvhI=
X-Google-Smtp-Source: AGHT+IGT1dXEnbv7TC30iVxCwcr3Oqm7XF1WK7MD/Qwz45gXj70+llIqIxqsBDXM6l+n24ZU5Kii+A==
X-Received: by 2002:a2e:b8d2:0:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-3044daebbc0mr13035721fa.17.1734537564821; 
 Wed, 18 Dec 2024 07:59:24 -0800 (PST)
Received: from [192.168.242.227] ([91.209.212.65])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm16601281fa.33.2024.12.18.07.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 07:59:24 -0800 (PST)
Message-ID: <2972bfcb-67dc-4bec-989c-1e7449096ea5@linaro.org>
Date: Wed, 18 Dec 2024 09:59:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] target/riscv: rvv: Use wider accesses for unit
 stride load/store
To: Craig Blackmore <craig.blackmore@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Paolo Savini <paolo.savini@embecosm.com>
References: <20241218142937.1028602-1-craig.blackmore@embecosm.com>
 <20241218142937.1028602-2-craig.blackmore@embecosm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241218142937.1028602-2-craig.blackmore@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22a.google.com
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

On 12/18/24 08:29, Craig Blackmore wrote:
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -31,6 +31,12 @@
>   #include "vector_internals.h"
>   #include <math.h>
>   
> +#if CONFIG_TCG && !HOST_BIG_ENDIAN
> +#include "trace.h"
> +#include "../accel/tcg/internal-common.h"
> +#include "../accel/tcg/ldst_atomicity.c.inc"
> +#endif

No, you cannot include random bits of accel/tcg/ into target/ code.


> +#define GEN_VEXT_LDST_ATOMIC_HOST(SIZE, TYPE, MEMOP)                         \
> +static inline QEMU_ALWAYS_INLINE void                                        \
> +vext_ldst_atom_##SIZE##_host(CPURISCVState *env, void *vd,                   \
> +                             uint32_t byte_offset, void *host, bool is_load, \
> +                             uintptr_t ra)                                   \
> +{                                                                            \
> +    TYPE *vd_ptr = (TYPE *) (vd + byte_offset);                              \
> +    if (is_load) {                                                           \
> +        *vd_ptr = load_atom_##SIZE(env_cpu(env), ra, host, MEMOP);           \
> +    } else {                                                                 \
> +        store_atom_##SIZE(env_cpu(env), ra, host, MEMOP, *vd_ptr);           \
> +    }                                                                        \
> +}                                                                            \
> +
> +GEN_VEXT_LDST_ATOMIC_HOST(2, uint16_t, MO_16)
> +GEN_VEXT_LDST_ATOMIC_HOST(4, uint32_t, MO_32)
> +GEN_VEXT_LDST_ATOMIC_HOST(8, uint64_t, MO_64)
> +GEN_VEXT_LDST_ATOMIC_HOST(16, Int128, MO_128)
> +#endif

I was suggesting use of "qemu/atomic.h", which would just be

     *vd_ptr = qatomic_read_nocheck(ptr);
else
     qatomic_set_nocheck(ptr, *vd_ptr);

for types up til uint32_t.

Add an ifdef for CONFIG_ATOMIC64 and you can use uint64_t.

Get that working before tackling Int128.


r~


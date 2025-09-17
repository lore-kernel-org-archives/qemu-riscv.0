Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6C5CAC59A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 13:58:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uysfR-0004w8-Mt; Wed, 17 Sep 2025 09:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uysfG-0004sj-8j
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 09:57:43 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uysfC-00068o-Bg
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 09:57:40 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-71d601859f5so47597427b3.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Sep 2025 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758117457; x=1758722257; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Wtzys6E04MDe8S8vjMWstZzH+NBfycX1L3shG/1gMQ=;
 b=a9eroP0dduUp8AbK9+VzGVhYKPrpnivs1KNZG7dLvuUWHeiXig1n2BnQ0w3MooxP2I
 nXFgBcNwLCEbkgH1Uj8QN/lE0e3bNdwlXcp6bxGVtYmGsHGu1sPV5oHjrJa7UcKi8vH2
 tdPGHQQZeRXfEr03HrgOev8fCPDwnNLtoKpC33LvSLAXuUHRgQMGs+SBD+Tx1hMiX4SY
 sda7WMeyos5PlkeRstJPE6c3T7PSSv5fO3UwoqUIEL/gCDiNcdXSvpjUQp+FKlzof031
 EMiKKdak2LOJmisGVVX3Y7yQ6gx007kDAgklJ+nMVzm16CHRT0eI06hdsHSZRsMw4MV5
 BTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758117457; x=1758722257;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Wtzys6E04MDe8S8vjMWstZzH+NBfycX1L3shG/1gMQ=;
 b=ZSXeRn+IrfCxl1O08bFIda5YDB+wTHyxnG++gQ8c71y6iKyyNBOUGZsHcnQvUzYUHh
 gYGjV+UXGOR7erAhQYkCwv3chjNbMDWu26WujvqQGF2+JBILuqReMJIlXkd4tvlvfTBd
 4G8aWrCfkaWBXouhRhdtwJSMrUj+leOVLoo/k5hbNI0LPkfX02nRqSx1w0EhV8dCrfaa
 T2XX3qz3ea84LVVrRYbBePN+i3h2xQ0OtmeMSYuLGR9ScLnZ6AHzMxALmy18WeDLY5oG
 FoIS/XXdw2ih7IjiSrLY1fABTUgXjidWecXwHu1S3NxSKTMIrW6khiiupw/24avAvFkg
 W6sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUweQP/8hVBf46nAZX4Fq5NSC2M3RAh3GtNgs6Xi0IUMx2id8GsXwTicoaxAvTKzaRNBP5Y0dnYz2ao@nongnu.org
X-Gm-Message-State: AOJu0YyqD4CvNhK1YjSt/ECjvPpnvQ5uuIBtCB/y+SYvDec2OwHjA843
 EtwzY+QjcRo3J453rvvCPWFytddBl7oi4VHSkKfePBECU+eNBtM2LtOvblLAV9skG4HdefM5aGf
 0NqTXQjg=
X-Gm-Gg: ASbGncsIz4VsLzGkXBmeJg3nKdWEsXZu4UyGKzD0Gx1TMzag7hyj1g1XBgSyWEKFut6
 cqRJKAFLW0d8R2dzyqDuxnScnfCeKZBNo6TrvCojA4VrSxP/7lDZ8x9wD4u7XEUw+OQi8o6t2Uc
 q0XDVqF80HLBcv3Yv02g9E7xn/hf46IACR9YPaFzoBnYoilWBg84u5/CTFNNp07HZwBY/iHAvbc
 i2VM7yknOxLau8+kAcumcVSjGQx7sgugLVvu5LVIiZHifJXvGKwl6xSTEuq3UXthM85gVqcZsob
 oZEGqzrdGNlD3aEM53r/W4/LyrTon/MAKFwc8dBO0WYjeBccBhinYWHB2Z5WXBdUF56SUGoMRfM
 w6cajH6xp8pIFxmR0pAoup/3G6GMKb7VQ/HgsQw==
X-Google-Smtp-Source: AGHT+IEbjE2GmAbmBW0+oAYJIWZJJd7lkcwlgw1Jjlq+r3MPydcTQJzZIT5U+AfKgPmDxZ0IDdoflQ==
X-Received: by 2002:a05:690c:6706:b0:71f:b419:8f73 with SMTP id
 00721157ae682-738905c7e54mr18230817b3.20.1758117456735; 
 Wed, 17 Sep 2025 06:57:36 -0700 (PDT)
Received: from [192.168.68.110] ([179.225.245.173])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-72f7969c495sm47448437b3.59.2025.09.17.06.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 06:57:36 -0700 (PDT)
Message-ID: <26d72d8e-5e58-4a04-865c-34f6094e74e9@ventanamicro.com>
Date: Wed, 17 Sep 2025 10:57:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/8] target/riscv: rvv: Add new VTYPE CSR field -
 altfmt
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250915084037.1816893-1-max.chou@sifive.com>
 <20250915084037.1816893-4-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250915084037.1816893-4-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1133.google.com
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



On 9/15/25 5:40 AM, Max Chou wrote:
> According to the Zvfbfa ISA spec v0.1, the vtype CSR adds a new field:
> altfmt for BF16 support.
> This update changes the layout of the vtype CSR fields.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/cpu.h           |  4 ++--
>   target/riscv/vector_helper.c | 29 ++++++++++++++++++++++++-----
>   2 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 738e68fa6e2..532386000af 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -190,8 +190,8 @@ FIELD(VTYPE, VLMUL, 0, 3)
>   FIELD(VTYPE, VSEW, 3, 3)
>   FIELD(VTYPE, VTA, 6, 1)
>   FIELD(VTYPE, VMA, 7, 1)
> -FIELD(VTYPE, VEDIV, 8, 2)
> -FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
> +FIELD(VTYPE, ALTFMT, 8, 1)
> +FIELD(VTYPE, RESERVED, 9, sizeof(target_ulong) * 8 - 10)
>   
>   typedef struct PMUCTRState {
>       /* Current value of a counter */
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 7c67d67a13f..603d0731ae1 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -33,6 +33,22 @@
>   #include "vector_internals.h"
>   #include <math.h>
>   
> +static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
> +{
> +    int xlen = riscv_cpu_xlen(env);
> +    target_ulong reserved = 0;
> +
> +    if (riscv_cpu_cfg(env)->ext_zvfbfa) {
> +        reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
> +                                           xlen - 1 - R_VTYPE_RESERVED_SHIFT);
> +    } else {
> +        reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_ALTFMT_SHIFT,
> +                                           xlen - 1 - R_VTYPE_ALTFMT_SHIFT);
> +    }

Is this correct? The 'reserved' value you're returning when the new extension is enabled
is the original  value from vsetvl:

> +    if (riscv_cpu_cfg(env)->ext_zvfbfa) {
> +        reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
> +                                           xlen - 1 - R_VTYPE_RESERVED_SHIFT);

The original val you removed:

> -    target_ulong reserved = s2 &
> -                            MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
> -                                            xlen - 1 - R_VTYPE_RESERVED_SHIFT);


To preserve the existing behavior I believe you want to negate the conditional:

> +    if (!riscv_cpu_cfg(env)->ext_zvfbfa) {
> +        reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
> +                                           xlen - 1 - R_VTYPE_RESERVED_SHIFT);
> +    } else {
> +        reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_ALTFMT_SHIFT,
> +                                           xlen - 1 - R_VTYPE_ALTFMT_SHIFT);
> +    }


i.e. return the existing 'reserved' val if the new extension is absent, otherwise return
the new val.


Thanks,

Daniel


> +
> +    return reserved;
> +}
> +
>   target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>                               target_ulong s2, target_ulong x0)
>   {
> @@ -41,12 +57,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>       uint64_t vlmul = FIELD_EX64(s2, VTYPE, VLMUL);
>       uint8_t vsew = FIELD_EX64(s2, VTYPE, VSEW);
>       uint16_t sew = 8 << vsew;
> -    uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
> +    uint8_t altfmt = FIELD_EX64(s2, VTYPE, ALTFMT);
>       int xlen = riscv_cpu_xlen(env);
>       bool vill = (s2 >> (xlen - 1)) & 0x1;
> -    target_ulong reserved = s2 &
> -                            MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
> -                                            xlen - 1 - R_VTYPE_RESERVED_SHIFT);
>       uint16_t vlen = cpu->cfg.vlenb << 3;
>       int8_t lmul;
>   
> @@ -63,7 +76,13 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>           }
>       }
>   
> -    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
> +    if (cpu->cfg.ext_zvfbfa) {
> +        if (altfmt == 1 && vsew >= MO_32) {
> +            vill = true;
> +        }
> +    }
> +
> +    if ((sew > cpu->cfg.elen) || vill || (vtype_reserved(env, s2) != 0)) {
>           /* only set vill bit. */
>           env->vill = 1;
>           env->vtype = 0;



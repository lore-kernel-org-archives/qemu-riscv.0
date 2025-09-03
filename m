Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84707CA0FF2
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 13:30:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utnYN-0007pc-U1; Wed, 03 Sep 2025 09:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utnYM-0007om-4T
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:29:34 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utnYG-0001o2-7l
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:29:33 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afec56519c8so1107781966b.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 06:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756906165; x=1757510965; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rpHPu9J6GDNgbxNG2nQVVjMbkf/TXAQEqUgx8DM4NIA=;
 b=Gji9lybdOVC2GFIt747Mukl/0OXaTFJSz+nhotsXiC3pZiRae241tGczaLUISypFT8
 hyTunungYlC8YQZ05j+XC1n+gdqB8qxTfrmQHzYT9NB2T55UAYOlY8yBu2hhnMFzBPug
 IgQSGFXRP4X5EDgoZx4ryY+9fJDXjMN0+0njRWRQ++IN121VkJ4FmefcMImCVEOlJ4Zi
 aDJY5SeZcs45bvQ0j73gGOWjfqLF1hLBi4iOeme1VHqVql67q2ihtv/pM7PxrDPIyvZz
 Rk3JdN/MeA69uffN2PsQqH4p6FWsUk4U+aLB2GXt8PAZxAdfXpPr++O+meum9hvk+4TE
 0vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756906165; x=1757510965;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rpHPu9J6GDNgbxNG2nQVVjMbkf/TXAQEqUgx8DM4NIA=;
 b=K6OprNpPC1tiy1R14Myw+axzOhYTxmFM/8r3GgylxQSZe/1n4oSbReHo9oqeBkba2I
 l0awIOPxSqHbJzyzYhYU/Bjh3YsPAjg7aKqb98FsBhgzeJbieSrqtJSEShU4WmpgxpcX
 fjZHaQ8aUmv07rrsjJLwMvnLjdA9dosE/oa+ae1ji5/2Ej5uq6Ywy7v0d+IANw8ckkg0
 Pkte8Y3pt4hcz67n/jY6mLsbCvxQSrPA7ecNXGhrCwnaxyuQ4Bzsd7TM5v5NXuAz9oRv
 cQxI1DGQ6qmiTp+HsLOHDFgqpULI9OFjxEHYAO8ByLdkSrSAd5bOtycMaOdl902FSujv
 SdzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbSo98b/BnIzGmjcTHfHEHINzZsXVmQRRUCRQt8ouW0yTmosIXexGrKRyfqhQCsurLJn9KQvHNDGcl@nongnu.org
X-Gm-Message-State: AOJu0YzkwCZFcIOe9GI4d0PISgmvlOOfpbDIu8YWx30jQELe9apsDCs+
 7bOMFxQBGzs4vVNRNcSdTGerZltWIkOycanYddnLWIoEINbVdnYxye7QnIHjC3iNm4s=
X-Gm-Gg: ASbGnctm/B+fGfgPMop5EcjU1HQBAaNozDaftygHcz4Ks+LccfwbTSKrgHiz/lcG4xK
 PgyDFWZoTyXwN/sVIfbF5sz1RsGGY5zbfsiENDTGFFVOhYxngBpsqBl2cMqDxooZ1I+XTDUlQoj
 jI3O9CVntELhHqDw937wGmcBz5fzamwrzyZTmMuwaaiYPGtJatrQunMOFZ1zdYAYtkOeSCFcfZy
 OUTDCp7ewKyBbQYIpTLR4aMpZC80zety4vieUaXaEk9VKhrNRuww6GJWqTnzQmw4FqIuhe3uvEi
 8WGxEeScjc4e5d7YZO0/lh7OSD+6DHHTqF+jvWzi1UYnIucghUouQlVLTU+dD8Ctyo+P3tpfuWv
 gHoKR/A3cVVNtHjmn+r80uGqZ9MLULe/sBrow/xTIr5zpoMoT/pSPvQpeqb6q51z/a4HJiBTawq
 EyANngMQ==
X-Google-Smtp-Source: AGHT+IEkVxWNoV856q2bOmFFdaiy8HKx9k1ZiesXuQLKg87KaUHSd90wlJR2rqWNBdlsuyDPcyX5Ig==
X-Received: by 2002:a17:907:9444:b0:b04:53cc:4400 with SMTP id
 a640c23a62f3a-b0453cc4661mr684654666b.27.1756906164695; 
 Wed, 03 Sep 2025 06:29:24 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04093c9161sm1038073166b.54.2025.09.03.06.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 06:29:24 -0700 (PDT)
Message-ID: <e4ce9ca2-9be7-4486-a1b5-1c5939f26989@linaro.org>
Date: Wed, 3 Sep 2025 15:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/3] target/riscv: rvv: Add Zvqdotq support
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250903130125.1701363-1-max.chou@sifive.com>
 <20250903130125.1701363-3-max.chou@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903130125.1701363-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
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

On 9/3/25 15:01, Max Chou wrote:
> +#define OPMVX_VQDOTQ(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2)          \
> +static void do_##NAME(void *vd, target_long s1, void *vs2, int i)       \
> +{                                                                       \
> +    int idx;                                                            \
> +    T1 r1;                                                              \
> +    T2 r2;                                                              \
> +    TX1 *r1_buf = (TX1 *)&s1;                                           \
> +    TX2 *r2_buf = (TX2 *)vs2 + HD(i);                                   \
> +    TD acc = ((TD *)vd)[HD(i)];                                         \
> +                                                                        \
> +    for (idx = 0; idx < 4; ++idx) {                                     \
> +        r1 = *((T1 *)r1_buf + HS1(idx));                                \
> +        r2 = *((T2 *)r2_buf + HS2(idx));                                \
> +        acc += r1 * r2;                                                 \

One could argue for a missing widening cast to TD here.  You got away with it because the 
only uses happen to have small inputs and "int" sized outputs, so C arithmetic promotion 
worked for you.

You can move the variable declarations into the loop.


r~


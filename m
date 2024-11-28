Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B7AD690FC
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 11:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGd71-0002RR-Tr; Thu, 28 Nov 2024 06:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tGd70-0002QP-Gl
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 06:55:10 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tGd6y-0006Ap-Cz
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 06:55:09 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-212348d391cso5597835ad.2
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 03:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1732794905; x=1733399705; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vUlXdWcY58YHtJhqM5y/QD6lTFQ8Y6GokEGMR+2F98g=;
 b=f7p328PZ91NrQWUhX/nolMMHNemzrKMadUJGU81rpYwLACNyfN+9rsEF9F7M3Qakae
 PVN/tRfT7C5uUf63dT+FnCdbSJSne5KVQmOUiIsfyNT3Nor+n58n2EuJ5LvjSECmtgWl
 6tkAF6WAlF1JVXrsBJQM/GQ/TxhHkgnVlkGZriZPvNdWtoIM7RCfDY3XguMAm5Mv0Vc7
 8SlEuPVD9Y2D2OWTr2Vh98RLkAM285HXxB/aOc6IhSNw69LUegT7jrz2x9E33acCpFBv
 Lmd5fF3QXiPRdInuPNVswzRzMm16X5B2WZz6C7/qvVYGbDymb9B+H2r4LKP8mEe913CL
 JlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732794905; x=1733399705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vUlXdWcY58YHtJhqM5y/QD6lTFQ8Y6GokEGMR+2F98g=;
 b=gLlRtkEvXf+vFQT0RmwUZJazSHjtarg+2ZFxURTj+dAg4EpEk/tpcIEaNQVBhbuKTM
 NBFPlQEeYvpNyMzXAaxz6jLVvFIdcUWM4DbEjZnF/kg+1bOGUtKmZJ7HSezYSE8E0uER
 7fA3XcJPZ/6bOlnRTMJFMTf/90L4UUM2ggZSTKYhoi15wChdUKlbRmFCoR24pFOlTcbq
 CiYLw57aoP1SKqHyHfIoTWRXgjxE3RRlkQJTFC30BeCW1rg3kG9T6NgG5nG+I8+aWc7W
 N5lNm0YCSXriC4JnSfS2jwBdk3npybv4S/aXdER1i3DYRAf3MA8Wl15VyI1yTrAtJ1oM
 5GjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmvPb1eUqXznpTDUGABe75rZHTP7otOOusLwSbj/utknTMzDQcqNDDSnfJjNBhj+arDwCqdW0eczcY@nongnu.org
X-Gm-Message-State: AOJu0Yx8rVw2Ga6NN499YC3vPG53/5EMS7ggGSAccmXA7QmRyX6dATOL
 IcZogYS8Mu71GAqL4A/SkZjB8R3WU7C3gyDLP1D13tkKkTpb0IkTjjM25rSVUV0=
X-Gm-Gg: ASbGncsmz6At/+ggdXjiwD9dtyzqZHwZbxkZlQ/mhbgyir4RkyBnhBnFXTK4aCIg2jm
 h/jA6VrW5GrbdeyUgzNZXWgqGJ9YDYa8nci+0WfurGZUkf3hNJ8VulwVfWuOLJfzA5xfQgqIUuQ
 p/QiyJkCGMAf8qE/6nstGOOd0yUeY5YZ1nnbLzYb0+cxNIKyKlgvKrLb9PWhstvocehjQNwvYmS
 hDQoJIB4nsB5oz8HTbZijrkri5rOdT/2Xfjp8uLXrKjUOSumYZU9XsTsc5uTf0=
X-Google-Smtp-Source: AGHT+IHlgWhLUHCpWmYXVBRxaWVmzB7X3OFkJNC04TMrvikqr3s9YVEmcsW8Zujut9CpcI3MGEZMLA==
X-Received: by 2002:a17:902:f552:b0:20b:a6f5:2768 with SMTP id
 d9443c01a7336-215010873b1mr78841945ad.10.1732794905419; 
 Thu, 28 Nov 2024 03:55:05 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215218f522esm11826725ad.24.2024.11.28.03.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 03:55:05 -0800 (PST)
Message-ID: <9cbfaa84-6d6c-4702-837d-45b9d218f2e2@ventanamicro.com>
Date: Thu, 28 Nov 2024 08:55:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] target/riscv: Add properties for counter
 delegation ISA extensions
To: Atish Patra <atishp@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, palmer@dabbelt.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com,
 alistair.francis@wdc.com
References: <20241117-counter_delegation-v3-0-476d6f36e3c8@rivosinc.com>
 <20241117-counter_delegation-v3-5-476d6f36e3c8@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241117-counter_delegation-v3-5-476d6f36e3c8@rivosinc.com>
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



On 11/17/24 10:15 PM, Atish Patra wrote:
> This adds the properties for counter delegation ISA extensions
> (Smcdeleg/Ssccfg). Definitions of new registers and and implementation
> will come in the next set of patches.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c     | 2 ++
>   target/riscv/cpu_cfg.h | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 963f1f3af9ae..82edd28e2e1d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -184,11 +184,13 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>       ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(smcdeleg, PRIV_VERSION_1_13_0, ext_smcdeleg),
>       ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
>       ISA_EXT_DATA_ENTRY(smcsrind, PRIV_VERSION_1_13_0, ext_smcsrind),
>       ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
> +    ISA_EXT_DATA_ENTRY(ssccfg, PRIV_VERSION_1_13_0, ext_ssccfg),
>       ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
>       ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
>       ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 8b974255f6fb..ae2b019703fe 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -78,6 +78,8 @@ struct RISCVCPUConfig {
>       bool ext_ztso;
>       bool ext_smstateen;
>       bool ext_sstc;
> +    bool ext_smcdeleg;
> +    bool ext_ssccfg;
>       bool ext_smcntrpmf;
>       bool ext_smcsrind;
>       bool ext_sscsrind;
> 



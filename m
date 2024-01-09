Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F808C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 18:38:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNGz2-0005Go-Vn; Tue, 09 Jan 2024 13:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNGz0-0005GP-Qj
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 13:37:51 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNGyy-0007yR-Kp
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 13:37:50 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d3f2985425so15509325ad.3
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 10:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704825466; x=1705430266; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PUamx8+oXiPtb8rWFlF2oRhGrqJjoe9Jh8kcIMPZyeU=;
 b=IhBqoDgm/JZGZfNv02OTzvI2a1o1vEqkQmuRjBjjYYrS0jAoVNxdIFnnJU0tkEyax7
 +tj0SjM4G5rPLgXXuRR7sVBiuRBzwDUoB6+x3uPH6NaLVajPdq8RUZM/7cOkm3bvH0KS
 nk9mF1eeRq2XIX5/gEX6SLkjsJ8o84/M19SwYuZ0rtPOxCXuaIj30qA/oZXTjrd3bAWD
 VMlvG+qhq3RaJ8jop47kJdBnFXi+IrZ1IkGZDRnJNX+f6Najj+qs+G9CQkhfvmX4TYm1
 5NsgpSe1S+5aWvHPjAp1fwPZvHRjz6WRwbSfobX2j/fX7R6UOUCqGcuTCs/0lyL8ROIi
 Z9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704825466; x=1705430266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PUamx8+oXiPtb8rWFlF2oRhGrqJjoe9Jh8kcIMPZyeU=;
 b=POfY80kVumBVW6aTZ8exFDu/NqvUEwbCZEVyD6sby3gBvwXMMqzT49wZR2EsMeztt0
 da0cO0rT/zegu4Bwt5ly0VSuvfAnpZWWZs05kDC/w+xwhgb6s7RmxkFhUjywMromHRsh
 sZUB50lSXAqvr5s3RaBn5EvMh4F9HvQPYxvMREuifeiNf8JPjNVckbvpKuUr5NchJBQF
 jYwRenE3DEQIwqxiK30wDvCIXyFm8SBFF5qrRPUz1Z7p1XbG/03XVz5C4vImqIQGrhJo
 ZDMSRFtbFDJ+ZtbQOWJehc7wxr5VmMyqss1qeeLRX56z8Fspl1OLm+TYyny63CyBaGlz
 z2uQ==
X-Gm-Message-State: AOJu0YwVcp9BLbEEG854HiDvOwqsGidjhwFMme+2aGKo/hJPP/RFbyCq
 nXANGGwNwhtRJA0v0UYPL78+fN+xu9yUBg==
X-Google-Smtp-Source: AGHT+IF23y6bRK8oVpx0BC8PeHIp2/Iu4rE/dytfw4+VflDp6lLwELeNdPso9x4cNTZED/JEBfxmAw==
X-Received: by 2002:a17:902:cec3:b0:1d5:8cf:110e with SMTP id
 d3-20020a170902cec300b001d508cf110emr3140242plg.88.1704825466197; 
 Tue, 09 Jan 2024 10:37:46 -0800 (PST)
Received: from [192.168.68.110] ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170902aa9500b001cf511aa772sm2111948plr.145.2024.01.09.10.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 10:37:45 -0800 (PST)
Message-ID: <348015c5-8a6f-4695-84a1-04856cd72325@ventanamicro.com>
Date: Tue, 9 Jan 2024 15:37:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] target/riscv: Add cycle & instret privilege mode
 filtering properties
To: Atish Patra <atishp@rivosinc.com>
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, kaiwenxue1@gmail.com
References: <20240109002554.646572-1-atishp@rivosinc.com>
 <20240109002554.646572-3-atishp@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240109002554.646572-3-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 1/8/24 21:25, Atish Patra wrote:
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds the properties for ISA extension smcntrpmf. Patches
> implementing it will follow.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c     | 2 ++
>   target/riscv/cpu_cfg.h | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0cf07be..501ae560ec29 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -144,6 +144,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>       ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
>       ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
> @@ -1296,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
>   const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       /* Defaults for standard extensions */
>       MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> +    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
>       MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
>       MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
>       MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190b9..00c34fdd3209 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -72,6 +72,7 @@ struct RISCVCPUConfig {
>       bool ext_zihpm;
>       bool ext_smstateen;
>       bool ext_sstc;
> +    bool ext_smcntrpmf;
>       bool ext_svadu;
>       bool ext_svinval;
>       bool ext_svnapot;


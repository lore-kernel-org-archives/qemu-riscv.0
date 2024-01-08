Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CD7C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 18:10:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMu4s-0004OJ-IV; Mon, 08 Jan 2024 13:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMu4p-0004Ni-1h
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 13:10:20 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMu4l-0002rh-VA
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 13:10:18 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-598704b5f5dso213629eaf.3
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 10:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704737414; x=1705342214; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NqTRpawr/am+wzndhUyeJTFUhtaRDugLW7g85/tKpaE=;
 b=SOd3gAg+6rApXWf+FNWCqnTIfhyPdV8Kqn77mv3C40e4weFyWwkYoIKXhF3f3ITC47
 511WTh0clA76jodc3wtenk8ADcG8TNCa/gYKzNiI7ZrWF9i27YqKg9mW1a+yW+BIHnui
 YLIDpCvY2UyzIN6e2AI4HSD3+icvSSKiQuvnHCjPFOsHS6JCeL3T19z2KCaUdKoOYMbc
 XeQd6c+bqGDPq0x+llNugTt24FBYhWLWnB/RxsnktraC7T7aWV3biU/3EeR2I0vIInyg
 lWnAkDHGUdmtIW/4Tk/7hMPSv+WjyX5oa3/ucZVsafUhPu20715+FojTk7iN4HgXZf4g
 6exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704737414; x=1705342214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NqTRpawr/am+wzndhUyeJTFUhtaRDugLW7g85/tKpaE=;
 b=RCsMZw5ROaM0JrgGaCnlmDBloUGXnqSZqmwKEP+2GbemjCta3dcon6oZi9pDqvh1ou
 BEAHvaCL0nObF1E3VzHZQAgN9WBUMZw0Wxv9c9TRFpDzysUVYmZlMZxs0NL30YBP+OvT
 zZE+oCh1lBuwTmhoE73o0oUXigsCED1LTZk6t0OI8X3dseWbtoRStkTPdmg9iSULbKUe
 hvERdMV+q6cD17vZWjgiOkvtJ/NshANZQGfzVHlW8gOfnsTq5joxgwS2mYPaf+5XwDbh
 /plEfy58/6uK4fzCBNDWgpmtrsjojIH1yMod2VNqDIEIFeEFX8DOVCpF79R1HNUtoCaQ
 mNJA==
X-Gm-Message-State: AOJu0Yx1VkH82A9qjRc9z5ZrnruKv/a54PTaZEYS7Y37PPFtBqUBFbt6
 Jn0WG+vOdwig6ZcVcdC2Hhc4PQeGJ/i/LQ==
X-Google-Smtp-Source: AGHT+IGYmk6sTxmEdjZwn9UxNmNYLMnCd6FNTH/xrbYBnFv8ddjdDWh+/qwT0SrlpDff5rooxXJl8Q==
X-Received: by 2002:a05:6358:3388:b0:174:fce5:6b87 with SMTP id
 i8-20020a056358338800b00174fce56b87mr3782543rwd.23.1704737414314; 
 Mon, 08 Jan 2024 10:10:14 -0800 (PST)
Received: from [192.168.68.110] ([189.79.22.11])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a634f17000000b005c67a388836sm146772pgb.62.2024.01.08.10.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 10:10:13 -0800 (PST)
Message-ID: <1a97eda9-480d-49f1-9fe5-a607ba08b818@ventanamicro.com>
Date: Mon, 8 Jan 2024 15:10:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] target/riscv: Add cycle & instret privilege mode
 filtering properties
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, kaiwenxue1@gmail.com
References: <20240105221327.176764-1-atishp@rivosinc.com>
 <20240105221327.176764-3-atishp@rivosinc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240105221327.176764-3-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
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



On 1/5/24 19:13, Atish Patra wrote:
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds the properties for ISA extension smcntrpmf. Patches
> implementing it will follow.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> ---
>   target/riscv/cpu.c     | 2 ++
>   target/riscv/cpu_cfg.h | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0cf07be..ea34ff2ae983 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -148,6 +148,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
>       ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
> +    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
>       ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
>       ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
>       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),

Sorry for not noticing this in the previous version. I believe we want the "smcntrpmf"
entry to be right after "smaia" because the isa_edata_arr[] ordering matters when
building the riscv,isa string in riscv_isa_string_ext().


Thanks,

Daniel

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


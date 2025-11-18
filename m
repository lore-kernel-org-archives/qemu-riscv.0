Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E89CCED619
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 11:21:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLJlm-0006Vu-M1; Tue, 18 Nov 2025 06:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vLJll-0006Ve-UX
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 06:21:09 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vLJlk-00047d-7I
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 06:21:09 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7bb710d1d1dso1543828b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Nov 2025 03:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1763464867; x=1764069667; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c6DRec8fdGjRzteDy7Hnt3oeE4n+jiAmw3Ygqc8a5ag=;
 b=DPwBelYFELdYxZkouaTvtLKgGvRrhaVzYahhRrbvvJLyUe6+bi+1wmZEStMdkzjf53
 vMV6JDQ5j9MtF5MHuqzrTM37BK0mLCumyXyl9K+mA4uKK8Qn/DT9cq4RVOwBJPAaoiVo
 5QW5U2UU5i4KvthzlW8AOXM10uxMRMM4ySeHk8fICxgyLsGNrgNMooRDb7T148oUREUF
 If3qr3fu4Whd3V1k8nyDJOTohKVmKULdmhaa2Nrnui3BZC4TCI2Ooj//sOIiwfuh54+M
 xEyS2ixxhSc9hwj6ukejgS1N8RoFpDtm8leflm+8ACnlzTgGPfI4GFf06qwQ1uWoJ2gn
 58+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763464867; x=1764069667;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c6DRec8fdGjRzteDy7Hnt3oeE4n+jiAmw3Ygqc8a5ag=;
 b=uPDS19IXoILz36SGG5oFGYJvNB2AH4LpI/kVTKGEPAfcdtJc3IJc1Yf7hjyaYXCfK1
 xWKdV9mQOBgOqzm9IHPdNHA91TU+qumWiaaYYZ3QzQVztmOsG1a+fNRrQeUCTUnwMoi/
 viP2zQm/WM/vJqRURkSGrQRGOvrqX50gIfWsHeDEScOG5U/1yRGqMKzyn6ZwmeVH9afV
 x8m1YrIpDZUCWCRMIfAvDMJLIZwqkjKLb/YCOG730PEm5oQ+T6ZSC7EBnCCju+FEcKil
 JyO8Kxja7rBwLEcEln5df/HdaGTmdMQz6JZ9hnFaA3BxwPnpdwDTPUSEH/GCp43/2GRL
 9Icw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHBcXM9FLgm7WseETxgYkwOUo5kigHtbtDNZYr80f9+MX6vLnJ2zYe/cvg7zJ3c6PhhVpRGXx57h5C@nongnu.org
X-Gm-Message-State: AOJu0Yz30J7P1IWy03lEwoetskY3dV9yxCOeVPIT3wIcrSoh5I66TLY7
 g1NDTfYG5L5z8roAvNlw+eB9AIAj8Ilh4uULE8RUVym10k2ttORVx1w+a3lK6EbkJGo=
X-Gm-Gg: ASbGncsZyDH4DkCpigWrY99SODCj4qacmhxYUJP2+zCkmYepJsrdozVW7egRPMQytvs
 M+QDgZ95W8JtuMYHFdFEkGYq5OzV/l7argKqKVuaxKkbXpo3BBNZa+g5slReJ0UDh8p3JwlmTIH
 e5xGpMZfjDUv6g40JW1D93oFklxj7EW1bQwk69XIfrQQoLmJLoyBH06cNU9s7DqP8iRqAGAcA9x
 m1IRT/yQX2nLJk6+swMud9TJOHM3S4GtzH7t2kyG7XBJ5yFcW3CtoZzhkUA02+/HQGZhwtj7Q5Q
 XeFAAfnfdluKfcJVYaG4PhOM71LQv4lf0ilJsD6R+YxKJoaGa6CJsY0eQ1zJE6+0WAiJPRnAfcF
 Q6MzWkMSzV5H4TcFX2PNo5v1ST8yolmjrIIjREpP5epd0Kx709XmEuhX2sg+JLwcKCgJDaelv05
 edbphpx5k7fAlv0tSe9QZmTNinPPmVJAydTV7X
X-Google-Smtp-Source: AGHT+IE94Ms4eTDDaazDyK/jBWWNL+ppF0vOaUUWBynPdc7YrC54bfswDDpv8S253kuOC1X6UFR7vA==
X-Received: by 2002:a05:701b:270d:b0:11b:98e8:6274 with SMTP id
 a92af1059eb24-11b98e8669fmr3331485c88.13.1763464866668; 
 Tue, 18 Nov 2025 03:21:06 -0800 (PST)
Received: from [192.168.68.110] ([191.202.237.26])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b06088625sm60738523c88.8.2025.11.18.03.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 03:21:06 -0800 (PST)
Message-ID: <abb280db-acce-436d-b240-3f53eb12e8c0@ventanamicro.com>
Date: Tue, 18 Nov 2025 08:21:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/riscv: Fix pointer masking PMM field selection
 logic
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20251118105936.2839054-1-frank.chang@sifive.com>
 <20251118105936.2839054-3-frank.chang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251118105936.2839054-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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



On 11/18/25 7:59 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> mstatus.MPV only records the previous virtualization state, and does not
> affect pointer masking according to the Zjpm specification.
> 
> This patch rewrites riscv_pm_get_pmm() to follow the architectural
> definition of Smmpm, Smnpm, and Ssnpm.
> 
> The resulting PMM source for each mode is summarized below:
> 
>    * Smmpm + Smnpm + Ssnpm:
>        M-mode:  mseccfg.PMM
>        S-mode:  menvcfg.PMM
>        U-mode:  senvcfg.PMM
>        VS-mode: henvcfg.PMM
>        VU-mode: senvcfg.PMM
> 
>    * Smmpm + Smnpm (RVS implemented):
>        M-mode:  mseccfg.PMM
>        S-mode:  menvcfg.PMM
>        U/VS/VU: disabled (Ssnpm not present)
> 
>    * Smmpm + Smnpm (RVS not implemented):
>        M-mode:  mseccfg.PMM
>        U-mode:  menvcfg.PMM
>        S/VS/VU: disabled (no S-mode)
> 
>    * Smmpm only:
>        M-mode:  mseccfg.PMM
>        Other existing modes: pointer masking disabled
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_helper.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index dd6c861a90e..112093012b0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -154,22 +154,30 @@ RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
>           }
>           break;
>       case PRV_S:
> -        if (riscv_cpu_cfg(env)->ext_smnpm) {
> -            if (get_field(env->mstatus, MSTATUS_MPV)) {
> -                return get_field(env->henvcfg, HENVCFG_PMM);
> -            } else {
> +        if (!env->virt_enabled) {
> +            if (riscv_cpu_cfg(env)->ext_smnpm) {
>                   return get_field(env->menvcfg, MENVCFG_PMM);
>               }
> +        } else {
> +            if (riscv_cpu_cfg(env)->ext_ssnpm) {
> +                return get_field(env->henvcfg, HENVCFG_PMM);
> +            }
>           }
>           break;
>       case PRV_U:
> -        if (riscv_has_ext(env, RVS)) {
> +        if (!env->virt_enabled) {
>               if (riscv_cpu_cfg(env)->ext_ssnpm) {
>                   return get_field(env->senvcfg, SENVCFG_PMM);
>               }
> -        } else {
> +
>               if (riscv_cpu_cfg(env)->ext_smnpm) {
> -                return get_field(env->menvcfg, MENVCFG_PMM);
> +                if (!riscv_has_ext(env, RVS)) {
> +                    return get_field(env->menvcfg, MENVCFG_PMM);
> +                }
> +            }
> +        } else {
> +            if (riscv_cpu_cfg(env)->ext_ssnpm) {
> +                return get_field(env->senvcfg, SENVCFG_PMM);
>               }
>           }
>           break;



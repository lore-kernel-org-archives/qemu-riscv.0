Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C14FC77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 14:48:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uWylI-0005Fn-Ug; Wed, 02 Jul 2025 10:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uWylD-0005Be-Pz
 for qemu-riscv@nongnu.org; Wed, 02 Jul 2025 10:48:32 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uWyl8-0008D4-Ng
 for qemu-riscv@nongnu.org; Wed, 02 Jul 2025 10:48:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-748e378ba4fso9230597b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Jul 2025 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1751467704; x=1752072504; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lq67aiCzcuu5k/VgqIeecbselQ7vbtkCerT3mPDHeEA=;
 b=TOk1tK3Gm0Xuh+gcdIVGm9MaNxRZfhgtGYq96LwwuSVZ0tAJExWpTkcKaYcSaqH+Tn
 aEkhNNi+rEAqeMQXtz2TNbLQauJ2YgzA6FFlqKPSNIKZbYR2+BgMWbjHk18eHaGOW69e
 fHt06B0PmAcTExMpThUciFOqZfUz7yz4EqjCY+QHhKEXztZmJPvZiOy12TPSTKRciH3+
 S3u6dRVS+YrWWf/gzUMKH0uW37tbqHnryjMTFKZUqC/MowEBzpYtrzEKkM6hSqqFidP9
 jgXTg52n4WIHP4iDckjgRmGlZFFWVoeGCa190zO9P+laqEvH6P21QwOtewlx5vXiiDu4
 CxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751467704; x=1752072504;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lq67aiCzcuu5k/VgqIeecbselQ7vbtkCerT3mPDHeEA=;
 b=VNnuW7kAqeejrH8frP4nG7/2SpA75XLwAr3kh9oezQ12Ggjk4IrkJKhvbTPyNEGA3K
 yekb4rUTnKjdtpAmlRc1mnUOmpo/NGCaMtmKkL4PVKLkbawf7sjrUNsn0nGTrL4htFC4
 O8fnMzAMVBUdPLOI2G2EXQlPOJJ9K3Ii8qnKE5id1oXoYL+jE3H4xtxwluIdbonbW9os
 K1JGeo6f5xTqfXD2Mc7KEPywMHmnc3cV2Jg6Zo/jClSudUFbTsxvs1Vmk1KRydDmA0yg
 L86peT73eAHPHVPPdTRGcQCP3ncWQP8NwcGsrErrUujgUUWuNb6dGqvMQIpZ76rDiD0C
 UWOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUet/Hh2sd+XzaRK3EUYBxrF6M7X+PIE8xhN8mh+sdDCFb0t4ksZfkXCgrC5MEPfxJhPA1YQcCshcwH@nongnu.org
X-Gm-Message-State: AOJu0YwdQyUo2hk/RGPZ5jgH1r03tkFJYyerDDSQevr7VW5caUQLMHI3
 S3nagpOwknTQsZHaMkLLaYsNnFU+YNHL7eOUk7onxmwMZPS/0hTB8ZmOBsB4gYdc4Ic=
X-Gm-Gg: ASbGncseF4anM29hLQEUjbO6e1RODGFl0Mc91s4rEqeUQzjyJHciVRk5crBpT+1T0CX
 p8F4suQ5sBJ86VYoosZF/10supDNll/F0czoC2iuO51IGkgV5foFPgOmpqkYl+Ik2+EXqUGnlVt
 Gke39nhpSTAxfeq/cZXwiUTD195wLdVFOpZvotzXNPPqUNAoWYSfG/owTaqg0qbxv/KzhFBVuGT
 Fc/d73LGWlNYgFqmi7mY7VBFvlsUbwBaixQhfx12DVaGt0iL0d71/aw7zhVt0ba+vqGAI9GiRtj
 rDBTC6Om6DyvXl0DawqW1W0NnI2+oXa1giPhN3ZvSexJOv+kZg0CAXVGN7aJPnxDrN115E1h/oP
 74A==
X-Google-Smtp-Source: AGHT+IGBdFU+0coRaMm23rRDExu8NQmo2F6PFihVchRfmcYyUrYszG50uODXP8xwIOIfH3DBbmsyKQ==
X-Received: by 2002:a05:6a21:7a47:b0:220:103c:436c with SMTP id
 adf61e73a8af0-222d7e83875mr5682499637.24.1751467704053; 
 Wed, 02 Jul 2025 07:48:24 -0700 (PDT)
Received: from [192.168.68.110] ([189.110.107.157])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e300468esm13343868a12.7.2025.07.02.07.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:48:23 -0700 (PDT)
Message-ID: <fdffc8af-897c-4f2d-a046-2b6c2bc370c4@ventanamicro.com>
Date: Wed, 2 Jul 2025 11:48:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: rvv: Minimum VLEN needs to respect V/Zve
 extensions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250627132156.440214-1-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250627132156.440214-1-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



On 6/27/25 10:21 AM, Max Chou wrote:
> According to the RISC-V instruction set manual, the minimum VLEN needs
> to respect the following extensions:
> 
>    Extension     Minimum VLEN
> * V             128
> * Zve64[d|f|x]   64
> * Zve32[f|x]     32
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/tcg/tcg-cpu.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 163e7ce3642..187534009dd 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -416,12 +416,21 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
>   static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>                                    Error **errp)
>   {
> +    uint32_t min_vlen;
>       uint32_t vlen = cfg->vlenb << 3;
>   
> -    if (vlen > RV_VLEN_MAX || vlen < 128) {
> +    if (riscv_has_ext(env, RVV)) {
> +        min_vlen = 128;
> +    } else if (cfg->ext_zve64x) {
> +        min_vlen = 64;
> +    } else if (cfg->ext_zve32x) {
> +        min_vlen = 32;
> +    }

At this moment this is how we're calling riscv_cpu_validate_v():

     if (riscv_has_ext(env, RVV)) {
         riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
         }
     }


riscv_has_ext(env, RVV) is always true inside the function. The code above will
always result in min_vlen = 128 because of the 'else if' chaining.

IIUC the idea of the patch, what you want is something like:

> +    uint32_t min_vlen = 128;
>       uint32_t vlen = cfg->vlenb << 3;
>   
> -    if (vlen > RV_VLEN_MAX || vlen < 128) {
> +    if (cfg->ext_zve64x) {
> +        min_vlen = 64;
> +    } else if (cfg->ext_zve32x) {
> +        min_vlen = 32;
> +    }

I.e. init min_vlen to 128 (since RVV is always true) and then change it according to
zve64x and zve32x.


Thanks,

Daniel



> +
> +    if (vlen > RV_VLEN_MAX || vlen < min_vlen) {
>           error_setg(errp,
>                      "Vector extension implementation only supports VLEN "
> -                   "in the range [128, %d]", RV_VLEN_MAX);
> +                   "in the range [%d, %d]", min_vlen, RV_VLEN_MAX);
>           return;
>       }
>   



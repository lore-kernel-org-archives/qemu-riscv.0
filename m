Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD77CC2BB3F
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 19:13:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r59hT-0000v7-9w; Mon, 20 Nov 2023 14:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r59hQ-0000us-Cr
 for qemu-riscv@nongnu.org; Mon, 20 Nov 2023 14:12:49 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r59hK-0000iB-Lw
 for qemu-riscv@nongnu.org; Mon, 20 Nov 2023 14:12:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1ccbb7f79cdso34455495ad.3
 for <qemu-riscv@nongnu.org>; Mon, 20 Nov 2023 11:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700507561; x=1701112361; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WG7sKAT5bZKAlAdYxFFD1AJxwxglN9u5klG9y98XZZc=;
 b=oaZSV4OkAbWT0MxLEwVg3XQzHcisqOP1W1TaCgUwkAHJmnt8w36q5+VPeMqlv9l+N9
 cyjI2yy0fKwktg9egvb54eK3AM8qvYjSL41BwuLCXxq2zIJD0ZhDUl5414Zt/vdlSDfv
 /a/Htfqm91kBkqd4NVWEJJLjNr0Kspvjm7Gj+zENskOiOa9xNdoigcQkL1WOUR2swquP
 hMXvt5CAmXnxPP6/VDbiZ7Q6U+GL8F874/GCSSicaeRdpGkBSwu0h2Hgu1r/4h7Fv0/+
 UXnparMlyH4jzeFLZxvleKXbuWNP60hY6EZ+mQJQT4G8sbv9gwY6Nkov5/0jgFsBcYAd
 dxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700507561; x=1701112361;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WG7sKAT5bZKAlAdYxFFD1AJxwxglN9u5klG9y98XZZc=;
 b=GF2age8gsVR5WiptSCkAsAZXKhDOncVL3SQTpHexOCZuAamcp9vckDo7P09mekMxgu
 3TcvMa/kPgADH4PYFc3Tb/4IsVXxO/nn1fmb9i9Vh04VyrBxO8UWao4IVygzb67wS0U8
 S+Ont5bfIYmowmXskliDO+pPwwCWQ9x70hn5l8M3qmYBlKSho7hcLf4wvrOpg6tMDy09
 y+NR/4eG/iNUNRZSZtRJv5TCHs1g9dnw1SkMsurY39qpsbwpF5OMBACS7O3wgcIv1iTZ
 QNj/JGxlbeAGyyD77gKmVYoMFZ7eJuCvZFgAIfHQginBcRhkR9z3PaQEk76+gUILClYx
 lEmw==
X-Gm-Message-State: AOJu0Yx2m0mgpNIu9TfHy2Zj1Kf0j4i1ySfh//R63fyFSo6xL2NIMJ5j
 uGOvNbW/sm98f2tj8Lpy/N1wEA==
X-Google-Smtp-Source: AGHT+IFVZn9yd2V6iEluIRrkLKpVnhJEZb+FAFdy+5d12Zv/K+HHIY/L2JFT5xYHfMM8e51H0pvt3g==
X-Received: by 2002:a17:903:11ce:b0:1cc:bf63:930 with SMTP id
 q14-20020a17090311ce00b001ccbf630930mr8313264plh.28.1700507560779; 
 Mon, 20 Nov 2023 11:12:40 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.119])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a170902900200b001cc3c521affsm6404309plp.300.2023.11.20.11.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 11:12:40 -0800 (PST)
Message-ID: <639ab0f1-4e5b-4bfb-aad4-c6a1e19a9928@ventanamicro.com>
Date: Mon, 20 Nov 2023 16:12:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv/cpu_helper.c: Invalid exception on MMU
 translation stage
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20231120120609.37960-1-ivan.klokov@syntacore.com>
 <20231120120609.37960-2-ivan.klokov@syntacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231120120609.37960-2-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



On 11/20/23 09:06, Ivan Klokov wrote:
> According to RISCV priveleged spec sect. 5.3.2 Virtual Address Translation Process

s/priveleged/privileged

> access-fault exceptions may raise only after PMA/PMP check. Current implementation
> generates an acces-fault for mbare mode even if there were no PMA/PMP errors.

s/acces-fault/access-fault

> This patch removes the erroneous MMU mode check and generates an access-fault
> exception based on the pmp_violation flag only.


Please add

Fixes: 1448689c7b ("target/riscv: Allow specifying MMU stage")

And we can push this fix for 8.2.

> 
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_helper.c | 30 +++++++-----------------------
>   1 file changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b7af69de53..9ff0952e46 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1143,47 +1143,31 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>                                   bool two_stage_indirect)
>   {
>       CPUState *cs = env_cpu(env);
> -    int page_fault_exceptions, vm;
> -    uint64_t stap_mode;
> -
> -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        stap_mode = SATP32_MODE;
> -    } else {
> -        stap_mode = SATP64_MODE;
> -    }
> -
> -    if (first_stage) {
> -        vm = get_field(env->satp, stap_mode);
> -    } else {
> -        vm = get_field(env->hgatp, stap_mode);
> -    }
> -
> -    page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;
>   
>       switch (access_type) {
>       case MMU_INST_FETCH:
>           if (env->virt_enabled && !first_stage) {
>               cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
>           } else {
> -            cs->exception_index = page_fault_exceptions ?
> -                RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
> +            cs->exception_index = pmp_violation ?
> +                RISCV_EXCP_INST_ACCESS_FAULT : RISCV_EXCP_INST_PAGE_FAULT;
>           }
>           break;
>       case MMU_DATA_LOAD:
>           if (two_stage && !first_stage) {
>               cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
>           } else {
> -            cs->exception_index = page_fault_exceptions ?
> -                RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
> +            cs->exception_index = pmp_violation ?
> +                RISCV_EXCP_LOAD_ACCESS_FAULT : RISCV_EXCP_LOAD_PAGE_FAULT;
>           }
>           break;
>       case MMU_DATA_STORE:
>           if (two_stage && !first_stage) {
>               cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
>           } else {
> -            cs->exception_index = page_fault_exceptions ?
> -                RISCV_EXCP_STORE_PAGE_FAULT :
> -                RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> +            cs->exception_index = pmp_violation ?
> +                RISCV_EXCP_STORE_AMO_ACCESS_FAULT :
> +                RISCV_EXCP_STORE_PAGE_FAULT;
>           }
>           break;
>       default:


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3C2C4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 09:43:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s1NXY-0004ln-Tv; Mon, 29 Apr 2024 05:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s1NXW-0004ky-HT
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 05:43:14 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1s1NXU-0007zK-T2
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 05:43:14 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1eac92f7c74so31437825ad.3
 for <qemu-riscv@nongnu.org>; Mon, 29 Apr 2024 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1714383791; x=1714988591; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IKU+C84lncTLIQBF3C2rWBemvQGxB4c0ZoRwkqzmDMY=;
 b=fsUrRBALrUAboYCF9IZ4rAQYYL7gR/TzgiaDYh3vrxzMF52ALyq6F11SjpGz+UXjjA
 o3d4Qb0bjdNpuPorkxrhwYYWAS9smWIt4x6T7oCA6qcOqB+DHxT3zUzBtxBLmCI4vnqh
 S0zXKvZ1HP2okLs0FO/T+5D+ZJ67HZuAKyvlp48t4axS7avypwp0QFHCx8SPcPcnv1x1
 K4iKbd4r559MBXFobpa/acPOWB1e2OZooHgC6/jrKbqy3CxKsGyIMO0e+42TCw/yNgMF
 0N2WiE/sXg3GfyDtHVz6e2iwC4+8AhYd5skfYjQi4377oPi9OzeUdt8ovBe9FstesLn7
 DXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714383791; x=1714988591;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IKU+C84lncTLIQBF3C2rWBemvQGxB4c0ZoRwkqzmDMY=;
 b=DskqJlbFUQSnvVsD4br/jnWHjiOY3iDXuuUDiySFOciPbmBVSItqDfGOi4NL1jWuUB
 iY0dVdo1GZWVT/2WELILlg0IIwOPKxyp2QrvLKuLhy6Chd3M/ypzL6nG/WQFUtYuYUNz
 ncgXIz5YApcT1g5i5qo6HMp/p1Eg8smCfQGjSW65kAxJjeFNcLA4n4frj7K6PMnI5UEF
 IsdaCl+YGvt0AWaRR5aZdjf0134DeoSZWPIFMfFAapZw1sPCnjsQ0pkNfrb2Ve7+oy5P
 YHnCPyC+iQeXunGfIr4GWXC07xQSITTfLZhKJw6qeq59q+mIp8mSD5JX1qwN70LrHMBj
 /EbA==
X-Gm-Message-State: AOJu0YzKgSH9RR5BB2TkR9x93kEh3GR0Hs4TyVlngpzH9WK8Pvq7noo0
 SE7nYjQUzi57MMddlT7O2WXs+uo2kSWbCNfFTZZ1XO+Omy59NRruWObLdWwJufw=
X-Google-Smtp-Source: AGHT+IEHTI0Kc6rOaDRJGmVP9Ct+xTkBf/tWhg2T7IqtxJCzQBgLFxga/4wfyKgnIeW5FoiXDzV6tg==
X-Received: by 2002:a17:903:2342:b0:1eb:4c98:8b15 with SMTP id
 c2-20020a170903234200b001eb4c988b15mr7917563plh.61.1714383790902; 
 Mon, 29 Apr 2024 02:43:10 -0700 (PDT)
Received: from [192.168.68.110] ([187.11.154.208])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a1709028f9500b001dda32430b3sm19922213plo.89.2024.04.29.02.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 02:43:10 -0700 (PDT)
Message-ID: <ca275792-36c9-4ccd-b7b2-24d9fd837b24@ventanamicro.com>
Date: Mon, 29 Apr 2024 06:43:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv: do not set mtval2 for non guest-page
 faults
To: Alexei Filippov <alexei.filippov@syntacore.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20240413105929.7030-1-alexei.filippov@syntacore.com>
 <20240413105929.7030-2-alexei.filippov@syntacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240413105929.7030-2-alexei.filippov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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



On 4/13/24 07:59, Alexei Filippov wrote:
> Previous patch fixed the PMP priority in raise_mmu_exception() but we're still
> setting mtval2 incorrectly. In riscv_cpu_tlb_fill(), after pmp check in 2 stage
> translation part, mtval2 will be set in case of successes 2 stage translation but
> failed pmp check.
> 
> In this case we gonna set mtval2 via env->guest_phys_fault_addr in context of
> riscv_cpu_tlb_fill(), as this was a guest-page-fault, but it didn't and mtval2
> should be zero, according to RISCV privileged spec sect. 9.4.4: When a guest
> page-fault is taken into M-mode, mtval2 is written with either zero or guest
> physical address that faulted, shifted by 2 bits. *For other traps, mtval2
> is set to zero...*
> 
> Signed-off-by: Alexei Filippov <alexei.filippov@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 196166f8dd..89e659fe3a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1410,17 +1410,17 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                                 __func__, pa, ret, prot_pmp, tlb_size);
>   
>                   prot &= prot_pmp;
> -            }
> -
> -            if (ret != TRANSLATE_SUCCESS) {
> +            } else {
>                   /*
>                    * Guest physical address translation failed, this is a HS
>                    * level exception
>                    */
>                   first_stage_error = false;
> -                env->guest_phys_fault_addr = (im_address |
> -                                              (address &
> -                                               (TARGET_PAGE_SIZE - 1))) >> 2;
> +                if (ret != TRANSLATE_PMP_FAIL) {
> +                    env->guest_phys_fault_addr = (im_address |
> +                                                  (address &
> +                                                   (TARGET_PAGE_SIZE - 1))) >> 2;
> +                }
>               }
>           }
>       } else {


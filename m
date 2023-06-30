Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FE8EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 12:08:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFCuA-0004Tm-KU; Fri, 30 Jun 2023 08:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFCu9-0004TE-J3
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 08:07:13 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFCu8-0007FI-36
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 08:07:13 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1b078b34df5so1631097fac.2
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 05:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688126830; x=1690718830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dRVYLb+IbJB2JcEvOqtBywuZpCgxFlfKFkvCHcmDIg8=;
 b=ghP/qLXakOCCeEPop8PYCMJjl4ZLAszMTJsWj7mwVddFNo6hW7opAhwkIj3df9I3Ky
 dXwBPciwt0tRR3S74G6+tbeQo4lMYYFjgAWh0dFMf+MO79gMipFbZlHUV5KSZwC/Syer
 LZ/OmNPKnzFlKib6xwAxpf27xmTTjfSdUzOUZMNNH6WROhECmQhfkzEdVFHXWVdqhFWM
 EGAQQvz8q5uztePla2J15nLsmn+QbvmEoRgIt1IdjXWUBliM6FwpJmwhdzYVmPoMazOl
 GFyypzLdCVz8xi/sOTml3FZfk1jseGk6WZlFA2VCFkcqnIUvXZSBvhzha+pRqGuccZrH
 K6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688126830; x=1690718830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dRVYLb+IbJB2JcEvOqtBywuZpCgxFlfKFkvCHcmDIg8=;
 b=e9pAiCjDbCQkpEmCuUBLGob6xMJxqq6m5zPxuSmyoFpUk8Dpx0qckNGoUby+m1e45g
 gtBY8dovB0tODxBr7zh/rnha/wik1WAo8HYKBIynsscKP08SHWkPYpMc+/JBqfghzUmV
 5m72cG2LHdQCsiBq1s7HO/7uFfz/vSP50awyzhdlBxy0tNzVD9G2ZiA+LK6oo3X7Ju+T
 fmMvtz8kb0GXXzXI4vU33lc8MCBv95GBa/rGmqTkg6zoAWAGRcCpMAd4FV5RWlhhQfTj
 jvjaAQzhq/WO2iJHYaekqzznHMmue9LRr9Gm85t8PmCrGiUbrCwuqJl08sqgUXYdrqyi
 HHQw==
X-Gm-Message-State: AC+VfDyscdsnNuJS/3d1mR13IqZB4kxJkW03Qielho+a6YkhPs89hyKl
 7c0VjlZA1RYWKZGtxEwPEDoHdw==
X-Google-Smtp-Source: APBJJlG3PW507tTSLNrJMQFuNTLvoiwjM/DOzs8fJ1deDIdI1DBPM8l8cVlPgQaBrt0zBBl5JNVBFQ==
X-Received: by 2002:a05:6870:aa96:b0:19f:842:bfde with SMTP id
 gr22-20020a056870aa9600b0019f0842bfdemr3407930oab.36.1688126830540; 
 Fri, 30 Jun 2023 05:07:10 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 xm5-20020a0568709f8500b001b015338d52sm995356oab.3.2023.06.30.05.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 05:07:10 -0700 (PDT)
Message-ID: <cde4aa8b-9505-8774-41cc-3af135062bff@ventanamicro.com>
Date: Fri, 30 Jun 2023 09:07:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] target/riscv: Set the correct exception for implict
 G-stage translation fail
Content-Language: en-US
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230627074915.7686-1-jason.chien@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230627074915.7686-1-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 6/27/23 04:48, Jason Chien wrote:
> The privileged spec states:
> For a memory access made to support VS-stage address translation (such as
> to read/write a VS-level page table), permissions are checked as though
> for a load or store, not for the original access type. However, any
> exception is always reported for the original access type (instruction,
> load, or store/AMO).
> 
> The current implementation converts the access type to LOAD if implicit
> G-stage translation fails which results in only reporting "Load guest-page
> fault". This commit removes the convertion of access type, so the reported
> exception conforms to the spec.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_helper.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a944f25694..ff2a1469dc 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1277,7 +1277,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           if (ret == TRANSLATE_G_STAGE_FAIL) {
>               first_stage_error = false;
>               two_stage_indirect_error = true;
> -            access_type = MMU_DATA_LOAD;
>           }
>   
>           qemu_log_mask(CPU_LOG_MMU,


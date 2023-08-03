Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA56AEB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:42:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRZWr-0008Vz-ME; Thu, 03 Aug 2023 10:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qRZWl-0008VH-Og
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 10:42:12 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qRZWj-0005xC-AX
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 10:42:11 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a5ad6087a1so639146b6e.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Aug 2023 07:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691073728; x=1691678528;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K49iSYn5Duy2+itGeTtPLhzPb0sx7kGRYTiYoEIeH00=;
 b=H/tsQIz4h24gchAv2juXU390CUVEiolABI1VZb2oaFkJRFo1jGnAK+UK9lIVttqJIo
 T6hCF3zuJTf7So0gEbAkj5sppB8no31G+z2AAY/DG0qMsNdAXdctxFKzb1+r+o6GniP7
 5qV9n16KM//A8JDisyF5oJF6GssWlzwWdq5Ca2knkJlXfKAFdmtMHMVubWpqGdXrqJjI
 icc+8kIV6DuZ7qumNTG+lyroB1Izm8JnoE1af94lD/zv/UdjbNMl4yQDzjL5lY6rl7Zw
 aWM3yfPtWpJbQGEb0W+wH19NA9oj37gBxme7yctAKubf5ST+yqvY6uTMmLp7VLNtSBgo
 hAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691073728; x=1691678528;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K49iSYn5Duy2+itGeTtPLhzPb0sx7kGRYTiYoEIeH00=;
 b=S48yTfZpme6T3/DmoABhsVW/uGQTWMNf6u1e1iOaevN8xmsBm0mKg2QDCRJG7uIq4i
 3QlSwTbGwKoyRtWMpx+VXOBfgysiDiDGs9TKTIxsfMiY3od0wniGucr+hYTzulK5JBk1
 VK5/3qgMmEQEz9jJOlAkfGEX4YyJ4YAU2zn2jgdOs4PtedefYenXq7YLm/piQL6WY4Af
 M4KlZWBZbeDDHjuuclLTbPeekJKRKhRsbW0ghjuMkzGyGH8UsUVOPpTFCOS/5a0SIcQf
 o+Sbk/MTCpwaZEYiBkeOYSjo5afk0cLVKyk990+GrBGBbVwK7qU4BFyZiRXGcalryg7N
 TWiw==
X-Gm-Message-State: ABy/qLY071Xv0nUMC/NaEFBalQJKt5+UZ6tx0ww2AwvzNeTs5FiI0bCX
 AwnhxgBW/RZpi884emvG7go5lw==
X-Google-Smtp-Source: APBJJlGLEhA5mldHtPl6v83pgHE5ZDqy7/9fN20BiP7qeEoSWgIAVPa1IkZX7bTvsrsR7cGherWQ8w==
X-Received: by 2002:a05:6808:300f:b0:3a1:de61:d414 with SMTP id
 ay15-20020a056808300f00b003a1de61d414mr20784691oib.51.1691073727744; 
 Thu, 03 Aug 2023 07:42:07 -0700 (PDT)
Received: from [192.168.68.108] ([187.11.154.63])
 by smtp.gmail.com with ESMTPSA id
 bx32-20020a0568081b2000b003a76b1b2862sm571461oib.16.2023.08.03.07.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 07:42:07 -0700 (PDT)
Message-ID: <cfb8653b-ddc8-b4a9-9792-73ef84ee925e@ventanamicro.com>
Date: Thu, 3 Aug 2023 11:42:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] linux-user/elfload: Set V in ELF_HWCAP for RISC-V
Content-Language: en-US
To: Nathan Egge <negge@xiph.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230803131424.40744-1-negge@xiph.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230803131424.40744-1-negge@xiph.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 8/3/23 10:14, Nathan Egge wrote:
> From: "Nathan Egge" <negge@xiph.org>
> 
> Set V bit for hwcap if misa is set.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1793
> Signed-off-by: Nathan Egge <negge@xiph.org>
> ---

Tested with the example program described in the bug:

===========
#include <sys/auxv.h>
#include <stdio.h>

#define ISA_V_HWCAP (1 << ('v' - 'a'))

void main() {
   unsigned long hw_cap = getauxval(AT_HWCAP);
   printf("RVV %s\n", hw_cap & ISA_V_HWCAP ? "detected" : "not found");
}
===========

$ ./qemu-riscv64 -cpu rv64,vext_spec=v1.0,v=true,vlen=128 -B 0x100000 ./a.out
RVV detected
$ ./qemu-riscv64 -cpu rv64,vext_spec=v1.0,vlen=128 -B 0x100000 ./a.out
RVV not found


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


Looks like 8.1 material to me. Thanks,


Daniel

>   linux-user/elfload.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 861ec07abc..a299ba7300 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1710,7 +1710,8 @@ static uint32_t get_elf_hwcap(void)
>   #define MISA_BIT(EXT) (1 << (EXT - 'A'))
>       RISCVCPU *cpu = RISCV_CPU(thread_cpu);
>       uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
> -                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
> +                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C')
> +                    | MISA_BIT('V');
>   
>       return cpu->env.misa_ext & mask;
>   #undef MISA_BIT


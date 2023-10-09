Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E8BE95A96
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:45:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpohl-0003KK-Hl; Mon, 09 Oct 2023 07:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qpohj-0003I8-G6
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:45:44 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qpohh-0003go-NF
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:45:43 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1c737d61a00so35015035ad.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 04:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696851939; x=1697456739; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PPonpOK0od+dn5EFgbrIZZ8JVanHxWrm5XlWfzQyIbo=;
 b=GcILGU+XHmS32ta+F7gtbc/CIndHGNjmdAeLTW6/6J63SD/48x9DsM7lYVEhuV89ut
 5+RRRokFVHB7ky5/USZZzKvQQO8Dtp8dz4aXveb01zqv3JZsTRTOWOjVm7xv2HwuENWM
 HVTPas+BQ0pNreru96eh8DW/azu5dbC/ydIgdLm039OE+gf7LFo63yXA9qvxViRsp64i
 yooBMbVt9Ac8m+O5LsHfRnfZzo+ekMv6GazxI+YNewOBU6Kyiiiy2N1hkxVVXXF7gODD
 gSNPcQ5BhfD+4SxfFR9XXixgRKMMZkx+038zxUKsjus6Mf0AbpZ/IT6gFFlibTFzVrls
 CLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696851939; x=1697456739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PPonpOK0od+dn5EFgbrIZZ8JVanHxWrm5XlWfzQyIbo=;
 b=e/LGBHnaCzZ1QuJ0D5fXSfJn/j4ABigYtwKlkv16kyVSGvQ9DflY3CeeNbJVfoGAdB
 FGo2bSBDwl6g0+TT04k3e41W32kjsxCarVbub0eycMplB0IPQuZj8PFBy33SvLlCqnOs
 bS5kOjRoSACpU+wo5HAg1RuOS+GofP08XqT7BNvJh2h95gb6btmQlHktT/MzfkLzFVF1
 k1JyhSp8m752uNsxWTCGeZBjYkdgXaP35Yk1stkUKyDkZnznLx4EiYuRnJKroHh62WV5
 ceINOZVzbHVXbSpj0TJFk5rCCVr6vcQhDCFA64mvME5HL3LoD7h9nTjbI6Xukvb6hhBK
 kMVw==
X-Gm-Message-State: AOJu0Ywj/GeV0rNn7xqkDCJ/IsYRmhWWebkkS8o4I+fa4zcWMue43/w4
 wAuQya4E3xTZA78MBGJyRDeIgw==
X-Google-Smtp-Source: AGHT+IGZ6nRJh5cL/AJ65Cu/iAshCY1yyfIOOSuuAcRqsRKkmOTcnt3nfwzquMfKtjJ0Y7ilSI4loQ==
X-Received: by 2002:a17:902:9a44:b0:1be:384:7b29 with SMTP id
 x4-20020a1709029a4400b001be03847b29mr13899958plv.34.1696851939335; 
 Mon, 09 Oct 2023 04:45:39 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a17090322c700b001c726147a46sm9340195plg.234.2023.10.09.04.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 04:45:38 -0700 (PDT)
Message-ID: <7e31c247-23a2-41b9-bd25-86a21f06e819@ventanamicro.com>
Date: Mon, 9 Oct 2023 08:45:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] target/ppc: Use env_archcpu() in
 helper_book3s_msgsndp()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20231009110239.66778-1-philmd@linaro.org>
 <20231009110239.66778-2-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231009110239.66778-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
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



On 10/9/23 08:02, Philippe Mathieu-Daudé wrote:
> When CPUArchState* is available (here CPUPPCState*), we
> can use the fast env_archcpu() macro to get ArchCPU* (here
> PowerPCCPU*). The QOM cast POWERPC_CPU() macro will be
> slower when building with --enable-qom-cast-debug.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/excp_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7926114d5c..a42743a3e0 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -3136,7 +3136,7 @@ void helper_book3s_msgclrp(CPUPPCState *env, target_ulong rb)
>   void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
>   {
>       CPUState *cs = env_cpu(env);
> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
> +    PowerPCCPU *cpu = env_archcpu(env);


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>       CPUState *ccs;
>       uint32_t nr_threads = cs->nr_threads;
>       int ttir = rb & PPC_BITMASK(57, 63);


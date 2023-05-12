Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85BCC77B75
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 May 2023 12:54:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pxSHe-0000dg-AY; Fri, 12 May 2023 08:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pxSHc-0000cY-OK
 for qemu-riscv@nongnu.org; Fri, 12 May 2023 08:54:04 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pxSHa-0001ru-PX
 for qemu-riscv@nongnu.org; Fri, 12 May 2023 08:54:04 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-54fd1a3b821so1913257eaf.2
 for <qemu-riscv@nongnu.org>; Fri, 12 May 2023 05:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683896041; x=1686488041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KC4oGuXQGxJO5h1E5alG5lE/bQV1f5kTWaXeEZpeUJc=;
 b=VrU+atoFNRBGDY7LY9P+M05qzKIJ49ozDZVAsGi23hCJJIQzRuld30Q9cCVS2Chk1l
 rq9v/niviWRCBrVK+8jeNdN05ReWouaHPFLxOHhdku5OZhsxGwZhcgj2hp7H3/NeVuCn
 d983jqwRKcz+dxUjEpdAstk4cU6nrKZ9Rjboej4iS8vS71Mj8NX9AlGw5wWPYaEkfK85
 xcIvU+RI3X9S9awqxZ8zySNnS5Yb0UbmyAD61r9Qi92ux74+ILRiCD7iJ4zaZbJVW7oA
 JpGnkaPgfykLBlB3l5QryXsQaOHTv6CAltapT9SHdlrzY71LgHIbAXXMYfk1bzDFGvS9
 Sm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683896041; x=1686488041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KC4oGuXQGxJO5h1E5alG5lE/bQV1f5kTWaXeEZpeUJc=;
 b=ak2WnsFDeodZu4ygEO+tyVax3lBc73WeonpfP37q6QS87Qzrthtvy7J2eTk+ViwPSP
 W/QMAhhWcAszpoEV7UyO6Cww+W675yHpbjp8uceXz7fUqaGl0GgQv6dgyGFpztvbj1SX
 vefU+uSGZtfdtPUyQqfLSKZKSRK4Hq8OTlysk54IsnmYW0EDwMCES7vBZSXtOapzqle9
 RqONRHVApMoZc1zLq914ZSp5x1qRLa7pnirFMpZNQhs6TC4XpNipGYpsWUjF6wQlUQvz
 pg1xrdzVbRiUN80jAOvs0nh7uMK6eCO/p0ygqo9XOZkFN3MKZR/eKHXn5WeEKecer1iL
 g4wg==
X-Gm-Message-State: AC+VfDyBoP6tUqOOSay3g6TFk/IvmZ3U1DENELLst0RhHwI80pj5SAlB
 D8giA2vtqGv6sicYZ2gU+DI8oA==
X-Google-Smtp-Source: ACHHUZ7JBwqmiy1CfkzTkDrm7uOS+R1sncyZOT4oZ4hXVty8PYIAxhlq2gL+uV5Hed9TU+f+OD634Q==
X-Received: by 2002:a4a:3042:0:b0:541:f986:637f with SMTP id
 z2-20020a4a3042000000b00541f986637fmr5682526ooz.8.1683896041419; 
 Fri, 12 May 2023 05:54:01 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 v24-20020a4ae058000000b00549f4d87eecsm4070980oos.30.2023.05.12.05.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 05:54:01 -0700 (PDT)
Message-ID: <21b58129-1780-84c7-a640-e0a1e727eebf@ventanamicro.com>
Date: Fri, 12 May 2023 09:53:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] hw/riscv: qemu crash when NUMA nodes exceed available
 CPUs
Content-Language: en-US
To: Yin Wang <yin.wang@intel.com>, qemu-devel@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230512080346.1272337-1-yin.wang@intel.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230512080346.1272337-1-yin.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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



On 5/12/23 05:03, Yin Wang wrote:
> Command "qemu-system-riscv64 -machine virt
> -m 2G -smp 1 -numa node,mem=1G -numa node,mem=1G"
> would trigger this problem.Backtrace with:
>   #0  0x0000555555b5b1a4 in riscv_numa_get_default_cpu_node_id  at ../hw/riscv/numa.c:211
>   #1  0x00005555558ce510 in machine_numa_finish_cpu_init  at ../hw/core/machine.c:1230
>   #2  0x00005555558ce9d3 in machine_run_board_init  at ../hw/core/machine.c:1346
>   #3  0x0000555555aaedc3 in qemu_init_board  at ../softmmu/vl.c:2513
>   #4  0x0000555555aaf064 in qmp_x_exit_preconfig  at ../softmmu/vl.c:2609
>   #5  0x0000555555ab1916 in qemu_init  at ../softmmu/vl.c:3617
>   #6  0x000055555585463b in main  at ../softmmu/main.c:47
> This commit fixes the issue by adding parameter checks.
> 
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Yin Wang <yin.wang@intel.com>
> ---
>   hw/riscv/numa.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index 4720102561..a1bb312cd0 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -207,6 +207,12 @@ int64_t riscv_numa_get_default_cpu_node_id(const MachineState *ms, int idx)
>   {
>       int64_t nidx = 0;
>   
> +    if (ms->numa_state->num_nodes > ms->smp.cpus) {
> +        error_report("Number of CPUs used by NUMA nodes (%d)"
> +                     " cannot exceed the number of available CPUs (%d).",
> +                     ms->numa_state->num_nodes, ms->smp.max_cpus);
> +        exit(EXIT_FAILURE);
> +    }


IMO you should just say

"Number of NUMA nodes (%d) cannot exceed the number of available CPUs (%d)."

First because "ms->numa_state->num_nodes" is the number of NUMA nodes, not the number
of CPUs used by NUMA nodes (which can be higher). Second it goes right into the point:
we do not support cpu-less NUMA nodes in the 'virt' machine.


Assuming you agree with this change:


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>       if (ms->numa_state->num_nodes) {
>           nidx = idx / (ms->smp.cpus / ms->numa_state->num_nodes);
>           if (ms->numa_state->num_nodes <= nidx) {


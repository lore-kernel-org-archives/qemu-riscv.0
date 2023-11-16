Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED11C197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 08:36:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3Xr8-0006ex-9N; Thu, 16 Nov 2023 03:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Xr6-0006eH-Uw
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 03:36:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Xr3-0006Lh-He
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 03:36:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4083f613272so4580335e9.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 00:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700123762; x=1700728562; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/k/+TnYQqIxdes+6VDeXbii9qAIxGzuuOU3WNy3erFc=;
 b=hoQdYbrOFcpNQ0PjaUCPjMz/Ko81TS9j0DYNHL6fCqMjClr3o7r+89tLVfnMEpRPeW
 s7hbEDUViVhj7XDggwhDi/p0LBP+4dDgkZ4sVqfWmhLJ2guKLqWUG2Z9D2bHci/XQLRR
 /zjsuVlwsLocHz31/pThaLJcD2GvFE5KH6gTkEUsD9/9fNs4r9swdYRs60Kix2Bba+3k
 XBvHlrR//NidkNkwwe6hwY2Bj40xsSU/zvP5IXXsTNo2gzMRk2hWvQqBxlauk8Lo0ld6
 Xhn1I9qFbDsxanHAoLfi+Nt3XlxufhuMtnIagL+UbOQTN2No8uqmupGb5uuC7fKEzfUG
 jJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700123762; x=1700728562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/k/+TnYQqIxdes+6VDeXbii9qAIxGzuuOU3WNy3erFc=;
 b=Bdzns1OxI8e5sS63us6s7lthhP94vId7PJTHugf7lzu0/IPl3SGw18x7mq9cZg6tCN
 clQ4GJkEcYmFL3PGoC5kNYpGv/1G8hJNTG52U1LNV+AuvIVA18GhATqEQR0K7AhorNmr
 Yht5fmCpkBetARhK9HwDhLzzkB1GQFadEYKE/PPh7EKmrx5ST6T8mqLFTdHCnuUXHLCu
 2E//+AlUhuDT9Pbecv2bB/aYmTbjgoEX07H5msc+9XXd7dPiwcOdwmw73JU74z69SGVX
 m6VSbWPIBNYmBZwU7ZcsCLMBf3gloRRGdVYcHpIWPdzND+ckHnl1jWKItxOcFBC5gAyS
 f+Zg==
X-Gm-Message-State: AOJu0YxRwSktCAlhA4wfXVF3kSMmyEmGwCxSgHyRPyEEQltw3/Cif9gd
 mIMXDs1YM8Kv5DRmk/1MsrrcFQ==
X-Google-Smtp-Source: AGHT+IHAsYZMyQ5QJaF/DTRh3AMeAhyUsCqlIFXSsskoYMQrEQBbsbXfOBxs1HSjP0HGUyZIo1oiDA==
X-Received: by 2002:a05:600c:d9:b0:402:cc5c:c98 with SMTP id
 u25-20020a05600c00d900b00402cc5c0c98mr11513539wmm.13.1700123761733; 
 Thu, 16 Nov 2023 00:36:01 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 d34-20020a05600c4c2200b0040a48430837sm2551449wmp.13.2023.11.16.00.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 00:36:01 -0800 (PST)
Message-ID: <67796dee-ddc1-48db-b127-1969319ea9e3@linaro.org>
Date: Thu, 16 Nov 2023 09:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/31] hw/arm: Check CPU type in
 machine_run_board_init()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-31-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-31-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Gavin,

On 15/11/23 00:56, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can
> be validated in machine_run_board_init(). We needn't to do it by
> ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/bananapi_m2u.c   | 12 ++++++------
>   hw/arm/cubieboard.c     | 12 ++++++------
>   hw/arm/mps2-tz.c        | 20 ++++++++++++++------
>   hw/arm/mps2.c           | 25 +++++++++++++++++++------
>   hw/arm/msf2-som.c       | 12 ++++++------
>   hw/arm/musca.c          | 13 ++++++-------
>   hw/arm/npcm7xx_boards.c | 13 ++++++-------
>   hw/arm/orangepi.c       | 12 ++++++------
>   8 files changed, 69 insertions(+), 50 deletions(-)


> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 668db5ed61..1c88e76a22 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -191,6 +191,16 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
>   /* For cpu{0,1}_mpu_{ns,s}, means "leave at SSE's default value" */
>   #define MPU_REGION_DEFAULT UINT32_MAX
>   
> +static const char * const valid_cpu_types[] = {

Generic variable name,

> +    ARM_CPU_TYPE_NAME("cortex-m33"),
> +    NULL
> +};
> +
> +static const char * const mps3tz_an547_valid_cpu_types[] = {

then specific, is a bit confusing.

Better declare the array in the machine_class_init() methods ...

> +    ARM_CPU_TYPE_NAME("cortex-m55"),
> +    NULL
> +};
> +
>   static const uint32_t an505_oscclk[] = {

>       40000000,
>       24580000,
> @@ -813,12 +823,6 @@ static void mps2tz_common_init(MachineState *machine)
>       int num_ppcs;
>       int i;
>   
> -    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
> -        error_report("This board can only be used with CPU %s",
> -                     mc->default_cpu_type);
> -        exit(1);
> -    }
> -
>       if (machine->ram_size != mc->default_ram_size) {
>           char *sz = size_to_str(mc->default_ram_size);
>           error_report("Invalid RAM size, should be %s", sz);
> @@ -1325,6 +1329,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)

... here. See for example
https://lore.kernel.org/qemu-devel/20231115232154.4515-2-philmd@linaro.org/.

>       mc->max_cpus = mc->default_cpus;
>       mmc->fpga_type = FPGA_AN505;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
> +    mc->valid_cpu_types = valid_cpu_types;
>       mmc->scc_id = 0x41045050;
>       mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
>       mmc->apb_periph_frq = mmc->sysclk_frq;
> @@ -1354,6 +1359,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
>       mc->max_cpus = mc->default_cpus;
>       mmc->fpga_type = FPGA_AN521;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
> +    mc->valid_cpu_types = valid_cpu_types;
>       mmc->scc_id = 0x41045210;
>       mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
>       mmc->apb_periph_frq = mmc->sysclk_frq;
> @@ -1383,6 +1389,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
>       mc->max_cpus = mc->default_cpus;
>       mmc->fpga_type = FPGA_AN524;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
> +    mc->valid_cpu_types = valid_cpu_types;
>       mmc->scc_id = 0x41045240;
>       mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
>       mmc->apb_periph_frq = mmc->sysclk_frq;
> @@ -1417,6 +1424,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
>       mc->max_cpus = mc->default_cpus;
>       mmc->fpga_type = FPGA_AN547;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m55");
> +    mc->valid_cpu_types = mps3tz_an547_valid_cpu_types;
>       mmc->scc_id = 0x41055470;
>       mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
>       mmc->apb_periph_frq = 25 * 1000 * 1000; /* 25MHz */



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C16C47071
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 07:40:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3Wyv-0003RI-9q; Thu, 16 Nov 2023 02:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Wyt-0003Qo-Qv
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:40:08 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Wyp-0001zR-HU
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:40:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso3439335e9.2
 for <qemu-riscv@nongnu.org>; Wed, 15 Nov 2023 23:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700120400; x=1700725200; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3nJglrJHM96BrOxQ7yaaayAhXcBPoScHrFicrVIEwhk=;
 b=QwZ104B/vcqmbOQ6ovhRiCxGRhr9IiQkMjatGBjjP6ceDZgeTdYHxM/d81fZwOUdXR
 hasb/4Ef+R8PnfCoSSHKjY8MEhP4mY2I6j6GM6hoKELWXdE8RxCdmoS2/Q/PGGaoHNH6
 f9MjUvM2mJMvn7Q9nEHV1fqMvXB5InBXSeIX15Nnbr39whZUKKY5VZBRcSAwaM2dSHyC
 P44jBMhR1A7oCc1lRC/uWY9yij4zGql3fE9GJSbAVL3BGXPDgNdtozn8G60IMNVQNkma
 z5y0cVMQ7/BimJwI7mXlmpNqIcLkSN2dRZEky/N6V/wEeRjHdcWupZtgsD/qQzdMEw1/
 J85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700120400; x=1700725200;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3nJglrJHM96BrOxQ7yaaayAhXcBPoScHrFicrVIEwhk=;
 b=hSAMx7nDYSNFea7iNBUh6Bg3FWuUyuthdSiTpa4Y2DxEuU8OZWXczETS5gln7z6AZo
 k6WuUS5shyRVgb9HMpe6DsKyrLEVZXSA0UzlYQMMn7ZULRtiSeU8fQjrCb8oEf7E7d/k
 qX34cnxO2o8TDNAaoeFk9kzLkp6oGbGv0wrjYv9N5pYCFHVShUKhzRdMX6h21G2W3xus
 522f8QdziXdoQDycLd4dBio9NQVun70DJ78cY6awSBDFYzZH/ll4YyFMjd7jAkVuR0GM
 cC0fVTB8uh30ObmbLkBwhQLwptY2lCruYwhyGr8/87BCuzAiI3XNwen5XTbgxXQjMs5R
 /Smg==
X-Gm-Message-State: AOJu0YwZumrBXcWTrCgu9facTmKx6U7nG9lPDTlyqZWJTPB1+jd03QRo
 FWX666c60z+kfDbk4k2cOUWkiA==
X-Google-Smtp-Source: AGHT+IEPxaE52Lv+JR6bK7qeEL+NPX2F0YrpVOjhI4P3Sn+uyy5/ZE7Y3YEoR///0JZYlvvpZ4UTNw==
X-Received: by 2002:a05:6000:1865:b0:32f:a48f:3658 with SMTP id
 d5-20020a056000186500b0032fa48f3658mr15956372wri.69.1700120400598; 
 Wed, 15 Nov 2023 23:40:00 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056000136200b003313a1e0ba1sm12597012wrz.89.2023.11.15.23.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:40:00 -0800 (PST)
Message-ID: <80da2d00-0d96-4252-b2aa-f7859e44bece@linaro.org>
Date: Thu, 16 Nov 2023 08:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/31] cpu: Add generic cpu_list()
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
 <20231114235628.534334-7-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-7-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
> Add generic cpu_list() to replace the individual target's implementation
> in the subsequent commits. Currently, there are 3 targets with no cpu_list()
> implementation: microblaze and nios2. With this applied, those two targets
> switch to the generic cpu_list().
> 
> [gshan@gshan q]$ ./build/qemu-system-microblaze -cpu ?
> Available CPUs:
>    microblaze-cpu
> 
> [gshan@gshan q]$ ./build/qemu-system-nios2 -cpu ?
> Available CPUs:
>    nios2-cpu
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   bsd-user/main.c |  5 +----
>   cpu-target.c    | 29 ++++++++++++++++++++++++++---
>   2 files changed, 27 insertions(+), 7 deletions(-)


> diff --git a/cpu-target.c b/cpu-target.c
> index c078c0e91b..acfc654b95 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -24,6 +24,7 @@
>   #include "hw/qdev-core.h"
>   #include "hw/qdev-properties.h"
>   #include "qemu/error-report.h"
> +#include "qemu/qemu-print.h"
>   #include "migration/vmstate.h"
>   #ifdef CONFIG_USER_ONLY
>   #include "qemu.h"
> @@ -283,12 +284,34 @@ const char *parse_cpu_option(const char *cpu_option)
>       return cpu_type;
>   }
>   
> +#ifndef cpu_list
> +static void cpu_list_entry(gpointer data, gpointer user_data)
> +{
> +    CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
> +    const char *typename = object_class_get_name(OBJECT_CLASS(data));
> +    g_autofree char *model = cpu_model_from_type(typename);
> +
> +    if (cc->deprecation_note) {
> +        qemu_printf("  %s (deprecated)\n", model);
> +    } else {
> +        qemu_printf("  %s\n", model);
> +    }
> +}
> +
> +static void cpu_list(void)
> +{
> +    GSList *list;
> +
> +    list = object_class_get_list_sorted(TYPE_CPU, false);
> +    qemu_printf("Available CPUs:\n");

Since this output will likely be displayed a lot, IMHO it is worth
doing a first pass to get the number of available CPUs. If it is 1,
print using singular but even better smth like:

        "This machine can only be used with the following CPU:"

That said, this can be done later on top, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    g_slist_foreach(list, cpu_list_entry, NULL);
> +    g_slist_free(list);
> +}
> +#endif




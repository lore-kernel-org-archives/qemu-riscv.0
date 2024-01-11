Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A937C47258
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:01:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNugC-0003YN-TQ; Thu, 11 Jan 2024 08:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNugA-0003U7-4B
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:01:02 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNug6-0002x2-9r
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:01:01 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d3e05abcaeso35806165ad.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 05:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704978054; x=1705582854; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Y4ZPV7hFgduvDOqna7pksqq2gmS+aWZfjiiB9YjPPs=;
 b=ExeAFhK6ZnA0JjgUaV+zlJmFRCGVSW7orFYGhXum6yDjK+OF+s3Q+mA5aiPBJefdlX
 VO27bjR6lQSFZnI4PwwYWZIXjGE8iV4fgCcdcw+F2X45YA+aqVic1veT/UD4IJhGd81g
 vxrblsfuZPy1WodvmrDIOnt0urTcOj5cG8mMPLHmr+PQ0BDe1nfCpveuTSar7TbC8V+u
 RexVyfiDtsAxPiSEsyA7o6yqM+nvHDqXQySCMXcNORvX7BuxDsnwWROEbxHKnSeEKSHM
 mB69gkf7gDPaccN0B/SHx3t5VSInNE6c91hw13t2IlY0CZFQeGc8s3f8iM0Dv3Y3CYim
 Uk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704978054; x=1705582854;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Y4ZPV7hFgduvDOqna7pksqq2gmS+aWZfjiiB9YjPPs=;
 b=JTj3HiKMsVExj68b2bcT/3MJmO+xJaWVbYbtKv7nAQD/rzYJBrVurIEGY37rQxrTql
 sX+6vkk+1B/nNWxlTvdIpSLh/xEFkfYiYikL2mIwbeURC68frO8XFFR4S8mZxEb9OpMr
 xznmsbcdUWvpXKfCD2DtYeq02JbVffs8+5g1ia8XCnhSSRzzuT4AnzQAcNohPezwCRpy
 Z90vHEaZz5ipAvbVwrkFnEIigx9os1L7aHypQuDZRKwGYvj+V4l6yy0sXkr478CjQt0l
 ahZ94zaOubRZqfsshpcw64sxlnVBc8IDo5ttK30V2dtgPmw3PTRIiOumURKn+0kWMaaz
 cI2w==
X-Gm-Message-State: AOJu0YyHZnMtyQFnucMnS7C/VnDyx6j72GomEJuskMUqz1R92Kow3lsw
 PslpQ5zgQO4Yr6JstgIE9Q0e8uSxSMXcKQ==
X-Google-Smtp-Source: AGHT+IFnPdqOoOwgoHwKjEje9vCwXUzz0fzVImmJUC3efNHl1erJD1D6RgXaCQWhZhpTB77R5/n7Sg==
X-Received: by 2002:a17:902:780e:b0:1d5:8ce6:73 with SMTP id
 p14-20020a170902780e00b001d58ce60073mr466579pll.115.1704978053758; 
 Thu, 11 Jan 2024 05:00:53 -0800 (PST)
Received: from [192.168.68.110] ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170902c98b00b001d4c97a2adcsm1115031plc.108.2024.01.11.05.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 05:00:53 -0800 (PST)
Message-ID: <0ec3905b-0364-48fa-8145-b4ae8990507c@ventanamicro.com>
Date: Thu, 11 Jan 2024 10:00:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] target/riscv: Rename tcg_cpu_FOO() to include 'riscv'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Eric Farman
 <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
References: <20240111120221.35072-1-philmd@linaro.org>
 <20240111120221.35072-6-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240111120221.35072-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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



On 1/11/24 09:02, Philippe Mathieu-Daudé wrote:
> The tcg_cpu_FOO() names are riscv specific, so rename
> them as riscv_tcg_cpu_FOO() (as other names in this file)
> to ease navigating the code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/tcg/tcg-cpu.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 14133ff665..994ca1cdf9 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -929,7 +929,7 @@ static bool riscv_cpu_is_vendor(Object *cpu_obj)
>    *   -> cpu_exec_realizefn()
>    *      -> tcg_cpu_realize() (via accel_cpu_common_realize())
>    */
> -static bool tcg_cpu_realize(CPUState *cs, Error **errp)
> +static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       Error *local_err = NULL;
> @@ -1372,7 +1372,7 @@ static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
>       return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
>   }
>   
> -static void tcg_cpu_instance_init(CPUState *cs)
> +static void riscv_tcg_cpu_instance_init(CPUState *cs)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       Object *obj = OBJECT(cpu);
> @@ -1386,7 +1386,7 @@ static void tcg_cpu_instance_init(CPUState *cs)
>       }
>   }
>   
> -static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
> +static void riscv_tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
>   {
>       /*
>        * All cpus use the same set of operations.
> @@ -1394,30 +1394,30 @@ static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
>       cc->tcg_ops = &riscv_tcg_ops;
>   }
>   
> -static void tcg_cpu_class_init(CPUClass *cc)
> +static void riscv_tcg_cpu_class_init(CPUClass *cc)
>   {
> -    cc->init_accel_cpu = tcg_cpu_init_ops;
> +    cc->init_accel_cpu = riscv_tcg_cpu_init_ops;
>   }
>   
> -static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
> +static void riscv_tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
>   {
>       AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>   
> -    acc->cpu_class_init = tcg_cpu_class_init;
> -    acc->cpu_instance_init = tcg_cpu_instance_init;
> -    acc->cpu_target_realize = tcg_cpu_realize;
> +    acc->cpu_class_init = riscv_tcg_cpu_class_init;
> +    acc->cpu_instance_init = riscv_tcg_cpu_instance_init;
> +    acc->cpu_target_realize = riscv_tcg_cpu_realize;
>   }
>   
> -static const TypeInfo tcg_cpu_accel_type_info = {
> +static const TypeInfo riscv_tcg_cpu_accel_type_info = {
>       .name = ACCEL_CPU_NAME("tcg"),
>   
>       .parent = TYPE_ACCEL_CPU,
> -    .class_init = tcg_cpu_accel_class_init,
> +    .class_init = riscv_tcg_cpu_accel_class_init,
>       .abstract = true,
>   };
>   
> -static void tcg_cpu_accel_register_types(void)
> +static void riscv_tcg_cpu_accel_register_types(void)
>   {
> -    type_register_static(&tcg_cpu_accel_type_info);
> +    type_register_static(&riscv_tcg_cpu_accel_type_info);
>   }
> -type_init(tcg_cpu_accel_register_types);
> +type_init(riscv_tcg_cpu_accel_register_types);


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691D2C71153
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 12:36:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qabTQ-0007fA-Mc; Mon, 28 Aug 2023 08:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qabT9-0007dN-RN
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 08:35:49 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qabT3-0001BZ-Uq
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 08:35:46 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bd0a0a675dso2469141a34.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 05:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693226140; x=1693830940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vrp/vJo6re/30ZHz5B6Um8gzH15U0SvPK9XC4HPL+/A=;
 b=KE0YQ78iJXLpNeUB6p8bea6pkzwujNH3HhEribcaet5qUM48SygseMSi0CZE4Q4Sg9
 NmJKsZ5qhxAC6i0RYY8cNEKzw6ETW19IjxuENa0xy6iZ+eFNsyK6y25FWwMB6aGj/JCY
 Jn0l5voJrhkRpFwQ+EwY7PuVmS2Wv+VhJU3nJXJihHjj6PUf7qcvWbz8qvFUk8T62t5T
 Fxii73xvKtqx4Arbr2EHCZBY0mQIm2DTCE+nxeZRNSODR0Xf1SSMQRvc1sORt2HZ8IEI
 DzYt4QDwc85TX5+s9tSYbriSo7C8JfRd2Jz/RlsPlCRBpqDLnrGiS+iOrv7N2VR4t8xR
 POnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693226140; x=1693830940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vrp/vJo6re/30ZHz5B6Um8gzH15U0SvPK9XC4HPL+/A=;
 b=F1pWjcGkepkAdWWA69AwbpTGWI+egNddUNNEUL62sy+8ijS6QUoO7RcsiqMFMvkaIH
 UQRGomRy9h+WBgiW8rhcvBE7bS96G/4CKlY3aMBXJX0KrHn/PDUsWvmFRgjrF3iy6V8U
 ioG12i7VtCehsytY6NNhSt+Z0nFEgo6Nb4Mu47o2vZAyq1+ElUgYT+Hqa/BBJ7NSkyYK
 ozn+EY27VXz0cuH8J8G7FTzTCm65ePR/na6etOlwN/89QSproaJ9PVVlNi5JxMxT2mEp
 cQ+60r6LVSXE8/bU8/V9Y85zlaj2+MpTw+ZhCrIFwDZR9c3aFfLeJAGU8f43IQ2xRiEl
 MIlQ==
X-Gm-Message-State: AOJu0Yy7kaxjw0dhU598jGLHq1DGriJzo+taqriO9GC67M+++5wmf6Y9
 DQ1a+MNCYTMoMm+iUsX2Qte9rSrBFZc87HdsPZ8=
X-Google-Smtp-Source: AGHT+IHX4W+aGPNd/kHvmrquCw00uBmc0GjBR24ASbultCkghqf19KKfUO6Ji88aQbAe1awtj3s6nw==
X-Received: by 2002:a05:6830:1258:b0:6bf:df:66d5 with SMTP id
 s24-20020a056830125800b006bf00df66d5mr5689720otp.35.1693226140306; 
 Mon, 28 Aug 2023 05:35:40 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a056830139800b006b884bbb4f3sm3446126otq.26.2023.08.28.05.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 05:35:40 -0700 (PDT)
Message-ID: <d5289f78-4fa7-022c-d760-528808edf981@ventanamicro.com>
Date: Mon, 28 Aug 2023 09:35:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v2 6/6] linux-user: Move qemu_cpu_opts to cpu.c
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 qemu-riscv@nongnu.org
References: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
 <20230828084536.231-7-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230828084536.231-7-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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



On 8/28/23 05:45, LIU Zhiwei wrote:
> Make qemu_cpu_opts also works for linux user mode. Notice, currently
> qdev monitor is not included in linux user mode. We just output
> current enabled extentions for RISC-V(without the hint to print all
> properties with -device).
> 
> With this patch,
> """
> qemu-riscv64 -cpu rv64,help
> Enabled extensions:
> 	rv64_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zba_zbb_zbc_zbs_sstc_svadu
> """
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---


This is a similar to patch 5. Code LGTM but it's better to split the changes made in
the common code from the changes in a specific target.

What I suggest here is add a patch with the linux-user changes alone, then a second
patch with the target/riscv changes. Thanks,


Daniel


>   cpu.c                     | 24 ++++++++++++++++++++++++
>   include/exec/cpu-common.h |  2 ++
>   linux-user/main.c         | 10 ++++++++++
>   softmmu/vl.c              | 24 ------------------------
>   target/riscv/cpu.c        |  8 +++++---
>   5 files changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/cpu.c b/cpu.c
> index 712bd02684..590d75def0 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -47,6 +47,30 @@
>   uintptr_t qemu_host_page_size;
>   intptr_t qemu_host_page_mask;
>   
> +QemuOptsList qemu_cpu_opts = {
> +    .name = "cpu",
> +    .implied_opt_name = "cpu_model",
> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_cpu_opts.head),
> +    .desc = {
> +        { /* end of list */ }
> +    },
> +};
> +
> +int cpu_help_func(void *opaque, QemuOpts *opts, Error **errp)
> +{
> +    const char *cpu_model, *cpu_type;
> +    cpu_model = qemu_opt_get(opts, "cpu_model");
> +    if (!cpu_model) {
> +        return 1;
> +    }
> +    if (!qemu_opt_has_help_opt(opts)) {
> +        return 0;
> +    }
> +    cpu_type = cpu_type_by_name(cpu_model);
> +    list_cpu_props((CPUState *)object_new(cpu_type));
> +    return 1;
> +}
> +
>   #ifndef CONFIG_USER_ONLY
>   static int cpu_common_post_load(void *opaque, int version_id)
>   {
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index b3160d9218..4d385436a5 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -168,4 +168,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>   void list_cpus(void);
>   void list_cpu_props(CPUState *);
>   
> +int cpu_help_func(void *opaque, QemuOpts *opts, Error **errp);
> +extern QemuOptsList qemu_cpu_opts;
>   #endif /* CPU_COMMON_H */
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 96be354897..c3ef84b1a7 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -362,6 +362,15 @@ static void handle_arg_cpu(const char *arg)
>           list_cpus();
>           exit(EXIT_FAILURE);
>       }
> +    QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("cpu"),
> +                                             arg, true);
> +    if (!opts) {
> +        exit(1);
> +    }
> +    if (qemu_opts_foreach(qemu_find_opts("cpu"),
> +                          cpu_help_func, NULL, NULL)) {
> +        exit(0);
> +    }
>   }
>   
>   static void handle_arg_guest_base(const char *arg)
> @@ -720,6 +729,7 @@ int main(int argc, char **argv, char **envp)
>       cpu_model = NULL;
>   
>       qemu_add_opts(&qemu_trace_opts);
> +    qemu_add_opts(&qemu_cpu_opts);
>       qemu_plugin_add_opts();
>   
>       optind = parse_args(argc, argv);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index bc30f3954d..d6a395454a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -218,15 +218,6 @@ static struct {
>       { .driver = "virtio-vga-gl",        .flag = &default_vga       },
>   };
>   
> -static QemuOptsList qemu_cpu_opts = {
> -    .name = "cpu",
> -    .implied_opt_name = "cpu_model",
> -    .head = QTAILQ_HEAD_INITIALIZER(qemu_cpu_opts.head),
> -    .desc = {
> -        { /* end of list */ }
> -    },
> -};
> -
>   static QemuOptsList qemu_rtc_opts = {
>       .name = "rtc",
>       .head = QTAILQ_HEAD_INITIALIZER(qemu_rtc_opts.head),
> @@ -1149,21 +1140,6 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
>       return 0;
>   }
>   
> -static int cpu_help_func(void *opaque, QemuOpts *opts, Error **errp)
> -{
> -    const char *cpu_model, *cpu_type;
> -    cpu_model = qemu_opt_get(opts, "cpu_model");
> -    if (!cpu_model) {
> -        return 1;
> -    }
> -    if (!qemu_opt_has_help_opt(opts)) {
> -        return 0;
> -    }
> -    cpu_type = cpu_type_by_name(cpu_model);
> -    list_cpu_props((CPUState *)object_new(cpu_type));
> -    return 1;
> -}
> -
>   static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
>   {
>       return qdev_device_help(opts);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index edcd34e62b..e4318fcc46 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2229,15 +2229,17 @@ void riscv_cpu_list(void)
>   void riscv_cpu_list_props(CPUState *cs)
>   {
>       char *enabled_isa;
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
> -    ObjectClass *oc = OBJECT_CLASS(mcc);
>   
>       enabled_isa = riscv_isa_string(RISCV_CPU(cs));
>       qemu_printf("Enabled extensions:\n");
>       qemu_printf("\t%s\n", enabled_isa);
> +#ifndef CONFIG_USER_ONLY
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
> +    ObjectClass *oc = OBJECT_CLASS(mcc);
>       qemu_printf("To get all configuable options for this cpu, use"
>                   " -device %s,help\n", object_class_get_name(oc));
> +#endif
>   }
>   
>   #define DEFINE_CPU(type_name, initfn)      \


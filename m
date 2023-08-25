Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED13DC3DA6F
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 15:58:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZZCT-0000os-9q; Fri, 25 Aug 2023 11:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qZZCS-0000oY-0e
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 11:58:16 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qZZCP-0004dZ-HA
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 11:58:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31ad779e6b3so860865f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692979091; x=1693583891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PU43whOI5M0Ljj16bo1tZ+/MyHVt3Jk6mG3VNQQ+VJ4=;
 b=cVYgizeQxzBv8oXhiRzP8pcSpIMs13+Iljw/GmfrjPGtFg9tDCdu90wvdSxOOLlB+R
 l8cG3yobUogeLe5r4+r0KUPfacma823i231WlCm6aklkXxdmlL5umvkzzgV4Ay7lUEeM
 gRyn89JbpjwsVDAhKAhLbGdhpqVuaUG2/KuB1tVmWmsJAf3kRbOQ/xMhBGpBlJoFfxnb
 FhavAUi3eMEuJrfKfL3nF8P0+/lJvyKD89SY+XZ/3W9QRIROneXuH19n9n6+IyqTzRri
 cE/Hn+jgK2L0xmvUAiOq/xKOy7g2iJx9OJa8P+f/rAIMLIB4A6p6DpVONG5jObt9e8W+
 N/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692979091; x=1693583891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PU43whOI5M0Ljj16bo1tZ+/MyHVt3Jk6mG3VNQQ+VJ4=;
 b=D01hqHb1R//m46sZaMDgTMSot/0uQDT5F9FkAyPJJr72iUs/tw2EMIjwLOS5Nlg5cX
 g4s7+ISdwyHheUZtk+LFc6H4p1MeGSJwt+tCK31INaCZOoCGwMqQ2/lIR6MNZwcwgIGH
 tyToq8J+2uXsInk7crcMzlGMWiFPX5LYoK0qFH3F4j4nDukZHJRdiCR/0rZA+24zhT+7
 TCzsg0BH0HwnGvN2fM/K/jjHgcQZfmr18+UJwZEIgqhQk8Msj4DaxKkx+Yoxbi2nUpgW
 c/mIs7bVw7b1Ff4ocg30U/kwe+WdPPGcDIx1x+8FBIzcmTUgaDhCDnUZ08+5LSWyyynY
 k4RQ==
X-Gm-Message-State: AOJu0YwkOqKLMj1etQohYwv7B/5XTGbmDt1+Nnr7wdYrIRgkICUtKc/5
 sgN8g1b5cI1Ds2ZRi5FWJzLtdw==
X-Google-Smtp-Source: AGHT+IF7D/SZBz2DXahTrtUfbMjAhQnluW/PZCkWEZsUZ/1ta8DhR/41gW1QlJni104cBuuccka7iA==
X-Received: by 2002:a5d:630e:0:b0:31a:dc27:dfd with SMTP id
 i14-20020a5d630e000000b0031adc270dfdmr13265933wru.6.1692979091562; 
 Fri, 25 Aug 2023 08:58:11 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056000114b00b0031c6dc684f8sm2590514wrx.20.2023.08.25.08.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 08:58:11 -0700 (PDT)
Date: Fri, 25 Aug 2023 17:58:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, pbonzini@redhat.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 qemu-riscv@nongnu.org
Subject: Re: [RFC PATCH 3/3] softmmu/vl: Add qemu_cpu_opts QemuOptsList
Message-ID: <20230825-b47b84e8d73575d79db91dab@orel>
References: <20230825121651.1534-1-zhiwei_liu@linux.alibaba.com>
 <20230825121651.1534-4-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825121651.1534-4-zhiwei_liu@linux.alibaba.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42b.google.com
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

On Fri, Aug 25, 2023 at 08:16:51PM +0800, LIU Zhiwei wrote:
> This make the cpu works the similar way like the -device option.
> 
> For device option,
> """
> ./qemu-system-riscv64 -device e1000,help
> e1000 options:
>   acpi-index=<uint32>    -  (default: 0)
>   addr=<int32>           - Slot and optional function number, example: 06.0 or 06 (default: -1)
>   autonegotiation=<bool> - on/off (default: true)
>   bootindex=<int32>
>   extra_mac_registers=<bool> - on/off (default: true)
>   failover_pair_id=<str>
> """
> 
> After this patch, the cpu can output its configurations,
> """
> ./qemu-system-riscv64 -cpu rv64,help
> Enable extension:
> 	rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zba_zbb_zbc_zbs_sstc_svadu
> """

I recommend we make it more similar to -device and list the properties
(not just extensions). Besides a listing being easier to read than the
isa string format, listing properties would also output, e.g.

 cbom_blocksize=<uint16>    -  (default: 64)

which would also be helpful.

Thanks,
drew

> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  cpu.c                 |  2 +-
>  include/hw/core/cpu.h | 11 +++++++++++
>  softmmu/vl.c          | 35 +++++++++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/cpu.c b/cpu.c
> index 03a313cd72..712bd02684 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -257,7 +257,7 @@ void cpu_exec_initfn(CPUState *cpu)
>  #endif
>  }
>  
> -static const char *cpu_type_by_name(const char *cpu_model)
> +const char *cpu_type_by_name(const char *cpu_model)
>  {
>      ObjectClass *oc;
>      const char *cpu_type;
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index fdcbe87352..49d41afdfa 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -657,6 +657,17 @@ CPUState *cpu_create(const char *typename);
>   */
>  const char *parse_cpu_option(const char *cpu_option);
>  
> +/**
> + * cpu_type_by_name:
> + * @cpu_model: The -cpu command line model name.
> + *
> + * Looks up type name by the -cpu command line model name
> + *
> + * Returns: type name of CPU or prints error and terminates process
> + *          if an error occurred.
> + */
> +const char *cpu_type_by_name(const char *cpu_model);
> +
>  /**
>   * cpu_has_work:
>   * @cpu: The vCPU to check.
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b0b96f67fa..bc30f3954d 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -218,6 +218,15 @@ static struct {
>      { .driver = "virtio-vga-gl",        .flag = &default_vga       },
>  };
>  
> +static QemuOptsList qemu_cpu_opts = {
> +    .name = "cpu",
> +    .implied_opt_name = "cpu_model",
> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_cpu_opts.head),
> +    .desc = {
> +        { /* end of list */ }
> +    },
> +};
> +
>  static QemuOptsList qemu_rtc_opts = {
>      .name = "rtc",
>      .head = QTAILQ_HEAD_INITIALIZER(qemu_rtc_opts.head),
> @@ -1140,6 +1149,21 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
>      return 0;
>  }
>  
> +static int cpu_help_func(void *opaque, QemuOpts *opts, Error **errp)
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
>  static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
>  {
>      return qdev_device_help(opts);
> @@ -2467,6 +2491,11 @@ static void qemu_process_help_options(void)
>          exit(0);
>      }
>  
> +    if (qemu_opts_foreach(qemu_find_opts("cpu"),
> +                          cpu_help_func, NULL, NULL)) {
> +        exit(0);
> +    }
> +
>      if (qemu_opts_foreach(qemu_find_opts("device"),
>                            device_help_func, NULL, NULL)) {
>          exit(0);
> @@ -2680,6 +2709,7 @@ void qemu_init(int argc, char **argv)
>      qemu_add_drive_opts(&bdrv_runtime_opts);
>      qemu_add_opts(&qemu_chardev_opts);
>      qemu_add_opts(&qemu_device_opts);
> +    qemu_add_opts(&qemu_cpu_opts);
>      qemu_add_opts(&qemu_netdev_opts);
>      qemu_add_opts(&qemu_nic_opts);
>      qemu_add_opts(&qemu_net_opts);
> @@ -2756,6 +2786,11 @@ void qemu_init(int argc, char **argv)
>              case QEMU_OPTION_cpu:
>                  /* hw initialization will check this */
>                  cpu_option = optarg;
> +                opts = qemu_opts_parse_noisily(qemu_find_opts("cpu"),
> +                                               optarg, true);
> +                if (!opts) {
> +                    exit(1);
> +                }
>                  break;
>              case QEMU_OPTION_hda:
>              case QEMU_OPTION_hdb:
> -- 
> 2.17.1
> 


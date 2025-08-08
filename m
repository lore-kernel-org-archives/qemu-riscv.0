Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE294CA0EC0
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 16:27:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ukPvg-0002rn-SA; Fri, 08 Aug 2025 12:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukPvd-0002qw-Qy
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:26:49 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukPvb-0003A8-O3
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:26:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so15024405e9.1
 for <qemu-riscv@nongnu.org>; Fri, 08 Aug 2025 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754670406; x=1755275206; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cm5x3aYEzOQ437ur+X6QBqGaqDEGOduULTLzYCGhyEY=;
 b=c43Xfv19oGSKknJHbndoNArh905eC+scoOl+WCQMamrjTd8IWv6u6kFVFBxnrMXMbK
 sRlsy0GQZ5kCzu7uqnaPRGeUEsq2uUlXdqd17rVCmmn1UhRRX5/UV23wPx4IPVG594li
 aZT3Ez4CWDPoCTufRo+EuNtu/EvEfRGxk/nH+lM+XFMTyUDpycibn/KKUWBM2ccBac2v
 mKlY8jFMGNnn/PE5KkbXNBeLWZKWUsBUxHscI3FFB1hqciDRf+SvZ6W/xP/ftUcLepJa
 BBCCQYoMBU85OirzH6JtGr/qJV8LiZen+x3m6P813qkdYK3bc2w33wr/6rRJTm3QU190
 IvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754670406; x=1755275206;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cm5x3aYEzOQ437ur+X6QBqGaqDEGOduULTLzYCGhyEY=;
 b=uHJ0JJSZQXCKzyVjzjMZ5/o9/9Hr8Hgnua64HotxGC+g4kAKC/uaIDrwEsG3+5nRQa
 6S2z7T4gDL312dzvBLctQ05THAtdcu+W7GsNwvCm+ig/j+RwFZwa4D8C4y9cZwPVK3dB
 d+5PvFa/6K41Lb1fyloJKq6XedBLzcg/04TW8nGvGjQ/hMJ4TAu6HuRyFavzHi/kSN/W
 CaM+QkhEa18cv3KPY97GDAGqUpbiR9QhIjO09iEdTT7DKEKdDniAKflZ+my8IQh8r6IP
 IDwzO9Iho7LmMODNnpT1/pmDfuEcpbg9+udcs3+s7Oo5DWcKjAvdAR0v84DnZwBFqMYr
 d0Bw==
X-Gm-Message-State: AOJu0YyHudPO2AnN8ZGSeQ4u3YCQfcqmmUKD5Vzpb0Px0CR7QXisFH6V
 9ZO4vTyrqrRMQfNmAV67DzPyN7+hrlOF13Et25YMd2MnDabFpwsPcYmjOo6B50inj4s=
X-Gm-Gg: ASbGncuXZ0K2F8vymDU306tBCaYsZSzRXj4r0tjbPe/bdk6Fpvu3sJjzVEp8jQ1CAic
 ZacfPUKKE/0n1hyGDfxSsRxgTMQJZxaIhtK8GQPj8BU5GF8YjGxRng4m4AHT5hDSz/m7BzmRuFN
 Ux7bSIWn6hKjU4wXEGOEi/gk0OMirszdchC3Lf/6O2Vc9H0GDABWuZZEomvDuJZEaL+SfQJyTBA
 sKOf6OjSF6Dx5U78EhWOeXQ2NULQ3xuA22tCi0AtUV56qJMVuLva7LWmT4DYMTN26cFWwhJgKMA
 ErCqwiBp2nv+8Qqq2ZbRcDaaYRBMg5FDMX81dalUWlAfFe7ji0SwFc3HAlOSitBB7GcGKm7MWBH
 21TCs/RFKJ88RHdSyrM1dbQtLpzaFk1I/DPFopePG2m/NgvbFHeS4HuPfPk/7Kyu/HGZQWYkl8l
 xs
X-Google-Smtp-Source: AGHT+IHt4eJnYqnyWF/+LfBm82WDEzdwXJ71AM7IfupNCkE3OEF0GZMnV7TMwDRMqttnfNEUT2TUCQ==
X-Received: by 2002:a05:600c:5298:b0:456:29ae:3dbe with SMTP id
 5b1f17b1804b1-459f59cec5bmr31095545e9.24.1754670405737; 
 Fri, 08 Aug 2025 09:26:45 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc7e1ddesm223988975e9.27.2025.08.08.09.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 09:26:45 -0700 (PDT)
Message-ID: <8be60d9d-ee2d-439c-8d55-c0349939d27a@linaro.org>
Date: Fri, 8 Aug 2025 18:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/14] hw/riscv: Add support for RISCV CPS
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>
References: <20250717093833.402237-1-djordje.todorovic@htecgroup.com>
 <20250717093833.402237-11-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250717093833.402237-11-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 17/7/25 11:38, Djordje Todorovic wrote:
> Add support for the Coherent Processing System for RISC-V.
> This enables SMP support for RISC-V boards that require
> cache-coherent multiprocessor systems.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   hw/misc/Kconfig        |   5 ++
>   hw/riscv/cps.c         | 197 +++++++++++++++++++++++++++++++++++++++++
>   hw/riscv/meson.build   |   2 +
>   include/hw/riscv/cps.h |  76 ++++++++++++++++
>   4 files changed, 280 insertions(+)
>   create mode 100644 hw/riscv/cps.c
>   create mode 100644 include/hw/riscv/cps.h


> +static void main_cpu_reset(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPUState *cs = CPU(cpu);

If you call in [*]:

        qemu_register_reset(main_cpu_reset, s->cpus[i]);

then here you can just do:

        CPUState *cs = opaque;

> +
> +    cpu_reset(cs);
> +}
> +
> +static void riscv_cps_realize(DeviceState *dev, Error **errp)
> +{
> +    RISCVCPSState *s = RISCV_CPS(dev);
> +    RISCVCPU *cpu;
> +    int i;
> +

Please check num_vp range.

> +    /* Allocate CPU array */
> +    s->cpus = g_new0(CPUState *, s->num_vp);
> +
> +    /* Set up cpu_index and mhartid for avaiable CPUs. */
> +    int harts_in_cluster = s->num_hart * s->num_core;
> +    int num_of_clusters = s->num_vp / harts_in_cluster;
> +    for (i = 0; i < s->num_vp; i++) {
> +        cpu = RISCV_CPU(object_new(s->cpu_type));
> +
> +        /* All VPs are halted on reset. Leave powering up to CPC. */
> +        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
> +                                 &error_abort);
> +
> +        if (!qdev_realize_and_unref(DEVICE(cpu), NULL, errp)) {
> +            return;
> +        }
> +
> +        /* Store CPU in array */
> +        s->cpus[i] = CPU(cpu);
> +
> +        /* Set up mhartid */
> +        int cluster_id = i / harts_in_cluster;
> +        int hart_id = (i % harts_in_cluster) % s->num_hart;
> +        int core_id = (i % harts_in_cluster) / s->num_hart;
> +        int mhartid = (cluster_id << MHARTID_CLUSTER_SHIFT) +
> +                      (core_id << MHARTID_CORE_SHIFT) +
> +                      (hart_id << MHARTID_HART_SHIFT);
> +        cpu->env.mhartid = mhartid;
> +        qemu_register_reset(main_cpu_reset, cpu);

[*]

> +    }
> +
> +    /* Cluster Power Controller */
> +    object_initialize_child(OBJECT(dev), "cpc", &s->cpc, TYPE_RISCV_CPC);
> +    object_property_set_uint(OBJECT(&s->cpc), "cluster-id", 0,
> +                            &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpc), "num-vp", s->num_vp,
> +                            &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpc), "num-hart", s->num_hart,
> +                            &error_abort);
> +    object_property_set_uint(OBJECT(&s->cpc), "num-core", s->num_core,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(&s->cpc), "vp-start-running", 1,
> +                            &error_abort);

(1 is already the default)

> +
> +    /* Pass CPU array to CPC */
> +    s->cpc.cpus = s->cpus;

Please do that using a link property.

> +
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpc), errp)) {
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&s->container, 0,
> +                            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cpc), 0));
> +
> +    /* Global Configuration Registers */
> +    object_initialize_child(OBJECT(dev), "gcr", &s->gcr, TYPE_RISCV_GCR);
> +    object_property_set_uint(OBJECT(&s->gcr), "cluster-id", 0,
> +                            &error_abort);
> +    object_property_set_uint(OBJECT(&s->gcr), "num-vp", s->num_vp,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(&s->gcr), "gcr-rev", 0xa00,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(&s->gcr), "gcr-base", s->gcr_base,
> +                            &error_abort);
> +    object_property_set_link(OBJECT(&s->gcr), "cpc", OBJECT(&s->cpc.mr),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gcr), errp)) {
> +        return;
> +    }
> +
> +    memory_region_add_subregion(&s->container, s->gcr_base,
> +                            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gcr), 0));
> +
> +    for (i = 0; i < num_of_clusters; i++) {
> +        uint64_t cm_base = GLOBAL_CM_BASE + (CM_SIZE * i);
> +        uint32_t hartid_base = i << MHARTID_CLUSTER_SHIFT;
> +        s->aplic = riscv_aplic_create(cm_base + AIA_PLIC_M_OFFSET,
> +                                      AIA_PLIC_M_SIZE,
> +                                      hartid_base, /* hartid_base */
> +                                      MAX_HARTS, /* num_harts */
> +                                      APLIC_NUM_SOURCES,
> +                                      APLIC_NUM_PRIO_BITS,
> +                                      false, true, NULL);
> +        riscv_aplic_create(cm_base + AIA_PLIC_S_OFFSET,
> +                           AIA_PLIC_S_SIZE,
> +                           hartid_base, /* hartid_base */
> +                           MAX_HARTS, /* num_harts */
> +                           APLIC_NUM_SOURCES,
> +                           APLIC_NUM_PRIO_BITS,
> +                           false, false, s->aplic);
> +        /* PLIC changes msi_nonbroken to ture. We revert the change. */
> +        msi_nonbroken = false;
> +        riscv_aclint_swi_create(cm_base + AIA_CLINT_OFFSET,
> +                                hartid_base, MAX_HARTS, false);
> +        riscv_aclint_mtimer_create(cm_base + AIA_CLINT_OFFSET +
> +                                   RISCV_ACLINT_SWI_SIZE,
> +                                   RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
> +                                   hartid_base,
> +                                   MAX_HARTS,
> +                                   RISCV_ACLINT_DEFAULT_MTIMECMP,
> +                                   RISCV_ACLINT_DEFAULT_MTIME,
> +                                   RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> +    }
> +}


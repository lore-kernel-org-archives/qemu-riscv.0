Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A9CC7EE29
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 09:54:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7CK8-0005OU-1U; Thu, 08 Jun 2023 05:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q7CK6-0005NX-Er
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 05:52:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q7CK4-0005IB-OE
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 05:52:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f7368126a6so2346335e9.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 02:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686217971; x=1688809971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dy/cSgZrDqPJDVylTW26ngzTBpvyZdkyXQ36fXmZb1g=;
 b=h3mLwbbHvqVdwXjrwZOBTz9U7LJ0ibWI4NfN3hU9gMZrU8p5lcJ6i1c3KFdWuKkqyb
 2TksLeId7f3YHfRi72RL7VhIRrnG+K/jan03PnmGM/MWcidZPCxytRQ/zOsr7PmeiYcX
 e1/A8GB3GwA5y7lCXUBljJctvH1lBDYxVPdkfVRh7SkBNzUh5aDxatqycPQBCCRw0H0P
 zobMDTXS6eCtp/BKl6wfb75fZg+ZSS4dCoErkJ5N1OcXpkNixYBAEh4WOPQOJK/sclKZ
 FdI9eCcnCJitigZ9pVmAnT5R5YDDTUKWm7GVm37RHLPx8S4q/JkdUcRih2PtCernsmHP
 ewfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686217971; x=1688809971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dy/cSgZrDqPJDVylTW26ngzTBpvyZdkyXQ36fXmZb1g=;
 b=ZzazrVwmlxI1Ljhh2ROe8rwD5y6EtKFtEzbcI9y3d5JKfO6+MUuCr4MJ25qcWX2Zd1
 3hiJbxarzoO0R1Robn1JPP27OwVhsz/+nKXXi6c+vTf1hN0l1Aje1wht5fXUAbKmYpDd
 Glt6rrW3Tn3IddM6aBsvJNfNZo2ycV4TfHyaW9Q3MHBL9EU350uk/OgyBaOYBgIKm5ab
 xhfGNJwPVBiaNqp/qbnRWFOfKTtAZup8nfVRpEGEmRUhzh2+f+Ey/cSvgyB41oKucb4/
 UZvA0BcXBnYfsLO5b+Zk7FcqzsE/FM6gfIwXW4/R0z1F+mJB7CzT3G3D+dYP0gbG12bx
 ysrg==
X-Gm-Message-State: AC+VfDyYuFUgZvPKWXhIUvcMsoIx17IDWSu+betzZKZkbBLTgTKuxDtQ
 lpirOyetvwcXhLcAmhXQMkeD9g==
X-Google-Smtp-Source: ACHHUZ5nmqy8v1wHLqPc/tOmO5jtc41FBmrYhpjbNbM5GQEYLzncS/KiJLXW5iRDhDscBizibHOSOw==
X-Received: by 2002:a05:600c:2056:b0:3f4:298f:4d01 with SMTP id
 p22-20020a05600c205600b003f4298f4d01mr942536wmg.26.1686217970818; 
 Thu, 08 Jun 2023 02:52:50 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a7bc8ca000000b003f7f249e7dfsm4257693wml.4.2023.06.08.02.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 02:52:50 -0700 (PDT)
Date: Thu, 8 Jun 2023 11:52:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 richard.henderson@linaro.org
Subject: Re: [PATCH v4 1/4] target/riscv: Add Smrnmi cpu extension.
Message-ID: <20230608-7ebd80b284771a7478d3c6a0@orel>
References: <20230608072314.3561109-1-tommy.wu@sifive.com>
 <20230608072314.3561109-2-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608072314.3561109-2-tommy.wu@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Please add a commit message to all patches of the series.

Another comment below.

On Thu, Jun 08, 2023 at 12:23:11AM -0700, Tommy Wu wrote:
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> ---
>  hw/riscv/riscv_hart.c         | 21 +++++++++++++++++++++
>  include/hw/riscv/riscv_hart.h |  4 ++++
>  target/riscv/cpu.c            | 13 +++++++++++++
>  target/riscv/cpu.h            |  7 +++++++
>  target/riscv/cpu_bits.h       | 12 ++++++++++++
>  target/riscv/cpu_helper.c     | 24 ++++++++++++++++++++++++
>  6 files changed, 81 insertions(+)
> 
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index 613ea2aaa0..eac18f8c29 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -33,6 +33,12 @@ static Property riscv_harts_props[] = {
>      DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
>      DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
>                         DEFAULT_RSTVEC),
> +    DEFINE_PROP_ARRAY("rnmi-interrupt-vector", RISCVHartArrayState,
> +                      num_rnmi_irqvec, rnmi_irqvec, qdev_prop_uint64,
> +                      uint64_t),
> +    DEFINE_PROP_ARRAY("rnmi-exception-vector", RISCVHartArrayState,
> +                      num_rnmi_excpvec, rnmi_excpvec, qdev_prop_uint64,
> +                      uint64_t),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -47,6 +53,21 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
>  {
>      object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
>      qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
> +
> +    if (s->harts[idx].cfg.ext_smrnmi) {
> +        if (s->rnmi_irqvec) {
> +            qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
> +                                 "rnmi-interrupt-vector",
> +                                 s->rnmi_irqvec[idx]);
> +        }
> +
> +        if (s->rnmi_excpvec) {
> +            qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
> +                                 "rnmi-exception-vector",
> +                                 s->rnmi_excpvec[idx]);
> +        }
> +    }
> +
>      s->harts[idx].env.mhartid = s->hartid_base + idx;
>      qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
>      return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
> index bbc21cdc9a..99c0ac5009 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -38,6 +38,10 @@ struct RISCVHartArrayState {
>      uint32_t hartid_base;
>      char *cpu_type;
>      uint64_t resetvec;
> +    uint32_t num_rnmi_irqvec;
> +    uint64_t *rnmi_irqvec;
> +    uint32_t num_rnmi_excpvec;
> +    uint64_t *rnmi_excpvec;
>      RISCVCPU *harts;
>  };
>  
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db0875fb43..c8dc0eaa87 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>      ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
>      ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
>      ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
>      ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
> @@ -1404,6 +1405,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>          g_assert_not_reached();
>      }
>  }
> +
> +static void riscv_cpu_set_nmi(void *opaque, int irq, int level)
> +{
> +    riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);
> +}
>  #endif /* CONFIG_USER_ONLY */
>  
>  static void riscv_cpu_init(Object *obj)
> @@ -1420,6 +1426,8 @@ static void riscv_cpu_init(Object *obj)
>  #ifndef CONFIG_USER_ONLY
>      qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
>                        IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
> +    qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
> +                            "riscv.cpu.rnmi", RNMI_MAX);
>  #endif /* CONFIG_USER_ONLY */
>  }
>  
> @@ -1600,6 +1608,7 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>      DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
> +    DEFINE_PROP_BOOL("x-smrnmi", RISCVCPU, cfg.ext_smrnmi, false),
>  
>      DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
>      DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
> @@ -1644,6 +1653,10 @@ static Property riscv_cpu_properties[] = {
>  
>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>      DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
> +    DEFINE_PROP_UINT64("rnmi-interrupt-vector", RISCVCPU, env.rnmi_irqvec,
> +                       DEFAULT_RNMI_IRQVEC),
> +    DEFINE_PROP_UINT64("rnmi-exception-vector", RISCVCPU, env.rnmi_excpvec,
> +                       DEFAULT_RNMI_EXCPVEC),

Why are these addresses user configurable? Shouldn't each board set them
to whatever the real board uses and a generic board, like 'virt', set
them to whatever works for it, considering the rest of its memory map?
Also, looking ahead, I don't see where the addresses are described to the
M-mode software in the DT, which implies board-specific M-mode software
would hard code it, but generic M-mode software should get the addresses
from the DT. And, presumably, M-mode software should protect and reserve
these addresses from S-mode. It'd be nice to see an M-mode software PoC,
but I didn't see anything on the opensbi mailing list.

Thanks,
drew


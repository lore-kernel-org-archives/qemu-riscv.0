Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF764D462A5
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 14:04:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBDz4-0000Oc-Uu; Wed, 13 Nov 2024 09:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1tBCdt-0001yh-27
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 07:38:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1tBCdp-00031i-1C
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 07:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731501514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UOTlncNEO9Kx84sp4x+4qsgShYgzgpOfBmXzjv0lRKA=;
 b=D6NOgsBXyDPrSC7w1z0oyPk2Ealdbmo6QxvyRrHXroVAJn5KWYNfUyy1B7JoeshO7pMXk1
 kJzbD0qTUnqM6ibJrmyD3p+LAWyYUVWBZr5B4YbjG+ODz31x7qTRlmV+Fal7NTqCUr/uhs
 NcrZArw7HiNgDfi95kIh+JQA/87i9uw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-a6egGPGXOCGWQV40FAEZrg-1; Wed, 13 Nov 2024 07:38:33 -0500
X-MC-Unique: a6egGPGXOCGWQV40FAEZrg-1
X-Mimecast-MFC-AGG-ID: a6egGPGXOCGWQV40FAEZrg
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-53da203141bso594940e87.1
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 04:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731501511; x=1732106311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UOTlncNEO9Kx84sp4x+4qsgShYgzgpOfBmXzjv0lRKA=;
 b=IRNZ9tBuvIlJs0b1IGbPGa6cavnXPb6w7k4fLJxedAfvnZHr2xBdqWTb3Cy/J9Lnmo
 ++hrulUfiqfaRCElsLCBsFanNDtg6vWYX8JWCIqK97bJYUGrGKNKLGNosZmmZzqixQWr
 pjwmBgHOWl91AEuU5b1kvkXGI8HqI+ZTuBmXKmjDrJiCOwFokpGN6Io0rthzHqSIhLUU
 My09cnRNMMXWR0mTHCvDbtpscDr911fn1oxQxfi71yEHGzp6hiVAlqlqepAqCEeu5o6s
 12jr1DNe94IrP/srNX9Pr60BzZNerSK98+VcP1LR0cR7fXx+c7z74H/k7/r3J04eLegf
 OUvg==
X-Gm-Message-State: AOJu0Yw9WhkgkvUawtmFfrZrDozHqC7XmmkZ2l3v9Y48P76j9rpcm3HJ
 nni0Zm/yo5GImVskqLimGYUwNMvUN0mC4Q2uSzpBqp2FjHdo8L6EEFgCH7gRIEEtvgc0ZpVOy2a
 peUitXRqR2qQCOFHxYFKzJX3VBxu17QobKMmlpBY9up/GvVX7soyQX6yD0PeguUeGfZ5fIgY7Z5
 bhVlCHlvmBajZKZeJecEx3pu/gvT0=
X-Received: by 2002:a05:6512:3e29:b0:539:df2f:e115 with SMTP id
 2adb3069b0e04-53d862c5dcfmr10623320e87.23.1731501511503; 
 Wed, 13 Nov 2024 04:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqZNb+SSpHtxQT/Sn5rLJY9l44cJvbLZf7izRPXsvk3NwqkzeGkwHKaUfQUDFiQiCWZ2Mi+6fFvMa0UlZoD+g=
X-Received: by 2002:a05:6512:3e29:b0:539:df2f:e115 with SMTP id
 2adb3069b0e04-53d862c5dcfmr10623303e87.23.1731501511054; Wed, 13 Nov 2024
 04:38:31 -0800 (PST)
MIME-Version: 1.0
References: <20241113110459.1607299-1-antonb@tenstorrent.com>
In-Reply-To: <20241113110459.1607299-1-antonb@tenstorrent.com>
From: Prasad Pandit <ppandit@redhat.com>
Date: Wed, 13 Nov 2024 18:08:14 +0530
Message-ID: <CAE8KmOyCGwG36C+9eSGfcRWfEiqL1Uk-tQc2Kex2P9OHVP3vTA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Add Tenstorrent Ascalon CPU
To: Anton Blanchard <antonb@tenstorrent.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o1exuoNmu8Y2j4kEtTVmS-JMVElbwkluGSUh-o_BR0Y_1731501512
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.119,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Nov 2024 09:04:38 -0500
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

On Wed, 13 Nov 2024 at 16:36, Anton Blanchard <antonb@tenstorrent.com> wrote:
> Add a CPU entry for the Tenstorrent Ascalon CPU, a series of 2 wide to
> 8 wide RV64 cores. More details can be found at
> https://tenstorrent.com/ip/tt-ascalon
>
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 67 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)

v1: https://lore.kernel.org/qemu-devel/20241108230709.1466634-1-antonb@tenstorrent.com/T/#u

* We need to share a link to an earlier discussion/version of the patch. ^^

> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 62115375cd..6547642287 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -49,6 +49,7 @@
>  #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
>  #define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
>  #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
> +#define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalon")
>  #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>
>  OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f219f0c3b5..8447ad0dfb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -579,6 +579,72 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>  #endif
>  }
>
> +/* Tenstorrent Ascalon */

* This comment looks redundant, does not help much.

> +static void rv64_tt_ascalon_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
> +    riscv_cpu_set_misa_ext(env, RVG | RVC | RVS | RVU | RVH | RVV);
> +    env->priv_ver = PRIV_VERSION_1_13_0;
> +
> +    /* Enable ISA extensions */
> +    cpu->cfg.mmu = true;
> +    cpu->cfg.vlenb = 256 >> 3;
> +    cpu->cfg.elen = 64;
> +    cpu->env.vext_ver = VEXT_VERSION_1_00_0;
> +    cpu->cfg.rvv_ma_all_1s = true;
> +    cpu->cfg.rvv_ta_all_1s = true;
> +    cpu->cfg.misa_w = true;
> +    cpu->cfg.pmp = true;
> +    cpu->cfg.cbom_blocksize = 64;
> +    cpu->cfg.cbop_blocksize = 64;
> +    cpu->cfg.cboz_blocksize = 64;
> +    cpu->cfg.ext_zic64b = true;
> +    cpu->cfg.ext_zicbom = true;
> +    cpu->cfg.ext_zicbop = true;
> +    cpu->cfg.ext_zicboz = true;
> +    cpu->cfg.ext_zicntr = true;
> +    cpu->cfg.ext_zicond = true;
> +    cpu->cfg.ext_zicsr = true;
> +    cpu->cfg.ext_zifencei = true;
> +    cpu->cfg.ext_zihintntl = true;
> +    cpu->cfg.ext_zihintpause = true;
> +    cpu->cfg.ext_zihpm = true;
> +    cpu->cfg.ext_zimop = true;
> +    cpu->cfg.ext_zawrs = true;
> +    cpu->cfg.ext_zfa = true;
> +    cpu->cfg.ext_zfbfmin = true;
> +    cpu->cfg.ext_zfh = true;
> +    cpu->cfg.ext_zfhmin = true;
> +    cpu->cfg.ext_zcb = true;
> +    cpu->cfg.ext_zcmop = true;
> +    cpu->cfg.ext_zba = true;
> +    cpu->cfg.ext_zbb = true;
> +    cpu->cfg.ext_zbs = true;
> +    cpu->cfg.ext_zkt = true;
> +    cpu->cfg.ext_zvbb = true;
> +    cpu->cfg.ext_zvbc = true;
> +    cpu->cfg.ext_zvfbfmin = true;
> +    cpu->cfg.ext_zvfbfwma = true;
> +    cpu->cfg.ext_zvfh = true;
> +    cpu->cfg.ext_zvfhmin = true;
> +    cpu->cfg.ext_zvkng = true;
> +    cpu->cfg.ext_smaia = true;
> +    cpu->cfg.ext_smstateen = true;
> +    cpu->cfg.ext_ssaia = true;
> +    cpu->cfg.ext_sscofpmf = true;
> +    cpu->cfg.ext_sstc = true;
> +    cpu->cfg.ext_svade = true;
> +    cpu->cfg.ext_svinval = true;
> +    cpu->cfg.ext_svnapot = true;
> +    cpu->cfg.ext_svpbmt = true;
> +
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
> +#endif
> +}
> +
>  #ifdef CONFIG_TCG
>  static void rv128_base_cpu_init(Object *obj)
>  {
> @@ -2982,6 +3048,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U54, MXL_RV64,  rv64_sifive_u_cpu_init),
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SHAKTI_C,   MXL_RV64,  rv64_sifive_u_cpu_init),
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906, MXL_RV64,  rv64_thead_c906_cpu_init),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_TT_ASCALON, MXL_RV64,  rv64_tt_ascalon_cpu_init),
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,  MXL_RV64,  rv64_veyron_v1_cpu_init),
>  #ifdef CONFIG_TCG
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,   MXL_RV128, rv128_base_cpu_init),
> --

Rest looks okay.

Thank you.
---
  - Prasad



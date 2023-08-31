Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D72FC83F10
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 08:43:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbdGH-0001eC-Lv; Thu, 31 Aug 2023 04:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbdGF-0001c6-1c
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 04:42:43 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbdGA-00033j-U8
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 04:42:41 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5256d74dab9so644164a12.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 01:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693471355; x=1694076155; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gDFKuq03eMCHLbMsGMmFE3EEmuQZaDoeVrm8H+xKAYA=;
 b=kuMK9sxVZs2g/I6WWyD+MrkIZxsojTXDxNvRUxJB3z/mrLigLPtl7VOfSrCs4zKxBp
 pfDPnIxQCOLYHzsbokW2P0QemQbT30nateDbZAhyw2Zh/NGecsi5b6JwkJQ1Oe/ItrCQ
 KWu7JnbjTp3UQNl0k0my8+ELWxodSRo5ZBlIOeuvSuqc16SWaDV6LVh9Lt0291+xPvFr
 tc7l1st2njVSC0KRWvD/gJmQYTYDBSdCoWpMcn5y7TgFDPL5Iz2OL/z82oqvIvRTxhzP
 Tq7lQvlW/9dVALWPqUiAHgy8uwpe5zTjB0aahowhjC08hAcpSjDLpHEwfaNyGepwPcEH
 lycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693471355; x=1694076155;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gDFKuq03eMCHLbMsGMmFE3EEmuQZaDoeVrm8H+xKAYA=;
 b=SZdGtX7yT1m/liWD+LfMJ7OcLO/4JNr1F9s344F4k/0xvrwukWvf0wqfYp7MNipghW
 ILOZ129vWVwFj7jPRCwDaxMEO1+GUvxf5RV5Rjn5m3pbITykDaEGUhtilCjF+mTLGCsL
 v6YSw9Yw/eCJR2ovELjyuPEQaIzMogZmYQVa4B8kfbcYQMtcihY0DkvUukGb313ifMnv
 P63osrkxcIfycdonhhAYx9EgaJBPsE3E/jwAuSEVJYKOqXbWBoh0GblACyKb4LkheHg4
 mLMZ1osPOOH7dFz5eNtOzErTuETY5XJdjQbF9hmWPMOLtZLA34RX0HmuU1sl0nyNPyiI
 7m8A==
X-Gm-Message-State: AOJu0YyTMPPOFyuuqDYjl/oRAHtpjseblwzPy/ZA9o77Eclqv6vg3fl+
 sYWwZouVroARDr5L29++Z5t6aA==
X-Google-Smtp-Source: AGHT+IFlNIql9KDCuMbv4dvHw7Z98i2xQN+mIyYK0TpbDJVvicMDkRI5hb/yxwbUZWfzPMyEGSFSNA==
X-Received: by 2002:a05:6402:646:b0:526:9c4:bc06 with SMTP id
 u6-20020a056402064600b0052609c4bc06mr3433979edx.18.1693471355508; 
 Thu, 31 Aug 2023 01:42:35 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 e23-20020aa7d7d7000000b00525683f9b2fsm525212eds.5.2023.08.31.01.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 01:42:34 -0700 (PDT)
Date: Thu, 31 Aug 2023 10:42:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org
Subject: Re: [PATCH v2 1/2] hw/riscv/virt.c: fix non-KVM --enable-debug build
Message-ID: <20230831-d3b40182209cb9054ceaed62@orel>
References: <20230830133503.711138-1-dbarboza@ventanamicro.com>
 <20230830133503.711138-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830133503.711138-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x536.google.com
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

On Wed, Aug 30, 2023 at 10:35:02AM -0300, Daniel Henrique Barboza wrote:
> A build with --enable-debug and without KVM will fail as follows:
> 
> /usr/bin/ld: libqemu-riscv64-softmmu.fa.p/hw_riscv_virt.c.o: in function `virt_machine_init':
> ./qemu/build/../hw/riscv/virt.c:1465: undefined reference to `kvm_riscv_aia_create'
> 
> This happens because the code block with "if virt_use_kvm_aia(s)" isn't
> being ignored by the debug build, resulting in an undefined reference to
> a KVM only function.
> 
> Add a 'kvm_enabled()' conditional together with virt_use_kvm_aia() will
> make the compiler crop the kvm_riscv_aia_create() call entirely from a
> non-KVM build. Note that adding the 'kvm_enabled()' conditional inside
> virt_use_kvm_aia() won't fix the build because this function would need
> to be inlined multiple times to make the compiler zero out the entire
> block.
> 
> While we're at it, use kvm_enabled() in all instances where
> virt_use_kvm_aia() is checked to allow the compiler to elide these other
> kvm-only instances as well.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Fixes: dbdb99948e ("target/riscv: select KVM AIA in riscv virt machine")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 388e52a294..3b259b9305 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -782,7 +782,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>      }
>  
>      /* KVM AIA only has one APLIC instance */
> -    if (virt_use_kvm_aia(s)) {
> +    if (kvm_enabled() && virt_use_kvm_aia(s)) {
>          create_fdt_socket_aplic(s, memmap, 0,
>                                  msi_m_phandle, msi_s_phandle, phandle,
>                                  &intc_phandles[0], xplic_phandles,
> @@ -808,7 +808,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
>  
>      g_free(intc_phandles);
>  
> -    if (virt_use_kvm_aia(s)) {
> +    if (kvm_enabled() && virt_use_kvm_aia(s)) {
>          *irq_mmio_phandle = xplic_phandles[0];
>          *irq_virtio_phandle = xplic_phandles[0];
>          *irq_pcie_phandle = xplic_phandles[0];
> @@ -1461,7 +1461,7 @@ static void virt_machine_init(MachineState *machine)
>          }
>      }
>  
> -    if (virt_use_kvm_aia(s)) {
> +    if (kvm_enabled() && virt_use_kvm_aia(s)) {
>          kvm_riscv_aia_create(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
>                               VIRT_IRQCHIP_NUM_SOURCES, VIRT_IRQCHIP_NUM_MSIS,
>                               memmap[VIRT_APLIC_S].base,
> -- 
> 2.41.0
> 
>

I think I'd prefer

 /* We need this inlined for debug (-O0) builds */
 static inline QEMU_ALWAYS_INLINE bool virt_use_kvm_aia(RISCVVirtState *s)
 {
    return kvm_enabled() && kvm_irqchip_in_kernel() && s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC;
 }

assuming that works.

Either way,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


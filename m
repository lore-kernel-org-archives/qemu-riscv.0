Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D4C021AA
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 14:08:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tk1mq-0004WW-4d; Mon, 17 Feb 2025 09:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tk1mo-0004W9-M1
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 09:07:50 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tk1mm-0007VL-Sy
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 09:07:50 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f2f748128so1367704f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1739801267; x=1740406067; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PmgIdukFgg81QXZfPCUuO0nynNv6ogOqUR1G17GCxqc=;
 b=IwCguBIoJaRXYMdJTaH7BwoxbHSiujF358e0R13CEyDJNDsxFTSzq47pfQTy1YXXE4
 nrJFl8aYKwcbeP9iykDwPM15nxVca8VrSMk7KgEwrzgCCdeVGOaU1a6TnrIFVYNE/CGx
 Z3fczXjAEG2b0mMbfMRyCMBV27bWj6NV+B8BJ8aY2tKkt+UBmlSh3YW3fsIfAa1++NRi
 O47D32zlRS/UklhJQj+FhI174nXy1Xo2RNI+/QosW7l+r7G8u5NfhnQd8Rs1Ld4yV8W2
 iyzqjWklCDsKimdJJ0z+m5un4Fzr3KM5zgg0gTD/7EJeQQplejRXEJRouuZYKh8d7D8J
 ChOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801267; x=1740406067;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PmgIdukFgg81QXZfPCUuO0nynNv6ogOqUR1G17GCxqc=;
 b=i7ssbXIrSfsWMINQKfUSsHvjOdJ0PKXUyTGufLkpK+pihbUiuD788jcc4W0pUW1nzE
 9gtKMCs2dr+AWIL2R2ziDaKTItMQYEnN/Fo6rsthVuuLG0q2BnROBkb2d3rxXDuICRvI
 5c4Nom6IV/2vKpOgVBwhAwvvhXtI17JOZH04laLFno4+Nwg8CQb5Ofp4LOg1cWP9Hgn/
 UMUBtVWLVIuu31zhTAaVBgAvmiZ1suz2iu2Unv2JqDVDy7vIqSPFt7gj9gN7c7/vh7kW
 QOKFFrwTBRNpDboBYGAZ9W7GV7KzicPS5+pGWhiJrtouiuNV8WfFpXBP4V7nQPailDsH
 pVcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbgRatZfI2D7wmdqM2BoVSWVA/1VJcX8FbgKu93Wf9h4sbQlBRCaFRGSsW0xyiKFfcUIEGzPMmANMT@nongnu.org
X-Gm-Message-State: AOJu0YxLH7eMJC42ClCm9qQlzKfC1x/jXVo7+78CqKSJ8dyp5hyuo1KG
 dWELEB/gd0GECgCFR21mr0XcoprvLB4uuYu5YB2Fc8jbwE7Iyev6dBPC049jc/M=
X-Gm-Gg: ASbGnctQzbTHz6pgmRXjfxD7Xdc8nWcgDeqCyF/DZE2d+AAjCPHk9VzvZKlaeDTAYuV
 YjUqE1gk8kmDFFQsuAA4m50czsGMFtkxk4dEPbNSnrWqa5Ri/5t/zmm8VbgjRRFh+QEzS3x65GZ
 2kjTrJUJE/mv2DKWyxCQKhJXJN5T4tV7/Qcga+huxzfeXm4OO4ZZw+9tfS3tjuaI1e0zpDMU2pO
 UrV7I5HOK8Cgs0wtaNgCJuwDsxWW12b/FKUSn/pi7CyXPpJW6w5W0Nab1x9AtXHvcUVdvidAAWm
 2JY=
X-Google-Smtp-Source: AGHT+IGe7x0l83EZz1S/BnhFgczyBH4ehZ+RcGMIT/e8NK1/Km22GXFwIO145autYnZjIxvKc/jHdA==
X-Received: by 2002:a05:6000:18a9:b0:38b:ed1c:a70d with SMTP id
 ffacd0b85a97d-38f33e87e68mr12298332f8f.0.1739801266538; 
 Mon, 17 Feb 2025 06:07:46 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b432asm12115256f8f.6.2025.02.17.06.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:07:46 -0800 (PST)
Date: Mon, 17 Feb 2025 15:07:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 7/8] target/riscv/kvm: rename riscv-aia to riscv-imsic
Message-ID: <20250217-9d3c0d38ed66b1a8257b4515@orel>
References: <20250217081730.9000-1-yongxuan.wang@sifive.com>
 <20250217081730.9000-8-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217081730.9000-8-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42d.google.com
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

On Mon, Feb 17, 2025 at 04:17:27PM +0800, Yong-Xuan Wang wrote:
> The riscv-aia property only controls the in-kernel IMSIC mode, the
> emulation of AIA MSI mode is controlled by the kernel-irqchip property.
> Rename the riscv-aia property to riscv-imsic to prevent the confusion.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 52 ++++++++++++++++++++------------------
>  1 file changed, 27 insertions(+), 25 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c047d5f36951..ab53b76ab81f 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1798,9 +1798,9 @@ void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
>      }
>  }
>  
> -static int aia_mode;
> +static int imsic_mode;
>  
> -static const char *kvm_aia_mode_str(uint64_t mode)
> +static const char *kvm_imsic_mode_str(uint64_t mode)
>  {
>      switch (mode) {
>      case KVM_DEV_RISCV_AIA_MODE_EMUL:
> @@ -1813,19 +1813,19 @@ static const char *kvm_aia_mode_str(uint64_t mode)
>      };
>  }
>  
> -static char *riscv_get_kvm_aia(Object *obj, Error **errp)
> +static char *riscv_get_kvm_imsic(Object *obj, Error **errp)
>  {
> -    return g_strdup(kvm_aia_mode_str(aia_mode));
> +    return g_strdup(kvm_imsic_mode_str(imsic_mode));
>  }
>  
> -static void riscv_set_kvm_aia(Object *obj, const char *val, Error **errp)
> +static void riscv_set_kvm_imsic(Object *obj, const char *val, Error **errp)
>  {
>      if (!strcmp(val, "emul")) {
> -        aia_mode = KVM_DEV_RISCV_AIA_MODE_EMUL;
> +        imsic_mode = KVM_DEV_RISCV_AIA_MODE_EMUL;
>      } else if (!strcmp(val, "hwaccel")) {
> -        aia_mode = KVM_DEV_RISCV_AIA_MODE_HWACCEL;
> +        imsic_mode = KVM_DEV_RISCV_AIA_MODE_HWACCEL;
>      } else if (!strcmp(val, "auto")) {
> -        aia_mode = KVM_DEV_RISCV_AIA_MODE_AUTO;
> +        imsic_mode = KVM_DEV_RISCV_AIA_MODE_AUTO;
>      } else {
>          error_setg(errp, "Invalid KVM AIA mode");
>          error_append_hint(errp, "Valid values are emul, hwaccel, and auto.\n");
> @@ -1834,13 +1834,15 @@ static void riscv_set_kvm_aia(Object *obj, const char *val, Error **errp)
>  
>  void kvm_arch_accel_class_init(ObjectClass *oc)
>  {
> -    object_class_property_add_str(oc, "riscv-aia", riscv_get_kvm_aia,
> -                                  riscv_set_kvm_aia);
> -    object_class_property_set_description(oc, "riscv-aia",
> -        "Set KVM AIA mode. Valid values are 'emul', 'hwaccel' and 'auto'. "
> -        "Changing KVM AIA modes relies on host support. Defaults to 'auto' "
> -        "if the host supports it");
> -    object_property_set_default_str(object_class_property_find(oc, "riscv-aia"),
> +    object_class_property_add_str(oc, "riscv-imsic", riscv_get_kvm_imsic,
> +                                  riscv_set_kvm_imsic);
> +    object_class_property_set_description(oc, "riscv-imsic",
> +        "Set KVM IMSIC mode. Valid values are 'emul', 'hwaccel' and 'auto'. "
> +        "Changing KVM IMSIC modes relies on host support. Defaults to 'auto' "
> +        "if the host supports it. This property only takes effect when the "
> +        "kernel-irqchip=on|split when using AIA MSI.");
> +    object_property_set_default_str(object_class_property_find(oc,
> +                                                               "riscv-imsic"),
>                                      "auto");

We can't change property names without deprecating the old name (which
isn't likely worth it).

Thanks,
drew


>  }
>  
> @@ -1851,7 +1853,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>  {
>      int ret, i;
>      int aia_fd = -1;
> -    uint64_t default_aia_mode;
> +    uint64_t default_imsic_mode;
>      uint64_t socket_count = riscv_socket_count(machine);
>      uint64_t max_hart_per_socket = 0;
>      uint64_t socket, base_hart, hart_count, socket_imsic_base, imsic_addr;
> @@ -1867,24 +1869,24 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>  
>      ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
>                              KVM_DEV_RISCV_AIA_CONFIG_MODE,
> -                            &default_aia_mode, false, NULL);
> +                            &default_imsic_mode, false, NULL);
>      if (ret < 0) {
> -        error_report("KVM AIA: failed to get current KVM AIA mode");
> +        error_report("KVM AIA: failed to get current KVM IMSIC mode");
>          exit(1);
>      }
>  
> -    if (default_aia_mode != aia_mode) {
> +    if (default_imsic_mode != imsic_mode) {
>          ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
>                                  KVM_DEV_RISCV_AIA_CONFIG_MODE,
> -                                &aia_mode, true, NULL);
> +                                &imsic_mode, true, NULL);
>          if (ret < 0) {
> -            warn_report("KVM AIA: failed to set KVM AIA mode '%s', using "
> +            warn_report("KVM AIA: failed to set KVM IMSIC mode '%s', using "
>                          "default host mode '%s'",
> -                        kvm_aia_mode_str(aia_mode),
> -                        kvm_aia_mode_str(default_aia_mode));
> +                        kvm_imsic_mode_str(imsic_mode),
> +                        kvm_imsic_mode_str(default_imsic_mode));
>  
> -            /* failed to change AIA mode, use default */
> -            aia_mode = default_aia_mode;
> +            /* failed to change IMSIC mode, use default */
> +            imsic_mode = default_imsic_mode;
>          }
>      }
>  
> -- 
> 2.17.1
> 


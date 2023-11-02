Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC98C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 13:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyXFM-0000iu-LR; Thu, 02 Nov 2023 08:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyXFH-0000i5-V5
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 08:56:23 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyXFF-0005cR-U8
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 08:56:23 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6bd73395bceso770712b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 05:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698929780; x=1699534580; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RotDW/GtWu/s795efn/lt+82Q8L5Ej1qyRZIGLQ1Jcs=;
 b=i9zIniQZsNL7UPpaeWIWxxxxPCpe2k6dyNKLvTzc0wMZJiBQ8KF1RJE4dYeSKXtxEq
 KQLqHUQnfMbaWk0D6juolCsCd2ZgbczRI3N4UWbCnDPv04tneY7WdYe71t9YdlQ/UG+m
 Me3aWMzlmuQKok99emI4GcWDgASepXR9yms0/ta0NZ6hhcOFG2oBR5euYqk+YJHiKjlI
 lCFtz5tNu3AX3LFrNIuKSWb/QHlsxUI0UZ67Nyr0tEb1ZrXMInn+fZnpOzNCW1gIQKiK
 99LcBOpfOFdPstxmsFpYiuNWy5kNv+9qDUDp8lZdskEFJgrg7hff5ntBbAwf/eHfcKW+
 AJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698929780; x=1699534580;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RotDW/GtWu/s795efn/lt+82Q8L5Ej1qyRZIGLQ1Jcs=;
 b=mn7n9L7xYXg7i4RXJbyMTUciiVvuL+C8fAuDnA0zp31qbvygNSJBlAYVXOsJX+PC4E
 mE2psIF0F41okTJ7ek0M4zJf8SAzKmtdA1YCoauepaO3wid7kGhmj33zVT2CtG+fSFPg
 WH63JPRRmUOsPZdBv37x0HDv0IJu6REowg1si3XA9+GYDA/2aZaLtx/mPnObgNcYZ4f5
 J4g/BzP10F6fbcwlTMKTX3vkduKra2rThgxmFYiD720k9d5QOrxZZPNM+D1Oyi73wMql
 V9olmQN7Aq2fkFCwX+OpHozj6Ps8QolN9LV7tul0XDtchdlTjvEIVApNQ7dLdBpBKtXY
 7t0Q==
X-Gm-Message-State: AOJu0YzHZ3Bp5phex1MzR1l/XNGoo3spAzBMzqPNDr2cHODF/1l90to3
 5Udq7g2ITQCuogsWlPAwpHAHtA==
X-Google-Smtp-Source: AGHT+IEUjnOWeSUjA0+adpuSGr13qB7eAaMO2Jg53s4rFogXJCrjDVLY/P242QFCbL0hKyMCxK0nGQ==
X-Received: by 2002:a05:6a00:3a1c:b0:6c3:415a:5c05 with SMTP id
 fj28-20020a056a003a1c00b006c3415a5c05mr901292pfb.14.1698929780158; 
 Thu, 02 Nov 2023 05:56:20 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78]) by smtp.gmail.com with ESMTPSA id
 n27-20020a056a000d5b00b006879493aca0sm2839538pfv.26.2023.11.02.05.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 05:56:19 -0700 (PDT)
Date: Thu, 2 Nov 2023 18:26:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v5 02/13] hw/arm/virt-acpi-build.c: Migrate virtio
 creation to common location
Message-ID: <ZUOcZ0CS1njX/OcJ@sunil-laptop>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
 <20231030132058.763556-3-sunilvl@ventanamicro.com>
 <fea78511-d3fa-4ad4-860f-419cd1845e1f@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fea78511-d3fa-4ad4-860f-419cd1845e1f@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42b.google.com
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

On Thu, Nov 02, 2023 at 09:10:05AM -0300, Daniel Henrique Barboza wrote:
> Alistair, Sunil,
> 
> This patch is breaking riscv-to-apply.next build when using 'clang' and
> --enable-debug:
> 
> URCE=600 -DNCURSES_WIDECHAR=1 -DSTRUCT_IOVEC_DEFINED -MD -MQ libcommon.fa.p/hw_virtio_virtio-acpi.c.o -MF libcommon.fa.p/hw_virtio_virtio-acpi.c.o.d -o libcommon.fa.p/hw_virtio_virtio-acpi.c.o -c ../hw/virtio/virtio-acpi.c
> ../hw/virtio/virtio-acpi.c:14:12: error: variable 'virtio_base' set but not used [-Werror,-Wunused-but-set-variable]
>     hwaddr virtio_base = base;
>            ^
> 1 error generated.
> 
> 
> Looking at the code:
> 
> void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
>                           uint32_t mmio_irq, long int start_index, int num)
> {
>     long int i;
>     hwaddr virtio_base = base;  <------
> 
>     for (i = start_index; i < start_index + num; i++) {
>         uint32_t irq = mmio_irq + i;
>         Aml *dev = aml_device("VR%02u", (unsigned)i);
>         aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
>         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
>         aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> 
>         Aml *crs = aml_resource_template();
>         aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
>         aml_append(crs,
>                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
>                                  AML_EXCLUSIVE, &irq, 1));
>         aml_append(dev, aml_name_decl("_CRS", crs));
>         aml_append(scope, dev);
>         virtio_base += size;   <------
>     }
> }
> 
> 'virtio_base' is initialized with 'base', and it is incremented in the loop, but
> nothing else is done with it.
> 
> 
> This solves it:
> 
> 
> $ git diff
> diff --git a/hw/virtio/virtio-acpi.c b/hw/virtio/virtio-acpi.c
> index 682283800f..eaf6028e93 100644
> --- a/hw/virtio/virtio-acpi.c
> +++ b/hw/virtio/virtio-acpi.c
> @@ -11,7 +11,6 @@ void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
>                            uint32_t mmio_irq, long int start_index, int num)
>  {
>      long int i;
> -    hwaddr virtio_base = base;
>      for (i = start_index; i < start_index + num; i++) {
>          uint32_t irq = mmio_irq + i;
> @@ -27,6 +26,5 @@ void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
>                                   AML_EXCLUSIVE, &irq, 1));
>          aml_append(dev, aml_name_decl("_CRS", crs));
>          aml_append(scope, dev);
> -        virtio_base += size;

Thanks Daniel for catching this. But proper fix would be to use
virtio_base. Let me send next version with proper fix. Sorry about this.

Thanks,
Sunil


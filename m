Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40342C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 10:00:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRr6A-00025F-Ln; Mon, 22 Jan 2024 05:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rRr69-00024x-9B
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 05:00:09 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rRr66-0005Tb-Ix
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 05:00:09 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e86a9fbd9so33146795e9.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 02:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705917605; x=1706522405; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P32WV+MrDt5IsG4efx3KpoBpoDi2qaX4FlwBRvTRSM0=;
 b=NpqJXcRov92NhVu/LHUv3R4p9PjWwoHeaBFvbGcUQnnAaqB1Zefq/riW3eCxbgZfkm
 EKrIoqHqsEPH4o1hkU5eTKapF2tdYY8He6FGCGM9t3TioUSB0LATcbP9DgZcnHKTfEGS
 CH9NoSRfUf3SoaH6snWOZCP/0GsPt6AycEoTO7Y9U+rUz/ggvrcH9iVAzakOXBjoQ3e3
 I5eblcrwJ8avv/FXj+Cz5DYEEZwJu5fJs2y9gsR2Dhmacea3MdFRUJslBV+Dd1+SaN1Z
 eeBoMHI3EO4EST2QYkIFOb+V1ZiQ9y6/HbAWwxnm+VpUBsavaNSeLZGxkt/YVg27Rfrm
 DxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705917605; x=1706522405;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P32WV+MrDt5IsG4efx3KpoBpoDi2qaX4FlwBRvTRSM0=;
 b=MZpLgvnuz+ffE5uHPo0FdYRsrbP3Nn64X79jh+EpTIynl2GGNHRaTsnte9XjrDv5vU
 ha5o6fyxYJNBiyuzkE9MWPZ71i0CJ0HiopCqD9ycGvUYlx5GQbRBGtd5oWDKmGPG+Vxm
 BRHOtICm4mjAVKgvXQFVjRRM0/DuBMyM8wBHENmcQE+S0Qz1sFPn3rZYi5XZTGfUn0js
 ZjWvn6awDZBaGac92vqIVwIKiKx+UwR6y4so5+WHn4Q9j6YartV16kHFUo6o2X9HvmIP
 FNMSaIrsvMPqErMci9stlb0veIFBo+nFYAf0bl57zFUGhvn5PsJCvN2J7dD9MiZbI8Jl
 typw==
X-Gm-Message-State: AOJu0YzJy4Sh72iirDRloAhMSKGLXKuVd7EzqVqAUTgnpN0aMOwUNSYX
 aYlI3EhtkwoOPFxkT3ONsOSeppwqCjZLCoPX46+QShqWjlKZuNrZa9wTxbm0uCc=
X-Google-Smtp-Source: AGHT+IEzSRR6kNt/Hl7wpOC2xnJ++K1CIhh0hgp++NqUeHBhkqR9rDPzUwwyGwXcKc+Au+cWT4m+lQ==
X-Received: by 2002:a05:600c:19d0:b0:40e:4c1a:a0d with SMTP id
 u16-20020a05600c19d000b0040e4c1a0a0dmr2276690wmq.24.1705917604978; 
 Mon, 22 Jan 2024 02:00:04 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b0040e3733a32bsm41980141wmb.41.2024.01.22.02.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 02:00:04 -0800 (PST)
Date: Mon, 22 Jan 2024 11:00:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/4] smbios: function to set default processor family
Message-ID: <20240122-73f9246ea9ec1f968221ab01@orel>
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-3-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231229120724.41383-3-heinrich.schuchardt@canonical.com>
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

On Fri, Dec 29, 2023 at 01:07:22PM +0100, Heinrich Schuchardt wrote:
> Provide a function to set the default processor family.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
> 	new patch
> ---
>  hw/smbios/smbios.c           | 7 +++++++
>  include/hw/firmware/smbios.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 647bc6d603..03fe736565 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -989,6 +989,13 @@ void smbios_set_cpuid(uint32_t version, uint32_t features)
>          field = value;                                                    \
>      }
>  
> +void smbios_set_default_processor_family(uint16_t processor_family)
> +{
> +    if (type4.processor_family <= 0x01) {
> +        type4.processor_family = processor_family;
> +    }
> +}
> +
>  void smbios_set_defaults(const char *manufacturer, const char *product,
>                           const char *version, bool legacy_mode,
>                           bool uuid_encoded, SmbiosEntryPointType ep_type)
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 7f3259a630..6e514982d4 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -295,6 +295,7 @@ void smbios_set_cpuid(uint32_t version, uint32_t features);
>  void smbios_set_defaults(const char *manufacturer, const char *product,
>                           const char *version, bool legacy_mode,
>                           bool uuid_encoded, SmbiosEntryPointType ep_type);
> +void smbios_set_default_processor_family(uint16_t processor_family);
>  uint8_t *smbios_get_table_legacy(MachineState *ms, size_t *length);
>  void smbios_get_tables(MachineState *ms,
>                         const struct smbios_phys_mem_area *mem_array,
> -- 
> 2.43.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


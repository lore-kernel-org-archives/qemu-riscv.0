Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4824CCF9F0
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 22:28:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEb7M-00089s-1C; Thu, 30 Oct 2025 18:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEb7K-00089c-Jc
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 18:27:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEb78-00071F-Ip
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 18:27:38 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-475ca9237c2so9198765e9.3
 for <qemu-riscv@nongnu.org>; Thu, 30 Oct 2025 15:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761863241; x=1762468041; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gxLjKN0lbav4jnfxCxb91jwbCn/1h6n49kAXth6KNbU=;
 b=D5le9BLM3NBoogjb8Qm32L5BZYOYOm57ilYm9rqfcuKfzKtFwwO1ebu5sNUJCDZQcw
 X9qHyHAqxk0Kt1rj1jvO2eYZM7VQrnW0Ct+YL+KoENqzdy83MYb0sI93T9wx54JsKm7n
 JjxU1PEa6TPVPtuiznQZeiaRwE6t1fqW6iQO0WtyPScteaIUcGdkIju3xc3/PRKs3Pm7
 OLpjpwRZ4BTbR1US1m4sX+tFbkAFJVsUD+QixYkzGAMwDhPhgy4kjdbfQtn+mzacogIU
 51l70KGV/FLvOzQhIR6TEu+FK+ITG4QYarVa5GJ1Ro5gQaDyraLK2sMUVA46JxNWo0SG
 60Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761863241; x=1762468041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxLjKN0lbav4jnfxCxb91jwbCn/1h6n49kAXth6KNbU=;
 b=ZlDz0ZaIKe58ADxAxMfFJrw9NmHuOBZ8UwVp5A6me8v7ECoMKZMBWPHXctbNoRYAwF
 OxTf1bmjDoejA0u/ucO122dorouNy4B7i1CIpovylZtqokQxnKTBxBkti76SaY4uKxXU
 mjT5nm01axg5deaWzVOvaLsvezktXVB0JrcWVVGGDid7l+pa8DxIZK4o4uT3GthyPcqg
 WVjgjYxa09dA+SId4hj0+QWunQnRZZrxD3ID64CdLG4L+BoEibRai5+ETMQbCXUzOvg3
 2z1ot6LYfXTdsmyd80pxOsdayP2jltjOBCOVUhfOjkJ44BVk3fTYSaIeW0Q5Gm6mWhre
 aHZQ==
X-Gm-Message-State: AOJu0YygqEAs6jbk6gL5Yfhcp0U2xvsgClpnNT+oZmEDT5SQ/J5kix7c
 ITDBlB2JXAshnbeLmT0kgd0Ns3OCO45IWHsWukz3dI8v3WUmIrnr40uIAqKxTgcqiOc=
X-Gm-Gg: ASbGnctq8IjesTBWlKFKhBLERLwkjjCpwIwyj2Vja5xmsK2jZNcCbDcLEfF9hvtsw9J
 HAaLAOyf5mbHWlEaQwGLY/rXyxiiSKSZtpfh9VExpMXwQOq9DnkR1SABlgDL/E6v52rzsJ0WsDk
 E4h5GNGiYZH+RtnBBKoDwmRy00i/odHd0vXo7C5iDBA1dpEuonE0TIBFp0B0n9kwRpGgzmtRkzD
 9BtQYhO+XJ+pM7ASG3uv4gsSJn9yu9Whrm1CRBs0Aivwh6FYGmtpi3bw2kylj6wi54iPbHyI50Y
 NhSfeeZJlXoTnIzrqseHgah2S8CEpi/2USsNrBSIkuaIF6QVGlZfcpCRMKVHF2v+0nhUqbUVZT2
 YK3oUDVx5k1pNxsmDGoBneL9nGaOXbUCW/PFs+VoJLDqZvEMFRlGpS2lwqky6gVSi71YgCPeyer
 czYGUsuhIyTg8/X+wwX7McOmRJYsDXS53g/T/+f0jkkCq/SscU6r+hlU0=
X-Google-Smtp-Source: AGHT+IEfxRvZbpJwMDYxoyrvEtuAaXU132HvEY4NKhOsB9844OXuaDaeH65JIKCm1iJ8wu63Ucu4oQ==
X-Received: by 2002:a05:600c:1f91:b0:477:e70:592b with SMTP id
 5b1f17b1804b1-477305a7cddmr12453745e9.2.1761863240627; 
 Thu, 30 Oct 2025 15:27:20 -0700 (PDT)
Received: from [192.168.1.17] (adijon-656-1-155-31.w90-33.abo.wanadoo.fr.
 [90.33.190.31]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de5f9sm34420762f8f.38.2025.10.30.15.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 15:27:20 -0700 (PDT)
Message-ID: <6bbb2e59-9e6d-4f65-a604-c5e0c69bb9f1@linaro.org>
Date: Thu, 30 Oct 2025 23:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] hw/riscv: Add server platform reference machine
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, ajones@ventanamicro.com,
 Fei Wu <wu.fei9@sanechips.com.cn>
References: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
 <20250528200129.1548259-4-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250528200129.1548259-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 28/5/25 22:01, Daniel Henrique Barboza wrote:
> From: Fei Wu <wu.fei9@sanechips.com.cn>
> 
> The RISC-V Server Platform specification[1] defines a standardized set
> of hardware and software capabilities, that portable system software,
> such as OS and hypervisors can rely on being present in a RISC-V server
> platform.
> 
> A corresponding Qemu RISC-V server platform reference (rvsp-ref for
> short) machine type is added to provide a environment for firmware/OS
> development and testing. The main features included in rvsp-ref are:
> 
>   - Based on riscv virt machine type
>   - A new memory map as close as virt machine as possible
>   - A new virt CPU type rvsp-ref-cpu for server platform compliance
>   - AIA
>   - PCIe AHCI
>   - PCIe NIC
>   - No virtio device
>   - No fw_cfg device
>   - No ACPI table provided
>   - Only minimal device tree nodes
> 
> [1] https://github.com/riscv-non-isa/riscv-server-platform
> 
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   configs/devices/riscv64-softmmu/default.mak |    1 +
>   hw/riscv/Kconfig                            |   14 +
>   hw/riscv/meson.build                        |    1 +
>   hw/riscv/server_platform_ref.c              | 1276 +++++++++++++++++++
>   4 files changed, 1292 insertions(+)
>   create mode 100644 hw/riscv/server_platform_ref.c
> 
> diff --git a/configs/devices/riscv64-softmmu/default.mak b/configs/devices/riscv64-softmmu/default.mak
> index 39ed3a0061..0c4893b708 100644
> --- a/configs/devices/riscv64-softmmu/default.mak
> +++ b/configs/devices/riscv64-softmmu/default.mak
> @@ -9,5 +9,6 @@
>   # CONFIG_SIFIVE_E=n
>   # CONFIG_SIFIVE_U=n
>   # CONFIG_RISCV_VIRT=n
> +# CONFIG_SERVER_PLATFORM_REF=n
>   # CONFIG_MICROCHIP_PFSOC=n
>   # CONFIG_SHAKTI_C=n
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index e6a0ac1fa1..f626774c52 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -69,6 +69,20 @@ config RISCV_VIRT
>       select ACPI
>       select ACPI_PCI
>   
> +config SERVER_PLATFORM_REF
> +    bool
> +    default y
> +    depends on RISCV64
> +    select RISCV_NUMA
> +    select GOLDFISH_RTC
> +    select PCI

PCI is already selected by PCI_EXPRESS_GENERIC_BRIDGE.

> +    select PCI_EXPRESS_GENERIC_BRIDGE
> +    select PFLASH_CFI01
> +    select SERIAL
> +    select RISCV_ACLINT
> +    select RISCV_APLIC
> +    select RISCV_IMSIC


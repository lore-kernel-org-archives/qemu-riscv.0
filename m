Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58501C10F15
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 08:45:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzYFH-0006vV-1Y; Wed, 24 Apr 2024 04:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzYFF-0006ux-9I
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 04:44:49 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzYFC-0002wR-HO
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 04:44:49 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so79700031fa.3
 for <qemu-riscv@nongnu.org>; Wed, 24 Apr 2024 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713948284; x=1714553084; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hgALXVVjSwrwkltp36vxTj/9Vt2I0zuQY7MS0AYLINY=;
 b=HOQCST543h6PE1RzEjBf9YQdliM9psroxUARMjEKrDRi5qJn9tRElVvFX5Z/x38DYo
 n+g4dwYgbwB1qJ74L3rMptOka7DTTDZ55g0AhRLj4SsgJG1QRkVdQMhCxhXFCcy8K1k7
 IBCAERVIprGur5gV/t27obwdMlgFmUtK3IFhMmSw3MIuS7woU7Nrx5iIrSqwkZz/62eB
 S1KUut6nqzhKhLLBCTWz3yMOV4LelD4+CV1k/GqnizWkCzu24ByM/4yCqbaBcPpeMA8I
 MyB07mnOvKsimVfbOqE7FUiyC8XexdYANCtSqJ+Vmo0hlfVwEM5C2if4BgMw9cN5gD+R
 mhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713948284; x=1714553084;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hgALXVVjSwrwkltp36vxTj/9Vt2I0zuQY7MS0AYLINY=;
 b=ZN2wm/r4UHzlupoIaTjXXsqYddc+r2n0M+10X1zR4K6yUQ86LHPhM+jyxTj0wB/6/Q
 w+IRxp2dX1jImrKbCEVIQEGWwMwRPRuYkvuNN2ZpbsRZyNbeFvDPGgGiLb5MCrjrTi8m
 rUi3SA+MBFq54fze8I5/ZHwX6EpKzoAeHw83mjsY8JXXqBxWzNM2W/EKAjd/yN4XrHbc
 PFhr5fFz4Ic4ch0diDJ7FKi2Sa+OXj/ZRT+uqMJ4+JMt826cjnkv/Hwu3P2lpA19ciaF
 jgyMcy/2ttWIBB2dXTsXkJXAkUUNQmfrOMJPa21dC1kJgCW0JXCUedPF/zEGDgOlzIPI
 7xBw==
X-Gm-Message-State: AOJu0YwdFl2k1Bixx+9VY24ei33sNq91TBsuw7uSxzR0wCj3Kq9YZ8qf
 26bQY5MT/uePcHwY6uiWt7yc3rCB/EUe5azlh/7XX/WEHv8mUsV9r/mpOOjArNk=
X-Google-Smtp-Source: AGHT+IFGGUjcXtTbSvmHJI3W3WMfezNhujiPDvoOgb9zuZeXiNi2p4HFanqj3lYJGIMy6tpigPWTGw==
X-Received: by 2002:a2e:8507:0:b0:2d8:394c:6e7e with SMTP id
 j7-20020a2e8507000000b002d8394c6e7emr995796lji.15.1713948284501; 
 Wed, 24 Apr 2024 01:44:44 -0700 (PDT)
Received: from [192.168.1.102] (mon75-h03-176-184-51-42.dsl.sta.abo.bbox.fr.
 [176.184.51.42]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b0041a3b5ed993sm11257643wms.25.2024.04.24.01.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 01:44:44 -0700 (PDT)
Message-ID: <17f53dbd-4eed-4375-a5e4-b00a3b2a48e5@linaro.org>
Date: Wed, 24 Apr 2024 10:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/22] hw/i386: Remove deprecated pc-i440fx-2.0 -> 2.3
 machines
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20240416185939.37984-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
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

Hi,

Michael, I expect this series to go via your maintainer tree :)

Thanks,

Phil.

On 16/4/24 20:59, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.

> Philippe Mathieu-Daudé (22):
>    hw/i386/pc: Deprecate 2.4 to 2.12 pc-i440fx machines
>    hw/i386/pc: Remove deprecated pc-i440fx-2.0 machine
>    hw/usb/hcd-xhci: Remove XHCI_FLAG_FORCE_PCIE_ENDCAP flag
>    hw/usb/hcd-xhci: Remove XHCI_FLAG_SS_FIRST flag
>    hw/i386/acpi: Remove PCMachineClass::legacy_acpi_table_size
>    hw/acpi/ich9: Remove 'memory-hotplug-support' property
>    hw/acpi/ich9: Remove dead code related to 'acpi_memory_hotplug'
>    hw/i386/pc: Remove deprecated pc-i440fx-2.1 machine
>    target/i386/kvm: Remove x86_cpu_change_kvm_default() and 'kvm-cpu.h'
>    hw/i386/pc: Remove PCMachineClass::smbios_uuid_encoded
>    hw/smbios: Remove 'uuid_encoded' argument from smbios_set_defaults()
>    hw/smbios: Remove 'smbios_uuid_encoded', simplify smbios_encode_uuid()
>    hw/i386/pc: Remove PCMachineClass::enforce_aligned_dimm
>    hw/mem/pc-dimm: Remove legacy_align argument from pc_dimm_pre_plug()
>    hw/mem/memory-device: Remove legacy_align from
>      memory_device_pre_plug()
>    hw/i386/pc: Remove deprecated pc-i440fx-2.2 machine
>    hw/i386/pc: Remove PCMachineClass::resizable_acpi_blob
>    hw/i386/pc: Remove PCMachineClass::rsdp_in_ram
>    hw/i386/acpi: Remove AcpiBuildState::rsdp field
>    hw/i386/pc: Remove deprecated pc-i440fx-2.3 machine
>    target/i386: Remove X86CPU::kvm_no_smi_migration field
>    hw/i386/pc: Replace PCMachineClass::acpi_data_size by
>      PC_ACPI_DATA_SIZE


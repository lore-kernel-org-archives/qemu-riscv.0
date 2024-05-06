Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A95C10F16
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 May 2024 14:30:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s3zLd-0004WM-EN; Mon, 06 May 2024 10:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3zLV-0004Rf-W1
 for qemu-riscv@nongnu.org; Mon, 06 May 2024 10:29:39 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s3zLU-0008R0-7x
 for qemu-riscv@nongnu.org; Mon, 06 May 2024 10:29:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41c7ac73fddso21282365e9.3
 for <qemu-riscv@nongnu.org>; Mon, 06 May 2024 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715005774; x=1715610574; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ba7nd+UfOBYkqEvqsJujD4dIxGkHfk5SM1/9sfXvRGg=;
 b=GqM+geYeKZ/5LHNzyGHRfrMm2RODv3mHSkSDa3JT8Zdcb3NqHj6bCPfYRNNco+t3YH
 jt6KDwTXuto+cL7PKzEdah6ccYgp220MtyO+WZa17p9HA74BB2mZ+nFDMWJykhknhZgv
 RnunW2+4rAn/kZcryjJCDt7uCoWKgI4xZ53zEy9C1Ft/E/3UlDZT4xrs3bC/Ws0h0bjx
 arJro99RQYL25Id/wXPHjmw4idcOeHJkkhH7s+vjiE0uLPt5xjQlA2CCSYU8jdKDNjOd
 6Bc019hV6VpvJ4rQplfigzdXkOTP3mSfiWZk1NWNCwfzz461tSVxN6Iy7/NTANNrH77K
 0jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715005774; x=1715610574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ba7nd+UfOBYkqEvqsJujD4dIxGkHfk5SM1/9sfXvRGg=;
 b=TbvSf9JmnQzjgyNNbExWPo3uXQSgOmgzInzggQ5QFlsRpXqS6uxj88PqYNFT7orSJo
 EBsY/2Sbuj+1GAPrXXcQBP3vtN9f88Iq4CanWqSuPzUHv8gdzpYMQgiLXfWSKZTXvR5v
 fOb/LVDy1Unvrn/RYHqyv9LPBYSfwvdLpr9W3A7r5TqO3EuIw2agPfs9ppHDurogXXQW
 Hvm5uD+yLcGBmoCDRHLYfiQ4r3xf7U3gP8qTz45uRsUcEATyMfUoQLYfvetcpijJMnvZ
 AI7jsDKZnMCB3wv7HVwc0T2X1UTuP77VyaopyYGoA+yR0LOUEvWG38UseWpYEXVqd8Kx
 F5ZA==
X-Gm-Message-State: AOJu0YxNNsGvk9AoLlKWFyGhpBETn/4I9+sQPY2vxxTTQgzD+FS+aHah
 HA7IbiOG3W41GfuI9EqVScnJIJzfZGzB2zNX306rP3NA17afMThtLvk212j9DCc=
X-Google-Smtp-Source: AGHT+IFu9jTJzOMdEtdPRC073tVIICl0ogjMziKULhaxYUUNf5yt9pqu26+0Xf79jIkH0MWsE5nTVg==
X-Received: by 2002:a5d:5483:0:b0:34a:35c7:22a3 with SMTP id
 h3-20020a5d5483000000b0034a35c722a3mr9032998wrv.20.1715005773952; 
 Mon, 06 May 2024 07:29:33 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 cm11-20020a5d5f4b000000b0034dd27adb2fsm10821339wrb.107.2024.05.06.07.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 07:29:33 -0700 (PDT)
Message-ID: <6de106f2-1061-483e-97db-96b09e5b40ad@linaro.org>
Date: Mon, 6 May 2024 16:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/22] hw/i386: Remove deprecated pc-i440fx-2.0 -> 2.3
 machines
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20240416185939.37984-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 16/4/24 20:59, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.

Ping, is there some issue holding this series?

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


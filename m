Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E160ACCF9F8
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 10:34:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEmSO-0005Ph-K2; Fri, 31 Oct 2025 06:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vEmSK-0005NV-0O
 for qemu-riscv@nongnu.org; Fri, 31 Oct 2025 06:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vEmSG-0006EE-Br
 for qemu-riscv@nongnu.org; Fri, 31 Oct 2025 06:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761906832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/jGLV9GwwmWLPtAFMtsGUdWiI6XWtoKi7BhNW1nFXU=;
 b=AZmr50TsLV8Visv7PHdK27lfxABGZNQHJRPPoB6DryFI/2AtBQMxnDlJkf2OWnG6p1KbAr
 cU22BQo/7EIzIAyn13j9zrGjiUAl/IqPijfKz3e1ggrQxBrDiumVE9NUtuyHgDx8eQvOhF
 hp+KUUo1zn+iMpILVuITVSkZ5WUH6dk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-NNlECtEWMvuGCi8HiHNrnw-1; Fri, 31 Oct 2025 06:33:50 -0400
X-MC-Unique: NNlECtEWMvuGCi8HiHNrnw-1
X-Mimecast-MFC-AGG-ID: NNlECtEWMvuGCi8HiHNrnw_1761906829
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-471168953bdso15754335e9.1
 for <qemu-riscv@nongnu.org>; Fri, 31 Oct 2025 03:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906829; x=1762511629;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n/jGLV9GwwmWLPtAFMtsGUdWiI6XWtoKi7BhNW1nFXU=;
 b=vkbGgCo29NJ2dIBD5r9mvlqmOhOA2rgC0rKL5W54OiLYc5zyrguffzcD58W6V1q9Op
 DU1c19Z6qaJLPqHGOOh8QHMFrhqPYg58AVl+j1LpmmGlLoOgI007M7Uib2Z/BhmONDxl
 +QElGwpFTz7j9wykQNzUGXFbcZH6jDMYvyJO8aENjSdNlHoUFjaPBPYYlzFd4fehkDlj
 7vUg+0Teix3LxOCitw/EWy3miUbLk5vlyyyUlz6PuzWAMQ2SxSvjssqKHFZy41tMJLgN
 rzZ29RIzgEsSaUAMTiymSJsbQdaq4mVTTU3Fs2zdcQyuhRpCWdwv0TNXG1iYXC6UVsvj
 Gczg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwkKhFt/L3mHx1J7xujjB8QgQ/Mao3RuvGHdcEZpFG3G3Usm6VBNGLEFuNFvlSnlQgDcKr+gb6U0QZ@nongnu.org
X-Gm-Message-State: AOJu0Yw9WMnNLyVkxvu+39wU2GxbJInmrzhl639E827fys7d8jULVmX2
 n/2hxs2uBLJuceDnjBykaiZIs4mTtafn4K5Q71VRc+MLd+1abvcV9GahNJCdhaFfLBecujURvIY
 yhUWvnx8oGdvR95y9wagUWMXlTly0bxvwHaU4yE4GNcTFt1k5incBBISh
X-Gm-Gg: ASbGncvx7+VDv3LkmN+XYji0YGAULErszuLkFha3k/amY2zkvA4NKwbgYE9/GWnTOtX
 hrN1TJjutNNSGjnaSvrAZudU6bCyXPZVp6hylGGDVPjMSoOr5nefR4idWbKaLtYi4hAN24GLlnR
 gTByVONxQIT/hiccm04CTX2Yhi9kKzLHyisj2iFL8mSPPBUfqBsNpVfeTtp9Ese2mivca/9SsF4
 FStqOLnoVNwYTy6qIS4Uyk5t/ym3ZLxOfxxYPIF/8yJOnaQvulrwQJ7BSgCLj6fw6M5jdgr/TTH
 P2sZdq0hMAeQNXoA6lfNQSon/PQ+PtlOANL75HurUJBPkO4IiB0wgQ6rJenzZiNzGaPx/jNGYkB
 vf8UkYa6BpIA=
X-Received: by 2002:a05:600c:6207:b0:477:bf1:8c82 with SMTP id
 5b1f17b1804b1-4773012927cmr30121155e9.15.1761906829111; 
 Fri, 31 Oct 2025 03:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWCHcilNykTSLc62QxcCapaqI02WJ4rPlCIQNLJ1JMRw/+H68d09txCoHrM7hGWJDTD94b9Q==
X-Received: by 2002:a05:600c:6207:b0:477:bf1:8c82 with SMTP id
 5b1f17b1804b1-4773012927cmr30120385e9.15.1761906828559; 
 Fri, 31 Oct 2025 03:33:48 -0700 (PDT)
Received: from imammedo-mac ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c114b93esm2889676f8f.19.2025.10.31.03.33.46
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Fri, 31 Oct 2025 03:33:48 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:33:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Cl=C3=A9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 00/27] hw/i386/pc: Remove deprecated 2.6 and 2.7 PC
 machines
Message-ID: <20251031113344.7cb11540@imammedo-mac>
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
Organization: imammedo@redhat.com
X-Mailer: Claws Mail 3.11.1-67-g0d58c6-dirty (GTK+ 2.24.21;
 x86_64-apple-darwin14.0.0)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DjeI9f9stJGsWy-74MlnP6aih49Qf_8z91P0xG3ceCI_1761906829
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu,  8 May 2025 15:35:23 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

Are you planning to resping it?
(if yes, I can provide you with a fixed 2/27 patch that removes all legacy =
cpu hp leftovers)

> Since v3:
> - Addressed Thomas and Zhao review comments
> - Rename fw_cfg_init_mem_[no]dma() helpers
> - Remove unused CPU properties
> - Remove {multi,linux}boot.bin
> - Added R-b tags
>=20
> Since v2:
> - Addressed Mark review comments and added his R-b tags
>=20
> The versioned 'pc' and 'q35' machines up to 2.12 been marked
> as deprecated two releases ago, and are older than 6 years,
> so according to our support policy we can remove them.
>=20
> This series only includes the 2.6 and 2.7 machines removal,
> as it is a big enough number of LoC removed. Rest will
> follow.
>=20
> Based-on: <20250506143905.4961-1-philmd@linaro.org>
>=20
> Philippe Mathieu-Daud=C3=A9 (27):
>   hw/i386/pc: Remove deprecated pc-q35-2.6 and pc-i440fx-2.6 machines
>   hw/i386/pc: Remove PCMachineClass::legacy_cpu_hotplug field
>   hw/nvram/fw_cfg: Rename fw_cfg_init_mem() with '_nodma' suffix
>   hw/mips/loongson3_virt: Prefer using fw_cfg_init_mem_nodma()
>   hw/nvram/fw_cfg: Factor fw_cfg_init_mem_internal() out
>   hw/nvram/fw_cfg: Rename fw_cfg_init_mem_wide() ->
>     fw_cfg_init_mem_dma()
>   hw/i386/x86: Remove X86MachineClass::fwcfg_dma_enabled field
>   hw/i386/pc: Remove multiboot.bin
>   hw/nvram/fw_cfg: Remove fw_cfg_io_properties::dma_enabled
>   hw/i386/pc: Remove linuxboot.bin
>   hw/i386/pc: Remove pc_compat_2_6[] array
>   target/i386/cpu: Remove CPUX86State::enable_cpuid_0xb field
>   target/i386/cpu: Remove CPUX86State::fill_mtrr_mask field
>   hw/intc/apic: Remove APICCommonState::legacy_instance_id field
>   hw/core/machine: Remove hw_compat_2_6[] array
>   hw/virtio/virtio-mmio: Remove
>     VirtIOMMIOProxy::format_transport_address field
>   hw/i386/pc: Remove deprecated pc-q35-2.7 and pc-i440fx-2.7 machines
>   hw/i386/pc: Remove pc_compat_2_7[] array
>   target/i386/cpu: Remove CPUX86State::full_cpuid_auto_level field
>   target/i386/cpu: Remove CPUX86State::enable_l3_cache field
>   hw/audio/pcspk: Remove PCSpkState::migrate field
>   hw/core/machine: Remove hw_compat_2_7[] array
>   hw/i386/intel_iommu: Remove IntelIOMMUState::buggy_eim field
>   hw/intc/ioapic: Remove IOAPICCommonState::version field
>   hw/virtio/virtio-pci: Remove VirtIOPCIProxy::ignore_backend_features
>     field
>   hw/char/virtio-serial: Do not expose the 'emergency-write' property
>   hw/virtio/virtio-pci: Remove VIRTIO_PCI_FLAG_PAGE_PER_VQ definition
>=20
>  hw/intc/ioapic_internal.h           |   3 +-
>  include/hw/acpi/cpu_hotplug.h       |   3 -
>  include/hw/boards.h                 |   6 -
>  include/hw/i386/apic_internal.h     |   1 -
>  include/hw/i386/intel_iommu.h       |   1 -
>  include/hw/i386/pc.h                |   9 --
>  include/hw/i386/x86.h               |   2 -
>  include/hw/nvram/fw_cfg.h           |   9 +-
>  include/hw/virtio/virtio-mmio.h     |   1 -
>  include/hw/virtio/virtio-pci.h      |   2 -
>  include/hw/virtio/virtio-serial.h   |   2 -
>  pc-bios/optionrom/optionrom.h       |   4 -
>  target/i386/cpu.h                   |  15 --
>  hw/acpi/cpu_hotplug.c               | 230 ---------------------------
>  hw/arm/virt.c                       |   2 +-
>  hw/audio/pcspk.c                    |  10 --
>  hw/char/virtio-serial-bus.c         |   9 +-
>  hw/core/machine.c                   |  17 --
>  hw/display/virtio-vga.c             |  10 --
>  hw/hppa/machine.c                   |   2 +-
>  hw/i386/acpi-build.c                |   4 +-
>  hw/i386/fw_cfg.c                    |   5 +-
>  hw/i386/intel_iommu.c               |   5 +-
>  hw/i386/microvm.c                   |   3 -
>  hw/i386/multiboot.c                 |   7 +-
>  hw/i386/pc.c                        |  22 +--
>  hw/i386/pc_piix.c                   |  23 ---
>  hw/i386/pc_q35.c                    |  24 ---
>  hw/i386/x86-common.c                |   6 +-
>  hw/i386/x86.c                       |   2 -
>  hw/intc/apic_common.c               |   5 -
>  hw/intc/ioapic.c                    |  18 +--
>  hw/intc/ioapic_common.c             |   2 +-
>  hw/mips/loongson3_virt.c            |   2 +-
>  hw/nvram/fw_cfg.c                   |  48 +++---
>  hw/riscv/virt.c                     |   4 +-
>  hw/virtio/virtio-mmio.c             |  15 --
>  hw/virtio/virtio-pci.c              |  12 +-
>  target/i386/cpu.c                   | 152 ++++++++----------
>  target/i386/kvm/kvm.c               |  10 +-
>  tests/qtest/test-x86-cpuid-compat.c |  11 --
>  pc-bios/meson.build                 |   2 -
>  pc-bios/multiboot.bin               | Bin 1024 -> 0 bytes
>  pc-bios/optionrom/Makefile          |   2 +-
>  pc-bios/optionrom/linuxboot.S       | 195 -----------------------
>  pc-bios/optionrom/multiboot.S       | 232 ---------------------------
>  pc-bios/optionrom/multiboot_dma.S   | 234 +++++++++++++++++++++++++++-
>  47 files changed, 349 insertions(+), 1034 deletions(-)
>  delete mode 100644 pc-bios/multiboot.bin
>  delete mode 100644 pc-bios/optionrom/linuxboot.S
>  delete mode 100644 pc-bios/optionrom/multiboot.S
>=20



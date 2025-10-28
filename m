Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D509CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:14:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoCI-0006Vg-KK; Tue, 28 Oct 2025 14:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoC9-0006Rv-6c
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:13:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoBy-0001X3-6d
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:13:20 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so35361215e9.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675183; x=1762279983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O0GGiZXrm4OzHdOc+19/N23vVvY3UXsMWqAq/zS3aok=;
 b=qajfihQZ3lc8367o1KJYvf8AnhMbt5b81oJBI9h4ArZBTmt+miX1zJVgTLrDj3dGNr
 vCeCuq+UV+ZpcXcV5av7cX4DQ0TfI36WQmU7rLHGO1IoKlbSsYEWYBiRzenyqDmod9CY
 a66G5T0aB9q/RvdjNuqPs1QmVsgOUaLliZ75G5BC/yCQYxiRn/y0lCR1DEFrpKQH4IXm
 TsZNOucR9LfNsAAnZKwh4on+MSdQuwJVVIWYiLnXi/Ezj44q9LqKLQ5P2iqj3bxJW3QM
 SOUgAr5eLH4l5T/BPaP/Kgcpqj5UwVAmg6TC0vsmKJGG8xxOzo9MgVSDHOQSWMkwsJLU
 nKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675183; x=1762279983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O0GGiZXrm4OzHdOc+19/N23vVvY3UXsMWqAq/zS3aok=;
 b=SDpJCJ7fIK93foVw+/sRbQgJhBT+IRfnOKk1fNu2GRDhMT0QtaJbmB57c9N7lbxt8A
 3mjA+W6tS3l7ZUcoBezoRHIISL+av0C7gDp3gpeemaUX1XGG5CGvODWXCf4REprCXqNV
 8/TCJT6tgmgik0tH+aGp92hW2ZErDYUy4VepkibyNgeHwmZJGP/OI66gtOKDXMx4qVQR
 ZSr8Ff3YX/BWW57JpECkOSGVaMRw46kDAdh+LLz6tkfp6ivGblF9qUky2Cy2ImJm181L
 FFJVlSRXR+mtNAhERYy2rTi11F0GoVbisZ0Oa16Z1numaN6RbYCMghVSbs4qRBKQVC1X
 TJYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Ren2RJPr6cof0NfykQ5qjzfVJOfiwlBkyi11eAQD/Jrgjn0jRMcIlteyOBJYcaNsQ0vbXXytrvd3@nongnu.org
X-Gm-Message-State: AOJu0YxDNJoEvfn9waecSEco3p2mJfqiaVwifgjMjsnJRMmdXNrKMCRi
 TkutbL88hWaWnXbv6uqetgxX/gVoD4RYrFKzVrHOPtevLaLw9vl+kzaIwqJu/Wyj7Us=
X-Gm-Gg: ASbGncuL73pR2TWC2fFI8q9+wDC0MzvRC/rxaOIKw2HB2vAjfWzW9VUCLLzdR6rWA0b
 In9JVFXewv1aso1UIEOmSWQHRBByWNOBZYGm435Ok3bGiUZot0qg2ZxOxD/0Rr+QzUAUA+u1fvZ
 P33/qTUYYRj4bDQT7phoOew5T3uS9XLXqstyeEP+EL3QbU4Q6ErVnGge5VsdFmFAhT9U9MsHAZp
 ueKnv3ON3x0w2J/hdz5J59Rvrz28vCTsm9EdEDoeuXdI3caCISEcwefF6qYXUdwqDav1Y2tL7Uy
 wxEQOp+di+Vxp9t/D/SItwrk0VE2+hLGMej2zMTYc1UHqIXtmOsQ6xm2YQzGZjQKYFvpD9MHGYr
 7Dao2SMFn6kxuIp0NK8hZsGTGW9sUFAuQqFdoIu3tehUg7yMt4ttDAfXXRta7822Z5an2Xcozja
 MqSJi6TP0e0c1YitmLTSMTX0QPkA5qH0XemD9JemJg20TZBLufeQ==
X-Google-Smtp-Source: AGHT+IFjK2ci8BodYlqQsw4T7KtvfGXcZAulUk9EPCLZXihdGhzOdLZjWG//I7VzhVMwGc/dq8M4Qg==
X-Received: by 2002:a05:600c:3b23:b0:475:de12:d3b5 with SMTP id
 5b1f17b1804b1-4771e1e3abemr4503435e9.34.1761675182854; 
 Tue, 28 Oct 2025 11:13:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e387aa9sm3683645e9.4.2025.10.28.11.13.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:13:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/25] hw/sysbus: Spring cleanups (part 1)
Date: Tue, 28 Oct 2025 19:12:34 +0100
Message-ID: <20251028181300.41475-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

- Use sysbus_mmio_get_region() instead of SysBusDevice::mmio[].memory
- Use memory_region_name() instead of MemoryRegion::name
- Use memory_region_size() instead of int128_get64(MemoryRegion::size)
- Add memory_region_get_address()
- Use memory_region_get_address() instead of MemoryRegion::addr
- Remove SysBusDevice::mmio[].addr
- Simplify SysBusDevice::mmio[]

Philippe Mathieu-Daudé (25):
  hw/i386/microvm: Use proper SysBus accessors
  hw/i386/ioapic: Use proper SysBus accessors
  hw/timer/hpet: Use proper SysBus accessors
  hw/acpi/cxl: Use proper SysBus accessors
  hw/ppc/e500: Use proper SysBus accessors
  hw/pci-bridge: Use proper SysBus accessors
  hw/sysbus: Use memory_region_name()
  hw/nvme/ctrl: Use memory_region_size()
  hw/s390x: Use memory_region_size()
  system/memory: Have memory_region_size() take a const argument
  system/memory: Introduce memory_region_get_address()
  migration/ram: Use memory_region_get_address()
  hw/acpi: Use memory_region_get_address()
  hw/fdt: Use memory_region_get_address()
  hw/nvme: Use memory_region_get_address()
  hw/s390x: Use memory_region_get_address()
  hw/timer/hpet: Use memory_region_get_address()
  hw/watchdog/aspeed: Use memory_region_get_address()
  hw/pci-bridge: Use memory_region_get_address()
  system/ioport: Use memory_region_get_address()
  hw/sysbus: Use memory_region_get_address()
  hw/sysbus: Hoist MemoryRegion in sysbus_mmio_map_common()
  hw/sysbus: Remove sysbus_mmio_map_common() @may_overlap argument
  hw/sysbus: Use memory_region_is_mapped() to check for mapped region
  hw/sysbus: Simplify SysBusDevice::mmio

 include/hw/sysbus.h                 |  5 +--
 include/system/memory.h             |  9 ++++-
 hw/acpi/cxl.c                       | 10 +++--
 hw/core/sysbus.c                    | 57 ++++++++++++-----------------
 hw/i386/acpi-build.c                |  8 ++--
 hw/i386/kvm/ioapic.c                |  3 +-
 hw/i386/microvm-dt.c                |  6 ++-
 hw/loongarch/virt-acpi-build.c      |  4 +-
 hw/loongarch/virt-fdt-build.c       |  4 +-
 hw/nvme/ctrl.c                      | 15 +++++---
 hw/pci-bridge/pci_expander_bridge.c |  6 ++-
 hw/ppc/e500.c                       |  2 +-
 hw/s390x/s390-pci-inst.c            | 23 ++++++++----
 hw/timer/hpet.c                     |  4 +-
 hw/watchdog/wdt_aspeed.c            |  2 +-
 migration/ram.c                     | 11 +++---
 system/ioport.c                     | 21 +++++++----
 system/memory.c                     |  7 +++-
 18 files changed, 113 insertions(+), 84 deletions(-)

-- 
2.51.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531BEC83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:02:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZEWI-0003cx-VK; Tue, 08 Jul 2025 16:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCQR-0002vH-3J
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:48:20 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCPv-0005Rh-Gw
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:48:10 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a16e5so8628934a12.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996852; x=1752601652; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0z6zuLyqS0wcOglQ1OI6Oqu0dEI4wR6AUI75p1DD0Uo=;
 b=wkOWw26LP0xpN3kQ5a1LBvhZLYbSYRzzqv5yvshclEDoTQ4kE+snFIKdonJoy7jjWx
 S3wx3m+M1U1N1j71P+0esdNRX5axdlCp/G+tRbMqqbl/0SMcj/6AUfBfGRL76cC0F1TL
 SWVAFufeRGosvEEDuk+PjR7G6aU2Qx3cRfQozpfWpcWXznUrVC0/WAHNrsSsxLA9PH39
 fZtPAnbDWluc2FkAeTRd5/S1/UUoQakrDq7nKA9vb0gNb81PqXDPYHiV0Qk1tN9HSP/b
 Zqyaj7zyCHY77SwA/yZHUKj4dVij0Mw3k5tNJj2zOE/DjhUalL0g4zaBiDjPgBSv4gF7
 pweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996852; x=1752601652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0z6zuLyqS0wcOglQ1OI6Oqu0dEI4wR6AUI75p1DD0Uo=;
 b=i3QfEGuTER8H02KgRIQRAt1dnOwzyg+P2NM8vA3fEsUV5ndAJPClCGs5S7zvtQqWZR
 xR7YslZdDd9ZjeSTCWRXdegCHX9zXkeG9DYM7EWijFmJsgtBd3boAo5uAO5Yvi8K4T3w
 CpopjSaYoqRLhzepz9JXEC3g/6jLYvHktCpvf9tgSFkWh1LsiuvhOkwlowA1cSgn2HRM
 33w6ZEjdn9/9rmp0PprA3my8THUvOWARmlWV1OTPlEZS86VOqKNEsZB7RiGAw6/YfpJS
 BqbzMcInBaQUKuCZPeqtgrleoULURzXoS6+9HDcfFrME1AENvCgERLh4F+akoSNYoIzX
 Y1DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Aj3tNjKGeZXkg/4KYPLIJ+6x1Gq/e72cFvqzxnSxxhXgk32KtBq9mTRNk//+EAvkzZH+T1b4xPtt@nongnu.org
X-Gm-Message-State: AOJu0YxXBB0bcWE6eAQ26dz1kKTNU0HhlRwUEnOR7YlbDpoU099BXJQn
 iMtOgTTQ1+9n5q7QFm5mLaONDN3TdMXE5dKFM7mPa3T40w8HXIZ3oJcsKzqGMRTbAMQLKuTdP3J
 f3xyy
X-Gm-Gg: ASbGncteIzvplH2zhi3h3CO3Z51FGkuWYYuatxIsyyY6nigeav2Xk1n30kOhne6dvdc
 zSS73O6B7Z59EtdVOxsRovYziaLLiXN6sNToMdnjneKJYilhxNoq8J/mhCnwKJ2Tw1Av7JL2tYA
 tiUw4d91Lvcr1Bl3qgrVzHDa+bZ7BwB+rT4oLV6jhGoEbpuVGHmFoiSPewJZsfw7RIoDGBM3ooU
 +8UkX820BjxOJvL/b4ZkMaAPCTX/TncnGR5VtD+a5yU4x3c7nGHOByCBpSvhAKGJRIp9u9r28SK
 JtNUn2Wmb7RjNZ9Haaj3IaSlnPCMP2c+sqPxhkDftmxQEsvIzz6C78r2H+Hw63su9eLaUqCaScm
 iQxghprriWvP1Tp1XUvRN/S3fNu6d4lIFSJeA
X-Google-Smtp-Source: AGHT+IEkM94DyDOhgiUDQ9k45sEVeJR3CEVz04SErlMrGPWV3l1ZeWIqAHV0z7YC5n5AAcZlrdCrwA==
X-Received: by 2002:a05:600c:3acf:b0:451:edc8:7806 with SMTP id
 5b1f17b1804b1-454d367a0d1mr4240105e9.32.1751995210633; 
 Tue, 08 Jul 2025 10:20:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd49841dsm21584835e9.0.2025.07.08.10.19.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:20:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v7 0/8] target-info: Add more API for VirtIO cleanups
Date: Tue,  8 Jul 2025 19:19:40 +0200
Message-ID: <20250708171949.62500-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
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

Since v6:
- Added R-b tags
- Fixed typos
- Dropped "Introduce target_base_arch()" because unused so far
- Dropped unrelated patches

Philippe Mathieu-Daudé (8):
  target/qmp: Use target_cpu_type()
  qemu/target-info: Factor target_arch() out
  qemu/target-info: Add %target_arch field to TargetInfo
  qemu/target-info: Add target_endian_mode()
  qemu: Convert target_words_bigendian() to TargetInfo API
  gdbstub/helpers: Replace TARGET_BIG_ENDIAN -> target_big_endian()
  qemu: Declare all load/store helper in 'qemu/bswap.h'
  hw/virtio: Build various files once

 include/exec/tswap.h                  | 83 +--------------------------
 include/gdbstub/helpers.h             | 15 ++---
 include/qemu/bswap.h                  | 73 +++++++++++++++++++++++
 include/qemu/target-info-impl.h       |  6 +-
 include/qemu/target-info-qapi.h       | 29 ++++++++++
 include/qemu/target-info.h            | 10 +++-
 include/system/memory.h               |  1 -
 include/user/abitypes.h               |  1 -
 target/ppc/mmu-hash64.h               |  2 -
 cpu-target.c                          |  7 ---
 hw/acpi/bios-linker-loader.c          |  2 -
 hw/arm/allwinner-r40.c                |  1 -
 hw/arm/boot.c                         |  2 +
 hw/arm/npcm7xx.c                      |  2 +-
 hw/block/hd-geometry.c                |  1 -
 hw/char/riscv_htif.c                  |  1 -
 hw/core/cpu-system.c                  |  2 +-
 hw/core/machine-qmp-cmds.c            |  8 +--
 hw/cxl/cxl-events.c                   |  2 -
 hw/display/artist.c                   |  1 +
 hw/display/ati.c                      |  1 +
 hw/display/vga.c                      |  2 +-
 hw/net/can/ctucan_core.c              |  1 -
 hw/net/lan9118.c                      |  1 +
 hw/net/rtl8139.c                      |  1 +
 hw/net/vmxnet3.c                      |  1 -
 hw/pci-host/gt64120.c                 |  1 +
 hw/pci-host/pnv_phb3.c                |  1 +
 hw/pci-host/pnv_phb4.c                |  1 +
 hw/pci-host/ppce500.c                 |  1 -
 hw/pci-host/sh_pci.c                  |  1 -
 hw/s390x/s390-pci-inst.c              |  1 +
 hw/sensor/lsm303dlhc_mag.c            |  1 -
 hw/smbios/smbios.c                    |  1 +
 hw/vfio/migration-multifd.c           |  1 -
 hw/virtio/virtio-config-io.c          |  1 -
 hw/virtio/virtio-pci.c                |  1 +
 hw/virtio/virtio.c                    |  2 +-
 hw/vmapple/virtio-blk.c               |  1 -
 system/memory.c                       |  1 +
 system/qtest.c                        |  1 +
 target-info-stub.c                    |  2 +
 target-info.c                         | 23 ++++++++
 target/arm/arm-qmp-cmds.c             |  3 +-
 target/arm/cpu.c                      |  1 -
 target/i386/tcg/system/excp_helper.c  |  1 -
 target/i386/xsave_helper.c            |  1 -
 target/loongarch/loongarch-qmp-cmds.c |  3 +-
 target/mips/system/mips-qmp-cmds.c    |  3 +-
 target/riscv/vector_helper.c          |  1 -
 tests/tcg/plugins/mem.c               |  1 +
 hw/block/meson.build                  |  6 +-
 hw/virtio/meson.build                 | 20 ++++---
 53 files changed, 191 insertions(+), 146 deletions(-)
 create mode 100644 include/qemu/target-info-qapi.h

-- 
2.49.0



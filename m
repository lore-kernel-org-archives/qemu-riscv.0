Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2544EC5CFEB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 13:58:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuVwc-0002wy-5w; Thu, 13 Aug 2026 09:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuVwY-0002wH-En
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 09:58:02 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuVwW-000203-VE
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 09:58:02 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cca0c5799eso25412495ad.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786629479; x=1787234279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ortSojCF4MD4GaSWJ2LixTOkSzJRkp5zenv//2r71a0=;
 b=MqkVZNEaEHlsx1E8jWJCc7yKCjy9Ybmoha2FHrzluJsomDBzv6vf1ldQnJ+1/G/oh0
 BKFDo4J5+I85kDvtKLDm2D75/AEYfUDPsooTNpxfFxJzl+qNzF3hOKxeTyiqqtebrgWO
 1z3XOHVCl3/4jVaDq5X3kZQWH1ktLNo6R4ym72asCC+7Fvbot6L3Wx6/rPBmMiQz/y0g
 Qfr+qAsfuT2wCZPO26fFUMHqurfJ/hJeFXTXHHPo0vRhREayiFg9LJdJieUThPutI26F
 OlbFWU+jU2vVZ5TBUn9Sp+HrqcacAjCN3cNn0r8JztwUw1NdZKdlDLLbbJ50dEIVbbW2
 QW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786629479; x=1787234279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ortSojCF4MD4GaSWJ2LixTOkSzJRkp5zenv//2r71a0=;
 b=HojHVFIg2sPdtI2XJ1DxlpdA/mfsRHn/FTCvgc2zux5G5osL48S1zZM8Qjja9D/2uq
 dIpavJ/cKrG2hEHOA8H7Iadb7DYyK/HoVid2VFnLZYrxCwnmThAgPJd/A/cnaLnjdrsV
 wiI/63iAqSAOOLCev/5i6b/cWk2q+3+H3Wjshcb15hy4zvqVs+iL37rLOmLqR6S6vZXD
 S5Jwgvfcz7fau4pvubA9V5rmzjVi/u0TiB6HIs40hA98O6F20lmYssZYCcZP6exVMruy
 LXYGdhE3+hA5VlFXb0nZQfjyzMBrTRy7QptKEqCiNv1CHse/Xw4d0Ii9Zm/HOSwxaKjw
 vf0w==
X-Gm-Message-State: AOJu0YxHxI9bhdtRxFyurQzR7aBRajfk+yhBbj8wXaeEcrcFqh5uEJVx
 0Qp6+z6eAkXyw+LM7Tfx1T/0sOGRGux9Sit6y3Sfhmbvc+ugF752d6J1
X-Gm-Gg: AR+sD10CwKM1Pth8tq2gENwcA6y9wJnnzUwGlfu8OeRvhogiGkpzmJLzqEB9ZDGpnFQ
 G5qVBxbKdFhusaTzt9R0bl4WhjffV7Vr/t/DOVPvwsC/N93Ad7ftz+5c7d/d1FHA7RU6/NihgQ2
 jdApBt4HSSo089gIKYNEhQj/I06tV5IevlmefacB5LAEAzKp6tyii6Q07NM3GuL/AMAM0CjDUyy
 ZxNj5Xnarcvzp8xT4vqOARKeQEPQ3sfGfcmRl/78LNoW7OGXVkQXEZlfOBb8kACfMwhfiIX373z
 J0MiyZABLSBil2+tLbd0+ebWGxKE8QzaFA5hEOSLNPLhM4/RFx4WGVMRPRE7S5oq4nwCcXTJSK7
 0i0pXwCCcjC+wVVXOrIy1uyUtKc+LEkaZSwRLq5dpZYG40V6mMfIRl3W2rEpQoUhTt69U9W0Fyd
 bPJy2TuwP/UIsun8uMPiV0w1xAkTUtOHFHkYP4eGF46WYGDGiAu3g4s5jW7d70nxTRsIzFNGTpt
 RKTMIqiFg==
X-Received: by 2002:a17:903:2987:b0:2c9:e846:a57e with SMTP id
 d9443c01a7336-2d37d1c4a58mr73337325ad.0.1786629478749; 
 Thu, 13 Aug 2026 06:57:58 -0700 (PDT)
Received: from localhost.localdomain ([111.198.227.173])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d37c486531sm10024395ad.57.2026.08.13.06.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 06:57:58 -0700 (PDT)
From: Kangjie Huang <flamboyant.h.01@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Chao Liu <chao.liu@processmission.com>,
 Junze Cao <caojunze424@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 Kangjie Huang <flamboyant.h.01@gmail.com>
Subject: [PATCH v3 0/3] hw/riscv/k230: add IOMUX register block model
Date: Thu, 13 Aug 2026 21:57:14 +0800
Message-ID: <20260813135717.2758-1-flamboyant.h.01@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Add a SysBus model for the 64 K230 Function IO configuration registers
documented by the K230 Technical Reference Manual. The model retains the
writable configuration fields needed by the SDK U-Boot and Linux
read-modify-write paths.

The series adds the device model, wires it into the K230 SoC at
0x91105000, and adds qtest coverage.

Changes in v3:
- Migrated the model from the deprecated device_class_set_legacy_reset()
  to the Resettable interface.
- Added a comment to the model stating that bit 31 (DI) is read-only and
  reads as zero, since the model does not simulate external pin input
  (TRM V0.3.1, section 12.9.2.2).
- Added MAINTAINERS entries for the model and the qtest.
- Defined an independent K230_IOMUX_EXPECTED_WRITABLE_MASK (0x00003fff)
  in the test instead of reusing the implementation mask, with a comment
  explaining the bit layout.

Changes in v2:
- Split the device model, SoC wiring, and qtest coverage into separate
  patches.
- Removed redundant MMIO bounds, access-size, and alignment checks.
- Limited register storage to the 64 documented Function IO registers.
- Applied the documented 0x00003fff writable mask.
- Treated offsets 0x100 through 0x7ff as reserved.
- Added tests for write masking, read-modify-write accesses, IO63,
  reserved offsets, and system reset.

Tested with:
- qtest-riscv64/k230-iomux-test
- U-Boot and Linux boot tests with no unimplemented-device warnings
  for the IOMUX region

Thanks to Alistair Francis and Chao Liu for the v1 review comments that
shaped the v2 series structure and the register semantics.

Reviewed-by: Junze Cao <caojunze424@gmail.com>

v2:
https://lore.kernel.org/qemu-devel/cover.1784022244.git.flamboyant.h.01@gmail.com/

v1:
https://lore.kernel.org/qemu-devel/20260710041845.67170-1-flamboyant.h.01@gmail.com/

Kangjie Huang (3):
  hw/misc/k230_iomux: add Kendryte K230 IOMUX model
  hw/riscv/k230: wire up the IOMUX device
  tests/qtest: add test for K230 IOMUX

 MAINTAINERS                   |   3 +
 docs/system/riscv/k230.rst    |   1 +
 hw/misc/Kconfig               |   3 +
 hw/misc/k230_iomux.c          | 125 ++++++++++++++++++++++++++
 hw/misc/meson.build           |   1 +
 hw/misc/trace-events          |   4 +
 hw/riscv/Kconfig              |   1 +
 hw/riscv/k230.c               |  11 ++-
 include/hw/misc/k230_iomux.h  |  43 +++++++++
 include/hw/riscv/k230.h       |   2 +
 tests/qtest/k230-iomux-test.c | 160 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   5 +-
 12 files changed, 355 insertions(+), 4 deletions(-)
 create mode 100644 hw/misc/k230_iomux.c
 create mode 100644 include/hw/misc/k230_iomux.h
 create mode 100644 tests/qtest/k230-iomux-test.c


base-commit: d49f87606ac1a6e15701b26c1b16c5d7e948ffcb
-- 
2.43.0


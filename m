Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B55BC43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 10:22:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjaHj-0002TR-4N; Tue, 14 Jul 2026 06:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wjaHh-0002Si-9v
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 06:22:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wjaHf-0007fb-Na
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 06:22:41 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2ceed7018c8so3797885ad.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784024558; x=1784629358; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=94QNGNxvhEPD3lqPcVR5sielidd6+dY4KkuAPEXA+Oo=;
 b=LSC8w3/wMD3oEdBuJgq34iD0u6mBnLBV/NhnvZ8jNb6Y4Le5MSVkn+2m6BCKQETAhs
 5O0I80RrbS7BP7/aWi34mkb7XQDN/RspbfxZoUInDrmxQ54Gn6cG7tnanExsOdrY2oAx
 lXa2Vb1wQwl/bxgWUSLqAkqlkcj0zj7pmcM+U3Sv1OOUKqGb0KXkM9PxgAhxBAP3nlgc
 3I3MkrqpwP9kxXueebiFMFDMfKPqbXR67/93sA1vXzv5IVNANnCdTiD/69xgwoOvRjN6
 KDAOL7/vkG6ZBH8LbVq4qqDjkn/LZg6iSRWwBTWJd7DqNr6tLU9+8+yGBHrlKMKR/U/W
 +Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784024558; x=1784629358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=94QNGNxvhEPD3lqPcVR5sielidd6+dY4KkuAPEXA+Oo=;
 b=rhtAviU1q4KNxhmTE5qcG7BBCatTbg4+FrCTZdxolABel58Scomm23BbU2Dslzvam+
 GdHv4f+LXv56/HjxrKNcuQHr9EnAFxGTcmunzj+ETMwyqkd9vVCFzFNj1F68jh6N06tq
 S60LLbGhNPwAEVDAxWuqqxP4mUycGVYLq9LfEckScGYeZiYY/ZC9YzFyyaTIDvdBbfbo
 h6iscPGCZAlIlKS3Cy7cpV/Het8IIiRoJYm/YKvH9jWoY9XiBC+CvDf1uE/FroT862AN
 IxDC9uxoEyOolPirvUTQ25XaCWZPM8lKm8T/9MuwAo2JDwi/MD518h5QAUlu0+B7/+wu
 kWAQ==
X-Gm-Message-State: AOJu0YyuoX4kuZphG8aKno5tEER6On1HXcp1UwX9ZtfdNqRepB04+VNr
 k3j7/rZESCh7/3cpQF3SPo3MXBWbH7F3VudtetVNDs+Cj2Emf3XH8ZB8
X-Gm-Gg: AfdE7cmAdVNr3xUq+K2Vpw3+1cstaK/djdtBhFUy+y4DiGWvesLhZM7Ygacyg7uiAqr
 8Hd/tLps0UwgKLeq84LiMRX99KnTY61BQaQRvijYMFltWLWFv86dAUA6r333oIxRwVyq1ORocb4
 siTL6xUMlpaMIdKvJoGZEg0hONH/J9FLdfk7F1ER9tX6H/yFmlD3GGyentJ45jDtbKIG5R+Nso2
 F5n9JDLg5EbFqYDaWh29PM+bFF7wooSKc7WJR1t9ZHsuPUTurXf6ylexQpGZC8+L93QSaJnvhXy
 dzqXQefS05d4CwNfq+oF1Bt5jbHDjjOnKbnr6q8ibdK8gjvWnii5eZWgASyFFxbEpYEQk2cJZ1C
 Y+/WkQAQvhvGfueMu7vUMETFjH8pfb4ONlhde1lfX4uhd81TfDe727/qfao0BTwsJWWMDP/7J8n
 2I3ZY1qsiSOsWzfovBkTj1aGYl0gQoiM7REHd9+Vx9+Q==
X-Received: by 2002:a17:902:ebc9:b0:2c9:fa31:850c with SMTP id
 d9443c01a7336-2ce9f1548f8mr114433945ad.39.1784024557747; 
 Tue, 14 Jul 2026 03:22:37 -0700 (PDT)
Received: from LAPTOP-CS7CB8K1.localdomain
 ([2409:8900:9fe:241d:8c09:365b:5b34:d891])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bc1fsm113824285ad.55.2026.07.14.03.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 03:22:37 -0700 (PDT)
From: Kangjie Huang <flamboyant.h.01@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 Kangjie Huang <flamboyant.h.01@gmail.com>
Subject: [PATCH v2 0/3] hw/riscv/k230: add IOMUX register block model
Date: Tue, 14 Jul 2026 18:21:59 +0800
Message-ID: <cover.1784022244.git.flamboyant.h.01@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Add a SysBus model for the 64 K230 Function IO configuration registers
documented by the K230 Technical Reference Manual. The model retains the
writable configuration fields needed by the SDK U-Boot and Linux
read-modify-write paths.

The series adds the device model, wires it into the K230 SoC at
0x91105000, and adds qtest coverage.

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
- qtest-riscv64/k230-wdt-test
- SDK U-Boot smoke test, reaching the K230 prompt

v1:
https://lore.kernel.org/qemu-devel/20260710041845.67170-1-flamboyant.h.01@gmail.com/

Kangjie Huang (3):
  hw/misc/k230_iomux: add Kendryte K230 IOMUX model
  hw/riscv/k230: wire up the IOMUX device
  tests/qtest: add test for K230 IOMUX

 docs/system/riscv/k230.rst    |   1 +
 hw/misc/Kconfig               |   3 +
 hw/misc/k230_iomux.c          | 124 +++++++++++++++++++++++++++
 hw/misc/meson.build           |   2 +
 hw/misc/trace-events          |   4 +
 hw/riscv/Kconfig              |   1 +
 hw/riscv/k230.c               |  11 ++-
 include/hw/misc/k230_iomux.h  |  34 ++++++++
 include/hw/riscv/k230.h       |   2 +
 tests/qtest/k230-iomux-test.c | 155 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   5 +-
 11 files changed, 338 insertions(+), 4 deletions(-)
 create mode 100644 hw/misc/k230_iomux.c
 create mode 100644 include/hw/misc/k230_iomux.h
 create mode 100644 tests/qtest/k230-iomux-test.c

-- 
2.43.0


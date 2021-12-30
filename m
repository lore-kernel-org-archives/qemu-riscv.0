Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2uew-0001Wt-In
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:35:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ueu-0001Wd-Vu
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:35:53 -0500
Received: from [2607:f8b0:4864:20::432] (port=45799
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ues-0003DR-HP
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:35:52 -0500
Received: by mail-pf1-x432.google.com with SMTP id u20so21285563pfi.12
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jXJv/qTEk+I9uuUMXu+755vTI0smeMZQmAZ7RkG4lkQ=;
 b=j1xWuUU2Uo/xjsB1SAToFWsCb06wA21r9zRsqd87zV2iPZJ6X243P6FqJxTscgOMmL
 n29U1ru5qOePfQgRj3o85Qgr0lFWjtupddsKJN0gBqcyTdj9SoEveBLmIJUGcrI27QIS
 6L/2zqDh5rB6BiplhUmCq+AH5tdSFdXjxGYeKHB70C73xzfgS94B0W8nAiH/+nvj5PS/
 tUaX1qSXo1Ht3qosapu3DZj9dHHIr7Q84SovQH76P/2TYkbVPx8HhycK/G1DjCbIibEL
 0+hKkksNQdklhoJFJCybjWftTksVx5ca8yE1oDK46+l2Xqx39EvfGvq9qs6jywpYnEKS
 MwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jXJv/qTEk+I9uuUMXu+755vTI0smeMZQmAZ7RkG4lkQ=;
 b=pbYaq1XSgGDCCcQzu3D8PpRLDapBana5AU1sOYGgWT0Vb9zx/JL0jIrwS2cFnlwz5J
 ORNBgXNwaI8fibg5GzadLtoEeYXwz4Du/L35PuZlx6G+cByX53G0BOeXBMqlCMConxp/
 6vsI0by832njgdBWzD2YRrKYkhgo+17Sd0PZG+/uGyUPZ+8XY3T4WGLuQkA2YnPom8sO
 /wnqKom5ldbqg8oh2Gprs9O0xpVLckGRWB5GtLMw1GKUrDYnhfNGIsuGND3rQIyFjmG+
 y7M/7nhNBiJ140MrHHIKYTrq+ErwODTy9+qd9usCcAAqoY8JAzpplOrWoSm2+dS3/Nmm
 7jzw==
X-Gm-Message-State: AOAM531/3azdY4QSx6Qk1wwo++uEB+Z2i6q8GD59kTVMzHaElYccOFGy
 HP1NrnRBH9bojRo+HpLobm0GoA==
X-Google-Smtp-Source: ABdhPJwDit5tECrDd59F0YXBoOZ4zVUqjKWj81fs8/gFCfYbEov8tM0jEsGqtBe2UAiRLBdsDBOH7Q==
X-Received: by 2002:a05:6a00:139b:b0:4ba:a476:364e with SMTP id
 t27-20020a056a00139b00b004baa476364emr31398406pfg.59.1640867747507; 
 Thu, 30 Dec 2021 04:35:47 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:35:46 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 00/23] QEMU RISC-V AIA support
Date: Thu, 30 Dec 2021 18:05:16 +0530
Message-Id: <20211230123539.52786-1-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=anup@brainfault.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 12:35:53 -0000

From: Anup Patel <anup.patel@wdc.com>

The advanced interrupt architecture (AIA) extends the per-HART local
interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
and Advanced PLIC (wired interrupt controller).

The latest AIA draft specification can be found here:
https://github.com/riscv/riscv-aia/releases/download/0.2-draft.28/riscv-interrupts-028.pdf

This series adds RISC-V AIA support in QEMU which includes emulating all
AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filtering is
not implemented because we don't have any local interrupt greater than 12.

To enable AIA in QEMU, use one of the following:
1) Only AIA local interrupt CSRs: Pass "x-aia=true" as CPU paramenter
   in the QEMU command-line
2) Only APLIC for virt machine: Pass "aia=aplic" as machine parameter
   in the QEMU command-line
3) Both APLIC and IMSIC for virt machine: Pass "aia=aplic-imsic" as
   machine parameter in the QEMU command-line
4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
   "aia=aplic-imsic,aia-guests=2" as machine parameter in the QEMU
   command-line

To test series, we require OpenSBI and Linux with AIA support which can
be found in riscv_aia_v1 branch at:
https://github.com/avpatel/opensbi.git
https://github.com/avpatel/linux.git

This series can be found riscv_aia_v6 branch at:
https://github.com/avpatel/qemu.git

Changes since v5:
 - Moved VSTOPI_NUM_SRCS define to top of the file in PATCH13
 - Fixed typo in PATCH16

Changes since v4:
 - Changed IRQ_LOCAL_MAX to 16 in PATCH2
 - Fixed typo in PATCH10
 - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH11
 - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH14
 - Replaced TARGET_LONG_BITS with riscv_cpu_mxl_bits(env) in PATCH15
 - Replaced TARGET_LONG_BITS with xlen passed via ireg callback in PATCH20
 - Retrict maximum IMSIC guest files per-HART of virt machine to 7 in
   PATCH21.
 - Added separate PATCH23 to increase maximum number of allowed CPUs
   for virt machine

Changes since v3:
 - Replaced "aplic,xyz" and "imsic,xyz" DT properties with "riscv,xyz"
   DT properties because "aplic" and "imsic" are not valid vendor names
   required by Linux DT schema checker.

Changes since v2:
 - Update PATCH4 to check and inject interrupt after V=1 when
   transitioning from V=0 to V=1

Changes since v1:
 - Revamped whole series and created more granular patches
 - Added HGEIE and HGEIP CSR emulation for H-extension
 - Added APLIC emulation
 - Added IMSIC emulation

Anup Patel (23):
  target/riscv: Fix trap cause for RV32 HS-mode CSR access from RV64
    HS-mode
  target/riscv: Implement SGEIP bit in hip and hie CSRs
  target/riscv: Implement hgeie and hgeip CSRs
  target/riscv: Improve delivery of guest external interrupts
  target/riscv: Allow setting CPU feature from machine/device emulation
  target/riscv: Add AIA cpu feature
  target/riscv: Add defines for AIA CSRs
  target/riscv: Allow AIA device emulation to set ireg rmw callback
  target/riscv: Implement AIA local interrupt priorities
  target/riscv: Implement AIA CSRs for 64 local interrupts on RV32
  target/riscv: Implement AIA hvictl and hviprioX CSRs
  target/riscv: Implement AIA interrupt filtering CSRs
  target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
  target/riscv: Implement AIA xiselect and xireg CSRs
  target/riscv: Implement AIA IMSIC interface CSRs
  hw/riscv: virt: Use AIA INTC compatible string when available
  target/riscv: Allow users to force enable AIA CSRs in HART
  hw/intc: Add RISC-V AIA APLIC device emulation
  hw/riscv: virt: Add optional AIA APLIC support to virt machine
  hw/intc: Add RISC-V AIA IMSIC device emulation
  hw/riscv: virt: Add optional AIA IMSIC support to virt machine
  docs/system: riscv: Document AIA options for virt machine
  hw/riscv: virt: Increase maximum number of allowed CPUs

 docs/system/riscv/virt.rst    |   16 +
 hw/intc/Kconfig               |    6 +
 hw/intc/meson.build           |    2 +
 hw/intc/riscv_aplic.c         |  970 +++++++++++++++++++++++++
 hw/intc/riscv_imsic.c         |  447 ++++++++++++
 hw/riscv/Kconfig              |    2 +
 hw/riscv/virt.c               |  708 +++++++++++++++---
 include/hw/intc/riscv_aplic.h |   79 ++
 include/hw/intc/riscv_imsic.h |   68 ++
 include/hw/riscv/virt.h       |   42 +-
 target/riscv/cpu.c            |   97 ++-
 target/riscv/cpu.h            |   72 +-
 target/riscv/cpu_bits.h       |  131 ++++
 target/riscv/cpu_helper.c     |  293 +++++++-
 target/riscv/csr.c            | 1279 ++++++++++++++++++++++++++++++---
 target/riscv/machine.c        |   24 +-
 16 files changed, 3938 insertions(+), 298 deletions(-)
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 hw/intc/riscv_imsic.c
 create mode 100644 include/hw/intc/riscv_aplic.h
 create mode 100644 include/hw/intc/riscv_imsic.h

-- 
2.25.1



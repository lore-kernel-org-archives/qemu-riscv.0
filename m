Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S5C-0001Gq-1c
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S59-00019b-3D
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:29:59 -0500
Received: from [2607:f8b0:4864:20::430] (port=46012
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S4r-0000dY-DJ
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:29:57 -0500
Received: by mail-pf1-x430.google.com with SMTP id 128so10205065pfe.12
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r/8P0HsFiChEM8y/B9Wqc8u9nmhTA2UvHn/q8WhmIyQ=;
 b=dwznWcVzeaYJrKFFEPenX/QQNslx/2dOHBScSuYzvlHd91oV6ry7+0EMTBWzb7CEcp
 a6rCULz26V+aq98x26cgURrKumRdPKGr5o/47s56VraNGHcgtnxbyIBhX1CiQlLHfN2R
 w5TIIkxTNBc1CK04yDpUhg5a6ygIOxkNdl+BjaXpXdF/SmaiatAG3R8GIqoGP+nZ/J+C
 /hKIwmJLtHX/+hVffHDlkCrZ6vVpsEjQEWim+8aVMdnSkQga1WSVVArltLjiODvJESr8
 qQzBakjQD2mA/kKkVSsDFCbtuXSVFla2YCVmIdUTf6JWs+zuGMOC9/BW12SDQ6fkU7Or
 APtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r/8P0HsFiChEM8y/B9Wqc8u9nmhTA2UvHn/q8WhmIyQ=;
 b=fH29hAbo8ryfQF9F16isALL4E88UmIbjrh3iRaI73wtqzseHrsXvfiD0SBrWM7OmKU
 FG1l/HKhZe66quIeNRvfhVWTaE7gk4nKGFoc1d4IlTRB7uz9LcAtDtTAa+fJ13I3u6X0
 lJeu9VhDTEFeH0S4bqiLVdlP9iujMIZyGSuYTS6U9lZtsg7cUEVkkhMla4jvkanLZL0p
 mRJlTUCza5k/Z5DZ8NfBfoBtuHbUK35jN8qHPOZFOoMLv9WE4jBd4kfIYKkuznUXZqC5
 gUquxBBODzq2tHL836zr44HHzoXJ/Dl5gu0Dv3/8o/72kOSGtCys5h3jJJkHr6C08mXV
 kmqQ==
X-Gm-Message-State: AOAM530YW8bREdrLSRej0ysYnl5duqh+PXKf5UvR+byazBp2yPFzfilJ
 7lxNlLsq22wrj0gbF8tYJD7Sug==
X-Google-Smtp-Source: ABdhPJxMh0WfZf1GpdyxltYrvPBpvXD1poV6eCytd7Pdv51eGZG82/0zAwmL0c+DpJ1+yvQCMEVe0A==
X-Received: by 2002:a63:340c:: with SMTP id b12mr19281059pga.359.1642426153320; 
 Mon, 17 Jan 2022 05:29:13 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:12 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v7 00/23] QEMU RISC-V AIA support
Date: Mon, 17 Jan 2022 18:58:03 +0530
Message-Id: <20220117132826.426418-1-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=anup@brainfault.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 17 Jan 2022 13:29:59 -0000

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
be found in:
riscv_aia_v2 branch at https://github.com/avpatel/opensbi.git
riscv_aia_v1 branch at https://github.com/avpatel/linux.git

This series can be found riscv_aia_v7 branch at:
https://github.com/avpatel/qemu.git

Changes since v6:
 - Fixed priority comparison in riscv_cpu_pending_to_irq() of PATCH9
 - Fixed typos in comments added by PATCH11
 - Added "pend = true;" for CSR_MSETEIPNUM case of rmw_xsetclreinum()
   in PATCH15
 - Handle ithreshold == 0 case in riscv_aplic_idc_topi() of PATCH18
 - Allow setting pending bit for Level0 or Level1 interrupts in
   riscv_aplic_set_pending() of PATCH18
 - Force DOMAINCFG[31:24] bits to 0x80 in riscv_aplic_read() of PATCH18
 - For APLIC direct mode, set target.iprio to 1 when zero is writtern
   in PATCH18
 - Handle eithreshold == 0 case in riscv_imsic_topei() of PATCH20

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
 hw/intc/riscv_aplic.c         |  975 +++++++++++++++++++++++++
 hw/intc/riscv_imsic.c         |  448 ++++++++++++
 hw/riscv/Kconfig              |    2 +
 hw/riscv/virt.c               |  708 +++++++++++++++---
 include/hw/intc/riscv_aplic.h |   79 ++
 include/hw/intc/riscv_imsic.h |   68 ++
 include/hw/riscv/virt.h       |   41 +-
 target/riscv/cpu.c            |   97 ++-
 target/riscv/cpu.h            |   72 +-
 target/riscv/cpu_bits.h       |  131 ++++
 target/riscv/cpu_helper.c     |  304 +++++++-
 target/riscv/csr.c            | 1280 ++++++++++++++++++++++++++++++---
 target/riscv/machine.c        |   24 +-
 16 files changed, 3955 insertions(+), 298 deletions(-)
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 hw/intc/riscv_imsic.c
 create mode 100644 include/hw/intc/riscv_aplic.h
 create mode 100644 include/hw/intc/riscv_imsic.h

-- 
2.25.1



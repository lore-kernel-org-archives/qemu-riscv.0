Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nACqy-0005jJ-Iv
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 10:26:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACqx-0005eL-22
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:27 -0500
Received: from [2607:f8b0:4864:20::634] (port=38739
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACqu-0000El-Or
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 10:26:26 -0500
Received: by mail-pl1-x634.google.com with SMTP id c3so2527790pls.5
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 07:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uk1vw4qpYEeAcQkrOtxT0ev0mAQDmaTQb0R2kgh/lBQ=;
 b=C+vrShbd7chVSl6CHkVQMR8ZF/zkfwMOdSfbsxexelT71JtZcrNN/SQf0J8jGbCqKC
 6cPIPzhdP6/cbracx/UpQxNzvYgU6M4StzthB0ouO4rZIiDG6Fbvt8oIMAdjkrbijLFl
 gV152PuyZDNfBeyvoa6xjjUIfdx8puODcK+UDSE9cczS0fLRcruqsRJKC6wLroIuAHIC
 fJFMsYifrGfC9fes47lcEpxld9aEoyIoNTpS6zWXIkors7gwgz5LRFzKgij389/BdGuq
 cKXfcrMcDNoeNNkx7sqp04Xs+XNk0GtqhSlkqtCbaBJYTS43jAYpvTpxFEJbmh1qJmFY
 9IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uk1vw4qpYEeAcQkrOtxT0ev0mAQDmaTQb0R2kgh/lBQ=;
 b=0pLw3hcQkdeDZjvPWERMc/4c8rE51iNi5X2fsCkZxb9uLVtnHfAoaRNvchEPay1BLM
 3T5ZcclSi7C80OjwkoE0LhZgItWamJGqIdXYOF9rsPwLFCU3JpeE+goL91U010Dkvu/T
 Iv+LPLvsY70lmw16oAfz/Jy+fFpPDjlo6d8R7F+fZ9uHNBS4Ww197KXyzNdUEAdMYfsd
 CqAct18H+FE0HVhHVN8jTs97ozWN3ZQdvILUkmP6KNhOHZQ874k0Ts+uaJkD6hIr8bkY
 ZQjbFnFP1rFWwkDXfUpmoaL9r+EwDmwjWAlCy67BW+ickFmazJ7lDQkgn7VcjNPq7KNf
 3umw==
X-Gm-Message-State: AOAM532A77/+yOVp217nbyu22Lu7YI8bkCaCjZPlg1qIIqWVglwN7bSl
 YrQUnShX6uZGCz76dsVw7NmHSQ==
X-Google-Smtp-Source: ABdhPJzwhjLWjPgQiEY6IjOwrtgfHfjeHJNSyidWD3qzozZuZfMVGwzEZcnBSrLOSyPoBpmdAabfgw==
X-Received: by 2002:a17:902:aa4b:b0:14a:cff4:19ec with SMTP id
 c11-20020a170902aa4b00b0014acff419ecmr10126995plr.60.1642605982657; 
 Wed, 19 Jan 2022 07:26:22 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:26:21 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v8 00/23] QEMU RISC-V AIA support
Date: Wed, 19 Jan 2022 20:55:51 +0530
Message-Id: <20220119152614.27548-1-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Wed, 19 Jan 2022 15:26:27 -0000

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

This series can be found riscv_aia_v8 branch at:
https://github.com/avpatel/qemu.git

Changes since v7:
 - Rebased on latest riscv-to-apply.next branch of Alistair's repo
 - Improved default priority assignment in PATCH9

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
 hw/riscv/virt.c               |  706 +++++++++++++++---
 include/hw/intc/riscv_aplic.h |   79 ++
 include/hw/intc/riscv_imsic.h |   68 ++
 include/hw/riscv/virt.h       |   41 +-
 target/riscv/cpu.c            |  103 ++-
 target/riscv/cpu.h            |   72 +-
 target/riscv/cpu_bits.h       |  123 ++++
 target/riscv/cpu_helper.c     |  343 ++++++++-
 target/riscv/csr.c            | 1280 ++++++++++++++++++++++++++++++---
 target/riscv/machine.c        |   24 +-
 16 files changed, 3988 insertions(+), 300 deletions(-)
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 hw/intc/riscv_imsic.c
 create mode 100644 include/hw/intc/riscv_aplic.h
 create mode 100644 include/hw/intc/riscv_imsic.h

-- 
2.25.1



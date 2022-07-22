Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEh2M-0002hR-O5
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 21:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oEh2G-0002g6-W3
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 21:00:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oEh2C-0004nM-MJ
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 21:00:54 -0400
Received: by mail-pj1-x102e.google.com with SMTP id pc13so3077223pjb.4
 for <qemu-riscv@nongnu.org>; Thu, 21 Jul 2022 18:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJMF+QwxuxeFL9Y4njw5Uu3hl4+mobDhhJ6Om1heV/k=;
 b=RynAYW1aOv/gpxvkl+Qh9YImECqzZlUpzQasmKf64Wg7LyyfZRAsxQzqH8eTS90iGJ
 +DvV5XRgsNXD5JXsjOOKSgZrrEmF/x3mLXIWmgfEt/QZxMqx2QMcd6OMQ3HEbNbsvW2b
 THFhSv2N1PlPvCzHxSwulS0mBBEki86puwgiXDt7RAWao+2FJ+UwwGGFjw/JpsvJiduI
 1UL1wxl2fOyCBdpQxjR1aRAldsJh31cnVEHLudRIutLlwM/1L8rxTHnMzhFqr2fJsuLp
 v/el/0Si6Al0sVIo9nuDzLcY4Y8THL8lsxOfvcfBXyYjzUJ3qKJCLnZBCTLXndpJkiLH
 ki7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJMF+QwxuxeFL9Y4njw5Uu3hl4+mobDhhJ6Om1heV/k=;
 b=Q34wS8v55lbdCAwLlb44o9b5niFvkmCpXAwD/PBmIjh4fVneLLJR/YYPAm+a5FEfZr
 Qgyj4Ab3F0+DFYddBmtE+lE8nbOmvHKCDz6Te236LlOCG6KMoCfYcS11yuQjJYPnoATX
 +vrGwwTRjlP4yHJQPdwbCF85V6/t663Oy67cFH0HlFJ2XEMEdIGI/HEGkuAA0mXexQYu
 1b0egnqQn/Ox3+3/kzu3IrGvgTDbNXYdKooBf3qlixNKb/rORAYhAbTSTNzVKGhVYhhD
 pFe8uEJw5MUKitagPVqJhgwxGlc9C0OeQr1SBlJZp+08Sr7TwBhc81GmkwRCj86wHHEK
 G1fQ==
X-Gm-Message-State: AJIora8Y3NR+DCH6iaZ1vamtV2JRmDOeLF+FwanGgzkEMBDqkAhgHqmu
 Ae1BStIHugxaFi/TdkmZOv58BA==
X-Google-Smtp-Source: AGRyM1vuabrGtiXVymE3L9wGmkYZVXYQVrEogjemR4eRoVskDJaxBXOHq0hqS8Yu4ZVvMN4TEaRUoA==
X-Received: by 2002:a17:90b:4c0c:b0:1ef:e4f6:409f with SMTP id
 na12-20020a17090b4c0c00b001efe4f6409fmr14046407pjb.227.1658451649926; 
 Thu, 21 Jul 2022 18:00:49 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 d20-20020aa797b4000000b0052b8a7f6b65sm2393631pfq.109.2022.07.21.18.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 18:00:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v6  0/3] Implement Sstc extension 
Date: Thu, 21 Jul 2022 18:00:43 -0700
Message-Id: <20220722010046.343744-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Jul 2022 01:00:59 -0000

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
on top of upstream commit (faee5441a038).

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v6

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches.

Changes from v5->v6:
1. Rebased on top of the latest HEAD commit.

Changes from v4->v5:
1. Removed any ordering related flags and emulate the hardware more
   closely. 

Changes from v3->v4:
1. Added [v]stimecmp_wr_done to the corresponding vmstate strucuture.

Changes from v2->v3:
1. Dropped generic migration code improvement patches.
2. Removed the order constraints while updating stimecmp/vstimecmp.

Changes from v1->v2:
1. Rebased on the latest upstream commit.
2. Replaced PATCH 1 with another patch where mtimer/timecmp is
   moved from CPU to ACLINT.
3. Added ACLINT migration support.

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
[2] https://github.com/atishp04/linux/tree/sstc_v7

Atish Patra (3):
hw/intc: Move mtimer/mtimecmp to aclint
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c         |  41 +++++---
hw/timer/ibex_timer.c          |  18 ++--
include/hw/intc/riscv_aclint.h |   2 +
include/hw/timer/ibex_timer.h  |   2 +
target/riscv/cpu.c             |  12 +++
target/riscv/cpu.h             |  11 +-
target/riscv/cpu_bits.h        |   8 ++
target/riscv/cpu_helper.c      |  11 +-
target/riscv/csr.c             | 177 +++++++++++++++++++++++++++++++++
target/riscv/machine.c         |   7 +-
target/riscv/meson.build       |   3 +-
target/riscv/time_helper.c     | 114 +++++++++++++++++++++
target/riscv/time_helper.h     |  30 ++++++
13 files changed, 404 insertions(+), 32 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1



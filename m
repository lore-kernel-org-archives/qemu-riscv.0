Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQydX-0006Mp-MT
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 18:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQydX-0006Md-2N
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 18:14:11 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQydV-0005yy-4n
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 18:14:10 -0400
Received: by mail-pf1-x430.google.com with SMTP id 83so12123976pfw.6
 for <qemu-riscv@nongnu.org>; Wed, 24 Aug 2022 15:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=1X+8/3kJABWSrmsLJUG+kcdy0bPPNnn1dkD2ahxSGV0=;
 b=pbfRAr5sUUm9Sfu2oh112UO44UPgarB2vduQqZ+DrjlqhjGKdqThhB5Ods5AJBcQJK
 cxDP0MTBf3NuMnSAHD0/8c7Ar7UXNzwnR7tSwr4ti/e7dzMoOIobVvpEh2R2kV3xU3WP
 1y2OPKqwyAA4DDRYCfxOII9oZ1FG3kGVRfr+u6QH5pNamSK3p757tu9MFyEQRA8fAMCm
 XDoKe7o/x6C/k27YN5XujFUpiERMoDcN3zKOpTHwKSxAxi3R120aET10h//jIb5ZGp+/
 KFUy78ARrDYMYaeq17NxRCTRvCoP7+w7gGORLm0XnTnzg+PznU3TEhJ1A7KsCJiQaH28
 ZBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=1X+8/3kJABWSrmsLJUG+kcdy0bPPNnn1dkD2ahxSGV0=;
 b=joYOiveAQx+Hs+BM37FM2mxVVifSqDNIFlthjqyOJ0W7LiQOR0ko/fQeG83Iy7XYmS
 3RXexdiBcXY2Tcwp4wROF9qqGMe3V3T85Aa+WYqhIk0SV6ZJestxjkQRSDwJGGJiVN1t
 AnAuB/1J/sjcu6EdR6JWC1nskWaj5c0zg1/n827OPL0n++DcCkdJArduNFwqZFPNaRWV
 AfBYnjjNxND2AUU9uDK1iCCgekbGwTrHFR0kfAw601EkVmtDd0qcyhfM7mvUzeZZR5G2
 451sW446sZZ9r03sUhvVprDNTIXZpRdc0Dt8oJEHqnbtAhH/fRxkD4Wy7niUULKSk4pE
 kAnw==
X-Gm-Message-State: ACgBeo1k/ZHxqar7sqYx/S8cKpiDEtXNAJw0DOgti8BNkpqCDOS3X6gx
 BAX33ZZn5wc7/vP9N8QavnBMJg==
X-Google-Smtp-Source: AA6agR5HkJfEbgaH73a4ROdHvObSGZ3UneKxWzzNwFbrSKEq4MVme+mIYg3/SOwSrzO3crTddFsn+w==
X-Received: by 2002:a63:81c8:0:b0:429:ea8c:3afa with SMTP id
 t191-20020a6381c8000000b00429ea8c3afamr779802pgd.22.1661379246807; 
 Wed, 24 Aug 2022 15:14:06 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a62a20e000000b0052d33bf14d6sm13458600pff.63.2022.08.24.15.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 15:14:06 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v10  0/3] Implement Sstc extension 
Date: Wed, 24 Aug 2022 15:13:54 -0700
Message-Id: <20220824221357.41070-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Wed, 24 Aug 2022 22:14:11 -0000

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
on top of upstream commit (faee5441a038).

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v10

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches.

Changes from v9->v10:
1. Fixed the multi socket booting issue by using the relative hartid.

Changes from v8->v9:
1. Updated alignment of few lines.
2. Improved predicate functions for sstc.

Changes from v7->v8:
1. Removed redundant blank lines.
2. Invoke smode & hmode predicate function from sstc related predicate
   functions.

Changes from v6->v7:
1. Replaced g_malloc0 with g_new0.
2. Removed the over allocation for the timers.

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
[2] https://github.com/atishp04/linux/tree/sstc_v8

Atish Patra (3):
hw/intc: Move mtimer/mtimecmp to aclint
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c         |  48 +++++++---
hw/timer/ibex_timer.c          |  18 ++--
include/hw/intc/riscv_aclint.h |   2 +
include/hw/timer/ibex_timer.h  |   2 +
target/riscv/cpu.c             |   9 ++
target/riscv/cpu.h             |  11 ++-
target/riscv/cpu_bits.h        |   8 ++
target/riscv/cpu_helper.c      |  11 ++-
target/riscv/csr.c             | 168 +++++++++++++++++++++++++++++++++
target/riscv/machine.c         |   7 +-
target/riscv/meson.build       |   3 +-
target/riscv/time_helper.c     | 114 ++++++++++++++++++++++
target/riscv/time_helper.h     |  30 ++++++
13 files changed, 397 insertions(+), 34 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLqih-0005nI-Fb
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 14:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oLqiV-0005Xo-0L
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:07 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oLqiP-0007Dh-O3
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:05 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso2958363pjl.4
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=C3j2N58wY74tOJ+LUQmeOvBCA0QF4z/0u9/0VaYFID8=;
 b=BhZlXg0BY0LFCMQY6/K+pG8gk4Kp0oD/FSUMBGEpkVUO+RtQdY4FiKHpheg+d5cXIr
 ywR+d3oCkbUh73RdgKGemw92ICdemK2WUMLE5cmryv2bH29EOTlUEJz4jTJQCmogepzf
 TsyULTxhdmJMJ10FKW8ch08XquSFKLxRtfCJZ6G4Oh8ngPFaV0elEDONBBC2BjIl2eKW
 OIgUs0TJ8zj7qeTDg8N32D/g10Kl0T9VqCKGiHT+lhrwHgb7p3RZfrFUV8dN2059bYtE
 Aaf6W94oCGhsP5xJa5rXkwUq3DUi/MI5dDHrOIZHjtcDBzH98NeQT5j9rW722gjWIpNy
 VH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=C3j2N58wY74tOJ+LUQmeOvBCA0QF4z/0u9/0VaYFID8=;
 b=y0lFkQT7YwGRwER/QrDTegGSBIMTNjKrvezEBhVutLK6v1eUn5lLx+vnFrK+QrN5pD
 +5SODi7mYO5sH2nw2XJjIPUKaQo1z7JNIv78lBLbCOcI1m5Gd9xMFekXHFu64/dV8JZC
 PxBKOAJflo6dJx9/ao7MnGxu39EBJ0pPcrW9sVPm/iUa2MG8P68EzbnEh1jomwCEoO9/
 GxjcAv/cTc357NQd1KCavimY4TXVBejfBiDT0Iopk0udCaPb+j/rvEkitAGz1VExtSeB
 Mh13By0NnOvcOaPBWpCrWOBX+ML7De4qXkH7jeeZnUjzpR6yUS2AAHUEkZ5UaSbdfRsp
 hAEA==
X-Gm-Message-State: ACgBeo1gs7hj9AjgnsaJpcaQwoU38IIav+G//jdnOM8Ad3Wbi9snM8wS
 u0IXgvDXpdRutYwfBhsWDjXjVA==
X-Google-Smtp-Source: AA6agR6LruePgl6TLRZI6xYIA/r05AloFMhd16x5NviTn7UUKIotAnejXikLCAH6hT9wWBqt7djvUw==
X-Received: by 2002:a17:90b:3b8d:b0:1f7:2b01:b97a with SMTP id
 pc13-20020a17090b3b8d00b001f72b01b97amr4925990pjb.209.1660157159468; 
 Wed, 10 Aug 2022 11:45:59 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a170903228d00b00162529828aesm13270142plh.109.2022.08.10.11.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:45:59 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v9  0/3] Implement Sstc extension 
Date: Wed, 10 Aug 2022 11:45:45 -0700
Message-Id: <20220810184548.3620153-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Wed, 10 Aug 2022 18:46:07 -0000

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
on top of upstream commit (faee5441a038).

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v9

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches.

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

hw/intc/riscv_aclint.c         |  41 +++++---
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
13 files changed, 392 insertions(+), 32 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJ9hG-0002h5-L3
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 04:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ9h4-0002XN-Qb
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 04:25:31 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ9h2-00063r-DL
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 04:25:30 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 v16-20020a17090abb9000b001f25244c65dso1269268pjr.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Aug 2022 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=b38lbf26Xj3NEUnNprf3GDaaxAPB/P16DK4vovVjcpw=;
 b=U9CX2CIM8zI/hTm6YGKTvdK49bQpRMw9O9riOt0GP8fro28Tkx9+WlzQMACLkhl/EU
 vTNxTEsH+tZ65Yc4xW9B8b+yAfgBnAa8HsMgfmWg/KwnQl8F8COiU2NsK0f4dQZjVgAP
 popme0emU9BmBlIPIYRqJXBdePxfLErX0tb95tLHwGEHfLpeWT/kcnqrpy/n3hkLvfoY
 hrzzzVm8g6Mj0VT8SdSRvHVPVdkySCxECGYN/M3LZX8J7DcLgi/VOt5A/ViGeWwM2WJ9
 JJUFa4Pe9mLNf0VY7+Y8wg+W4ZTRfswUSmpi1/5sLhkaPLHkQ4qDSxCQ3KG866tSQoBS
 rx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=b38lbf26Xj3NEUnNprf3GDaaxAPB/P16DK4vovVjcpw=;
 b=kTCoEXgf3vEuSq9F7aMRzHPCD8QD/xC4byZv7vmTBaVvfGRDw/rcYKo/Efrxgf2pVZ
 NCCwu4Dxvs3+BI0v2FMWMU3WsUHSmXbHzvfG3OLkCcq0GYRdRFxGkNkOswvqjFMh/T5t
 jmQAN0nw9Jad4ZIgj+A6aZpcLLGZX5vm5xZGzFatIh+kiMXl6DQ/EEzNsNRVMvwITSAp
 51eCkaDMQb0Exc3Cc0xm9tyujDRp3wy/wfyq1qxys6jI9woublG6bS4aEb5u44/2wMfD
 bnpwy0cAJ1fsT7VZxHuSIHWmr2xcYmcJGXina4m57FwIm34XFy+MhPlugsTkx5j6qHmq
 buYQ==
X-Gm-Message-State: ACgBeo1gW7Zvc7ri7pXPNdVHPUqDr4LY0iOIKfHWDZrjeG4Hz/Wb2niS
 zDvWEl7lAy6qi1WWUsdQO6hhlw==
X-Google-Smtp-Source: AA6agR6LlZmXNNWlLeanQFiJWN1146YNssetTJIMYYYCKq7ROsa5BNHHXB2CSkd2jjyZxkm9xuqO+A==
X-Received: by 2002:a17:903:228f:b0:16f:1b48:230c with SMTP id
 b15-20020a170903228f00b0016f1b48230cmr343283plh.78.1659515124962; 
 Wed, 03 Aug 2022 01:25:24 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r63-20020a17090a43c500b001f260b1954bsm961997pjg.13.2022.08.03.01.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 01:25:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v7  0/3] Implement Sstc extension 
Date: Wed,  3 Aug 2022 01:25:13 -0700
Message-Id: <20220803082516.2271344-1-atishp@rivosinc.com>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 Aug 2022 08:25:32 -0000

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
on top of upstream commit (faee5441a038).

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v7

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches.

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



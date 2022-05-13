Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npZrQ-0006wD-No
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 14:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npZrP-0006s2-Mr
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 14:17:55 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npZrN-0000Ku-6H
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 14:17:55 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i17so8681583pla.10
 for <qemu-riscv@nongnu.org>; Fri, 13 May 2022 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=93VyuI9ux6SDr/ub98vmdVIqFVVDpMP+vBYt5ZXXoRM=;
 b=7NwlP4SqnNBFJQmv7Q1UpQ3ZklLY8I91FRB6sOBmLgWTbpTwsj+K7Szdzx7fmIPEB1
 P1JE6kobU+XIPF9yostGJ66AYqg9msd5x5ZSgKkqHQCWDi7xL6LHYJDK8HDtQq/3K4xf
 ymd/7QbEOH5B1qKe5ui35XqlHMVNtMgLkAaqnm+SLm59teYA1ee7owkIjmGtgIkw1C6T
 1rYGeI4PQvmnP3CEWBNzhHU8pTaX2rN5UrTnlh/x9037dU0e2IeAmJgyAGjHlz2/nWi0
 a+txoe/5xkURe9HpK8C8ShQXjz75CJeMwe6UsnAi6Ks0gnP2YaIjK6fW8bBGeyiDny7f
 dC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=93VyuI9ux6SDr/ub98vmdVIqFVVDpMP+vBYt5ZXXoRM=;
 b=etKPaK3CiS9c0h7NxDBKMVaQd9ke7NRoTIsGZKMTiOBEb/7GF3e6TGYHh3MQRvkVHj
 QoTsGFWjkQ9EzzcSL+XCT5c/+TPT3vsEQ3ei5AdTPf7mROD2w8yhhraCFKnY1NVlS365
 tT7hCpSWBjAa7BMjWpQJ4x4WS7OcJTTJb5wcyXQTL9nE+Vy67Fui4iTzHE/t+T25Wfol
 ZEbZ1DQmKaEh6XI883A0nEmDqI9NKW5UNqsI8cFduIE0XODkeI+Cs3xf9sOtdWH4nNhC
 Ws3Tga5pDqIwgNlkI7QTSBfBxvi0Zq7vG9OzPOI2W56gd3gki/XJ4pNLPLT6HEcUHmdQ
 vzxw==
X-Gm-Message-State: AOAM533BnN7z6imrUxKij661g+5QN5XoGCfAc66TutEvKATGwxGMpM31
 Qm7zr/8fHWM6tD8MVjahaJVQNQ==
X-Google-Smtp-Source: ABdhPJwl89g5W/bged/FP7qInJ7SirlTwMLMOaZb0egEZLtPGomE2sWIz21847UWSpR0tJEKPW+nCw==
X-Received: by 2002:a17:90a:ec0e:b0:1d9:7f4d:23be with SMTP id
 l14-20020a17090aec0e00b001d97f4d23bemr6076892pjy.181.1652465871525; 
 Fri, 13 May 2022 11:17:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 gg18-20020a17090b0a1200b001cd4989ff3fsm1907047pjb.6.2022.05.13.11.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:17:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v4  0/3] Implement Sstc extension 
Date: Fri, 13 May 2022 11:17:45 -0700
Message-Id: <20220513181748.990645-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Fri, 13 May 2022 18:17:56 -0000

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
on top of upstream commit (faee5441a038).

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v4

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches. It does require the mcountinhibit support patch from PMU series[3]
or dummy one from Anup's series [4]. Otherwise, OpenSBI doesn't detect v1.12
priv version.

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
[2] https://github.com/atishp04/linux/tree/sstc_v3
[3] https://github.com/atishp04/qemu/tree/riscv_pmu_v7
[4] https://www.mail-archive.com/qemu-devel@nongnu.org/msg885157.html

Atish Patra (3):
hw/intc: Move mtimer/mtimecmp to aclint
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c         |  41 +++++--
hw/timer/ibex_timer.c          |  18 ++-
include/hw/intc/riscv_aclint.h |   2 +
include/hw/timer/ibex_timer.h  |   2 +
target/riscv/cpu.c             |   8 ++
target/riscv/cpu.h             |  15 ++-
target/riscv/cpu_bits.h        |   8 ++
target/riscv/cpu_helper.c      |  11 +-
target/riscv/csr.c             | 200 +++++++++++++++++++++++++++++++++
target/riscv/machine.c         |   9 +-
target/riscv/meson.build       |   3 +-
target/riscv/time_helper.c     | 114 +++++++++++++++++++
target/riscv/time_helper.h     |  30 +++++
13 files changed, 429 insertions(+), 32 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1



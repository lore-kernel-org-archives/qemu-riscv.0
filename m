Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wYY-0007Z5-P0
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:01:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYX-0007Yr-5E; Tue, 04 Jan 2022 22:01:41 -0500
Received: from [2607:f8b0:4864:20::532] (port=45760
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYV-0007OW-G4; Tue, 04 Jan 2022 22:01:40 -0500
Received: by mail-pg1-x532.google.com with SMTP id f5so4954845pgk.12;
 Tue, 04 Jan 2022 19:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bwwm7MMG2W9lViBn22omkQyDlbrVWbdFwAfuyNMQXbA=;
 b=CIiA6Ty2rljP/DXQSKhEe+j5jmN2G5tlb0cf6zIO577jfN69SvEJyoUt10dCp3xAqz
 BFHDUBs8F/BMAJ4zhOY+ZJQAD/1QhHQ/v10s5gvmeubDp3VivP2aPPJPHxX0FSHW3s5L
 iwF4AvUveC05LaKbqDzNeiGRiCa5tPvfdFvKyfY4Bvfy3riSquOqns/Rh9U2UX6joAuF
 3NOQ/+GXk0YM8G4xvUboXQUZT6BRSjPynrWlul+4TSUZztIrmhCjmCB/1SmXf6dOT3h9
 A1WqHPcHfWzB1JsO9BX0NeIqVhiOFfR/4yICXeRIf3JE89hnDAZtZk6Fspl0GeW9BTix
 s/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bwwm7MMG2W9lViBn22omkQyDlbrVWbdFwAfuyNMQXbA=;
 b=DDwW75OACpW2qIrtU3NLLiDvH9yX4oRRLGJ3jz+i6RBBJHEpJ1hL3xVDllL6QMzHs+
 OB+luLZEI6lbV5FwHX5ZZXtZOgoBgijf1mFYkCN0lEQfK3v8J7D3a1eKJ3vL8hCtzxO4
 G9m04OeAbDqxHPdBOULq5V5OZlz2VR0YcSJPIDlKzG+nIpaaJ2n6MzugGos5mE9O1t3Z
 cFdrVIr2etBytmfKJ7+on0Iv5SxJazbu3zD+M42Y/WryhmkEDwmfnONLKBp4Pwj4Z15D
 i3czaY4EWNMEqd4vSA0ia5Ec8tf8QkTKeINkHq1r1bm3F+iP2/lso5JisHW7F8YQ14H7
 cXDw==
X-Gm-Message-State: AOAM532xXa49kiZbO/wMvoIZNkQK32Q8eT4MPMXUsC+8xP8UqWCPcTJJ
 GJ/CKjN54JH2WFd3/U72D3A=
X-Google-Smtp-Source: ABdhPJyqaetU3BlLxAK2h/0uH5eb1/HzI9MTZ3jiBZn8TSbNDVqY0QDL8Y8PyyzW1LxeXXu4AU8YiA==
X-Received: by 2002:a62:78d3:0:b0:4ba:7141:83e9 with SMTP id
 t202-20020a6278d3000000b004ba714183e9mr53460961pfc.83.1641351697217; 
 Tue, 04 Jan 2022 19:01:37 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id nu14sm23011pjb.17.2022.01.04.19.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:01:36 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 0/7] target/riscv: Initial support for native debug feature
 via M-mode CSRs
Date: Wed,  5 Jan 2022 11:01:19 +0800
Message-Id: <20220105030126.778503-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 03:01:41 -0000


This adds initial support for the native debug via the Trigger Module,
as defined in the RISC-V Debug Specification [1].

Only "Address / Data Match" trigger (type 2) is implemented as of now,
which is mainly used for hardware breakpoint and watchpoint. The number
of type 2 triggers implemented is 2, which is the number that we can
find in the SiFive U54/U74 cores.

[1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf

Changes in v3:
- drop riscv_trigger_init(), which will be moved to patch #5
- add riscv_trigger_init(), moved from patch #1 to this patch
- enable debug feature by default for all CPUs

Changes in v2:
- new patch: add debug state description
- use 0 instead of GETPC()
- change the config option to 'disabled' by default

Bin Meng (7):
  target/riscv: Add initial support for native debug
  target/riscv: machine: Add debug state description
  target/riscv: debug: Implement debug related TCGCPUOps
  target/riscv: cpu: Add a config option for native debug
  target/riscv: csr: Hook debug CSR read/write
  target/riscv: cpu: Enable native debug feature
  hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()

 include/hw/core/tcg-cpu-ops.h |   1 +
 target/riscv/cpu.h            |   7 +
 target/riscv/debug.h          | 114 +++++++++
 target/riscv/cpu.c            |  14 ++
 target/riscv/csr.c            |  57 +++++
 target/riscv/debug.c          | 441 ++++++++++++++++++++++++++++++++++
 target/riscv/machine.c        |  33 +++
 target/riscv/meson.build      |   1 +
 8 files changed, 668 insertions(+)
 create mode 100644 target/riscv/debug.h
 create mode 100644 target/riscv/debug.c

-- 
2.25.1



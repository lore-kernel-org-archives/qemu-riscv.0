Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wfY-0006zK-UP
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:08:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfX-0006wR-SS; Tue, 04 Jan 2022 22:08:55 -0500
Received: from [2607:f8b0:4864:20::1032] (port=37734
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfV-0001w8-85; Tue, 04 Jan 2022 22:08:55 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so1989183pjj.2; 
 Tue, 04 Jan 2022 19:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6V3xBbUXu97kY2IqEv6ttjjQLe4n266tAoPJgk+b2Ug=;
 b=cW7vg0Q9DrBpZ1eLHK/sND1pUs9OE6VwnULLAOU2Gyx/RjmunyvXYxgoRH41XPqppc
 z0QbVTloYHDcQpafQb3VHQumQKyTWnfhqwLDEXAyYFcGyOLyEVWxqUurdq5gcqbykvo9
 dvyGxTsKgfmaF9a+D/sQdoI2z4UG52kanG2LDrQyhpvmC8pbnbOyi9GxLcdY+S4Z+1Kq
 s6h5NcB0VnOdby0V41uuDWWjPE7yzDNp7nv+g9EBj5d5aTA3zFYuGuZ1QxenQJNGFtij
 LHOPfq6dTbLcrI0DBTl1auizhNP1dIgTET03PfR2UHRe+GCMLRpyAru1yPXPygZqyBk0
 CXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6V3xBbUXu97kY2IqEv6ttjjQLe4n266tAoPJgk+b2Ug=;
 b=0XVjvAfMBQPvlpUaCZtaxrxlJTVNXMJUVo3rr/ZkFxvpdtTPLjeC1l0Iw0MrO+/HoD
 LMd4Y9w8H3IVbC8HJqIKKNIns26PP8BrC7DmW0ht8kq01sJX8BBvHcCRmj0u+LQfcz6o
 opGv5QnoP44n9qLadwqejJI7h04zbSJKH04GGqBPyrmYwmhQlffe+VLytL6xdPxVQ4x/
 zZ1oNpZgV9uynoXEEMO/szrdWx5q9OZRb+TNvYozFP/6oGLfalkyrxNq7OxhFjs0Jjbq
 yS+iyxOcCiunCRBvFa8uaa0X9ybP3pBD8NLvNWuQ+02yKPkdhJkjmy0v1WrWANGb8Lys
 QXSA==
X-Gm-Message-State: AOAM531a3UdIHrtvPBQaIZ1t0bOnUw2rlC2DN6zixLckGkyqhi364YHF
 cOl857XLm9cTMfQdl0axmHk=
X-Google-Smtp-Source: ABdhPJxpRyGNTT5yDQL1iGzwQwNUXytcFjpcvrs75ch6/rhsZSKLXUBVdvTCyoIOPoA/LWTuYSI3og==
X-Received: by 2002:a17:90b:3b49:: with SMTP id
 ot9mr1755161pjb.110.1641352129335; 
 Tue, 04 Jan 2022 19:08:49 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id t191sm36206889pgd.3.2022.01.04.19.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:08:49 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [RESEND PATCH v3 0/7] target/riscv: Initial support for native debug
 feature via M-mode CSRs
Date: Wed,  5 Jan 2022 11:08:37 +0800
Message-Id: <20220105030844.780642-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 03:08:56 -0000


This adds initial support for the native debug via the Trigger Module,
as defined in the RISC-V Debug Specification [1].

Only "Address / Data Match" trigger (type 2) is implemented as of now,
which is mainly used for hardware breakpoint and watchpoint. The number
of type 2 triggers implemented is 2, which is the number that we can
find in the SiFive U54/U74 cores.

[1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf

- RESEND to correct the email address


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



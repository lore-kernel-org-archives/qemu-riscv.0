Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wdJ-0004Qf-Rk
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:06:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wdA-0004O3-1u; Tue, 04 Jan 2022 22:06:29 -0500
Received: from [2607:f8b0:4864:20::42c] (port=44620
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wd6-0000VZ-Ak; Tue, 04 Jan 2022 22:06:25 -0500
Received: by mail-pf1-x42c.google.com with SMTP id t187so20388046pfb.11;
 Tue, 04 Jan 2022 19:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6V3xBbUXu97kY2IqEv6ttjjQLe4n266tAoPJgk+b2Ug=;
 b=o+IWrUjzMAismXsJQFXQ8dTjYN9BeGbH8zAHPFfO2wpznSu2IY8Py4hj0pzwX613aQ
 XLKpzsYvWdOV92t5x/0M2FnoQofIZrYWtFRrkP+XRc9vnGoeT5e+z55LVtBcSPGuuh9q
 vakbbDXiCh06ARqh1VI9YXMkD7lNBeBZzQcrmDx/kjwPCq1vsRXzMz4KsJ8QJc3Gs0+d
 ejkh2u2J2k3Yc9Dul6L918Ll5PWlFEYBLzgYTKm24SJdUvzxDtq7F8Nd7ilFFFWQlE2W
 7j8jBvVnKBd/WQwTDlbkWdanFYEu/SlbRdI4Ar8EVs8Dp8gRhNGsKf3Am9tXSY/mG5B6
 w/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6V3xBbUXu97kY2IqEv6ttjjQLe4n266tAoPJgk+b2Ug=;
 b=ZpglDsoWJR+LfVLsaKVwr1c1ObLantMTK7UJlP1Ar86IiX76+6loDdZZOsE09982if
 VjKfeddck8cZiC5qYn/mZlJbkUoWrNvq8EMRMrlhsXuBzIpBSRzMfq5kx2/ZB9KRYf9A
 vRYMaOEmyfVuNwVvOPyvVN3H1OTMlYYRncxkKVU7mujHPBbjy/MdAtlYxclC8elJk4h8
 koqFjff+n7hdDTgFlNHNznSeDdyXBiiffkzK1CK5Sr5QBoQCCWw1lRzKhFN51ql2P8i7
 ztWsv3Tb0Q4P00u+R3pnvn/dFeV/h4ZqN/Dcyz/A5eCAMjv3+i9FH0DrRZdT5xlHI6ci
 7GCg==
X-Gm-Message-State: AOAM532ZZl1/X/J/RRpdDAztZHvQ+ocAc4GD/Gx7Ehiohb9XvP6UqBAm
 odXm4f1BDaz7WQ9T1WFvwwrfuppJcazsog==
X-Google-Smtp-Source: ABdhPJyBWSqrsB6B1JfVDoKwSFydU+u9Vka476wckcT9iQwaejjKnvAxTEgliqiTqOjw12Lyf7iLuA==
X-Received: by 2002:a63:3ece:: with SMTP id
 l197mr30759907pga.371.1641351982765; 
 Tue, 04 Jan 2022 19:06:22 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id mh3sm657281pjb.26.2022.01.04.19.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:06:22 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [RESEND PATCH v3 0/7] target/riscv: Initial support for native debug
 feature via M-mode CSRs
Date: Wed,  5 Jan 2022 11:06:11 +0800
Message-Id: <20220105030618.779257-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 03:06:32 -0000


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



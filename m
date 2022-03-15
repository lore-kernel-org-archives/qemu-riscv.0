Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU15n-0007NI-00
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 02:55:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU15l-0007Gt-9b; Tue, 15 Mar 2022 02:55:37 -0400
Received: from [2607:f8b0:4864:20::102f] (port=50732
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU15j-0001qX-Fp; Tue, 15 Mar 2022 02:55:36 -0400
Received: by mail-pj1-x102f.google.com with SMTP id m22so17023878pja.0;
 Mon, 14 Mar 2022 23:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QINsg88gur5+u8KCOb6QGNv//zb924eXdW/zk8Yg7yk=;
 b=CeSiQ61PSVVBALbPFcFX9umdJL7Q56Eyz8/gItda8vpFQdLmllVZBudwakT6EDapYL
 yIeq9bZPE0WTlAB4zWjdnfm0lUrsCPXVuuDzOXC0ByurtVkK8vcwxTeGLFfhytWv+mjT
 IVg206EAuY58tGgFby0Ebc2Iwblw6xIlMdpizas+VzVLhu/3OleCoU0JL10qgSUAoJ3S
 cZdMsJUD21UMXuqL8Fh/HhjUE1oynzemhHEefkBpmA3bsRxZWg31lddtuLgCYz7UinM4
 wxkF3wl0767BWDKqNzJqpz4iyFYXT3z9dtyrmOw6LQsNdHrerVZ3BGwrLe426WkORjcR
 PTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QINsg88gur5+u8KCOb6QGNv//zb924eXdW/zk8Yg7yk=;
 b=hVewO/PooBVMcnywvK0ju2GCQ1b5crpHLbLwfudJV9TJx4nf/2OiFyuh37Ohlnk3Ll
 bP6ns5ngYK92gwH5bddPeLCxuqCHMXp61J0kzWscGktm9FZZEN+vd3Ii/A8o+YMg5GbD
 eiwVzsLbHLi6d+xkWf0hEr8WS1Mvc9PZDygp/+irh/I6YBOWI9p4WFM3PDDJwub0zp03
 viMZI46aYGFkhK0Fk+mMa4kYo7T37M3K7cuDSexR7XcGEz4IUdf3VSIV2pIg2rlli1TQ
 m+lBXJ5hqX45q4GlKxO8wdaRYH8BXobt8S8dNf4Poj1J6DOrdhiAZvFRcKZXiQiGDfbV
 srwA==
X-Gm-Message-State: AOAM530Dc9AppunR9z5NQ0TmFY3CWJOBxvWE/HG7Gq+7x+6XX8oU3aB/
 iy+TE1j2YGRsDTRkdTEyuAg=
X-Google-Smtp-Source: ABdhPJxMvd30uo5JoUxyamF1J6yuJoN+JU94NjnuGrPHGymk35EBJKOkATOLUlXWdWe1jEdFxFcZXg==
X-Received: by 2002:a17:902:e74f:b0:151:c20b:5f39 with SMTP id
 p15-20020a170902e74f00b00151c20b5f39mr26285808plf.43.1647327333596; 
 Mon, 14 Mar 2022 23:55:33 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm22970500pfv.69.2022.03.14.23.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 23:55:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 0/7] target/riscv: Initial support for the Sdtrig extension
 via M-mode CSRs
Date: Tue, 15 Mar 2022 14:55:22 +0800
Message-Id: <20220315065529.62198-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 06:55:37 -0000


This adds initial support for the Sdtrig extension via the Trigger Module,
as defined in the RISC-V Debug Specification [1].

Only "Address / Data Match" trigger (type 2) is implemented as of now,
which is mainly used for hardware breakpoint and watchpoint. The number
of type 2 triggers implemented is 2, which is the number that we can
find in the SiFive U54/U74 cores.

[1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf

Changes in v4:
- mention Sdtrig extension in the commit
- rename 'struct trigger_type2_t' to 'type2_trigger_t'
- move riscv_trigger_init() call to riscv_cpu_reset()

Changes in v3:
- drop riscv_trigger_init(), which will be moved to patch #5
- add riscv_trigger_init(), moved from patch #1 to this patch
- enable debug feature by default for all CPUs

Changes in v2:
- new patch: add debug state description
- use 0 instead of GETPC()
- change the config option to 'disabled' by default

Bin Meng (7):
  target/riscv: Add initial support for the Sdtrig extension
  target/riscv: machine: Add debug state description
  target/riscv: debug: Implement debug related TCGCPUOps
  target/riscv: cpu: Add a config option for native debug
  target/riscv: csr: Hook debug CSR read/write
  target/riscv: cpu: Enable native debug feature
  hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()

 include/hw/core/tcg-cpu-ops.h |   1 +
 target/riscv/cpu.h            |   9 +-
 target/riscv/debug.h          | 114 +++++++++
 target/riscv/cpu.c            |  12 +
 target/riscv/csr.c            |  57 +++++
 target/riscv/debug.c          | 441 ++++++++++++++++++++++++++++++++++
 target/riscv/machine.c        |  32 +++
 target/riscv/meson.build      |   1 +
 8 files changed, 666 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/debug.h
 create mode 100644 target/riscv/debug.c

-- 
2.25.1



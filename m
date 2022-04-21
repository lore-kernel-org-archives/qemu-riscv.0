Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhKlK-0004dU-8p
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 20:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlJ-0004dH-Fa; Wed, 20 Apr 2022 20:33:33 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlH-0008KK-Rn; Wed, 20 Apr 2022 20:33:33 -0400
Received: by mail-pg1-x530.google.com with SMTP id h5so3237112pgc.7;
 Wed, 20 Apr 2022 17:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VWvmhJZLYPmyvDlTwRBK0lLIOD4RCxjrD5o2pboJAOw=;
 b=bxhsZbx4jQdAPNxwiKIMOa5DK97QanFCpksEoxlCY/ZWmks5e9QCXTA4yq/08daYhJ
 tcgltQ1HsGyL1CrdoZSOJMMo9y3C75Yy5cQecl+SaNPeKaehMxDbGbcpztzy7+IyyXTz
 +5yDgchohRAYzZmblGRe5Xvxqd1hvvnldlyR7+ZjZPB8VGSf06WH/tF2m8CtVD7IpxB6
 tXO0ZmhWQUq2BscPHjKqWK8I6O3GT0mAhdfBlxH6NayAMy1G9UPES5rmkNW1E3Bmbo0p
 j/7SBK3L4aceOdwTcpKJIY6di3sCH+jLXMOTmxqjvz/4kMRiNNTWIvUipbVsNmAGa7iV
 PJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VWvmhJZLYPmyvDlTwRBK0lLIOD4RCxjrD5o2pboJAOw=;
 b=07P09YqVrbKmD31yUkXHs1t0udq8rJv+noD1lKdR6pLhm9fo0A4Z1rkjjSZYd3yxVl
 YOqfMbLo3NGbLZffzGe6s0j0jH/CJye22AAPKATszk5AWBRia5Y5RZIzGUWhdT5DfkFP
 02wxCJu/zs+0VpxEIqnY5AJGDl818rb7kI6SoZ5ShuFz2f+p9/RyZM3A7s3E8KIhupSk
 j6zC2jSzD34rehapwoDgG3Ac5dof0c9eBHTSDR7gJrUdr5WpVOVujfBKb+5jY+hL/5Uh
 stdZIXkVbbE+r//RzLN9/sk1VxLp77uWDU27yQVzSgh1G8XfI5vBeq0mrUmk8Kez52zc
 KGAQ==
X-Gm-Message-State: AOAM531VDURPiZss2z8u1mwDteWTaRKqy4plXmBbarXQRqvNNlaCwB2c
 nWMXCm6QCEyTXzTbSo40cFw=
X-Google-Smtp-Source: ABdhPJxsDub1V2wCl72byOzfZ3V5wvEufxVQeLs98f6VxLut2fqkP6d4haQAjk5xL/2+nDR8TskH4Q==
X-Received: by 2002:a63:a902:0:b0:398:cdd3:f85e with SMTP id
 u2-20020a63a902000000b00398cdd3f85emr21685901pge.122.1650501210061; 
 Wed, 20 Apr 2022 17:33:30 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm22981969pfh.177.2022.04.20.17.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 17:33:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 0/6] target/riscv: Initial support for the Sdtrig extension
 via M-mode CSRs
Date: Thu, 21 Apr 2022 08:33:18 +0800
Message-Id: <20220421003324.1134983-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Apr 2022 00:33:33 -0000


This adds initial support for the Sdtrig extension via the Trigger Module,
as defined in the RISC-V Debug Specification [1].

Only "Address / Data Match" trigger (type 2) is implemented as of now,
which is mainly used for hardware breakpoint and watchpoint. The number
of type 2 triggers implemented is 2, which is the number that we can
find in the SiFive U54/U74 cores.

[1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf

Changes in v5:
- rebase against riscv-to-apply.next
- drop patch 1 in v4 which is already in riscv-to-apply.next
- adjust patch order to let patch 2 in v4 come later

Changes in v4:
- move riscv_trigger_init() call to riscv_cpu_reset()

Changes in v3:
- add riscv_trigger_init(), moved from patch #1 to this patch
- enable debug feature by default for all CPUs

Changes in v2:
- use 0 instead of GETPC()
- change the config option to 'disabled' by default
- new patch: add debug state description

Bin Meng (6):
  target/riscv: debug: Implement debug related TCGCPUOps
  target/riscv: cpu: Add a config option for native debug
  target/riscv: csr: Hook debug CSR read/write
  target/riscv: machine: Add debug state description
  target/riscv: cpu: Enable native debug feature
  hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()

 include/hw/core/tcg-cpu-ops.h |   1 +
 target/riscv/cpu.h            |   4 +-
 target/riscv/debug.h          |   6 ++
 target/riscv/cpu.c            |  12 ++++
 target/riscv/csr.c            |  57 +++++++++++++++++++
 target/riscv/debug.c          | 102 ++++++++++++++++++++++++++++++++++
 target/riscv/machine.c        |  32 +++++++++++
 7 files changed, 213 insertions(+), 1 deletion(-)

-- 
2.25.1



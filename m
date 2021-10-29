Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgTlN-0001kw-It
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 11:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlM-0001kk-5v; Fri, 29 Oct 2021 11:25:48 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlK-00075u-El; Fri, 29 Oct 2021 11:25:47 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 83so10204452pgc.8;
 Fri, 29 Oct 2021 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=au/pD7ep18dUvJZTW0XkqqNT5dJ0nlZW3f73WpmgjsE=;
 b=gfjbgrJBdfElzjDplNzynfUyLyucxKUpF+aOfUibYJWtcVmIVGjuaSQ+5fEqRXIgcw
 H2wSgvbVy0jFCDqWl6+XZ+HzBm/rII08aMFVCwRmJsy0KuUBjM30uyGE+dTlbgSfUzth
 r9iaflY4HW3SX7sZRb4+7TWjfg3SogMmIu+gF/OMuNJaDr6n50+A3Isbs4DEbCvnGXeG
 kzq/6So6/pmHFg6y08E9OphgxjW/f0xoyqs9FljsoY24o4MNZXwzk9g0Ckz2FzWuOVCL
 QCns/JX/PrWR1IwmZHc+LyW0uXvGFULHcMGmqH29NlNQa/TeaGJ8dedftgZ4qXGX92wg
 oZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=au/pD7ep18dUvJZTW0XkqqNT5dJ0nlZW3f73WpmgjsE=;
 b=KOVWO71yTzK6ZlwQHzq8ZMA61hKYPztEhz2CmiQUgUYPLe0GHOLOt+3GxvvDP/k6Fq
 Ijyg2T+Kpo3K0N57KVeHyHiBw2/qeCmiOKvhSojOGzOiuqzonb2scnvYD8zRxdtC42YJ
 2Ezj3iUBOwK4XOSzSi0h8M1jzn5y56cwKsJf0M3eC3NeDvRIuwh1n8s4ykX4QAUHVpQZ
 r8lEsYEHkGLBgSv4FTUp6MIr1QGYu89UvhqY+vkXXRhlOtDHgdD6qffTKGNG16Mbl0kZ
 qXq5yP1fZvXiyra6TxcwYqXRMLf6truLbXRvG+WXb6L77Cr38P4P55hkESardDvwhG/7
 R2QA==
X-Gm-Message-State: AOAM532vcTPwlUdgwmU6yRcTPOtMbAT58ZN4GB63NY5jPPaRjiLvMnUg
 SjU+0rVp8eLIcOFOltBiFzr7zbeWf68=
X-Google-Smtp-Source: ABdhPJzEUwtcTvvS+JnJId4U9+VKzphXwhUc0BUBsJ1XnoB3wHUTJQlcfVSG1ywuDRib3r84Jgt+jQ==
X-Received: by 2002:a62:ab14:0:b0:47b:e126:ea50 with SMTP id
 p20-20020a62ab14000000b0047be126ea50mr11532528pff.58.1635521143692; 
 Fri, 29 Oct 2021 08:25:43 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id q12sm6645790pfk.65.2021.10.29.08.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 08:25:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 0/5] target/riscv: Initial support for native debug feature
 via M-mode CSRs
Date: Fri, 29 Oct 2021 23:25:30 +0800
Message-Id: <20211029152535.2055096-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Oct 2021 15:25:48 -0000


This adds initial support for the native debug via the Trigger Module,
as defined in the RISC-V Debug Specification [1].

Only "Address / Data Match" trigger (type 2) is implemented as of now,
which is mainly used for hardware breakpoint and watchpoint. The number
of type 2 triggers implemented is 2, which is the number that we can
find in the SiFive U54/U74 cores.

[1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf


Bin Meng (5):
  target/riscv: Add initial support for native debug
  target/riscv: debug: Implement debug related TCGCPUOps
  target/riscv: Add a config option for native debug
  target/riscv: csr: Hook debug CSR read/write
  hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()

 include/hw/core/tcg-cpu-ops.h |   1 +
 target/riscv/cpu.h            |   7 +
 target/riscv/debug.h          | 114 +++++++++
 target/riscv/cpu.c            |  14 ++
 target/riscv/csr.c            |  57 +++++
 target/riscv/debug.c          | 439 ++++++++++++++++++++++++++++++++++
 target/riscv/meson.build      |   1 +
 7 files changed, 633 insertions(+)
 create mode 100644 target/riscv/debug.h
 create mode 100644 target/riscv/debug.c

-- 
2.25.1



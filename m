Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkHP1-0002LR-40
	for mharc-qemu-riscv@gnu.org; Thu, 28 Apr 2022 23:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkHOy-0002Kf-Na
 for qemu-riscv@nongnu.org; Thu, 28 Apr 2022 23:34:41 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkHOw-0002QN-TC
 for qemu-riscv@nongnu.org; Thu, 28 Apr 2022 23:34:40 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso6180400pjj.2
 for <qemu-riscv@nongnu.org>; Thu, 28 Apr 2022 20:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cIrGlB9niGKL77EQUeBbbp25xDSsQOQZHsXtC1TsxRU=;
 b=WXE39xFS0nKrqCZrZI2K9Ea6z6Vxc1ct1R8j0i+V4LpQaBWPU3zr6sU78v/bn92lML
 9gWSIzd3iCJV+mtPuZaJxR/Zux6HyuUfq/lmIPSE01OWNpT2owhXWolSYU4GErFvJWrr
 3tnQR0b0z2kyrwEBqigol01A4oJ9eNSLcB6PV9UUpyRtMc2K3FYWLgls/ofqLZQ/yKI6
 N1a1TYsOBeJ+Hin7hVaYCv8HKMkFvfvb8Aja1Mxv61a5Pucq85Z4hykFpImowfXplN9g
 0CAZSDChqzEuGzJvRZNxWS6PwZknUNT46yK9FDgXoJq087NYw4CaJw6R4VuXmoNQ/fm4
 1lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cIrGlB9niGKL77EQUeBbbp25xDSsQOQZHsXtC1TsxRU=;
 b=N6FfmOLngj8JSiKotqibh5JMlhqrXs2T7X8ugBPTvh7BM9ArTJdEghGne/0vkhbfFz
 ncHkj332n3FYxziewUkFKxayaaAKWMa0nYWUuMjEzTPaPoG25nVW/UviLBCsLQJdEG4C
 ASYE33wjbFHs90giOWx3HNqBKEMUzfYN6/j8GN2bxTXCSFQL/sv43ZbZC/MI0ZXLkskN
 VUsPO/fnf/liQpBmGu6IH5nMniHh8bX1C7WoYqK9YvRMX7EhxD1bm3LYVtmqeN6qFnko
 +qDt/tjZ7ucIqENd4AtrDi/gKF2YyxFqqwt65kBArS6w5Js0EueAn7Zvl/Old1t6niCz
 ijvw==
X-Gm-Message-State: AOAM530oZFfiZKsLu4QqYgdgaN9+BfP735RguER7YFJp6Qm/96fMLWz6
 XmF62t9IuvYbBISz4GIeK/SNuw==
X-Google-Smtp-Source: ABdhPJwsSTrTEGvxos4zET5J6Iplzv9WRz9ZKI0o/RRt5dAKqczJKXQOAG6QrHFq+a47dFbUE2THDA==
X-Received: by 2002:a17:902:ce86:b0:15c:3807:e66 with SMTP id
 f6-20020a170902ce8600b0015c38070e66mr23348662plg.125.1651203276558; 
 Thu, 28 Apr 2022 20:34:36 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.97.237])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a071600b001d9781de67fsm8195568pjl.31.2022.04.28.20.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 20:34:36 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/4] QEMU RISC-V nested virtualization fixes
Date: Fri, 29 Apr 2022 09:04:05 +0530
Message-Id: <20220429033409.258707-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 29 Apr 2022 03:34:41 -0000

This series does fixes and improvements to have nested virtualization
on QEMU RISC-V. The first two patches are fixes whereas the second
two patches make nested virtualization performance better on for
QEMU RISC-V.

These patches can also be found in riscv_nested_fixes_v1 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

Anup Patel (4):
  target/riscv: Fix csr number based privilege checking
  target/riscv: Fix hstatus.GVA bit setting for traps taken from HS-mode
  target/riscv: Set [m|s]tval for both illegal and virtual instruction
    traps
  target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()

 target/riscv/cpu.c        |   2 +
 target/riscv/cpu.h        |   8 +-
 target/riscv/cpu_helper.c | 170 ++++++++++++++++++++++++++++++++++++--
 target/riscv/csr.c        |   8 +-
 target/riscv/instmap.h    |  41 +++++++++
 target/riscv/translate.c  |  17 +++-
 6 files changed, 234 insertions(+), 12 deletions(-)

-- 
2.34.1



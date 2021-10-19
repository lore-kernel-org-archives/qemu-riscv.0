Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcqyt-0004pj-T2
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 11:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyr-0004lk-Vb
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:46 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:42759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyn-0007SX-V6
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:45 -0400
Received: by mail-pf1-x42d.google.com with SMTP id m14so212637pfc.9
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRdhBqAZVe2CoKMEXUJmw7YJyaxSB5A7JVaWtsnB0O4=;
 b=g9yhLzFQ80njbIvuoAstyyypG8TFRaE+yv1ZS31+k8lutueKpsa9YviQKwcJOv7hcM
 BxwXWuClSBAuqjHC5bO1nrL/N47HbvZN6JN1ZKsJ9Kz7uxbfaZQ2yLA2rkH/fz2bJC25
 v6PIQe7beX2S6nWwrVMo7dylwdhsEoL89yR5qXs16B/w+x8zWkzuIOnegPBwSSJ9Wqok
 qyqpC+8hJ3GuBMnty5LbS22xAMfc/BdiUEa/yPZl4SGGx6HxqtopgEGuubjE+ResfCOj
 ikygYaq8DE9Z3+mLnOTF7A1sadk5cviamvA2u8EzmhCldmz/J92mtsSvTtDER/T/M5xP
 dzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRdhBqAZVe2CoKMEXUJmw7YJyaxSB5A7JVaWtsnB0O4=;
 b=7WWwFqfb/aWEkV4vHN6pIYyccPG1IBsiAH7dzjc87k8NY+U4lGFT7ltI5xhnrTZifO
 b8n3h+Wy7kTBpLdREwbM13TNPRyZOi2Rd1TdQ2hTa0KfOD+2TIue0WvavntJE72xVRNK
 WM0riw8q5exEPdGWthrVD2CAZXsxzX4yXsIasSieTfQQUqOwGZk5APJs+p+c7jAJHXs2
 Etgj/xUMM6y5S6JM9KSnzuL3CYzfKM/n9iXtGEtnj4ia0RQxprqNuEkS+9h9XHr8R0ER
 WVZWrN1VFRk0CgSbEpU56f6FyDxXQk/sRpNobRX4gwfBdrxm5sbeiU6nHCnDw2ODSW4N
 EdgA==
X-Gm-Message-State: AOAM532xXoCGmJDO1lzWEtAsTNKCIXz6+JHHNPDUieokCokR7IAQ/W5M
 PMo6T4PfBs5PtFVFvIb6hj0J/A==
X-Google-Smtp-Source: ABdhPJzTEPfXKHDq1vLYfMcaYGe1z8P3z3tUkEcYCwLmGZjtCQAe7nDCmpp/pCvOEkdANwByq2AwMw==
X-Received: by 2002:a65:62cb:: with SMTP id m11mr29262025pgv.425.1634657079672; 
 Tue, 19 Oct 2021 08:24:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v5 00/16] target/riscv: Rationalize XLEN and operand length
Date: Tue, 19 Oct 2021 08:24:22 -0700
Message-Id: <20211019152438.269077-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 19 Oct 2021 15:24:46 -0000

This is a partial patch set attempting to set things in the
right direction for both the UXL and RV128 patch sets.


r~


Changes for v5:
  * Fix cpu_dump, which asserted for -accel qtest.
    Instead of filtering CSRs explicitly in cpu_dump,
    let the riscv_csr_operations predicate do the job.
    This means we won't dump S-mode registers when RVS
    is not enabled, much like we currently filter on RVH.

Changes for v4:
  * Use riscv_csrrw_debug for cpu_dump.
    This fixes the issue that Alistair pointed out wrt the
    MSTATUS.SD bit not being correct in the dump; note that
    gdbstub already uses riscv_csrrw_debug, and so did not
    have a problem.
  * Align the registers in cpu_dump.

Changes for v3:
  * Fix CONFIG_ typo.
  * Fix ctzw typo.
  * Mark get_xlen unused (clang werror)
  * Compute MSTATUS_SD on demand.

Changes for v2:
  * Set mxl/sxl/uxl at reset.
  * Set sxl/uxl in write_mstatus.



Richard Henderson (16):
  target/riscv: Move cpu_get_tb_cpu_state out of line
  target/riscv: Create RISCVMXL enumeration
  target/riscv: Split misa.mxl and misa.ext
  target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl
  target/riscv: Add MXL/SXL/UXL to TB_FLAGS
  target/riscv: Use REQUIRE_64BIT in amo_check64
  target/riscv: Properly check SEW in amo_op
  target/riscv: Replace is_32bit with get_xl/get_xlen
  target/riscv: Replace DisasContext.w with DisasContext.ol
  target/riscv: Use gen_arith_per_ol for RVM
  target/riscv: Adjust trans_rev8_32 for riscv64
  target/riscv: Use gen_unary_per_ol for RVB
  target/riscv: Use gen_shift*_per_ol for RVB, RVI
  target/riscv: Align gprs and fprs in cpu_dump
  target/riscv: Use riscv_csrrw_debug for cpu_dump
  target/riscv: Compute mstatus.sd on demand

 target/riscv/cpu.h                      |  73 +++------
 target/riscv/cpu_bits.h                 |   8 +-
 hw/riscv/boot.c                         |   2 +-
 linux-user/elfload.c                    |   2 +-
 linux-user/riscv/cpu_loop.c             |   2 +-
 semihosting/arm-compat-semi.c           |   2 +-
 target/riscv/cpu.c                      | 203 ++++++++++++++----------
 target/riscv/cpu_helper.c               |  92 ++++++++++-
 target/riscv/csr.c                      | 104 +++++++-----
 target/riscv/gdbstub.c                  |  10 +-
 target/riscv/machine.c                  |  10 +-
 target/riscv/monitor.c                  |   4 +-
 target/riscv/translate.c                | 174 +++++++++++++++-----
 target/riscv/insn_trans/trans_rvb.c.inc | 140 ++++++++--------
 target/riscv/insn_trans/trans_rvi.c.inc |  44 ++---
 target/riscv/insn_trans/trans_rvm.c.inc |  36 ++++-
 target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
 17 files changed, 581 insertions(+), 354 deletions(-)

-- 
2.25.1



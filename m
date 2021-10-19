Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mccZD-0004fb-AZ
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZB-0004cp-Eh
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZ5-0001br-74
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:13 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so655515pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 17:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9F9tI/rqlGGF57t6AqXKgYAHw97tLQc+VYqRavmhEc=;
 b=JEW0Dy4ndZ7HwEMq0EcEAjyA1aX9sVg1z5OMXLdulDqTyNbnR6mU5A7Q5gaabxC1gB
 j5W4TN6SBVh4piRbRmfIeTNOtL6RyFFudTD3Iye08R3cdOCbiERopSyEgPgKaeGj/pXI
 avVD6Uuy1wyi5H5NH/9LKb0UvOUsqmJemhPQtPatxA4+yDmoqHdUd9eM1LLyOlUXqvK5
 Kd6PLqvQDwXg/ZYxpuPaPKdXNx4v8JUNvDc202oixW+wddUZ2MYxwKlG4+M28yQ0CQdN
 2OaF6I38fj6OTygI89CdDywJ9MKZ2lNTsOP73opWxUSNVluRf9aNWU9zuzJIIjtKir2g
 5l7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9F9tI/rqlGGF57t6AqXKgYAHw97tLQc+VYqRavmhEc=;
 b=dN+/Ou4T9D2sDFL/1NXIkR+7MWat3MV8bhsf8PJUWqK/IKvyjFynTbn2Zj9XySjtLG
 EYJn6K3RKEl8aXCK5SykIT35gZgopK8ubjvpkUm6K0IQHRJUpsHeEP6n/m9m9JlpcRbm
 tuzo9Sa7lynGYutmgBRdWgzTrGMlE9ocbGQzNH5bSuM8coZfxDA/YFI087a4yOkYGsuY
 AneKV5TRab4SirbCdg+f09p6xbsIrb/rGCtPnj1GkOFxZG7ZNNoSArvEkxHdtRkqlDt+
 BwqEPhJaoMW6TszIjJfJ6wMiCYXRL2TQdxcD6m8E3kPQHZ0dpruUJidwLlvTHUpUnI5T
 uP1A==
X-Gm-Message-State: AOAM533BYlQ7tDLX9ayvdjCOoTErBBxX4tShbCvmjPJkKcWcM1rEQ7dE
 P+vOwFA7oS4ca2GC9SzWnMHCmA==
X-Google-Smtp-Source: ABdhPJxunxaqxuL+JigxudqI5GiCyazRp8mQJ6rTyT2cM5JxfRgOjeBZq1GGJnADOlb7aBZBsVF8rA==
X-Received: by 2002:a17:902:bb94:b0:13c:9113:5652 with SMTP id
 m20-20020a170902bb9400b0013c91135652mr30742474pls.70.1634601669531; 
 Mon, 18 Oct 2021 17:01:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v4 00/16] target/riscv: Rationalize XLEN and operand length
Date: Mon, 18 Oct 2021 17:00:52 -0700
Message-Id: <20211019000108.3678724-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 00:01:17 -0000

This is a partial patch set attempting to set things in the
right direction for both the UXL and RV128 patch sets.


r~


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

 target/riscv/cpu.h                      |  73 +++-----
 target/riscv/cpu_bits.h                 |   8 +-
 hw/riscv/boot.c                         |   2 +-
 linux-user/elfload.c                    |   2 +-
 linux-user/riscv/cpu_loop.c             |   2 +-
 semihosting/arm-compat-semi.c           |   2 +-
 target/riscv/cpu.c                      | 212 ++++++++++++++----------
 target/riscv/cpu_helper.c               |  92 +++++++++-
 target/riscv/csr.c                      | 104 +++++++-----
 target/riscv/gdbstub.c                  |  10 +-
 target/riscv/machine.c                  |  10 +-
 target/riscv/monitor.c                  |   4 +-
 target/riscv/translate.c                | 174 ++++++++++++++-----
 target/riscv/insn_trans/trans_rvb.c.inc | 140 +++++++++-------
 target/riscv/insn_trans/trans_rvi.c.inc |  44 ++---
 target/riscv/insn_trans/trans_rvm.c.inc |  36 +++-
 target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
 17 files changed, 590 insertions(+), 354 deletions(-)

-- 
2.25.1



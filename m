Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1malDU-0007NH-Tj
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 16:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDT-0007Md-Fl
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDQ-00081Q-Ln
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so3259247pjb.0
 for <qemu-riscv@nongnu.org>; Wed, 13 Oct 2021 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FODvjefSNBFscPUyN2SwQ93usEbfFVf6iJsmSDn2qww=;
 b=qYMEp7glPHMcbH+cO5RN4Y0F1ubmh1CpUZsHgTzt4pqYL/zstydUi7T/baT3cpEszt
 1jrC0kj6sfxWh/4A/KG7220TkamrqVzLiO9RHg+B6yW8Rn/DxBBjgCNfqqVsn0ghegG4
 RDGntfPootgDydYmTRZdjJC3nG2Ov/vpyInBZBD1C3vjVgCxFFR9a5dw4bmpgfx8UZG1
 686AWnzQIGkM8IdeoJ3shjl+9vZH8ChCT7ez3darOx2fnJjLVliLgC2Dop7iH3YNGoIE
 Vgi4hP7QeciirZPHWnJLv7wr+VZvgBpaWvXcNBoL66dSbYrTF+/8aazaEneyrZM0gZZ9
 6iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FODvjefSNBFscPUyN2SwQ93usEbfFVf6iJsmSDn2qww=;
 b=D5fYwtyJI/a0tUtYCJkQzaUO7AAKdSEu+R2jAgsdJR/MfYKzvplR+8mH0lc2FBn9HL
 0oArmMBefDFk0wcv54sBvnQC2glZn4gQP7ikfRvf/ObKjdshdljZsUCDVtNWVlfnGTBZ
 C6gJuUyRLiEg+Up3H+2NyK7Y2YWYT1sykXdOu9Pt/EsWrj3Vg9RQBQX0AYNIhjucO0bs
 AcgTxw7V/M/2BA5tTb/w2MWzQ4dRAmHFy0cXvwZj9ekzrupvmtqTvmLvYfgbO3rhbctB
 2UCB4eiRiNzO6XW4ig5KLi/GI9P4nPO8aMJ+FeMlBdECPFeX85Y9BD5ls2CM91Y6CLBW
 V9Yw==
X-Gm-Message-State: AOAM5325Xhl53nSEN26wDgwTwayq9F7vLWf0oY3X4PaHYZrZIGdZPJ6e
 L1HjxzCbIU+0pIiZp6YBXHEylg==
X-Google-Smtp-Source: ABdhPJwxivyNXff+mz/LqQTmDWekLIx44bHzD9/xljVXfbY3hyx8lx7k5guXNDenBwxXgOrk7K8o4A==
X-Received: by 2002:a17:90b:33c7:: with SMTP id
 lk7mr1718022pjb.172.1634158266397; 
 Wed, 13 Oct 2021 13:51:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 00/13] target/riscv: Rationalize XLEN and operand length
Date: Wed, 13 Oct 2021 13:50:51 -0700
Message-Id: <20211013205104.1031679-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Wed, 13 Oct 2021 20:51:11 -0000

This is a partial patch set attempting to set things in the
right direction for both the UXL and RV128 patch sets.

Changes for v2:
  * Set mxl/sxl/uxl at reset.
  * Set sxl/uxl in write_mstatus.


r~


Richard Henderson (13):
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

 target/riscv/cpu.h                      |  73 +++-------
 target/riscv/cpu_bits.h                 |   8 +-
 hw/riscv/boot.c                         |   2 +-
 linux-user/elfload.c                    |   2 +-
 linux-user/riscv/cpu_loop.c             |   2 +-
 semihosting/arm-compat-semi.c           |   2 +-
 target/riscv/cpu.c                      | 108 +++++++++------
 target/riscv/cpu_helper.c               |  91 ++++++++++++-
 target/riscv/csr.c                      |  71 ++++++----
 target/riscv/gdbstub.c                  |  10 +-
 target/riscv/machine.c                  |  10 +-
 target/riscv/monitor.c                  |   4 +-
 target/riscv/translate.c                | 170 ++++++++++++++++++------
 target/riscv/insn_trans/trans_rvb.c.inc | 140 ++++++++++---------
 target/riscv/insn_trans/trans_rvi.c.inc |  44 +++---
 target/riscv/insn_trans/trans_rvm.c.inc |  36 +++--
 target/riscv/insn_trans/trans_rvv.c.inc |  29 ++--
 17 files changed, 510 insertions(+), 292 deletions(-)

-- 
2.25.1



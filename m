Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8Xv-0005HT-K9
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xp-0005HE-HP
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:05 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xm-0003la-IU
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:05 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c4so6347603plh.7
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ERGQYv45viNbqLNcyLp84MnhONr2ziQF+vDzp95nLg=;
 b=F5TKMZfEJmdQ4Eg+uwi0ReWdBaN6scS9yA6eu8+XizKRIz1wlNMazWl9wuBDO9NlI5
 ZAnJH5Aun1+dhsHT8MLqFX8WFGP/uVbLr1RQ/ZCxAWrRxSp2W3nLonUN/vUxyerDh+MS
 uqyRSTUhUtVTywH6IM4nB0gTcBbAkhD8tUHKUKmZPXvzz4mG1n2zWzD+fa0yYIzidwJR
 gv+P4Un3/4RLzJIgB4L9PmEeJ1pcJSrKtGaxtL2AcLyfrpmQdXaFt49baMlfUXewPME1
 D4+QqQ3O4Xugu3JTBCohLdKrzIDTyyw4+nDballfpl5f6BgCqX/WJnYXYC+qZoTscKdP
 schA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ERGQYv45viNbqLNcyLp84MnhONr2ziQF+vDzp95nLg=;
 b=rm6vw7bi0L4pkdZkaoIwJi1cI+Ur1dTPCCLrFzzyvy/SbeZ8TKu1n0ko8WBcJZ7tQH
 u8nurU3lJbDYXVX7PAQ3/uX4PYCxdvGaDR4D6xoZqK0zxbBHa44/gcG65ax2OXCUN135
 ltf3IzCtUZJuiNwu1Got+IQfo+NFyzX/rGSZfOvILA69vE+NAWJVb0ARBaUvXOBcxMYf
 MPEG/iiZp6ZL1WR6rP3COPTBKpRXckuzf9hxSXSpCslarZ4lJb9+jaHXNrPNKbkGELDi
 V27jXB9e1XRr2aUFVn3RmSzD/TEagp9Nd/qv0KUB8P4qLoqL+sbwbzFMTKdiH3fCpnZM
 azrQ==
X-Gm-Message-State: AOAM530kzdgSEutdjOUJ+sJFxvM+0Wj7LVb9ZMEK57m42h+2qS03Af5D
 U207sLE6ImoTWQ4Bokl0B5Ubrg==
X-Google-Smtp-Source: ABdhPJybsPoylQvO4Im3tgREZd0jFj5wIuta07oiEogeSFFil49Q1Bd/V3Ko+nuP2OUswBYlVZlsyg==
X-Received: by 2002:a17:903:3109:b029:12d:3160:a815 with SMTP id
 w9-20020a1709033109b029012d3160a815mr16849492plc.45.1629481381043; 
 Fri, 20 Aug 2021 10:43:01 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v4 00/21] target/riscv: Use tcg_constant_*
Date: Fri, 20 Aug 2021 07:42:36 -1000
Message-Id: <20210820174257.548286-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:06 -0000

Replace use of tcg_const_*, which makes a copy into a temp which must
be freed, with direct use of the constant.  Reorg handling of $zero,
with different accessors for source and destination.  Reorg handling
of csrs, passing the actual write_mask instead of a regno.  Use more
helpers for RVH expansion.

Patches lacking review:
  02-tests-tcg-riscv64-Add-test-for-division.patch
  03-target-riscv-Clean-up-division-helpers.patch
  11-target-riscv-Add-DisasExtend-to-gen_unary.patch
  17-target-riscv-Use-gen_shift_imm_fn-for-slli_uw.patch
  21-target-riscv-Use-get-dest-_gpr-for-RVV.patch

Changes for v4:
  * Add a test for division, primarily checking the edge cases.
  * Dropped the greviw patch, since grev has been dropped from Zbb 1.0.0.

Changes for v3:
  * Fix an introduced remainder bug (bin meng),
    and remove one extra movcond from rem/remu.
  * Do not zero DisasContext on allocation (bin meng).

Changes for v2:
  * Retain the requirement to call gen_set_gpr.
  * Add DisasExtend as an argument to get_gpr, and ctx->w as a member
    of DisasContext.  This should help in implementing UXL, where we
    should be able to set ctx->w for all insns, but there is certainly
    more required for that.

r~


Richard Henderson (21):
  target/riscv: Use tcg_constant_*
  tests/tcg/riscv64: Add test for division
  target/riscv: Clean up division helpers
  target/riscv: Add DisasContext to gen_get_gpr, gen_set_gpr
  target/riscv: Introduce DisasExtend and new helpers
  target/riscv: Add DisasExtend to gen_arith*
  target/riscv: Remove gen_arith_div*
  target/riscv: Use gen_arith for mulh and mulhu
  target/riscv: Move gen_* helpers for RVM
  target/riscv: Move gen_* helpers for RVB
  target/riscv: Add DisasExtend to gen_unary
  target/riscv: Use DisasExtend in shift operations
  target/riscv: Use get_gpr in branches
  target/riscv: Use {get,dest}_gpr for integer load/store
  target/riscv: Reorg csr instructions
  target/riscv: Use {get,dest}_gpr for RVA
  target/riscv: Use gen_shift_imm_fn for slli_uw
  target/riscv: Use {get,dest}_gpr for RVF
  target/riscv: Use {get,dest}_gpr for RVD
  target/riscv: Tidy trans_rvh.c.inc
  target/riscv: Use {get,dest}_gpr for RVV

 target/riscv/helper.h                   |   6 +-
 target/riscv/insn32.decode              |   1 +
 target/riscv/op_helper.c                |  18 +-
 target/riscv/translate.c                | 701 ++++++------------------
 tests/tcg/riscv64/test-div.c            |  58 ++
 target/riscv/insn_trans/trans_rva.c.inc |  51 +-
 target/riscv/insn_trans/trans_rvb.c.inc | 370 ++++++++++---
 target/riscv/insn_trans/trans_rvd.c.inc | 127 +++--
 target/riscv/insn_trans/trans_rvf.c.inc | 149 +++--
 target/riscv/insn_trans/trans_rvh.c.inc | 266 ++-------
 target/riscv/insn_trans/trans_rvi.c.inc | 360 ++++++------
 target/riscv/insn_trans/trans_rvm.c.inc | 191 +++++--
 target/riscv/insn_trans/trans_rvv.c.inc | 151 ++---
 tests/tcg/riscv64/Makefile.target       |   5 +
 14 files changed, 1125 insertions(+), 1329 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-div.c
 create mode 100644 tests/tcg/riscv64/Makefile.target

-- 
2.25.1



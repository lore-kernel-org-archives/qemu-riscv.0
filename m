Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7atM-00039C-LS
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7atK-00034L-7N
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:18 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7atH-0005Ms-EW
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:17 -0400
Received: by mail-pf1-x444.google.com with SMTP id x25so7908169pff.4
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9Kp0pFLFALQvk40zb/M+TgTL+1Cc+suD4wuluvhzTso=;
 b=lHn4EzFcpAHNunfacJlW+BCt3foUAjSdQ9T20n+Fz95Bwb8Ifp3j4beVgZdxl1vHwn
 bySO12RJgvDdstDuw507q3eT0iyKgy41dMuWKwkV7PqjahY3fCX7n6IlrEYW7pjisa1j
 AdnkGSyruwX9CqZoba+iwVzfk6cAnzKRNiPCWPDt8eLHwgLDkfxJRpLcenZ8oZcvnneV
 g3s72GB1+BrFYIoY8VHX9n/Jt7tZ4idQsE8EIWh5SExtLYkZdcHKbqpa/Qc4IWGGQeOE
 hxJ5boI4I8PRNtuotDQiiFpQtf+ti8IqdDOMfJVpVipaHL3oeBlbabHIXKeRdinccTgQ
 Uy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9Kp0pFLFALQvk40zb/M+TgTL+1Cc+suD4wuluvhzTso=;
 b=nTj4QR4SuJLKkCw78fSOx79WL2/SoqTe98tnaLuC1tKYWJyYnt0U65NrCFsqRHYm8H
 d5mn1dtEnhnfEVf8IrAjcWupcvuA0GEK44n9OajS03ubBFZNdNs74IRFmIAvKd+sTNmv
 E2Kc0eWhEwkU0jUGhxQJEn2Fv7IGkxO7AGtmhckAe5md89J8wMO5hIIZmzxqsSFHUFpk
 xmzjSol6DOab2bVWadbSXxNeFy5O3+5uBRPStU8VY5Mz29qLmff1xRMIXctqO4ky70MA
 kGERjFTKiTVElw4dWzuCRnOTSFA2Kjf5CrC7/1SMVmWpDNs+8JFDoGILcgGsv9AHTeh/
 wGFg==
X-Gm-Message-State: AOAM530/3xN9K8p7QtTQrtdtoQKFHTTpkFVRt4qfL5lLZExnXB9dJFNx
 JLJmvmR99j///dUimleJFgEDWA==
X-Google-Smtp-Source: ABdhPJyWVGdTZRFmUlaD8hvyuAJzOnYdh1lpvsVkFB/x4iLhxY1z3mKWDwnGDg/pU8DLdRYAJxdnTA==
X-Received: by 2002:aa7:97b7:: with SMTP id d23mr10418668pfq.264.1597654392261; 
 Mon, 17 Aug 2020 01:53:12 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:53:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 67/70] target/riscv: rvv-1.0: relax RV_VLEN_MAX to 512-bits
Date: Mon, 17 Aug 2020 16:49:52 +0800
Message-Id: <20200817084955.28793-68-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:53:18 -0000

From: Frank Chang <frank.chang@sifive.com>

As GVEC only supports MAXSZ and OPRSZ in the range of: [8..256] bytes
and LMUL could be a fractional number. The maximum vector size can be
operated might be less than 8 bytes or larger than 256 bytes.
Skip to use GVEC if maximum vector size <= 8 or >= 256 bytes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>

--
Maybe to relax the limitations of MAXSZ or OPRSZ would be a better
approach.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h                      | 13 +++++++------
 target/riscv/insn_trans/trans_rvv.inc.c |  2 +-
 target/riscv/vector_helper.c            |  2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6e9b17c4e38..2c7ce500fa7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -92,7 +92,7 @@ typedef struct CPURISCVState CPURISCVState;
 
 #include "pmp.h"
 
-#define RV_VLEN_MAX 256
+#define RV_VLEN_MAX 512
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
@@ -413,16 +413,17 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         /*
          * If env->vl equals to VLMAX, we can use generic vector operation
          * expanders (GVEC) to accerlate the vector operations.
-         * However, as LMUL could be a fractional number. The maximum
-         * vector size can be operated might be less than 8 bytes,
-         * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
-         * only when maxsz >= 8 bytes.
+         * However, as GVEC only supports MAXSZ and OPRSZ in the range of:
+         * [8..256] bytes and LMUL could be a fractional number. The maximum
+         * vector size can be operated might be less than 8 bytes or
+         * larger than 256 bytes. So we set vl_eq_vlmax flag to true only
+         * when maxsz >= 8 bytes and <= 256 bytes.
          */
         uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
         uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
         uint32_t maxsz = vlmax << sew;
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl)
-                           && (maxsz >= 8);
+                           && (maxsz >= 8) && (maxsz <= 256);
         flags = FIELD_DP32(flags, TB_FLAGS, VILL,
                     FIELD_EX64(env->vtype, VTYPE, VILL));
         flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index f2edf804460..9ad64762239 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -669,7 +669,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
 
     /*
      * As simd_desc supports at most 256 bytes, and in this implementation,
-     * the max vector group length is 1024 bytes. So split it into two parts.
+     * the max vector group length is 2048 bytes. So split it into two parts.
      *
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 316e435f8af..07d1ee60717 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -129,7 +129,7 @@ static uint32_t vext_wd(uint32_t desc)
 static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
 {
     /*
-     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * As simd_desc support at most 256 bytes, the max vlen is 512 bits.
      * so vlen in bytes (vlenb) is encoded as maxsz.
      */
     uint32_t vlenb = simd_maxsz(desc);
-- 
2.17.1



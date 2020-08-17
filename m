Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7ar4-0007H2-Gy
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ar3-0007Dv-Cq
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:57 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ar1-0004yu-BV
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:50:57 -0400
Received: by mail-pg1-x541.google.com with SMTP id i10so2255571pgk.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=a/CXePUPDWWqKTfF5Ww5nuV0MbLPoMMlNNjIQw5rqQo=;
 b=OBlGWUug8bNbfFxqWXjSK0kyxgUOfAnrhwv/usm8ZXY9m2by8dRH/G+b+94V0MEGmE
 SbE6ReCTMs++qEiBvuQ/uIGHVKk5JjBwhdLv36B2kbLlcBi2RhCSS3AgQTVQBfFaWvEx
 LGrDpygA2B6qE8/0iW6uFU9cA3zvpoV9/09tXrCFvzLbWfZ8TGBYRkkNCCm7nlsRFaXL
 +65ASNJGa/GUfytMrRG4cPSWQa5Ur56EwEz4rr6RENicrI4ac0id0RCJKfCjOV+qVuRY
 S64nRpOHzuXa1XNiTpbT9xva5UoGRsb57VyUB+37x6rWsoJeVRfeXKy2u+QAB6pObyFz
 1I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=a/CXePUPDWWqKTfF5Ww5nuV0MbLPoMMlNNjIQw5rqQo=;
 b=i839SZHVRiOP5k08RA5rk+ju0dQFyhi6qaaEMRLZMzeWAHrvdxK0NWRbnegj5IloDO
 f4aYQliqCGLhWgnSz6k/6qvb4bOC7DqQK8d2LaHaFs8BhEKSBauN2/VXQZdg5u2eFzAI
 QGVGEkGMMGiHvAFTo7m+18QeC+zcKDz82ikHVhWBa/hmq7w+ADe1ncdHPusvTyEE2q2e
 /yR6de94bGrIw+GzG97DwPpHhI3ZbBa53KxctOtb2MgQuamvu37Tkw8KLlv9qvx8QHOz
 ZIaFqgbN8cWjJtlPqALJOkz9RNMqwJ7M9o661SRKEZgOjZJnrZaMOs62tTgbM8d1ceAZ
 O+xw==
X-Gm-Message-State: AOAM5324X1dPjBlMwt2zSjs6N1oPl9lsmYPtj8YzuWNmD9mToDRmBDIo
 txWHP0It+B1lwglQTWK9FH2nnQ==
X-Google-Smtp-Source: ABdhPJzRtue50tgfbp5qImD/bscluuq6SohIzK7VCKfariHtQd4x80IlO1CKrm4QP7kRBT64fqeQ3w==
X-Received: by 2002:a63:3ec2:: with SMTP id l185mr9605594pga.365.1597654254095; 
 Mon, 17 Aug 2020 01:50:54 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:50:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 17/70] target/riscv: rvv-1.0: configure instructions
Date: Mon, 17 Aug 2020 16:49:02 +0800
Message-Id: <20200817084955.28793-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x541.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:50:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 12 ++++++++----
 target/riscv/vector_helper.c            | 14 +++++++++++++-
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 4b8ae5470c3..4efe323920b 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -98,8 +98,10 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     s2 = tcg_temp_new();
     dst = tcg_temp_new();
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
+    if (a->rd == 0 && a->rs1 == 0) {
+        s1 = tcg_temp_new();
+        tcg_gen_mov_tl(s1, cpu_vl);
+    } else if (a->rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_const_tl(RV_VLEN_MAX);
     } else {
@@ -131,8 +133,10 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     s2 = tcg_const_tl(a->zimm);
     dst = tcg_temp_new();
 
-    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
-    if (a->rs1 == 0) {
+    if (a->rd == 0 && a->rs1 == 0) {
+        s1 = tcg_temp_new();
+        tcg_gen_mov_tl(s1, cpu_vl);
+    } else if (a->rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
         s1 = tcg_const_tl(RV_VLEN_MAX);
     } else {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7b4b1151b97..430b25d16c2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -31,12 +31,24 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
 {
     int vlmax, vl;
     RISCVCPU *cpu = env_archcpu(env);
+    uint64_t lmul = FIELD_EX64(s2, VTYPE, VLMUL);
     uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
     bool vill = FIELD_EX64(s2, VTYPE, VILL);
     target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
 
-    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
+    if (lmul & 4) {
+        /* Fractional LMUL. */
+        if (lmul == 4 ||
+            cpu->cfg.elen >> (8 - lmul) < sew) {
+            vill = true;
+        }
+    }
+
+    if ((sew > cpu->cfg.elen)
+        || vill
+        || (ediv != 0)
+        || (reserved != 0)) {
         /* only set vill bit. */
         env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
         env->vl = 0;
-- 
2.17.1



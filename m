Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRa-00025s-6B
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRV-000229-JX
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:13 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRR-0007mV-Vf
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:12 -0400
Received: by mail-pl1-x642.google.com with SMTP id r4so16672772pls.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mr6lKxcFjeA/8F/C56chBLmqe7HS/SBJkMcoiQ9aYYI=;
 b=HzVN5o22yo5mpuM47TveYxgH/WlUQnudmJL1k8dnxWS/frpOP2LYX+CIEsxJgC4ND7
 t4W0W0mxxAVZG59Hi4xNWWIH+sue2UiheQlqzGY+HxnU6eWKsHHlreMNvLOSOgXOCbM3
 QhT99uAPII+Uts+h4H6NSKhQHh52hK8i5Q7NgHSWtDQc03rDwfNRG2II+jREbMub8fzJ
 QjtQTRUNK1n1HLPW7M9au5PiJFxG6Z2wtSRi86WBIhDCXgQ+bV8OVv5Hnex0io3aE9w5
 O0tT38SDEsx20UycmCQ0OsAWsdcMrQWfYX4+QZ+rp7ORSjVY1zvM4psdF31+y+/WbrZw
 8Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mr6lKxcFjeA/8F/C56chBLmqe7HS/SBJkMcoiQ9aYYI=;
 b=qXDgk4StPit4+4HvtpBse3smRCxMAcTR690sDNe2tMROTSNP+g3Wvijfsxfy21HY12
 nIvOLHL4manP15XdDM3rAqTnROksVvyxN08G8+TJDtWrr/60BsUm9KQy099UvH7g1qSD
 oh5PLliQfWr/7pcbgZD/UbfFwmVDRyGTDFvOJnNfOsc1x+v6QOUtGzU3gM5wV9phNeCT
 t5WBx4n7aAG2KWt0uJ1x8DqMjkbdZyJi9OksNTehdZIyiFViNATyRJRJaK14yz9zXOIG
 Ka9NkQOMvlVTwgMkvxFz1MTgkMshPuwpPE9GQlLiZ7UOhVFdOZ4LW5j/w8KNzhYbBSmb
 S5dA==
X-Gm-Message-State: AOAM530LtclePNGCwZj4MPyHY6zEV6pw3DvPzcRalo0kwvThxoTkwGKf
 /cMSa3ZqhYcNDU+61Ip0Jz77Tw==
X-Google-Smtp-Source: ABdhPJyrsNvNqzeezNZ0qwRXtrfzIIbcpQ3ptn4Ol3fKZABF+4lbowX9hqIxw2l0DJQLW93VsKYCUQ==
X-Received: by 2002:a17:90a:c208:: with SMTP id
 e8mr7630392pjt.73.1596710888730; 
 Thu, 06 Aug 2020 03:48:08 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 19/71] target/riscv: rvv-1.0: configure instructions
Date: Thu,  6 Aug 2020 18:46:16 +0800
Message-Id: <20200806104709.13235-20-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:14 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 12 ++++++++----
 target/riscv/vector_helper.c            | 14 +++++++++++++-
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 8a6050f6b32..2f87f2482c3 100644
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
index 5653d6dad56..6df282cbca7 100644
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



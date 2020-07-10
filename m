Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscS-0005q0-Kb
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdk-0005Tn-U5
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdj-0006gn-8J
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b9so2098736plx.6
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=g/n/shcRANt+Py1I0cI3sy7fFEukQpkbO1lT8zVmbBo=;
 b=CaAea5qlN4iZPKQSrur0UwqT+jO+TLP75GdCROEsX7YU9vYC1ZdY8iRRtRv9cRnv1G
 I+dgMg+j6YrqY64cyaBSadn8tbAU/a/RjLviVzuwlYMNeHpKV1Cye3KKq1fLeUIavJd+
 OwlqKEYEHCTseLunsw4OO+wfkAdMGYct0029vwtIQyPFoeCqp7xDfwgLB61INV51ICGb
 nWREnQ1sl9njPfIk8kCWaYCI3nqa+ZTb3Zy4QxwVgWWBdhVG54nkyFVQveVzLDPz8Ik1
 +n0ky7TqGRHNrVHoA3Of5uiJFhzIusq/BT7Uyq1fjlFNOwGMiqXlpqCXw6J3OBkWaHzm
 4++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=g/n/shcRANt+Py1I0cI3sy7fFEukQpkbO1lT8zVmbBo=;
 b=fJeqUmlhdbtXz9l0kEdwg/MA3N4jMxFantzK++g7SVVuSd3hhOM34qizo6pOMylXGd
 2cLvJXt8GXxC7Y2CL1hLhU+UqDoqruEK2WgARG5qM16i+vMVTkcIDZAxxdPTDSNvuMl4
 E66i2ApDTJpb2tM0RwEJiAdQEGeRKCOQEM4NnOgLJi9ExKSJNHu8xkPvRhawfbJmPjCC
 1jdzp+vqet4b+RXNpn1ZrRzAdJ0GuwwpPNQErdXX6v8611kvVvVnDFxA54hw2zpKx2Nc
 zoMi0OhmE0AOikoA7knHKl3/WUdDP8aQlFHSZAyvVE2S6dbRof3wsk3RsdNAdd0mJ7vJ
 W6GA==
X-Gm-Message-State: AOAM530S9BPvmuI3wGNAt6qXeh2VTUosPYYlbjW21VnHxDEUXXHfV9XL
 bGNFAGAAjMQkqDXXR2HgVrvnYA==
X-Google-Smtp-Source: ABdhPJyhrkEF4D8Bzz+uw5RCletqdpmNwNH6eDst71YKDB6ORObdXCOVxrxmj7ZKPXdRq5z0Zc2W4g==
X-Received: by 2002:a17:90a:3624:: with SMTP id
 s33mr5038586pjb.148.1594378342130; 
 Fri, 10 Jul 2020 03:52:22 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:52:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 27/65] target/riscv: rvv-0.9: iota instruction
Date: Fri, 10 Jul 2020 18:48:41 +0800
Message-Id: <20200710104920.13550-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:59 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:52:25 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 44 ++++++++++++-------------
 target/riscv/vector_helper.c            |  2 +-
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 37b2582981..4560bc4379 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -578,7 +578,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index c1efb87e8d..0e552c3660 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2785,29 +2785,29 @@ GEN_M_TRANS(vmsof_m)
 /* Vector Iota Instruction */
 static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2, 1) &&
-        (a->vm != 0 || a->rd != 0)) {
-        uint32_t data = 0;
-        TCGLabel *over = gen_new_label();
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    REQUIRE_RVV;
+    VEXT_CHECK_ISA_ILL(s);
+    require_noover(a->rd, s->flmul, a->rs2, 1);
+    require_vm(a->vm, a->rd);
+    require_align(a->rd, s->flmul);
 
-        data = FIELD_DP32(data, VDATA, VM, a->vm);
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-        data = FIELD_DP32(data, VDATA, VTA, s->vta);
-        data = FIELD_DP32(data, VDATA, VMA, s->vma);
-        static gen_helper_gvec_3_ptr * const fns[4] = {
-            gen_helper_viota_m_b, gen_helper_viota_m_h,
-            gen_helper_viota_m_w, gen_helper_viota_m_d,
-        };
-        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
-                           vreg_ofs(s, a->rs2), cpu_env, 0,
-                           s->vlen / 8, data, fns[s->sew]);
-        gen_set_label(over);
-        return true;
-    }
-    return false;
+    uint32_t data = 0;
+    TCGLabel *over = gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+    data = FIELD_DP32(data, VDATA, VM, a->vm);
+    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, VTA, s->vta);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
+    static gen_helper_gvec_3_ptr * const fns[4] = {
+        gen_helper_viota_m_b, gen_helper_viota_m_h,
+        gen_helper_viota_m_w, gen_helper_viota_m_d,
+    };
+    tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                       vreg_ofs(s, a->rs2), cpu_env, 0,
+                       s->vlen / 8, data, fns[s->sew]);
+    gen_set_label(over);
+    return true;
 }
 
 /* Vector Element Index Instruction */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index bc1363fb7d..71a12c6c9b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4748,7 +4748,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
     CLEAR_FN(vd, vta, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));     \
 }
 
-GEN_VEXT_VIOTA_M(viota_m_b, uint8_t, H1, clearb)
+GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1, clearb)
 GEN_VEXT_VIOTA_M(viota_m_h, uint16_t, H2, clearh)
 GEN_VEXT_VIOTA_M(viota_m_w, uint32_t, H4, clearl)
 GEN_VEXT_VIOTA_M(viota_m_d, uint64_t, H8, clearq)
-- 
2.17.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscp-0006e1-Ej
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdh-0005ST-2b
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:21 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdf-0006gM-EC
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:20 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e18so2373409pgn.7
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kBSFjsOF78wUPVmQ5lBjOZbQCpF/mwVTJu2jvHOc3+g=;
 b=PDsdGMHWlXCRahX0RZac3AZ2gKUzzI6yvjN+0srmuTpZ04yzqN0zwQ2GegzYKvQ56C
 j00ao4GNbh66KoWWQpCm0dHGG9INV7M7zg+mJry3HfoNEv2LkvkemnHGHqukN/1f2k7v
 0a17CAdvqrsPOCwijNAh4Whyj3M0ZBv7wOiEisVfxzikPmei5sEmY0IS/lXBS1P4Jvqb
 5DU9llssjEOQ/L2xrF6ksPokQ4UC0IXWwqHDOB/iWqPgdfXevtysL5FvNmqZxBXfhJHC
 StZZwrljnIJeDAHjFz4OYORLcWzRtCw221o1urKZJPd6DFA0mt6L7t4PL5G+Qz6f04cg
 Bmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kBSFjsOF78wUPVmQ5lBjOZbQCpF/mwVTJu2jvHOc3+g=;
 b=AHar4M2q7iyNaKN7UycCld65bv3SIyIYK68AVZklxoz5O/ryr9Bwkp8aa2mznZdcQ2
 Mbm9bPlDK1b+Z61U87DkaT0gmwMFHQ4/K1UAoDTu1IAal/GInf546OvjfoovwWIxkhgv
 78RzeRAy4EB3FJaofW/lXY+HpIz+PWPiAvq3TZEoxGGmIlGIO9OH0dAz0c8k8auGDTJX
 WfYqQpZZCmrnrbB2vFM7ifKsQfn3bCzsvBm1u8wPUvbmaQ3jkxwPxoEVvADy8UCgKTJS
 vo+H+eYFl+BtNcM/iLOPwhWCrL5Nakb0K1reIAtnuv8ZXrXlaDlPDCmSM/re6ggQfjMs
 +jOQ==
X-Gm-Message-State: AOAM531X1Du/GHcqw1beX9uj5v2PWszl/ZXSPvG9JKM3dcqimIf8W+A8
 GiWbS6V7E8/5HDGD3X5kdUiQaw==
X-Google-Smtp-Source: ABdhPJzXgggfyVwUaRX09Yd4crffuz2bMi1LCZPdBZ4skdncVLOo/n6GuqbdYUcmojhZ00sbd2hAqQ==
X-Received: by 2002:a63:5fcc:: with SMTP id t195mr48744127pgb.56.1594378338131; 
 Fri, 10 Jul 2020 03:52:18 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:52:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 26/65] target/riscv: rvv-0.9: set-X-first mask bit instructions
Date: Fri, 10 Jul 2020 18:48:40 +0800
Message-Id: <20200710104920.13550-27-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:52:21 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  6 ++---
 target/riscv/insn_trans/trans_rvv.inc.c | 32 +++++++++++++------------
 target/riscv/vector_helper.c            |  4 ----
 3 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b5b59fe6dd..37b2582981 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -575,9 +575,9 @@ vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
-vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
-vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
-vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
+vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
+vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
+vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 2db7e7f58f..c1efb87e8d 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2758,22 +2758,24 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 #define GEN_M_TRANS(NAME)                                          \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
-        uint32_t data = 0;                                         \
-        gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
-        TCGLabel *over = gen_new_label();                          \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+    REQUIRE_RVV;                                                   \
+    VEXT_CHECK_ISA_ILL(s);                                         \
+    require_vm(a->vm, a->rd);                                      \
+    require(a->rd != a->rs2);                                      \
                                                                    \
-        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
-        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
-        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
-                           vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
-                           cpu_env, 0, s->vlen / 8, data, fn);     \
-        gen_set_label(over);                                       \
-        return true;                                               \
-    }                                                              \
-    return false;                                                  \
+    uint32_t data = 0;                                             \
+    gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;                 \
+    TCGLabel *over = gen_new_label();                              \
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);              \
+                                                                   \
+    data = FIELD_DP32(data, VDATA, VM, a->vm);                     \
+    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                 \
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);                   \
+    tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                         \
+                       vreg_ofs(s, 0), vreg_ofs(s, a->rs2),        \
+                       cpu_env, 0, s->vlen / 8, data, fn);         \
+    gen_set_label(over);                                           \
+    return true;                                                   \
 }
 
 GEN_M_TRANS(vmsbf_m)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f13f6c6dda..bc1363fb7d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4675,7 +4675,6 @@ enum set_mask_type {
 static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
                    uint32_t desc, enum set_mask_type type)
 {
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     int i;
@@ -4705,9 +4704,6 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
             }
         }
     }
-    for (; i < vlmax; i++) {
-        vext_set_elem_mask(vd, i, 0);
-    }
 }
 
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
-- 
2.17.1



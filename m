Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAuW-0001Xk-BY
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuU-0001Tf-Qj
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:34 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuS-0005b6-Oq
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:34 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o1so662143plk.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=65H2nOM6Zv+jL3nuWxhgnkDNOjW7kakLBlArAff0dV0=;
 b=G7P1buDVN0d8pjSI7vqvYDgbTtKzCuY/e1R3o6qruNqUYrz+3OC0gFi80fq2+e+/0c
 I1NGI7ritFuJY1naPC36Xgtt9twtifwo37RYqnkSGCG2NRsyK6ORjqPsqg3wJWrupOZj
 B4B6Esufpc3dVY5BLAip8F5xQ1M4opv5cBGrlevCi58Zs+Ki6cN7bPohjIRdo3OHPS7x
 EyzCLV9CLRfTcqhHfftRAaBnPanGR2yVpaNAxrI0wqPnpd6gbyOE71RtOzbNWzI96Z6+
 q/CM1+9XHXimeP3Xxg3Lqu2RpHW6U6zk+BYd+p1ahz2XdP08J9WsZFMBmxfwXBD+gEen
 eHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=65H2nOM6Zv+jL3nuWxhgnkDNOjW7kakLBlArAff0dV0=;
 b=Zvf4JoVcjqPzpaeGc8y08UuP9S4djlhJXION+kyHmytkz1PlSsAAfusorgoJsSaXdL
 xzD3lQ22xcPXj1LXfDyMdtT1Rkdz6mcBiqdqwZ5BcqvIS9ORL5shQpH1J8QEpTTgAqIS
 t8gSgSD0vkEij+7eR8C3H3hsHVkH6tCwLdcow93GPfcW7nJuaIaRQqEv6LnC5SwjYiFR
 uT74Eva4Ne2VI+6KXmmBJmR/OY2xnmZvN0EfnJTLPK2JyDCIG9JtaViIyUfq5nHZTUap
 2GCNBd7prRxczlF6qXflV4MWu7yy5PnyT1dZqF3qPKBQRQBtWf4Az4Y2Q6+KXJchyuvt
 YWOg==
X-Gm-Message-State: AOAM531Ws2D5AEoGXNE7FmPw95H+ArZRdRdcZcJbD4kYeOMgIGzc/mUX
 a0Qak1X2ajTcFKsbK5dBOvCh0l21s+g=
X-Google-Smtp-Source: ABdhPJxd/hABcyKYPaLagYppy+5ZBz6tj69h8VJ/Pao3lQ29S8OwK5BGSu0BxL+DdnGrmYbdKPoE/A==
X-Received: by 2002:a17:902:c211:: with SMTP id
 17mr25364314pll.302.1595409571573; 
 Wed, 22 Jul 2020 02:19:31 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:19:31 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 27/76] target/riscv: rvv-0.9: load/store whole register
 instructions
Date: Wed, 22 Jul 2020 17:15:50 +0800
Message-Id: <20200722091641.8834-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
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
X-List-Received-Date: Wed, 22 Jul 2020 09:19:35 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vl1r.v
* vs1r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  3 ++
 target/riscv/insn32.decode              |  4 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 61 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 47 +++++++++++++++++++
 4 files changed, 115 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 808f88fbeb..8cf5c4c065 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -145,6 +145,9 @@ DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle32ff_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vle64ff_v, void, ptr, ptr, tl, env, i32)
 
+DEF_HELPER_4(vl1r_v, void, ptr, tl, env, i32)
+DEF_HELPER_4(vs1r_v, void, ptr, tl, env, i32)
+
 DEF_HELPER_6(vamoswapei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoswapei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoswapei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6a9cf6ad53..e3f0fba912 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -267,6 +267,10 @@ vle16ff_v     ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
 vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
 vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
 
+# Vector whole register insns
+vl1r_v        000 000 1 01000 ..... 000 ..... 0000111 @r2
+vs1r_v        000 000 1 01000 ..... 000 ..... 0100111 @r2
+
 #*** Vector AMO operations are encoded under the standard AMO major opcode ***
 vamoswapei8_v   00001 . . ..... ..... 000 ..... 0101111 @r_wdvm
 vamoswapei16_v  00001 . . ..... ..... 101 ..... 0101111 @r_wdvm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index fb6d092539..4274daf08e 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1030,6 +1030,67 @@ GEN_VEXT_TRANS(vle16ff_v, 16, 1, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vle32ff_v, 32, 2, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vle64ff_v, 64, 3, r2nfvm, ldff_op, ld_us_check)
 
+/*
+ * load and store whole register instructions
+ */
+typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
+
+static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t data,
+                             gen_helper_ldst_whole *fn, DisasContext *s,
+                             bool is_store)
+{
+    TCGv_ptr dest;
+    TCGv base;
+    TCGv_i32 desc;
+
+    dest = tcg_temp_new_ptr();
+    base = tcg_temp_new();
+    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+
+    gen_get_gpr(base, rs1);
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+
+    fn(dest, base, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+    tcg_temp_free(base);
+    tcg_temp_free_i32(desc);
+    if (!is_store) {
+        mark_vs_dirty(s);
+    }
+    return true;
+}
+
+/*
+ * load and store whole register instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 7.9)
+ */
+#define GEN_LDST_WHOLE_TRANS(NAME, EEW, SEQ, ARGTYPE, ARG_NF, IS_STORE) \
+static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a)            \
+{                                                                       \
+    s->eew = EEW;                                                       \
+    s->emul = (float)EEW / (1 << (s->sew + 3)) * s->flmul;              \
+                                                                        \
+    if (!require_rvv(s)) {                                              \
+        return false;                                                   \
+    }                                                                   \
+                                                                        \
+    uint32_t data = 0;                                                  \
+    bool ret;                                                           \
+    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                      \
+    data = FIELD_DP32(data, VDATA, SEW, s->sew);                        \
+    data = FIELD_DP32(data, VDATA, VTA, s->vta);                        \
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);                        \
+    data = FIELD_DP32(data, VDATA, NF, ARG_NF);                         \
+    ret = ldst_whole_trans(a->rd, a->rs1, data, gen_helper_##NAME,      \
+                           s, IS_STORE);                                \
+    return ret;                                                         \
+}
+
+GEN_LDST_WHOLE_TRANS(vl1r_v, 8, 0, vl1r_v, 1, false)
+
+GEN_LDST_WHOLE_TRANS(vs1r_v, 8, 1, vs1r_v, 1, true)
+
 /*
  *** vector atomic operation
  */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f49af084ef..995e873549 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -642,6 +642,53 @@ GEN_VEXT_LDFF(vle16ff_v, int16_t, lde_h, clearh)
 GEN_VEXT_LDFF(vle32ff_v, int32_t, lde_w, clearl)
 GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d, clearq)
 
+/*
+ *** load and store whole register instructions
+ */
+static void
+vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
+                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
+                MMUAccessType access_type)
+{
+    uint32_t i, k;
+    uint32_t nf = vext_nf(desc);
+    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+
+    /* probe every access */
+    probe_pages(env, base, vlenb * nf * esz, ra, access_type);
+
+    /* load bytes from guest memory */
+    for (i = 0; i < vlenb; i++) {
+        k = 0;
+        while (k < nf) {
+            target_ulong addr = base + (i * nf + k) * esz;
+            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            k++;
+        }
+    }
+}
+
+#define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)             \
+void HELPER(NAME)(void *vd, target_ulong base,              \
+                  CPURISCVState *env, uint32_t desc)        \
+{                                                           \
+    vext_ldst_whole(vd, base, env, desc, LOAD_FN,           \
+                    sizeof(ETYPE), GETPC(), MMU_DATA_LOAD); \
+}
+
+GEN_VEXT_LD_WHOLE(vl1r_v, int8_t, lde_b)
+
+#define GEN_VEXT_ST_WHOLE(NAME, ETYPE, STORE_FN)             \
+void HELPER(NAME)(void *vd, target_ulong base,               \
+                  CPURISCVState *env, uint32_t desc)         \
+{                                                            \
+    vext_ldst_whole(vd, base, env, desc, STORE_FN,           \
+                    sizeof(ETYPE), GETPC(), MMU_DATA_STORE); \
+}
+
+GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b)
+
 /*
  *** Vector AMO Operations (Zvamo)
  */
-- 
2.17.1



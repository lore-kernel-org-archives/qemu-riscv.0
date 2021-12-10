Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapn-0000iR-UI
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapl-0000f4-Ve
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:50 -0500
Received: from [2607:f8b0:4864:20::632] (port=42984
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapi-0008O0-Tj
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:49 -0500
Received: by mail-pl1-x632.google.com with SMTP id u17so5735172plg.9
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UPbdrKH3rx1VkpqDibWJKVTxYtQMAQPQ/TsGu4dzsds=;
 b=DZWCID0i+DHffKLo2QLWPegMsol5ta7HYijJ+SSMJpVkp+vKnU4Lu8Fa+FgveMKaIw
 n9uz3DK/rIQxC+8sFi6a0v+WVkH1ftesKRIoVgJlxEyQFaTXq38PbbfiA5li9PWGkM2s
 krdvNxJQLYy/YCTyvnFHw06cpQcv8wg1duo5AEglx6k9K5giFaFRnV6CboLqhpbV7S6y
 p5wPk8tlQTqhoD1xps4gHFMCxkl9JLUckqtH4DE40mxtJL/hpRaxbStXoSZ0Odo4THZ0
 Z2sgH2H7t9SV/8b+FaAcw3Jy/GwWlSy5jGWAjh7FqdWH3hpFAAlkA55offIDABBCn3oQ
 q9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UPbdrKH3rx1VkpqDibWJKVTxYtQMAQPQ/TsGu4dzsds=;
 b=MzzSC0MKZKgiPkhDFlAE5C8CZ9e7o51ETM9OECcALsoTEYIT2qvv1X2aXEWeIXGFzS
 WH6Uo5U3Hri4rRDDcB+J/XJiCqoXAB2gMtsJ8vlldFyNWUlMMbz/bX2nq1v7AaWfnsKk
 fnEulm9wv8KMgnxxtBlEmonG+ItDTqd0brioNxQLi7Dta/jtQHl/avKq4HkdUc/RsvOw
 51eMWLL6D0yq0pDPKl0zGotyLSddVamRBDB2BUZn1NTv1d+iv1wKhiETBTbJRkUcK+zq
 GpIeG9Ud+t/E60Rm2rOKh0prQG/4pHCSsbWOKWQFrr0j4UhdpFEyXW0Or+OQ62eSoRiW
 sd4g==
X-Gm-Message-State: AOAM532iWkfpVDJwsWFTqJHJ+8aXJw8/iLGvnBDpTrsmcttDQAJJ5Kl3
 XXOJDS9NwI8VM6IaIwFiz72xpw==
X-Google-Smtp-Source: ABdhPJyynYAeKGypatMRFSp+JijFspjq/ZNfuBOumL4IkoWotFCAJIzyL+/I58xDwmfdFwxkh7EG+A==
X-Received: by 2002:a17:902:714f:b0:142:892d:a46 with SMTP id
 u15-20020a170902714f00b00142892d0a46mr72887010plm.39.1639123245712; 
 Fri, 10 Dec 2021 00:00:45 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:45 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 74/77] target/riscv: rvv-1.0: add vector unit-stride mask
 load/store insns
Date: Fri, 10 Dec 2021 15:57:00 +0800
Message-Id: <20211210075704.23951-75-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Dec 2021 08:00:50 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvv.c.inc | 40 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 21 +++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ab283d12b7..6e58343af3 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -129,6 +129,8 @@ DEF_HELPER_5(vse8_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse16_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse32_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse64_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vlm_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vsm_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3b6524bad9..1a4a287146 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -305,6 +305,10 @@ vse16_v    ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
 vse32_v    ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
 vse64_v    ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
 
+# Vector unit-stride mask load/store insns.
+vlm_v      000 000 1 01011 ..... 000 ..... 0000111 @r2
+vsm_v      000 000 1 01011 ..... 000 ..... 0100111 @r2
+
 # Vector strided insns.
 vlse8_v     ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlse16_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e540b5d33c..97b1dc1026 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -697,6 +697,46 @@ GEN_VEXT_TRANS(vse16_v, MO_16, r2nfvm, st_us_op, st_us_check)
 GEN_VEXT_TRANS(vse32_v, MO_32, r2nfvm, st_us_op, st_us_check)
 GEN_VEXT_TRANS(vse64_v, MO_64, r2nfvm, st_us_op, st_us_check)
 
+/*
+ *** unit stride mask load and store
+ */
+static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
+{
+    uint32_t data = 0;
+    gen_helper_ldst_us *fn = gen_helper_vlm_v;
+
+    /* EMUL = 1, NFIELDS = 1 */
+    data = FIELD_DP32(data, VDATA, LMUL, 0);
+    data = FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
+}
+
+static bool ld_us_mask_check(DisasContext *s, arg_vlm_v *a, uint8_t eew)
+{
+    /* EMUL = 1, NFIELDS = 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
+{
+    uint32_t data = 0;
+    gen_helper_ldst_us *fn = gen_helper_vsm_v;
+
+    /* EMUL = 1, NFIELDS = 1 */
+    data = FIELD_DP32(data, VDATA, LMUL, 0);
+    data = FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
+}
+
+static bool st_us_mask_check(DisasContext *s, arg_vsm_v *a, uint8_t eew)
+{
+    /* EMUL = 1, NFIELDS = 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+GEN_VEXT_TRANS(vlm_v, MO_8, vlm_v, ld_us_mask_op, ld_us_mask_check)
+GEN_VEXT_TRANS(vsm_v, MO_8, vsm_v, st_us_mask_op, st_us_mask_check)
+
 /*
  *** stride load and store
  */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 83373ca6fc..4c1a1310e6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -345,6 +345,27 @@ GEN_VEXT_ST_US(vse16_v, int16_t, ste_h)
 GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
 GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
 
+/*
+ *** unit stride mask load and store, EEW = 1
+ */
+void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
+                    CPURISCVState *env, uint32_t desc)
+{
+    /* evl = ceil(vl/8) */
+    uint8_t evl = (env->vl + 7) >> 3;
+    vext_ldst_us(vd, base, env, desc, lde_b,
+                 0, evl, GETPC(), MMU_DATA_LOAD);
+}
+
+void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
+                    CPURISCVState *env, uint32_t desc)
+{
+    /* evl = ceil(vl/8) */
+    uint8_t evl = (env->vl + 7) >> 3;
+    vext_ldst_us(vd, base, env, desc, ste_b,
+                 0, evl, GETPC(), MMU_DATA_STORE);
+}
+
 /*
  *** index: access vector element from indexed memory
  */
-- 
2.31.1



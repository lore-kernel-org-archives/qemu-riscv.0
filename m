Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9Iu-00013N-71
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Ir-0000zU-R9
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:02 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Ig-0002CD-Mg
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:59 -0500
Received: by mail-pg1-x52b.google.com with SMTP id i5so436113pgo.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J88EfHnkgaDqglpHzFIx/TsUyRcYxAOR3TBWd0dXw+s=;
 b=egI5yo2FwWpA4s2ZeCzcfFA0N68ATeDddI2TtHH45gvFXKvcoHwVmo3ZuhbUqMUWq/
 wjDQWfU53WsJAEydNvLB7ekPm/yodKy2Bz+oH/Nc2n6D7VFbCVOecgPPeOiqotPz7H9C
 bafcL0BOAopP4NdPtLwYhM2Ukv8VvyE4eDDkdiLp8telqjnOINfKW4dpIBi9Wwxbk1qm
 SBs3bLDsMtkbnUfl7/TDNYZp8JYkKLz7i6kv3qVa8YIKTL89MHwMFZgBUUEaUNa4XBGp
 z4m4c7FXPelhLm8hE4gT/3FRu6uuTUW9x6pCe667+GyJgrDocWc3R5gm7dnITiyD/18j
 OyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J88EfHnkgaDqglpHzFIx/TsUyRcYxAOR3TBWd0dXw+s=;
 b=rUhFMMU0jsz6tqPKdP+pCq4SSAb3aHBhhvW7DdVD6tbfQDATaNAoq67J064i5iom48
 89DbVTD/gvwfiH0uTswoonUt541Wi4JXeLTYv2YLeyPM+dG5Xg8iLHS9CDqCLjXzhlIw
 5X0akqBajpppi/su1VBpwSkDDjy5sZHLo7TUhn859WbxNtuFMGzLzEQOmcgwID87TMdm
 SHCZNcmcYrquxvDCje+d75N2TUdiUtXZrvOYnY1qDTwGZnpn27g3GU5NmomGlP1mrcuQ
 Yk5cryX1OtEV7WPSMTqt+ZmaqOc6vjCF8JeKLq/fHRRSdp2ECImNz4M9iiWIBaWQpkuy
 TRhw==
X-Gm-Message-State: AOAM533ytF1hMt/rrIHgYEWrc84hD5IpncNm0jdj6JBSMTCPOZyM67Nj
 kgzEhIpav15HVhrviAJl9eguGw==
X-Google-Smtp-Source: ABdhPJy1okOLoEzI7i3Cz2yCZg+LU1eIWKiY/cjQ6TErSUXNvlHs4e8PEsKYZK/ty+74ilnv+y3xvw==
X-Received: by 2002:a62:25c7:0:b029:156:72a3:b0c0 with SMTP id
 l190-20020a6225c70000b029015672a3b0c0mr2226677pfl.59.1610418049401; 
 Mon, 11 Jan 2021 18:20:49 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC v3 08/16] target/riscv: add gen_shifti() and gen_shiftiw()
 helper functions
Date: Tue, 12 Jan 2021 10:19:49 +0800
Message-Id: <20210112022001.20521-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 02:21:02 -0000

From: Frank Chang <frank.chang@sifive.com>

Add gen_shifti() and gen_shiftiw() helper functions to reuse the same
interfaces for immediate shift instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 45 +++----------------------
 target/riscv/translate.c                | 43 +++++++++++++++++++++++
 2 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index d04ca0394cf..678c8f07238 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -261,52 +261,24 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
     if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shli_tl(t, t, a->shamt);
-
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
+        return gen_shifti(ctx, a, tcg_gen_shl_tl);
     } /* NOP otherwise */
     return true;
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
     if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shri_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
+        return gen_shifti(ctx, a, tcg_gen_shr_tl);
     } /* NOP otherwise */
     return true;
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
     if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_sari_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
+        return gen_shifti(ctx, a, tcg_gen_sar_tl);
     } /* NOP otherwise */
     return true;
 }
@@ -369,16 +341,7 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
-    TCGv source1;
-    source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-
-    tcg_gen_shli_tl(source1, source1, a->shamt);
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-
-    tcg_temp_free(source1);
-    return true;
+    return gen_shiftiw(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 53c0c34ce16..8459b6bcf54 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -810,6 +810,49 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static bool gen_shifti(DisasContext *ctx, arg_shift *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_movi_tl(source2, a->shamt);
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+#ifdef TARGET_RISCV64
+
+static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_movi_tl(source2, a->shamt);
+
+    (*func)(source1, source1, source2);
+    tcg_gen_ext32s_tl(source1, source1);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+#endif
+
 static void gen_ctz(TCGv ret, TCGv arg1)
 {
     tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
-- 
2.17.1



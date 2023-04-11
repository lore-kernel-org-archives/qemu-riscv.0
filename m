Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2TF-0006nr-KS
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TC-0006TF-Rk
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TA-0000V6-L1
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:50 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 nh20-20020a17090b365400b0024496d637e1so11652578pjb.5
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vffLA6ITUH1RC89+Um/oqg3axNWKis5tXBpqYQoVR8s=;
 b=SX+0qKuejVeKodYBxSyk/c74ufKyZSJiedICp+cHuN1g6+IRVfjDigDGyD07Tg5jia
 JY21yqacr4PMMcNiPOmndMCRsalKYtKHqhu5/D3Y6G6EZg7Th28y0dexO/OGveo65hFJ
 Rw+qjJAVPRe2DKmsfSeEkD6jC/Wjhs5W3fuNbQFYI7qpApJS41kV8Wb2RU1CKqS34G3H
 BoI0uq75aqXbv93SBwQFi9Z4/0K991NLWSRfcu4yeVhl+I1UgzSUOfEA5WQdCd1dV8Ak
 6qKDz+FXYzOmVESS/W23OP0oiG7QqGMPkj6nZYc25e2pjgxmWB/tZtY7OKbFS8Y80GB3
 tJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vffLA6ITUH1RC89+Um/oqg3axNWKis5tXBpqYQoVR8s=;
 b=3EMZ24c8Upxn25G1QtFpCO5LFwE9LSZr/zk3znmKzytjDduJTyeQ1fmUJvhRcR5C2O
 Y+6SLfQ+CSTdciQ8uYT6peirLKH50haIZNCth7w6IXET0W1kZ26rxVT972YINdifi7h5
 GWu2BEUF7GdgbMN6QThGR5J00Y5AQp+GC+qVuRbyUxkwiC1Bu4eQsk2twyE6OniIMMJN
 4H1vhl7o8c3FVcq+0Ljyax9raeGTZZL3OV1rdPDkieSKaq26Ta2R4niaTbLmfcKxwiVp
 94MNqtuH1EsYghp1JzrGP5bIhLLee4qNs/VVm7poKe/2FePE6wqCxJp35Fk6ldWEcNQM
 ELHA==
X-Gm-Message-State: AAQBX9ftnN4gyUJSgrnJai3j8NQRS49JamHVpfdnIPZLYnFuQUM10JBk
 NWTBqjgQH4NSqCTaEdUyonSPrA==
X-Google-Smtp-Source: AKy350bL9wbHKt2KrSE3/MoUl32AQLqb5NmPuycASMptKKSidq/qiRGVi+Xuq3/9gp96rWyb4aGwcg==
X-Received: by 2002:a17:903:6c4:b0:1a6:523c:8583 with SMTP id
 kj4-20020a17090306c400b001a6523c8583mr1967808plb.68.1681175207750; 
 Mon, 10 Apr 2023 18:06:47 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 34/54] tcg: Widen helper_*_st[bw]_mmu val arguments
Date: Mon, 10 Apr 2023 18:04:52 -0700
Message-Id: <20230411010512.5375-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:51 -0000

While the old type was correct in the ideal sense,
some ABIs require the argument to be zero-extended.
Using uint32_t for all such values is a decent compromise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h | 10 +++++++---
 accel/tcg/cputlb.c     |  6 +++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 2ba22bd5fe..f79bb4ef0c 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -55,15 +55,19 @@ tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
 tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr);
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+/*
+ * Value extended to at least uint32_t, so that some abis do not require
+ * zero-extension from uint8_t or uint16_t.
+ */
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..665c41fc12 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2503,7 +2503,7 @@ full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_UB);
 }
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr)
 {
     full_stb_mmu(env, addr, val, oi, retaddr);
@@ -2516,7 +2516,7 @@ static void full_le_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_LEUW);
 }
 
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_le_stw_mmu(env, addr, val, oi, retaddr);
@@ -2529,7 +2529,7 @@ static void full_be_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_BEUW);
 }
 
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_be_stw_mmu(env, addr, val, oi, retaddr);
-- 
2.34.1



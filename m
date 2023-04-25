Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOQD-0002Ck-7V
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQC-0002AM-IR
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:33:52 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQ1-0004Z1-5h
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:33:52 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so26819842e87.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451219; x=1685043219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
 b=CsdamwVkbiauTYrARPNTLgxeIzdGS9bbIrRj2Ssr4tNCNn64tAWiTz64w4rbc2fGEi
 f8UXww4tGqehxaOxA8ttjIUnLSSEZv+6nlYhwh5CyKJh4e126cRgugXhy3lZIthWsNy3
 TgDK7l6SMoUV+ahKbJ4FyZl8AmemaMaVUCId/VkZO9EJ4sIN9IzjTDHgJgey3O7fbPXi
 2J2yeL48r6tzO0JKlMXzsFAO7MPUSsPBjZ5P74eHZEMrUb5d9OZaC7nABHp+BgkMY4j8
 TuLvtBJ2k20eYdjyUTdFEHXAk8rgQb+9wrq6KV9Ri+AWFnZO8H2WN+3sNxmHU3pEcsCn
 c18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451219; x=1685043219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
 b=hJovLpXY7BGi4DC4vkbIv8K/6uPQ2fNXwdMB0rbj0FmAA2w1kKgID+cxkROSvjJunW
 96Oe7DlHk2TCFfnnILNIQcCS9kDaKvRHjPN/8s3n9+2Bf5B2js3zf1azICneRkO6B/nd
 5XcpaVOBwu4qDl/TFTkq/Yl60uP6LFI2pQu0GLfIi4AAtpDDy0yAdjd62NnsX738cevF
 xel7Tv+8otcD/MpOqdMHUZ8UD6QVgrvgws01Mt8OV4Jud9WUIRjliLTBedEuCNbTcn/7
 FvLxi+th17sOAt05DZh1GKljMwK/j0VKtSdtRtU9vdNcR+Ujch3pG4ZEMvmZRBkBHhh2
 2JTg==
X-Gm-Message-State: AAQBX9e8J3NldWAWRCJX/6CWno3nv/kiLi5YarY2pu99GjFw8lBrZdYC
 WpQov3nFAP1R6NVc5chXBYqL0JdYq95dDE44e8j+tw==
X-Google-Smtp-Source: AKy350YP/lnqkWR7A37v3dMZwnSiqBMvNO3cmNcvjR+ZPVIM+3aUPCAFt28kJpvm19at1vvM34vbUw==
X-Received: by 2002:a2e:9b87:0:b0:2aa:4550:9169 with SMTP id
 z7-20020a2e9b87000000b002aa45509169mr3649048lji.20.1682451219309; 
 Tue, 25 Apr 2023 12:33:39 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:33:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 11/57] tcg/tci: Use helper_{ld,st}*_mmu for user-only
Date: Tue, 25 Apr 2023 20:31:00 +0100
Message-Id: <20230425193146.2106111-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:33:52 -0000

We can now fold these two pieces of code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 89 -------------------------------------------------------
 1 file changed, 89 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5bde2e1f2e..15f2f8c463 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -292,7 +292,6 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
-#ifdef CONFIG_SOFTMMU
     switch (mop & MO_SSIZE) {
     case MO_UB:
         return helper_ldub_mmu(env, taddr, oi, ra);
@@ -311,58 +310,6 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     default:
         g_assert_not_reached();
     }
-#else
-    void *haddr = g2h(env_cpu(env), taddr);
-    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
-    uint64_t ret;
-
-    set_helper_retaddr(ra);
-    if (taddr & a_mask) {
-        helper_unaligned_ld(env, taddr);
-    }
-    switch (mop & (MO_BSWAP | MO_SSIZE)) {
-    case MO_UB:
-        ret = ldub_p(haddr);
-        break;
-    case MO_SB:
-        ret = ldsb_p(haddr);
-        break;
-    case MO_LEUW:
-        ret = lduw_le_p(haddr);
-        break;
-    case MO_LESW:
-        ret = ldsw_le_p(haddr);
-        break;
-    case MO_LEUL:
-        ret = (uint32_t)ldl_le_p(haddr);
-        break;
-    case MO_LESL:
-        ret = (int32_t)ldl_le_p(haddr);
-        break;
-    case MO_LEUQ:
-        ret = ldq_le_p(haddr);
-        break;
-    case MO_BEUW:
-        ret = lduw_be_p(haddr);
-        break;
-    case MO_BESW:
-        ret = ldsw_be_p(haddr);
-        break;
-    case MO_BEUL:
-        ret = (uint32_t)ldl_be_p(haddr);
-        break;
-    case MO_BESL:
-        ret = (int32_t)ldl_be_p(haddr);
-        break;
-    case MO_BEUQ:
-        ret = ldq_be_p(haddr);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    clear_helper_retaddr();
-    return ret;
-#endif
 }
 
 static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
@@ -371,7 +318,6 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
-#ifdef CONFIG_SOFTMMU
     switch (mop & MO_SIZE) {
     case MO_UB:
         helper_stb_mmu(env, taddr, val, oi, ra);
@@ -388,41 +334,6 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     default:
         g_assert_not_reached();
     }
-#else
-    void *haddr = g2h(env_cpu(env), taddr);
-    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
-
-    set_helper_retaddr(ra);
-    if (taddr & a_mask) {
-        helper_unaligned_st(env, taddr);
-    }
-    switch (mop & (MO_BSWAP | MO_SIZE)) {
-    case MO_UB:
-        stb_p(haddr, val);
-        break;
-    case MO_LEUW:
-        stw_le_p(haddr, val);
-        break;
-    case MO_LEUL:
-        stl_le_p(haddr, val);
-        break;
-    case MO_LEUQ:
-        stq_le_p(haddr, val);
-        break;
-    case MO_BEUW:
-        stw_be_p(haddr, val);
-        break;
-    case MO_BEUL:
-        stl_be_p(haddr, val);
-        break;
-    case MO_BEUQ:
-        stq_be_p(haddr, val);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    clear_helper_retaddr();
-#endif
 }
 
 #if TCG_TARGET_REG_BITS == 64
-- 
2.34.1



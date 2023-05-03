Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6aa-0007OG-08
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aF-0005ND-5V
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zv-0005fK-L6
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:24 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1950f569eso30008335e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097626; x=1685689626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
 b=vtLNHKej1AzcOUVp1vynR2qHc4G9/A0iKxMoBgZ+HEJ7vpfwyeKWxExBJ7XLfE1DMx
 ORziHduyMmZH00l4nuSlJtv0QFYhdL4ekVd48KXyRqBbzvMgku08fNJaFUqsV/xfZzEP
 N/RThaTTkhKUxu0iQBKlQwucNPG1YNb3idySmGvgeUbeaLMB4vv3QgEDYbX6dgkHnjoe
 /oLjR0eELxjJhhcV1r3MnxydusE7EdJiCkZaUG1B1cU3MKJWYFQJywMyq0lOYAf2jGuT
 eRiZucIVnw+HHcIOJi7NRzZCJkrxJsFHgG34UHqHMnpe8QAf8Bt+SlCcthFJUrYLBgMY
 7IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097626; x=1685689626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
 b=l6ccJQY99BLW0Fe9/BdukMYAodeX3X08AEQcbF8xp/A9tFOEDBCyikWf8uvIPg8Fr8
 jbiLKgy/cXUZeRYj05fZd6UfEbJN2cEO4Z/iJd9EAj4MiwiKVkftjii30HqME3sBb6aF
 1L8r8RBvs1+/Oe6pSDzvgvzD5EgP2llcRSyo5MhkQo1GpwpW6zvc6tOJD93ZOlGAc993
 5v38nGE9bMt5adc4HaRpWD3F7OWuTn9w6N1eLplwxjoZK0jRUFCT5WWXhPT55FFGLWOu
 fRNpqEhpm4aDIRSa1PFIlVkXPj4bIHOwKeL6E+f9XUDhmbSWm63ZI0DceXCM+cynNpx1
 MU5Q==
X-Gm-Message-State: AC+VfDzJraE7rsqDUtSyg436/YMa6+kXDvyD0GoCuaKVXMSBURhw8b42
 FIa3OT1bxGHe2ZjdDPqAXVVK7w==
X-Google-Smtp-Source: ACHHUZ6PIM2sm+crCggaBCLd0Gkdm+kEEvVuplnIHkAl4rSt/Amdc9RimrDEHXU19k3jM/rlIUYZEQ==
X-Received: by 2002:a05:600c:2309:b0:3f1:72e3:576b with SMTP id
 9-20020a05600c230900b003f172e3576bmr13946918wmo.26.1683097626139; 
 Wed, 03 May 2023 00:07:06 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 11/57] tcg/tci: Use helper_{ld,st}*_mmu for user-only
Date: Wed,  3 May 2023 08:06:10 +0100
Message-Id: <20230503070656.1746170-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:07:27 -0000

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



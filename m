Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C80C2BD09
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 03:30:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sRO0P-0000BV-Jw; Tue, 09 Jul 2024 23:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0O-00006e-Iw
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2024 23:28:32 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0G-0003lF-7F
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2024 23:28:32 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7035c367c4cso2994202a34.2
 for <qemu-riscv@nongnu.org>; Tue, 09 Jul 2024 20:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582102; x=1721186902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jbXp+ktkX7+TZy4xaNziEFN/kKK08frm4LETYQOrf8=;
 b=KR2kA/WF5tqWitx/+XeXRxgxgehrHoLEAJzDmvnv0E1aLxFD9wVS/InXW7I5wiY128
 UO2IuEYc1Bev3rBBgkMwhkofk/5LM429h1yikY9SJlQDibNgACyBGOof8dPWDRT4XOlH
 C0zBelcGyHDZIQgRs9NeHon+WySszWgCFq/dA8gjkbFeMQiAGbw8c09dX+Nw4ox2C+ZB
 x3gBRzTPlkUCnIM/ir9rrDrHhL8TAkLpHTEM0eqHU3jBYGXdvoYSI+9oRr9L1f6yRWuY
 rWvpT/bYyw2fwud5EaH6IoqD12ZFASec6woJ/z4mvp1dwFUV0vi3SJGRS+NZVCKLVX9Y
 XEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582102; x=1721186902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jbXp+ktkX7+TZy4xaNziEFN/kKK08frm4LETYQOrf8=;
 b=mwQQSpkPA+2dc1Pyh8DGE3RaE5dvrCtfqkaaCtobYpZBH9lnDIeX04oaX37PoA7shQ
 G/JeNIwfClqt7NoO0Hlv+M6E6mYv/ygPXALQSiTmIXMYYIky9RHv8Av3EfgLWwxHpzQE
 l9k+80wiPaHiXyFAc8S8+xc42b9Cb83/UHPQyIt41y7zWUMloip3xzOxfR3mxzAEVKKW
 G14iVJabroAq+WoIT78b66NtI5ep1L2wO6PAHRw2fPznm7mU9CAxnUYLp+N9tw5uA2dZ
 To+GwLuKh+ADrzxFFTxOD73rFg6Ij6wLIOo8YEyaDbdAMkg7egQEZgurtFvnjkLHm75t
 XzQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBE6+lg2KLyDz0T9J8okLVVOlSCL6BPFkbvjzh+QYSRv4OkRb/R8+xmNbYuyrny2uCKGWdJ3MqcY5UVrxOXDP2uHKTqx4=
X-Gm-Message-State: AOJu0Yx93il6GvhUdIQu++xI3KfvE29+eI9NuEomEEeMr5A54dpyu2d/
 rffUABDbY2DbGSP8WJcVvoNXUigWIao5p+eXe5pNG+sP0NwKLlXHOZYrtVfNMQw=
X-Google-Smtp-Source: AGHT+IE8sHnOlG6QtYObUSh9HAYbGPwGfS2WbQEKlIH7MkmRPO41H7Ta2Mxo70aoMF7YCgU8bGPSKg==
X-Received: by 2002:a05:6830:1e75:b0:703:7775:c0cb with SMTP id
 46e09a7af769-7037775c2c7mr4193125a34.31.1720582102257; 
 Tue, 09 Jul 2024 20:28:22 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 06/13] target/ppc: Hoist dcbz_size out of dcbz_common
Date: Tue,  9 Jul 2024 20:28:07 -0700
Message-ID: <20240710032814.104643-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710032814.104643-1-richard.henderson@linaro.org>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The 970 logic does not apply to dcbzep, which is an e500 insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mem_helper.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 361fd72226..5067919ff8 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -271,22 +271,12 @@ void helper_stsw(CPUPPCState *env, target_ulong addr, uint32_t nb,
 }
 
 static void dcbz_common(CPUPPCState *env, target_ulong addr,
-                        uint32_t opcode, int mmu_idx, uintptr_t retaddr)
+                        int dcbz_size, int mmu_idx, uintptr_t retaddr)
 {
-    target_ulong mask, dcbz_size = env->dcache_line_size;
-    uint32_t i;
+    target_ulong mask = ~(target_ulong)(dcbz_size - 1);
     void *haddr;
 
-#if defined(TARGET_PPC64)
-    /* Check for dcbz vs dcbzl on 970 */
-    if (env->excp_model == POWERPC_EXCP_970 &&
-        !(opcode & 0x00200000) && ((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
-        dcbz_size = 32;
-    }
-#endif
-
     /* Align address */
-    mask = ~(dcbz_size - 1);
     addr &= mask;
 
     /* Check reservation */
@@ -300,7 +290,7 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
         memset(haddr, 0, dcbz_size);
     } else {
         /* Slow path */
-        for (i = 0; i < dcbz_size; i += 8) {
+        for (int i = 0; i < dcbz_size; i += 8) {
             cpu_stq_mmuidx_ra(env, addr + i, 0, mmu_idx, retaddr);
         }
     }
@@ -308,12 +298,22 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
 
 void helper_dcbz(CPUPPCState *env, target_ulong addr, uint32_t opcode)
 {
-    dcbz_common(env, addr, opcode, ppc_env_mmu_index(env, false), GETPC());
+    int dcbz_size = env->dcache_line_size;
+
+#if defined(TARGET_PPC64)
+    /* Check for dcbz vs dcbzl on 970 */
+    if (env->excp_model == POWERPC_EXCP_970 &&
+        !(opcode & 0x00200000) && ((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
+        dcbz_size = 32;
+    }
+#endif
+
+    dcbz_common(env, addr, dcbz_size, ppc_env_mmu_index(env, false), GETPC());
 }
 
 void helper_dcbzep(CPUPPCState *env, target_ulong addr, uint32_t opcode)
 {
-    dcbz_common(env, addr, opcode, PPC_TLB_EPID_STORE, GETPC());
+    dcbz_common(env, addr, env->dcache_line_size, PPC_TLB_EPID_STORE, GETPC());
 }
 
 void helper_icbi(CPUPPCState *env, target_ulong addr)
-- 
2.43.0



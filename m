Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ECAC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:26:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0L9G-00061e-D2; Tue, 07 Nov 2023 07:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9C-0005rC-FL
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:25:34 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8v-0004uD-Gu
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:25:34 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40839652b97so41812935e9.3
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 04:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359915; x=1699964715; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zKkOBDyOAp9TL8xTunrffYZIxVubjYo+GnkmnNkOpdA=;
 b=ZTIHENBM/KQJYWsX/liHxQ9uY4/U4ClThRUKcLxQUIg2+JErQ4bWleGym1dQMVygjx
 ARPhBZ5wJ2oSChGdhmsdqkNc9O0peebw4BWEfpS+N9QtUG3EG3+Q82fQOthx3dw8fXzl
 NbguP2mxCTYoEe+mfvvJBsBolnsMtTxaw1vJxs9w9V1xuwtm/ccFIIx/2KE2Ho5L0S0T
 fC1mNq6ctW5vGGxo6Hxe2cTNLD6HBmFsrvtP2gnjMiPih76/wHYEKq5Ggyq/oWELUixe
 EIDhGZm+eNBq77Wkx5RNBs8g1mTaWSB9bkZzy7K8gSHZszraa+yQjRrk85Vk8bQGU+qi
 0ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359915; x=1699964715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zKkOBDyOAp9TL8xTunrffYZIxVubjYo+GnkmnNkOpdA=;
 b=HiaQ3m6deYkVB9Yr3lSB7QpWfppVXJRK7usgBxFax7lcdMouoe4oSThtYmNEPN19nN
 DLZdV89jW5KrPFcyKdyr7of5YfrJn7NX2DabFsjCsHbT0jKA44qWWewyhYRWq2K7EBTe
 yDxaE4vcEPETWTmVteuX2+ISp9jzXp0UZeG+BBMcrZz29yJfMA2MPPbsEjFFMlOYmpZy
 SvqhmXxjHCwtPVHOJc6d3GXfWMfpNqOfeE52znt2JrYcnhLs2QllhIep2TRRgKctWsI7
 g3X+zPjoRBHPbl8rpwLvjfblnMKqq7BWkV/vr80ZdZmk2t/A026DhIT/moDGj1TDW5vx
 k9zQ==
X-Gm-Message-State: AOJu0YyRmyUULBbmikXz80T7W7VFnUQ1VPQG9J0KLwYlcPKkNVQaJdly
 aNf4YDp4qtu8f2upqI/DIn/j5g==
X-Google-Smtp-Source: AGHT+IFbaxYcYNM0ZU65MY1VF7BelqSH+hfquvb4WEYSposLfnXLTRVtK/uqhNv1ogRv8cGF/noFCg==
X-Received: by 2002:a1c:6a05:0:b0:407:8459:2ef9 with SMTP id
 f5-20020a1c6a05000000b0040784592ef9mr2200660wmc.21.1699359915606; 
 Tue, 07 Nov 2023 04:25:15 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c419600b00401d8181f8bsm15066426wmh.25.2023.11.07.04.25.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 40/75] target/ppc: Move powerpc_mmu_t definition to 'cpu.h'
Date: Tue,  7 Nov 2023 13:24:30 +0100
Message-ID: <20231107122442.58674-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The powerpc_mmu_t definition is only used by target/ppc/, no need
to expose it. Restrict it by moving it to "target/ppc/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231013125630.95116-7-philmd@linaro.org>
---
 target/ppc/cpu-qom.h | 43 -------------------------------------------
 target/ppc/cpu.h     | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index acc5f1a1dc..c35374e15f 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -35,49 +35,6 @@ OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
 #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
 
-/*****************************************************************************/
-/* MMU model                                                                 */
-typedef enum powerpc_mmu_t powerpc_mmu_t;
-enum powerpc_mmu_t {
-    POWERPC_MMU_UNKNOWN    = 0x00000000,
-    /* Standard 32 bits PowerPC MMU                            */
-    POWERPC_MMU_32B        = 0x00000001,
-    /* PowerPC 6xx MMU with software TLB                       */
-    POWERPC_MMU_SOFT_6xx   = 0x00000002,
-    /*
-     * PowerPC 74xx MMU with software TLB (this has been
-     * disabled, see git history for more information.
-     * keywords: tlbld tlbli TLBMISS PTEHI PTELO)
-     */
-    POWERPC_MMU_SOFT_74xx  = 0x00000003,
-    /* PowerPC 4xx MMU with software TLB                       */
-    POWERPC_MMU_SOFT_4xx   = 0x00000004,
-    /* PowerPC MMU in real mode only                           */
-    POWERPC_MMU_REAL       = 0x00000006,
-    /* Freescale MPC8xx MMU model                              */
-    POWERPC_MMU_MPC8xx     = 0x00000007,
-    /* BookE MMU model                                         */
-    POWERPC_MMU_BOOKE      = 0x00000008,
-    /* BookE 2.06 MMU model                                    */
-    POWERPC_MMU_BOOKE206   = 0x00000009,
-#define POWERPC_MMU_64       0x00010000
-    /* 64 bits PowerPC MMU                                     */
-    POWERPC_MMU_64B        = POWERPC_MMU_64 | 0x00000001,
-    /* Architecture 2.03 and later (has LPCR) */
-    POWERPC_MMU_2_03       = POWERPC_MMU_64 | 0x00000002,
-    /* Architecture 2.06 variant                               */
-    POWERPC_MMU_2_06       = POWERPC_MMU_64 | 0x00000003,
-    /* Architecture 2.07 variant                               */
-    POWERPC_MMU_2_07       = POWERPC_MMU_64 | 0x00000004,
-    /* Architecture 3.00 variant                               */
-    POWERPC_MMU_3_00       = POWERPC_MMU_64 | 0x00000005,
-};
-
-static inline bool mmu_is_64bit(powerpc_mmu_t mmu_model)
-{
-    return mmu_model & POWERPC_MMU_64;
-}
-
 /*****************************************************************************/
 /* Input pins model                                                          */
 typedef enum powerpc_input_t powerpc_input_t;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 94a804a605..d859c45a2e 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -219,6 +219,48 @@ typedef enum powerpc_excp_t {
     POWERPC_EXCP_POWER10,
 } powerpc_excp_t;
 
+/*****************************************************************************/
+/* MMU model                                                                 */
+typedef enum powerpc_mmu_t {
+    POWERPC_MMU_UNKNOWN    = 0x00000000,
+    /* Standard 32 bits PowerPC MMU                            */
+    POWERPC_MMU_32B        = 0x00000001,
+    /* PowerPC 6xx MMU with software TLB                       */
+    POWERPC_MMU_SOFT_6xx   = 0x00000002,
+    /*
+     * PowerPC 74xx MMU with software TLB (this has been
+     * disabled, see git history for more information.
+     * keywords: tlbld tlbli TLBMISS PTEHI PTELO)
+     */
+    POWERPC_MMU_SOFT_74xx  = 0x00000003,
+    /* PowerPC 4xx MMU with software TLB                       */
+    POWERPC_MMU_SOFT_4xx   = 0x00000004,
+    /* PowerPC MMU in real mode only                           */
+    POWERPC_MMU_REAL       = 0x00000006,
+    /* Freescale MPC8xx MMU model                              */
+    POWERPC_MMU_MPC8xx     = 0x00000007,
+    /* BookE MMU model                                         */
+    POWERPC_MMU_BOOKE      = 0x00000008,
+    /* BookE 2.06 MMU model                                    */
+    POWERPC_MMU_BOOKE206   = 0x00000009,
+#define POWERPC_MMU_64       0x00010000
+    /* 64 bits PowerPC MMU                                     */
+    POWERPC_MMU_64B        = POWERPC_MMU_64 | 0x00000001,
+    /* Architecture 2.03 and later (has LPCR) */
+    POWERPC_MMU_2_03       = POWERPC_MMU_64 | 0x00000002,
+    /* Architecture 2.06 variant                               */
+    POWERPC_MMU_2_06       = POWERPC_MMU_64 | 0x00000003,
+    /* Architecture 2.07 variant                               */
+    POWERPC_MMU_2_07       = POWERPC_MMU_64 | 0x00000004,
+    /* Architecture 3.00 variant                               */
+    POWERPC_MMU_3_00       = POWERPC_MMU_64 | 0x00000005,
+} powerpc_mmu_t;
+
+static inline bool mmu_is_64bit(powerpc_mmu_t mmu_model)
+{
+    return mmu_model & POWERPC_MMU_64;
+}
+
 #define PPC_INPUT(env) ((env)->bus_model)
 
 /*****************************************************************************/
-- 
2.41.0



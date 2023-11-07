Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC855C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:26:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0L9B-0005qj-NP; Tue, 07 Nov 2023 07:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L99-0005pt-UU
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:25:31 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8p-0004sj-CH
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:25:31 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso40813215e9.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 04:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359909; x=1699964709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UxnI5l2WrvXzGWFNPDGJXP6PFry6juDuplDEP4dg9mo=;
 b=uvFaXAlbTD379AqDpzf2RuvSSg/B3IUDqFXxKNUMDaHwUKROqW5G6RBHIJF8Y6pY6u
 RwsXoJflvDktMUYpGZX1aocKFVVG8f9gsxt8covcgQ6XwzP019l2482uQ2Giwbm4d26Q
 ej4joL7l23BIcufuSkxaHM6RES0l1pBVr8vxK9jrcsuQzWvodFKip4EsmexvOppsuZZw
 +PFoSiXZV3pJE8DahoR+V/QBvdDnkNR0T3s/RSuoz8E+n7flkzUuYmNIchxQWCHTqks5
 3TNdTDrh4H0kTuphjqY+qkfenlVbU2ZpSp3G97Ts8IIH3qvlc8iZAtEZ0vjOZ3MNMIpJ
 tSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359909; x=1699964709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxnI5l2WrvXzGWFNPDGJXP6PFry6juDuplDEP4dg9mo=;
 b=Lm47mr0wOVNJBoTO8/DW2405ZLRVQ9fVyh77c8v8+Ap3ZE88K8+RvMzOemHXe2wL5R
 lEB/4EqRqDqy2p2vXITMOmFb3s4C3e38q19xwL1Sh12nTHstNwl34GcvoItVU6nPzWuu
 6eSVXC75K5Yv4aud/BXYe5K5OdAR27wEQHSCSjKnc2ptveDgxkWmIyt08330hM9u8LI7
 csM2++sXIOudetiggv8v1NLGyF80KxTxu3TBexPodN3iN3dBQuK6dWKh1poeEDKVfbBd
 jDriKs4UWoJaRlNeYsvjURARhKUdZvwBI+PrA3jV7Cn+v5h0S2KMGPYxVSgTYHKnTpab
 WgKg==
X-Gm-Message-State: AOJu0YwWnnvbHPurZ9uBrmm2P8G3eS3ghYA5LUoWViiTgWDXvleTjtRB
 DJ8Hw6mylCf+RkpHA0WTNI11GA==
X-Google-Smtp-Source: AGHT+IHAYqPOg5FGtEVduPllyAbcpE8kf7ubxeWXhZATc4/x4lpIfC0WJaAg2fx7uxTOFEg7R9JsmA==
X-Received: by 2002:adf:f1d0:0:b0:32d:84e8:eef2 with SMTP id
 z16-20020adff1d0000000b0032d84e8eef2mr22297913wro.33.1699359908952; 
 Tue, 07 Nov 2023 04:25:08 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a5d49cb000000b003248a490e3asm2215974wrs.39.2023.11.07.04.25.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 39/75] target/ppc: Move powerpc_excp_t definition to 'cpu.h'
Date: Tue,  7 Nov 2023 13:24:29 +0100
Message-ID: <20231107122442.58674-5-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The powerpc_excp_t definition is only used by target/ppc/, no need
to expose it. Restrict it by moving it to "target/ppc/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231013125630.95116-6-philmd@linaro.org>
---
 target/ppc/cpu-qom.h | 29 -----------------------------
 target/ppc/cpu.h     | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 65a640470f..acc5f1a1dc 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -78,35 +78,6 @@ static inline bool mmu_is_64bit(powerpc_mmu_t mmu_model)
     return mmu_model & POWERPC_MMU_64;
 }
 
-/*****************************************************************************/
-/* Exception model                                                           */
-typedef enum powerpc_excp_t powerpc_excp_t;
-enum powerpc_excp_t {
-    POWERPC_EXCP_UNKNOWN   = 0,
-    /* Standard PowerPC exception model */
-    POWERPC_EXCP_STD,
-    /* PowerPC 40x exception model      */
-    POWERPC_EXCP_40x,
-    /* PowerPC 603/604/G2 exception model */
-    POWERPC_EXCP_6xx,
-    /* PowerPC 7xx exception model      */
-    POWERPC_EXCP_7xx,
-    /* PowerPC 74xx exception model     */
-    POWERPC_EXCP_74xx,
-    /* BookE exception model            */
-    POWERPC_EXCP_BOOKE,
-    /* PowerPC 970 exception model      */
-    POWERPC_EXCP_970,
-    /* POWER7 exception model           */
-    POWERPC_EXCP_POWER7,
-    /* POWER8 exception model           */
-    POWERPC_EXCP_POWER8,
-    /* POWER9 exception model           */
-    POWERPC_EXCP_POWER9,
-    /* POWER10 exception model           */
-    POWERPC_EXCP_POWER10,
-};
-
 /*****************************************************************************/
 /* Input pins model                                                          */
 typedef enum powerpc_input_t powerpc_input_t;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 55330d9319..94a804a605 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -192,6 +192,33 @@ enum {
     POWERPC_EXCP_TRAP          = 0x40,
 };
 
+/* Exception model                                                           */
+typedef enum powerpc_excp_t {
+    POWERPC_EXCP_UNKNOWN   = 0,
+    /* Standard PowerPC exception model */
+    POWERPC_EXCP_STD,
+    /* PowerPC 40x exception model      */
+    POWERPC_EXCP_40x,
+    /* PowerPC 603/604/G2 exception model */
+    POWERPC_EXCP_6xx,
+    /* PowerPC 7xx exception model      */
+    POWERPC_EXCP_7xx,
+    /* PowerPC 74xx exception model     */
+    POWERPC_EXCP_74xx,
+    /* BookE exception model            */
+    POWERPC_EXCP_BOOKE,
+    /* PowerPC 970 exception model      */
+    POWERPC_EXCP_970,
+    /* POWER7 exception model           */
+    POWERPC_EXCP_POWER7,
+    /* POWER8 exception model           */
+    POWERPC_EXCP_POWER8,
+    /* POWER9 exception model           */
+    POWERPC_EXCP_POWER9,
+    /* POWER10 exception model           */
+    POWERPC_EXCP_POWER10,
+} powerpc_excp_t;
+
 #define PPC_INPUT(env) ((env)->bus_model)
 
 /*****************************************************************************/
-- 
2.41.0



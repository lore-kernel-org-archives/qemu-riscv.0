Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA376CA0EEB
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:08:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upTIi-0003dh-Rj; Fri, 22 Aug 2025 11:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGx-0001v8-Kr
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:02:02 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGb-000515-8n
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:42 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-245f2a8fa81so24033575ad.0
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 08:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874876; x=1756479676; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gb/ReADUnlzi9AcO287uTsxkJfdtQt0rAfW8KkqAbww=;
 b=Io/P8RtVpGcKE5Oy7irKT/aUZnjMnXe8NgEaiS87VsDTl5dPHSMh9o1gIgLNmLA5GZ
 1R99uNUq/9J2edWE79PoAmOI9oPnMfN8oHcmcRw2tvAKYBiaiUKt9h4mtmnPU599iA3C
 1JrODcIj9pFTPJVhT34GUQacJRxRHfMfgAbkuO2v4r4fyj2FF1kFr+MupStTzMe3G76q
 DIlQd4lbhiekqL9fJzG5Uian4Xo6kF6w4Us3GUNQ3SLnaEuaF64dTtP58x795FlBvGhH
 F60NvlmpoDqWEKUjg1CbB4pURn1CU6fenmih1zUKJ/P+LSIIjeY21bvSVewb1XL84shg
 49dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874876; x=1756479676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gb/ReADUnlzi9AcO287uTsxkJfdtQt0rAfW8KkqAbww=;
 b=aAmYsQn2GnwUwJEHnp/FW5qfRAlHUlm0IBIyNHzupnXZ4bnez3/G/h5uyRcVBSDQ6V
 /Go5p0paJME0xG4Z/fbvgAhzA03y6YIf4FSgIJ97kglSLhoNZNNdYLF2jeA7N9Deex7p
 jjjNFjs16FRQ6yio9rqUMgtX9czhN/Ogw2RJ71K1Kwks/62ISUyzSUUEVf7KQ+hoAiT3
 n7u4hbR58cZFSnE5gAgtg2xlXYfjHs8LIfZYSG4PKnsJ+6wk+kiId7Z1/56F1GKHXFT1
 yjSEingpF3puMaJz1MpwM4Pm0pjUd+MRNn735aDA8Iuw5C7Ors6rD6fUBDL45xcZ5c3Z
 JFfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVidBSzo6XRgTDMJBUkkNE3ztGnjINZEXPhnepeszDPAcM6w5TA6kbiHnX0lpiT6KTUeTgqRckpaT4s@nongnu.org
X-Gm-Message-State: AOJu0Yye5bkuhYtVNhsLYv+x6jCjAhwcserBVOoKemPY7tI/G3yCQVBx
 rXC/zQSJlE15h2R9Y+L7WzuLaehwWdnAspQj6fdQ8UzgMCVDu94KKjFwrdHQSwLMK+k=
X-Gm-Gg: ASbGncuFMeolm6Ii7KdbBTKnXbo/ZU7FhEq2WifFORjMzAOZWCd8GCx5cV902Fvsy5R
 hs6bDjJeg26E70N6M1x8Q89nGQeYomMqDafqwCmQh0wEQyBz1t1hhXctkWrsy8YjF5I8yCOSWou
 vM7G1W9pIw3/CIj1xRqzDfD0eDb57mv18wiLqHnwAvj23vERmIZGdESCst/CgaxP3SI3roW5fJY
 NGUugsiTHkexdCQO05qmCrTXYPtZOmzJP7g6sHaNcelYO5fLzfr6LlXu5tVGKyUxZf1/jf+OS7u
 Y9nfK1UVXzXlB5T2kyvn7mgDIixFIPXnA4RgAIe/fAKunJXGCIvN5RlSQT+xhF8RJ542LJd8IDv
 +uNfOybHUgeMua9Bu5krc2sqYApakhhYaFjKB7Hlm5In0dpAN1LFlew==
X-Google-Smtp-Source: AGHT+IHsJ9yB9dRQdCmFBOAjhp8RpEvxUs6RA0y/QSfe43hNfYYQWqFlYP+oz7KVAW2515DKr7GLGg==
X-Received: by 2002:a17:902:cec2:b0:244:9912:8353 with SMTP id
 d9443c01a7336-2463292c8a8mr46943705ad.6.1755874875796; 
 Fri, 22 Aug 2025 08:01:15 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:15 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 09/12] semihosting/arm-compat-semi: replace target_ulong
 with vaddr
Date: Fri, 22 Aug 2025 08:00:55 -0700
Message-ID: <20250822150058.18692-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index c03096b253d..f593239cc9a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -123,7 +123,7 @@ static GuestFD console_out_gf;
  */
 
 typedef struct LayoutInfo {
-    target_ulong rambase;
+    vaddr rambase;
     size_t ramsize;
     hwaddr heapbase;
     hwaddr heaplimit;
@@ -214,7 +214,7 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
  * global, and we assume that the guest takes care of avoiding any races.
  */
 #ifndef CONFIG_USER_ONLY
-static target_ulong syscall_err;
+static uint64_t syscall_err;
 
 #include "semihosting/uaccess.h"
 #endif
@@ -260,8 +260,8 @@ static void common_semi_rw_cb(CPUState *cs, uint64_t ret, int err)
 {
     /* Recover the original length from the third argument. */
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
-    target_ulong args = common_semi_arg(cs, 1);
-    target_ulong arg2;
+    uint64_t args = common_semi_arg(cs, 1);
+    uint64_t arg2;
     GET_ARG(2);
 
     if (err) {
@@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
  * is defined by GDB's remote protocol and is not target-specific.)
  * We put this on the guest's stack just below SP.
  */
-static target_ulong common_semi_flen_buf(CPUState *cs)
+static uint64_t common_semi_flen_buf(CPUState *cs)
 {
-    target_ulong sp = common_semi_stack_bottom(cs);
+    vaddr sp = common_semi_stack_bottom(cs);
     return sp - 64;
 }
 
@@ -389,9 +389,9 @@ void semihosting_arm_compatible_init(void)
 void do_common_semihosting(CPUState *cs)
 {
     CPUArchState *env = cpu_env(cs);
-    target_ulong args;
-    target_ulong arg0, arg1, arg2, arg3;
-    target_ulong ul_ret;
+    uint64_t args;
+    uint64_t arg0, arg1, arg2, arg3;
+    uint64_t ul_ret;
     char * s;
     int nr;
     int64_t elapsed;
@@ -462,7 +462,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_WRITEC:
         /*
-         * FIXME: the byte to be written is in a target_ulong slot,
+         * FIXME: the byte to be written is in a uint64_t slot,
          * which means this is wrong for a big-endian guest.
          */
         semihost_sys_write_gf(cs, common_semi_dead_cb,
@@ -688,11 +688,11 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_HEAPINFO:
         {
-            target_ulong retvals[4];
+            uint64_t retvals[4];
             int i;
 #ifdef CONFIG_USER_ONLY
             TaskState *ts = get_task_state(cs);
-            target_ulong limit;
+            uint64_t limit;
 #else
             LayoutInfo info = common_semi_find_bases(cs);
 #endif
-- 
2.47.2



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B66E77184
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 09:10:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNTYA-0008QU-8m; Tue, 17 Dec 2024 04:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTY0-0008LN-TP
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:20 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tNTXy-0001Wv-34
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 04:07:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862b364538so2884040f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 17 Dec 2024 01:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734426435; x=1735031235;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ku01Gl3oK1QHidwQXXPkKJb4Kx7C9rCbPxgQWVg1Frw=;
 b=OBmpZirkXCghkoRdP6CbFqfS7qimetT5lI/HKpOmG76TUWocOgdbyAi7JykzIitu6P
 jA5QPnESomWz+c7gTbsD1MQD7i3XsK1Y5W23kbDRwWCsxEx5KPY4P4f2K83Rkw/OEak1
 NiJvUQh8SEraSIQeZzD0T8XN13yZ/hPZokN2MOlNi964Xa7iWgj8NyQeOOhVFBw+ioti
 z4MD36eOFbvA9D7jf+9UV9/dG8hKufQBcpQ+RveF79HmbH5JprF7v0bVNcswhf/z2Zqg
 G+ePGbsUdsY8Ui5w72z5iiUwIG5C56ZUQ3aK5YPA57KEBIHGj5t7CowkvqBifjGUTaC8
 e5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734426435; x=1735031235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ku01Gl3oK1QHidwQXXPkKJb4Kx7C9rCbPxgQWVg1Frw=;
 b=aevmijcwMj4MPf9/hL7Vari9a8qOZxMgtm7bExe3xlUa3J2n13p8AZyKEpsJJn4clf
 N4fRz+hBato/EeK6HYm6iMFM9pR0Hetj+H6ZqnzUUUO1YfsBGacRd1AucECSVX3+QzuL
 BS85vjEXo0Z5QwJC/swH1LWqTLcPTBS/NHjEYnFm37xNx9bA9X/Xd/dG7aK7bIcoDRJK
 xOng2LtQbmN+AL+6gbAzzN1imGTL7502h1kz2PvakKk0df/JiL8ofW5S6ggEaJMrCtHF
 AKGiimH/hFiPT9bDusOGhUzp52YRmHOJtLIxXTxnm0emD+oVFB9hZEXLzXRSnb4ZDcZh
 oPAQ==
X-Gm-Message-State: AOJu0Yxqb1wHJ63bIFVS4hn15OOjpRFhI9w2wFk+CYO5bjSiVStzQfXr
 2NcDAzHkU7LjH9ZvqxH73sQLCzPXY/tJKRY0/jWIhE+BzvW1DurtgtWWymGLmdFTbQh9pVv7/dD
 Z0ck=
X-Gm-Gg: ASbGnctv/EzJIKJBF6bixFJ9eCWQYyeWS1SZYZ9SZbR0hE5TiMUviyIZKSjpXMhwy5z
 uDbwv1D7CtJMSYevzad4sSHAA+8m+EEEWi11JIw1Rs+FLJjkUgXkrw8jQmDKOLAkGATLdDxR5aV
 trsd3Y4YTZf0XyKvIZytNp4vuqg0aEuf9oVr2IrytihR2Q6RSD0M7sw9LUoB0aOZES6wzSZDxnJ
 VUilQcV3wj5M4ENBE6D2t8L3I77/z0jMqxIvjMc4LwZ5t/AHxEuCRrRVw==
X-Google-Smtp-Source: AGHT+IHb++ky95JtqXq4a51KHbnaYMgLyAIy0nzqxPaxoYBDr39phpHDw28FfTU34NLRwxqK3eAP1Q==
X-Received: by 2002:adf:a3cd:0:b0:388:c61d:4415 with SMTP id
 ffacd0b85a97d-388db243d8fmr1573453f8f.18.1734426435454; 
 Tue, 17 Dec 2024 01:07:15 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046c46sm10704122f8f.71.2024.12.17.01.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 01:07:14 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 4/9] target/riscv: Implement Ssdbltrp exception handling
Date: Tue, 17 Dec 2024 10:07:00 +0100
Message-ID: <20241217090707.3511160-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217090707.3511160-1-cleger@rivosinc.com>
References: <20241217090707.3511160-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When the Ssdbltrp ISA extension is enabled, if a trap happens in S-mode
while SSTATUS.SDT isn't cleared, generate a double trap exception to
M-mode.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 42 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7a4aa235ce..cfb95eab14 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -296,7 +296,7 @@ static const char * const riscv_excp_names[] = {
     "load_page_fault",
     "reserved",
     "store_page_fault",
-    "reserved",
+    "double_trap",
     "reserved",
     "reserved",
     "reserved",
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b8acc11e65..e1244004b2 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -707,6 +707,7 @@ typedef enum RISCVException {
     RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
     RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
     RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
+    RISCV_EXCP_DOUBLE_TRAP = 0x10,
     RISCV_EXCP_SW_CHECK = 0x12, /* since: priv-1.13.0 */
     RISCV_EXCP_HW_ERR = 0x13, /* since: priv-1.13.0 */
     RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f284f94a04..06d5dc6a3d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1903,6 +1903,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool virt = env->virt_enabled;
     bool write_gva = false;
     bool always_storeamo = (env->excp_uw2 & RISCV_UW2_ALWAYS_STORE_AMO);
+    bool vsmode_exc;
     uint64_t s;
     int mode;
 
@@ -1917,6 +1918,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         !(env->mip & (1ULL << cause));
     bool vs_injected = env->hvip & (1ULL << cause) & env->hvien &&
         !(env->mip & (1ULL << cause));
+    bool smode_double_trap = false;
+    uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
     target_ulong tval = 0;
     target_ulong tinst = 0;
     target_ulong htval = 0;
@@ -2040,6 +2043,30 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     mode = env->priv <= PRV_S && cause < 64 &&
         (((deleg >> cause) & 1) || s_injected || vs_injected) ? PRV_S : PRV_M;
 
+    vsmode_exc = env->virt_enabled && (((hdeleg >> cause) & 1) || vs_injected);
+    /*
+     * Check double trap condition only if already in S-mode and targeting
+     * S-mode
+     */
+    if (cpu->cfg.ext_ssdbltrp && env->priv == PRV_S && mode == PRV_S) {
+        bool dte = (env->menvcfg & MENVCFG_DTE) != 0;
+        bool sdt = (env->mstatus & MSTATUS_SDT) != 0;
+        /* In VS or HS */
+        if (riscv_has_ext(env, RVH)) {
+            if (vsmode_exc) {
+                /* VS -> VS, use henvcfg instead of menvcfg*/
+                dte = (env->henvcfg & HENVCFG_DTE) != 0;
+            } else if (env->virt_enabled) {
+                /* VS -> HS, use mstatus_hs */
+                sdt = (env->mstatus_hs & MSTATUS_SDT) != 0;
+            }
+        }
+        smode_double_trap = dte && sdt;
+        if (smode_double_trap) {
+            mode = PRV_M;
+        }
+    }
+
     if (mode == PRV_S) {
         /* handle the trap in S-mode */
         /* save elp status */
@@ -2048,10 +2075,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
 
         if (riscv_has_ext(env, RVH)) {
-            uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
-
-            if (env->virt_enabled &&
-                (((hdeleg >> cause) & 1) || vs_injected)) {
+            if (vsmode_exc) {
                 /* Trap to VS mode */
                 /*
                  * See if we need to adjust cause. Yes if its VS mode interrupt
@@ -2084,6 +2108,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         s = set_field(s, MSTATUS_SPIE, get_field(s, MSTATUS_SIE));
         s = set_field(s, MSTATUS_SPP, env->priv);
         s = set_field(s, MSTATUS_SIE, 0);
+        if (riscv_env_smode_dbltrp_enabled(env, virt)) {
+            s = set_field(s, MSTATUS_SDT, 1);
+        }
         env->mstatus = s;
         sxlen = 16 << riscv_cpu_sxl(env);
         env->scause = cause | ((target_ulong)async << (sxlen - 1));
@@ -2137,9 +2164,14 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mstatus = s;
         mxlen = 16 << riscv_cpu_mxl(env);
         env->mcause = cause | ((target_ulong)async << (mxlen - 1));
+        if (smode_double_trap) {
+            env->mtval2 = env->mcause;
+            env->mcause = RISCV_EXCP_DOUBLE_TRAP;
+        } else {
+            env->mtval2 = mtval2;
+        }
         env->mepc = env->pc;
         env->mtval = tval;
-        env->mtval2 = mtval2;
         env->mtinst = tinst;
 
         /*
-- 
2.45.2



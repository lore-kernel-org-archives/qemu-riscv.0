Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D845DE77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 12:56:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWEYO-0005nO-CN; Fri, 10 Jan 2025 07:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tWEXc-0004Gu-FL
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 07:55:09 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tWEXZ-00010f-Ew
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 07:55:07 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso1588747f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 04:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736513701; x=1737118501;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ES38JNi2wkZtqIVUhzbnhhmRln9I5UNeXdmWAdv7Rig=;
 b=kI/GP5MhCNZBFmPf0o+RYhtOLwx7oyC+hMDH4NneZZ+izUfgrVUni6Nn84neskD9M4
 CqBKxr5+vFXCPxWgoHLLmNjtUtx4c7SCGcD29UsjfDKlKxB3CmQ4juAuFebuPnX0te9T
 +quISDgjGjUkvOc+Zx0zUCXfdJ0Mf6k/ZYBPaWWZvJbJtxNrXws+33GUWXD5xxSHEOca
 y0JQQUzz1r1hqdzacwAKn3+P9exK+T/SZGFFxQMolNcTgkYm7u0HXDWJoyCZgIy39Y0+
 6kQfiT0LEWVrqjBEac3HT2yGPKW+8XLSGpKirnCg/OJNKRoncy5M9Qm2lYjA7TR1setL
 kfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736513701; x=1737118501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ES38JNi2wkZtqIVUhzbnhhmRln9I5UNeXdmWAdv7Rig=;
 b=GAOW9bx8Ii7YUIVU8kx86k3DLEh1bMUojce69BXP6Cyiw+m6vbd26PtBBEjJDS0dJd
 2EzgV9vBdEcv+riy3ucetA92+ShrOWMuX8xGHesDHrff7d2LvSaeonfEVHYC+M0zgoyO
 PJIEpXnE/RMsOg2EB/oUBvo5yH4xUHHMIheMmYUJ89MLQJpUWarhIOqq5QtCn5UwyDHa
 TUPwxYCxbMnmcXsypfyqbV56qg9sAO6dMY6y+22bwrnGiGchr+Q1whFJwuOUfgec4CWN
 t3nRyUcWv9yFWX4+zk9iydtrCOzI9bUjSrj58SHLM8L8W0+LUCupWB/UHnDvg5JjvMJS
 Vetg==
X-Gm-Message-State: AOJu0YzSNxnPCsIqf25RtWgOSpr+wI1gJvvoFVmYHztjM+EFyoBfJEiK
 V/b5jQ89a1uNnNMgIpUvTPQSmZdg5khALyrLm2K94PwISHWvujtP0XtMbLV2n/55z7EeyQofk7x
 t
X-Gm-Gg: ASbGncsWy7t9YakXcqtbWOylJWx5CmUjdToLYM3rcNpzpamN9Q4UprgNW8Zv4jlbQLI
 PkGeb7/WF569dUdxWYReJQnOflf1rjYIoCSYqFrDz88fYYHmHbpPfvCJxXMQGfuKOV//XJwPQAA
 yIvGnVjiBh7tTbaoCFDo5NtcKZq4O141+9I7pg4dfi6TQKMix8qjFsDXcN+QqceXSkU3Qf0rJQr
 Fk2iAQm/ppQBDCeQAaB6C0khkHDgrYfsDTEZi1fXQL8WIyxifgNyKZqwg==
X-Google-Smtp-Source: AGHT+IE/oDlNRbH6/z977x5ubMgUKQE3gtDUP3U+sUOa8YXlbLiPXOiEWF6iiqWGVLYM+Sd89RlVFA==
X-Received: by 2002:a5d:6c6e:0:b0:385:d7f9:f16c with SMTP id
 ffacd0b85a97d-38a87356cd4mr9301025f8f.46.1736513700961; 
 Fri, 10 Jan 2025 04:55:00 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1c01sm4548921f8f.97.2025.01.10.04.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 04:55:00 -0800 (PST)
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
Subject: [PATCH v8 8/9] target/riscv: Implement Smdbltrp behavior
Date: Fri, 10 Jan 2025 13:54:39 +0100
Message-ID: <20250110125441.3208676-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110125441.3208676-1-cleger@rivosinc.com>
References: <20250110125441.3208676-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x431.google.com
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

When the Smsdbltrp ISA extension is enabled, if a trap happens while
MSTATUS.MDT is already set, it will trigger an abort or an NMI is the
Smrnmi extension is available.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 57 ++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 539ba327e7..e1dfc4ecbf 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1938,6 +1938,24 @@ static target_ulong promote_load_fault(target_ulong orig_cause)
     /* if no promotion, return original cause */
     return orig_cause;
 }
+
+static void riscv_do_nmi(CPURISCVState *env, target_ulong cause, bool virt)
+{
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPV, virt);
+    env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPP, env->priv);
+    env->mncause = cause;
+    env->mnepc = env->pc;
+    env->pc = env->rnmi_irqvec;
+
+    if (cpu_get_fcfien(env)) {
+        env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPELP, env->elp);
+    }
+
+    /* Trapping to M mode, virt is disabled */
+    riscv_cpu_set_mode(env, PRV_M, false);
+}
+
 /*
  * Handle Traps
  *
@@ -1977,22 +1995,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool nnmi_excep = false;
 
     if (cpu->cfg.ext_smrnmi && env->rnmip && async) {
-        env->mnstatus = set_field(env->mnstatus, MNSTATUS_NMIE, false);
-        env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPV,
-                                  env->virt_enabled);
-        env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPP,
-                                  env->priv);
-        env->mncause = cause | ((target_ulong)1U << (mxlen - 1));
-        env->mnepc = env->pc;
-        env->pc = env->rnmi_irqvec;
-
-        if (cpu_get_fcfien(env)) {
-            env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPELP, env->elp);
-        }
-
-        /* Trapping to M mode, virt is disabled */
-        riscv_cpu_set_mode(env, PRV_M, false);
-
+        riscv_do_nmi(env, cause | ((target_ulong)1U << (mxlen - 1)),
+                     env->virt_enabled);
         return;
     }
 
@@ -2204,11 +2208,32 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             /* Trapping to M mode, virt is disabled */
             virt = false;
         }
+        /*
+         * If the hart encounters an exception while executing in M-mode,
+         * with the mnstatus.NMIE bit clear, the program counter is set to
+         * the RNMI exception trap handler address.
+         */
+        nnmi_excep = cpu->cfg.ext_smrnmi &&
+                     !get_field(env->mnstatus, MNSTATUS_NMIE) &&
+                     !async;
 
         s = env->mstatus;
         s = set_field(s, MSTATUS_MPIE, get_field(s, MSTATUS_MIE));
         s = set_field(s, MSTATUS_MPP, env->priv);
         s = set_field(s, MSTATUS_MIE, 0);
+        if (cpu->cfg.ext_smdbltrp) {
+            if (env->mstatus & MSTATUS_MDT) {
+                assert(env->priv == PRV_M);
+                if (!cpu->cfg.ext_smrnmi || nnmi_excep) {
+                    cpu_abort(CPU(cpu), "M-mode double trap\n");
+                } else {
+                    riscv_do_nmi(env, cause, false);
+                    return;
+                }
+            }
+
+            s = set_field(s, MSTATUS_MDT, 1);
+        }
         env->mstatus = s;
         env->mcause = cause | ((target_ulong)async << (mxlen - 1));
         if (smode_double_trap) {
-- 
2.47.1



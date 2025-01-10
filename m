Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EF9E7719C
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 12:57:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWEYP-0005pr-94; Fri, 10 Jan 2025 07:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tWEXY-0004E6-UV
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 07:55:07 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tWEXT-0000z6-Ee
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 07:55:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so1071816f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 04:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736513695; x=1737118495;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWRo6Nv6sZWB2iYCQV3cOAbXEDznF+sv8nfS34tLEB4=;
 b=cyRpWNVCKhk8uIRPFI0jcOMcp8M/Ft2PNJNXtPxKWMG/6c8uhy2Pq/Y0ooO+6BkBFO
 0Jstwph2LXznlGGQn8tumlkttYiqIX8r4g6ufh72AsGY3ubxsrTAG+WYhnGHi0j2BdrV
 R6dQ8cHUtDqIjWH/5ZqPJNKXXGz1PjlSqDUWHCK/WrIa7DJSL6eGp6Yc9oG1Ncw69M+7
 ZBXxT0fm9chGxBeLtS4uk9ZPvSsI0YJWGbgjPQyoKHjJgiATjBZ5zJSqlY9O01tXghwE
 ncajg/60mirfWoy+xyG5tcMEwNIzNX5G8sUV62ZOddtCOiLHqKDrv4fMQpSt12509+SI
 wB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736513695; x=1737118495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWRo6Nv6sZWB2iYCQV3cOAbXEDznF+sv8nfS34tLEB4=;
 b=a4VVCLAjhgU/9fvwzIKQHov+izQVTdqjl3kxR8BIi06kNtP95qUqLsSobzbI03g3Ts
 itcZXpgVCT02lhNfu8CPZwSxNSGflcAzrZdE/Dlfvm4sCXuo9SB9PH7tfDs5UW/DUtNZ
 uV/msJjoprObY6C1+olz989cfQmYDE8ZNUXdIIuvgkl4FEWctMtNHh+dLwRtfRM1y/Aa
 WC715YsffbFMWpsym027duD/gdhif2ndPg9QfYBGIMYpHQr2HGJxcro7stW6RsgQcJK1
 /INml2+gWgnmvYqo27Gmu8T4nEHxnVIjv/wOPPKlVz0SVK3Lox1lziLd2ofJdm7Z3g2z
 NNlg==
X-Gm-Message-State: AOJu0YyVXZmR1Xdmj4Bn4fGZkGEHjUYiRJ+zT+y+F2EiNDhCDliDKf+3
 ktwt3pNU82nD8lNeZXGLPOVUZLfEqWZuLkmUbzhE+zHcfsexH1ba7lzwBH4riD6hX+si4fnM+eK
 A
X-Gm-Gg: ASbGnctb2EiSYmeMa9tKfMAhCszMZ9gvpleG5+1PzoUTMuAaVQpaeA1N5lgm0T/LnSO
 7qKoO0ZtKUGBpZWAczEYPqCJN9RjUdDl8aGXBUCXdbWy4OmWfVe4yLQcy4DO4MRYMjSAg0nFIHT
 E1XNfBL3jyMx5izdX91JgsJcnpzm2WVX0caCQAscUGdMiGCQMMRni/c/P6fQ5e32OOTQ6seyU1B
 CrJDkcrcJp72rZmHcJViUycB/2wJpp3YjaORlDsp46s5TENj8QNukBeIA==
X-Google-Smtp-Source: AGHT+IEmKNIMEDvvXgq3UOUXNeXUrfLyl8W/ibeL/mei+Z6SA9KfYqKX1zALFUnVHdPLaTCFVi0sqQ==
X-Received: by 2002:a05:6000:144a:b0:385:fc70:832 with SMTP id
 ffacd0b85a97d-38a87303cacmr10050464f8f.16.1736513695276; 
 Fri, 10 Jan 2025 04:54:55 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1c01sm4548921f8f.97.2025.01.10.04.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 04:54:54 -0800 (PST)
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
Subject: [PATCH v8 3/9] target/riscv: Implement Ssdbltrp sret,
 mret and mnret behavior
Date: Fri, 10 Jan 2025 13:54:34 +0100
Message-ID: <20250110125441.3208676-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110125441.3208676-1-cleger@rivosinc.com>
References: <20250110125441.3208676-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x433.google.com
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

When the Ssdbltrp extension is enabled, SSTATUS.SDT field is cleared
when executing sret. When executing mret/mnret, SSTATUS.SDT is cleared
when returning to U, VS or VU and VSSTATUS.SDT is cleared when returning
to VU from HS.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index c825336519..59c4bf28ed 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -294,6 +294,18 @@ target_ulong helper_sret(CPURISCVState *env)
                         get_field(mstatus, MSTATUS_SPIE));
     mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
+
+    if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
+        if (riscv_has_ext(env, RVH)) {
+            target_ulong prev_vu = get_field(env->hstatus, HSTATUS_SPV) &&
+                                   prev_priv == PRV_U;
+            /* Returning to VU from HS, vsstatus.sdt = 0 */
+            if (!env->virt_enabled && prev_vu) {
+                env->vsstatus = set_field(env->vsstatus, MSTATUS_SDT, 0);
+            }
+        }
+        mstatus = set_field(mstatus, MSTATUS_SDT, 0);
+    }
     if (env->priv_ver >= PRIV_VERSION_1_12_0) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -304,7 +316,6 @@ target_ulong helper_sret(CPURISCVState *env)
         target_ulong hstatus = env->hstatus;
 
         prev_virt = get_field(hstatus, HSTATUS_SPV);
-
         hstatus = set_field(hstatus, HSTATUS_SPV, 0);
 
         env->hstatus = hstatus;
@@ -344,6 +355,22 @@ static void check_ret_from_m_mode(CPURISCVState *env, target_ulong retpc,
         riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
     }
 }
+static target_ulong ssdbltrp_mxret(CPURISCVState *env, target_ulong mstatus,
+                                   target_ulong prev_priv,
+                                   target_ulong prev_virt)
+{
+    /* If returning to U, VS or VU, sstatus.sdt = 0 */
+    if (prev_priv == PRV_U || (prev_virt &&
+        (prev_priv == PRV_S || prev_priv == PRV_U))) {
+        mstatus = set_field(mstatus, MSTATUS_SDT, 0);
+        /* If returning to VU, vsstatus.sdt = 0 */
+        if (prev_virt && prev_priv == PRV_U) {
+            env->vsstatus = set_field(env->vsstatus, MSTATUS_SDT, 0);
+        }
+    }
+
+    return mstatus;
+}
 
 target_ulong helper_mret(CPURISCVState *env)
 {
@@ -361,6 +388,9 @@ target_ulong helper_mret(CPURISCVState *env)
     mstatus = set_field(mstatus, MSTATUS_MPP,
                         riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
     mstatus = set_field(mstatus, MSTATUS_MPV, 0);
+    if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
+        mstatus = ssdbltrp_mxret(env, mstatus, prev_priv, prev_virt);
+    }
     if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -402,6 +432,9 @@ target_ulong helper_mnret(CPURISCVState *env)
     if (prev_priv < PRV_M) {
         env->mstatus = set_field(env->mstatus, MSTATUS_MPRV, false);
     }
+    if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
+        env->mstatus = ssdbltrp_mxret(env, env->mstatus, prev_priv, prev_virt);
+    }
 
     if (riscv_has_ext(env, RVH) && prev_virt) {
         riscv_cpu_swap_hypervisor_regs(env);
-- 
2.47.1



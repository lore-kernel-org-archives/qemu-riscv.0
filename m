Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC79BC4450A
	for <qemu-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 15:17:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wlTGq-0000HO-4O; Sun, 19 Jul 2026 11:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahshehab24@gmail.com>)
 id 1wlPXO-0001Ov-Ug
 for qemu-riscv@nongnu.org; Sun, 19 Jul 2026 07:18:26 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahshehab24@gmail.com>)
 id 1wlPXN-0007Ru-5m
 for qemu-riscv@nongnu.org; Sun, 19 Jul 2026 07:18:26 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so2342335e9.0
 for <qemu-riscv@nongnu.org>; Sun, 19 Jul 2026 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784459903; x=1785064703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Lo5f6GFevx6PMuevYT9MUZ2WXBpORzQ4ehhGxe4MBM=;
 b=fZyZWgRaXJ1581qfb9UF7mW8878wr7TlmRK2KnH0USzFVuC39kI+/Lp1tvsQWPkWzH
 5d2syV365I/1r7IcYVZYNpvBXjKpKMyksei0nZ1aUr5251k/LxhtErvDjJGQrf1b8sPM
 Q2ADEm/tjKlNex6Mv82wvM9iAkrcSZWHQ8E5LnaqEdc8TP6zkv6A2gZDSBHV6f8giZME
 edEwdKi8IgslcfEdvl08eXyRXP2h0NwHquI2KlfsgVxqu/SRNGow7fl6Ps/Jc85XZySB
 5iRL8TnbijqmhjihgRwOOVwdPnsZvRIZKuFoqV3bIjznsDMyJjwkwpM/DRb+5vcHz77a
 jihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784459903; x=1785064703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Lo5f6GFevx6PMuevYT9MUZ2WXBpORzQ4ehhGxe4MBM=;
 b=DllKiJTBpJ/0fx5xYZcpON4RRXObpzedq+45r0nfg7Ca5GRyEg5lw5aH2y8OBnTYw9
 3rA5WgXCaZZP2MGqNxIDm7k8ug5B27iU2N4AoIFDs+59G4ZrFM5HDjLcdqqCuMXH+U+/
 NCqSTOTekHfIsk+w+Jka1j5FTLUOYepbSpdH995TU/Ig4Pai4wjrdDFwAEQBfkEvaepl
 Boc1ZYUaF0fdwatX/+MwcHA6K7qLtEvs6SClrKdOO1w65KoIA+AOTTtxPy6MAivIJtih
 K+HOayhwVZapToQsLUTNSoatW1Rcr+NRlbMVYXEqzkKCKtFf0Yeug4BfAcYzxD2zHf0S
 7Rcg==
X-Gm-Message-State: AOJu0YwQCVsMnPM4AfKc291hLusVRLx7ahic+BpvWozEfaUSfJbkmhpS
 Hda4DBCdMx+pH8qeQf2BskU0HvTWNPKUX7Z2KHg8Abkzol8TKQIdhreJ
X-Gm-Gg: AfdE7clXUkbgIBMX0enzZ9DPkDDtRr4cTt2kNsINV6YOB8uwWKNa/oxfRUq3HR254cl
 cr7pA50dtwn2uUrcw/hJysYI2RKqAis+knMM/P5xTxfwFzJFUJRbIxyCNEZnRGx+MAxmGrd4aUG
 GMWz5YRj9cUANL0NjO63OYasMJNsL9wqYhiH2pC0GWk/YOfiuJ/Ejv9FrH8tVCvLcbvA15pzfp0
 Km3BX1bujxawTuugQD2Us2KpdXXudqSet724FFyl5JPGA/lG2Vap1eU1tjtwh1R5Twg6ocQGsK6
 ZGoa2MUGzMo4DOT3m0PWExJZt+8XzWc4NyfuPrBW4HZw6RoqrgEWlLk9Di0k1b61+gIpWwvIn0X
 hE8uvMeR3MtZD0bVySBnIiVPpvXjfiYM+p0lrQJ/Jae3DA8mtI7dyC9gApnVVojK8pC2Xk46iQu
 o5yrU8tgLTHbuPhayMQ9E71BsPuT0rXGthWyO20NFnW2/WbA==
X-Received: by 2002:a05:600c:4f94:b0:493:d741:5d72 with SMTP id
 5b1f17b1804b1-4954a513ef9mr103415475e9.38.1784459902897; 
 Sun, 19 Jul 2026 04:18:22 -0700 (PDT)
Received: from 5520-BMRXQ93.eg.si-vision.com ([41.33.244.227])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2aa698sm177784285e9.4.2026.07.19.04.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2026 04:18:22 -0700 (PDT)
From: A-Shehab <ahshehab24@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 debug@rivosinc.com, A-Shehab <ahshehab24@gmail.com>
Subject: [PATCH] target/riscv: allow menvcfg/henvcfg LPE and SSE bits on RV32
Date: Sun, 19 Jul 2026 14:17:49 +0300
Message-ID: <20260719111749.23777-1-ahshehab24@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ahshehab24@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 19 Jul 2026 11:17:31 -0400
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

The Zicfilp landing-pad enable (LPE, bit 2) and Zicfiss shadow-stack
enable (SSE, bit 3) controls live in the low 32 bits of menvcfg and
henvcfg, and the CFI specification defines them for both RV32 and RV64.

QEMU only adds MENVCFG_LPE/MENVCFG_SSE (and the henvcfg equivalents) to
the writable mask inside the "riscv_cpu_mxl(env) == MXL_RV64" block, so
on RV32 these bits are silently dropped and the features cannot be
enabled. This is inconsistent with write_senvcfg(), which already
handles SENVCFG_LPE/SENVCFG_SSE regardless of MXLEN.

Hoist the LPE/SSE mask handling out of the RV64-only block in
write_menvcfg() and write_henvcfg() so the bits become writable on RV32
as well. The upper-half writers (write_menvcfgh/write_henvcfgh) are
unaffected because these bits reside in the low 32 bits.

Reproducible on qemu-system-riscv32 -cpu rv32,zicfilp=true,zicfiss=true:
an M-mode write of menvcfg.{LPE,SSE} reads back as zero, while the same
program on rv64 keeps the bits set.

Fixes: 4923f672e3d7 ("target/riscv: Introduce elp state and enabling controls for zicfilp")
Fixes: 8205bc127a83 ("target/riscv: introduce ssp and enabling controls for zicfiss")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4045
Signed-off-by: A-Shehab <ahshehab24@gmail.com>
---
 target/riscv/csr.c | 45 +++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index dd9726fcf4..58828a269a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3211,6 +3211,19 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
                     MENVCFG_CBZE;
     bool stce_changed = false;
 
+    /*
+     * menvcfg.LPE (Zicfilp) and menvcfg.SSE (Zicfiss) reside in the low
+     * 32 bits and are defined for both RV32 and RV64, so they must be
+     * writable regardless of MXLEN.
+     */
+    if (cfg->ext_zicfilp) {
+        mask |= MENVCFG_LPE;
+    }
+
+    if (cfg->ext_zicfiss) {
+        mask |= MENVCFG_SSE;
+    }
+
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
                 (cfg->ext_sstc ? MENVCFG_STCE : 0) |
@@ -3218,14 +3231,6 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
                 (cfg->ext_svadu ? MENVCFG_ADUE : 0) |
                 (cfg->ext_ssdbltrp ? MENVCFG_DTE : 0);
 
-        if (env_archcpu(env)->cfg.ext_zicfilp) {
-            mask |= MENVCFG_LPE;
-        }
-
-        if (env_archcpu(env)->cfg.ext_zicfiss) {
-            mask |= MENVCFG_SSE;
-        }
-
         /* Update PMM field only if the value is valid according to Zjpm v1.0 */
         if (env_archcpu(env)->cfg.ext_smnpm &&
             get_field(val, MENVCFG_PMM) != PMM_FIELD_RESERVED) {
@@ -3373,20 +3378,24 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
         return ret;
     }
 
+    /*
+     * henvcfg.LPE (Zicfilp) and henvcfg.SSE (Zicfiss) reside in the low
+     * 32 bits and are defined for both RV32 and RV64, so they must be
+     * writable regardless of MXLEN.
+     */
+    if (cfg->ext_zicfilp) {
+        mask |= HENVCFG_LPE;
+    }
+
+    /* H can light up SSE for VS only if HS had it from menvcfg */
+    if (cfg->ext_zicfiss && get_field(env->menvcfg, MENVCFG_SSE)) {
+        mask |= HENVCFG_SSE;
+    }
+
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_ADUE |
                                 HENVCFG_DTE);
 
-        if (env_archcpu(env)->cfg.ext_zicfilp) {
-            mask |= HENVCFG_LPE;
-        }
-
-        /* H can light up SSE for VS only if HS had it from menvcfg */
-        if (env_archcpu(env)->cfg.ext_zicfiss &&
-            get_field(env->menvcfg, MENVCFG_SSE)) {
-            mask |= HENVCFG_SSE;
-        }
-
         /* Update PMM field only if the value is valid according to Zjpm v1.0 */
         if (env_archcpu(env)->cfg.ext_ssnpm &&
             get_field(val, HENVCFG_PMM) != PMM_FIELD_RESERVED) {
-- 
2.53.0



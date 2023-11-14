Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C51C4167B
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 09:44:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2py1-0003tm-IC; Tue, 14 Nov 2023 04:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1r2py0-0003sv-3Z
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 04:44:20 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1r2pxy-0000Hh-Gs
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 04:44:19 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so3715916f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Nov 2023 01:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1699955056; x=1700559856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qJ/efZbCiQemSximKvzfq2Gui9gap7qWDg5sC5a5QwI=;
 b=GP5WEjhGxG9Q2r1ZMAUwMLBWetyNtnaErIrxbpu0lt9/9uBEjOwxux44VTIGO90NQV
 PRuiZJ90JgkNpk6qubtFcOO3xWBmtbAA/hFFYcw4KA3HDOtO1q3njrWHPVxubGCZa6sV
 SFjgKz6WKnCvHZXGBRrbuYCNKyh9ozGaiazczXYRxnkbP4YCzr7TSRjOKMScbSWUx0rM
 Af2/2OSkemiLUvojVQGOhsT8EJuzyMKF1dF3vzrMv7/1FVvHP63ZVvvFOCk/V9zTtZID
 tqmXHBCDJiER7g/fSTNwcCXCtlLH9JjWNSseKcAs0T59uchO+HrOhPnDqMhGLYXglzyn
 2D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699955056; x=1700559856;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qJ/efZbCiQemSximKvzfq2Gui9gap7qWDg5sC5a5QwI=;
 b=HySfPc0WNp/iGZ5Vhp8GNIFqg1RFI0B39fOQCJUoXUTqIlcDNxRN1YAnIRpb8zfQmx
 Zg/81RLJ+0/35qk3MCcUWddpM2PYNYmDjoDcQU5G5bAZzpKHiirRZZKMB0tacipSbLWH
 Vi0qzAFrf5nqmVQL4XVknsfg66z1j5GNr/hxEPbPTxiPogh5AT4iOriGiApABkqQpiCa
 6RcAPsKto1OFJOq+LVWjvF8muVhMpXpcQM7S+RrcxAmjKjS+nfoDczXnZjYv8H21j0yF
 y0LwsSokdjplHuEx3MMlt3dIXyE4snnvonVuCIyesDmR3I3DVRXSQST5Ea2Xx6OcbABX
 0Dqw==
X-Gm-Message-State: AOJu0YzniFJ3Zd/KiUA2IuCRwwLJmSEkPF+mJfpqcdPYTSpZWcyPnyp3
 tqJ/TMv1o17eMKTTMeKPAQ8ltw==
X-Google-Smtp-Source: AGHT+IGiM/Nh/j+d2t3pxHn9Gi2WkiBwSrnKOV/a6fHyTkXKsvbGzzK+nYJmewkKNMuDsLs4C/R9/A==
X-Received: by 2002:a5d:49c4:0:b0:32d:bc6e:7f0d with SMTP id
 t4-20020a5d49c4000000b0032dbc6e7f0dmr5586674wrs.18.1699955056515; 
 Tue, 14 Nov 2023 01:44:16 -0800 (PST)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b0032f78feb826sm7336471wrt.104.2023.11.14.01.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 01:44:15 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, dbarboza@ventanamicro.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH] target/riscv: don't verify ISA compatibility for zicntr and
 zihpm
Date: Tue, 14 Nov 2023 10:44:12 +0100
Message-Id: <20231114094412.413408-1-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The extensions zicntr and zihpm were officially added in the privilege
instruction set specification 1.12. However, QEMU has been implemented
them long before it and thus they are forced to be on during the cpu
initialization to ensure compatibility (see riscv_cpu_init).
riscv_cpu_disable_priv_spec_isa_exts was not updated when the above
behavior was introduced, resulting in these extensions to be disabled
after all.

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 target/riscv/tcg/tcg-cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 08adad304d..8a35683a34 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -250,6 +250,15 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     for (edata = isa_edata_arr; edata && edata->name; edata++) {
         if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
             (env->priv_ver < edata->min_version)) {
+            /*
+             * These two extensions are always enabled as they were supported
+             * by QEMU before they were added as extensions in the ISA.
+             */
+            if (!strcmp(edata->name, "zicntr") ||
+                !strcmp(edata->name, "zihpm")) {
+                continue;
+            }
+
             isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
 #ifndef CONFIG_USER_ONLY
             warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
-- 
2.25.1



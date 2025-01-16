Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23161C02180
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 09:24:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tYM74-0008Hk-Vy; Thu, 16 Jan 2025 04:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tYM70-0008A6-SU
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 04:24:26 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tYM6y-00075I-Q2
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 04:24:26 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so5865575e9.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Jan 2025 01:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737019463; x=1737624263;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n4tO2lpWLUlWhElOcxn349LZsfQHzK7a0FiyfdeojG0=;
 b=EA2WLkHMjjEJ54nOa0F9om2VAi0ao5h8VAKOWEqm99N/tx0ysxI1Rq/kTQ/mLp1CQW
 Ad80qfdWQ2/h3fAXKPzCzqzFWW9plRuUuIzrcAdcM0T/6zG3vjdKw/oiCYeVbQWUu9Hm
 0qMdMaIDbQtO3fwRmEXWkOqFpzHPNPyvL936cP+86GJmBli842nltrvNXgVrFctPzN6H
 8yr+hGP7G5GQJSqb8wiQu7XuxPZSy1NQ4lvUm6WdE/PwckHYh21zzdumLoT7BqLdEIrP
 E/GwG7tjT9Jh5OfLMgwmfPGNcUK5WEkwjQN67wlObwIJdVaD4U9Qj2OmV0KKyvIWZtLd
 0Ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737019463; x=1737624263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n4tO2lpWLUlWhElOcxn349LZsfQHzK7a0FiyfdeojG0=;
 b=PALgrJ37eaU0FEsplE8jaKyfwWz1Z1lTDtVIGz/k+r3pic9IVDZqR6L1JbwyIXOuZi
 OV/0CkHDUvpLpg7f1S0vVNifqImvlfyFMBD/95RU61yBvm5I1KaqkxJPnPrrQod8apM4
 M+MFt/uWfPGmvB7oAqZtAy4p/MEAWWv/VslPJ/O0ZAlYxt6DpnETlz4OVTWf7/CgGx7+
 eN04dfx/Ho1l+UJPJ2yhYSRp6s9BN3RyIrlBPMbvr2urHKGhXDMPsJhacxwItG1SEmor
 rgfcGzCSZD6CUk83n6NTSci+FrsW9l0CRuHgOHOQCXIaKN0XtJfsPBHtOVNUOgX98wEb
 dv4A==
X-Gm-Message-State: AOJu0YzwHVbr7hrrPe4QOIIOF2bCy0YNkg5STjqAaeEFRbOY2MrVMgZn
 WZyBSIFNLtOQz81iAZiPqOAevldSOZ3rvxUVTodFwEfknMZTVRE7WIaDLL4qptBKtwo4nrAh0yx
 g
X-Gm-Gg: ASbGnctGQy0oTYls9XPgXCAk92nHevV96Z0yzTTtOeY8sFS+GeT8kwcuiip8aee7u1P
 Cn7OB2NzADfKi9gmGJcZSbQX3iJ84ulRdWAtTqq5bAc5g+lKG1nKhhRgPTRm/QTL5MWpQ4aell0
 lF8dhoWnhzzflWZnH5OVTP1d+6y8JCzqd/rMrCmO/ZaM45Ev6NfzbR3lA2VuRT+pe7KwzMhjQOk
 sROhp1yYpWHe2SKViK8lWIu6TAYfXWvAgFr0v50+rPWTpFEkgq0vIzioA==
X-Google-Smtp-Source: AGHT+IGzECVt+hIOy0AQktvrXyKxuw2pm8Ehw6Lrm2mWldlU0RH4XsvxuUG21oXWUIEIaU0fXGEAwg==
X-Received: by 2002:a05:600c:c0e:b0:436:488f:4d8 with SMTP id
 5b1f17b1804b1-436eb9a154amr295847425e9.11.1737019462656; 
 Thu, 16 Jan 2025 01:24:22 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74aca93sm53391365e9.13.2025.01.16.01.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 01:24:22 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH] riscv: disable Smdbltrp for the max cpu
Date: Thu, 16 Jan 2025 10:23:45 +0100
Message-ID: <20250116092352.1630278-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When present, Smdbltrp is enabled by default and MDT needs to be cleared
to avoid generating a double trap. Since not all firmwares are currently
ready to handle that, disable it for the max cpu.

Reported-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Clément Léger <cleger@rivosinc.com>

---
 target/riscv/tcg/tcg-cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 48be24bbbe..0a137281de 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1439,6 +1439,16 @@ static void riscv_init_max_cpu_extensions(Object *obj)
         isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_smrnmi), false);
         qemu_log("Smrnmi is disabled in the 'max' type CPU\n");
     }
+
+    /*
+     * ext_smdbltrp requires the firmware to clear MSTATUS.MDT on startup to
+     * avoid generating a double trap. OpenSBI does not currently support it,
+     * disable it for now.
+     */
+    if (cpu->cfg.ext_smdbltrp) {
+        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_smdbltrp), false);
+        qemu_log("Smdbltrp is disabled in the 'max' type CPU\n");
+    }
 }
 
 static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
-- 
2.47.1



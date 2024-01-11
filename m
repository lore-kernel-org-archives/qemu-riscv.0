Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDB2C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 16:17:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNxji-0006wI-UN; Thu, 11 Jan 2024 11:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNxjh-0006rz-G9
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 11:16:53 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNxjf-0005WB-AJ
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 11:16:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e490c2115so26293475e9.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 08:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704989810; x=1705594610;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rmtj7VR3QACBvsppTX7iiIn7vor5KVmAe+fOMphCBqE=;
 b=A95LPq50u+Jh0F9uvnEGM1KzgEouH4/NvVzABrAVYRTUSsZvY+x/uxxMCeMxwax9pB
 yoJMl9P+OInxPAzfIyawio94m9UKBdgxdPOyyQjszmBsLqLWEnoS4xOgZPpD/rnhWaZV
 jFFGYogaj2X0JFWCqacleFgtqzB8SnqF+Z1/0i9T2fTrZpPxGk0zl9qKmicPn+gRId0P
 C+uzON9Qy9aFmJ+RA2dRYYkuMdWCYCWYG15vknUNJecEtpLhD5oGRdFg7gGsuCPaip/H
 wUrDmXD7dNKY4PvrpBzfvKP7d2e59yYpvM2sIv8S7PiX8R1nKuCEZssMKfZmpdRyOVGR
 46Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704989810; x=1705594610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rmtj7VR3QACBvsppTX7iiIn7vor5KVmAe+fOMphCBqE=;
 b=bk4bUbA7+hyEm1xKLTKanrxQkQgKQZhAmXxKsTeTm2Mnmp/eZr1gVj2n1RH0qVTDHU
 s5lIfiocgTl8i9lrppYFz1ARTjOiPfpa88hyexGjVDf5XpBcLElkmaFmFSTzu/LxFsJe
 IpWPQROxcsSl+DC1GgXIuT2wWk2rB+Xvz2vyRtplch163+UwO+im+J0I6xMFOeJZm/un
 rUBDMdLnh2v1AbnnEErbl/j4dJiJrwNzR7nHCU6zPqdSOK8wXFX7VG2mNp0O1T+OPkRO
 AZ0dBGM15/lDfF3qy0AgwHZ7MNlrB2x7oCeklW+K/t4mkOpC4fYBa67iQCC8rFTYf7gG
 En8A==
X-Gm-Message-State: AOJu0YyPIn+8+3TQLXrEkrERggFvlejJCeamM+kYKk1rcjXNFA1Vxzkl
 hfLY/1wp+zCTxsAAaKwr1bcwfFE3quiMiA==
X-Google-Smtp-Source: AGHT+IHZpOtvn58I+SfApDCi0aNKlKb0AyZ/mDtbUagqwdgfaTAYK8J9ro1OLd482VUgjCSiRDBHcQ==
X-Received: by 2002:a05:600c:4f43:b0:40e:6194:ccfa with SMTP id
 m3-20020a05600c4f4300b0040e6194ccfamr509838wmq.6.1704989809607; 
 Thu, 11 Jan 2024 08:16:49 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b0033642a9a1eesm1553183wrs.21.2024.01.11.08.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 08:16:48 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 2/2] target/riscv: Add step to validate 'B' extension
Date: Thu, 11 Jan 2024 16:16:44 +0000
Message-ID: <20240111161644.33630-3-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111161644.33630-1-rbradford@rivosinc.com>
References: <20240111161644.33630-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If the B extension is enabled warn if the user has disabled any of the
required extensions that are part of the 'B' extension. Conversely
enable the extensions that make up the 'B' extension if it is enabled.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5396c6c3eb..b5ba78240e 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -442,6 +442,35 @@ static void riscv_cpu_validate_g(RISCVCPU *cpu)
     }
 }
 
+static void riscv_cpu_validate_b(RISCVCPU *cpu)
+{
+    const char *warn_msg = "RVB mandates disabled extension %s";
+
+    if (!cpu->cfg.ext_zba) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zba))) {
+            cpu->cfg.ext_zba = true;
+        } else {
+            warn_report(warn_msg, "zba");
+        }
+    }
+
+    if (!cpu->cfg.ext_zbb) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbb))) {
+            cpu->cfg.ext_zbb = true;
+        } else {
+            warn_report(warn_msg, "zbb");
+        }
+    }
+
+    if (!cpu->cfg.ext_zbs) {
+        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbs))) {
+            cpu->cfg.ext_zbs = true;
+        } else {
+            warn_report(warn_msg, "zbs");
+        }
+    }
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -455,6 +484,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         riscv_cpu_validate_g(cpu);
     }
 
+    if (riscv_has_ext(env, RVB)) {
+        riscv_cpu_validate_b(cpu);
+    }
+
     if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
         error_setg(errp,
                    "I and E extensions are incompatible");
-- 
2.43.0



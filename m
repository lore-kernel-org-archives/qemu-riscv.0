Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17239C5AD49
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 May 2025 20:25:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKjmr-00048J-8D; Thu, 29 May 2025 16:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKjmn-00046N-VY
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 16:23:34 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKjml-00066z-HT
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 16:23:33 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-87e0ce80ed4so623175241.2
 for <qemu-riscv@nongnu.org>; Thu, 29 May 2025 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748550210; x=1749155010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BNlbZtbtSL7iYylNYXYC2+eeOLfQcdGt27SfxMLdp4k=;
 b=m/0xac08O3PxiV7gpHnoVWtXhuL6ed0CRDNqc3hDsxhFB8AQGFllhtsDFVe6WGk7yQ
 N4VBp9dm6yreoggyLHrL5+3vvwEFlvuh+hVYd2+TEqd8rmg4wTxe0nmycR+ySsKcC9B/
 /HXTtR7bi+buf/X9jOZGKUVqZZED6Y/imn9A8Kxnj228KyncGYzX9TduFp/fHjQvCm1S
 EA3DR0lkhIjqX9SkexNy1fn9tm12fLyPafUVcC+GlN4POhFEBbM0dqNvssKhg4NCtlz/
 WoBp7RUMRRSXHt0E2pm9Zb2ffj5Uidn7sXgMYSPQPmKP4U43FoPUqiuQ9sefHWcYPjSk
 X46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748550210; x=1749155010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNlbZtbtSL7iYylNYXYC2+eeOLfQcdGt27SfxMLdp4k=;
 b=vmZpgqFhx/Q+FWbFi2COGvD8Jd3iiONoiQapm8nBz1PBoW6XG/BKOMYeV/IOwLMSlx
 ftMW14dHFj77m4vVfM+fMuR8BkTtQzfCObpp23fkqMgcQxmku3kMD2sc8ZF6oLn8H95v
 7eQLCdn2mUV5LpPuLkM7V5qH9JeX+43LFV6potdp6NoamX/sjCsOIhL2vZ7ZxymUjxyA
 z1ETvFVvzzvlbSYteDegPWObjWSe8heUv1kpIwpcSzHeFWw0gp2qR88uMLLAjRb9Ju3N
 uhgVNXLEQZ8/VoZ634S62B6xea+6t6U4sAN4KzhQEiP6+R/kn2cg6uyPnTWH7JOGLz8A
 wy8w==
X-Gm-Message-State: AOJu0Yx2j3HAwdFehjSp8eGMRlq1DLGFWI1wr6VGBclCUeXDNuWKCwYH
 JNj920MscQEQIWG6lpWuYGPor7m7fjjTgxPTRs0przHbzhsY2rwaNaMsWuTVWhxuujg=
X-Gm-Gg: ASbGncvuJO6g8cfGEpCDr/b5ec14j6G4D2FZRM8GfFSNZ+jHwnXZFjeb6jDP09jLqVO
 uxj+LLsdDUIZ+2p4MQCsEDc7IplE2I6m7/KCO0VEkCXMO0WqQxc2bApu2s9meHHc8PT1IRz2MRg
 yrxNiHrojJ+VtC7lnkA4/Kr4Y/Y2pxSlgUBT+AWDC7SCDEgkkQtyB8kw2Kp/w/ofTc+SmtYpVvk
 lDE/U01QyhN2OQuGVin9U5eG9v3MRNBMY/pLfWhdk4lLdNkCl+en2NxHRPU/pxSZbxY0rW1VHY9
 XDKFatiWfXIrKMYPIdEM3g4Zd6HKH+i10Dh+JjEfZdxKrXUJpaLYUhFF9XZQM8nf5OAgiD3fBPF
 kJj4=
X-Google-Smtp-Source: AGHT+IHPgUqaSTaLxsIkMjy0Ud2gogbx62ROefjsg4Rr9DFh48WFhektb0YazKe7J4SAz1K01y/4rg==
X-Received: by 2002:a05:6102:304f:b0:4bf:fb80:9429 with SMTP id
 ada2fe7eead31-4e6e40d93a4mr1349890137.4.1748550210325; 
 Thu, 29 May 2025 13:23:30 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.35.190])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87e2a2c774asm1647137241.20.2025.05.29.13.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 13:23:29 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [qemu PATCH 3/3] target/riscv/cpu.c: do better with 'named features'
 doc
Date: Thu, 29 May 2025 17:23:15 -0300
Message-ID: <20250529202315.1684198-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529202315.1684198-1-dbarboza@ventanamicro.com>
References: <20250529202315.1684198-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ua1-x92e.google.com
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

Most of the named features are added directly in isa_edata_arr[], some
of them are also added in riscv_cpu_named_features(). There is a reason
for that, and the existing docs can do better explaining it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cd0b159ed5..fdf2eb2b1c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1377,13 +1377,23 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
  * 'Named features' is the name we give to extensions that we
  * don't want to expose to users. They are either immutable
  * (always enabled/disable) or they'll vary depending on
- * the resulting CPU state. They have riscv,isa strings
- * and priv_ver like regular extensions.
+ * the resulting CPU state.
+ *
+ * Some of them are always enabled depending on priv version
+ * of the CPU and are declared directly in isa_edata_arr[].
+ * The ones listed here have special checks during finalize()
+ * time and require their own flags like regular extensions.
+ * See riscv_cpu_update_named_features() for more info.
  */
 const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
     MULTI_EXT_CFG_BOOL("zic64b", ext_zic64b, true),
     MULTI_EXT_CFG_BOOL("ssstateen", ext_ssstateen, true),
     MULTI_EXT_CFG_BOOL("sha", ext_sha, true),
+
+    /*
+     * 'ziccrse' has its own flag because the KVM driver
+     * wants to enable/disable it on its own accord.
+     */
     MULTI_EXT_CFG_BOOL("ziccrse", ext_ziccrse, true),
 
     { },
-- 
2.49.0



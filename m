Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF7AE77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 11:41:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNsQB-0007XI-Qh; Wed, 18 Dec 2024 06:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNsQ9-0007Wt-VT
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 06:40:53 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNsQ6-0007uE-Ja
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 06:40:53 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2167141dfa1so5971475ad.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 03:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734522049; x=1735126849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zabmXRbNE9RUxJY0tWbP7vXaB9YVIkHS3ox3ss6uxK0=;
 b=KU3aaIeetbzCmxG+99ePeYvfPtAvsWKBs3SmIHq4J7Yykv1NsgTua69jFDGUL0Oxe0
 vBbuHqJMqFFFTveKcZIIfKG1bVY28RNBvOnIA3kGQAi5UO3weIhsVi1Ob/gz9/lN9RnE
 Apotb66S1M9JigP7X3kpF02qFTcXrAupqCEeYLphOrOAgVKMhps16CaMws6OGzt5CHoK
 sqafFGgq9LwE6/VMr1i89+xTSHzyAsGPule4M1AUHRQppxeROOttaqoclgXZP++Lvz/z
 mOLjsFJ3cWSvvUveIgjXQkmS7IFBiaYZS5zV/eKnPdInjxIEaY2yUQb+SI7pqFMAUH/6
 unCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734522049; x=1735126849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zabmXRbNE9RUxJY0tWbP7vXaB9YVIkHS3ox3ss6uxK0=;
 b=Cjglzt0ITqfy7Q2r7kQNaxzZJ4wHhE6T9D9/Tp2l96hsfPcy84CtRAT6RvkeK04IHx
 8pqtmThq8YOzSIvRwi5BIy4/iHHUuCQJSl5fFW0FXFDEpsSl+GIbYrUyxziml2/GFAoj
 uUAZo/oJgKLktTOvnVXNQhVy5jmItH++yD1tmnfYJWdtUBP2pX5+uLzJv5rUMtPEEC8i
 tQ5wZaLaYoZSe5k+yCsebaif7GxtEnZ0jioLIrw1PFeuWMUYakjWyxbf58SUFq6WqqOx
 SNGAodfI4X02DxJ5yTgylI/RDq7fXXsWPerrggsPiQLdNzqQdf1FTY7sE6Tj5YHgXljH
 BHqA==
X-Gm-Message-State: AOJu0YxDNT7Uok2WL/1GPEKoK7L6YZ/BOfH0EYB4rO7X6uR2U+EwuhXO
 tesxnU/l5E+Lg1ZtEht9VWgzVu/MJBOFLIF/zovKSKzfiKtztPvZcD/cKdmUAy0=
X-Gm-Gg: ASbGncsxtEzgsd7wieR7fsLxa6Fn75tJ41bFhT1+dcxIa50Jx3REz9Bj77mexOm/+ch
 5Bc7wXabbqVU93cBPIQqEFPpU3HIPvdzwDlHX5kFT6fm/UZlLCeOYAIfGkIEU8+aI1/H8axNPg9
 9gUh5IbUHII7Uj0v3QR+wKj0aNXCdVAbq0cNcgGi2CNWg1hnoqyA8HgwIHnuBKibVbLi65VZRuL
 epybbLiAHIT1ewp2OFq3bWI/oft2N7aCEp+adS4RB5v3Nbf3nCY3YCA/8SA4izfGgoH/e3e69s3
 OA==
X-Google-Smtp-Source: AGHT+IEvKc2Pu7GxTK2wRq/08pjC4bE/1WhobFYaKuzNtdsYeGHz73UzLzLpNEeP+5eDxknPu3Lm4g==
X-Received: by 2002:a17:902:da8b:b0:215:a2f4:d4ab with SMTP id
 d9443c01a7336-218d72917c0mr34742655ad.7.1734522049238; 
 Wed, 18 Dec 2024 03:40:49 -0800 (PST)
Received: from localhost.localdomain ([2804:7f0:bcc0:51cf:9cf:d2f2:d49e:7bd9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1dcb447sm74462285ad.68.2024.12.18.03.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:40:48 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 2/9] target/riscv: add ssstateen
Date: Wed, 18 Dec 2024 08:40:19 -0300
Message-ID: <20241218114026.1652352-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218114026.1652352-1-dbarboza@ventanamicro.com>
References: <20241218114026.1652352-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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

ssstateen is defined in RVA22 as:

"Supervisor-mode view of the state-enable extension. The supervisor-mode
(sstateen0-3) and hypervisor-mode (hstateen0-3) state-enable registers
must be provided."

Add ssstateen as a named feature that is available if we also have
smstateen.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         | 2 ++
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 9 ++++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f2db449c2d..58bb5196a8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -191,6 +191,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(ssstateen, PRIV_VERSION_1_12_0, ext_ssstateen),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
@@ -1705,6 +1706,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
  */
 const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
     MULTI_EXT_CFG_BOOL("zic64b", ext_zic64b, true),
+    MULTI_EXT_CFG_BOOL("ssstateen", ext_ssstateen, true),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index d8771ca641..a1457ab4f4 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -140,6 +140,7 @@ struct RISCVCPUConfig {
     /* Named features  */
     bool ext_svade;
     bool ext_zic64b;
+    bool ext_ssstateen;
 
     /*
      * Always 'true' booleans for named features
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 48a55ba1d8..cbf2cf1963 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -204,10 +204,15 @@ static void riscv_cpu_enable_named_feat(RISCVCPU *cpu, uint32_t feat_offset)
       * All other named features are already enabled
       * in riscv_tcg_cpu_instance_init().
       */
-    if (feat_offset == CPU_CFG_OFFSET(ext_zic64b)) {
+    switch (feat_offset) {
+    case CPU_CFG_OFFSET(ext_zic64b):
         cpu->cfg.cbom_blocksize = 64;
         cpu->cfg.cbop_blocksize = 64;
         cpu->cfg.cboz_blocksize = 64;
+        break;
+    case CPU_CFG_OFFSET(ext_ssstateen):
+        cpu->cfg.ext_smstateen = true;
+        break;
     }
 }
 
@@ -343,6 +348,8 @@ static void riscv_cpu_update_named_features(RISCVCPU *cpu)
     cpu->cfg.ext_zic64b = cpu->cfg.cbom_blocksize == 64 &&
                           cpu->cfg.cbop_blocksize == 64 &&
                           cpu->cfg.cboz_blocksize == 64;
+
+    cpu->cfg.ext_ssstateen = cpu->cfg.ext_smstateen;
 }
 
 static void riscv_cpu_validate_g(RISCVCPU *cpu)
-- 
2.47.1



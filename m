Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9567FC61D85
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 19:17:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6FB0-0008OK-L1; Thu, 23 Nov 2023 14:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6FAu-0008Ja-TP
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 14:15:45 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6FAt-0003hg-3r
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 14:15:44 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cf897c8de1so7957275ad.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 11:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700766941; x=1701371741; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JF5lkWbAc2C1VZm8P9TGmUDxxgv7XlATDWqvy4zet8o=;
 b=DZB2J/8ifAAuh4GDE5f19jnSGrf8wf21bZm6AKlx1ODiCnQqztCTzOgNCJwmwFJ6zi
 lXuLsRDgl3OUqIYELHNcyJy+UM+CDsgA6sqKqa486lF7YNwfzh0y65pfBcX/OiKK4XsG
 wVKOddB6zJobPDYWZJm5vY5jkvwNqOEGAmiTHBYAwWptb6Rv/XaqONutEWYVgHQhloSE
 Enr5tFouunz3LgztVVKl4TD2V2iLR4lKvfKwmd/7DgLr3MBqiMIWUZirAqgY3rTBADou
 tyDAtyHWs06n230sBc9QJ3f2uZhlMDhUiTKj3eoA921V2tphz2vPil5PYoKnqzopqkbN
 xajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700766941; x=1701371741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JF5lkWbAc2C1VZm8P9TGmUDxxgv7XlATDWqvy4zet8o=;
 b=S4sdEcY/i8XA4zGGuzyYzeN5GPQz1V3lKcxgpmrZeGZ0DvyiRdQgLu/MXegS/+amUD
 Ho1Of2Vqt2tvXrILaPTfPR/s4NtG6aqQFFrXQEMCfS8i9r+tqaRYNfWJOFtlrZ5iGexN
 H6e2x/x31YIA7upfMsrUH6d402PgVwS3lU8lUfzTOb+/St5vak+4B5Vupxf/abtOT5VQ
 pGFhYR7Q71eY6FXepEW18ZBZ14Jmfpg4M/0q4hqVPSl9Z/mq+R47ymu5wVh9sr7X8AMt
 c29UTaBA17WvUKbj6g3LV27M59S7QqE/2F4O7W6/3XcJWPOc5WwS/hzbh+ykXIpL5CgX
 m4Qw==
X-Gm-Message-State: AOJu0Ywlwa8Xiwc7ULemEQvzHAJpa6OEeVnXE08Dn98nVfad7f3EUcYN
 iCWz6sSivyZHMIV+IXxIKFcfiA==
X-Google-Smtp-Source: AGHT+IGt5Gp93ztMxOj6W5t5ZLHIuaHvT4+3fCmozRu8+SA2mG6Xc0mUbRiQy62DZFMosqZqDqeDrg==
X-Received: by 2002:a17:902:bb8f:b0:1cf:8c88:51cb with SMTP id
 m15-20020a170902bb8f00b001cf8c8851cbmr358719pls.62.1700766941614; 
 Thu, 23 Nov 2023 11:15:41 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902eed500b001bc21222e34sm1680760plb.285.2023.11.23.11.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 11:15:41 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 1/7] target/riscv: implement svade
Date: Thu, 23 Nov 2023 16:15:26 -0300
Message-ID: <20231123191532.1101644-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
References: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

'svade' is a RVA22S64 profile requirement, a profile we're going to add
shortly. It is a named feature (i.e. not a formal extension, not defined
in riscv,isa DT at this moment) defined in [1] as:

"Page-fault exceptions are raised when a page is accessed when A bit is
clear, or written when D bit is clear.".

As far as the spec goes, 'svade' is one of the two distinct modes of
handling PTE_A and PTE_D. The other way, i.e. update PTE_A/PTE_D when
they're cleared, is defined by the 'svadu' extension. Checking
cpu_helper.c, get_physical_address(), we can verify that QEMU is
compliant with that: we will update PTE_A/PTE_D if 'svadu' is enabled,
or throw a page-fault exception if 'svadu' isn't enabled.

So, as far as we're concerned, 'svade' translates to 'svadu must be
disabled'.

We'll implement it like 'zic64b': an internal flag that profiles can
enable. The flag will not be exposed to users.

[1] https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 1 +
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 9 +++++++++
 3 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3a230608cb..59b131c1fc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1445,6 +1445,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
 };
 
 const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
+    MULTI_EXT_CFG_BOOL("svade", svade, true),
     MULTI_EXT_CFG_BOOL("zic64b", zic64b, true),
 
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 90f18eb601..46b06db68b 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -116,6 +116,7 @@ struct RISCVCPUConfig {
     bool ext_smepmp;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
+    bool svade;
     bool zic64b;
 
     uint32_t mvendorid;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8fa8d61142..ddf37b25f3 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -188,6 +188,9 @@ static void riscv_cpu_enable_named_feat(RISCVCPU *cpu, uint32_t feat_offset)
         cpu->cfg.cbop_blocksize = 64;
         cpu->cfg.cboz_blocksize = 64;
         break;
+    case CPU_CFG_OFFSET(svade):
+        cpu->cfg.ext_svadu = false;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -383,8 +386,14 @@ static void riscv_cpu_validate_zic64b(RISCVCPU *cpu)
                       cpu->cfg.cboz_blocksize == 64;
 }
 
+static void riscv_cpu_validate_svade(RISCVCPU *cpu)
+{
+    cpu->cfg.svade = !cpu->cfg.ext_svadu;
+}
+
 static void riscv_cpu_validate_named_features(RISCVCPU *cpu)
 {
+    riscv_cpu_validate_svade(cpu);
     riscv_cpu_validate_zic64b(cpu);
 }
 
-- 
2.41.0



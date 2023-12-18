Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D28C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:57:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD8y-0003P7-Sn; Mon, 18 Dec 2023 07:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD8w-0003Kn-T8
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:46 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD8v-0004zo-6y
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:54:46 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d307cf18fdso9963355ad.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904084; x=1703508884; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5eMH0mHU2CrG+7HDKRD0uTcFjzj1Zx4SmiIPBKejYsA=;
 b=kN39q+LXSwcQ2QwsTafxyFtJdkrqafdC647yeJOtgSy28F0rJflFCw4Ft7pl2PJooU
 BMKq8bMmrsGpvRrhlgEgojUCatWPc+1enguyts0x2XpT7AV6XbdHv17KiwRjl3VoBAJo
 TDnFu/dGJlDtIGTVlbQZpEwu8lUm+Knkk6KOmt6SqWyr5nySyA2T/GTsH+oFBgM8xdGf
 PK0/14dp3IUHWkQSUWbw9aWosS0KCsJH07/nSid4uENqZFE6R5ZpcukaPTcappU3GhvE
 YrldWQhulqDR8XDKQWh4JBk3pIo0qCM/TKJ1FBSpNSeVsrJaa2BGsX5MglX5NF8QbZMj
 2TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904084; x=1703508884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5eMH0mHU2CrG+7HDKRD0uTcFjzj1Zx4SmiIPBKejYsA=;
 b=nJc1v2G4xuE7nbDfJGdkQb1J6cetaiSkNhVKgzeIVQtSx7jNt+TR7U2/o/RtFmAfNC
 f5qMxAl7w91Anx9gCo9X7WlHeFGS6Jcb/zwe4KDlP/HhTiz+aHNcIh6TgXwZuo45vvhn
 H/pkKrliCV1a3eEB5ThntMBAbBYNee/646kdg3KlOi7UOsxVF9hF12cvmkKKoMoc6ke0
 ciYkbKkb0ymRfHA8Ov5Xkk0751K5YHJ4Dk2fkWpCQ+X/ca+H7oFl5JIEK9RuGep4pHT9
 zcvLlceukX1MhLgoSJabMGG8IENh5xVeitDgIlS4BOyQ2AcFYpiiDTx3Q40ZBdSxpSHf
 wftQ==
X-Gm-Message-State: AOJu0Yw3Bgm30zOEXIwuCO0oKuT8S+zyEW20LPRTwxNzXPIeu0Yx5/Bw
 QLlW3wj7+VQdtxGvYeXLl09RUA==
X-Google-Smtp-Source: AGHT+IH5C+w45UgTH9g+dO8BhIxZIfTI0PIDzs4kuT9Uqb8KcnMZtS/+/rxap2HJrivOSwqpGVjNiA==
X-Received: by 2002:a17:902:ce8b:b0:1cf:fe32:632f with SMTP id
 f11-20020a170902ce8b00b001cffe32632fmr10390034plg.22.1702904084093; 
 Mon, 18 Dec 2023 04:54:44 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:54:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 19/26] target/riscv: implement svade
Date: Mon, 18 Dec 2023 09:53:27 -0300
Message-ID: <20231218125334.37184-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         | 1 +
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a38d78b2d6..a76bc1b86a 100644
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
index 04aedf3840..e395e2449e 100644
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
@@ -381,6 +384,8 @@ static void riscv_cpu_update_named_features(RISCVCPU *cpu)
     cpu->cfg.zic64b = cpu->cfg.cbom_blocksize == 64 &&
                       cpu->cfg.cbop_blocksize == 64 &&
                       cpu->cfg.cboz_blocksize == 64;
+
+    cpu->cfg.svade = !cpu->cfg.ext_svadu;
 }
 
 static void riscv_cpu_validate_g(RISCVCPU *cpu)
-- 
2.43.0



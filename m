Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A249FC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 11:38:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7ZwE-0003oi-Fa; Mon, 27 Nov 2023 06:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwC-0003nf-SA
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:04 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwA-0005BL-Ux
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:04 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6d812988394so1149097a34.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 03:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701085081; x=1701689881; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O6Cx6hq+HUMRF2lU3ZU7j52Tu06FE50ccwBQOiQWWbM=;
 b=bbCEB7B6Hl4S+4Ia+bECS44EzvvUFNgEke8eKGYSc58vWFGuFEIi85vG697K+KMlMP
 3ZVGP9+X1bF+BFcskSGgsMNfhnuJEEyhkGBG5xdZHpMMIbO0uOBSA8ykFKhCynpdDXUA
 uCbaFiyISbOO7cjHtnXsJJpLOFIa0slvLq9EV15L/6A/tPlo7x74xO6GkfPpx73TPoNG
 Z6VkTZXJdXlwWgzUR4my7943FfOO8QG9USqIOUTqwmWkfbjewnImhpcNa+gq2mBAuM6S
 XoFfyKAVDGrvlGBLvBx+rOvVjP9ODEjpnOTN+5EruJXC95k6wOgbKFsG21NW/bsR2J6u
 lzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701085081; x=1701689881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6Cx6hq+HUMRF2lU3ZU7j52Tu06FE50ccwBQOiQWWbM=;
 b=wjjssIcyH2nn0JU1eIB+ySqy+ietPUTXbdTRoLIhPwW8Et0vtUjT+EWH0FsFRpOc6U
 okar2ONs0FP/HH6006ZeQG4TyaHWIofRe4oSguwk+XvlE1HDLB5+WMTo94jaqxkrIgMS
 f3EjWGs4PsrS1B3X4mLq0a9a9NnmL70skQj2cX2k7mhDOoe6rrXCw8B4HrJWOEFdfRH7
 jRwyqlmpQijG8n81eNpoT5hY2ijCzjZ8LCmwWI85VXRM/33byWV0Nq4x1zgPVtTN55fA
 Zf12eJHP4s81ZN4P5282Be5ozLtr8U2/kGIk0uvkYN0XuM/Z3fk7IUz8BGKgQhXjsj42
 8x0g==
X-Gm-Message-State: AOJu0YyUpKeg27O+T9NxJ4DPWsxzKwu+IGVq9vDZj2UtOQ9TyQZEuE4H
 E3jXTFx4vpCc9c6TpiJlQ+Kn2w==
X-Google-Smtp-Source: AGHT+IGQoFqV3mXZFUhqqVLE77karmypdPlxVzdSMzHU6nlgAE8hcuMmyxCXTLlu72YlMdSRJDyyxg==
X-Received: by 2002:a9d:654b:0:b0:6d8:1c12:4863 with SMTP id
 q11-20020a9d654b000000b006d81c124863mr5936576otl.21.1701085081465; 
 Mon, 27 Nov 2023 03:38:01 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a63e94f000000b00578b40a4903sm7618323pgj.22.2023.11.27.03.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:38:01 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v2 1/8] target/riscv: implement svade
Date: Mon, 27 Nov 2023 08:37:45 -0300
Message-ID: <20231127113752.1290265-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
References: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
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
2.41.0



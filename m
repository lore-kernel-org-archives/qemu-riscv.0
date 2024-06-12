Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280B4C2BA12
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 08:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHJ8P-0002Q5-L2; Wed, 12 Jun 2024 04:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8O-0002O0-Cg
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 04:15:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sHJ8L-0006ML-Ut
 for qemu-riscv@nongnu.org; Wed, 12 Jun 2024 04:15:07 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1f68834bfdfso48623375ad.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jun 2024 01:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718180104; x=1718784904; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t/AUOAInjkFfC7EhRiJBRMiTPdQ2lCm4ch6BlghBPuU=;
 b=jEk7MZ49V+KEpP7chqDzqSr4KAbrCMbd/9f3K4LIXankxFSWg7kwf5ZN81zfI4NyA6
 5wlOX7HzZvbdlv1JKoHjZa/ABJX6L0J6Vn5f6wDr/aS5oMxqDRCVLLBLZY6XsdNjeRiD
 RmCVkpbAsWPPS9A9u3PMkQnUAzMu7yi4FVH89ixD/KskN2TfOD4wINdbeZM7VMb59KaJ
 CgPOCYqGqTejgSIgEeYv3eaE1kJ6XIRqSybRwb+jn+e3KQTFNn7bl7JBi4ok1tj80E2E
 Aruar2w9e+KKqSn1W6OoEgVmZztOnNQg/+Rpf/77fWYN0qsFuYxl9y+nwLVFzRcnG2rG
 6Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718180104; x=1718784904;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t/AUOAInjkFfC7EhRiJBRMiTPdQ2lCm4ch6BlghBPuU=;
 b=o5Z7dh5wNttMv5VGcYtk5Yy86APgRrzPHCKiafALYN7nsFF5KD+yoKly/H4THwg861
 W/LzjuYT4EhRCfwOPJnvsETdFTjXsGZw1R9QEO5rOdM0GZ88bg8E9OTc4CqbRU1gB256
 I/Bl5F7dbuCKcPWGiTcOWURxozp9ZzZbP1IHMTFjM3Zn+/630ecnOM1uAck4Q08cP3Op
 MFAgQTEuaDtIT+tBM2UNvHUSffjOhonHkBVk3j3Wb4LkS4tq2Hsopv4hglXV1qWaYvBY
 ucJgc0pGiClFhx7FoP6WBnYHB2CGQ7D4YXNUHYindAMUwrcXVI0EKYM/qPBxsvXTPJRk
 Snpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTofgGDSj5WDTf3GOLjmvHpHKEesWsVrsGjdA9KY/9o3/spl2dXA0PJBf+3JzpSgeI20Lg1d4VoTJRBXxMNpeAP+VZMIw=
X-Gm-Message-State: AOJu0Yz0TnljBtQhkkQLAmWXBZNkrCx1euKM8QjCWCm2Ksw645S0SwAB
 AYCQw/Pg2v1FiBbkjl+9yAX+zBnnvY4IPUIASDxy/t5xrPuEmHJwyDrGSMo8ukA=
X-Google-Smtp-Source: AGHT+IG5wJthYOfktPwpbknyCYAna1CFTxUI/ODaFFZ95fOwIwfQ0NUj0LE3JyOUAyDJz83FyZgtZw==
X-Received: by 2002:a17:902:d48b:b0:1f7:345a:e23d with SMTP id
 d9443c01a7336-1f83b6f6b61mr11145425ad.31.1718180104409; 
 Wed, 12 Jun 2024 01:15:04 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f8393e8e53sm11363875ad.16.2024.06.12.01.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:15:04 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [RFC PATCH 05/16] target/riscv: Add CPU options of WorldGuard CPU
 extension
Date: Wed, 12 Jun 2024 16:14:05 +0800
Message-Id: <20240612081416.29704-6-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240612081416.29704-1-jim.shu@sifive.com>
References: <20240612081416.29704-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62d.google.com
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

We define CPU options for WG CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating WG CSRs.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.c         |  8 ++++++++
 target/riscv/cpu_cfg.h     |  3 +++
 target/riscv/tcg/tcg-cpu.c | 11 +++++++++++
 3 files changed, 22 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 69a08e8c2c..d70eedf957 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -204,6 +204,9 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadmempair, PRIV_VERSION_1_11_0, ext_xtheadmempair),
     ISA_EXT_DATA_ENTRY(xtheadsync, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
+    ISA_EXT_DATA_ENTRY(smwg, PRIV_VERSION_1_12_0, ext_smwg),
+    ISA_EXT_DATA_ENTRY(smwgd, PRIV_VERSION_1_12_0, ext_smwgd),
+    ISA_EXT_DATA_ENTRY(sswg, PRIV_VERSION_1_12_0, ext_sswg),
 
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -1595,6 +1598,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
 const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
     MULTI_EXT_CFG_BOOL("zic64b", ext_zic64b, true),
 
+    /* RISC-V WorldGuard v0.4 */
+    MULTI_EXT_CFG_BOOL("x-smwg", ext_smwg, false),
+    MULTI_EXT_CFG_BOOL("x-smwgd", ext_smwgd, false),
+    MULTI_EXT_CFG_BOOL("x-sswg", ext_sswg, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index e1e4f32698..23e779ae08 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -120,6 +120,9 @@ struct RISCVCPUConfig {
     bool ext_ssaia;
     bool ext_sscofpmf;
     bool ext_smepmp;
+    bool ext_smwg;
+    bool ext_smwgd;
+    bool ext_sswg;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
 
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 683f604d9f..dc86e6e1d5 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -726,6 +726,17 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->pmu_avail_ctrs = 0;
     }
 
+    /* RISC-V WorldGuard */
+    if (cpu->cfg.ext_sswg && !cpu->cfg.ext_smwg) {
+        error_setg(errp, "Sswg extension requires Smwg extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_smwgd != cpu->cfg.ext_sswg) {
+        error_setg(errp, "Smwgd/Sswg extensions should be enabled together");
+        return;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.17.1



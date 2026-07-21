Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4E5C44529
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 12:21:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wm9Ss-0001yu-4i; Tue, 21 Jul 2026 08:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wm9So-0001xj-Te
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 08:20:46 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wm9Sm-0003mk-QM
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 08:20:46 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c981c2c37cbso6609423a12.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1784636443; x=1785241243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JIo0Ig4EH8UXlTV7LuZYL76vFSc4wKXBvyZXP0Ii10c=;
 b=cDkMfM4+hohHErdK/IIhpnYNNVrwKkUPqtVl+qBXTmV3JKfEjDBawYSMH+TnXnmLNb
 Y4ETjmou4P92Iznc0SWZILhqW3Mz7exSmCJEpgQhG3fAGu6jru9r8/wrOKqDcAq6P98J
 oH8+TOiqHqP2Iv0Or/9sygNf64OnCb9I6fosG19XgdudmwgpdWKMglkSWc0YvvL1zEIG
 SKt3QK8m8CAdIzKZ0QIoyZ2kaOFfXhJhIzMXamy9mODnzViiXM3wrowUHCuT1XwP7vlP
 87N+5crpEjgPm0tWCUDhqT5KQuvF2gcSdrJ2kN2gemBjknAP1z1OPFEvndQwdO60LoZH
 0rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784636443; x=1785241243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JIo0Ig4EH8UXlTV7LuZYL76vFSc4wKXBvyZXP0Ii10c=;
 b=j3RokMwbpBEtKjXs3yUiygdB61oQerZfwjdCMgBAyaQUvmpcsOqKkMx6vuZSNdjj8D
 WdJ1o35DAMf/jWE5cR0p9ivcFI3AU4Yx0hO9NCeqTz5Conh+17Wiy7qTsTgj4Pfkh8SO
 r26LkbjW0pJj0v5sY7+poxiXXpgvIoP77IgUEXqclOoHEmEZljWjfJzuO1a9n/fnTV8S
 ZJSCo0gGsRMLejMrzYk20yUydZHBwT6FvJRryuoHxrVoGjHLDxCKmwddfG1CocQq2tdq
 RrzDuw+JNmdNrljb7wccF7iB5YgB8/Iv2eQbHTpd2FDvyS7GdtIaWGaeED3hCNL1ubKm
 k9SA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1mwvm4w/9adP6vVb+higOZIbzMjhSlk4SXycAD3GQQw5qO+eI1C8xV/Y2fVhosIS6lITFi/MF9bfh@nongnu.org
X-Gm-Message-State: AOJu0YwXS8eGyyn/xivMjkCJgDXtJkVom+YVPJnLWt767HM3GZtUmDGt
 xMPXXNTrWds54DsnfP5zLJWqsywpVVm5B8bPNlonGb5C9fZSoZ3Jkqes+dhCQWl+26bwHtLpkm2
 MNaUf
X-Gm-Gg: AfdE7cnf1ulk2bGE1wGiHXu3vLNEneurL9lDk/mJFoUZ4eDsETViTEOI43BanndyPN/
 f7gTD0oFehzjk1J2nqDPx6tquIh0diDBiQacV0ax/Ujx4/HowmVTFJWGSMEdNHF3LZkAuntEnie
 JQlssQsg4ANx0SYUYW+TJxNgh9YkdDWvC+Z23uijIJ2T5x3XXhJOsWz+83DQOnvH2iQ7+lYrhD6
 CBRcqiEJaGbKs3DfYcF/V7bRtCg/JtNNQ1Lq1vDlAV2qHfRQzvwELu60GzA/6oSrPfKb3akXMtL
 NQZtaXZ+pqEF3Y/QVoXAan1GbmXqQ4dbTtUs4eXm8F8DGHK8qw1LYJ3TBb2jeahFdjCKgSpWWtz
 FqNWOwmgIQAu46+jZU6j0kRoDg57eiltab0OwAuMEnXz5De6hhMd0lJ6iTmOxFOuo6b+bnjSuvo
 rzCuSv1WN5i2JZEPtJXdccdhAxWg8D81ahhwuap35Emx0s4b2j0jxWmQjpVjGM7GVDeNsUTUvo/
 7ckaQ==
X-Received: by 2002:a05:6a20:9397:b0:3c3:8de3:8eee with SMTP id
 adf61e73a8af0-3c3ad95142fmr20595025637.61.1784636442994; 
 Tue, 21 Jul 2026 05:20:42 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cb517aad95dsm5904568a12.7.2026.07.21.05.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 05:20:42 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/5] target/riscv: Add cfg property for SiFive int8 matmul
 extensions
Date: Tue, 21 Jul 2026 20:20:29 +0800
Message-ID: <20260721122034.1567146-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721122034.1567146-1-max.chou@sifive.com>
References: <20260721122034.1567146-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52a.google.com
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

Add the CPU config properties for SiFive's custom int8 matrix
multiply vector extensions:

- Xsfvqmaccdod: 2x8x2 int8 matrix-multiply-accumulate operations
- Xsfvqmaccqoq: 4x8x4 int8 matrix-multiply-accumulate operations

All instructions of these extensions require the Zve32x extension
to be present whenever either extension is enabled. Validate this
in riscv_cpu_validate_vendor_ext() alongside the existing vector
extension validation in riscv_cpu_validate_set_extensions().

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                |  2 ++
 target/riscv/cpu_cfg_fields.h.inc |  2 ++
 target/riscv/tcg/tcg-cpu.c        | 16 ++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5a82e6563b..e643d7c7af 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -298,6 +298,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xmipscbop, PRIV_VERSION_1_12_0, ext_xmipscbop),
     ISA_EXT_DATA_ENTRY(xmipscmov, PRIV_VERSION_1_12_0, ext_xmipscmov),
     ISA_EXT_DATA_ENTRY(xmipslsp, PRIV_VERSION_1_12_0, ext_xmipslsp),
+    ISA_EXT_DATA_ENTRY(xsfvqmaccdod, PRIV_VERSION_1_13_0, ext_xsfvqmaccdod),
+    ISA_EXT_DATA_ENTRY(xsfvqmaccqoq, PRIV_VERSION_1_13_0, ext_xsfvqmaccqoq),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 9eb47af0a7..73448fab5e 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -156,6 +156,8 @@ BOOL_FIELD(ext_xmipscbop)
 BOOL_FIELD(ext_xmipscmov)
 BOOL_FIELD(ext_xmipslsp)
 BOOL_FIELD(ext_xlrbr)
+BOOL_FIELD(ext_xsfvqmaccdod)
+BOOL_FIELD(ext_xsfvqmaccqoq)
 
 BOOL_FIELD(big_endian)
 BOOL_FIELD(mmu)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 4af5cd9c73..c90023a212 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -417,6 +417,16 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
     }
 }
 
+static void riscv_cpu_validate_vendor_ext(RISCVCPU *cpu, Error **errp)
+{
+    if ((cpu->cfg.ext_xsfvqmaccdod || cpu->cfg.ext_xsfvqmaccqoq) &&
+        !cpu->cfg.ext_zve32x) {
+        error_setg(errp, "Xsfvqmaccdod/Xsfvqmaccqoq extensions require "
+                         "Zve32x extension");
+        return;
+    }
+}
+
 static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 {
     CPURISCVState *env = &cpu->env;
@@ -794,6 +804,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    riscv_cpu_validate_vendor_ext(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     if (mcc->def->misa_mxl_max == MXL_RV32 && cpu->cfg.ext_svukte) {
         error_setg(errp, "svukte is not supported for RV32");
         return;
-- 
2.55.0



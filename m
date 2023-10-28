Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6493DC27C47
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 08:56:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwf5h-0000Hu-E3; Sat, 28 Oct 2023 04:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwf5f-0000Ha-9c
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 04:54:43 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qwf5d-000484-FB
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 04:54:43 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5a7b3d33663so24388467b3.3
 for <qemu-riscv@nongnu.org>; Sat, 28 Oct 2023 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698483280; x=1699088080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=INA7yW1+cVZ7BCZOXV0HX5iWgAegiztxFIl1iYOUv7g=;
 b=LxPpQyOnGa2bMFmW2OMcPTptlLfXhDkCorf7ZPs7ZP7B1MUgVTxuQwsPdPHOpinK7k
 0CLbOyyNcDCXc5Qr3eumHKy+T8err1Poq3iPm+0i9ghAFQyPgTcmpdh7zbjgJkHJko8H
 /OF5iQ5eZ/CiT4Eh1TFKQAD/snTWGjqqGGwv6i3u2BjhjgdwygFRuuPLrvm2oZ2fhazc
 6FUEF4hjvQlS7+brxC1bvV61fgBsihMKlu2rOAjV7TeqEb9TyGeU3PpbS61GW9IHv1mZ
 bLhp6gmoKgxKmOzsGYM+QRo0PoZe9pAXWb8lsE7FusyiHvW44dH/BwVrplxFxRqc2sai
 hDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698483280; x=1699088080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=INA7yW1+cVZ7BCZOXV0HX5iWgAegiztxFIl1iYOUv7g=;
 b=SvIPNCyiSOAHR42vo6ABh3fG6nroFbpfMOuqh4lPg+nap94J4hvsMYCrb6lFn9KCG0
 KankeqTVWMD3ikEfeQrJctnn2z8PkkMAf3kaiFeDdJGkFvvpvetHzwNu4VE1z7va44Wa
 wEwq/6oYMBcbKKM75Bnthrcjfu2N9EgUdAk7a/ep0tS7PGGY3vA6/UYMkUgyRh9yAJxJ
 77e6xWuSaE4JPe7QYnL7w3PpsGWfqQ0A6D74ne+k4ia4+dFKDT2n4wcJnJIMFjBytss2
 tZ3rNe3N+6nxZ+4ooEPIKVIGO5GUUvuEzEzHgjRkiMOxwILEMpQbYGwM2tYojXYTJPMJ
 7VZQ==
X-Gm-Message-State: AOJu0YyOuVj6+Fz9Qnq5qfXcR6OHbMLBw3YREyBj19VK2W2t7loPhG01
 7yi+0DbtlmSIGzFgRyD4L5/s0g==
X-Google-Smtp-Source: AGHT+IH61dJfVYOhme9Ql5efwkTYa98M6QYzYIr8J/1+mPokcv+40Ceij+J3P3+5P2bDvH/e1clyjg==
X-Received: by 2002:a81:ac66:0:b0:5a8:1d44:256 with SMTP id
 z38-20020a81ac66000000b005a81d440256mr4914735ywj.7.1698483280231; 
 Sat, 28 Oct 2023 01:54:40 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a81830f000000b00594fff48796sm1604325ywf.75.2023.10.28.01.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 01:54:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 02/12] target/riscv/tcg: add 'zic64b' support
Date: Sat, 28 Oct 2023 05:54:17 -0300
Message-ID: <20231028085427.707060-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231028085427.707060-1-dbarboza@ventanamicro.com>
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1131.google.com
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

zic64b is defined in the RVA22U64 profile [1] as a named feature for
"Cache blocks must be 64 bytes in size, naturally aligned in the address
space". It's a fantasy name for 64 bytes cache blocks. The RVA22U64
profile mandates this feature, meaning that applications using this
profile expects 64 bytes cache blocks.

To make the upcoming RVA22U64 implementation complete, we'll zic64b as
a 'named feature', not a regular extension. This means that:

- it won't be exposed to users;
- it won't be written in riscv,isa.

This will be extended to other named extensions in the future, so we're
creating some common boilerplate for them as well.

zic64b is default to 'true' since we're already using 64 bytes blocks.
If any cache block size (cbo{m,p,z}_blocksize) is changed to something
different than 64, zic64b is set to 'false'.

Our profile implementation will then be able to check the current state
of zic64b and take the appropriate action (e.g. throw a warning).

[1] https://github.com/riscv/riscv-profiles/releases/download/v1.0/profiles.pdf

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 15 ++++++++++++---
 target/riscv/cpu.h         |  3 +++
 target/riscv/cpu_cfg.h     |  1 +
 target/riscv/tcg/tcg-cpu.c | 14 ++++++++++++++
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6c0050988f..316d468a19 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1396,6 +1396,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
+    MULTI_EXT_CFG_BOOL("zic64b", zic64b, true),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 /* Deprecated entries marked for future removal */
 const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
     MULTI_EXT_CFG_BOOL("Zifencei", ext_zifencei, true),
@@ -1425,9 +1431,12 @@ Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
-    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
-    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 64),
-    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
+    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU,
+                       cfg.cbom_blocksize, CB_DEF_VALUE),
+    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU,
+                       cfg.cbop_blocksize, CB_DEF_VALUE),
+    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU,
+                       cfg.cboz_blocksize, CB_DEF_VALUE),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8efc4d83ec..ee9abe61d6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -64,6 +64,8 @@ extern const uint32_t misa_bits[];
 const char *riscv_get_misa_ext_name(uint32_t bit);
 const char *riscv_get_misa_ext_description(uint32_t bit);
 
+#define CB_DEF_VALUE 64
+
 #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
 
 /* Privileged specification version */
@@ -745,6 +747,7 @@ typedef struct RISCVCPUMultiExtConfig {
 extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
+extern const RISCVCPUMultiExtConfig riscv_cpu_named_features[];
 extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
 extern Property riscv_cpu_options[];
 
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 2203b4c45b..f61a8434c4 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -108,6 +108,7 @@ struct RISCVCPUConfig {
     bool ext_smepmp;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
+    bool zic64b;
 
     uint32_t mvendorid;
     uint64_t marchid;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 093bda2e75..65d59bc984 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -264,6 +264,18 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
+static void riscv_cpu_validate_zic64b(RISCVCPU *cpu)
+{
+    cpu->cfg.zic64b = cpu->cfg.cbom_blocksize == CB_DEF_VALUE &&
+                      cpu->cfg.cbop_blocksize == CB_DEF_VALUE &&
+                      cpu->cfg.cboz_blocksize == CB_DEF_VALUE;
+}
+
+static void riscv_cpu_validate_named_features(RISCVCPU *cpu)
+{
+    riscv_cpu_validate_zic64b(cpu);
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -586,6 +598,8 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    riscv_cpu_validate_named_features(cpu);
+
     if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
-- 
2.41.0



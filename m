Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87658E77188
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 11:41:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNsQj-0007mQ-Lb; Wed, 18 Dec 2024 06:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNsQV-0007cc-1U
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 06:41:18 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNsQQ-0007xl-1Y
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 06:41:12 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2165448243fso62133945ad.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 03:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734522068; x=1735126868; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQDYd8goWFdiiQvBBrxBKIN+0R/MG7OS8oAWf14cKlo=;
 b=eNgTxk8Tk1rQ+yXxzcUQhtl+CCtpalQMKYx4TvMdyHH4p2CVP5332Ihp28XpUDc74M
 PvbJaSjVBuXVuGkZhTEfwBtEoNJiH3ECv2M0bIwfZZfMdL9bR33JUx0ZLHDnpnVNr0qU
 YsOWcxGVtn6wHR/3MXSV4iHaAaF8RFhb5sOa4ilEiDh9jmP9A9CwRrYyu1fhD23LSwod
 +dsCMNYn4zbmZjuNJ1XqnPbyQDqf31Urim1f416TKzVQa6e/s3uLhIQWtGiouvJ8aY82
 zxRdWOhhigPNXkIkksF60GGYxMVSivBniQKCruIN/m4rXRzhxJz1S5wgl4fqJGmanS3M
 zWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734522068; x=1735126868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQDYd8goWFdiiQvBBrxBKIN+0R/MG7OS8oAWf14cKlo=;
 b=K9hlehnpn+AQpgt7+n1QY6Su9hYp6rIgA/fHUr3sCHpsbW6avmlCbAcFN22WSHlHTo
 gfvGnVIV2FqNtMbw8ETKMJY/BWXxVh1rmrmP5J+v3/DS6cTSoOdi+8UjwiHuKs5QeHjz
 3rM15fSDo3ivsKgQZaSVmtexQxFSWijyqrVRF6E5mzyuXOWP+d1QPnlKxfBsKns8ty6Q
 sX7OI5x9Uwn+9vC+x3ed8iqLWpB8RCFVQ3DfRNt8m3FpxoPwaeOmVtHX7SxrBDsUoxKU
 SM8FMID93SRqTdqlea6DvM21b6+ZWhY3TGDmGWIPxnT6inlXZRbYf3eV+RWOJbHHJ7ZM
 IU2w==
X-Gm-Message-State: AOJu0YyCcNMCr7hljhOy2lD+N+7hzgpKmVPObYwbSTwGN8JZX7xlA1bL
 7pcnV2C53QA9sI1wB9akp/jztPV0HsP8NnjGetyUH27hdnhIx/sjJHmgT1MM8rs=
X-Gm-Gg: ASbGncu1U42yxi6L+xVBc94g6q/MVxwYC/L8Nk9D7AFiQmLhirK/lw4l0TNckxK3ceI
 j7nTsYnpEFgg4ZyZ/nSlyfLyutnQbCKpV1KxY3IyIPC6WTD1n7rcZm/VnctlhoR6ewDoouN1OiS
 njrarhvURhLgrLxXUOsaUl2ehlERQOqlwppSyYdnKlEroXqJavRarwPrAAwCx3aA1jqEHO/I6Qo
 8UHt9qOxw0incZLVLz36ZUY3gZgBj31bvi6qQ+QN/c8oCAMGqXOracf2tWY4UsOtozQIlWkIKzv
 lg==
X-Google-Smtp-Source: AGHT+IGlbMKzSjQAr7+Exa84raNs/YbPOp6zO5xXJkkL81Qk7Rib8vvf8G97aZgunyVRf322FWA6hQ==
X-Received: by 2002:a17:902:d481:b0:215:385e:921c with SMTP id
 d9443c01a7336-218d726cbf6mr29639195ad.51.1734522068679; 
 Wed, 18 Dec 2024 03:41:08 -0800 (PST)
Received: from localhost.localdomain ([2804:7f0:bcc0:51cf:9cf:d2f2:d49e:7bd9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1dcb447sm74462285ad.68.2024.12.18.03.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:41:08 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 9/9] target/riscv/tcg: add sha
Date: Wed, 18 Dec 2024 08:40:26 -0300
Message-ID: <20241218114026.1652352-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218114026.1652352-1-dbarboza@ventanamicro.com>
References: <20241218114026.1652352-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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

'sha' is the augmented hypervisor extension, defined in RVA22 as a set of
the following extensions:

- RVH
- Ssstateen
- Shcounterenw (always present)
- Shvstvala (always present)
- Shtvala (always present)
- Shvstvecd (always present)
- Shvsatpa (always present)
- Shgatpa (always present)

We can claim support for 'sha' by checking if we have RVH and ssstateen.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 2 ++
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 8 ++++++++
 3 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 41629019e2..9b55198a46 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -184,6 +184,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(shcounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(sha, PRIV_VERSION_1_12_0, ext_sha),
     ISA_EXT_DATA_ENTRY(shgatpa, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(shtvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(shvsatpa, PRIV_VERSION_1_12_0, has_priv_1_12),
@@ -1713,6 +1714,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
 const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
     MULTI_EXT_CFG_BOOL("zic64b", ext_zic64b, true),
     MULTI_EXT_CFG_BOOL("ssstateen", ext_ssstateen, true),
+    MULTI_EXT_CFG_BOOL("sha", ext_sha, true),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index a1457ab4f4..fe0c4173d2 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -141,6 +141,7 @@ struct RISCVCPUConfig {
     bool ext_svade;
     bool ext_zic64b;
     bool ext_ssstateen;
+    bool ext_sha;
 
     /*
      * Always 'true' booleans for named features
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index cbf2cf1963..3480767b35 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -210,6 +210,11 @@ static void riscv_cpu_enable_named_feat(RISCVCPU *cpu, uint32_t feat_offset)
         cpu->cfg.cbop_blocksize = 64;
         cpu->cfg.cboz_blocksize = 64;
         break;
+    case CPU_CFG_OFFSET(ext_sha):
+        if (!cpu_misa_ext_is_user_set(RVH)) {
+            riscv_cpu_write_misa_bit(cpu, RVH, true);
+        }
+        /* fallthrough */
     case CPU_CFG_OFFSET(ext_ssstateen):
         cpu->cfg.ext_smstateen = true;
         break;
@@ -350,6 +355,9 @@ static void riscv_cpu_update_named_features(RISCVCPU *cpu)
                           cpu->cfg.cboz_blocksize == 64;
 
     cpu->cfg.ext_ssstateen = cpu->cfg.ext_smstateen;
+
+    cpu->cfg.ext_sha = riscv_has_ext(&cpu->env, RVH) &&
+                       cpu->cfg.ext_ssstateen;
 }
 
 static void riscv_cpu_validate_g(RISCVCPU *cpu)
-- 
2.47.1



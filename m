Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DB0CCFA13
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 02:32:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vHCGU-0006G3-Jh; Thu, 06 Nov 2025 21:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vHCGR-0006Eb-7g
 for qemu-riscv@nongnu.org; Thu, 06 Nov 2025 21:31:47 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vHCGO-0002wA-2R
 for qemu-riscv@nongnu.org; Thu, 06 Nov 2025 21:31:46 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2952048eb88so3632915ad.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Nov 2025 18:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1762482702; x=1763087502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DY6gp++mEiAa25/v6nXiBTsLV9urICNYQrtoFh1K61s=;
 b=K4UFcDkfHvCdbh/EPfFMh/lVgNL0E/Mlk5jI2L/+IgVyAEy3kgIfHGXRuqBQCLChRS
 X/phWsdypObX6NXUCB/qJN6tvoAtbMGvorvyZwjZzhNZExFW9OsUJb/pMDjsPX7tizng
 9jbs4CHZ7hW210iCumJ4abMAGpCCcpjlmoLFmSPR5ouIoSpqeGhzdfZDFuznNAUIbxM6
 3gtVg5zNucOq+ebApPqAglxWEGC5sWAF2MkMQN9UKa9eHcq3mFHcQrOErFiK8RktFTga
 Lu3rGUUxiC/lQLKQp5YZ/o8pqxKWG5xDqABcM0SeS5+YY19zqk68TaVI5DsZLo0trd8v
 5VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762482702; x=1763087502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DY6gp++mEiAa25/v6nXiBTsLV9urICNYQrtoFh1K61s=;
 b=TEq9HuMFYnHvqNthLdOultqcet84HlsVY7ePPoeJzZ2YZbh4lGmGi3LbSnyLMjYfkO
 3YSt5KjP+BqUE/aGjQkehJD0q5CUbp5Svm9UZO+UTkfCDoPEdB2C0E1FJG060UU5K+/G
 epJvIuPMdybNR01XoKLc0NzaWfdMlpRX1BvTh5l+GY8d7ytRTtcLEOnU/jwcnnp8EyBk
 QeH4YVvm0vUvyFWU5XnVgCPRtSC1xmFpTwBj/xCAuK57wu5eNEUsDw1QdpklHP/3FcVx
 iPq5UVVOtarkkBMJbv/sw8x3BMyGlRxW71BRMrLZzuUYlRQi+/2XxGjI0oYLOgBweGy/
 5pBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL8BVR3SbLZHt/hSJQ78X3mFcJPI0tgGthyM5eHbtYqKNmLCrRQwRWYsSI+tSAne0J68BUCidxt12X@nongnu.org
X-Gm-Message-State: AOJu0YylSc2eJbXYKRrCwpF/luJoATY/LP9BlvyZVD1+p6elHmE8cHZy
 2vVDp6wmVZ8sbcJGBtkKpmZuEdHr6i77SHO6FXv7KwrD2h+o2OHz3r16vaobBqPZ060=
X-Gm-Gg: ASbGncu7W5UfRCuepiMP3yv1DQHP4wruYJPU8HsZMfH14rItGTBMWld9u8uZ4V+MCpf
 Br91/2P+ndRR06qCp0rqQmCSf1GwR2RCmvQDjEpKwJPvPmgmCM/c4HVIPvpCfobEa/bAbmaj+y8
 QeRDGvxaZu+0V5HuCTV6w6hnfeIa9bc/UihJXEJc/+YXrQLCocCIbd/cBweBpQQp3eF6hA2dwL+
 allCaboKEsobKn054GF4f7eCxXQ+/x3kMLbWS2Cj+qJh754fh7G7Id5O3UKf86XLpH0hpnGYQng
 AOrWrIOvuxT7dxw8f3vmg2I7ew8oGgCQlOApCcEpjkhaZDRDsBD9NdmnZXkLxzmkdNw/h765GUa
 K2qId2cGx+JEAQTxDOz0RIBi8CKvhEeoVFLZy6EpvhM+cNEdigze8au3I5jB0jQIL9kAByM7tDK
 IADKLk1/E8TOwWH8ouC50X4KjNFV2T4M+5OPLYwF8=
X-Google-Smtp-Source: AGHT+IECF1HWgGebGi88d+FEvKlKfn+1in6jeeypiKZ0z5+1xcsFi/GL2HgtqzESO0AM74WSiNGZgg==
X-Received: by 2002:a17:902:ecc9:b0:262:9c4:5470 with SMTP id
 d9443c01a7336-297c044f7a3mr22379935ad.28.1762482701781; 
 Thu, 06 Nov 2025 18:31:41 -0800 (PST)
Received: from jchang-1875.internal.sifive.com ([136.226.240.208])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651ca1eb7sm43499775ad.89.2025.11.06.18.31.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Nov 2025 18:31:41 -0800 (PST)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jay Chang <jay.chang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2] target/riscv: Support Smpmpmt extension
Date: Fri,  7 Nov 2025 10:31:36 +0800
Message-ID: <20251107023136.89181-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=jay.chang@sifive.com; helo=mail-pl1-x62e.google.com
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

The Smpmpmt extension provides a mechanism to control memory attributes
at the granularity of PMP (Physical Memory Protection) registers, similar
to how Svpbmt controls memory attributes at the page level.

Version 0.6
https://github.com/riscv/riscv-isa-manual/blob/smpmpmt/src/smpmpmt.adoc#svpbmt

Signed-off-by: Jay Chang <jay.chang@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

---
v2:
    Place smpmpmt in the correct riscv,isa order.

Signed-off-by: Jay Chang <jay.chang@sifive.com>
---
 target/riscv/cpu.c                |  2 ++
 target/riscv/cpu_cfg_fields.h.inc |  1 +
 target/riscv/pmp.c                | 12 ++++++++++++
 target/riscv/pmp.h                |  1 +
 4 files changed, 16 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ae8b721e55..0760ee7d9e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -203,6 +203,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smcsrind, PRIV_VERSION_1_13_0, ext_smcsrind),
     ISA_EXT_DATA_ENTRY(smdbltrp, PRIV_VERSION_1_13_0, ext_smdbltrp),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
+    ISA_EXT_DATA_ENTRY(smpmpmt, PRIV_VERSION_1_12_0, ext_smpmpmt),
     ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
     ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_13_0, ext_smmpm),
     ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_13_0, ext_smnpm),
@@ -1262,6 +1263,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
     MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
+    MULTI_EXT_CFG_BOOL("smpmpmt", ext_smpmpmt, false),
     MULTI_EXT_CFG_BOOL("svrsw60t59b", ext_svrsw60t59b, false),
     MULTI_EXT_CFG_BOOL("svvptc", ext_svvptc, true),
 
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index a154ecdc79..b1096da664 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -57,6 +57,7 @@ BOOL_FIELD(ext_svadu)
 BOOL_FIELD(ext_svinval)
 BOOL_FIELD(ext_svnapot)
 BOOL_FIELD(ext_svpbmt)
+BOOL_FIELD(ext_smpmpmt)
 BOOL_FIELD(ext_svrsw60t59b)
 BOOL_FIELD(ext_svvptc)
 BOOL_FIELD(ext_svukte)
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 3ef62d26ad..52a7677683 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -165,6 +165,18 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
                           "ignoring pmpcfg write - invalid\n");
         } else {
             uint8_t a_field = pmp_get_a_field(val);
+
+            if (!riscv_cpu_cfg(env)->ext_smpmpmt) {
+                /* If smpmpmt not supported, clear the MTMATCH bit */
+                val &= ~PMP_MTMATCH;
+            } else if ((val & PMP_MTMATCH) == PMP_MTMATCH) {
+                /*
+                 * If trying to set reserved value (0x3) for MT field,
+                 * preserve the original MT field from current config.
+                 */
+                val = (val & ~PMP_MTMATCH) |
+                    (env->pmp_state.pmp[pmp_index].cfg_reg & PMP_MTMATCH);
+            }
             /*
              * When granularity g >= 1 (i.e., granularity > 4 bytes),
              * the NA4 (Naturally Aligned 4-byte) mode is not selectable
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 271cf24169..467fb6b4b1 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -29,6 +29,7 @@ typedef enum {
     PMP_WRITE = 1 << 1,
     PMP_EXEC  = 1 << 2,
     PMP_AMATCH = (3 << 3),
+    PMP_MTMATCH = (3 << 5),
     PMP_LOCK  = 1 << 7
 } pmp_priv_t;
 
-- 
2.48.1



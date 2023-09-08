Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD216EEB560
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qegC1-0003Jy-Ip; Fri, 08 Sep 2023 14:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegBz-0003IS-DB; Fri, 08 Sep 2023 14:26:55 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegBw-0006mk-U0; Fri, 08 Sep 2023 14:26:55 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bf1f632b8so300883166b.1; 
 Fri, 08 Sep 2023 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694197611; x=1694802411; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xAJzL3UFw1DN5li2iMX/eafl89efIRabG5Xy7FGMFn4=;
 b=cdpjcFB00WWtJU1kiTf906mqADatAJ2AeRX2/M8DgryRpzm3WyrIE8vAVA9vWZr/+G
 4+q4TXW504FkmCbu5WXpRdJ5SjBgrpIM6Z/cbiTWopQUjJTgVmJtROwGk/knL6q/auOw
 4Aqfl1RAZkOW84GEZo11YscEuUmvexYEvjUmliC1kTaJcRrd/sO8WHAabIj1bnLigrUU
 f2GZGCeCj3sHql8xQlrwapxKUDKyfDUzNLeg8bkB407HomEKV7Dk89XVaf2z7GV/aKpk
 r2Qa44ZDaupxxJQIiKg/CC0Xav2pu9vkgkBp6Mj6h/fYPdfzjqXtgoFDR6ZF7pUTYgKd
 MXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694197611; x=1694802411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xAJzL3UFw1DN5li2iMX/eafl89efIRabG5Xy7FGMFn4=;
 b=GDC79zFBUbx5oi1Lu5Fu/yHz15j2sH5cD60ZzUt8z2zRu27CYcGXNiQ2M7anYB/LwF
 +LpxyDRzvNxl1JWVwO6d8NRsBkK2ne1Ny8xaS8vDeAyN6flqL2MBdGXF74FeV/cw63BA
 XfUzI1FZ6mozug6+roKJeHWxMib/cUgDLKJ+QINAJRoY0KjaB7c6JAMTWddMRv5ffxNo
 YeCxVlMTPDWc9ybuhnNDaAAvnmnVpJ8lyBneNEhwgI9e4KNcDNVDcYiykMppHSi5eot0
 2/SerxZrt2xnc0xwLSEfqOkCdTPogq+m0gEPeGX1fFMLpMcYJRBwDZid5hOJeAILw3t1
 k52w==
X-Gm-Message-State: AOJu0YysfIf/DlMArTi6HwK/9csgDXCapFf4lko6wkI+c0DqMlDX0Mdt
 CtWFVh2bwuXK5Pr+woHjtg4=
X-Google-Smtp-Source: AGHT+IG9QOjnu7nV5Y94GklMJ5cAtzyE3y5PIsS6yaiVdpILzAHy3+by/uB6VB1Gg+srEm3AhLEC/Q==
X-Received: by 2002:a17:906:21b:b0:99b:e5c3:2e45 with SMTP id
 27-20020a170906021b00b0099be5c32e45mr2813221ejd.28.1694197611143; 
 Fri, 08 Sep 2023 11:26:51 -0700 (PDT)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 cb22-20020a170906a45600b0099d804da2e9sm1342667ejb.225.2023.09.08.11.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 11:26:50 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC v1 3/8] target/riscv: Add new bits in CSRs for Zjpm 0.6.1
Date: Fri,  8 Sep 2023 18:26:35 +0000
Message-Id: <20230908182640.1102270-4-baturo.alexey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908182640.1102270-1-baturo.alexey@gmail.com>
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu_bits.h |  6 ++++++
 target/riscv/csr.c      |  8 ++++++++
 target/riscv/pmp.c      |  5 +++++
 target/riscv/pmp.h      | 12 +++++++-----
 4 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 87a741fe66..238f7a13f4 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -714,6 +714,8 @@ typedef enum RISCVException {
 #define MENVCFG_CBIE                       (3UL << 4)
 #define MENVCFG_CBCFE                      BIT(6)
 #define MENVCFG_CBZE                       BIT(7)
+#define MENVCFG_SPMEN                      BIT(8)
+#define MENVCFG_SPMENSELF                  BIT(9)
 #define MENVCFG_HADE                       (1ULL << 61)
 #define MENVCFG_PBMTE                      (1ULL << 62)
 #define MENVCFG_STCE                       (1ULL << 63)
@@ -727,11 +729,15 @@ typedef enum RISCVException {
 #define SENVCFG_CBIE                       MENVCFG_CBIE
 #define SENVCFG_CBCFE                      MENVCFG_CBCFE
 #define SENVCFG_CBZE                       MENVCFG_CBZE
+#define SENVCFG_UPMEN                      MENVCFG_SPMEN
+#define SENVCFG_UPMENSELF                  MENVCFG_SPMENSELF
 
 #define HENVCFG_FIOM                       MENVCFG_FIOM
 #define HENVCFG_CBIE                       MENVCFG_CBIE
 #define HENVCFG_CBCFE                      MENVCFG_CBCFE
 #define HENVCFG_CBZE                       MENVCFG_CBZE
+#define HENVCFG_HPMEN                      MENVCFG_SPMEN
+#define HENVCFG_HPMENSELF                  MENVCFG_SPMENSELF
 #define HENVCFG_HADE                       MENVCFG_HADE
 #define HENVCFG_PBMTE                      MENVCFG_PBMTE
 #define HENVCFG_STCE                       MENVCFG_STCE
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a08285e55d..c7e59168d2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1942,6 +1942,10 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
                 (cfg->ext_sstc ? MENVCFG_STCE : 0) |
                 (cfg->ext_svadu ? MENVCFG_HADE : 0);
     }
+    if (riscv_cpu_cfg(env)->ext_smnjpm) {
+        /* for zjpm v0.6.1 MENVCFG_SPMENSELF should be always 0 */
+        mask |= MENVCFG_SPMEN;
+    }
     env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
 
     return RISCV_EXCP_NONE;
@@ -1993,6 +1997,10 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
         return ret;
     }
 
+    if (riscv_cpu_cfg(env)->ext_ssnjpm) {
+        /* for zjpm v0.6.1 SENVCFG_UPMENSELF should be always 0 */
+        mask |= SENVCFG_UPMEN;
+    }
     env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
     return RISCV_EXCP_NONE;
 }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 9d8db493e6..0db49173ef 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -580,6 +580,11 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
         val &= ~(MSECCFG_MMWP | MSECCFG_MML | MSECCFG_RLB);
     }
 
+    if (riscv_cpu_cfg(env)->ext_smmjpm) {
+        /* for zjpm v0.6.1 MSECCFG_MPMENSELF should be always 0 */
+        val &= ~MSECCFG_MPMENSELF;
+    }
+
     env->mseccfg = val;
 }
 
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index cf5c99f8e6..e4a58c9974 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -39,11 +39,13 @@ typedef enum {
 } pmp_am_t;
 
 typedef enum {
-    MSECCFG_MML   = 1 << 0,
-    MSECCFG_MMWP  = 1 << 1,
-    MSECCFG_RLB   = 1 << 2,
-    MSECCFG_USEED = 1 << 8,
-    MSECCFG_SSEED = 1 << 9
+    MSECCFG_MML       = 1 << 0,
+    MSECCFG_MMWP      = 1 << 1,
+    MSECCFG_RLB       = 1 << 2,
+    MSECCFG_USEED     = 1 << 8,
+    MSECCFG_SSEED     = 1 << 9,
+    MSECCFG_MPMEN     = 1 << 10,
+    MSECCFG_MPMENSELF = 1 << 11
 } mseccfg_field_t;
 
 typedef struct {
-- 
2.34.1



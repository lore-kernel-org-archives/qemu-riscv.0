Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF39DCAC597
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 08:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy4mD-0007dP-Lj; Mon, 15 Sep 2025 04:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4m1-0007ZF-Mj
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:23 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4li-0002PM-UU
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:21 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-244582738b5so31474415ad.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757925659; x=1758530459; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8bkp/2RhmTzgkQ8Cw2+fik4TCLNZkEx0p226/BN2d8=;
 b=dM6YDXk/aKBizBjFWM0fAXxRs32rltoGeqnjSiUFVBF2nJYNB3PJfHhtmvQiMMW3/8
 0/n5BVU35meTxpbyTMe91qwqe2sm0hTHwzCQxvBzQRIzGMBhEhlgYl/3u3AiVJamDT8W
 k9/V/xwpRgd6BzOcDqhi4dZWJlXfYeoE1BZS2s4Fyv9zveSORa2my2wIuR0Ne9JGV/xc
 cD7FTpkC/e3LUC1SZIA2cVzeCdJOwcghWMHjeHIXlk2/PJ8NrvA2tkOwd3LmSRuEjbSB
 GjbGmlBLda2GL+QqJu7iAs9Z9nm7NwNylLTz23BDm8xJ45evZdBIL+eoOjCvamceGoOC
 Uqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757925659; x=1758530459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8bkp/2RhmTzgkQ8Cw2+fik4TCLNZkEx0p226/BN2d8=;
 b=CfCEx1snjUnFPLAjkJgh1H/DE2GCQWJwGifKGKtOuP1HYMRUi6A6nCpuLcliCZ3oOn
 UVd5NyfCTknDz+eXnSBrDnvn9j6KLyL0PmfcLJCF2Dcj6kxqG0NlXn1D4MjbTwOS2RmY
 skIG8AgWGFf6SHJpc5Pl9mKgy2zzWz6VAGigdwtlAkefHYjUd4ff8f3xlewXsQEnUrpV
 OUk8mDUWSziZmeN757J7H+/iFVnVwTnRx34G5zrNNaORrsQR/Q958c24BlGvn2YCt0iw
 q2HA8V+SfZQry1bTAVyoBT+3jqALWeqD55QuFlLMi+nrqP0APiedHhI7YXvqL2hAkLqb
 k/5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJJI3aIvl2wX6wWUWvJCITGZk8z1WJb7ywBKs44IMbJe74vOTM4YIALm3hui3/YIZCyqhSXKymDRNN@nongnu.org
X-Gm-Message-State: AOJu0YyWN7x9VYIpM/G2vjn+27gkN7WiwERKM/wivwrPmpyYfgVCWZzu
 eitlAPm0Yq4Bsq6GJJYxYBKgAs3F5bPueVAMOjdiiddi3YbrU4AiLyEXrQzh5YRNA+I=
X-Gm-Gg: ASbGncuvfXTFyq7xCOA041p7tYOzCmDPZDpkfC/6cGAn4JBoUCILon8sdIfzoaG5/Ug
 TRY7wucf0swKIatdFfjph2VyH75UvzzmP0OENEOXk1Bb3jnChSCDzGoaWUmeDP95OEk0XFDGIrX
 P+TgJkCdQJ/EFdk3CwmO5PWoulFixQOi+T6XPLoMas5ZHi7T0McVxSjj2KuBIEd4nsN6prfjDKI
 oLidaYAKVfqxt6+IzVEd/rWtc0CANOBJUmFL+bqcdwwmOMAgydpvdWzsJBj/ufCMCU2rSOsCHWA
 3GMMYKE8JdbK42VMxN3sbgzLIs+XFe5eriuVr3936YkakiwHkxpSJcbnspqh8RDuHft6aonwR5v
 Fa3ETDpUwiFB8qXQtjPZ9noZE6KqIT5ZxwjrHRVMMD7QLiyxDRw74S6jwgxRfelJ0mAfsWKlRcS
 +EK3O3XNw/mtZQ
X-Google-Smtp-Source: AGHT+IG9ZA8OCrds9NFYCNbHrTlYlK2w+gYCSB4f58tUWNdF2izcD0YOX1ZiHxA2HH4udCjpy8zRLA==
X-Received: by 2002:a17:902:e944:b0:267:8b4f:df13 with SMTP id
 d9443c01a7336-2678b4fe221mr14173835ad.11.1757925658576; 
 Mon, 15 Sep 2025 01:40:58 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26295996ff6sm55852045ad.64.2025.09.15.01.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 01:40:58 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 3/8] target/riscv: rvv: Add new VTYPE CSR field - altfmt
Date: Mon, 15 Sep 2025 16:40:31 +0800
Message-ID: <20250915084037.1816893-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915084037.1816893-1-max.chou@sifive.com>
References: <20250915084037.1816893-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

According to the Zvfbfa ISA spec v0.1, the vtype CSR adds a new field:
altfmt for BF16 support.
This update changes the layout of the vtype CSR fields.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.h           |  4 ++--
 target/riscv/vector_helper.c | 29 ++++++++++++++++++++++++-----
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 738e68fa6e2..532386000af 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -190,8 +190,8 @@ FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
 FIELD(VTYPE, VTA, 6, 1)
 FIELD(VTYPE, VMA, 7, 1)
-FIELD(VTYPE, VEDIV, 8, 2)
-FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
+FIELD(VTYPE, ALTFMT, 8, 1)
+FIELD(VTYPE, RESERVED, 9, sizeof(target_ulong) * 8 - 10)
 
 typedef struct PMUCTRState {
     /* Current value of a counter */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7c67d67a13f..603d0731ae1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -33,6 +33,22 @@
 #include "vector_internals.h"
 #include <math.h>
 
+static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
+{
+    int xlen = riscv_cpu_xlen(env);
+    target_ulong reserved = 0;
+
+    if (riscv_cpu_cfg(env)->ext_zvfbfa) {
+        reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
+                                           xlen - 1 - R_VTYPE_RESERVED_SHIFT);
+    } else {
+        reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_ALTFMT_SHIFT,
+                                           xlen - 1 - R_VTYPE_ALTFMT_SHIFT);
+    }
+
+    return reserved;
+}
+
 target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
                             target_ulong s2, target_ulong x0)
 {
@@ -41,12 +57,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     uint64_t vlmul = FIELD_EX64(s2, VTYPE, VLMUL);
     uint8_t vsew = FIELD_EX64(s2, VTYPE, VSEW);
     uint16_t sew = 8 << vsew;
-    uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
+    uint8_t altfmt = FIELD_EX64(s2, VTYPE, ALTFMT);
     int xlen = riscv_cpu_xlen(env);
     bool vill = (s2 >> (xlen - 1)) & 0x1;
-    target_ulong reserved = s2 &
-                            MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
-                                            xlen - 1 - R_VTYPE_RESERVED_SHIFT);
     uint16_t vlen = cpu->cfg.vlenb << 3;
     int8_t lmul;
 
@@ -63,7 +76,13 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
         }
     }
 
-    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
+    if (cpu->cfg.ext_zvfbfa) {
+        if (altfmt == 1 && vsew >= MO_32) {
+            vill = true;
+        }
+    }
+
+    if ((sew > cpu->cfg.elen) || vill || (vtype_reserved(env, s2) != 0)) {
         /* only set vill bit. */
         env->vill = 1;
         env->vtype = 0;
-- 
2.43.0



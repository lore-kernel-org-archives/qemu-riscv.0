Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FD46075DEF
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=TAJDtsej
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgsr-0002Rc-6u; Wed, 04 Nov 2026 14:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsS-0002Cq-Hv
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:33 -0500
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsQ-0002K0-S8
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:32 -0500
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-36a0f27c9f4so2005740eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821349; x=1794426149; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7yA3xFBVVRlyroBJQNGyki+/VZND+ociAzE2DZ7Hwwo=;
 b=TAJDtsej8rLv2x/FDI4NWJzoNO6a73fh9ZpDrZ5E+YXynA6CR76EJaaiHD02dAYK47
 /4grpYFsvAuoxDDp6gOs1h22YWiQvS7drnK8+VGWXnKHVA3gd1MUASwboEvlwLoOdtRx
 qIdKEqQPoQHJfO3fzisKEtYV9VV+nvAoQ8MU8nOHT9dBm16XmGXwGq0nu23d0XICOnpI
 g+8fY+xbjQ4nZuObQGOrD3eiybBQV3+uO43sDEUCaMnDLTXC+3pwgr2GW7SSqLyEOy2t
 2RhqnaJPZi2hZg1bVevecvbX2D3BcxPoKhoQbnPHfP7/Hrssjvo5ftXXUi7V5e7KwS7g
 pFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821349; x=1794426149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7yA3xFBVVRlyroBJQNGyki+/VZND+ociAzE2DZ7Hwwo=;
 b=o2Ow/P53jt+8biCW9qpl2ImTjBKt7Yt6Xdg29J1XxO32UIyuwETIK21EQDmQRt69b1
 c466uhMAqlY40gEE6JkbYVzD6kLM0xhw9me0Nl3XP5UrcXfc9IuR21WtrwjQp5pyxIMq
 dfbzQSMjjFijLar8VNO5KO4gNNvJugc1ErOd+cC5f+i+9VI/Jl1/Ba1j8dWZmYpbiz9A
 YCskZ4EVsBStLTuAbZ3HjPZ0GMHuQyyP5NgPqOhuo0VHHJpMtdKOA1oov1HEmLoXWydk
 0tTwr0OO1ITEf48QaCrx1gyNKX6Ff8XFo3LLau+IKmc4RNtm0muEV8KIyjN04MFS/drR
 1uJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxYNnZXxvfONDBHByJ6U+vpf+a/MwkZKwSsBap37uS1xu4FYJ2HWtuKacfTJiN3fiEEETG0W01O3cTe@nongnu.org
X-Gm-Message-State: APuU4Z/Q5lkLLIpB/zLTiHJKKSKGSBJTtMrrUONXU3OKAEmbtIMlklAr
 4dTZ4d4d9fCePyuTRb9coGrJQoNw0vIBM3mdpF0nnO/UfktOlGUAJ6ILqV1tRdAmsrk=
X-Gm-Gg: AYBFou2CZ1HUnDgg1z7aNOB4zgQaGpZ3PKv6zHTL76Ffrs+yVNCumKKlA/ueYXgnMRw
 XcGwMibrrM/TMTfsBpwTcbsRyTRXOYK818ChOL30dRt08e8WdPmGlV4IB2AZ8MlH3fpYrTaFd3o
 SCBDDwYH1WNAUjZ9yGQJxeFYBVtauP2RnRwAZOaKU2DTlPpFjZVnLXChHQE2nHTw523mkuKmzqF
 jfrjgr2D9MLVnXGmt1ESw2U/9Pq5K5dvFgbJAPsfWmHScKnW+o/HTS4cDUp+kQPHHgF+Z3kVJ80
 nORgUto3OrVOJ44bLZrazS/Z1jF8gLoSEUPWGvUoX4nMUYfzYYCEa2Ek4O0dXmlDZb1K5C1DUYB
 hRt9ibv4wRvHTztnnpQYD8i9iHigba2/5HJ0UROx3hYW6lhgRQAMjfotlI+EFisPkBALwTb0ybC
 ZKFx+SoPWdVlg5CNiTWQrLDIfiV36TPRl2tFiBETuj8TZLs4OmnXGpHYR/ZMvlnFJcGfZYC0u1b
 J4vnqISDBdauO6UnKj6ungwL7s4PmB5S0YOYGykI7lILgGzhktjHySazP+djE+oIWN9nGnQd9A7
 olN+oIb+ew3jRyNBwluAB6Y7+EK7JNao5LBnFxiIboFJ7z+UteKE9z3z2uR+IlrlzTyJHKLc/Yu
 vRot0B85remGXlZPPIKiZanXZMPxn
X-Received: by 2002:a05:693c:4142:20b0:36a:6106:4f63 with SMTP id
 5a478bee46e88-36a6106506dmr19325393eec.16.1793821349268; 
 Wed, 04 Nov 2026 11:42:29 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:28 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 04/38] target/riscv: Add cfg property for Zvqwdota8i
 extension
Date: Thu,  5 Nov 2026 03:41:19 +0800
Message-ID: <20261104194155.679241-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add CPU configuration for the Zvqwdota8i extension which depends on the
Zve32x extension per the specification.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 2 ++
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 target/riscv/tcg/vector_helper.c  | 6 ++++--
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 53ecce8c398..96a1d76c5a2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -250,6 +250,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
+    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwdota8i, PRIV_VERSION_1_13_0,
+                                    ext_zvqwdota8i),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(sdext, PRIV_VERSION_1_12_0, ext_sdext),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 85fc3ad8bb8..0c08d688ac1 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -106,6 +106,7 @@ BOOL_FIELD(ext_zvfbfmin)
 BOOL_FIELD(ext_zvfbfwma)
 BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
+BOOL_FIELD(ext_zvqwdota8i)
 BOOL_FIELD(ext_sdext)
 BOOL_FIELD(ext_sdtrig)
 BOOL_FIELD(ext_smaia)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5834ec1524f..1c51ea94489 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -691,6 +691,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
+    if (cpu->cfg.ext_zvqwdota8i && !cpu->cfg.ext_zve32x) {
+        error_setg(errp, "Zvqwdota8i extension depends on Zve32x extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 172ae0f11dc..4ba0a89f4b5 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -39,7 +39,8 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
     int xlen = riscv_cpu_xlen(env);
     target_ulong reserved = 0;
 
-    if (riscv_cpu_cfg(env)->ext_zvfbfa) {
+    if (riscv_cpu_cfg(env)->ext_zvfbfa ||
+        riscv_cpu_cfg(env)->ext_zvqwdota8i) {
         reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
                                            xlen - 1 - R_VTYPE_RESERVED_SHIFT);
     } else {
@@ -88,7 +89,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
 
     switch (vsew) {
     case MO_8:
-        ill_altfmt &= !(cpu->cfg.ext_zvfbfa);
+        ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
+                        cpu->cfg.ext_zvqwdota8i);
         break;
     case MO_16:
         ill_altfmt &= !(cpu->cfg.ext_zvfbfa);
-- 
2.56.0



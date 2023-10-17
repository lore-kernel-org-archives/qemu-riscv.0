Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9BCCDB474
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 11:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsi09-00015S-Nl; Tue, 17 Oct 2023 07:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qsi07-00014k-F5
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 07:12:39 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qsi03-0004ez-Sd
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 07:12:39 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c9b70b9656so32983295ad.1
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 04:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697541154; x=1698145954;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1vPLdUWkEk40yEOF5gq0S///XvdLUlYQ5AFFo+4KYK0=;
 b=wmQg1xggGSVqEY4yKypu4REBlHcEobLxVJMf3CswzJkef05kDI/oJvi/cvVJquuwMf
 DW/hbAXGUj1WuiDV0AhS4AY0VPAlD4Z8harZDamKM9B9MpEmtcf3uXFasTLIYkpxzqBD
 2YKDS+hdvh4y9I4+Fj0ilf1pEg9fIcD6GlC7GzmJcgvkqT85DrwWmeOxfoPi0O8gNmj9
 z3xtghVaWFHi/62I9u2hbqpqtN2eaWDaWqhxiXaPjaeStODLsLlfQuobjmDIbikhqZoj
 GqfzuvBwK3Lrhup25xgfAUplDX5jcjwZETcBMtnfu7CG1mkZengVljfEteXRjiXkH4iu
 5sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697541154; x=1698145954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1vPLdUWkEk40yEOF5gq0S///XvdLUlYQ5AFFo+4KYK0=;
 b=vMAcUCF6xwchlVyiSYBsIeK8+hO2Ji+boiY9iCFx7kGIJDFt19ejS0IszBBbzOJb8+
 KxO7npTm1nxL8vZNeJ32Y0Khpb9acv4yTvUh9Q7OKT81HJz4zw8J5oXOiTsSE64JQdUK
 8tC4Xf86alyzrBMbJdbpIQX7KvsT2u0GEfuD7NKdruFEbO1bwqUS5fZxl1BdaZW4aZdM
 v55fUGKudz0T2yD2i7Zaoq6ZyI/IgLRQfhOIADe30+YABTINDEM1I0Y5WEJchs7fL0r6
 DeFBncHSr/aeGqIITQrJGgkk4THKLvSnGO2nep3K3riNUDOJCntsB7w2f2sZzU4jxUeu
 6GyA==
X-Gm-Message-State: AOJu0YxNg1XCYbOkHsCFV976H8KANsYFlP5QR4JWTyf+faTkbSoBUuqO
 pjJeXsNDATj+ynSoJtGUnJgiIkkphn5WzdBSSSM=
X-Google-Smtp-Source: AGHT+IGnaHJPkqjMaJaNTQonY/cEva6W5A43Lyfy0dpYJnlBUnVu/YmPNHJxJKJ7Evb6U5nMFhd43Q==
X-Received: by 2002:a17:903:643:b0:1c9:ccbd:6867 with SMTP id
 kh3-20020a170903064300b001c9ccbd6867mr1843416plb.38.1697541154274; 
 Tue, 17 Oct 2023 04:12:34 -0700 (PDT)
Received: from localhost ([157.82.206.156])
 by smtp.gmail.com with UTF8SMTPSA id
 q11-20020a170902dacb00b001c582de968dsm1262634plx.72.2023.10.17.04.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 04:12:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PATCH v3 3/4] target/riscv: Validate misa_mxl_max only once
Date: Tue, 17 Oct 2023 20:12:12 +0900
Message-ID: <20231017111215.42209-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017111215.42209-1-akihiko.odaki@daynix.com>
References: <20231017111215.42209-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

misa_mxl_max is now a class member and initialized only once for each
class. This also moves the initialization of gdb_core_xml_file which
will be referenced before realization in the future.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/riscv/cpu.c         | 21 +++++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c | 23 -----------------------
 2 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1fb5747f00..72124e57fd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1193,6 +1193,26 @@ static const MISAExtInfo misa_ext_info_arr[] = {
     MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
 };
 
+static void riscv_cpu_validate_misa_mxl(RISCVCPUClass *mcc)
+{
+    CPUClass *cc = CPU_CLASS(mcc);
+
+    /* Validate that MISA_MXL is set properly. */
+    switch (mcc->misa_mxl_max) {
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+    case MXL_RV128:
+        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+        break;
+#endif
+    case MXL_RV32:
+        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static int riscv_validate_misa_info_idx(uint32_t bit)
 {
     int idx;
@@ -1593,6 +1613,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
 
     mcc->misa_mxl_max = (uint32_t)(uintptr_t)data;
+    riscv_cpu_validate_misa_mxl(mcc);
 }
 
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5bf9d31f7c..a82c49ef67 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -148,27 +148,6 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
-{
-    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
-    CPUClass *cc = CPU_CLASS(mcc);
-
-    /* Validate that MISA_MXL is set properly. */
-    switch (mcc->misa_mxl_max) {
-#ifdef TARGET_RISCV64
-    case MXL_RV64:
-    case MXL_RV128:
-        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
-        break;
-#endif
-    case MXL_RV32:
-        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
@@ -568,8 +547,6 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
         return false;
     }
 
-    riscv_cpu_validate_misa_mxl(cpu);
-
     riscv_cpu_validate_priv_spec(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.42.0



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc7ra-0006nK-23
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 12:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rW-0006dk-3x
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:59 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rU-00034U-2m
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 12:50:57 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 a4-20020a056830008400b0069432af1380so8727220oto.13
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 09:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVgmWGGBS3g3g08u5Ikz0Maj9Bf5PK3Kg5I4B2Hm1eU=;
 b=Q1yksMQGMccm4/kJI07WHIV8UxUXixVSinoFjgi8Un4XocUYg9zqfX1Tk/KQo6kqIa
 dB5CqD6VTamQmRxDGIIrpbtfATqxptysb2J+L386F05medyyT8Ljj1/RN0arNtTO12s7
 PlS887nKg6QQ3mPR+Qbd13ECUR8pJAFXQsuap4f5YtlricCI+zvbnMSWYBR359uQiBLg
 8zSKIIxnHq3VIvJAkwakVBQFr/bxBcDL1KVqXPW18ORPd7Ygopsfe4z1AtWx+pGbdiqI
 AfDsFM7yimlyA8qT1kM3mawCb09frXZGgiNp7clBuitmSWyiBIDKBzTJyEHYFJUJ0BzY
 U3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVgmWGGBS3g3g08u5Ikz0Maj9Bf5PK3Kg5I4B2Hm1eU=;
 b=3jlksYxxsuc3X3GjKERiUVRhkk/+d5lk6gatCOv/hN7hkeOFyDZCVLsEZ4H0nn91yX
 F9HPe7Tqbb2j91xJUUsp2LPhlmWmNlyM5xIwBsroTWhZ/ihxekQeLNlBS7kDXke1zPBO
 ltHxSjeoRHQ9nGKNwEU3FbKCAs4bFU3bR4je7Tu4vlxUwTrasyKqEdArZt/VXRH2Vogj
 rHjXmcU2CNLfBWIBj5qSnIOBoiTQnSoXG7fBR02V1umcN6O424BO/nMRzGr2koYeJIvF
 qMDwpmMnabm0XbIn0AgZ77KqRU7PjHOBw4n4NIVxAKODeV+XnyYmMkx5U/IekkD4fkSc
 pb8g==
X-Gm-Message-State: AO0yUKUBWIXpftDW+sL7K9NkUPQlwmEJ5RvnCsazaf7Xt/v61bO7hpVZ
 nKZD4HIBXLghxgISTey0Lfw38w==
X-Google-Smtp-Source: AK7set9Z2wUBduJlE9+YpGN7bQOBQDDgX45zXYFRexnypsawNFnKJuPkj31O4bH4nYNnjaFoOgItpw==
X-Received: by 2002:a9d:7206:0:b0:68b:dc52:10f9 with SMTP id
 u6-20020a9d7206000000b0068bdc5210f9mr19720752otj.5.1678812655420; 
 Tue, 14 Mar 2023 09:50:55 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 20/26] target/riscv: move riscv_cpu_validate_v() to
 validate_misa_ext()
Date: Tue, 14 Mar 2023 13:49:42 -0300
Message-Id: <20230314164948.539135-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 16:50:59 -0000

riscv_cpu_validate_v() consists of checking RVV related attributes, such
as vlen and elen, and setting env->vext_spec.

This can be done during riscv_cpu_validate_misa_ext() time, allowing us
to fail earlier if RVV constrains are not met.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fa1954a850..0d8524d0d9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1027,6 +1027,9 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 
 static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
 {
+    CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
+
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
@@ -1073,6 +1076,12 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "V extension requires D and F extensions");
             return;
         }
+
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 }
 
@@ -1111,7 +1120,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
-    Error *local_err = NULL;
     uint32_t ext = 0;
 
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
@@ -1202,14 +1210,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
-    if (cpu->cfg.ext_v) {
-        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
-    }
-
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
-- 
2.39.2



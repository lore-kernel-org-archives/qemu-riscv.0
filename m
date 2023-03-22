Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf70Y-0006y2-Lu
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 18:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70X-0006xm-Rj
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:37 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70J-0007Lc-5Y
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 18:32:37 -0400
Received: by mail-pl1-x630.google.com with SMTP id le6so20596423plb.12
 for <qemu-riscv@nongnu.org>; Wed, 22 Mar 2023 15:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFACebyvsIbJs5TF2lXPvnEUniBbh7t4lGKzaSV/mqU=;
 b=hpVVHw97I5c1o6huLn7T+bqmxj+Cl+oJVGErwlEeOtpD8KqEqLN6cBe09HC9PVI3xG
 D+Lh+KpBpUqer14HMUtiLrY/KpHoyfBsNXKj4ZHvNoxmaa5sBieMbQj+0nV1FdBm7TDe
 maWNoNx825VflnoZfjw6PM7j9LlPMVtZrbcZYhuSPqW1uSbALXlWAcE43qbUXL9dv9YI
 0WqyC8onWWVNqbxJL5M63ZA19q0ht4PIVFjbzwlu+yqgCesTcePQP7Z8ywJ+ImE8aosl
 M63La4CZpJGg5jXDxnbjAv/7456H/VSpfjLpSUszHPiCmsTiYlCEDe/SkCr6Xu5IJdUP
 EmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFACebyvsIbJs5TF2lXPvnEUniBbh7t4lGKzaSV/mqU=;
 b=10oCJP2whLcyeuwIZkWaw7Vc1EMwJrZcbnrUgWBTGENJa1wBHqwU9SHyvl2L3PZ9Tp
 +35Qqp21sWyEgODCcjCBSu2Xw6vTq67lQhoEXsk/aMe3R66eThCNZz+RYjUlHGZvD+Ow
 yVVa5jp6pcMuz9A+YXvP1KOrG4GG0bJL39GqomkNV7sjMHv8kNRA+xICbw4GgCLcw/tO
 i94YkDUhmwSYPzlCC7agiFYx3qEkVKLFfQNj08eR4SVAT2uuzzI+G88ke9QZ0W0YkWU2
 Tp1HASBD8kVc1raDBQdeCbPvzwPp1JCogWAtqpkRfofUwu+K/lDU8W73zhjnkQUejLW4
 hulQ==
X-Gm-Message-State: AO0yUKW98KjX0OWXpyrl0mFa/WzF2v52cdFywHPenQNQRbG5Bq4eyI0O
 jl9F1fI47EQ6YTALDF/8+8ZBF0j9kJIRX09WRGQ=
X-Google-Smtp-Source: AKy350bBl1CcleaGww74kPs6XaQRlmSUP9fZVwirYdZxhXbX8QFZfbj8g4vY22fWlSb4bLWbBlVdvA==
X-Received: by 2002:a05:6870:a111:b0:172:4748:32d9 with SMTP id
 m17-20020a056870a11100b00172474832d9mr970429oae.3.1679523690499; 
 Wed, 22 Mar 2023 15:21:30 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 22/25] target/riscv: use misa_ext val in
 riscv_cpu_validate_extensions()
Date: Wed, 22 Mar 2023 19:20:01 -0300
Message-Id: <20230322222004.357013-23-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Mar 2023 22:32:38 -0000

Similar to what we did with riscv_cpu_validate_misa_ext(), let's read
all MISA bits from a misa_ext val instead of reading from the cpu->cfg
object.

This will allow write_misa() to use riscv_cpu_validate_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ed02332093..0e6b8fb45e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1109,10 +1109,13 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 }
 
 /*
- * Check consistency between chosen extensions. No changes
- * in env->misa_ext are made.
+ * Check consistency between cpu->cfg extensions and a
+ * candidate misa_ext value. No changes in env->misa_ext
+ * are made.
  */
-static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
+                                          uint32_t misa_ext,
+                                          Error **errp)
 {
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
@@ -1123,12 +1126,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+    if (misa_ext & RVF && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
     }
 
-    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+    if ((cpu->cfg.ext_zawrs) && !(misa_ext & RVA)) {
         error_setg(errp, "Zawrs extension requires A extension");
         return;
     }
@@ -1137,13 +1140,13 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zfhmin = true;
     }
 
-    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zfhmin && !(misa_ext & RVF)) {
         error_setg(errp, "Zfh/Zfhmin extensions require F extension");
         return;
     }
 
     /* The V vector extension depends on the Zve64d extension */
-    if (cpu->cfg.ext_v) {
+    if (misa_ext & RVV) {
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -1157,12 +1160,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zve32f = true;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d && !(misa_ext & RVD)) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
 
-    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f && !(misa_ext & RVF)) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
@@ -1195,7 +1198,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-        if (cpu->cfg.ext_f) {
+        if (misa_ext & RVF) {
             error_setg(errp,
                        "Zfinx cannot be supported together with F extension");
             return;
@@ -1367,7 +1370,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_validate_extensions(cpu, &local_err);
+    riscv_cpu_validate_extensions(cpu, env->misa_ext, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
-- 
2.39.2



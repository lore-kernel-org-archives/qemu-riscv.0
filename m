Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pdcoG-0005fs-M2
	for mharc-qemu-riscv@gnu.org; Sat, 18 Mar 2023 16:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdco9-0005Ry-Kp
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:42 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdco7-0007C7-Vk
 for qemu-riscv@nongnu.org; Sat, 18 Mar 2023 16:05:41 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 q79-20020a4a3352000000b0052fe885deddso1320147ooq.0
 for <qemu-riscv@nongnu.org>; Sat, 18 Mar 2023 13:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q714BCJSZCAT1Di5JEJb4MnSNj0uuugGITfPZhRYTT0=;
 b=A1g5xa79fjA18sAzfH9xqH6ZE8Lk4JIvvbfl7Du2o1XHiDwA8zg1cbgcnY6ALrwzmv
 rpFsTVt21FZruVVeZy6CvNHQao7gq9dCctW0bWeRLEY5rchizYVLBvWagfOCGaGhBJk0
 PYPGAtR8SMX3xhD2sMLm/ZkRe4pXg9lsSbO/pFSW6kc1DZbLpn88yIY9B7tJd+hkNsji
 4n2ZMceeNQ1U8iOtXfGlgAxhYA7qDDcs5ETlxlXfWPp46aeystLJ2X0hFftuqfDo60m3
 GBjCEjkFORMih1rxsw9rdQ13bsOTfqZ8GHh+uEu0ym9mfAiqBMekGPUP1GCHCJYAcxUN
 SpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q714BCJSZCAT1Di5JEJb4MnSNj0uuugGITfPZhRYTT0=;
 b=36SQEPjsUPxg6lrM0JGQQhnVE6cZeJgopIy56ePgx7KNyQbCWTFdfZ4khqFQ+/Aktt
 BhPPfO19VcWbegMRe24cWyoGGxiUuABf1KzBRw/LkhF/aG/l/kwznoZkdh8OWOt2FUY4
 9SNga04p3j0FyDzvGfSx2K/DikW9ruEO7PQZ+abfmYO7JDHdHLTdr9UshaTSi8DR9PO5
 yeukD7PbjnCdf6czThyrD9TEjkC2EgOTqKHYJijADOIyxlyO/9WniI3g2/n77MSkQ6hK
 wQUtyf16rwSmpXEyBb3kOqT16Gzkkpcly5Y+m3lluNpNO53d+k6+lQukylOjjIqjhL9G
 YTRQ==
X-Gm-Message-State: AO0yUKUW1ZrzLFGaqUCKcrcNYwmQurv/u2X0B3CHIei5JNVB61NP/CxG
 QAVuo5ujIH8Md4GVUCDfV1VUvQ==
X-Google-Smtp-Source: AK7set9DYFZw0VgBrdXNdUkeipHZwCBRKdS/UMveC7lMx164zUPeUBKDnNpTcfdOCQXWCm4VXZhP/g==
X-Received: by 2002:a4a:3395:0:b0:534:c38a:dafd with SMTP id
 q143-20020a4a3395000000b00534c38adafdmr602412ooq.6.1679169939262; 
 Sat, 18 Mar 2023 13:05:39 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 20/26] target/riscv: make validate_misa_ext() use a
 misa_ext val
Date: Sat, 18 Mar 2023 17:04:30 -0300
Message-Id: <20230318200436.299464-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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
X-List-Received-Date: Sat, 18 Mar 2023 20:05:44 -0000

We have all MISA specific validations in riscv_cpu_validate_misa_ext(),
and we have a guarantee that env->misa_ext will always be in sync with
cpu->cfg at this point during realize time, so let's convert it to use a
'misa_ext' parameter instead of reading cpu->cfg.

This will prepare the function to be used in write_misa() where we won't
have an updated cpu->cfg object to work with. riscv_cpu_validate_v() is
changed to receive a const pointer to the cpu->cfg object via
riscv_cpu_cfg().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 992edd1735..7861f0421e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -939,7 +939,8 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
-static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
+static void riscv_cpu_validate_v(CPURISCVState *env,
+                                 const RISCVCPUConfig *cfg,
                                  Error **errp)
 {
     int vext_version = VEXT_VERSION_1_00_0;
@@ -1025,41 +1026,43 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
-static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
+
+static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
+                                        uint32_t misa_ext,
+                                        Error **errp)
 {
-    CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+    if (misa_ext & RVI && misa_ext & RVE) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+    if (!(misa_ext & RVI) && !(misa_ext & RVE)) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
     }
 
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+    if (misa_ext & RVS && !(misa_ext & RVU)) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+    if (misa_ext & RVH && !(misa_ext & RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+    if (misa_ext & RVH && !(misa_ext & RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+    if (misa_ext & RVD && !(misa_ext & RVF)) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -1073,13 +1076,13 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
      * 50+ entries of isa_edata_arr[] just to check the RVH
      * entry.
      */
-    if (cpu->cfg.ext_h && env->priv_ver < PRIV_VERSION_1_12_0) {
+    if (misa_ext & RVH && env->priv_ver < PRIV_VERSION_1_12_0) {
         error_setg(errp, "H extension requires priv spec 1.12.0");
         return;
     }
 
-    if (cpu->cfg.ext_v) {
-        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+    if (misa_ext & RVV) {
+        riscv_cpu_validate_v(env, riscv_cpu_cfg(env), &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
@@ -1364,7 +1367,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
-    riscv_cpu_validate_misa_ext(cpu, &local_err);
+    riscv_cpu_validate_misa_ext(env, env->misa_ext, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
-- 
2.39.2



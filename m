Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTyW-0001BX-95
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyU-0001AZ-Mb
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:42 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyS-0000an-T8
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:42 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17e140619fdso43208636fac.11
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMcBcOMKiOCRPkvJPsLKtCK2KcBHaIOtwtePnGbSRc8=;
 b=E1CZpAU1YW74/bnzn5qMCtHYhaujTVT1Lp7E9R28/rSFaLrLfj9O1cqCej0J9dRaAY
 VMMtrXhakmjHyZq9zKvrmfkvojg+XrhJoiT7m2sVJAuiF5Jkd+M78CdaEOCtI0sbPWJW
 SZcfqbyk2apEE59yfnUnL90+QFAMIpYvbTBg52acIXrDWa9dtOhevufR7qwx4ykJYAF4
 b8/jdF7ErJQX8oxhHYyQl1y31q0DuKM3pl+omwRjKmYF22v0xvpDl0VFKeyGeOvGh502
 oyEu9zKR+67BXZlzBDxiKWUJhBFlVwn8cj4CreVTHAXQMgikGmH54OARhitWK4tdiNN6
 wiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMcBcOMKiOCRPkvJPsLKtCK2KcBHaIOtwtePnGbSRc8=;
 b=4HbshJeyBno9/MD/OMEIvnDUyUYyIulUQE8JQR5BFHmZv7PcGuvWe/LTux9DgUTCXH
 3obmDwSJRRRRuTX/x/CfQrVP53wjE7uvsIem1ZgF20PApG4/q90+R4oXRxrOM7Sxnm+7
 Q+sUrlsvhta71QP5AfM3WsIpaf39dhphYunbWjP8QF/gXmJ1AgqkIbtnlM+G+KHofg7F
 bGSQIPf+uypowTFYQKEYk+Wc6ZE/QcMbvxVHEoknFDEQ7BegBNEH8tbAsJ8AwCS7qgVr
 tkhH9FAjVAaQDk87PCjlnN1SZfGib7TkrDeoz5o1SrgxQY4clhg6uWocWm8fSe7wVr8W
 G2sw==
X-Gm-Message-State: AAQBX9fIZ8K1p0xdmft0kBjG1o+kjXGU0UJXIGNzuq5AmsIokljz9bOB
 6L3mYpeckxgkJoJoCc2A2vl0CQ==
X-Google-Smtp-Source: AKy350ZzYfkdX+WYEw1EjhI0IFuZ+CYVtiv8DjhzRagzHvnQ5aQXidCHVaFxfhVY9UONbVbuaRMF3A==
X-Received: by 2002:a05:6870:968f:b0:177:b463:9dcf with SMTP id
 o15-20020a056870968f00b00177b4639dcfmr51733oaq.46.1680804279669; 
 Thu, 06 Apr 2023 11:04:39 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 13/20] target/riscv: remove cpu->cfg.ext_u
Date: Thu,  6 Apr 2023 15:03:44 -0300
Message-Id: <20230406180351.570807-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:42 -0000

Create a new "u" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVU. Instances of cpu->cfg.ext_u and similar are
replaced with riscv_has_ext(env, RVU).

Remove the old "u" property and 'ext_u' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 9 ++++-----
 target/riscv/cpu.h | 1 -
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cded82ac7a..9565495839 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -407,7 +407,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_u = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -842,7 +841,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
+    if (riscv_has_ext(env, RVS) && !riscv_has_ext(env, RVU)) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
@@ -1170,7 +1169,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVS)) {
         ext |= RVS;
     }
-    if (riscv_cpu_cfg(env)->ext_u) {
+    if (riscv_has_ext(env, RVU)) {
         ext |= RVU;
     }
     if (riscv_cpu_cfg(env)->ext_h) {
@@ -1508,6 +1507,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVM, .enabled = true},
     {.name = "s", .description = "Supervisor-level instructions",
      .misa_bit = RVS, .enabled = true},
+    {.name = "u", .description = "User-level instructions",
+     .misa_bit = RVU, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1531,7 +1532,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
@@ -1647,7 +1647,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8b8e541e5f..486061589e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -423,7 +423,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_u;
     bool ext_h;
     bool ext_j;
     bool ext_v;
-- 
2.39.2



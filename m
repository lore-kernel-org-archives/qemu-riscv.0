Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZc0-0004Mp-4m
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbz-0004MR-3d
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:27 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbx-00015y-BR
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:26 -0400
Received: by mail-oi1-x22a.google.com with SMTP id l18so12139984oic.13
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eu/F9kuwAwMb0ptuH8bHwfI2RSxOXVZok3X03dHsCZw=;
 b=PHouOKpdqwYmMl/yKBbuNaiYxpXPnrpUWuqUNW5iEhGtzwZn7EOSZsh8nQ3QnCH21x
 HXdzWItqveQma28XoeIfXO4I3ZdP2SW0dHmCNfgNEQZ3asvTiDQtRxXrpcJYhIhwEbBG
 KVJv1+TyiafW7NyF8SxtdDWkVCP9mWBYUUrwrfMppRfJu2nAbMZyhQFPr0Xy6mHPradC
 7SglPLm3tHTTkjkXEm3fWRTMBRCPEIKwEonjEBh7sG3iI+P12/PMOZcH8ObQnN/Yxp4Z
 vD2C5B+78DvFdp93br7yGI//0FMmCiYT1l1j6/oWOKp9ttAffXRwRR/4YNOWEbMEDlXq
 cZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eu/F9kuwAwMb0ptuH8bHwfI2RSxOXVZok3X03dHsCZw=;
 b=n4Tldzt4MoL1UwNXrJYBnPBd35nWjS+2c+VxUV+g5fymtW+sUfvJFsDHU1KXFq5Wss
 2AsvVXl1I/LZKWmCaVNcwly9W9JTGW0vDL5woCUou6c8sNznF0xG55RxE1tQKnU+9Eim
 hAPZkBRewhGDhqPR4BRrNeMIHX5EhmBrFDQ24qr3DO8sDDEpmfNFiqc0/cEb4TZDbMLp
 +n6XPU62UJ8UJO8BZ2jmgCR0629pkd0Tyobf9dLdg75aiWFG+YbmfxWzA6yBUVf1+ZmV
 S4JiP2XAcx2qZZq+9merhtGtQSCS+jb8Atez3oQ1McINzfzlL+ooO7ovbIo1maD7iCrt
 M0CQ==
X-Gm-Message-State: AO0yUKXcaM/toLaRiQzDdxVcAjCqU0TMVQZtmHKj7OLjpPRkvQ8iR0+w
 g53izEdTXTGIdky0UTwbVqMEnw==
X-Google-Smtp-Source: AK7set/1HTAoNkpO8dHd6VDgxd7g3BtCzhP+7/jqYhW6pveVoliVrDn3dQFTIPagJyJTSFUYqEgJGQ==
X-Received: by 2002:a54:410e:0:b0:384:2d66:32d8 with SMTP id
 l14-20020a54410e000000b003842d6632d8mr8877435oic.50.1680110964340; 
 Wed, 29 Mar 2023 10:29:24 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 05/20] target/riscv: remove cpu->cfg.ext_a
Date: Wed, 29 Mar 2023 14:28:48 -0300
Message-Id: <20230329172903.636383-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:27 -0000

Create a new "a" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVA. Instances of cpu->cfg.ext_a and similar are
replaced with riscv_has_ext(env, RVA).

Remove the old "a" property and 'ext_a' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 16 ++++++++--------
 target/riscv/cpu.h |  1 -
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d7763ecfa9..63efd1b313 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -812,13 +812,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                            cpu->cfg.ext_d &&
+                            riscv_has_ext(env, RVA) &&
+                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
-        cpu->cfg.ext_a = true;
         cpu->cfg.ext_f = true;
         cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
@@ -862,7 +861,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+    if ((cpu->cfg.ext_zawrs) && !riscv_has_ext(env, RVA)) {
         error_setg(errp, "Zawrs extension requires A extension");
         return;
     }
@@ -1100,7 +1099,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_m) {
         ext |= RVM;
     }
-    if (riscv_cpu_cfg(env)->ext_a) {
+    if (riscv_has_ext(env, RVA)) {
         ext |= RVA;
     }
     if (riscv_cpu_cfg(env)->ext_f) {
@@ -1436,7 +1435,10 @@ static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
     visit_type_bool(v, name, &value, errp);
 }
 
-static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};
+static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
+    {.name = "a", .description = "Atomic instructions",
+     .misa_bit = RVA, .enabled = true},
+};
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 {
@@ -1462,7 +1464,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
-    DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
@@ -1576,7 +1577,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_a = misa_ext & RVA;
         cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..f703888310 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -422,7 +422,6 @@ struct RISCVCPUConfig {
     bool ext_e;
     bool ext_g;
     bool ext_m;
-    bool ext_a;
     bool ext_f;
     bool ext_d;
     bool ext_c;
-- 
2.39.2



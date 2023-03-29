Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZcP-0004ob-VG
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcK-0004ca-K9
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:48 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcI-00013L-Vw
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:48 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-17786581fe1so16946050fac.10
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UpOctMrPcefpV7ambzV5K9ZzO57EsF3wn5ifJATxwJc=;
 b=Aez/c3nqMrj8CNPUdbpyY5pDFZA4LR1n3Iq5X08fJBrUBiaZml0IjCpFx/U35TRf3s
 q+yHzl+i4Gf9ZPsPKuU5v0z7rjEfcksSHpMuvxesXndo7HN7RwAZLU4Vv/bFkz40AG4H
 sX2OqmPC/e70lajSDI5+KQI2Eit8vRh1/0+Ly8JCGIc9awDtvz9gvAsM4kWhOMOi+tqR
 wZQf5QfhtAxb++dMFT7BVdq7WjO/4QZu7k6lZJPAjNjF2EbFXreIUKGu/tqnxC7cq5J6
 4Auq32c4YLHIpLk+WPhjkKs8nWJ1vGjoLCad1unamVSVlIS18rof3wnW8ql30AF3U5PY
 83+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UpOctMrPcefpV7ambzV5K9ZzO57EsF3wn5ifJATxwJc=;
 b=Jz+dUM4ehrlkyR7yQpUgc/dc34TBjEs5BxhHYmcbkqL9mcnGrI8zq1uuE5EoyM6SgY
 hhUJSFPQ8Lny3xzt8oxcHfvFOlxiustXvnV6sIvZJ5G5fmk2g3ePUox3gF4d7/URkm8T
 MfCdbKUDrNUeVZqVno/PPNU81c1A6v6OZn7spisbm6snBiCBQjaugCf4/fR8fdiIa2Rh
 eDDNUU7+5by8Eq3jlp28Rvnpq0Bgi5YHKpgr6pn6d3TJcLHnYdxJn8wIU+D/tQskBBaR
 UbdU1zk2dzH0EkrPEdTrpG5k4Gnt3l/JAYdZoKO8c+Tfr03zWHtWdxSpUQ0H9z3LXEfX
 ZPfg==
X-Gm-Message-State: AAQBX9eDvOEKzSAg/6RVqk8QRLCSwsLkbioXf5/rgCu46KWf6B3ifWG8
 IiVRHGCAGNBYTZxOR7Aq1zX9oA==
X-Google-Smtp-Source: AKy350YYIVvkrK4SmisjVRrczEuTzW7Z/YPlQiZWDZ1jdPuKrbcJuEhJa4/ROfDPiDYCMJ3SmcdTDw==
X-Received: by 2002:a05:6870:630b:b0:17a:aa4a:8b5 with SMTP id
 s11-20020a056870630b00b0017aaa4a08b5mr11906234oao.7.1680110984569; 
 Wed, 29 Mar 2023 10:29:44 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 12/20] target/riscv: remove cpu->cfg.ext_s
Date: Wed, 29 Mar 2023 14:28:55 -0300
Message-Id: <20230329172903.636383-13-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:48 -0000

Create a new "s" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVS. Instances of cpu->cfg.ext_s and similar are
replaced with riscv_has_ext(env, RVS).

Remove the old "s" property and 'ext_s' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 11 +++++------
 target/riscv/cpu.h |  1 -
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6861446489..59f6711f94 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -401,7 +401,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 
     cpu->cfg.ext_g = true;
     cpu->cfg.ext_u = true;
-    cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -836,7 +835,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
@@ -848,7 +847,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVS)) {
         error_setg(errp, "H extension implicitly requires S-mode");
         return;
     }
@@ -1108,7 +1107,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVC)) {
         ext |= RVC;
     }
-    if (riscv_cpu_cfg(env)->ext_s) {
+    if (riscv_has_ext(env, RVS)) {
         ext |= RVS;
     }
     if (riscv_cpu_cfg(env)->ext_u) {
@@ -1447,6 +1446,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVE, .enabled = false},
     {.name = "m", .description = "Integer multiplication and division",
      .misa_bit = RVM, .enabled = true},
+    {.name = "s", .description = "Supervisor-level instructions",
+     .misa_bit = RVS, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1470,7 +1471,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
@@ -1578,7 +1578,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7a42c80b7d..fc35aa7509 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_s;
     bool ext_u;
     bool ext_h;
     bool ext_j;
-- 
2.39.2



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZcS-0004vh-Jv
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcR-0004v3-NZ
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:55 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcQ-0001Cc-5s
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:55 -0400
Received: by mail-oi1-x22c.google.com with SMTP id r16so12088013oij.5
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6tNrnnPCdwyCQXcNW1F0Rg4ywGRq+Tg38j44yL/tfXA=;
 b=K23LYA5tg62/Bi02STDYn8Vl5djlPi0mXLVvOq336iCu5WsMAgHFKIroY8Yloq/25t
 U+GZtMVQ+LrelQWdYLDKs+0rILNcfB5mvz4EPVDyMtxw7sOIcPzdcXT1fAWOAOAHGH/B
 rullnTH1B/zOU9jC+nsxNt0Ros6Wq8G1GTYDEMT7/2B2fiPH+jhgHg7UEy/G8PMxtOkH
 /x404PtXNk0AjRXKegoFpZmHib18tqEXAj4yTHIiv3FAvJjqtrwgFHiUQDTU4MBxxDtK
 xbEb1yCiYCWNO4+xmxWtzqOP+q48rPxCLhf2igPSZ5bUIhiQ6CGS0lD4GAz5ZwvxkFWl
 Yi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6tNrnnPCdwyCQXcNW1F0Rg4ywGRq+Tg38j44yL/tfXA=;
 b=4BWwXwah4YbqkbiLXD3lVZgE+8Un3uoGt6m+MIV96WRqJj7zmN1qQ2ZHPcoYbMWhn7
 69rGtADOyp5VM7ZIR0SCY0Z1YV1yhqn6Tas3shlGqzqR5klFeaITJDfCUoTPESPwm33y
 UfpAW8NjeVs44a0goRjTX4CiLrKDwuFnTRcn469MBD6+N9Nf18GnfNmDxjWIeSvVFnDc
 n3p4J6N10en4dzSX/ZmJHs7VuRw4JGtrz65L9n+dm3GWd5NzD74H6pfGBzRX/S6ojT6+
 SiEeYP1UFlcgRjBHfVyZHMTw6y4immdWxL5JyNBdJ0w7Bk3qBP3D9Jk9gixAlkS4eJ4J
 SyRw==
X-Gm-Message-State: AAQBX9fLecwvOiN1Rw6oHVdxX+VyRC54y75kus9H3hGqAlN3SjMT/Ek9
 ZCLUTi6iURPvud0drs0jhIT9UQ==
X-Google-Smtp-Source: AKy350ad/6hdWQY3+ugIveXORMC9EWhXzarnMteCJdxjjWqItSlSSawZEIWLajhhMe9/qMkf1NGwKg==
X-Received: by 2002:a05:6808:7c5:b0:389:5164:9db2 with SMTP id
 f5-20020a05680807c500b0038951649db2mr3565720oij.48.1680110993245; 
 Wed, 29 Mar 2023 10:29:53 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 15/20] target/riscv: remove cpu->cfg.ext_j
Date: Wed, 29 Mar 2023 14:28:58 -0300
Message-Id: <20230329172903.636383-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:55 -0000

Create a new "j" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVJ. Instances of cpu->cfg.ext_j and similar are
replaced with riscv_has_ext(env, RVJ).

Remove the old "j" property and 'ext_j' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 6 +++---
 target/riscv/cpu.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 76dcf26f6c..86edc08545 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1118,7 +1118,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_v) {
         ext |= RVV;
     }
-    if (riscv_cpu_cfg(env)->ext_j) {
+    if (riscv_has_ext(env, RVJ)) {
         ext |= RVJ;
     }
 
@@ -1451,6 +1451,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVU, .enabled = true},
     {.name = "h", .description = "Hypervisor",
      .misa_bit = RVH, .enabled = true},
+    {.name = "x-j", .description = "Dynamic translated languages",
+     .misa_bit = RVJ, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1547,7 +1549,6 @@ static Property riscv_cpu_extensions[] = {
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
@@ -1579,7 +1580,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_j = misa_ext & RVJ;
 
         /*
          * We don't want to set the default riscv_cpu_extensions
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f3cb28443c..43a40ba950 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_j;
     bool ext_v;
     bool ext_zba;
     bool ext_zbb;
-- 
2.39.2



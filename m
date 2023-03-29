Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZcN-0004iR-VW
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcM-0004he-6d
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:50 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcK-0001BJ-Im
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:49 -0400
Received: by mail-oi1-x22c.google.com with SMTP id f17so12140835oiw.10
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSTqPmaPrFLhU+v/QM7K98cvp6Hrn5Fhr63txRi3poI=;
 b=kafkWMfdnKA1/88ms5ngpF1ChYVLPU7vebEMI063m7nIPKggecSav7d7z3VsTvFjLg
 MmXKXwWqgios7uzfvsfjDQ9eCw7u43SODj0XcqY+X1Hm6sxvn78jgj73gOfCuOeeLwrB
 /ks6+xt0Im3wr23zik7r9kOeT74DlBwRijgLv3GwhDhMgrGKnO1lRiE55HZ2+UqVUtGf
 QIFZiHv5sJHw18Of5ItueRTigyRTXlKC6eLydxpWiFvpZoim5aZD6V9bm9bfMDrVLu2U
 WvyadZ5RDfVANEKL43RPkFWhFUkamjTKmX/xjYM7ibL0/YPUu9PtubwYR0ZYm+gaE4FS
 ZPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dSTqPmaPrFLhU+v/QM7K98cvp6Hrn5Fhr63txRi3poI=;
 b=WPzsgVkci7ey+uMLyE4AuTYThhZWNn+sFFzgfaXaI6ALsWV0cGJ8JswULXxRd0x05I
 mo8cbBCLCB8tSnfvQgKYOIb/61bhwAHBkuRimAuts8/RhHEl4iJ57wW0S/YfbE/Va5ez
 2SGVmUtxbtBMl54VJUz6a0QEysQy5tMBe9sVSEZzTu++CUQA4dEgE5oGt1s8FmJ5RmNy
 PmSEwMMGI55fWVKeqMn7nx0P6rJIxUj936/hj14NIg92XGn15llX042qEMzcTOGZgKJ4
 TaJK7+TMJl+/4ixBqk2DyEj9wiakUcwBPINStyq9fnaEUpwde0k08z7rBRvtiAwM0Vqd
 gDpA==
X-Gm-Message-State: AAQBX9e99z27KIbqYk4zCqbzivf84wcvUZq5yMV++vkCchmqS5HT5d/H
 lmNZkQqwsY+21TOYjHN4DtE3Lw==
X-Google-Smtp-Source: AKy350YoQH7qN6Rvl9M/orF47aWginxEE+vC6gD3DoJLFazZQMEf8YGZrFDldzTpqN5Dl919z//GQA==
X-Received: by 2002:a05:6808:d9:b0:389:72d5:f160 with SMTP id
 t25-20020a05680800d900b0038972d5f160mr32856oic.30.1680110987490; 
 Wed, 29 Mar 2023 10:29:47 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 13/20] target/riscv: remove cpu->cfg.ext_u
Date: Wed, 29 Mar 2023 14:28:56 -0300
Message-Id: <20230329172903.636383-14-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:50 -0000

Create a new "u" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVU. Instances of cpu->cfg.ext_u and similar are
replaced with riscv_has_ext(env, RVU).

Remove the old "u" property and 'ext_u' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 9 ++++-----
 target/riscv/cpu.h | 1 -
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 59f6711f94..a72bc651cf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -400,7 +400,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_u = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -835,7 +834,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
+    if (riscv_has_ext(env, RVS) && !riscv_has_ext(env, RVU)) {
         error_setg(errp,
                    "Setting S extension without U extension is illegal");
         return;
@@ -1110,7 +1109,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVS)) {
         ext |= RVS;
     }
-    if (riscv_cpu_cfg(env)->ext_u) {
+    if (riscv_has_ext(env, RVU)) {
         ext |= RVU;
     }
     if (riscv_cpu_cfg(env)->ext_h) {
@@ -1448,6 +1447,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVM, .enabled = true},
     {.name = "s", .description = "Supervisor-level instructions",
      .misa_bit = RVS, .enabled = true},
+    {.name = "u", .description = "User-level instructions",
+     .misa_bit = RVU, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1471,7 +1472,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
-    DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
@@ -1578,7 +1578,6 @@ static void register_cpu_props(Object *obj)
      */
     if (cpu->env.misa_ext != 0) {
         cpu->cfg.ext_v = misa_ext & RVV;
-        cpu->cfg.ext_u = misa_ext & RVU;
         cpu->cfg.ext_h = misa_ext & RVH;
         cpu->cfg.ext_j = misa_ext & RVJ;
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fc35aa7509..7b98cf4dd7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -419,7 +419,6 @@ typedef struct {
 
 struct RISCVCPUConfig {
     bool ext_g;
-    bool ext_u;
     bool ext_h;
     bool ext_j;
     bool ext_v;
-- 
2.39.2



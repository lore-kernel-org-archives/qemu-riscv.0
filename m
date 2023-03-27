Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgvf4-0005Op-UT
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 18:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvf3-0005OP-DN
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:49:57 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvf1-0007NF-Ps
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 18:49:57 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 m6-20020a4ae846000000b0053b9059edd5so1606013oom.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 15:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YK09g81E8Kwzpq/ZRgaoIicZXmv7nuC/L4OwvxnL+TA=;
 b=bfW9qJR4OB6h0FohMViW0fb7lYAwoXGG7YRMg/JbPfD1hCm8s9zXi1pZx9dW44enYI
 v8WYHFX9M9/fjjGOsVfmw2hoq3ovF7lQEK5PG6J0jM4gV1u4VR4g9Kl9SrBVFBjBnIOu
 DaqL1j6yCYxHUzBMiBUEctUnHWHVESG920CRlbsKod+sTo6yn8ENEioEOXqn6HEA7+xh
 nbYZQJeWNRMTxDPhmeQ+c3z53q+3lU1Ykbk1RJlF2yv09E3zxzUbds7queQ7RuqGP+om
 3jo74lZ57z2OPldHp1o1dkUnv3lHbfuo9sXe7Czs6b/PIz88ZODrePJhJ1NUO7gVpVKT
 BwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YK09g81E8Kwzpq/ZRgaoIicZXmv7nuC/L4OwvxnL+TA=;
 b=x8k6mGw2dlw7tAIg0NKOFgRrO4tuTbmysUBlY+XjsICKPoYDfY+aC8ivVg3ste5XRr
 6nz7Rv3ueD7ZhBknA3jV/i99SuJgqkRngd4a8PDen/ltKOleFvYox4a/WvvJMdHv7Hl6
 yj97xuvdUJ75fCulVLzdSp23gO6oPHs7A4CPoGiqtyBD5Mb6XOOP3zopiO43sjhiDWXT
 pDsr17IBVRM9RApKODnCldm2qRqqeE3COMjNAnXSIA1v3Nw3BO6BWoL1UPPFfq2F4aTB
 oZwqx+TvRr36FMpXA3Xrwv0sB0KGEf94C+z6LONVBbufA+x7Efipa6IwYN+Fg5qys5Yy
 4GDQ==
X-Gm-Message-State: AO0yUKWGWN5aIFD5JKUmR2rNnf/vwaf7jq0kJAhw2m6JFiCFcuaroUM+
 8EEW3XCHItykWNgeomi4XYNPhg==
X-Google-Smtp-Source: AK7set/Gm0GR6u5vKseTk0w3Lsk34+dKunnjBZ5Ka71Cm/Ng9z1UhUTL87+uXIMw/f0u9yvM4X9c5Q==
X-Received: by 2002:a4a:4951:0:b0:53b:691c:43f9 with SMTP id
 z78-20020a4a4951000000b0053b691c43f9mr6556812ooa.2.1679957393976; 
 Mon, 27 Mar 2023 15:49:53 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:49:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 02/19] target/riscv: remove MISA properties from
 isa_edata_arr[]
Date: Mon, 27 Mar 2023 19:49:17 -0300
Message-Id: <20230327224934.363314-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 22:49:57 -0000

The code that disables extensions if there's a priv version mismatch
uses cpu->cfg.ext_N properties to do its job.

We're aiming to not rely on cpu->cfg.ext_N props for MISA bits. Split
the MISA related verifications in a new function, removing it from
isa_edata_arr[].

We're also erroring it out instead of disabling, making the cpu_init()
function responsible for running an adequate priv spec for the MISA
extensions it wants to use.

Note that the RVV verification is being ignored since we're always have
at least PRIV_VERSION_1_10_0.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2711d80e16..21c0c637e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -72,10 +72,11 @@ struct isa_ext_data {
  * 4. Non-standard extensions (starts with 'X') must be listed after all
  *    standard extensions. They must be separated from other multi-letter
  *    extensions by an underscore.
+ *
+ * Single letter extensions are checked in riscv_cpu_validate_misa_priv()
+ * instead.
  */
 static const struct isa_ext_data isa_edata_arr[] = {
-    ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
-    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
     ISA_EXT_DATA_ENTRY(zicbom, true, PRIV_VERSION_1_12_0, ext_icbom),
     ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
@@ -1131,6 +1132,14 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     env->misa_ext = env->misa_ext_mask = ext;
 }
 
+static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
+{
+    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
+        error_setg(errp, "H extension requires priv spec 1.12.0");
+        return;
+    }
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -1174,6 +1183,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
      */
     riscv_cpu_sync_misa_cfg(env);
 
+    riscv_cpu_validate_misa_priv(env, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     /* Force disable extensions if priv spec version does not match */
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
-- 
2.39.2



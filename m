Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMqry-0003MZ-KK
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 08:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqru-0003M1-0o
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:40:14 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqrr-0005tJ-CZ
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 08:40:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id m14so13768242wrg.13
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 05:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Pu4CS8ZEwxyDoWSGcKVuwnDbAFzTS1eeQ8iquNKhHg=;
 b=ORjbnK8Q11fqZXsO26ntc5ZgkDSIIwe8ZSTOFy6jVASD2/vxW+i1nUf2bO/MW5fTo+
 JO/HUaBgSTYCy4NoftoQj2C8a3rjLpFu+UVjq/S6P/gMM0AJROwewwJcbguB1wuufJVo
 KsueWgMjv8ihRupFtln5VKuOTE2V4z3DroVGSmAUslFznaJSysF6E3rDKdv/koDwk2py
 GPJ0hxe7Bc5mBvqkfW8lHpUBXIEBQJMP6IBCwmECXKoFTV8GxY4txo1BH6us/9f7ynEN
 e5HDbSqKDrvXEz+A4818Sh95wGkcXR9DisksV2jn1QyIVYRL/41zsFiffQyunezRv7ff
 vuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Pu4CS8ZEwxyDoWSGcKVuwnDbAFzTS1eeQ8iquNKhHg=;
 b=BmSUnNkvR0pXTCy6vlr+9Rj4mOChFVqgnUp7qhuck5K0buDhF5VaU1RAzrfIfpsIwc
 lATIxthx1IpFp1aZB3qmzR2IyE7jJBwXsjpVM1qo02WJofhrm603tGoWZQB+Xbe98sgv
 mFupiZmm9ULOXQbg+vw3IfrMilgwxHpk+/ATAeOLwe0tO6bVt2FBeHefqSfcWaon78uE
 1JZFPp22WRzQIC+GrUAqWQFEJ8kp0cIKOg9avF0XBfWuKG/W5ASYWzVZxbPqKqYxjri+
 +IYkI/0eBb754cu1gaJpmii9tinGBmooJq9YRK3fb9T//QAYrJMApYtLABzUBxhu36/A
 pgdw==
X-Gm-Message-State: AO0yUKUv5aFvim/VYUH6Uj/dA/yWmUUUuIX0C/Kmal5KjAo4t8jh+n4U
 ZJMZj+3QJghpU7W1OuWEXlLtgg==
X-Google-Smtp-Source: AK7set8BugGWSzpcXOF+U8ElZCVmwXxjqW+AUtbFzv/fvfmkxunl6Mx9kBB42SJN7PEw1mabD7MN+Q==
X-Received: by 2002:adf:f041:0:b0:2bf:e45d:8e06 with SMTP id
 t1-20020adff041000000b002bfe45d8e06mr7616475wro.70.1675172409770; 
 Tue, 31 Jan 2023 05:40:09 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a056000180300b002755e301eeasm14834867wrh.100.2023.01.31.05.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 05:40:09 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v9 1/5] riscv: Pass Object to register_cpu_props instead of
 DeviceState
Date: Tue, 31 Jan 2023 14:39:02 +0100
Message-Id: <20230131133906.1956228-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131133906.1956228-1-alexghiti@rivosinc.com>
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 31 Jan 2023 13:40:14 -0000

One can extract the DeviceState pointer from the Object pointer, so pass
the Object for future commits to access other fields of Object.

No functional changes intended.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 target/riscv/cpu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc75ca7667..7181b34f86 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -200,7 +200,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(DeviceState *dev);
+static void register_cpu_props(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -238,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_12_0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 
 #if defined(TARGET_RISCV64)
@@ -247,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -280,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -290,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -343,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 #endif
 
@@ -1083,9 +1083,10 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void register_cpu_props(DeviceState *dev)
+static void register_cpu_props(Object *obj)
 {
     Property *prop;
+    DeviceState *dev = DEVICE(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
-- 
2.37.2



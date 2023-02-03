Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNp6f-0005R6-N7
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 00:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNp6d-0005LE-BC
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 00:59:27 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNp6a-0003CW-Gn
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 00:59:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id t18so3700564wro.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 21:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Pu4CS8ZEwxyDoWSGcKVuwnDbAFzTS1eeQ8iquNKhHg=;
 b=W9YEVz7ALYGNvrs8tK6HA1zRcAlt7CEecObuEH5o0/WQRsZLhd14jEKmaUq3QsvnGu
 afU7PsneECjGYfXplcwT3POM68Lzis4Kph1APm0z+maFGQPW3j6oq/IupepWJbW2ekT0
 gSljQt2vs+++YclAWlaBcMf4Phd3uLyF08bh6flI/imGp4GzkfJWo/JibnMGHimD+vyE
 ep4umgNSxf6H/hOTIk51EDHezYjeLT+SNT9ULZnT48Y+PfyOrmubh7mkCS3UDxwVtF5q
 jeGYfzzmmZ2yz01C5/cOb7zLXWNXfZmfcsotEOjdxDDsl00asgSiFLlbslWxu5c2NlMP
 QBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Pu4CS8ZEwxyDoWSGcKVuwnDbAFzTS1eeQ8iquNKhHg=;
 b=fhZZSdYwu9hgMueUrOpbzUAghaVyFNM5egJTrb7EwZ4n+Iws+3XcXqLllUnjxg6xBu
 mUBpkFfujdk5dfR4nMFP6EdqE80TguUQ4g946G2fSik9/8vyIFz548YECTx8Z0tayHYR
 ynB2HwsZme5N9sLgnXHryqOeTM6kI1O5XfPjz20czROd2MJWVCOa7ePlGVCUQVAJA+0v
 D76SCEwkhClqnJb1CKk+iYWvcsZR0fYmTBHe3XQSQPgm3Gy+sZykptePfXNoBLSBIWaF
 MuJXqJPxXGmEGQ/Qc5BoC3BINmmW6VByEAtog873/oJHJXG/FMMNI67yYQnxFX0nsrWN
 JgFQ==
X-Gm-Message-State: AO0yUKVsq3lv7XN/A7kWgrnJrSg0OIFLafhgiGXPyfxtZiQUmJE5cFWb
 5tNNzUUEXV6i1XVdV6vuU4TNFQ==
X-Google-Smtp-Source: AK7set9ysWSCrhiZlBOiMb2K/6X1HJzfk34winp4HGDHzWoOpvkIIysfwz/HwnZp+HpP84ygeRV18g==
X-Received: by 2002:a05:6000:a1a:b0:2bf:e5cc:91c1 with SMTP id
 co26-20020a0560000a1a00b002bfe5cc91c1mr8388456wrb.52.1675403962959; 
 Thu, 02 Feb 2023 21:59:22 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 bh5-20020a05600005c500b002bfbf4c3f9fsm1171694wrb.17.2023.02.02.21.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 21:59:22 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v10 1/5] riscv: Pass Object to register_cpu_props instead of
 DeviceState
Date: Fri,  3 Feb 2023 06:58:08 +0100
Message-Id: <20230203055812.257458-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203055812.257458-1-alexghiti@rivosinc.com>
References: <20230203055812.257458-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 05:59:27 -0000

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



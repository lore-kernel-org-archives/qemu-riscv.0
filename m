Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKiWX-0001Tx-4b
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 11:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiWS-0001SA-Fe
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 11:21:16 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiWQ-0002yh-KN
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 11:21:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so1600115wml.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 08:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwmWUou3n7EK2dJeuj7/aaDxziEUHfXgfhDPpUIodg0=;
 b=ULcpohyb/NPYeHAlG3yAIBrDmrZVmCuvZqhGEJgk4MXOiof40EXteC5RYEdJsMHD1p
 31m26eKUx/shqNWirSvdNer8pHlvVEpr0mqHactnC2GDa1cLznFA/zgSSVFR7C6BvEY8
 +gB9LG7Q42h+q7FAmK9FUuh3ZZ4wH55nQreBlu9B4Cb/AvoYEwQIaFvshAvrVVLv7BR4
 FxUupT2tqnn4rGQN+Ui9iG+p3KfEE/HVRTInTaPx4/97xJZYuBvAKU1qIxAP3DgL5Lt8
 KctQ5Rsy+Qnla1kpiJu9T2HxaPBK99LajS+gyjzVuZP+N/COJYTJ2E3ZDM2fkkJ0ernx
 b9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwmWUou3n7EK2dJeuj7/aaDxziEUHfXgfhDPpUIodg0=;
 b=cp2784/gmtUJG+b5t8ToJFXHpBHUZR6q4ewB/rJlw9u7FNCZCU9kKMxE6q+QfoyJgd
 FwNMHh5uL8X0g12zBnqPi8TJeyx9ZXWyCqY+WkHmADuOcZjdv7NHye9stC/SLN1JAA0w
 CJrpvc/t4J1BI9eQxuHeIUqURGMBWGUTrrJF3pItyC9WNAy4SXwfzclatIcRkT5LAU5N
 H6o0WJW3Daa+ZGKKcYOiuk35TEFPUO8ZEHAsNgD/DsflIOebMVVXdnpWtMYhNuhfMTn/
 Rr04avPRHis5x3qtmKVJ3sYlhyleJWIYEpz9l6RWZTdZurX4QlRbruVptAdXVTQApn33
 /uJw==
X-Gm-Message-State: AFqh2kqL7ntSJACfzhAgz2X/V/ZHlnXRv3/E1cPr6tg6ztfReEcbd1X2
 gLUNey7GZMlxDrr3ziGQS6e8Lw==
X-Google-Smtp-Source: AMrXdXuqsJ2LzhQ81D0LXEFdaPQNEprKRoTxguLwiGye73kRkDWIXpov/ydeeWxwcxyncolDA9qvHQ==
X-Received: by 2002:a1c:7216:0:b0:3cf:614e:b587 with SMTP id
 n22-20020a1c7216000000b003cf614eb587mr32850289wmc.26.1674663673054; 
 Wed, 25 Jan 2023 08:21:13 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c500d00b003db2b81660esm2412943wmr.21.2023.01.25.08.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:21:12 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8 1/5] riscv: Pass Object to register_cpu_props instead of
 DeviceState
Date: Wed, 25 Jan 2023 17:20:06 +0100
Message-Id: <20230125162010.1615787-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125162010.1615787-1-alexghiti@rivosinc.com>
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 25 Jan 2023 16:21:16 -0000

One can extract the DeviceState pointer from the Object pointer, so pass
the Object for future commits to access other fields of Object.

No functional changes intended.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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



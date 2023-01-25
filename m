Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKbMI-0007pa-QP
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 03:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKbMG-0007ol-VO
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 03:42:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKbME-0007QN-PZ
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 03:42:16 -0500
Received: by mail-wr1-x433.google.com with SMTP id m7so2596512wru.8
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 00:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwmWUou3n7EK2dJeuj7/aaDxziEUHfXgfhDPpUIodg0=;
 b=WpL9rvglxaPJswbSjl+3hVNq/kFYhxjifUM9Ob7HJnPn44ZYY8X53kpuVkvdyBz9Rr
 hLwUupIAy7G/JYeO/Hbk1XcZXonFtqRWNmQENa1CzUguuVnvjeiXkCqN7YLqE/xd1UjT
 GCNjbuvpYkZPiUFfZQG6yfb65mY9ZYzzG2bQV/OLHaMBC2lfmSva7hg/hLktnR3/j2fe
 AK2Ky2IFPyBZz9jAbEKSmdOvu9JyB5PiqpJe7wrStb2qXOIGZJwEZafKqDU2X4tLqIiU
 BIZVsTYzDupDfl/BK1I1LR4Ee3J2Phrvfch69vKmDgrxR4hXomowtt57vFtyhgK/HJG3
 SiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwmWUou3n7EK2dJeuj7/aaDxziEUHfXgfhDPpUIodg0=;
 b=Cy9687SNN9jCNOGDjHY/+SCJaXfPJNi7+OvrUlR341p0kxcUe51WD4zxQAiq4NMSIK
 S8YGv0iILAExirp5Y9nQbyc8GFtAkjDRUxFIe+HusJwdsVsA1in7VQi+3s1fli2u0MvL
 WFw6LjoOkS+a1nzg2mQg+hyy0DsqJ565YMMgc8K6AzJCjdAHVtS45f8IxgfnAv38yZpH
 xY20rlRqGRoxozhU+CibVSmjuiqWisbY1eC6LiIejSkS6aPkzShB/br3YMvDY/ReoUPW
 puiQNNqOMFefy213kLmbmsjour0ugF+EIAQpA41MExQETgCsbo01gckJSODjG7zZjCSR
 MDbg==
X-Gm-Message-State: AO0yUKVj0QSKarrQmC/VTDM7lw4wEAGyHNIK/J4M+8Z4IUnVTFS231Uz
 HvZ3FVh+DxOP05/mSUtIoMABGw==
X-Google-Smtp-Source: AK7set/F+bJPoWvq+YGQie12Nf1t3royEghLt6hYxMUUxx43b8XbzIBllSNNcA2OeN/X+GqwuX6nzQ==
X-Received: by 2002:a05:6000:257:b0:2bf:bb48:ddaf with SMTP id
 m23-20020a056000025700b002bfbb48ddafmr834899wrz.7.1674636133233; 
 Wed, 25 Jan 2023 00:42:13 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 w14-20020a5d608e000000b002bc84c55758sm4609145wrt.63.2023.01.25.00.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 00:42:12 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v7 1/5] riscv: Pass Object to register_cpu_props instead of
 DeviceState
Date: Wed, 25 Jan 2023 09:41:03 +0100
Message-Id: <20230125084107.1580972-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125084107.1580972-1-alexghiti@rivosinc.com>
References: <20230125084107.1580972-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Wed, 25 Jan 2023 08:42:17 -0000

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



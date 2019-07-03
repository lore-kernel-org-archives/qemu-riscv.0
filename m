Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaqE-0006fU-1Y
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq7-0006Kn-1W
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq5-0008C0-6J
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:06 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:35559)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapx-0007Kj-N8
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:01 -0400
Received: by mail-lj1-f170.google.com with SMTP id x25so1499519ljh.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=f47wk3zk+NrAkxWNULcRjGx8TZzZ5xzH7RJlcRZY1+U=;
 b=R1YN6Ax95qj5M+pvydQf8wBVTLPphn2t9UjzkOX5iIXwE426lNBpOaD3Q9CEjGxDKy
 LubVA2P+nbC0Dpa4Dy/hBNhTQOZcyijlp61OLyWZ7hcu478qiDm5aCtejwOPRVl9vu83
 fQsl3VmqYEkkvfLH0P1YJHoN0pSc+DqyD1pWB2WGwrd8XsCbBevxRUjEpZwMEUpaHwxw
 PzuCCmfpU7qrOzOyd3vRfKWsHfOY4nWft+fd3UQuXKdr/thZB+MCvJGVKexKioXDD6UA
 Ofolp7qQ7oD/gd+cOKkR4/NdSci+utjWwx4fXaf1HhDiEqIxITjfsgBNqKs9fmjbi6iR
 4UgA==
X-Gm-Message-State: APjAAAWTvIf/CyglYKHRd6mquawCzpVY/9QAQV8R9jNoUhqgsvDXdxEL
 lpEs3QmFSMwydelTe7u7/wPzOA==
X-Google-Smtp-Source: APXvYqxO98kcHHlVwJhn1iOYvxtrXu8ag9ZszfvaHW97RLrtKdnGHDo9PJv7MbRT0RrCaTZUBpwkDg==
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr20037134lji.231.1562143303094; 
 Wed, 03 Jul 2019 01:41:43 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id h22sm336899ljj.105.2019.07.03.01.41.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:42 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:35 -0700
Message-Id: <20190703084048.6980-20-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.170
Subject: [Qemu-riscv] [PULL 19/32] target/riscv: Remove user version
 information
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jul 2019 08:42:12 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Remove the user version information. This was never used and never
publically exposed in a release of QEMU, so let's just remove it. In
future to manage versions we can extend the extension properties to
specify version.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 32 +++++++++-----------------------
 target/riscv/cpu.h |  2 --
 2 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1689ffecf85f..6a54ebf10c62 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -89,9 +89,8 @@ static void set_misa(CPURISCVState *env, target_ulong misa)
     env->misa_mask = env->misa = misa;
 }
 
-static void set_versions(CPURISCVState *env, int user_ver, int priv_ver)
+static void set_priv_version(CPURISCVState *env, int priv_ver)
 {
-    env->user_ver = user_ver;
     env->priv_ver = priv_ver;
 }
 
@@ -111,7 +110,7 @@ static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_11_0);
+    set_priv_version(env, PRIV_VERSION_1_11_0);
     set_resetvec(env, DEFAULT_RSTVEC);
 }
 
@@ -128,7 +127,7 @@ static void rv32gcsu_priv1_09_1_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_09_1);
+    set_priv_version(env, PRIV_VERSION_1_09_1);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
     set_feature(env, RISCV_FEATURE_PMP);
@@ -138,7 +137,7 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
     set_feature(env, RISCV_FEATURE_PMP);
@@ -148,7 +147,7 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV32 | RVI | RVM | RVA | RVC | RVU);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_PMP);
 }
@@ -166,7 +165,7 @@ static void rv64gcsu_priv1_09_1_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_09_1);
+    set_priv_version(env, PRIV_VERSION_1_09_1);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
     set_feature(env, RISCV_FEATURE_PMP);
@@ -176,7 +175,7 @@ static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_MMU);
     set_feature(env, RISCV_FEATURE_PMP);
@@ -186,7 +185,7 @@ static void rv64imacu_nommu_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RV64 | RVI | RVM | RVA | RVC | RVU);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     set_feature(env, RISCV_FEATURE_PMP);
 }
@@ -317,7 +316,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
-    int user_version = USER_VERSION_2_02_0;
     target_ulong target_misa = 0;
     Error *local_err = NULL;
 
@@ -342,18 +340,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (cpu->cfg.user_spec) {
-        if (!g_strcmp0(cpu->cfg.user_spec, "v2.02.0")) {
-            user_version = USER_VERSION_2_02_0;
-        } else {
-            error_setg(errp,
-                       "Unsupported user spec version '%s'",
-                       cpu->cfg.user_spec);
-            return;
-        }
-    }
-
-    set_versions(env, user_version, priv_version);
+    set_priv_version(env, priv_version);
     set_resetvec(env, DEFAULT_RSTVEC);
 
     if (cpu->cfg.mmu) {
@@ -454,7 +441,6 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
-    DEFINE_PROP_STRING("user_spec", RISCVCPU, cfg.user_spec),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d559d28bcda8..0855277b92d4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -78,7 +78,6 @@ enum {
     RISCV_FEATURE_MISA
 };
 
-#define USER_VERSION_2_02_0 0x00020200
 #define PRIV_VERSION_1_09_1 0x00010901
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
@@ -105,7 +104,6 @@ struct CPURISCVState {
 
     target_ulong badaddr;
 
-    target_ulong user_ver;
     target_ulong priv_ver;
     target_ulong misa;
     target_ulong misa_mask;
-- 
2.21.0



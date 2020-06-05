Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jh6xf-0001yh-NN
	for mharc-qemu-riscv@gnu.org; Fri, 05 Jun 2020 03:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jh6xe-0001vm-18; Fri, 05 Jun 2020 03:40:18 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jh6xd-0004xn-5r; Fri, 05 Jun 2020 03:40:17 -0400
Received: by mail-pj1-x1044.google.com with SMTP id a45so3041215pje.1;
 Fri, 05 Jun 2020 00:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=shiRMUuC2o0b1TUW8PBBAGKRr+19l1AXYEpWIH2oeak=;
 b=idqqTTfzqQokeNEm+wGEgRQDQWNFavI14mdb8x6+BFj4pKAdRfrvSpqIKRvb0Qonw/
 2OvfpRGFttQyKGjqSEvhRFO06olrUuXgnIo+dMm+DWxq7OKq0STmg9q6+QSY6x5aGJ0K
 Sk876hakPiMbDdUNe6n0uv7U/zq6T5+bvyZBflU+U4QOeoBa4l0xv19NEWkABh0rcaI5
 WYngzXaFCWR5PvGMUn237+ZiUnNjKBhkzR9C5mUzOBVivHHiioDo/Cf2n9Zbmx2lB1Bm
 nRk5Rn6y49A8G+xRXYaPkBZNweuWcu7DODmeIg/5jAaHtxkuv0bL6eut5kbQnAAft+QV
 c5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=shiRMUuC2o0b1TUW8PBBAGKRr+19l1AXYEpWIH2oeak=;
 b=kJvGAJKA0Uj15hoOpsB+iN6Z48BnDc3hvhiVEdoOo1Q4CER60pw9Og41S9ZUgagZ8K
 A4cb5eCI+MHfOSs4fH263eACy470swikhErxvFPDWXQdL1AVdytn5qH+4JqWQBjWTZrA
 tx/MOeEW5NuttGabCZ66RtCEavSTFP/irBpTASgJHfGJ3UGHzU573ZGqNWcEP25eP5BV
 2r4T3zsBD3KvNibNK5o6r30Mg1STvZrANzDmikLiIfG5g0I539p4C4hLUqHj995HO7mv
 lPVgGp8DjeWxRYe2bOj0WmzH6ykzX3ma5TVa8nr1lgOUF5VRP6V1M6znRXeLfhQc1d0C
 1ELQ==
X-Gm-Message-State: AOAM532D3tMBc6RszVxrE69KNrPZRuz9I7gG03W02F5Qwy55ZpoBiODE
 NOxEVZreV2eanv2ii6d7AZo=
X-Google-Smtp-Source: ABdhPJyXCAQQ/UVbqmgXfj04Piczl5b74JYzdfivvVvd0uCLgl48H1HbxNcly7SHr9ZZb6cuJnMn2A==
X-Received: by 2002:a17:90a:ad87:: with SMTP id
 s7mr1552825pjq.225.1591342815074; 
 Fri, 05 Jun 2020 00:40:15 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id y23sm7446619pje.3.2020.06.05.00.40.14
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 05 Jun 2020 00:40:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/4] riscv: Generalize CPU init routine for the base CPU
Date: Fri,  5 Jun 2020 00:38:24 -0700
Message-Id: <1591342707-9729-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Fri, 05 Jun 2020 07:40:18 -0000

From: Bin Meng <bin.meng@windriver.com>

There is no need to have two functions that have exactly the same
codes for 32-bit and 64-bit base CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/riscv/cpu.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9007a25..d38d829 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -126,9 +126,7 @@ static void riscv_any_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
 }
 
-#if defined(TARGET_RISCV32)
-
-static void riscv_base32_cpu_init(Object *obj)
+static void riscv_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
@@ -136,6 +134,8 @@ static void riscv_base32_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
 }
 
+#if defined(TARGET_RISCV32)
+
 static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -173,14 +173,6 @@ static void rv32imafcu_nommu_cpu_init(Object *obj)
 
 #elif defined(TARGET_RISCV64)
 
-static void riscv_base64_cpu_init(Object *obj)
-{
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
-    /* We set this in the realise function */
-    set_misa(env, 0);
-    set_resetvec(env, DEFAULT_RSTVEC);
-}
-
 static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -601,13 +593,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     },
     DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
 #if defined(TARGET_RISCV32)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base32_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32imcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_init),
 #elif defined(TARGET_RISCV64)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base64_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64imacu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64gcsu_priv1_10_0_cpu_init),
 #endif
-- 
2.7.4



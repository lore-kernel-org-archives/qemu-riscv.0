Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqmof-0008WT-PN
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 22:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqmoe-0008SJ-3I; Mon, 16 May 2022 22:20:04 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:41172 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqmob-0000rn-2J; Mon, 16 May 2022 22:20:03 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABXX2cpBoNisA6HBw--.58658S3;
 Tue, 17 May 2022 10:19:57 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 2/2] target/riscv: disable zb* extensions for sifive/ibex
 cpu types by default
Date: Tue, 17 May 2022 10:19:07 +0800
Message-Id: <20220517021907.10060-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517021907.10060-1-liweiwei@iscas.ac.cn>
References: <20220517021907.10060-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABXX2cpBoNisA6HBw--.58658S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAF4UZw1ruFyxZr1DAr4ktFb_yoW5tF1rpr
 y5Ca4SgrW8Arn7Ga18GrZ7Cry8Cw18KrZxX3y2kr4UAay5J398XF1UArs2k3W8JFW8ZF9I
 9ay8Wa17X397Cw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 May 2022 02:20:04 -0000

 - properties for zb* extensions are enabled by default which will make sifive/ibex cpu types implicitly support zb* extensions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b12f69c584..e205be34e9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -176,6 +176,10 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    qdev_prop_set_bit(DEVICE(obj), "zba", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
 }
 
 static void rv64_sifive_e_cpu_init(Object *obj)
@@ -184,6 +188,10 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    qdev_prop_set_bit(DEVICE(obj), "zba", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
 }
 
 static void rv128_base_cpu_init(Object *obj)
@@ -211,6 +219,10 @@ static void rv32_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    qdev_prop_set_bit(DEVICE(obj), "zba", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
 }
 
 static void rv32_sifive_e_cpu_init(Object *obj)
@@ -219,6 +231,10 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    qdev_prop_set_bit(DEVICE(obj), "zba", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
 }
 
 static void rv32_ibex_cpu_init(Object *obj)
@@ -228,6 +244,10 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
     qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
+    qdev_prop_set_bit(DEVICE(obj), "zba", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
@@ -237,6 +257,10 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_10_0);
     set_resetvec(env, DEFAULT_RSTVEC);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    qdev_prop_set_bit(DEVICE(obj), "zba", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
+    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
 }
 #endif
 
-- 
2.17.1



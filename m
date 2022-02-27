Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOKdx-0000uf-KL
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 09:35:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOKdv-0000pE-Di; Sun, 27 Feb 2022 09:35:23 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:36626 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOKdr-0007fw-OZ; Sun, 27 Feb 2022 09:35:22 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACX3sZLihti7HLGAQ--.65305S16;
 Sun, 27 Feb 2022 22:27:38 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 14/14] target/riscv: rvk: expose zbk* and zk* properties
Date: Sun, 27 Feb 2022 22:25:53 +0800
Message-Id: <20220227142553.25815-15-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowACX3sZLihti7HLGAQ--.65305S16
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF1kXrWUCw4rtw17GFg_yoW8Ar1fpr
 y5JFW7KwnxJry3Cay8tw1DJ3ykCa1rA39Fq3yxZws7Ar4fGr43GF1DGanYkr47Xr48Za1f
 uF13ur1F9390ya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4U
 JVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
 0JUQSdkUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Sun, 27 Feb 2022 14:35:23 -0000

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d30534ead5..64bc776072 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -804,7 +804,20 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
+    DEFINE_PROP_BOOL("zbkb", RISCVCPU, cfg.ext_zbkb, false),
+    DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
+    DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
+    DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
+    DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
+    DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
+    DEFINE_PROP_BOOL("zkne", RISCVCPU, cfg.ext_zkne, false),
+    DEFINE_PROP_BOOL("zknh", RISCVCPU, cfg.ext_zknh, false),
+    DEFINE_PROP_BOOL("zkr", RISCVCPU, cfg.ext_zkr, false),
+    DEFINE_PROP_BOOL("zks", RISCVCPU, cfg.ext_zks, false),
+    DEFINE_PROP_BOOL("zksed", RISCVCPU, cfg.ext_zksed, false),
+    DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
+    DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
 
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
-- 
2.17.1



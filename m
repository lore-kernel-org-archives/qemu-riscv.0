Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmtVP-0007Ko-98
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 03:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mmtV4-0007BW-HA; Tue, 16 Nov 2021 03:07:34 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:54810 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mmtV2-0003D0-B5; Tue, 16 Nov 2021 03:07:30 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mO2hZpNhU9VmBw--.50016S9;
 Tue, 16 Nov 2021 16:07:22 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, liweiwei <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v2 7/7] target/riscv: rvk: expose zbk* and zk* properties
Date: Tue, 16 Nov 2021 16:06:21 +0800
Message-Id: <20211116080621.2521-8-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116080621.2521-1-liweiwei@iscas.ac.cn>
References: <20211116080621.2521-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowAC3mO2hZpNhU9VmBw--.50016S9
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWUJryrJFyfZr4fuw47CFg_yoW8Arykpr
 y5XFW7KwsxJr1fAay5tw1DJ3y8Ga1fA3sFg3yxZ3Z7Ar4xKr47WF1DJanYkr47Jr4rZa1f
 uF13ur1F93yvya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
 WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VU17G
 YJUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 16 Nov 2021 08:07:34 -0000

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a5ec182a86..fc7ccba672 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -661,7 +661,20 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
+    DEFINE_PROP_BOOL("x-zbkb", RISCVCPU, cfg.ext_zbkb, false),
+    DEFINE_PROP_BOOL("x-zbkc", RISCVCPU, cfg.ext_zbkc, false),
+    DEFINE_PROP_BOOL("x-zbkx", RISCVCPU, cfg.ext_zbkx, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
+    DEFINE_PROP_BOOL("x-zk", RISCVCPU, cfg.ext_zk, false),
+    DEFINE_PROP_BOOL("x-zkn", RISCVCPU, cfg.ext_zkn, false),
+    DEFINE_PROP_BOOL("x-zknd", RISCVCPU, cfg.ext_zknd, false),
+    DEFINE_PROP_BOOL("x-zkne", RISCVCPU, cfg.ext_zkne, false),
+    DEFINE_PROP_BOOL("x-zknh", RISCVCPU, cfg.ext_zknh, false),
+    DEFINE_PROP_BOOL("x-zkr", RISCVCPU, cfg.ext_zkr, false),
+    DEFINE_PROP_BOOL("x-zks", RISCVCPU, cfg.ext_zks, false),
+    DEFINE_PROP_BOOL("x-zksed", RISCVCPU, cfg.ext_zksed, false),
+    DEFINE_PROP_BOOL("x-zksh", RISCVCPU, cfg.ext_zksh, false),
+    DEFINE_PROP_BOOL("x-zkt", RISCVCPU, cfg.ext_zkt, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-- 
2.17.1



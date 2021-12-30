Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2wTN-0000RE-AQ
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 09:32:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2wTE-0000GE-GY; Thu, 30 Dec 2021 09:31:56 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:55294 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n2wTA-0004Aq-NT; Thu, 30 Dec 2021 09:31:56 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADHzFjJws1h4_TqBA--.24839S9;
 Thu, 30 Dec 2021 22:31:44 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 7/7] target/riscv: rvk: expose zbk* and zk* properties
Date: Thu, 30 Dec 2021 22:30:58 +0800
Message-Id: <20211230143058.7352-8-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
References: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowADHzFjJws1h4_TqBA--.24839S9
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWUJryrJF1rJFWrXFW7twb_yoW8WrW8pr
 15XFW7KwnxJry3Aay5tw1DJ3yrCa1fC3sFg3yxZ3Z7Ar4fKr47WF1DJanYkr47Xr4rZF4f
 uF13ur1F939Yya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQSdkU
 UUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 30 Dec 2021 14:31:56 -0000

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 961c5f4334..6575ec8cfa 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -668,6 +668,19 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
+    DEFINE_PROP_BOOL("x-zbkb", RISCVCPU, cfg.ext_zbkb, false),
+    DEFINE_PROP_BOOL("x-zbkc", RISCVCPU, cfg.ext_zbkc, false),
+    DEFINE_PROP_BOOL("x-zbkx", RISCVCPU, cfg.ext_zbkx, false),
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
     /* ePMP 0.9.3 */
-- 
2.17.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhu0t-0000hP-JA
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 09:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhkEO-000321-WC; Mon, 01 Nov 2021 23:13:02 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:34830 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mhkEJ-0004mo-8A; Mon, 01 Nov 2021 23:13:00 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mO2qrIBh7YkSBg--.46962S3;
 Tue, 02 Nov 2021 11:12:45 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: luruibo2000@163.com, lustrew@foxmail.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, liweiwei@iscas.ac.cn
Subject: [RFC 1/6] target/riscv: rvk: add flag support for Zbk[bcx]
Date: Tue,  2 Nov 2021 11:11:23 +0800
Message-Id: <20211102031128.17296-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowAC3mO2qrIBh7YkSBg--.46962S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWUJry5JrWfKF15CryxAFb_yoW8CFy5pr
 WUGay2krsxAryfCayrtF1DJw48Gwn3CayxK3yxX3Z7Gr4fKrW7XF1qkw1DuF45tF4rZa1f
 uF13Cr15Aws2ya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
 JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5U
 UUUU=
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
X-Mailman-Approved-At: Tue, 02 Nov 2021 09:39:19 -0400
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
X-List-Received-Date: Tue, 02 Nov 2021 03:13:02 -0000
X-List-Received-Date: Tue, 02 Nov 2021 03:13:02 -0000

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c | 9 ++++++---
 target/riscv/cpu.h | 3 +++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d53125dbc..0f03d3efba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -472,15 +472,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             error_setg(errp,
                        "I and E extensions are incompatible");
                        return;
-       }
+        }
 
         if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
             error_setg(errp,
                        "Either I or E extension must be set");
                        return;
-       }
+        }
 
-       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
+        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
                                cpu->cfg.ext_a & cpu->cfg.ext_f &
                                cpu->cfg.ext_d)) {
             warn_report("Setting G will also set IMAFD");
@@ -639,6 +639,9 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
+    DEFINE_PROP_BOOL("x-zbkb", RISCVCPU, cfg.ext_zbkb, false),
+    DEFINE_PROP_BOOL("x-zbkc", RISCVCPU, cfg.ext_zbkc, false),
+    DEFINE_PROP_BOOL("x-zbkx", RISCVCPU, cfg.ext_zbkx, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..f9f4437efc 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -309,6 +309,9 @@ struct RISCVCPU {
         bool ext_zbb;
         bool ext_zbc;
         bool ext_zbs;
+        bool ext_zbkb;
+        bool ext_zbkc;
+        bool ext_zbkx;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.17.1



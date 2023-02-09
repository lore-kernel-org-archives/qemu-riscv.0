Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPyKa-00018k-17
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 23:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pPyKX-000153-3B; Wed, 08 Feb 2023 23:14:41 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pPyKS-0002XH-O2; Wed, 08 Feb 2023 23:14:40 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAAnJkIfc+RjuUgtBA--.61796S10;
 Thu, 09 Feb 2023 12:14:30 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v11 8/9] target/riscv: expose properties for Zc* extension
Date: Thu,  9 Feb 2023 12:13:51 +0800
Message-Id: <20230209041352.53980-9-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209041352.53980-1-liweiwei@iscas.ac.cn>
References: <20230209041352.53980-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnJkIfc+RjuUgtBA--.61796S10
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1fCFWDtw43Aw4fJr48Xrb_yoW8uF47pr
 W5Ga47Kw15Jr13Gwnxtr1DG3yrCw4rA3s7K3ySv3Z7XrZ7KrZrX3ZrC39rW3yrtF4rZw4S
 gF13Zr1xArs5ta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
 6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQSdkUUUUU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 09 Feb 2023 04:14:41 -0000

Expose zca,zcb,zcf,zcd,zcmp,zcmt properties

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 196473a60f..eb9e74ecd5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -82,6 +82,12 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
     ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
+    ISA_EXT_DATA_ENTRY(zca, true, PRIV_VERSION_1_12_0, ext_zca),
+    ISA_EXT_DATA_ENTRY(zcb, true, PRIV_VERSION_1_12_0, ext_zcb),
+    ISA_EXT_DATA_ENTRY(zcf, true, PRIV_VERSION_1_12_0, ext_zcf),
+    ISA_EXT_DATA_ENTRY(zcd, true, PRIV_VERSION_1_12_0, ext_zcd),
+    ISA_EXT_DATA_ENTRY(zcmp, true, PRIV_VERSION_1_12_0, ext_zcmp),
+    ISA_EXT_DATA_ENTRY(zcmt, true, PRIV_VERSION_1_12_0, ext_zcmt),
     ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
     ISA_EXT_DATA_ENTRY(zbb, true, PRIV_VERSION_1_12_0, ext_zbb),
     ISA_EXT_DATA_ENTRY(zbc, true, PRIV_VERSION_1_12_0, ext_zbc),
@@ -1187,6 +1193,13 @@ static Property riscv_cpu_extensions[] = {
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
+
+    DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
+    DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
+    DEFINE_PROP_BOOL("x-zcd", RISCVCPU, cfg.ext_zcd, false),
+    DEFINE_PROP_BOOL("x-zcf", RISCVCPU, cfg.ext_zcf, false),
+    DEFINE_PROP_BOOL("x-zcmp", RISCVCPU, cfg.ext_zcmp, false),
+    DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
-- 
2.25.1



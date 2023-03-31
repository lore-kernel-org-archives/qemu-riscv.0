Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piGKo-0000JP-9m
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 11:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piGKi-0000Fz-5p; Fri, 31 Mar 2023 11:06:28 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piGKf-0003xY-Dj; Fri, 31 Mar 2023 11:06:27 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAB3fs7k9iZkzJBxGQ--.8380S8;
 Fri, 31 Mar 2023 23:06:16 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 6/8] accel/tcg: Fix tb mis-matched problem when CF_PCREL is
 enabled
Date: Fri, 31 Mar 2023 23:06:07 +0800
Message-Id: <20230331150609.114401-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB3fs7k9iZkzJBxGQ--.8380S8
X-Coremail-Antispam: 1UD129KBjvJXoW7tr18AF4rCF1UJF4fJry3CFg_yoW8GFWxpr
 ZrJF1YkaykWF12qa1DZ347W34rWF4DCFWkG3y5uryI9w1Sgw10yws5Cr4xurW5CrWFgFnr
 AFs2vr1FqF18ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
 WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZ
 X7UUUUU==
X-Originating-IP: [180.175.29.170]
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
X-List-Received-Date: Fri, 31 Mar 2023 15:06:28 -0000

A corner case is triggered  when tb block with first_pc = 0x80000008
and first_pc = 0x800000200 has the same jump cache hash, and share
the same tb entry with the same tb information except PC.
The executed sequence is as follows:
tb(0x80000008) -> tb(0x80000008)-> tb(0x800000200) -> tb(0x80000008)

1. At the first time tb for 0x80000008 is loaded, tb in jmp_cache is
filled, however pc is not updated.
2. At the second time tb for 0x80000008 is looked up in tb_lookup(),
pc in jmp cache is set to 0x80000008.
3. when tb for 0x800000200 is loaded, tb for jmp cache is updated to
this block, however pc is not updated, and remains to be 0x80000008.
4. Finally at the last time tb for 0x80000008 is looked up, tb for
0x800000200 is mismatched.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 accel/tcg/cpu-exec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c815f2dbfd..faff413f42 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -983,6 +983,9 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
                 h = tb_jmp_cache_hash_func(pc);
                 /* Use the pc value already stored in tb->pc. */
                 qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
+                if (cflags & CF_PCREL) {
+                    qatomic_set(&cpu->tb_jmp_cache->array[h].pc, pc);
+                }
             }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1



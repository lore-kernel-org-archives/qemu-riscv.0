Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRqxC-0005Hf-Rp
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 03:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqx7-00055g-5M; Tue, 14 Feb 2023 03:46:17 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqx4-0006xb-1U; Tue, 14 Feb 2023 03:46:16 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowADHz5uOSOtjHFQsBQ--.41555S15;
 Tue, 14 Feb 2023 16:38:46 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [Patch 13/14] target/riscv: Simplify check for EEW = 64 in
 trans_rvv.c.inc
Date: Tue, 14 Feb 2023 16:38:32 +0800
Message-Id: <20230214083833.44205-14-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHz5uOSOtjHFQsBQ--.41555S15
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rGr4fAryxuFWrZFyxXwb_yoW8Zr4fpw
 1rCrWxur4jqFWfuwsakr4jqF1Yy3yrtry7Ka4jv3Z5Xa95Xr4ru3Z0qwn3tr4UXFyFqFy0
 kF45AF15ur42va7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
 0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-Originating-IP: [114.95.238.225]
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
X-List-Received-Date: Tue, 14 Feb 2023 08:46:17 -0000

Only V extension support EEW = 64 in these case: Zve64* extensions
don't support EEW = 64 as commented

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5dbdce073b..fc0d0d60e8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1998,8 +1998,7 @@ static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2012,8 +2011,7 @@ static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
@@ -2230,8 +2228,7 @@ static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2242,8 +2239,7 @@ static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
-- 
2.25.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7pGv-0003IA-VX
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 20:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n7pGm-00037u-Me; Wed, 12 Jan 2022 20:51:16 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:48592 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n7pGj-0000iQ-TG; Wed, 12 Jan 2022 20:51:16 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowABXXwODhd9hljodBg--.33470S3;
 Thu, 13 Jan 2022 09:51:01 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 1/6] target/riscv: add cfg properties for zfinx,
 zdinx and zhinx{min}
Date: Thu, 13 Jan 2022 09:49:54 +0800
Message-Id: <20220113014959.21429-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
References: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowABXXwODhd9hljodBg--.33470S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWr47Ary8Wr4xCr1xWryDZFb_yoW5XrWkpr
 WUWa1ayF98XFy7A3Z3JF1DtF1rWwn7WFWrK392vwn3WrWaqrW5JF1qk3WUuF4Yqa1rXF1a
 9F4qkFy5Ar48Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-List-Received-Date: Thu, 13 Jan 2022 01:51:16 -0000

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c       | 12 ++++++++++++
 target/riscv/cpu.h       |  4 ++++
 target/riscv/translate.c |  8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055..fc3ec5bca1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -518,6 +518,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_d = true;
         }
 
+        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
+            cpu->cfg.ext_zhinxmin) {
+            cpu->cfg.ext_zfinx = true;
+        }
+
         /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_i) {
             ext |= RVI;
@@ -592,6 +597,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_j) {
             ext |= RVJ;
         }
+        if (cpu->cfg.ext_zfinx && ((ext & (RVF | RVD)) || cpu->cfg.ext_zfh ||
+                                   cpu->cfg.ext_zfhmin)) {
+            error_setg(errp,
+                    "'Zfinx' cannot be supported together with 'F', 'D', 'Zfh',"
+                    " 'Zfhmin'");
+            return;
+        }
 
         set_misa(env, env->misa_mxl, ext);
     }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d63086765..b202bcbeff 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -327,8 +327,12 @@ struct RISCVCPU {
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_zdinx;
         bool ext_zfh;
         bool ext_zfhmin;
+        bool ext_zfinx;
+        bool ext_zhinx;
+        bool ext_zhinxmin;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 615048ec87..9687fa3e7c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -77,8 +77,12 @@ typedef struct DisasContext {
     RISCVMXL ol;
     bool virt_enabled;
     bool ext_ifencei;
+    bool ext_zdinx;
     bool ext_zfh;
     bool ext_zfhmin;
+    bool ext_zfinx;
+    bool ext_zhinx;
+    bool ext_zhinxmin;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -892,8 +896,12 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
+    ctx->ext_zdinx = cpu->cfg.ext_zdinx;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
+    ctx->ext_zfinx = cpu->cfg.ext_zfinx;
+    ctx->ext_zhinx = cpu->cfg.ext_zhinx;
+    ctx->ext_zhinxmin = cpu->cfg.ext_zhinxmin;
     ctx->vlen = cpu->cfg.vlen;
     ctx->elen = cpu->cfg.elen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
-- 
2.17.1



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0bb5-0006lq-NN
	for mharc-qemu-riscv@gnu.org; Thu, 23 Dec 2021 22:50:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0bay-0006lV-MF; Thu, 23 Dec 2021 22:50:17 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:49288 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0bav-0001Zb-Rd; Thu, 23 Dec 2021 22:50:16 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACHjwNqQ8VheYHIBA--.4261S3;
 Fri, 24 Dec 2021 11:50:04 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com,
 liweiwei <liweiwei@iscas.ac.cn>
Subject: [PATCH 1/6] target/riscv: add cfg properties for zfinx,
 zdinx and zhinx{min}
Date: Fri, 24 Dec 2021 11:49:10 +0800
Message-Id: <20211224034915.17204-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowACHjwNqQ8VheYHIBA--.4261S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1rZF1ftFy8Aw1fJw1UKFg_yoW5Ary8pr
 WUW3WayF98XFy7Aas7JF1Dt3W8Wwn7GFWrK392vw1fWrWSqrW5JF4qk34UZF4Yq3WrXF1a
 9F4qkFy5Ar48ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
 j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
 W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU==
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
X-List-Received-Date: Fri, 24 Dec 2021 03:50:19 -0000

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 roms/SLOF                |  2 +-
 target/riscv/cpu.c       | 12 ++++++++++++
 target/riscv/cpu.h       |  4 ++++
 target/riscv/translate.c |  8 ++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/roms/SLOF b/roms/SLOF
index a6906b024c..dd0dcaa1c1 160000
--- a/roms/SLOF
+++ b/roms/SLOF
@@ -1 +1 @@
-Subproject commit a6906b024c6cca5a86496f51eb4bfee3a0c36148
+Subproject commit dd0dcaa1c1085c159ddab709c7f274b3917be8bd
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bce..a5fa14f2ac 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -491,6 +491,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_d = true;
         }
 
+        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
+            cpu->cfg.ext_zhinxmin ) {
+            cpu->cfg.ext_zfinx = true;
+        }
+
         /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_i) {
             ext |= RVI;
@@ -565,6 +570,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
index dc10f27093..6fba31c5cd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -315,8 +315,12 @@ struct RISCVCPU {
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
index 5df6c0d800..8b1cdacf50 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -76,8 +76,12 @@ typedef struct DisasContext {
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
@@ -703,8 +707,12 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
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



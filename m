Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C28C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 08:49:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaXvW-0000XM-7H; Mon, 28 Aug 2023 04:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXvO-0000PX-Q2; Mon, 28 Aug 2023 04:48:42 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXvM-0000QT-G8; Mon, 28 Aug 2023 04:48:42 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R831e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0Vqix7Bi_1693212511; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vqix7Bi_1693212511) by smtp.aliyun-inc.com;
 Mon, 28 Aug 2023 16:48:33 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 4/6] target/riscv: Add default value for misa property
Date: Mon, 28 Aug 2023 16:45:34 +0800
Message-Id: <20230828084536.231-5-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
References: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Before this patch,
"
qemu-system-riscv64 -device rv64-riscv-cpu,v=true,help

...
v=<bool>               - Vector operations
...

"

After this patch,
"
v=<bool>               - Vector operations (default: false)
"

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c2f102fae1..38838cd2c0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1728,6 +1728,7 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
     int i;
 
     for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
+        ObjectProperty *op;
         RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
         int bit = misa_cfg->misa_bit;
 
@@ -1739,14 +1740,13 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
             continue;
         }
 
-        object_property_add(cpu_obj, misa_cfg->name, "bool",
-                            cpu_get_misa_ext_cfg,
-                            cpu_set_misa_ext_cfg,
-                            NULL, (void *)misa_cfg);
+        op = object_property_add(cpu_obj, misa_cfg->name, "bool",
+                                 cpu_get_misa_ext_cfg,
+                                 cpu_set_misa_ext_cfg,
+                                 NULL, (void *)misa_cfg);
         object_property_set_description(cpu_obj, misa_cfg->name,
                                         misa_cfg->description);
-        object_property_set_bool(cpu_obj, misa_cfg->name,
-                                 misa_cfg->enabled, NULL);
+        object_property_set_default_bool(op, misa_cfg->enabled);
     }
 }
 
-- 
2.17.1



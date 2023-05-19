Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85521C77B73
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 May 2023 02:25:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzpmw-0004Wm-9a; Thu, 18 May 2023 22:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzpmo-0004SI-M6; Thu, 18 May 2023 22:24:06 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzpmi-0002AM-OL; Thu, 18 May 2023 22:24:05 -0400
Received: from localhost.localdomain (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowACHjw+x3WZkAeNjAQ--.12622S9;
 Fri, 19 May 2023 10:23:51 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 7/7] disas/riscv.c: Remove redundant parentheses
Date: Fri, 19 May 2023 10:19:26 +0800
Message-Id: <20230519021926.15362-8-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
References: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHjw+x3WZkAeNjAQ--.12622S9
X-Coremail-Antispam: 1UD129KBjvAXoWfXw4fWw1fAr1UuFWktw48Xrb_yoW8tF1rAo
 WrXF18Xr1093Z3Gryq9FW8JF1fKw18Aw48GasIgasruFZ8Krs0gFWUWrn8A3W5JFWrGr1I
 krs3Zw4UXa4xC3Zxn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOx7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJV
 WxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8
 Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
 Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
 Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I
 0E8cxan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
 bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
 AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
 42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
 CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
 WIevJa73UjIFyTuYvjfUOa9-UUUUU
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Remove redundant parenthese and fix multi-line comments.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 disas/riscv.c | 219 +++++++++++++++++++++++++-------------------------
 1 file changed, 110 insertions(+), 109 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index ee50a4ab0c..47c325c0d6 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2386,9 +2386,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
-    switch (((inst >> 0) & 0b11)) {
+    switch ((inst >> 0) & 0b11) {
     case 0:
-        switch (((inst >> 13) & 0b111)) {
+        switch ((inst >> 13) & 0b111) {
         case 0: op = rv_op_c_addi4spn; break;
         case 1:
             if (isa == rv128) {
@@ -2441,9 +2441,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
         }
         break;
     case 1:
-        switch (((inst >> 13) & 0b111)) {
+        switch ((inst >> 13) & 0b111) {
         case 0:
-            switch (((inst >> 2) & 0b11111111111)) {
+            switch ((inst >> 2) & 0b11111111111) {
             case 0: op = rv_op_c_nop; break;
             default: op = rv_op_c_addi; break;
             }
@@ -2457,13 +2457,13 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             break;
         case 2: op = rv_op_c_li; break;
         case 3:
-            switch (((inst >> 7) & 0b11111)) {
+            switch ((inst >> 7) & 0b11111) {
             case 2: op = rv_op_c_addi16sp; break;
             default: op = rv_op_c_lui; break;
             }
             break;
         case 4:
-            switch (((inst >> 10) & 0b11)) {
+            switch ((inst >> 10) & 0b11) {
             case 0:
                 op = rv_op_c_srli;
                 break;
@@ -2500,7 +2500,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
         }
         break;
     case 2:
-        switch (((inst >> 13) & 0b111)) {
+        switch ((inst >> 13) & 0b111) {
         case 0:
             op = rv_op_c_slli;
             break;
@@ -2520,17 +2520,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 4:
-            switch (((inst >> 12) & 0b1)) {
+            switch ((inst >> 12) & 0b1) {
             case 0:
-                switch (((inst >> 2) & 0b11111)) {
+                switch ((inst >> 2) & 0b11111) {
                 case 0: op = rv_op_c_jr; break;
                 default: op = rv_op_c_mv; break;
                 }
                 break;
             case 1:
-                switch (((inst >> 2) & 0b11111)) {
+                switch ((inst >> 2) & 0b11111) {
                 case 0:
-                    switch (((inst >> 7) & 0b11111)) {
+                    switch ((inst >> 7) & 0b11111) {
                     case 0: op = rv_op_c_ebreak; break;
                     default: op = rv_op_c_jalr; break;
                     }
@@ -2602,9 +2602,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
         }
         break;
     case 3:
-        switch (((inst >> 2) & 0b11111)) {
+        switch ((inst >> 2) & 0b11111) {
         case 0:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_lb; break;
             case 1: op = rv_op_lh; break;
             case 2: op = rv_op_lw; break;
@@ -2616,17 +2616,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 1:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0:
-                switch (((inst >> 20) & 0b111111111111)) {
+                switch ((inst >> 20) & 0b111111111111) {
                 case 40: op = rv_op_vl1re8_v; break;
                 case 552: op = rv_op_vl2re8_v; break;
                 case 1576: op = rv_op_vl4re8_v; break;
                 case 3624: op = rv_op_vl8re8_v; break;
                 }
-                switch (((inst >> 26) & 0b111)) {
+                switch ((inst >> 26) & 0b111) {
                 case 0:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: op = rv_op_vle8_v; break;
                     case 11: op = rv_op_vlm_v; break;
                     case 16: op = rv_op_vle8ff_v; break;
@@ -2641,15 +2641,15 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 3: op = rv_op_fld; break;
             case 4: op = rv_op_flq; break;
             case 5:
-                switch (((inst >> 20) & 0b111111111111)) {
+                switch ((inst >> 20) & 0b111111111111) {
                 case 40: op = rv_op_vl1re16_v; break;
                 case 552: op = rv_op_vl2re16_v; break;
                 case 1576: op = rv_op_vl4re16_v; break;
                 case 3624: op = rv_op_vl8re16_v; break;
                 }
-                switch (((inst >> 26) & 0b111)) {
+                switch ((inst >> 26) & 0b111) {
                 case 0:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: op = rv_op_vle16_v; break;
                     case 16: op = rv_op_vle16ff_v; break;
                     }
@@ -2660,15 +2660,15 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 6:
-                switch (((inst >> 20) & 0b111111111111)) {
+                switch ((inst >> 20) & 0b111111111111) {
                 case 40: op = rv_op_vl1re32_v; break;
                 case 552: op = rv_op_vl2re32_v; break;
                 case 1576: op = rv_op_vl4re32_v; break;
                 case 3624: op = rv_op_vl8re32_v; break;
                 }
-                switch (((inst >> 26) & 0b111)) {
+                switch ((inst >> 26) & 0b111) {
                 case 0:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: op = rv_op_vle32_v; break;
                     case 16: op = rv_op_vle32ff_v; break;
                     }
@@ -2679,15 +2679,15 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 7:
-                switch (((inst >> 20) & 0b111111111111)) {
+                switch ((inst >> 20) & 0b111111111111) {
                 case 40: op = rv_op_vl1re64_v; break;
                 case 552: op = rv_op_vl2re64_v; break;
                 case 1576: op = rv_op_vl4re64_v; break;
                 case 3624: op = rv_op_vl8re64_v; break;
                 }
-                switch (((inst >> 26) & 0b111)) {
+                switch ((inst >> 26) & 0b111) {
                 case 0:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: op = rv_op_vle64_v; break;
                     case 16: op = rv_op_vle64ff_v; break;
                     }
@@ -2700,25 +2700,25 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 3:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_fence; break;
             case 1: op = rv_op_fence_i; break;
             case 2: op = rv_op_lq; break;
             }
             break;
         case 4:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_addi; break;
             case 1:
-                switch (((inst >> 27) & 0b11111)) {
+                switch ((inst >> 27) & 0b11111) {
                 case 0b00000: op = rv_op_slli; break;
                 case 0b00001:
-                    switch (((inst >> 20) & 0b1111111)) {
+                    switch ((inst >> 20) & 0b1111111) {
                     case 0b0001111: op = rv_op_zip; break;
                     }
                     break;
                 case 0b00010:
-                    switch (((inst >> 20) & 0b1111111)) {
+                    switch ((inst >> 20) & 0b1111111) {
                     case 0b0000000: op = rv_op_sha256sum0; break;
                     case 0b0000001: op = rv_op_sha256sum1; break;
                     case 0b0000010: op = rv_op_sha256sig0; break;
@@ -2733,7 +2733,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     break;
                 case 0b00101: op = rv_op_bseti; break;
                 case 0b00110:
-                    switch (((inst >> 20) & 0b1111111)) {
+                    switch ((inst >> 20) & 0b1111111) {
                     case 0b0000000: op = rv_op_aes64im; break;
                     default:
                         if (((inst >> 24) & 0b0111) == 0b001) {
@@ -2745,7 +2745,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 0b01001: op = rv_op_bclri; break;
                 case 0b01101: op = rv_op_binvi; break;
                 case 0b01100:
-                    switch (((inst >> 20) & 0b1111111)) {
+                    switch ((inst >> 20) & 0b1111111) {
                     case 0b0000000: op = rv_op_clz; break;
                     case 0b0000001: op = rv_op_ctz; break;
                     case 0b0000010: op = rv_op_cpop; break;
@@ -2760,10 +2760,10 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 3: op = rv_op_sltiu; break;
             case 4: op = rv_op_xori; break;
             case 5:
-                switch (((inst >> 27) & 0b11111)) {
+                switch ((inst >> 27) & 0b11111) {
                 case 0b00000: op = rv_op_srli; break;
                 case 0b00001:
-                    switch (((inst >> 20) & 0b1111111)) {
+                    switch ((inst >> 20) & 0b1111111) {
                     case 0b0001111: op = rv_op_unzip; break;
                     }
                     break;
@@ -2786,10 +2786,10 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             break;
         case 5: op = rv_op_auipc; break;
         case 6:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_addiw; break;
             case 1:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_slliw; break;
                 case 2: op = rv_op_slli_uw; break;
                 case 24:
@@ -2802,7 +2802,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 5:
-                switch (((inst >> 25) & 0b1111111)) {
+                switch ((inst >> 25) & 0b1111111) {
                 case 0: op = rv_op_srliw; break;
                 case 32: op = rv_op_sraiw; break;
                 case 48: op = rv_op_roriw; break;
@@ -2811,7 +2811,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 8:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_sb; break;
             case 1: op = rv_op_sh; break;
             case 2: op = rv_op_sw; break;
@@ -2820,17 +2820,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 9:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0:
-                switch (((inst >> 20) & 0b111111111111)) {
+                switch ((inst >> 20) & 0b111111111111) {
                 case 40: op = rv_op_vs1r_v; break;
                 case 552: op = rv_op_vs2r_v; break;
                 case 1576: op = rv_op_vs4r_v; break;
                 case 3624: op = rv_op_vs8r_v; break;
                 }
-                switch (((inst >> 26) & 0b111)) {
+                switch ((inst >> 26) & 0b111) {
                 case 0:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: op = rv_op_vse8_v; break;
                     case 11: op = rv_op_vsm_v; break;
                     }
@@ -2844,9 +2844,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 3: op = rv_op_fsd; break;
             case 4: op = rv_op_fsq; break;
             case 5:
-                switch (((inst >> 26) & 0b111)) {
+                switch ((inst >> 26) & 0b111) {
                 case 0:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: op = rv_op_vse16_v; break;
                     }
                     break;
@@ -2856,9 +2856,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 6:
-                switch (((inst >> 26) & 0b111)) {
+                switch ((inst >> 26) & 0b111) {
                 case 0:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: op = rv_op_vse32_v; break;
                     }
                     break;
@@ -2868,9 +2868,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 7:
-                switch (((inst >> 26) & 0b111)) {
+                switch ((inst >> 26) & 0b111) {
                 case 0:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: op = rv_op_vse64_v; break;
                     }
                     break;
@@ -2891,17 +2891,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 11: op = rv_op_amoswap_d; break;
             case 12: op = rv_op_amoswap_q; break;
             case 18:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_lr_w; break;
                 }
                 break;
             case 19:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_lr_d; break;
                 }
                 break;
             case 20:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_lr_q; break;
                 }
                 break;
@@ -3031,35 +3031,35 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 16:
-            switch (((inst >> 25) & 0b11)) {
+            switch ((inst >> 25) & 0b11) {
             case 0: op = rv_op_fmadd_s; break;
             case 1: op = rv_op_fmadd_d; break;
             case 3: op = rv_op_fmadd_q; break;
             }
             break;
         case 17:
-            switch (((inst >> 25) & 0b11)) {
+            switch ((inst >> 25) & 0b11) {
             case 0: op = rv_op_fmsub_s; break;
             case 1: op = rv_op_fmsub_d; break;
             case 3: op = rv_op_fmsub_q; break;
             }
             break;
         case 18:
-            switch (((inst >> 25) & 0b11)) {
+            switch ((inst >> 25) & 0b11) {
             case 0: op = rv_op_fnmsub_s; break;
             case 1: op = rv_op_fnmsub_d; break;
             case 3: op = rv_op_fnmsub_q; break;
             }
             break;
         case 19:
-            switch (((inst >> 25) & 0b11)) {
+            switch ((inst >> 25) & 0b11) {
             case 0: op = rv_op_fnmadd_s; break;
             case 1: op = rv_op_fnmadd_d; break;
             case 3: op = rv_op_fnmadd_q; break;
             }
             break;
         case 20:
-            switch (((inst >> 25) & 0b1111111)) {
+            switch ((inst >> 25) & 0b1111111) {
             case 0: op = rv_op_fadd_s; break;
             case 1: op = rv_op_fadd_d; break;
             case 3: op = rv_op_fadd_q; break;
@@ -3073,100 +3073,100 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 13: op = rv_op_fdiv_d; break;
             case 15: op = rv_op_fdiv_q; break;
             case 16:
-                switch (((inst >> 12) & 0b111)) {
+                switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fsgnj_s; break;
                 case 1: op = rv_op_fsgnjn_s; break;
                 case 2: op = rv_op_fsgnjx_s; break;
                 }
                 break;
             case 17:
-                switch (((inst >> 12) & 0b111)) {
+                switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fsgnj_d; break;
                 case 1: op = rv_op_fsgnjn_d; break;
                 case 2: op = rv_op_fsgnjx_d; break;
                 }
                 break;
             case 19:
-                switch (((inst >> 12) & 0b111)) {
+                switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fsgnj_q; break;
                 case 1: op = rv_op_fsgnjn_q; break;
                 case 2: op = rv_op_fsgnjx_q; break;
                 }
                 break;
             case 20:
-                switch (((inst >> 12) & 0b111)) {
+                switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fmin_s; break;
                 case 1: op = rv_op_fmax_s; break;
                 }
                 break;
             case 21:
-                switch (((inst >> 12) & 0b111)) {
+                switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fmin_d; break;
                 case 1: op = rv_op_fmax_d; break;
                 }
                 break;
             case 23:
-                switch (((inst >> 12) & 0b111)) {
+                switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fmin_q; break;
                 case 1: op = rv_op_fmax_q; break;
                 }
                 break;
             case 32:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 1: op = rv_op_fcvt_s_d; break;
                 case 3: op = rv_op_fcvt_s_q; break;
                 }
                 break;
             case 33:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_d_s; break;
                 case 3: op = rv_op_fcvt_d_q; break;
                 }
                 break;
             case 35:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_q_s; break;
                 case 1: op = rv_op_fcvt_q_d; break;
                 }
                 break;
             case 44:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fsqrt_s; break;
                 }
                 break;
             case 45:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fsqrt_d; break;
                 }
                 break;
             case 47:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fsqrt_q; break;
                 }
                 break;
             case 80:
-                switch (((inst >> 12) & 0b111)) {
+                switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fle_s; break;
                 case 1: op = rv_op_flt_s; break;
                 case 2: op = rv_op_feq_s; break;
                 }
                 break;
             case 81:
-                switch (((inst >> 12) & 0b111)) {
+                switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fle_d; break;
                 case 1: op = rv_op_flt_d; break;
                 case 2: op = rv_op_feq_d; break;
                 }
                 break;
             case 83:
-                switch (((inst >> 12) & 0b111)) {
+                switch ((inst >> 12) & 0b111) {
                 case 0: op = rv_op_fle_q; break;
                 case 1: op = rv_op_flt_q; break;
                 case 2: op = rv_op_feq_q; break;
                 }
                 break;
             case 96:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_w_s; break;
                 case 1: op = rv_op_fcvt_wu_s; break;
                 case 2: op = rv_op_fcvt_l_s; break;
@@ -3174,7 +3174,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 97:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_w_d; break;
                 case 1: op = rv_op_fcvt_wu_d; break;
                 case 2: op = rv_op_fcvt_l_d; break;
@@ -3182,7 +3182,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 99:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_w_q; break;
                 case 1: op = rv_op_fcvt_wu_q; break;
                 case 2: op = rv_op_fcvt_l_q; break;
@@ -3190,7 +3190,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 104:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_s_w; break;
                 case 1: op = rv_op_fcvt_s_wu; break;
                 case 2: op = rv_op_fcvt_s_l; break;
@@ -3198,7 +3198,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 105:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_d_w; break;
                 case 1: op = rv_op_fcvt_d_wu; break;
                 case 2: op = rv_op_fcvt_d_l; break;
@@ -3206,7 +3206,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 107:
-                switch (((inst >> 20) & 0b11111)) {
+                switch ((inst >> 20) & 0b11111) {
                 case 0: op = rv_op_fcvt_q_w; break;
                 case 1: op = rv_op_fcvt_q_wu; break;
                 case 2: op = rv_op_fcvt_q_l; break;
@@ -3255,9 +3255,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 21:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_vadd_vv; break;
                 case 2: op = rv_op_vsub_vv; break;
                 case 4: op = rv_op_vminu_vv; break;
@@ -3312,7 +3312,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 1:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_vfadd_vv; break;
                 case 1: op = rv_op_vfredusum_vs; break;
                 case 2: op = rv_op_vfsub_vv; break;
@@ -3325,12 +3325,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 9: op = rv_op_vfsgnjn_vv; break;
                 case 10: op = rv_op_vfsgnjx_vv; break;
                 case 16:
-                    switch (((inst >> 15) & 0b11111)) {
+                    switch ((inst >> 15) & 0b11111) {
                     case 0: if ((inst >> 25) & 1) op = rv_op_vfmv_f_s; break;
                     }
                     break;
                 case 18:
-                    switch (((inst >> 15) & 0b11111)) {
+                    switch ((inst >> 15) & 0b11111) {
                     case 0: op = rv_op_vfcvt_xu_f_v; break;
                     case 1: op = rv_op_vfcvt_x_f_v; break;
                     case 2: op = rv_op_vfcvt_f_xu_v; break;
@@ -3355,7 +3355,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     }
                     break;
                 case 19:
-                    switch (((inst >> 15) & 0b11111)) {
+                    switch ((inst >> 15) & 0b11111) {
                     case 0: op = rv_op_vfsqrt_v; break;
                     case 4: op = rv_op_vfrsqrt7_v; break;
                     case 5: op = rv_op_vfrec7_v; break;
@@ -3390,7 +3390,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 2:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_vredsum_vs; break;
                 case 1: op = rv_op_vredand_vs; break;
                 case 2: op = rv_op_vredor_vs; break;
@@ -3404,14 +3404,14 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 10: op = rv_op_vasubu_vv; break;
                 case 11: op = rv_op_vasub_vv; break;
                 case 16:
-                    switch (((inst >> 15) & 0b11111)) {
+                    switch ((inst >> 15) & 0b11111) {
                     case 0: if ((inst >> 25) & 1) op = rv_op_vmv_x_s; break;
                     case 16: op = rv_op_vcpop_m; break;
                     case 17: op = rv_op_vfirst_m; break;
                     }
                     break;
                 case 18:
-                    switch (((inst >> 15) & 0b11111)) {
+                    switch ((inst >> 15) & 0b11111) {
                     case 2: op = rv_op_vzext_vf8; break;
                     case 3: op = rv_op_vsext_vf8; break;
                     case 4: op = rv_op_vzext_vf4; break;
@@ -3421,7 +3421,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     }
                     break;
                 case 20:
-                    switch (((inst >> 15) & 0b11111)) {
+                    switch ((inst >> 15) & 0b11111) {
                     case 1: op = rv_op_vmsbf_m;  break;
                     case 2: op = rv_op_vmsof_m; break;
                     case 3: op = rv_op_vmsif_m; break;
@@ -3471,7 +3471,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 3:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_vadd_vi; break;
                 case 3: op = rv_op_vrsub_vi; break;
                 case 9: op = rv_op_vand_vi; break;
@@ -3502,7 +3502,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 33: op = rv_op_vsadd_vi; break;
                 case 37: op = rv_op_vsll_vi; break;
                 case 39:
-                    switch (((inst >> 15) & 0b11111)) {
+                    switch ((inst >> 15) & 0b11111) {
                     case 0: op = rv_op_vmv1r_v; break;
                     case 1: op = rv_op_vmv2r_v; break;
                     case 3: op = rv_op_vmv4r_v; break;
@@ -3520,7 +3520,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 4:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_vadd_vx; break;
                 case 2: op = rv_op_vsub_vx; break;
                 case 3: op = rv_op_vrsub_vx; break;
@@ -3577,7 +3577,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 5:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_vfadd_vf; break;
                 case 2: op = rv_op_vfsub_vf; break;
                 case 4: op = rv_op_vfmin_vf; break;
@@ -3588,7 +3588,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 14: op = rv_op_vfslide1up_vf; break;
                 case 15: op = rv_op_vfslide1down_vf; break;
                 case 16:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: if ((inst >> 25) & 1) op = rv_op_vfmv_s_f; break;
                     }
                     break;
@@ -3628,7 +3628,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 6:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 8: op = rv_op_vaaddu_vx; break;
                 case 9: op = rv_op_vaadd_vx; break;
                 case 10: op = rv_op_vasubu_vx; break;
@@ -3636,7 +3636,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 14: op = rv_op_vslide1up_vx; break;
                 case 15: op = rv_op_vslide1down_vx; break;
                 case 16:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 0: if ((inst >> 25) & 1) op = rv_op_vmv_s_x; break;
                     }
                     break;
@@ -3681,15 +3681,15 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 22:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_addid; break;
             case 1:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_sllid; break;
                 }
                 break;
             case 5:
-                switch (((inst >> 26) & 0b111111)) {
+                switch ((inst >> 26) & 0b111111) {
                 case 0: op = rv_op_srlid; break;
                 case 16: op = rv_op_sraid; break;
                 }
@@ -3697,7 +3697,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 24:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_beq; break;
             case 1: op = rv_op_bne; break;
             case 4: op = rv_op_blt; break;
@@ -3707,33 +3707,33 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             }
             break;
         case 25:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_jalr; break;
             }
             break;
         case 27: op = rv_op_jal; break;
         case 28:
-            switch (((inst >> 12) & 0b111)) {
+            switch ((inst >> 12) & 0b111) {
             case 0:
                 switch (((inst >> 20) & 0b111111100000) |
                         ((inst >> 7) & 0b000000011111)) {
                 case 0:
-                    switch (((inst >> 15) & 0b1111111111)) {
+                    switch ((inst >> 15) & 0b1111111111) {
                     case 0: op = rv_op_ecall; break;
                     case 32: op = rv_op_ebreak; break;
                     case 64: op = rv_op_uret; break;
                     }
                     break;
                 case 256:
-                    switch (((inst >> 20) & 0b11111)) {
+                    switch ((inst >> 20) & 0b11111) {
                     case 2:
-                        switch (((inst >> 15) & 0b11111)) {
+                        switch ((inst >> 15) & 0b11111) {
                         case 0: op = rv_op_sret; break;
                         }
                         break;
                     case 4: op = rv_op_sfence_vm; break;
                     case 5:
-                        switch (((inst >> 15) & 0b11111)) {
+                        switch ((inst >> 15) & 0b11111) {
                         case 0: op = rv_op_wfi; break;
                         }
                         break;
@@ -3741,17 +3741,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     break;
                 case 288: op = rv_op_sfence_vma; break;
                 case 512:
-                    switch (((inst >> 15) & 0b1111111111)) {
+                    switch ((inst >> 15) & 0b1111111111) {
                     case 64: op = rv_op_hret; break;
                     }
                     break;
                 case 768:
-                    switch (((inst >> 15) & 0b1111111111)) {
+                    switch ((inst >> 15) & 0b1111111111) {
                     case 64: op = rv_op_mret; break;
                     }
                     break;
                 case 1952:
-                    switch (((inst >> 15) & 0b1111111111)) {
+                    switch ((inst >> 15) & 0b1111111111) {
                     case 576: op = rv_op_dret; break;
                     }
                     break;
@@ -4603,7 +4603,8 @@ static size_t inst_length(rv_inst inst)
 {
     /* NOTE: supports maximum instruction size of 64-bits */
 
-    /* instruction length coding
+    /*
+     * instruction length coding
      *
      *      aa - 16 bit aa != 11
      *   bbb11 - 32 bit bbb != 111
-- 
2.25.1



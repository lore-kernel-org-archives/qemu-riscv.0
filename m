Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbiRS-0005x3-Jm
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 06:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbiRQ-0005v5-CR; Thu, 21 May 2020 06:28:44 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:49823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbiRP-0003My-4w; Thu, 21 May 2020 06:28:44 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07625957|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.727025-0.000620295-0.272354;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03268; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HbcuUgB_1590056917; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HbcuUgB_1590056917)
 by smtp.aliyun-inc.com(10.147.41.178);
 Thu, 21 May 2020 18:28:37 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v8 22/62] target/riscv: vector widening integer multiply-add
 instructions
Date: Thu, 21 May 2020 17:43:33 +0800
Message-Id: <20200521094413.10425-23-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 05:19:14
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 May 2020 10:28:44 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 22 ++++++++++++
 target/riscv/insn32.decode              |  7 ++++
 target/riscv/insn_trans/trans_rvv.inc.c |  9 +++++
 target/riscv/vector_helper.c            | 45 +++++++++++++++++++++++++
 4 files changed, 83 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 08c2544b20..1a9495ceac 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -647,3 +647,25 @@ DEF_HELPER_6(vnmsub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnmsub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnmsub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnmsub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vwmaccu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmacc_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccsu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccus_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwmaccus_vx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b49b60aea1..9735ac3565 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -393,6 +393,13 @@ vmadd_vv        101001 . ..... ..... 010 ..... 1010111 @r_vm
 vmadd_vx        101001 . ..... ..... 110 ..... 1010111 @r_vm
 vnmsub_vv       101011 . ..... ..... 010 ..... 1010111 @r_vm
 vnmsub_vx       101011 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccu_vx      111100 . ..... ..... 110 ..... 1010111 @r_vm
+vwmacc_vv       111101 . ..... ..... 010 ..... 1010111 @r_vm
+vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 07e0c212ed..b2f57e2259 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1609,3 +1609,12 @@ GEN_OPIVX_TRANS(vmacc_vx, opivx_check)
 GEN_OPIVX_TRANS(vnmsac_vx, opivx_check)
 GEN_OPIVX_TRANS(vmadd_vx, opivx_check)
 GEN_OPIVX_TRANS(vnmsub_vx, opivx_check)
+
+/* Vector Widening Integer Multiply-Add Instructions */
+GEN_OPIVV_WIDEN_TRANS(vwmaccu_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwmacc_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwmaccsu_vv, opivv_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmaccu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmacc_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8c327cc070..2786fca52a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1978,3 +1978,48 @@ GEN_VEXT_VX(vnmsub_vx_b, 1, 1, clearb)
 GEN_VEXT_VX(vnmsub_vx_h, 2, 2, clearh)
 GEN_VEXT_VX(vnmsub_vx_w, 4, 4, clearl)
 GEN_VEXT_VX(vnmsub_vx_d, 8, 8, clearq)
+
+/* Vector Widening Integer Multiply-Add Instructions */
+RVVCALL(OPIVV3, vwmaccu_vv_b, WOP_UUU_B, H2, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vwmaccu_vv_h, WOP_UUU_H, H4, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vwmaccu_vv_w, WOP_UUU_W, H8, H4, H4, DO_MACC)
+RVVCALL(OPIVV3, vwmacc_vv_b, WOP_SSS_B, H2, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vwmacc_vv_h, WOP_SSS_H, H4, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vwmacc_vv_w, WOP_SSS_W, H8, H4, H4, DO_MACC)
+RVVCALL(OPIVV3, vwmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, DO_MACC)
+RVVCALL(OPIVV3, vwmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, DO_MACC)
+RVVCALL(OPIVV3, vwmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, DO_MACC)
+GEN_VEXT_VV(vwmaccu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwmaccu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwmaccu_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwmacc_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwmacc_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwmacc_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwmaccsu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwmaccsu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwmaccsu_vv_w, 4, 8, clearq)
+
+RVVCALL(OPIVX3, vwmaccu_vx_b, WOP_UUU_B, H2, H1, DO_MACC)
+RVVCALL(OPIVX3, vwmaccu_vx_h, WOP_UUU_H, H4, H2, DO_MACC)
+RVVCALL(OPIVX3, vwmaccu_vx_w, WOP_UUU_W, H8, H4, DO_MACC)
+RVVCALL(OPIVX3, vwmacc_vx_b, WOP_SSS_B, H2, H1, DO_MACC)
+RVVCALL(OPIVX3, vwmacc_vx_h, WOP_SSS_H, H4, H2, DO_MACC)
+RVVCALL(OPIVX3, vwmacc_vx_w, WOP_SSS_W, H8, H4, DO_MACC)
+RVVCALL(OPIVX3, vwmaccsu_vx_b, WOP_SSU_B, H2, H1, DO_MACC)
+RVVCALL(OPIVX3, vwmaccsu_vx_h, WOP_SSU_H, H4, H2, DO_MACC)
+RVVCALL(OPIVX3, vwmaccsu_vx_w, WOP_SSU_W, H8, H4, DO_MACC)
+RVVCALL(OPIVX3, vwmaccus_vx_b, WOP_SUS_B, H2, H1, DO_MACC)
+RVVCALL(OPIVX3, vwmaccus_vx_h, WOP_SUS_H, H4, H2, DO_MACC)
+RVVCALL(OPIVX3, vwmaccus_vx_w, WOP_SUS_W, H8, H4, DO_MACC)
+GEN_VEXT_VX(vwmaccu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmaccu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmaccu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmacc_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmacc_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmacc_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmaccsu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmaccsu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmaccsu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmaccus_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwmaccus_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwmaccus_vx_w, 4, 8, clearq)
-- 
2.23.0



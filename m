Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24021C624CE
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 14:10:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x12iX-0003lp-5G; Mon, 31 Aug 2026 10:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x12iV-0003bY-14
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 10:10:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x12iR-0006em-Dx
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 10:10:30 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67VBASSY3255800
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 14:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=SSO/yeK3USA
 9FkI9TiWXCH2ECWBVT6V9x+RQhqdHd8M=; b=FBIsgo0YEjQ2LQLKEvhiT+J5MUp
 vmOunmSJxY4FVfThWf6iJNZKLsVfu/I2d0Bba250WBBTl4nWChR2OaWzosq+0CWH
 194Y6Wx3AYnf0rKdPaOXgv6eKbYZKACb/RrrGSh4O2wz25rNEgWRF+uv8vHfE9pp
 UoqRD2y87uElz7j1RVw0tIoEGJ102/1Gs/nQHXdzXMGW0mEo+sdZoy9F0LMD9qbT
 1RVYUm8wpD9LJPm5UlkSKUrXCv4/2jJHGe/Sa9wnCwgWqEeZ6WX4UkCl/w83gD0Z
 eUrLMXgOfUFpFV/W0l7J2NiyWxZ+4QhqUJr4Amq1srVf145du5xg2ghlA1g==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yas59p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 14:10:25 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-6b34e5453cbso1692389eaf.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788185425; x=1788790225; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SSO/yeK3USA9FkI9TiWXCH2ECWBVT6V9x+RQhqdHd8M=;
 b=D1Em6yfiT291TiOrxUrgFiuXq007QGopqHl6vFLBYBXX8Y5FrntdxgCF35tnu7OrI1
 QrDi7aEV9obxZ75unyTYGnG+8tLBGLBQxRLZrMdEr5BBriJgssECgecN8wTzn/LYkO5N
 0kL0qgdJ7f5NHom3a2PmebfaZqX8lrHIeMo0LoPyJFxWvOYd0SvXdWJUgx/l1ahI1Tn0
 bsfOH/BqfIiP3TH1ogQvH5LCnOGRnZApCLVJZLe0M+JabcUVysLOTT4WwUpZmOTUUN++
 t9g2Bei2qto3536ulvlypBRE0ktj/Ak2xxQlhw/JoCsKa6KVba5/+9oxX7S8REyTAW1q
 ew1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788185425; x=1788790225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SSO/yeK3USA9FkI9TiWXCH2ECWBVT6V9x+RQhqdHd8M=;
 b=NCht3lpye5/v7uvwzuf41IXNTyP96Rf6esQ0dS0p0YL3jE2W0ctYm14oVDHhwuA53c
 rp9GUIP1S8iQb22PojFeutUCH6gwcckQUfjeomHFiZb5qo1EruIjkMniUPUsOBWS/Api
 Y30omtbf2upItxo08ddJJTm4KVWsXRx4IMfMDYBqGpUmHX4gAC6mEI6IBmZaV5UdkEBW
 4+LUHP/oeXeaDsyYz1NK3Ia4HEswj4Mrf74RDUhM/wmHt1/zYYO5oQs9IyTN7n6LMgzx
 xESqpnY6TBKNr3SYB0pGHV+X1oFywwLTqtZSTcJUF0Nm2QPZ6FJCgiSMdPFmOuR679Fj
 l+Zg==
X-Gm-Message-State: AFuF++lleS7EBGaiOp/Vt5g2+4Mbc+Nb63R+1yoxayIrzFHs1G6ZJq3f
 U0iBUA1zVj9mEuDQvm7epCFrUvY7kvSjqJPBZtAwqRKfVf1kEceykTHpTM7x3Pzgl8OKFoekUON
 lASt0emsavXJcFGXLFUmNkfcCjFOeNnR+W5GTqHAMs/jDF/E/+/q0ChADgQ==
X-Gm-Gg: AR+sD1150kMSf3pJ/16Afy8UcZdSob69Jzw7frMWLxidDFU1VAQiqa9Czf+WPU5oC8c
 rc774+JPR6FrtYTvMx4830TtJtsHP35Uw6uIE1jHNJvf6+USLdUnXjemwEx4OIJEUyqm2HgMfCN
 EpglSz08P9Brw9yNN7EVCClCZVAjB6l+F85uwuhSTbJpssltgqDNNmGQdxpzp4hKtjTURKVTwoB
 xNCnlh1CUGLIEXyS5Dl4Jw2Vxq4RmXqPh3oLDTaoU82Al6QeomRzd+Rrh7XouX8li3+nd4R+TRO
 92xEKt5ZV4RoCFkOpFnu4RL3lxM7ZTbYlfXqoJm4z2WufxEL8JmZZIv3pN7qWmKmOMdldOt/9X8
 wEOcNqaImkCbBV1yIFGN9j1oG7U+sOkxGqiP1jA==
X-Received: by 2002:a05:6820:1c8c:b0:6b3:5475:5a47 with SMTP id
 006d021491bc7-6b35475f876mr8205783eaf.32.1788185424999; 
 Mon, 31 Aug 2026 07:10:24 -0700 (PDT)
X-Received: by 2002:a05:6820:1c8c:b0:6b3:5475:5a47 with SMTP id
 006d021491bc7-6b35475f876mr8205710eaf.32.1788185424261; 
 Mon, 31 Aug 2026 07:10:24 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-468a3535e25sm9886129fac.5.2026.08.31.07.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 07:10:23 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v7 4/7] target/riscv: add sdext enter Debug Mode on ebreak
Date: Mon, 31 Aug 2026 11:10:03 -0300
Message-ID: <20260831141007.353854-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831141007.353854-1-daniel.barboza@oss.qualcomm.com>
References: <20260831141007.353854-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX4lPHZ7J7z4fO
 fTcw4wiRkIuvBy/keZQAVmlwyvEo+9ZhGTH3EqhAKV3d+VydUN3QlpVxghdUkcU1amSOEHs8Nw9
 Y7+uRX4qe386S3lUanjQcqAkrFRO2I0=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a958b51 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=xvfqbYfxAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fgrLqfBXAAAA:8 a=ITXOtABjXhpKHoTPUzwA:9
 a=k4UEASGLJojhI9HsvVT1:22 a=_Ge82aPy-h_wFa7gWU4u:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX0KTcbpSB0i/P
 nsnl41QCmp48GzDdy1nBUlQsYEtbAGfD1StLJ9o498YUEREAzVH9aVfdUH8ZEOEziKJCF5YQp1X
 m4gcLBIHrKZYGPzpXEoOEZBDhi9x4RJcqHaf3C6B+y6QM7S4oxBSB5qj83oL9QUKOMHlBrqnA8y
 g+RIoPzMyZWVEVjjmpTXz/1X091VfqhC8/jOnLj9ZqwpU8aCmR1YnPDChO9t3nI2WmAtJmIi3zz
 DIMADRCD9gl2+6Ma3SzD//jeNnpXr/3cNYtwDn+Ic1xQ6+owFvrKFNDV1kMo6IEBc/zJ7MAs6yY
 y8NemrSJGaid+m8cDC+oK4uxQaNE3C+bTyMZiTxKS6J4szgXl9TzQh0zxs7z1GsN+ERX/1tS0uP
 NWr1zapAjQFRs2Bw1TaGJWJX2oOnUj4C8LwRapZm3WYQEcFJTOJGlMow6fQ93BIMmgSvBlGjpna
 Rk/lViswJDEJURQbglA==
X-Proofpoint-ORIG-GUID: msMVobeQlAcQ_rSDWipxgUc-tqO4Ns6d
X-Proofpoint-GUID: msMVobeQlAcQ_rSDWipxgUc-tqO4Ns6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310122
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Chao Liu <chao.liu.zevorn@gmail.com>

RISC-V Debug Specification:
https://github.com/riscv/riscv-debug-spec/releases/tag/1.0

Route EBREAK via helper_sdext_ebreak. If Sdext is enabled and the
matching dcsr.ebreak* bit is set, enter Debug Mode with cause=ebreak
and stop with EXCP_DEBUG. Otherwise keep the normal breakpoint trap.

Signed-off-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Tested-by: Tao Tang <tangtao1634@phytium.com.cn>
---
 target/riscv/helper.h                         |  1 +
 .../tcg/insn_trans/trans_privileged.c.inc     |  6 ++++
 target/riscv/tcg/op_helper.c                  | 34 +++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b4c47d0738..0d9ae15e3e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -142,6 +142,7 @@ DEF_HELPER_1(tlb_flush_all, void, env)
 DEF_HELPER_4(ctr_add_entry, void, env, tl, tl, tl)
 /* Native Debug */
 DEF_HELPER_1(itrigger_match, void, env)
+DEF_HELPER_2(sdext_ebreak, void, env, tl)
 #endif
 
 /* Hypervisor functions */
diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
index 4e57901880..42bf2ffb53 100644
--- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
@@ -68,9 +68,15 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
     if (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
         generate_exception(ctx, RISCV_EXCP_SEMIHOST);
     } else {
+#ifndef CONFIG_USER_ONLY
+        gen_update_pc(ctx, 0);
+        gen_helper_sdext_ebreak(tcg_env, tcg_constant_tl(ebreak_addr));
+        ctx->base.is_jmp = DISAS_NORETURN;
+#else
         tcg_gen_st_i64(tcg_constant_i64(ebreak_addr), tcg_env,
                       offsetof(CPURISCVState, badaddr));
         generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+#endif
     }
     return true;
 }
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index 54269efee1..5db4f6aacd 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -489,6 +489,40 @@ target_ulong helper_dret(CPURISCVState *env)
 #endif
 }
 
+void helper_sdext_ebreak(CPURISCVState *env, target_ulong pc)
+{
+    CPUState *cs = env_cpu(env);
+    bool enter_debug = false;
+
+    if (riscv_cpu_cfg(env)->ext_sdext && !env->debug_mode) {
+        if (env->virt_enabled) {
+            if (env->priv == PRV_S) {
+                enter_debug = env->dcsr & DCSR_EBREAKVS;
+            } else if (env->priv == PRV_U) {
+                enter_debug = env->dcsr & DCSR_EBREAKVU;
+            }
+        } else {
+            if (env->priv == PRV_M) {
+                enter_debug = env->dcsr & DCSR_EBREAKM;
+            } else if (env->priv == PRV_S) {
+                enter_debug = env->dcsr & DCSR_EBREAKS;
+            } else if (env->priv == PRV_U) {
+                enter_debug = env->dcsr & DCSR_EBREAKU;
+            }
+        }
+    }
+
+    env->badaddr = pc;
+
+    if (enter_debug) {
+        riscv_cpu_enter_debug_mode(env, pc, DCSR_CAUSE_EBREAK);
+        cs->exception_index = EXCP_DEBUG;
+        cpu_loop_exit_restore(cs, GETPC());
+    }
+
+    riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, GETPC());
+}
+
 target_ulong helper_mnret(CPURISCVState *env)
 {
     target_ulong retpc = env->mnepc;
-- 
2.43.0



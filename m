Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE83C79FB7
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:49:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4Jbk-0002hd-GG; Wed, 09 Sep 2026 10:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbi-0002gl-Gg
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbf-000790-MA
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:02 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689CAUIa1233142
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 14:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=rQRIvS4B5Ef
 nTVfHSEcinZ01H6Ql1EnlvJudtDsuPNE=; b=X6azPIPAm9fJ7/BxfAuQ4+rirSr
 6THtdqlEezMZmrjgyhgPDCRvTT4EM/XJzYRuMhvZ09KoFXgwWt5LZTPckawesTc3
 0UW4e2tsmhPo+FwV5Msn+xwZd04S3o/hOdl7A+eig4tfdpKTrvX+SLz5i5JavHKy
 /ZuEiESW1q4Lv5K3H9ZOKcpAdk3nAB+wqAlDweMOi4993jeBiGX+uPZPmkOonrRg
 6XMzSbXlEAVoo8Ch+gaXyKbkY2v6Ks6sAtTZVkLSBtOkB30wwfXTDpXqXG2gIuOR
 tlOsUvgjf8JTjVN83msY/HXIWmlMydfRxWO0TeBRj4QmWd2qAdhEH02mF7Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vgppv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:48:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-9105cf082f7so52971856d6.2
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788965337; x=1789570137; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rQRIvS4B5EfnTVfHSEcinZ01H6Ql1EnlvJudtDsuPNE=;
 b=TAjCrlT/dDvhcNb67T/PIRwmtUICIjPTXf+du3qQnr77Gk8pRoaHxyfAXU7+wTEjH0
 aNKcaTn5OEI+ufgeJ9qiikyori4ZJRgJO0c4kR9e/GgWeQ9UOq4/HHqOw5icUGF2hivd
 2CYtGlkKsigmhfo7p+uIbPYJ7WZBwWnc09m+ej2PIR+ckZw/VWk015xTSbsQoL6c6xX7
 kXa6oU7ykX+nJwyj3oov2sbfp4KpW0myFdiSbvh5AL9pi7ywWVS3cfw5ecaF1p9gLFE+
 4U/X9NNlqIu5HH0OFu/gIR2XI7fjKcudVZATUTRrM8EklHFPUaki/LhqraD8Tuq2HSC0
 ciHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788965337; x=1789570137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rQRIvS4B5EfnTVfHSEcinZ01H6Ql1EnlvJudtDsuPNE=;
 b=lwB8yASUYuDnod78yeC0Fy2QgNGnFt8A2wSIjVw8iu4YQnW2RaTLYk3uyuI14dht+7
 BS1anZXN76ctIg1y0U8QxJBb3mvHVAsFRNBZly6y65sNnOYyFvP0iKfR0UMUUAC/o/Rz
 SryH/C5ueB6T0mRrJG4d6oDYMsmgGtFokR1F2dFdNwu1M6hH6DrxoaVCYsVAOEmzdyZ3
 76Qh7mM9ycjT9i0zoeiv8wJ5EanufOSZtLuc5UZ8LjJye+XmnwtXAYnkw8vwmsnHOwAI
 JFB+qHIxIZThBCoZW+3wTyXM9GUHb/5CBD68JzCDcsKu8nvaTyebL+si0KxMS4OoSVI1
 WpLg==
X-Gm-Message-State: AFuF++kC0XErOA49ePXA/SSYooP2ti4R6V8HgBz7U/f4ugmIUGQMm6X9
 a6qgzq7+IvjCh5Xb6MRDS270W4w/Cy113CCPaMesXn8KXruPD9s5saKOFp9b5OjAnJWEcywusQI
 xCUbMpL74CiE4NIVBXBYEBARaIOs1+eYxXr4h6DruOq+KKeqOyzLBaGqqRw==
X-Gm-Gg: AYBFou0xgsfVDG30gXXVxAi9XahnNStGNh1vOkYSDxGNM7Ri0lZATBYr9XYsYBvEh1c
 F5Inc0g9bUJSGx2yEaQ4W8YR/ZrzTrdwpzUNoRKbzRZla9Vn/SftbEnsxG/I65/vpAfMKwrt8QJ
 p9dXehdhPvpQcf/hKlVrxqtqWLRcUZGDEvtUlzsGqhCxC1tVJc7JTGlHa5acKu0/G7tEtIveXEy
 W1JXbsbNiRiZJ2BQouTW1m1CQsEsU9gJ/cYKIN+jXFNwgWeUIM6VGkzly4HaOi1jEnM2KuEbGM1
 u8Ri7m4fYuncMcy7ozmgi8ILquspzRP3YOOX02zovTx47E8P0N5urVbIhAcnXbkjwTKHvyRugBo
 MytkTXvwnolYhyCQjbI9DxVJxQubroerd99YJ
X-Received: by 2002:a05:6214:f24:b0:90e:9a7c:e5a0 with SMTP id
 6a1803df08f44-910d0f46e0cmr16783986d6.17.1788965334888; 
 Wed, 09 Sep 2026 07:48:54 -0700 (PDT)
X-Received: by 2002:a05:6214:f24:b0:90e:9a7c:e5a0 with SMTP id
 6a1803df08f44-910d0f46e0cmr16783536d6.17.1788965334417; 
 Wed, 09 Sep 2026 07:48:54 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910464bf898sm125678886d6.7.2026.09.09.07.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 07:48:53 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v9 3/7] target/riscv: add dret instruction
Date: Wed,  9 Sep 2026 11:48:36 -0300
Message-ID: <20260909144841.1766921-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
References: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa171da cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=xvfqbYfxAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fgrLqfBXAAAA:8 a=2wZ2TuoAFSEcmpuqsd8A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=_Ge82aPy-h_wFa7gWU4u:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: M3WucGup2-ofY-KxaJWFcLtEhDd3mk-F
X-Proofpoint-GUID: M3WucGup2-ofY-KxaJWFcLtEhDd3mk-F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXwKMJb4RBAxfq
 FoOIIxBTxk5W+4gjJvNsMw8zkwwXvn9y4h4wJCBMCMAVvLtySKV6QOunLpNlUrx8uR94QiLBwoC
 0CbwMbxNBuDxzZF4icurYcs32nNue5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX4lnBQzWBb4og
 qb+uO93+kTENaHf4mN3hVkria45MY66k9yJ6RhXD7mmIbtzkf5L/6N88aqk1rZu96E+0quDxj4q
 gLKCYuyVoI1Pd9fZp2BxRcT341GDOYF6l0QKGdoFwYPSDAWd2bULhedB1mFr02mlikDURFdryNW
 O237aMAIZrUXdMunvP7VszHOyH1WFaRyEyClU1KFPtWKvFOyk9ajI8ThEQvfk+cEGAhLesZgbOg
 MLcFv12jTj8Dyw4qzw8hzVaT5/jREgxMvk4QbIu0gAGEnA5ZuRAbU/FsGWPHZnlbKyx6zmLpxDv
 T1Nmjs3DulhuizWWn3gjMOCDHmnTyDVw6Hcnu5TWX1uGohoN79yGmFJ3JpGMVNg9Cv9MIuvvFsC
 lhTcA2Vn03++tcsJguX/AOXZO6+IZHPDy+IEFZFXC3MAT++C73kh7kHP5AKAl11tagYWvM3pogI
 I+3dP/NLPlJsJLcsmwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add DRET decode/translate and a helper to leave Debug Mode and return
to dpc. Executing DRET outside Debug Mode raises illegal instruction.

Signed-off-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Tested-by: Tao Tang <tangtao1634@phytium.com.cn>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/helper.h                          |  1 +
 target/riscv/insn32.decode                     |  1 +
 .../tcg/insn_trans/trans_privileged.c.inc      | 18 ++++++++++++++++++
 target/riscv/tcg/op_helper.c                   | 16 ++++++++++++++++
 4 files changed, 36 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 4fc2d3a155..b4c47d0738 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -132,6 +132,7 @@ DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(sret, tl, env)
 DEF_HELPER_1(mret, tl, env)
+DEF_HELPER_1(dret, tl, env)
 DEF_HELPER_1(mnret, tl, env)
 DEF_HELPER_1(ctr_clear, void, env)
 DEF_HELPER_1(wfi, void, env)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index aa02dae3c9..46b00411ff 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -118,6 +118,7 @@ sctrclr     000100000100     00000 000 00000 1110011
 uret        0000000    00010 00000 000 00000 1110011
 sret        0001000    00010 00000 000 00000 1110011
 mret        0011000    00010 00000 000 00000 1110011
+dret        0111101    10010 00000 000 00000 1110011
 wfi         0001000    00101 00000 000 00000 1110011
 sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
 
diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
index a8eaccef67..4e57901880 100644
--- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
@@ -125,6 +125,24 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #endif
 }
 
+static bool trans_dret(DisasContext *ctx, arg_dret *a)
+{
+#ifndef CONFIG_USER_ONLY
+    if (!ctx->cfg_ptr->ext_sdext) {
+        return false;
+    }
+    decode_save_opc(ctx, 0);
+    translator_io_start(&ctx->base);
+    gen_update_pc(ctx, 0);
+    gen_helper_dret(cpu_pc, tcg_env);
+    exit_tb(ctx); /* no chaining */
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+#else
+    return false;
+#endif
+}
+
 static bool trans_mnret(DisasContext *ctx, arg_mnret *a)
 {
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index 3e94005d2b..54269efee1 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -473,6 +473,22 @@ target_ulong helper_mret(CPURISCVState *env)
     return retpc;
 }
 
+target_ulong helper_dret(CPURISCVState *env)
+{
+    uintptr_t ra = GETPC();
+#ifdef CONFIG_USER_ONLY
+    riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
+    return 0;
+#else
+    if (!riscv_cpu_cfg(env)->ext_sdext || !env->debug_mode) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
+    }
+    target_ulong retpc = env->dpc & get_xepc_mask(env);
+    riscv_cpu_leave_debug_mode(env);
+    return retpc;
+#endif
+}
+
 target_ulong helper_mnret(CPURISCVState *env)
 {
     target_ulong retpc = env->mnepc;
-- 
2.43.0



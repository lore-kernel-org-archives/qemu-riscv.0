Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E651C79FBB
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:50:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4Jbn-0002ic-1z; Wed, 09 Sep 2026 10:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbi-0002gm-In
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbg-00079I-9R
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:02 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689BUQvj2376525
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 14:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mSiaHjamEiK
 gBhiTky4VCSqYrt7tGD65LQ7WnvRfMqE=; b=ojDHVwFRLF0qhGoDIqiteDJPNbS
 MrYFXDcaDyVpXwAuUebM3qsqZIqjTqR5PnyP0fiDQqgixGbctdA0oWF6yHEffdUE
 8NPiDQoiIGWfaRv2UhlUg2B5TvNgmiEfg9W9znrShvR72Ml8o0fgB1NRXv6V04xm
 897aV+pXcxcb/rY/sJxKTImRfZjxE9bTlGnTtF5vqJRWeH11C5YY/PL+tOX6ucIg
 5IQWkzLfMAPhUlpfmV3surU1EIjcDBU8rtTeFRqQx14lVXVUCP2IV0TTpAPHIVuq
 StHdiVbldFRtcIWADNqGbIxA/IFoyeCOr9ct5PqvsxILhz5e+p6fY7dnI2Q==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru11rn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:48:59 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-66c70d0dd81so4943773d50.0
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 07:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788965339; x=1789570139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mSiaHjamEiKgBhiTky4VCSqYrt7tGD65LQ7WnvRfMqE=;
 b=MWMe8DG0Zh/69ySN01r07EoRlXJpqvZ6xOX/yzykGLqvbe4UE36w8E/IVtj5IMw82S
 NsbRN2AA1CDY+EFQFO55GxV7PJwTfrehXpa3agXLwBiHd/Cc9Hgpsb1GEi/yd2v31p1W
 EykXaD5C3n49VpmbXtV7kx7Nt3wRRNlLu+B7KD8KzDik6+W8aExemTUfDyugKqkuq7qP
 q7bFZmUdLT2EfnYm+D3PQwSF7JJ/ouEQSjO0Q+eprb7WAQC5Tzg5VoL4QiaF15Hffq03
 DY1GvBNgv/4VEoU2tz7BPjegwaY9cEq7tHn7YlJtcKZXoiiXSWJf77uCgvgMIEhvCdvN
 mJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788965339; x=1789570139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mSiaHjamEiKgBhiTky4VCSqYrt7tGD65LQ7WnvRfMqE=;
 b=MfJZwN8Np1uW9S2YXMNlvci0OjIjgOaergYDnNquraJOPC0Hf5Q0Zdjty9IgWrmjzD
 uLHJ4ItiUXZ1sfLVgCLmJRbTy2/5I6jQmCtCWqdC7tgTYx6Od4dGtq3zz3fBHiuq35Yh
 9V/rPPsnBG7PLo9n0yzEQiEb8yPGthQBTlzNXlJn/0uROSyhCZUh/SFYHRwzmPN7pEie
 0H1hU9ix6XGXORJ/bbtiE5rk1zd1arZwpMOwwcbWzCEMLx74JzwHjzn5f9lfmaV+jC81
 k7nlxGhLo961OiTbheV5dcn8Pb5HnN0zicjZJVsCo7zXvJ9E/Xp40+6MDMWe4g3ZkSyD
 Cl0Q==
X-Gm-Message-State: AFuF++nyPQ8mBWPeR3bGWp7dH/t/mHXtjM/nFysARKtFZkGzL/+gwfyY
 1lgQsR7Vkf8WIWiKvqInv9B5OBJdYnTsqZlbUXomcnwrhLntSPTw/6eR4DU7VPG84aIYZGh/Sr+
 gI10mRhFHOsjGMQLtb/30KITScSgDOsU+3byzXYPBshlP0ZGqWywRBtYoNr+qiqDfdQ==
X-Gm-Gg: AYBFou3Vs0QbeGA03edByBy1lF204/f62rWij9z+q6hNgobBef2PFx6kEX4+sMvqlqM
 7v0QenF1iMB4A0YZd2MBF/qU/TuCZB0VBqSPnr6+T9wTUGFz8gQFUiikwgVMG8nAYUwkA644oNe
 Vle8pvQqujwIh9/6foCkXn5v44aMhpkWJclOwwpd4iPzTaVoMC9kBICvpIinZkEnCZBva+8fj82
 GyGcwy8BISsTAvXQE+Bext7ZP5AWIQ7racwsNJWZKYOZDJgYZRCx1giIintOmt6CSt7kYfN59On
 ecOun5tCUHGOe8Wx1m11IxiuqgtcteZKAC6gAaONCQ24rTvPBcKCPrR/THSY2QEtQVKc6W5e5mU
 OwKNeR+YCVJHaNelTUZF954R4aIk+DWEuNVsZ
X-Received: by 2002:a05:690e:11cc:b0:670:fce2:60b7 with SMTP id
 956f58d0204a3-670fce26dd9mr3798613d50.84.1788965338616; 
 Wed, 09 Sep 2026 07:48:58 -0700 (PDT)
X-Received: by 2002:a05:690e:11cc:b0:670:fce2:60b7 with SMTP id
 956f58d0204a3-670fce26dd9mr3798568d50.84.1788965338053; 
 Wed, 09 Sep 2026 07:48:58 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910464bf898sm125678886d6.7.2026.09.09.07.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 07:48:57 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v9 4/7] target/riscv: add sdext enter Debug Mode on ebreak
Date: Wed,  9 Sep 2026 11:48:37 -0300
Message-ID: <20260909144841.1766921-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
References: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa171db cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=xvfqbYfxAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fgrLqfBXAAAA:8 a=ITXOtABjXhpKHoTPUzwA:9
 a=uujmmnXaIg8lM0-o0HFK:22 a=_Ge82aPy-h_wFa7gWU4u:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: VrlqzMtJIou_dNvrUl_ioDgW_reHDdE4
X-Proofpoint-ORIG-GUID: VrlqzMtJIou_dNvrUl_ioDgW_reHDdE4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX87ipJqD4GmdT
 OSh1O3rSPVFcwzD5jDNWsnwjpzrzG4C6lBsSZXj5TMs1rH4UzVrbNasf+E90xFIWAiSEDI0NG4x
 S0GZYV0uyen4Q4/xVezxylcXUYJwNX8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX6NkJ+Znl4qZh
 M8rLOwGnSGuuyLcVRBqQ7us6i0/SYur5N/AFzCPrzQFudUdYlO7hPeBHMfrWSBvlmWCTsqhOsGE
 kW2Hal3wpQ6a+cyRow0EWQl9edpTShYIDoSODcqH35hEdQXe8LMSxgAZL/4ZziChvNjcIOndfOk
 wVlCfnEjXmIteKearjxOK7Fxx7qLPBNLrvEPaakomEDmZ4tvyl7+DfeQewGmtVt+G6+5Q7ss7fN
 4NT3qWCAjfejRNNuMnCEOu27ESfp6f1cBRJuRlF1ZW8g+xU8rGRhD+vefk+s03U8zLpjh/Qb9Zx
 49ls050vcBEoZ+zKqRqNSI4Wa+ss0IJIYVEq8xjEvzFZwJiS74acsF4iwaaFU2lgWeyiaolnhML
 EuZ1jIGo6jdjzPtgxwv1MQM9kx/7zdVfqD8bye1P/RnVHBYMqiQEAc31+GC+GTH0DZp3P7E6xHx
 ZAW/lf3BYSklxQdykgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090165
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Route EBREAK via helper_sdext_ebreak. If Sdext is enabled and the
matching dcsr.ebreak* bit is set, enter Debug Mode with cause=ebreak
and stop with EXCP_DEBUG. Otherwise keep the normal breakpoint trap.

Signed-off-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Tested-by: Tao Tang <tangtao1634@phytium.com.cn>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
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



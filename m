Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2541C79FB6
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:50:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4Jby-0002ky-8F; Wed, 09 Sep 2026 10:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbt-0002kd-1N
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbp-0007B6-8f
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:12 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689CChsu1400887
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 14:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=agsb+31+gBT
 rXzGhEiv94ST7wrQa2woGkjbFulwC/V4=; b=UQ4rCdHVP1dsw4FSOIUCIIH2drO
 qI8DfJk+PXnp0/MSvIbIGUCfbmQ57a+SQTPDPUSu4WkEE7p1BSSeUzvUU28MB3gc
 zXvpn4JfnwPqeXAHwNj/Vk4OyT4DnYN0rZwrscTRgRrxUAjGYqRQfBMfsQBBef/C
 JAkVn6RSaSF5yylQBOhJ9ouIYrnC0M0yl75EgDsBkKDHsSiacb8oTyeJerA6eSDf
 agBAeR6Ex8QAoDPVTbist3zOvBdR+8OPmHPauXOY8+LUX0Th7QgAiQq4+wY0T2k1
 mcyFW3qB25+UYTrIPQsd2CU4eMuZD6/jOwjc+Bma/jp47gfK/kBwiUmdJEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x0psf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:49:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-90cc0ed09b5so83302136d6.0
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 07:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788965345; x=1789570145; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=agsb+31+gBTrXzGhEiv94ST7wrQa2woGkjbFulwC/V4=;
 b=VMSRcRA+iDnP1vCn5w9fASF3j/C3vBiLD27w47mKGIn7wNhtbYNWdoB2QOkRkcVKyi
 jk5TMq88Ke4cCNbKxiTkHZx1qwvumi/ugIWH293jGv1aGumwWziE6xaE6msVmgx8Lzm0
 5qxWMChFAx6WuQjbO/HDJbUTdemxmRhQr+Op2fHxfOHu+J0TL68ymJp8vucKMJsTvOxP
 DZc8IvwCcRrSED3kkERm/OQ20dD8CgS4RaVUUmR/s+rrYvlHAu/z4Dr1skH4cbaNUTzj
 qZd2RhfVac1janHJpN75ANNDK94WoxsO+i4CR9DBR+JKEmPw8OkwHuet2fIs8hBQOgu7
 bvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788965345; x=1789570145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=agsb+31+gBTrXzGhEiv94ST7wrQa2woGkjbFulwC/V4=;
 b=Y0Z+2BrqjcXfPpewh+HXajm+SigA2c0PeuVQSIrSbhKgaR7MygwUpVg2N9zSoP1Ko7
 B8nPpcsdhfdijdpF+YM5yfM6uTC+WANv84CFTwojDAbOCBramzZHSK2Gd3hmQhAHNBsQ
 dyqksVDIraK/qrwNr7C97T0CpOC/zYeGrrZbTq3yyVO/Kb0gAqwXMv8Pbuz8KQaa8byJ
 ImeXF+HSJPxVUZpAUpVaBJsD02/rVOQFuJfeOuxc1NOGX3gaR4Pq65coprlkRdvEBaF6
 dnL2QAjX+eAww/y4arDaeD8DASVvrlzg900hOa2/OCkw2/74c0guWc0ngMokq5K9DnzT
 0q2g==
X-Gm-Message-State: AFuF++ll2w4W+HMeN/VRHBKWBIY1c26tIlP1EsxxuhpKG2WFv9MoPqzC
 KjYcC15oeSVp63s7jgE6SJewNIk3f1ienrh4jC+Evie5P5JHcidUiG9wmbM/ZafTKybtkEYTDIo
 /0DoA4XrjIJs+pottdO3kf6xegJWNHGFbBmuXgUsEZxbtKty5u9GKC7olYXzJ6l50Pw==
X-Gm-Gg: AYBFou0IkGrRrE3GgHNhH+IW9hRo6EqZ+YAoca1dVJInGpGKSpxwmr/8xpmHcMnMo3R
 pH7GyvMblJ+KBwIHXyowT+7QjejCKa3mLGPCNVyY/TrOJnQgyQqfhwhJtjIOBg202Y573Hs9wPB
 AJEdIwchvFh/XnfzYwqMYlAF6uQSrZGe7gj3eY8+wEqDYMGb5u5vxEVsEwJ1jd874L8oGC5zbRd
 +HxhJ58YCR1PytD/1+YgMa9Aaryr/HzgShmZnPbUo0Degngj7H9/DX54ApQ79jM+OHe8NKVcSXK
 PCrZEyNJmP8C9+Zuu5cBFQxmTxs5eRi8rNnTaQBIVayy826iSkVRzIKsanHGSRqE74BsdZG3h2w
 HH3+YzklJMG5ey9gI7+XQFmTPvtb5Xit8vN5g
X-Received: by 2002:a05:6214:2b92:b0:90c:c6fd:e8fe with SMTP id
 6a1803df08f44-910d106b56emr26582126d6.30.1788965345039; 
 Wed, 09 Sep 2026 07:49:05 -0700 (PDT)
X-Received: by 2002:a05:6214:2b92:b0:90c:c6fd:e8fe with SMTP id
 6a1803df08f44-910d106b56emr26581006d6.30.1788965344415; 
 Wed, 09 Sep 2026 07:49:04 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910464bf898sm125678886d6.7.2026.09.09.07.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 07:49:03 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v9 6/7] target/riscv: add sdtrig trigger action=debug mode
Date: Wed,  9 Sep 2026 11:48:39 -0300
Message-ID: <20260909144841.1766921-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
References: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rKWisOBUjNsh7cssGSz8nt6cf-40Fnfn
X-Proofpoint-GUID: rKWisOBUjNsh7cssGSz8nt6cf-40Fnfn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX+L2ZnzZgbTHm
 XSQ4VwjZdy4JeGEaSYQnrftEollOdXtTThgDZWvvwgckpVFFaPpuH0w023ZZPdyFZXLPid/wfCR
 oWte2dl+P7wgb4SGwXJMkEBp3Ls7Qc0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXx7Bk46Jk6KxF
 gcVTA3ZHFyb7yPCFMDvc7s3bm0yWETsSFTOewOoC6TOnV3aj4p9GMNaDxlyoTYmRYBovvajvjyW
 p12JohVYtp8wSUNWHYNQF83wBczmFOdQsb79jp4UO3NhA2/x3DYlDEfQ57rHuxe+J+FHbDBGXmO
 am+LY0U/0wsrD6Kj0ALbhnssrN6wSJ/8YNd6sq8JLLXiBXNRdPTQInLTr6HUhLJyc3S4Ec2dABL
 njlkJjm/hPXX61BLC5E4gXuVrlGpGsVWTS4JHx6E7bAuiBmHhakOF5M2LLh2FEdjYDdaIc0Oyio
 xXSVhh/pwjsY8Zog0PIhY64PApxm8ICw6lUzF+OvSfv1ZXuh4ehQ8F7N//FVUGDY6NvU4TVjvPh
 CvZbw37hMQPH9EPVSTrI/gg9JHtJ63P8my8nRagqyG65ixDrKeaFbTYQWSp+l+gq3Buh+JdiHOM
 1cap1SaWAeCAZjGK5xg==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa171e2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=xvfqbYfxAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fgrLqfBXAAAA:8 a=jq8im54kr7_wP6Zmv5cA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=_Ge82aPy-h_wFa7gWU4u:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090165
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

Allow mcontrol/mcontrol6 action=1 when Sdext is enabled. When such a
trigger hits, enter Debug Mode with cause=trigger and stop with
EXCP_DEBUG.

Also report inst-count triggers in tinfo and read their action field.

Signed-off-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Tested-by: Tao Tang <tangtao1634@phytium.com.cn>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 54 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 2537515f54..aaf2dca17e 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -34,6 +34,7 @@
 #include "exec/watchpoint.h"
 #include "system/cpu-timers.h"
 #include "exec/icount.h"
+#include "accel/tcg/cpu-loop.h"
 
 /*
  * The following M-mode trigger CSRs are implemented:
@@ -117,6 +118,8 @@ static trigger_action_t get_trigger_action(CPURISCVState *env,
         action = (tdata1 & TYPE6_ACTION) >> 12;
         break;
     case TRIGGER_TYPE_INST_CNT:
+        action = tdata1 & ITRIGGER_ACTION;
+        break;
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
     case TRIGGER_TYPE_EXT_SRC:
@@ -287,6 +290,7 @@ static target_ulong textra_validate(CPURISCVState *env, target_ulong tdata3)
 
 static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
 {
+    CPUState *cs = env_cpu(env);
     trigger_action_t action = get_trigger_action(env, trigger_index);
 
     switch (action) {
@@ -296,6 +300,21 @@ static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
         riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
         break;
     case DBG_ACTION_DBG_MODE:
+        if (!env_archcpu(env)->cfg.ext_sdext) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "trigger action=debug mode requires Sdext\n");
+            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+        }
+        riscv_cpu_enter_debug_mode(env, env->pc, DCSR_CAUSE_TRIGGER);
+        /*
+         * If this came from the Trigger Module's CPU breakpoint/watchpoint,
+         * we're already returning via EXCP_DEBUG. Otherwise, stop now.
+         */
+        if (cs->exception_index != EXCP_DEBUG) {
+            cs->exception_index = EXCP_DEBUG;
+            cpu_loop_exit_restore(cs, GETPC());
+        }
+        break;
     case DBG_ACTION_TRACE0:
     case DBG_ACTION_TRACE1:
     case DBG_ACTION_TRACE2:
@@ -448,6 +467,7 @@ static target_ulong type2_mcontrol_validate(CPURISCVState *env,
 {
     target_ulong val;
     uint32_t size;
+    uint32_t action;
 
     /* validate the generic part first */
     val = tdata1_validate(env, ctrl, TRIGGER_TYPE_AD_MATCH);
@@ -455,11 +475,25 @@ static target_ulong type2_mcontrol_validate(CPURISCVState *env,
     /* validate unimplemented (always zero) bits */
     warn_always_zero_bit(ctrl, TYPE2_MATCH, "match");
     warn_always_zero_bit(ctrl, TYPE2_CHAIN, "chain");
-    warn_always_zero_bit(ctrl, TYPE2_ACTION, "action");
     warn_always_zero_bit(ctrl, TYPE2_TIMING, "timing");
     warn_always_zero_bit(ctrl, TYPE2_SELECT, "select");
     warn_always_zero_bit(ctrl, TYPE2_HIT, "hit");
 
+    action = (ctrl & TYPE2_ACTION) >> 12;
+    if (action == DBG_ACTION_BP) {
+        val |= ctrl & TYPE2_ACTION;
+    } else if (action == DBG_ACTION_DBG_MODE) {
+        if (env_archcpu(env)->cfg.ext_sdext) {
+            val |= ctrl & TYPE2_ACTION;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "trigger action=debug mode requires Sdext\n");
+        }
+    } else {
+        qemu_log_mask(LOG_UNIMP, "trigger action: %u is not supported\n",
+                      action);
+    }
+
     /* validate size encoding */
     size = type2_breakpoint_size(env, ctrl);
     if (access_size[size] == -1) {
@@ -576,6 +610,7 @@ static target_ulong type6_mcontrol6_validate(CPURISCVState *env,
 {
     target_ulong val;
     uint32_t size;
+    uint32_t action;
 
     /* validate the generic part first */
     val = tdata1_validate(env, ctrl, TRIGGER_TYPE_AD_MATCH6);
@@ -583,7 +618,6 @@ static target_ulong type6_mcontrol6_validate(CPURISCVState *env,
     /* validate unimplemented (always zero) bits */
     warn_always_zero_bit(ctrl, TYPE6_MATCH, "match");
     warn_always_zero_bit(ctrl, TYPE6_CHAIN, "chain");
-    warn_always_zero_bit(ctrl, TYPE6_ACTION, "action");
     warn_always_zero_bit(ctrl, TYPE6_SELECT, "select");
     warn_always_zero_bit(ctrl, TYPE6_HIT, "hit");
 
@@ -593,6 +627,21 @@ static target_ulong type6_mcontrol6_validate(CPURISCVState *env,
         warn_always_zero_bit(ctrl, TYPE6_TIMING_0_13, "timing");
     }
 
+    action = (ctrl & TYPE6_ACTION) >> 12;
+    if (action == DBG_ACTION_BP) {
+        val |= ctrl & TYPE6_ACTION;
+    } else if (action == DBG_ACTION_DBG_MODE) {
+        if (env_archcpu(env)->cfg.ext_sdext) {
+            val |= ctrl & TYPE6_ACTION;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "trigger action=debug mode requires Sdext\n");
+        }
+    } else {
+        qemu_log_mask(LOG_UNIMP, "trigger action: %u is not supported\n",
+                      action);
+    }
+
     /* validate size encoding */
     size = extract32(ctrl, 16, 4);
     if (access_size[size] == -1) {
@@ -959,6 +1008,7 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
 target_ulong tinfo_csr_read(CPURISCVState *env)
 {
     target_ulong val = BIT(TRIGGER_TYPE_AD_MATCH) |
+                       BIT(TRIGGER_TYPE_INST_CNT) |
                        BIT(TRIGGER_TYPE_AD_MATCH6);
 
     if (debug_trigger_version_1_0(env)) {
-- 
2.43.0



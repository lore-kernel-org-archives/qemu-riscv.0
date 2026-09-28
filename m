Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9ADCA5FA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:01:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBHWl-0004m9-7n; Mon, 28 Sep 2026 16:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVc-0004LE-W2
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVZ-0006kX-32
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:30 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SHvunB2338399
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=E1XJr91Z9/W
 OpJPaYnmJllfqFKpVjckfx04k0/PB4bM=; b=BcL8AU1xOkxp1c7p7H9BhCC/hq+
 OeXWE1hDN4Tfmn4nojVdZD267JZqxAKaD26d8epubsCJsXYCtGYm6nq2ALEkRlPL
 7qlomrYAbAYq4NkAu1jwO+c4iu6HVoJwXIrh+N9VDqQFALC0hE0StCcdviykwdl5
 KBTsHSWuQO47TpjrjjpQZG9awSYuQ9/TvkLnekXYyZ9MHk1JJSjstzECBk1LwcZZ
 NjRb1RQVOswa3jXa7ElhK5cIW5f4SxZCoD62j2GPbGjTUR2h6hsKaxe4FxgyUfe/
 Caze/HEXwEt9HjE66OFeYxgR6jL/X4ZoVw5UWUEU9fEpgvlxQBV0Rkd944Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s3cvg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5329e965ba3so53551711cf.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 12:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790625566; x=1791230366; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=E1XJr91Z9/WOpJPaYnmJllfqFKpVjckfx04k0/PB4bM=;
 b=Cj4L1zOLGkU9/qwphIub5P8sGpIzaQ7JOvWI9QEryANaDUYCClDTa5JQL3ZuoTXNTJ
 RdnCcJZnxyRAvamaf8Yjj1hee/ZWBJ08bYhpnmoxd4YLMAAdVFh2NfzIjxvd86An0dri
 iskJ5gO/C/vCJHYAekXfii/wS3JeFiYS5qTRWqX0XQwCpyvXqCRrtnE7BQpOA+i63L/D
 yuPeFqbczb3qrSijVgB0VoHMx4IQCP4I1AKvlgN1tuNF6BmfPicgF8yAZQGaY0mrKmaG
 Gg99VOwFLW+EMKyRVQ9u00HRRGAL57atVQ2fQWeuorBARsoWrv/BGaC13ryqIhyp8/BB
 GrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790625566; x=1791230366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=E1XJr91Z9/WOpJPaYnmJllfqFKpVjckfx04k0/PB4bM=;
 b=03bNv+bc2clWDHXOc1V0671i0vAm3ku5pAXWAqfS01LOITZXQC2M5oa7vv94G7DEwg
 hmHe7edjbOqvRdFdTyH1qNlL0cwyyw5ozRXSAtWD4nKGVgK+MTmuL6CPOErhKMIZMt0+
 6B47X+Xn1WO0qy2XoXwc0p+X5ZDZCjODiLoQ3l5NKxnGUQazydqD5wXDPCpbolhRfidh
 i4nlMQ1WEpsM8vLwEpKmPovMowTPz3xj/5k0ex5TliQ+VWCmxJ8yxzdIGHnNFvvFX4Ga
 T1wi7rtvRaly0j9ZoF7TAGFgFXOiGUwxFJPBStJElixmQ/6Q6UE4o5m4GJU8wf9rlQXb
 hB6A==
X-Gm-Message-State: AFuF++nk70VTyfCkLncIVPRk3dp9h7pqY/+ggO3qrm2AmC2/I52pgQG6
 Q2bgxBcyOA8OKCFNwe/c92QWoO34BvDz/IIqU5Qgbsyju+PpwqsMu85ZpRRNnbncFHXM1kFVje+
 bIXwp38UTit5zctw3Z3WOaQL8HScZZejfmMjGLVjlL5w836OzbHOHSinWaA==
X-Gm-Gg: AYBFou0QCar9xjkIHq1yCsaTuPvterJCko2z3Xso3lrwpKKzYTM41ZY1PELnkBp7HNU
 Ajs4RDHs0BIlZ6gayoESL29lvtK6HNzRQz+VkQuBO+wzE1Ii83e3DyMkaGJuvSQkrd29DrahAAq
 RvlvAnsaynUAhTzRYrGHXAmk05NO4SRxG5yHLs8CxELHDv6QdVccY2owVhZQfff+EK8YLK/wWTB
 DAbGpW1SjCmERHHm/Aj5RIBY48uS+lZsJLVM6laXIe5XigHhc6RmBfwSsm4gXPuZ6BXJIH6QPrE
 pTHe2D1Bv2BXN+N7qCwitRZE6P4qOdbwYZbYAgJPNbup1dtVRjnli+fQ5/XyNuwIeHHkSDvVv6I
 6Ap8qtx7Ir055BcOnPqybKtYscwHr6hx202w=
X-Received: by 2002:a05:622a:5147:b0:533:42e0:a1ee with SMTP id
 d75a77b69052e-53342e0e0f7mr89126111cf.37.1790625566274; 
 Mon, 28 Sep 2026 12:59:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5147:b0:533:42e0:a1ee with SMTP id
 d75a77b69052e-53342e0e0f7mr89125661cf.37.1790625565739; 
 Mon, 28 Sep 2026 12:59:25 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9143d0a64b9sm75905556d6.35.2026.09.28.12.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 12:59:24 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v10 6/7] target/riscv: add sdtrig trigger action=debug mode
Date: Mon, 28 Sep 2026 16:59:00 -0300
Message-ID: <20260928195902.2045235-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
References: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfXzveGk7PhdMfG
 7gvFGtYC7pErblz3OWp7SoM4mlF8S37wCTrwFeoR+32durEbmqNoQh3H64w1KFGhtRPys/itIxq
 jGYcfsUxCzk3UyX4GUTNmOFNGpJlTXHDjdOxkGop/lOclR3tytBRy0nPpXjHcrvzidvLKhM9jLo
 SrN8hQ8Ewhlu33vh56Mc1bAMlvVuqDD0x2q9OUkM7dUesbS+W7E+Yz7y+qr02eKNg+V4ABzAd5V
 /FHZ7Y+8xh7iMwWr2zUQK32IYkyinXSfNcRYa/f6I+RADVHszAFdxzYvuAAzhyzhyVMe/xXX4/W
 qpx28GCBpwTc5LBq2HZgS8pE8AUksyf9zm3ZGx1ApHp+7BB3AfyHKX5CfKjQ5o7Uenlc6SsRGwY
 CHl8FfiVM5t5BPINmAyT4RTi3R7IwbcOfOGd5RFnxVGPlKy8CWuRDhhRdJxA2D5ws5jVSoK/x26
 t0Vts1PwqiuKgvhzRNg==
X-Proofpoint-ORIG-GUID: oTWuzF3KkuFrRMDXpKG2WifzPpl2Nbyl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX+YjwzxzrkXDk
 BIw6oajjfwN+Udt/1diGGBl7UT77YZai3CCyOY4Y51uszcBpGbTWgIRJjm9oH5UCGubG4E7qxnN
 j/sulqC1Ff66oexfD1EGBQps7blWt24=
X-Proofpoint-GUID: oTWuzF3KkuFrRMDXpKG2WifzPpl2Nbyl
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6abac71f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=xvfqbYfxAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fgrLqfBXAAAA:8 a=JF9118EUAAAA:8
 a=jq8im54kr7_wP6Zmv5cA:9 a=dawVfQjAaf238kedN5IG:22 a=_Ge82aPy-h_wFa7gWU4u:22
 a=xVlTc564ipvMDusKsbsT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280079
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Allow mcontrol/mcontrol6 action=1 when Sdext is enabled. When such a
trigger hits, enter Debug Mode with cause=trigger and stop with
EXCP_DEBUG.

Also report inst-count triggers in tinfo and read their action field.

Signed-off-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Tested-by: Tao Tang <tangtao1634@phytium.com.cn>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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



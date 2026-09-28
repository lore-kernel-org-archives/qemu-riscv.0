Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDEDCA5FA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:01:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBHWZ-0004iI-Ht; Mon, 28 Sep 2026 16:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVZ-0004LB-I8
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVX-0006js-Cc
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:29 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SHwfMX1683775
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=bG7FkCYn4pO
 yvSddvQ9WsAIOvmVG0A7KgS4yHQcSx8I=; b=p51Z4v0OG6l43W+Fl+bT3fzmVDS
 3yelkLZpRXH3YOSSWqW1UXh452OczoNc4HLXW1K8im0iUQswkKCJS/YFUDsZ15MB
 WzXdf+ah6i3NO1ovWhejF2vMEDRELNhp9A/aUFMxaDs8boCrw0WY0Kt/N93Wxlvb
 L+iGA7iqekYS+TdxbuqNA2Y1eaDQ7/9D81ODXBPre0Ee3uyBcl/Vz838VaPBXKWu
 gYmcUXxyWSLRWs5RVUzCKZrJZHFIYGlhsiwtrAjqcwjmpNzfSxCC3gcVqv/XYDv9
 nfsQZJBl2WKoocEd8t19nMVblBimNqgxIuKchqxSUUKqjpS3c3x2fz4iB7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwn8jf8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9106fce784dso70353336d6.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 12:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790625563; x=1791230363; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bG7FkCYn4pOyvSddvQ9WsAIOvmVG0A7KgS4yHQcSx8I=;
 b=jf/fcq3fu3L78a7GvuSzrAupxm+R4cio0yRXfOrHQ+3z4LZ5b8/JNRvBthKwk73seS
 NXMT88J7TokyiMQPyTE59ZgvjvJsKUFK7/QxBufWlyVpkKNVnqMjmlSrg4tr3WlRfX5s
 cAQ0SphxkLrcudYWxMIZkGNpZneZp5XNpJYEDWUWgevIS8HCZ9biCwEJ3JiYH4cQltUV
 +3OFxoiU73zsavlWCucnmjp4pVfwu+StkfO+PoGp5A0MyQ1oAqZxUo7bknjmfs3o84X9
 gUm2KP1L7iHbjuIBXNg26jUXBaUdUhLcp7pHe77ZjE+/0F+y+EQH4dIAYXL/+LPKGx2w
 nH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790625563; x=1791230363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bG7FkCYn4pOyvSddvQ9WsAIOvmVG0A7KgS4yHQcSx8I=;
 b=r0QzHYPeUVZ0gx+e+C0Zm8U2CoO3Qxc6InkO/42uUDWRam9b2YPZBI0YfIk2QE3AvG
 eBGq8lWyG8qAYYXp8d1QXIflDU+sR40N32UE35oIh6lR/4iVzB6mh2v6QZA72ZbI5yAN
 rFAM9O4FTEQi2V+6XeSPAcLKbp0hDd6ydafIkXLV5YbCYFz/5gLAGXI5ta4NsruB0+ax
 1Eiizlz2/udKyj+3zIljEfvBH2MVJczD1c7HQNk26ecV+3/ntuga8ViFOfJKgTu93hdi
 /RTpWUc+Osxd0xcYPp1CPbgrh1vNk8D4+glGIeU7j+OcA9Gj79BlU1YMc7OE9D9o1Yzb
 YldQ==
X-Gm-Message-State: AFuF++lf4UgzuSQGsJW5AL/+MjMAw1KFh6BkqxqdnviC61rS8RolC2dV
 BytpY5fnQ9y4erHenulhgJFXLfuP6IlSf02kbWT9wLMIEErqGIouQ5H0ewS5gU87H5129oQ6TPF
 /n11PfPL6zO3LIulgX2h4/xmyu+szLCu5JTkiINbGtF7xEkCV+A0S7yhmSg==
X-Gm-Gg: AYBFou06zXmKFGMkaTHfi496rcSBr/85EghDfU4mf7sFGlX2dOmZd6V0sTHJieM//iO
 krCAfUeF5XgD/+wZRVsmi9605Mg2LEuP6EA3wZ8ZUzZIHyXQvqC/ydIf/K4IhR9vH00Lqu3g/I+
 zGKDWMaPX/6DGo3dvcDzaauY8XkdZzk6rTxYKqhBYcUZCO3idScUNPNzoMnZN2LmBgNM4f9r93I
 FA5lOm7w+A6pXLe5mRHoczjdUSDvLZYhh57rGPwwu+sIvhRrH7VwwOQKnyamSl0dSamWEN78xPV
 ZTAKx3mJFrp/vw7qyqoAcL25N5omMU0uBGC656vjkVx76n1OKIR250WRe/9OwWY9KYyCP2zLC1h
 Q5+oBZcW1LceWpCMiygOFoouy4fFj8KktC9s=
X-Received: by 2002:a05:6214:3986:b0:914:4129:92de with SMTP id
 6a1803df08f44-9144129a1ffmr185314066d6.1.1790625563256; 
 Mon, 28 Sep 2026 12:59:23 -0700 (PDT)
X-Received: by 2002:a05:6214:3986:b0:914:4129:92de with SMTP id
 6a1803df08f44-9144129a1ffmr185313676d6.1.1790625562754; 
 Mon, 28 Sep 2026 12:59:22 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9143d0a64b9sm75905556d6.35.2026.09.28.12.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 12:59:22 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>,
 Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v10 5/7] target/riscv: add sdext single-step support
Date: Mon, 28 Sep 2026 16:58:59 -0300
Message-ID: <20260928195902.2045235-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
References: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JMBPcTuw-mJp7vwUJSwXZRnNVp7_dQU9
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abac71c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=xvfqbYfxAAAA:20
 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=fgrLqfBXAAAA:8 a=JF9118EUAAAA:8 a=69EAbJreAAAA:8 a=tgk7fgI0p9FEwYF5lhYA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=oJz5jJLG1JtSoe7EL652:22 a=_Ge82aPy-h_wFa7gWU4u:22
 a=xVlTc564ipvMDusKsbsT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX/bbhetL6eQN2
 Q+HUhYf44fl0TyFa+DF8oh0laztfFJ8SXwddIVogGYh97KqkdcMmpTpoYj3Vb4+OT4tFMWAdDS1
 DUCrVuHi5B6+EtD6VU7RhZ1aRNHnyQdci8DYsmyJLvTduFa5fexaVFClelfDNk7fF9W3IcYHnlV
 3CZE+VMJUhl1JfFPfu5WzDUjHxTotsrKdYVvLobai6dMdherdHyFnTU0rXM54kV2gV+j6lcSNq/
 WNP5Lx/Hj4T1ZEYkBJ3R2cgsXNWFDfowdhx4R3gF67pII/5/yxyYGe7DYVakKfN+ya1L3sSESU0
 teKnyaQsRN00z3AzFB2lZw51nYvLfJT91pXcMM+kwKKI1eEy80ikBeRGwkqgtfa+FKuOAcpa/pa
 q22qS3m1QYsHNi3isLRD20vS6ssS+nrR19LF44joqXvWjA+ys0NjsmBgmUMeFhbEhsb+6cweSV3
 +reUrbWHRPYU11yGVjA==
X-Proofpoint-GUID: JMBPcTuw-mJp7vwUJSwXZRnNVp7_dQU9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX4/+x00P/IKg8
 OkYUBruoUgGL84xMcH8hMSdZLD24bVLy4/lN+BnMvbZ2ciTdYtP9C9BI+F+4Kd3ZbDbPCYdkKAb
 3O0VWhsHva0XwifLEvuwUTQzCpY8ec4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280079
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

Use a TB flag when dcsr.step is set (and we are not in Debug Mode).
When the flag is on, build 1-insn TBs and do not chain to the next TB.
Add a TB-exit helper that enters Debug Mode with cause=step and sets
dpc to the next pc, then stops with EXCP_DEBUG.

If dcsr.stepie is 0, do not take interrupts while stepping. Treat WFI
as a nop so the hart does not sleep during a step.

PS: This patch references Max Chou's handling of ext_tb_flags.
https://lore.kernel.org/qemu-devel/20260108132631.9429-6-max.chou@sifive.com/

Signed-off-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Tested-by: Tao Tang <tangtao1634@phytium.com.cn>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 include/exec/translation-block.h |  4 ++--
 target/riscv/cpu.h               |  2 ++
 target/riscv/helper.h            |  1 +
 target/riscv/tcg/cpu_helper.c    |  6 ++++++
 target/riscv/tcg/op_helper.c     | 20 ++++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c       |  5 +++++
 target/riscv/tcg/translate.c     | 15 +++++++++++++--
 7 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index 40cc699031..ee15608c89 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -64,8 +64,8 @@ struct TranslationBlock {
      * x86: the original user, the Code Segment virtual base,
      * arm: an extension of tb->flags,
      * s390x: instruction data for EXECUTE,
-     * sparc: the next pc of the instruction queue (for delay slots).
-     * riscv: an extension of tb->flags,
+     * sparc: the next pc of the instruction queue (for delay slots),
+     * riscv: an extension of tb->flags.
      */
     uint64_t cs_base;
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fa253b32d0..4b56cacc86 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -762,6 +762,8 @@ FIELD(TB_FLAGS, PM_SIGNEXTEND, 31, 1)
 FIELD(EXT_TB_FLAGS, MISA_EXT, 0, 32)
 FIELD(EXT_TB_FLAGS, ALTFMT, 32, 1)
 FIELD(EXT_TB_FLAGS, BIG_ENDIAN, 33, 1)
+/* sdext single-step needs a TB flag to build 1-insn TBs */
+FIELD(EXT_TB_FLAGS, SDEXT_STEP, 34, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 533dee1765..32225471bc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -142,6 +142,7 @@ DEF_HELPER_1(tlb_flush_all, void, env)
 DEF_HELPER_4(ctr_add_entry, void, env, tl, tl, tl)
 /* Native Debug */
 DEF_HELPER_1(itrigger_match, void, env)
+DEF_HELPER_1(sdext_step, void, env)
 DEF_HELPER_2(sdext_ebreak, void, env, tl)
 #endif
 
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index b6b8c2518b..ffa9e78cc1 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -503,6 +503,12 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & mask) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
+
+        if (cpu->cfg.ext_sdext && !env->debug_mode &&
+            (env->dcsr & DCSR_STEP) && !(env->dcsr & DCSR_STEPIE)) {
+            return false;
+        }
+
         int interruptno = riscv_cpu_local_irq_pending(env);
         if (interruptno >= 0) {
             cs->exception_index = RISCV_EXCP_INT_FLAG | interruptno;
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index 53e9eb445f..dc76055b80 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -526,6 +526,22 @@ target_ulong helper_dret(CPURISCVState *env)
 #endif
 }
 
+void helper_sdext_step(CPURISCVState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    CPUState *cs = env_cpu(env);
+
+    if (!riscv_cpu_cfg(env)->ext_sdext || env->debug_mode ||
+        !(env->dcsr & DCSR_STEP)) {
+        return;
+    }
+
+    riscv_cpu_enter_debug_mode(env, env->pc, DCSR_CAUSE_STEP);
+    cs->exception_index = EXCP_DEBUG;
+    cpu_loop_exit_restore(cs, GETPC());
+#endif
+}
+
 void helper_sdext_ebreak(CPURISCVState *env, target_ulong pc)
 {
     CPUState *cs = env_cpu(env);
@@ -658,6 +674,10 @@ void helper_wfi(CPURISCVState *env)
                (prv_u || (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
+        if (riscv_cpu_cfg(env)->ext_sdext && !env->debug_mode &&
+            (env->dcsr & DCSR_STEP)) {
+            return;
+        }
         cs->halted = 1;
         cs->exception_index = EXCP_HLT;
         cpu_loop_exit(cs);
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 959a1e89c8..16d26cee5c 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -196,6 +196,11 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
     ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, MISA_EXT, env->misa_ext);
     ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, BIG_ENDIAN,
                            mo_endian_env(env) == MO_BE);
+#ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.ext_sdext && !env->debug_mode && (env->dcsr & DCSR_STEP)) {
+        ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, SDEXT_STEP, 1);
+    }
+#endif
 
     return (TCGTBCPUState){
         .pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc,
diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
index cce3b6dc72..d6b1f9bfee 100644
--- a/target/riscv/tcg/translate.c
+++ b/target/riscv/tcg/translate.c
@@ -115,6 +115,8 @@ typedef struct DisasContext {
     bool ztso;
     /* Use icount trigger for native debug */
     bool itrigger;
+    /* Enter Debug Mode after next instruction (sdext single-step). */
+    bool sdext_step;
     /* FRM is known to contain a valid value. */
     bool frm_valid;
     bool insn_start_updated;
@@ -289,6 +291,9 @@ static void lookup_and_goto_ptr(DisasContext *ctx)
     if (ctx->itrigger) {
         gen_helper_itrigger_match(tcg_env);
     }
+    if (ctx->sdext_step) {
+        gen_helper_sdext_step(tcg_env);
+    }
 #endif
     tcg_gen_lookup_and_goto_ptr();
 }
@@ -299,6 +304,9 @@ static void exit_tb(DisasContext *ctx)
     if (ctx->itrigger) {
         gen_helper_itrigger_match(tcg_env);
     }
+    if (ctx->sdext_step) {
+        gen_helper_sdext_step(tcg_env);
+    }
 #endif
     tcg_gen_exit_tb(NULL, 0);
 }
@@ -312,7 +320,8 @@ static void gen_goto_tb(DisasContext *ctx, unsigned tb_slot_idx,
       * Under itrigger, instruction executes one by one like singlestep,
       * direct block chain benefits will be small.
       */
-    if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
+    if (translator_use_goto_tb(&ctx->base, dest) &&
+        !ctx->itrigger && !ctx->sdext_step) {
         /*
          * For pcrel, the pc must always be up-to-date on entry to
          * the linked TB, so that it can use simple additions for all
@@ -1380,6 +1389,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->bcfi_enabled = FIELD_EX32(tb_flags, TB_FLAGS, BCFI_ENABLED);
     ctx->fcfi_lp_expected = FIELD_EX32(tb_flags, TB_FLAGS, FCFI_LP_EXPECTED);
     ctx->fcfi_enabled = FIELD_EX32(tb_flags, TB_FLAGS, FCFI_ENABLED);
+    ctx->sdext_step = FIELD_EX64(ext_tb_flags, EXT_TB_FLAGS, SDEXT_STEP);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
     ctx->decoders = cpu->decoders;
@@ -1432,7 +1442,8 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     /* Only the first insn within a TB is allowed to cross a page boundary. */
     if (ctx->base.is_jmp == DISAS_NEXT) {
-        if (ctx->itrigger || !translator_is_same_page(&ctx->base, ctx->base.pc_next)) {
+        if (ctx->itrigger || ctx->sdext_step ||
+            !translator_is_same_page(&ctx->base, ctx->base.pc_next)) {
             ctx->base.is_jmp = DISAS_TOO_MANY;
         } else {
             unsigned page_ofs = ctx->base.pc_next & ~TARGET_PAGE_MASK;
-- 
2.43.0



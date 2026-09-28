Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87762CA5FA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:00:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBHW3-0004RD-VS; Mon, 28 Sep 2026 16:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVX-0004Ku-Jv
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHVU-0006j8-02
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 15:59:25 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SHvucG819658
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=QWSp4UO9hUK
 dHjYQRdO+jbQ27QRy4o/C7A+ldLm7TaI=; b=iybscOvFDLrPnQtBWSLaiY+fH9o
 y5eabv7UnZrSCbZBHfcqR/PgrF71hDimvY2EkbBlzsbFeWpQHhRkoEtTN7edshF0
 ZXE++L6iWp+VHVjy/+4ok3vNINPCQ0/KWGHyME0MUbWFELG+J7LN79jKf45G96yT
 Uxgsb0noEY2JP4TsJ0n0fC87vNKf1GRYeRd3R7MHzJvNY1Hq3yrKXPHOkCzyy9MN
 sVIKhUQXzOtikKlRrs3EwbxVgtLvGdJ4CSQL/GIFEoZWnBu1vqGzZg9iReY3Fgju
 pchBjRgPiz++vszOYiXkTvATr2Te7arLFhKy5K7bVM9lozz+i9qwHptL9SA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx3a1ka-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 19:59:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-939f3426a7cso798233085a.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790625560; x=1791230360; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QWSp4UO9hUKdHjYQRdO+jbQ27QRy4o/C7A+ldLm7TaI=;
 b=EdYK3Wx6WBYuIOkmwiluCRsgcqbfmiIv15a8cN6vyYBWUiKWp324xDTXbiivsfPn73
 qaXgY3Je5yr8nXRmimispplMuBwtOZAw0tvTs+YhDwpdVsTOBw25mSrLq/RpZYbFVjHD
 DzlngokvFQB61Tn8eJKPRnG2ADNj7v+Oy5OnDGtnrNbeO9dZ1ujMi3lJDDIMkbp/Ltzi
 tJFUPn7gdcx/PdreSXAcDJsaWUKr2YCEYfnSVJ+63g29bya8fOxquamnHDEopfUN0W0e
 579wBk0Knonoomp84C9re6bPA/848+1dh6WysYAL3iXQu+JOCxz10gGVFLVbtWJPou0V
 cHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790625560; x=1791230360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QWSp4UO9hUKdHjYQRdO+jbQ27QRy4o/C7A+ldLm7TaI=;
 b=bLssHDi2xmxqdsJWo0G9mE0zuFKCiNrRzSQjWjYkZvBpC/wx3IJF4uooXoQzK0eobr
 EgJnDcmud4lQbupR+naxy8sxPnO01SdCBIotRO1+l46ry1yBmpepCvcxRUjeOJGnNLWe
 DWIXaVnuuU/9jHXGRR5YvnFivlUR/2SRYFZjUylHFpcShRSqfhmIRIClDfSHh4vwTDbB
 xxMnop/vK9JxozT5YuANpLd9opS0xryH7TImcN734RFhKjKxRD4S0o0JgN5AtYu6xCDR
 JQCohg3kR+tW3W6Ea8ARVS6/VmCLa+E6/XVElfjnSedc6Z6Wt838e33RCK1KrKbqycIN
 kQqQ==
X-Gm-Message-State: AFuF++m12IwAxHyRJRZET4ZOYHLtrUwjU4mm0ceplL/8Dfn5y09XTtLZ
 yISLaoRGlYTx5PViNinXjDukz+Vpj1Tw97Nq0T092T5Egs0DI8x34YrtgsW/6WRnFUk9zCvo4Ar
 /eyBa8rM6VZHEqKy9MdEkCnoW680+jjI0OTPH0AhlmzDMwjBGoiuaazLQwA==
X-Gm-Gg: AYBFou1Dqs0ozdtNTfuA4WbQV/EjLwnbCvZLP+bZhGV5OEl19c0VyGt/LGDzF2lzupM
 9o0FZEg2YZaa3cpOFi06CBOc2kkG8Li6BO8laVHbFrxfHmIKi2vScUYEvVFBXrMZDsgqW6k2w+1
 km2iUpgNrs0/ewkoUsieGBqFYUYCeM9TrNQt8NTeCkCFZ8HJvTMURVF/yAAn5+cSZmWKbO7BeJl
 w36USPweIHV5jWfi7HwAk57szIh53qnxhK23bV+eg8H1o/hoFGFcpiLllfVzcyBrlksRMN/ZKJe
 cLopWbJIlYc8DaqFuGFD835Y05OXXR81yzHVCExxwTWJR8SU9gU0oSp+xKVoXsmXyrwMc5aupd4
 4O7NQterlfk+WxDv1Lj3P9naAlWT/JAuWPJ0=
X-Received: by 2002:a05:620a:460d:b0:93c:89a0:bf82 with SMTP id
 af79cd13be357-93c89a0c0bamr248412885a.43.1790625560332; 
 Mon, 28 Sep 2026 12:59:20 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:93c:89a0:bf82 with SMTP id
 af79cd13be357-93c89a0c0bamr248406585a.43.1790625559755; 
 Mon, 28 Sep 2026 12:59:19 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9143d0a64b9sm75905556d6.35.2026.09.28.12.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 12:59:19 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Tao Tang <tangtao1634@phytium.com.cn>,
 Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v10 4/7] target/riscv: add sdext enter Debug Mode on ebreak
Date: Mon, 28 Sep 2026 16:58:58 -0300
Message-ID: <20260928195902.2045235-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
References: <20260928195902.2045235-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX1DFtqO+g03bL
 gBzvFpRntaCFtrvlClcHiFn0TscrZp4RaawufiJRrh7f1mGvjmIBHMvJW94nYO+w7conc1Ny/nE
 fbModVq0vqDLOeo+Odzklon7AwglWnZk7p6ulAj9QUjuopp8YsamsB6SINrC63KPt9GjFf+AeNb
 99xawASCPO85QUqVLaLJBdLUKa3expPaxrPv7hHJ8lzE4Trra8L8Tq+HNIBhAHw/CtNKwGVscVU
 evIyV6q2McsfuWSQOjcKrfz96kl6TwF8pNxo2sF/8+61F50c6xjF6Fs/mSk1KUo5hZoa08E/a0x
 0lTnwUN/QlZtosb/HegLLiP1ia67pHkmWhZ1BozQg+z+zWkFr48kP1HodNWRyKudgJk8fWSSYV+
 XDEJc5uCIwK8mv7QsJD0SB0cRRtBJoHfRE9smGk3JRW9dqpPyYHt6e0H57cBZ8yctNRyDq6ud49
 ZAHH+3+c880/KwrAfKA==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6abac719 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=xvfqbYfxAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fgrLqfBXAAAA:8 a=JF9118EUAAAA:8
 a=69EAbJreAAAA:8 a=ITXOtABjXhpKHoTPUzwA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=_Ge82aPy-h_wFa7gWU4u:22 a=xVlTc564ipvMDusKsbsT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: t3rciRAlf8JvkYWaiOkXRhqMn_Ql_4lt
X-Proofpoint-GUID: t3rciRAlf8JvkYWaiOkXRhqMn_Ql_4lt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3OSBTYWx0ZWRfX6XC/YWRANwoo
 AVSagYABa6hRSSmxd/0+30F4gsI+4/okYbQJMVKMNZh3IN0qXwFg+9LI8a7d5vkz6v0PBuOCz+L
 oXuPzsD3zeSO8yIHBAFNTFPmZ/yVXT4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280079
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

Route EBREAK via helper_sdext_ebreak. If Sdext is enabled and the
matching dcsr.ebreak* bit is set, enter Debug Mode with cause=ebreak
and stop with EXCP_DEBUG. Otherwise keep the normal breakpoint trap.

Signed-off-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Tested-by: Tao Tang <tangtao1634@phytium.com.cn>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 target/riscv/helper.h                         |  1 +
 .../tcg/insn_trans/trans_privileged.c.inc     |  6 ++++
 target/riscv/tcg/op_helper.c                  | 34 +++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a790595b40..533dee1765 100644
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
index f1a042d57f..e22df6fbe7 100644
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
index dbdaa64f5e..53e9eb445f 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -526,6 +526,40 @@ target_ulong helper_dret(CPURISCVState *env)
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



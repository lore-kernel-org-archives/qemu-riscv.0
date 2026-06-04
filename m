Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEA0CD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 09:53:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV4lF-0005UN-Ae; Thu, 04 Jun 2026 05:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4lC-0005T9-Ls
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:53:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4l8-0003j5-L5
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:53:09 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6545sY5C3240517
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 09:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=rIJ+z58zb6Q
 93VW8mtj9oFZEH0MU8/yOI5xPORlDuXc=; b=H4DgzJRi3qK4f71Vc4QY7aOnGLt
 +3WhfiQvbv7NCNvQdxSqTUQn3MISSUEHy017UH4aJCCGE6EjlFynTDAw7epZ7eEu
 a7zhpQzjYbsGUqPnE6rLYdpMGqKzTQW1q4wRZNcqEtACTCSjHK76R/fH5qoGdk7S
 +ehafBAM7DBEDXL0U97pPUxlppeShWCakspP+aKIhb/uMVynO4T/sUw9JxcywKFS
 /DdnAB7EdsCqMLnnHQodDrcCCelaAAlTPNuVA+npd0S6afI6ka+n8JlLMuDzf2nG
 HwCub46l92YGfQz7+Z12NLmONmVOra9kyOsWY7YWTJzQ8gDZAe/udys3xvA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd0a9th-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 09:53:05 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-660668ea5cdso846812d50.0
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 02:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780566784; x=1781171584; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIJ+z58zb6Q93VW8mtj9oFZEH0MU8/yOI5xPORlDuXc=;
 b=iqXAayaNv3BwEOkSul2R6TEHD9cT9tBtRxiqeDBFgDy+ANXJOquMzH/Rm69hGmzLwL
 IWKX7YzUrhkH8aVC5Oe1DoRMEOE6TXtIkV+73A57+3zEmOeZQwDBzpD53SP4yPohsfBQ
 8XSCJ+hvLvpmzlPNXzCEr6Mx3RaR2X6omFRUOE3dlCuWxc5cFUl8/PMcT3WzrOqgd5oS
 /RpezJv2IDN6qTcNFMFyz5N28EwJqEvv/dnJkMePiDad+MdsGOTBSZ8hgo0NKbEOpryi
 /fuE1Tbe8TK7XdChlpsN48G7pys16HWZqjhtB8Qx+idQ00Xc2o4eOQUcK8hzRlr3jBJc
 UApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780566784; x=1781171584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rIJ+z58zb6Q93VW8mtj9oFZEH0MU8/yOI5xPORlDuXc=;
 b=aV6QONGAdfWry/kVhJKcvKC/Av0y2mt28rVMVPVHXJzZbMt0+8jPtAvEkoxnr2MamF
 Ke7OCBv2NxaAIZshhjXVfBkkDGbm7YmiT2CwxSrll88lotP16+fZpBVkwrDfI9gSnWYg
 7S4UAxoAVYngCYI28mGDC8duCy1GOKJS7zMVk/oAG/uGTSfD7sKHnNqqxX3LPO8ZcRq3
 KnYljat5wEZ5Pj3cLJ8iGxupiQEIvkMUK7RLzQbuzZ25DyqDr75h6+3NQcUCJVTVqy65
 MUa46HyZgfcrAiPZs9cXBkEhsL16QtiBkIbXRILRZCiewRI3EX8RzaEktYQdW5BR92Ck
 upVg==
X-Gm-Message-State: AOJu0YxxgI5fCJp2VZA1J4Ml4hG8/EAh1Wo4X1RKrA2Pn78wh2LbU/y8
 4OsTLwPysImWeQxhsELmBWGGbhppj7jYPVF5HXvhuhmeJrWw1NIbarphKjYJbWQQC4bK/kFEvVv
 5sf8TOmUJiwxF+0btJY96qAmVIGfy3M4E5xFujN+bzJ39FvxBeo1aZoAGwg==
X-Gm-Gg: Acq92OETr7te8qWzcFnUnD3dlVZnaiiWNZUhMXiL+/As9PIv5SuriCvT75oSY0gVfDt
 RIq+en2HFWkv6obDy86U5E5tfe1VVpNQ5YZUnhWsqo74vVMU5z4lsoVFTBYX7vJfbWMMnj+VfHE
 Z5C1/5rcuEqupkKyQQRhXWeyw/omOon0x66ayn/9qdewuHFxOccTyBqSPJhFpLqSm2a+gbcSzHK
 4cGZanzN0u5jvNeRc+6ewBYRs9LFCbF/37z+6k4EsDthJ2tbBnAzR4guBJipdGCeM+Wl36x9bAh
 HA/xV7Lgay6bV9xxEvznPvGxnGQZEYBvol7aiMc+I65rYAcvh8shlm9NSEKmadaVs9h1SzLt/0o
 R8uXT4XouBaUhpHXE/zZlHpCsliPoQ1ql51n7vFT2Ex8DQaoEBFZqZ+MbkTcae34eKEzq8Q==
X-Received: by 2002:a05:690e:bcc:b0:660:eaa5:c13f with SMTP id
 956f58d0204a3-660eaa5c3fcmr4660783d50.28.1780566784618; 
 Thu, 04 Jun 2026 02:53:04 -0700 (PDT)
X-Received: by 2002:a05:690e:bcc:b0:660:eaa5:c13f with SMTP id
 956f58d0204a3-660eaa5c3fcmr4660772d50.28.1780566784141; 
 Thu, 04 Jun 2026 02:53:04 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-660d64ba680sm3522830d50.21.2026.06.04.02.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 02:53:03 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Fei Wu <wu.fei9@sanechips.com.cn>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v7 2/5] target/riscv: Add server platform reference cpu
Date: Thu,  4 Jun 2026 06:52:41 -0300
Message-ID: <20260604095244.3313259-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -9qgP1b_2tQ9yM1mPyN0IQ1nCgZyIj_X
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a214b01 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=V1jnuoLLAAAA:20
 a=uTRCLKPYAAAA:8 a=EUspDBNiAAAA:8 a=EVmsHFvQfC4jtDmeNssA:9
 a=nd2WpGr1bMy9NW-iytEl:22 a=T-agBWn15iSmxapsA1lH:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: -9qgP1b_2tQ9yM1mPyN0IQ1nCgZyIj_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5NSBTYWx0ZWRfX404DgE0XdV4G
 3z3ksdlhxJZw3TrRuupdLo/C0KH9uFz5fHUPwpu7I+nHUSoTzRf0790WPxeihlB9o54X2MLe5kJ
 WccGq+gwJpmConbyaJXtO0bk38Z++JHSszv08WGDlpC/R8/Fi8eo9H+tkM9n7tWaZ2Qz+7JDbaX
 +IiaBFE5+TVlJRoysrjpunmmr9uga5J3dPuG3/8jQZGJqgyouOMgI5oANdkctX3KOaKvrknmUXl
 5EdPgPrIw3GGYssScPyxmY6DCEEbC+3ZWcDhBZSXwBELaxS2JUnrLKKgr4ox7A1uVCjk2cB7cy6
 XjqVegv5lx2cE4xKndWVSCj3N4G9hYthf74BEVV7gXWRjFiPX8wcB+NNg8ilAfM/6zHVezXInGD
 HZA7cHVwsjnGaNxYnbd/ZG2+qqCSg2ljjsUyjEWDGbAsSBLRyp7j2YIb9di5rB4JnRJNSktsbUf
 mOdWnoT1IbqzGIFgLpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040095
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Fei Wu <wu.fei9@sanechips.com.cn>

The harts requirements of RISC-V server platform [1] require RVA23 ISA
profile support and others.

This patch provides a new "riscv-server-ref" CPU to go along with the
future "riscv-server-ref" board.

[1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc

Signed-off-by: Fei Wu <wu.fei9@sanechips.com.cn>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu-qom.h |  1 +
 target/riscv/cpu.c     | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 30dcdcfaae..a150acd151 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -42,6 +42,7 @@
 #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
 #define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
 #define TYPE_RISCV_CPU_RVA23S64         RISCV_CPU_TYPE_NAME("rva23s64")
+#define TYPE_RISCV_CPU_RVSERVER_REF     RISCV_CPU_TYPE_NAME("riscv-server-ref")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E         RISCV_CPU_TYPE_NAME("sifive-e")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3f0f931335..c4a5a7f1cb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3315,6 +3315,17 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #endif
     ),
 
+    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSERVER_REF, TYPE_RISCV_BARE_CPU,
+        .misa_mxl_max = MXL_RV64,
+        .profile = &RVA23S64,
+
+        .cfg.ext_zkr = true,
+        .cfg.ext_svadu = true,
+        .cfg.ext_sdext = true,
+
+        .cfg.max_satp_mode = VM_1_10_SV48,
+    ),
+
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
         .cfg.max_satp_mode = VM_1_10_SV57,
-- 
2.43.0



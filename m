Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0F2C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHqS-0003FX-18; Thu, 02 Jul 2026 09:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHqP-0003DR-1E
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHqN-0008HT-Fq
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:44 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0Zj7406374
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GSjWbCL/dirhcrj5dWYYaOR2XqQ0JWP1BRKckTfPwSk=; b=BuFTeSGbqlg+iJ66
 V+M4yj2yPz4WzpefgJOI27ohX5wxFV9Ap91DA0EAXTGywkgbbQoUDwmHWzzBsQtL
 jGVpAlbyei8SIa7oNZRmUxPyP1H+VnrC6ieURYxRzeQddKC5luDm2dtNVsL/Yk4+
 EAN8rqAItl9bGPUmP0V/IB12jb1ZEC6IsoBafwhqdaCWzlNMTt0CVQI93t8VaxOr
 shJgFmkSl6aREZlvpphRLxdF9RFaRpPxo8zeFa1zZzsTRMIS8XKiiAEDLTgUFpQY
 P+uWoYG1SJp0bphBcmG17+0PJ1gKyxSBpnz1+aQy5OWQiXu11ahgqvydCQDssuD2
 +sQy2Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98j12y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-96939fcd33dso306516241.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000351; x=1783605151; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GSjWbCL/dirhcrj5dWYYaOR2XqQ0JWP1BRKckTfPwSk=;
 b=cA2TKM/rEpeolMghIL0IrfmW2JzTA98vIz2W3oBUuZ1+fDG2m5FxZHrIjyP4If3XKT
 XX6Gq10cBClBY0MkmSjwgAjFRuLQvv2RPjUDwgWoe80Z2wL/ByjRwokxzvGqL8wrpDHW
 NOCHh3gVh0ZqPd6Go8zLNMZ7kT247CFyr/B4NbEW10St9q5QwoaMA7BQm3nZQ3qSZH1e
 xWaHSu4p8kQVgO2ncX7vY0iNVCR5Im4rpcUO9mA2u9aKdQc00aTxsapMwzXmug29SmOv
 dmU/4bCNCxutmZZELxywfoitIA8j0r2Zf9fqk0TDQp9FhlazoZqjAnzBTGS9V42jVyIL
 uoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000351; x=1783605151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GSjWbCL/dirhcrj5dWYYaOR2XqQ0JWP1BRKckTfPwSk=;
 b=CrIpjd5aq91P+KEVQfn7c5+z0Q6sGWv0R1KA1SdtbLFIP5jZSuSX+Zk8p8ZVy0v58P
 fF78Ar21hfTQTa66FRW+KFs41A90dZIFkjBbYbgb3nppMrTqfr9trTwtHVtg6acVtqYb
 pQjxi1ZzxwN5GJx4y1UJC8puGgnKsD2sshvBlGW88azTLRbrMU6+tKE9Ae+fufAgeGo3
 4xrjuL9ZDtvo0dCDXK0liTCL93Zb3sWHbdqKyx4mBOQujEffrA8kaxX1X6jyvpuJIcCg
 noLBL+8cFqfuvZVPfDpDQv94V37mTBKuO9DevPFsQMAKpOolJ/ac4dm3yvSVOabCWf+q
 /3hQ==
X-Gm-Message-State: AOJu0YyWmW69fG5feBrzELdZQSEsyDpaTEZ1VDDlLBKDr4fO9AM1Dkek
 eMiwzcmCK44jMOg8pqEasr5pyRH+F0c5GVqGSxLsClZ+xJEPwHKMzQjITeBWjMUGiQZUoFuKoCk
 4eekslF7KHa98mfwWNmzNEQCHzZKozCI+yxQuRRcSaeHATpy+wLP1cxDM7A==
X-Gm-Gg: AfdE7clarRmPv6fIo6hk6a3NqJouVnP0Szp/AJDlykSW09uUaN0eHXVxirBq8DrY8U3
 mY0TnrGGO08UzLrfpkixCS4tHIyRRg7SuoNTuyT1wu7R4X/apjTfjrNw8cWwu/5FpWGke1H2X1t
 dlSP/uxldrW/NsT5W4AAxDGatbr3voMi5f4ns29JC8JHf2a6KFTS8P80XtWppkWU2k8WbZ1qtgD
 SXoAd50Is2tE9pCaoXYzASLpDaTVcIasQHqNqhJx7kiM+U4AsWZoqXbPpdNxJ4Gvlo9ovUdRPq1
 x0oz9mLX8Jbw+9I9trN/4aZ+hxeAKlba9QGPv5LnHqiNNeFMw5BeHGGisn093SyTAow4bM8iHkD
 ntbWs2ijbFLbjRxbWTK4mp2sJBFENoPPTeYDobgfJq44nDw==
X-Received: by 2002:a05:6102:80a5:b0:631:2dc6:2f5c with SMTP id
 ada2fe7eead31-73dba87f7fcmr2338895137.0.1783000350998; 
 Thu, 02 Jul 2026 06:52:30 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:631:2dc6:2f5c with SMTP id
 ada2fe7eead31-73dba87f7fcmr2338887137.0.1783000350537; 
 Thu, 02 Jul 2026 06:52:30 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:30 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 22/24] target/riscv: move riscv_cpu_set_geilen() to
 riscv-imsic
Date: Thu,  2 Jul 2026 10:51:24 -0300
Message-ID: <20260702135128.1188021-23-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ecwVDjRRgNunhFoyzZfsn18nxfbwoCv5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXw/7krvT2hx+V
 tYu+PGOul/SkxXb4A/N0TlC0ocqZG1Nn/kpBAYoumR5x4XZBHjpsIpA93Hyumz66Ttp677eyuDG
 ZEHRQEpS0nbhA4K2nXiuegR5MOcsyP6JAcK2GNzAsSYHNyBHCl+QSqFv6qrQqojm/u5VRGPSui5
 4E380uP19FcoErRhZ3tmH2Rrm/KpTIDfpdvQcfIa85QoFNjV8UaqDL6uGtAj/DVI4/o1JtHyyVo
 8B6F7SBSZNKzSrHICcBkHrfD5OqtaUo4VUF2AVaACfSg33AskQALa07cfZKbwq5P3UJko3f5Z98
 94jwQGdi7OItSiGVXnUveWwm5adjWPxC9FjedoC0dMX2NeJAVTGlX6J6u2d8Oc1AwsHdIq4GX8C
 bWLiFYvg7sRXjVFBsSPbH0cy4BHOSgZIUAy0QIr+1Wlcg5+0SLiM5P1iF3IrenQOgVm9Q6L/D3F
 4rvuKIdr3UsmVAwif/Q==
X-Proofpoint-GUID: ecwVDjRRgNunhFoyzZfsn18nxfbwoCv5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX5q21pXJ192Ug
 gq2/NOVaDI+Tx5lfIImsT2HyJ8gNIbYsDAC+ynxRJrHxtItjleGVnvKKTaKArhyT14wS2+CCOzi
 h562Tja4W8jlIawVs8Ub+En0n8af1a8=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a466d1f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Lr_FLp39YrF5VQqdKKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
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

riscv_imsic.c is the only caller.  Having it sitting in the TCG only
cpu_helper.c gets in the way of --disable-tcg for no good reason.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/intc/riscv_imsic.c         | 13 +++++++++++++
 target/riscv/cpu.h            |  1 -
 target/riscv/tcg/cpu_helper.c | 13 -------------
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 7e5b5349ba..ebb55191c7 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -46,6 +46,19 @@
 #define IMSIC_EISTATE_ENPEND           (IMSIC_EISTATE_ENABLED | \
                                         IMSIC_EISTATE_PENDING)
 
+static void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return;
+    }
+
+    if (geilen > (TARGET_LONG_BITS - 1)) {
+        return;
+    }
+
+    env->geilen = geilen;
+}
+
 static uint32_t riscv_imsic_topei(RISCVIMSICState *imsic, uint32_t page)
 {
     uint32_t i, max_irq, base;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7618110412..7a4d8abe07 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -646,7 +646,6 @@ int riscv_cpu_pending_to_irq(CPURISCVState *env,
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
-void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 int riscv_env_mmu_index(CPURISCVState *env, bool ifetch);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 6b39152ee2..71a96a20ef 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -526,19 +526,6 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     }
 }
 
-void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return;
-    }
-
-    if (geilen > (TARGET_LONG_BITS - 1)) {
-        return;
-    }
-
-    env->geilen = geilen;
-}
-
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
 {
     CPURISCVState *env = &cpu->env;
-- 
2.43.0



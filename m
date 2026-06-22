Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7870CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:36:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkP8-0001t6-MX; Mon, 22 Jun 2026 15:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkOM-0001QJ-Ud
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:33:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkOI-0001vY-6B
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:33:09 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFVk5J2691562
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ihjj3C2nlHW
 Y9mPwHPQFkjWzNQOlvyu29eIM/9zvKro=; b=IxpurBErDgp5q2iqyvNJHWT7t4H
 ABcuAhBrN/PUe/74BVqGnFSVHo/0tFsukZCz03H1OhX+iGH1dvD6ZrJQOZMgJ0J+
 oFqjQBRz/+SL0UpHlvuFGaHenALraBEz1d+GRWf9x3Fmw4Nlbg/VsX53rWkHYuB4
 B95PqMjasjp8kP7nWtAyvK5Ql7X1AD3rzSCBBE1uPOuCTzbKtC6X/LAoD/a4ZSLf
 v3Tn1U7Z70/FHCm8ipBnyoBOiJ8O/fccdHDDan+Dnq+3wCYsGqSGdCyd9PH13kqZ
 nErlap9w/57Af2P/+AhkPGnLtnGGUb7OQorAVHnzSYsASzNcuh8gLWJsgwQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5sn1d4s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8dc4d71a6abso126254796d6.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156774; x=1782761574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihjj3C2nlHWY9mPwHPQFkjWzNQOlvyu29eIM/9zvKro=;
 b=Z1PS0zM3E6LviK5KgiM8cy+z9bqkAVCKjgYvcVHbKwR/vNbJrGiOgiMmooo1hQUJVs
 y4RPkP8//07v/E99QR1Yn1GmGTQ6SA4mkgllHwJGjRU9cjb5mcFVkr4/JJvaMTZAIrDS
 SCLcw0A1hucklqkxVrIXuRCVsAl86UYYCPRiNliwp0AUHNaW/sa0pX7PqgenNs7H5UrM
 WkTF/hSdGSC1IPWFzeMK6nO/sw2c4tlvEDfjXRrAodzg/FaW/bQh0EdGNgWf7u7z0oDy
 0BvnaHANdquQpzcG029qnlNAkEP+34TgKU9QlqEdLaP4p4DJo1oxR2zy1bn1c4ZvKxOa
 QDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156774; x=1782761574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ihjj3C2nlHWY9mPwHPQFkjWzNQOlvyu29eIM/9zvKro=;
 b=LmnGNEWVnoOcVNbkpW3TM9ek0lij04T8OTPnSObf283fK+mfbZgHT61tRfKC62XuCW
 JxoYUvdPInfJPLrheefaEyrB5x1mexnJoc2NG0uct6r9Jz1h51rsNv6F2IqDlbwqlMT6
 ZcngUyvJu6mH72OIJsCJZn9X6FxjospyUIWofxFAyCplIuhD47T4BInb3Mq2J8LvQyHo
 JqVxX26guEKEYl3ioB/kHEb8JygWUIkxm8g16foYPy9GiijBm/Nq+bCAEQv7C7INHlbi
 nIWpKTcJXxILHsEc3cJ9Vu7/WfI38W6bHMqyoegLv4HjpF4vf843JXRytBik8ebqiyOr
 HJAw==
X-Gm-Message-State: AOJu0YxxI8WNr0ZbSSahf9u1SsVD8HGCd7vMalmZ9HqrzW2tGYfSr+8i
 VW2pgIvUWdI4TGOlkzNoRDoe0G23d12JgsakYgaSM2hkEk+rUid2XQwMGCBnlWoAZICHPo2Uda/
 ngLdpF1/FfT6n46T8gO8GuPZ40E+MjiI7d7O2lTcc5UiH4HGDDhAoYk/ghw==
X-Gm-Gg: AfdE7ckiUdVg/msHp0v3zNAxGPA3yHxqpa24QoWtXvv52CTWd6kqi+yozVKh8EltHy0
 YooEga2T8Gcs9hxPbK6RkikXMacqY/op3s6c1mI25Ooa/8FBHJD0yjm4dVRYQzai65fFmJjDUmT
 ZEfPTkOo+eK8GvJfk6MYKlRpvXiJQu0kB4p7uMwZZr+pQ+6VpXum8nOhm77+cpAg8DbTm2wWQI8
 rP/1E6qoPcs/6DBSBdcfPNtc5TbmLtBMTZyHCaLY8tzXJKN/dEa4X3SHxPtgzS1HpBAUu1iKMNA
 1+MwgrXQftCXY0Eefot2/ic2DvCsVl4OIqxo8nT+Ykcaezwd5jvZjQzHzw1/Mc18RgbGmobRVew
 31FfOmKgnltlEP6nnCkWAT5syLPETjjDsilirV13ygl+PTQ==
X-Received: by 2002:a05:620a:a0c3:20b0:922:38cc:bb6 with SMTP id
 af79cd13be357-92238cc16c0mr1207835585a.25.1782156773901; 
 Mon, 22 Jun 2026 12:32:53 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c3:20b0:922:38cc:bb6 with SMTP id
 af79cd13be357-92238cc16c0mr1207827385a.25.1782156773232; 
 Mon, 22 Jun 2026 12:32:53 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:52 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 22/24] target/riscv: move riscv_cpu_set_geilen() to riscv-imsic
Date: Mon, 22 Jun 2026 16:31:38 -0300
Message-ID: <20260622193141.1449724-23-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: V3zl0n1nDHBwW0Xs7R0a3GGDvpz9Ush8
X-Proofpoint-ORIG-GUID: V3zl0n1nDHBwW0Xs7R0a3GGDvpz9Ush8
X-Authority-Analysis: v=2.4 cv=PuKjqQM3 c=1 sm=1 tr=0 ts=6a398de6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=O0V1kVBzSblzqwnZNHcA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX3TEiud0V/vKc
 a2PFNvYrMtzUHHMEgm39gEWfOq6jNqQXhoXXVWVoCvZryLhad9ia4RDS690HfzFsU/C5fykhHuA
 gZSsgzYynRGTytwG7G+Npq1NfpJYzUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX6+w2JUhvsUHQ
 hHw2kwHOVnuIKqIiJIPJtZI+Btz52jpHf9meSvz+bn4l+MODdQpD4lrqrpRThJKImzynKUHp+PO
 3YcH5NqnWIra0ls4ZAbF+Fn6IXmTZr2qH4Ww2op+lXAUAOFjPLpaBawElsmAxzaGGrDJf938Pan
 oNak67qAJuECkkN7MPnKdhkmzj/xeTlH0qCeyUE3paRzNsIrGjJ/yr/+TMh512WtARPimsCk/yM
 pVGvXVSpseJUOGkQ9pFOZ2uyvfzl1zMUGxZ4UEYcmZfYm9Us+nGvg/hLpGcy+YzEsPGnyQ6ILme
 mSNasuT2Xp57vt//VKxihau7Z9pTX/ces6UFIRbWyfWQ2Zq2r9EyWwdaShdZEQDqowXjACAvjbB
 Mzz3fIKqOHQLflf51SoTwMDirHUzNfTFtEAemCJdhTFOYlj6zRnUXeuwRjlPbiBg2v59gahCpIl
 HLIZpVzGAIcWMW6krcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220189
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

riscv_imsic.c is the only caller.  Having it sitting in the TCG only
cpu_helper.c gets in the way of --disable-tcg for no good reason.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
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
index aa67999005..65d77842b2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -644,7 +644,6 @@ int riscv_cpu_pending_to_irq(CPURISCVState *env,
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
-void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 int riscv_env_mmu_index(CPURISCVState *env, bool ifetch);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 1f13d257f6..3a4e86f6d6 100644
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



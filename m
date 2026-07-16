Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10382C4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:37:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLJm-0002j3-Ve; Thu, 16 Jul 2026 08:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJl-0002ik-Dp
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJj-00074N-Jn
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:57 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiPer2824082
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xVKgmhrQqCG
 5s8l5RR3FoMoYNCYBbCj8oJ/t0N3RTyc=; b=SakO2QoPkyZ4fAb7Kd0zWOJ5Sfl
 FgyHZ6P6YL1rlyKWk1Gz/bcitfpaIhVm10iqmZ8pz21viYZG9SZEPp4Kums6wQ+V
 1FOHV055cgsgbdMUb2OyV8/YsI+g2aQ8eKLUa2bSIl/4vl0noDw4sEmeCTNwb1DA
 Pc2jal5oLi3ez5fdbgX+YyKDZ2bduKNgP7lWIXTN9HXMnFTFifKRSZ8oCqANi2dY
 m9qCLjmL/8t0vrq48rXtDd9gQFUB04Up7M20UrIhN0Y7aJnUrfQODDK9IO7dW+ar
 Hd+AfUi0r+Su1ZH8Qf7b931SpnGslHgYLdk+OjiS4nMFJp+zcbGTGCsUWKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf1bmp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e9a2b95b5so680793085a.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205353; x=1784810153; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xVKgmhrQqCG5s8l5RR3FoMoYNCYBbCj8oJ/t0N3RTyc=;
 b=TYNhM7+qU7tlMpVhuDeYxCuWp8GG/tS/ldcRTD4w4O2nGi9xe8dj2C9W9lULsjc27n
 TFNHajzA3bmo1oVtIK3nrYW58Iqe1RIJBydk45KYsJvOCXnm0Q7oGhHNk4DAq2XRZ4JQ
 qB8HqG1/Ym11jHdCsJLCKP4ZldjyWZDFxkhNjVFsN26QoqtdzC7HdDQJtgaqLraXD+eP
 XDmA/OmfLE9KmB9/NSkEysSr9sLYtn7ytAUaCKl7JVOHJJ8goP6FQ9C/Y/9o4ixloPZD
 MHntNayXM1ddCIPVvYDE+fI0rVwMPGA6EAmD3xTAjH7+fM/RsbQgH3LpmeqcBT+rEPvg
 UiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205353; x=1784810153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xVKgmhrQqCG5s8l5RR3FoMoYNCYBbCj8oJ/t0N3RTyc=;
 b=YeQdC3M00kp2nN2G1TjTxyrid4+yPYY0Az6aGLLgA9PdcPNcSzl6flxKA63otlV2Nq
 eHaR9OLHNKusmOdqGDFUYEW4i+EJcH1m9oNZzf7HSvkT1QWquJmIGVIU38IbhwGBERZu
 Y16n1CaaHMIrFcmhVDlUCAQyYx3lfU2znCVvSAyvI8vufe9BFiM0W6NsAr5jOjeNc7g9
 JgButBsZh0XH6qpDYbdZBGIRxJ6nSM5E7okBBRVdUDaj7njb9BF1zSaC2gp6zlJiLtyw
 NRNQbkjloo2FjyNAkCaxwSHBE1K2GW7wx5YZpvZETj+867mHW98BmJMPwcvZwdB0pCJ9
 NJrQ==
X-Gm-Message-State: AOJu0Yy2fYgHJ6qG8YYP2S+pzA7P/yfRkkEnLkz17VJFtlMaZ9qSF+uH
 0CTEwt1P361Golbxv7D/YTFUtFSJXxzHevGEEuUULziWYvs59uFI344Yi1lM7DYhtvFXYV9n9fX
 4yfJbZjff5I1aYbl3LEE87e2DZgRX1Ue3ursBakkAMoWiqNIdj5PVmmpQJw==
X-Gm-Gg: AfdE7clUKC31KDILsQ7vxkhHJXPqd/iNp+q8tfnwldk1w7vVcdOrc/2vGek3DNNFLsf
 Jkkv3hijllZoGgmva4gv7QXMPjKG5sjQtdu04vZ/bbwSA9ifsycaPjpfcePqSCzMWy5gIjiDOxS
 rQCFrZ4Aa5q+/uoHPbRUg52kR8zUvtNl5f9PGupAn0oH97oHV4Na3VSI40+gMhCvWGsX6oQqvdN
 0bH8SmYMBCsgaFoGu6GUZxutPmEmmPWid9/pdqDFwsefdx/f+Oy6F1cKni3WR9In5yV9UJf/k3d
 /dKHAkGzL0ZHTg18yMPSRoAkCDf5aKcw2GTSGj821XudzYQlYgDEff291oDuoR4Gsn23AKZsV+7
 iHT4OAgOq1cLcVgfVXDYPCQ+RLw1JNLW28bI=
X-Received: by 2002:a05:620a:28d2:b0:92e:c118:18a4 with SMTP id
 af79cd13be357-92ef2c825dfmr2250868085a.87.1784205353326; 
 Thu, 16 Jul 2026 05:35:53 -0700 (PDT)
X-Received: by 2002:a05:620a:28d2:b0:92e:c118:18a4 with SMTP id
 af79cd13be357-92ef2c825dfmr2250864485a.87.1784205352911; 
 Thu, 16 Jul 2026 05:35:52 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:35:52 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 04/17] target/riscv/debug: Fix icount trigger
 privilege check
Date: Thu, 16 Jul 2026 09:35:21 -0300
Message-ID: <20260716123535.3709148-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SKAf_w6AComeb6fNI3vQS9PUbRC90Z0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX2MIDYJmbKjHz
 G/a5dAeh7Bw65G/X5zUKpMMWCsoGcYSPhc60nyb86n/uqAIRZ7CnpbBb4m7zEP+kWRdvpPbGoxh
 T/f8WLuNP9n1RxMwkfPSqRRLuKDvDOJp1PU+LwU7z0Po7yDsvDtuqLjezUxAi4waUzHxiDOAZLa
 Zx1sULkaeiVpCFl3Vfjn7uhZaGq6gchrrXIqN7iEebdWW7yKG2Zqg9QHbjiEwy9EXoc/MUag3ib
 9WZbFYy7h7a2um8hu79UYGli8L8bYi+bZJlZpWnChAMqvPXIlCx6mK7ipZ2Hhc+7DTf/xep0s1P
 tPpnjQPHEVb+JVBpWT9DIP2cXuQfHcVD/B1wPTz+4wuigoJGblEyGUS5S/nWZa3DsB2tD12tOX4
 acx52c+8XAvyWLNvaQ0lRK2hZ5aFqi2PeBeMud7AKiuDWK6/JJHoTyU7UFCqCnH0D2a7sfpv2Jb
 4Na5LyjIkIfb9OkdbwQ==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58d02a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=lykhd8fEm9kB8mzSwosA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SKAf_w6AComeb6fNI3vQS9PUbRC90Z0h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX/flo68KcWXmm
 V0W452WLRUQwAv3L26APT6jGRWIxHTZ/K/IU0Uf4gAOv61FOambaT7KHhbXEINObdWxNBaE2jS1
 iINUKq8utsnN1MFtEm7B/UQX+x4PFJg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129
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

From: Nicholas Piggin <npiggin@gmail.com>

The check_itrigger_priv() did not check privilege bits properly. Move
all priv checks into functions and have the icount check follow the same
form as the others.

Fixes: 2c9d747121 ("target/riscv: Add itrigger support when icount is not enabled")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
---
 target/riscv/tcg/debug.c | 82 ++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 45 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index c7cc67e244..3c777694e5 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -308,48 +308,50 @@ static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
  * Check the privilege level of specific trigger matches CPU's current privilege
  * level.
  */
+static bool type2_priv_match(CPURISCVState *env, target_ulong tdata1)
+{
+    /* type 2 trigger cannot be fired in VU/VS mode */
+    if (env->virt_enabled) {
+        return false;
+    }
+    /* check U/S/M bit against current privilege level */
+    return ((tdata1 >> 3) & 0b1011) & BIT(env->priv);
+}
+
+static bool type6_priv_match(CPURISCVState *env, target_ulong tdata1)
+{
+    if (env->virt_enabled) {
+        /* check VU/VS bit against current privilege level */
+        return ((tdata1 >> 23) & 0b11) & BIT(env->priv);
+    } else {
+        /* check U/S/M bit against current privilege level */
+        return ((tdata1 >> 3) & 0b1011) & BIT(env->priv);
+    }
+}
+
+static bool icount_priv_match(CPURISCVState *env, target_ulong tdata1)
+{
+    if (env->virt_enabled) {
+        /* check VU/VS bit against current privilege level */
+        return ((tdata1 >> 25) & 0b11) & BIT(env->priv);
+    } else {
+        /* check U/S/M bit against current privilege level */
+        return ((tdata1 >> 6) & 0b1011) & BIT(env->priv);
+    }
+}
+
 static bool trigger_priv_match(CPURISCVState *env, trigger_type_t type,
                                int trigger_index)
 {
-    target_ulong ctrl = env->tdata1[trigger_index];
+    target_ulong tdata1 = env->tdata1[trigger_index];
 
     switch (type) {
     case TRIGGER_TYPE_AD_MATCH:
-        /* type 2 trigger cannot be fired in VU/VS mode */
-        if (env->virt_enabled) {
-            return false;
-        }
-        /* check U/S/M bit against current privilege level */
-        if ((ctrl >> 3) & BIT(env->priv)) {
-            return true;
-        }
-        break;
+        return type2_priv_match(env, tdata1);
     case TRIGGER_TYPE_AD_MATCH6:
-        if (env->virt_enabled) {
-            /* check VU/VS bit against current privilege level */
-            if ((ctrl >> 23) & BIT(env->priv)) {
-                return true;
-            }
-        } else {
-            /* check U/S/M bit against current privilege level */
-            if ((ctrl >> 3) & BIT(env->priv)) {
-                return true;
-            }
-        }
-        break;
+        return type6_priv_match(env, tdata1);
     case TRIGGER_TYPE_INST_CNT:
-        if (env->virt_enabled) {
-            /* check VU/VS bit against current privilege level */
-            if ((ctrl >> 25) & BIT(env->priv)) {
-                return true;
-            }
-        } else {
-            /* check U/S/M bit against current privilege level */
-            if ((ctrl >> 6) & BIT(env->priv)) {
-                return true;
-            }
-        }
-        break;
+        return icount_priv_match(env, tdata1);
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
     case TRIGGER_TYPE_EXT_SRC:
@@ -667,17 +669,7 @@ itrigger_set_count(CPURISCVState *env, int index, int value)
 
 static bool check_itrigger_priv(CPURISCVState *env, int index)
 {
-    target_ulong tdata1 = env->tdata1[index];
-    if (env->virt_enabled) {
-        /* check VU/VS bit against current privilege level */
-        return (get_field(tdata1, ITRIGGER_VS) == env->priv) ||
-               (get_field(tdata1, ITRIGGER_VU) == env->priv);
-    } else {
-        /* check U/S/M bit against current privilege level */
-        return (get_field(tdata1, ITRIGGER_M) == env->priv) ||
-               (get_field(tdata1, ITRIGGER_S) == env->priv) ||
-               (get_field(tdata1, ITRIGGER_U) == env->priv);
-    }
+    return icount_priv_match(env, index);
 }
 
 bool riscv_itrigger_enabled(CPURISCVState *env)
-- 
2.43.0



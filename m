Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8764ACDB475
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:35:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkP8-0001t4-Lb; Mon, 22 Jun 2026 15:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkOQ-0001Rz-VN
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:33:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkOK-0001vq-Po
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:33:11 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFY9Sm1406657
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=iMdm/ny/73N
 EbE0ZipOIUchBEo+OzplpsDTdm9KL8GM=; b=bjex5AV3KwVF5F0U+HZ7/KtrgkZ
 GfItF2PDgFOwYZl5Txo+GKoBHjPb98lky16kNPyFI4To8PTFoUT7M1NVEZsrLas+
 2FNuyr9iThCzUXwJZGZDD5P6PwBv1TtWehSoMXtDCU7yYwKDulZSElXENwmf1rHT
 55+jAXiOcd2kYng7HXujFvt1fKz2Lbgu42UDqUsVCHQSa/FPd3ISplQt9017D+KY
 dy7QwwBLmL10hNAz8v/NDh0FvRuqWCbwcQ4nqC9XLMjEyW4VRAB4XTYJL+cx3qMr
 Qw5yXPwKnUs3Mx1dVpzCtT3zeGCzznBXvQRtkH4/ohOpoIFqWm6axKwVQzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5ye9cg0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-91e59716176so800122185a.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156777; x=1782761577; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMdm/ny/73NEbE0ZipOIUchBEo+OzplpsDTdm9KL8GM=;
 b=dTon5javFy0Hp62EsOqhbZ5ChZBamUXGBbGjdQspwYhYhCDTiMNloALLxHSsRuCU61
 R72L8UO6asMezP88OiLWnF9bmh65SqwlJ422i7Cj/gGFT5zOSLACa78UCfaNKailnB7F
 v1roDH1gnfAhlCbOrDl9Txt8Szp5wfaGp1amjOzKvjFrDEPZZYi/9VxMWzqwxqjZAbGm
 PuD5sTzZFhT+o/c4FzNwKDP5CYR3nZCQOEFXrRWsPF3wBg12anMIifuypbozkiJ7xSah
 aVE/Y53n/aEXd9Dxnekwl7dJRNosSvz2451lwZa+kFTZp2YgSusVS/qFbUf3epwTBZtk
 xXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156777; x=1782761577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iMdm/ny/73NEbE0ZipOIUchBEo+OzplpsDTdm9KL8GM=;
 b=IVXEhFJgB5qx90bs8aZ9aXOXK9YsHVUCgE3O7mXVen/D8OsgOmy1VedAprHJjgei3f
 ejllJf0lD1/OXRfHm7hifUsryTgg4Ho3ZnLsNnnx4WHNFXnOnKZfDNqp+NzDpszFD5be
 RT7KujtHSFZotCDXxrOB36LsaQyBhEUCCwavtzV+uCwSzMsxN93/4KpfjwFUKu9mmR/1
 hYq46YWZgTwiWieAjzdATp7e/aTUeqYPLT1RTPAOfndCbJ+R0yxefpu691TghelVlSKy
 63gy33RXMBku7xhZEhCYjt3w5ZWB3Q3WUf88x/ael60G+wzhTN+BgNJr7C8Q8fXfKLzm
 /CoA==
X-Gm-Message-State: AOJu0YzQ95jjWjDoMo7bBP7fwaCQpCARW2fKzVxT8APCEzpcB/rlT9C+
 Zecn38OL8C/uXfoFJ4hnBSGZAONSRY33JiHQNXDj999ca+QV1O8wfg+HVNv6HI2OQTPxCfizOZ2
 Bqe/4FKbEgTzMvNl5dm3uBaM2YUC5q7q+R7oAMqa+oYPWPtw1hqZFkuKG4Q==
X-Gm-Gg: AfdE7cnwX3dXrlX956v19065kxvhlGGMWWTN2omwDp4lCDQrs1IKfidOMfm161tbp9a
 vOMtxMT8zjeNIcwygLB2dWaFKpLuPM3RABlhvaB0A762avRWkW9OXYj4Ty0orqRu6Bm07NBV5Hq
 Uq5d7bLS4VQK9OthBXTNfYwWtEPqSNpqZgk9nlmoXoyB7nAMHZI3Jfj1BGLr+VO69TavLwAQy87
 oovp0uKDcr9O5AtmChR3tUsPBn1n7/CezmVUOsWAz1qrr1SiTGgyDlijuzVRMv6g3jOZajNXAYL
 0I1CBiNWzSWxdHDEcC5L4j3kLhD06Ly5xX+k7HmMo/8iDMAIXoSKNYMnSl/A3+SAIQCWeeJmgUs
 W7/h9z7yIHjPw1Z2uHqlx2NuROj52djSw7wSJUpKIulXJjw==
X-Received: by 2002:a05:620a:370f:b0:914:b9a2:f29d with SMTP id
 af79cd13be357-921d29fa263mr1584856785a.37.1782156776356; 
 Mon, 22 Jun 2026 12:32:56 -0700 (PDT)
X-Received: by 2002:a05:620a:370f:b0:914:b9a2:f29d with SMTP id
 af79cd13be357-921d29fa263mr1584849885a.37.1782156775894; 
 Mon, 22 Jun 2026 12:32:55 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:55 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 23/24] target/riscv: move riscv_cpu_set_aia_ireg_rmw_cb() to
 riscv_imsic
Date: Mon, 22 Jun 2026 16:31:39 -0300
Message-ID: <20260622193141.1449724-24-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1y2g1JQ7KlQdXvkM0S5pRlvep24F1-N1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX5wMjLLp57JN8
 zMJvaOGGvpUckS3cViarYGHiU9xM88YmOp+bKkwpjIdYYGfdQMqEIU68sV/Iz0wCWnF/y13fySo
 Ds7q/ylm2Hssdyez7YFdiAH76qE9/mM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX66RdhIfJkT3y
 g/nhnhDHoNnSagHUG82cb0LbAgMSwv8go+k3qgVv6XCgBr0ub+fNFpY+j18Htp5nyZ19U21HHjY
 sswtccL8CDeE9et9u9Q4j5czaztgcudNtxXTVzyavy2TDRAenEAkKKn+YA+HwHwVlDNPDiiVBEP
 7gqhmZcqEzzfQBpRo6m3RjIAUiKy8TJizvXeDomxo7nVP1jSiclVKwqyRniKYsJ3kf4KbdCjHBG
 AirV3dzhknvGaQl4KJNCckVArw2Li5jfhoOAuD4L0Hb4L0ujutJmhtYL6TMgnnueGR1OkmWmElu
 YagDJU+pQI8Q834cetjQCVUHgmZOxC91lWYliPG68/0/Svkuq1ZTUq78ayndpFxikaTJRS0ZiWC
 o8VSYXVdJTMmR2J3K4WJTjYRVs8tRZEvP1U2kRs7S3OwDynZc68cfPL0CE7CpY8MVsR07Ae0nL6
 MCQfgOKCmBM9RHV5vHw==
X-Proofpoint-GUID: 1y2g1JQ7KlQdXvkM0S5pRlvep24F1-N1
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a398de9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tRk87D2_djSq5c8C55gA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220189
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
---
 hw/intc/riscv_imsic.c         | 11 +++++++++++
 target/riscv/cpu.h            |  3 ---
 target/riscv/tcg/cpu_helper.c | 10 ----------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index ebb55191c7..d6b46cdca2 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -376,6 +376,17 @@ static void riscv_imsic_reset_enter(Object *obj, ResetType type)
     }
 }
 
+static void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env,
+                                          privilege_mode_t priv,
+                                          aia_ireg_rmw_fn rmw_fn,
+                                          void *rmw_fn_arg)
+{
+    if (priv <= PRV_M) {
+        env->aia_ireg_rmw_cb[priv] = rmw_fn;
+        env->aia_ireg_rmw_cb_arg[priv] = rmw_fn_arg;
+    }
+}
+
 static void riscv_imsic_realize(DeviceState *dev, Error **errp)
 {
     RISCVIMSICState *imsic = RISCV_IMSIC(dev);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 65d77842b2..e0836c986e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -677,9 +677,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
 void riscv_cpu_interrupt(CPURISCVState *env);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
-void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
-                                   aia_ireg_rmw_fn rmw_fn,
-                                   void *rmw_fn_arg);
 
 RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 3a4e86f6d6..2ec1c3f079 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -590,16 +590,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
     return old;
 }
 
-void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
-                                   aia_ireg_rmw_fn rmw_fn,
-                                   void *rmw_fn_arg)
-{
-    if (priv <= PRV_M) {
-        env->aia_ireg_rmw_cb[priv] = rmw_fn;
-        env->aia_ireg_rmw_cb_arg[priv] = rmw_fn_arg;
-    }
-}
-
 static void riscv_ctr_freeze(CPURISCVState *env, uint64_t freeze_mask,
                              bool virt)
 {
-- 
2.43.0



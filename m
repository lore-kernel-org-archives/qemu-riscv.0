Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0E8C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:57:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHqV-0003Sv-8I; Thu, 02 Jul 2026 09:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHqR-0003Fw-9W
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHqP-0008Hs-Nq
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:47 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0ZX7522842
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0BdpKklJEsZFSAAVVOjqk88FpFD79mj7L+LnUNk4zJI=; b=DVQTSfmHzQhhNPx0
 AsyZjlMPFU2joGU4GgGcoHtw7lEJSrNqnlUH8n9yIkgovRpg8gYJOL3V/XksEQ79
 oCB6+zL9U9rumaEHRH5cDoeryo/BVYnfLcnGuZFgtLu19PTWUNvFqW28BdFuu9xO
 2E/O3AkPWylEemfISOzOtFrwH/IXiaAu+PXMZYuMUsgyE6rZY3kvhc/SVWCdiGGQ
 mMV7RgeT5igr+WR16NP9Ecj9clF/VVg2QwN9GQVfjrUTSF+Ss8UrxET852ZtXTug
 lYwnh0QGZHdU2VvrRBxIOne2R6mqjCal1Mnhn6R0wKYgyaEXxcj6HzvAyj5TN1cD
 Iw1pDg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541w1an-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:34 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-96925b219aeso270704241.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000354; x=1783605154; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BdpKklJEsZFSAAVVOjqk88FpFD79mj7L+LnUNk4zJI=;
 b=JDlZSise1dbmUd1MegKMLKN1zXoOvUueo3GxGH6i1FT+iERoLRbFpZoEIv8JvjXPCe
 RAPahEiupXYtUmzA+f+fhYnSGeI9OV9yxHLhDbnMoGHfjS33srr/phS2FyxwyKmQj8GE
 6M5TQnzFfYW5Tw9SzEcmhM6U9sUqE4VEfBgk3sIUbDSQt/ZdlRjhLW1CG7lrEF+jYAkE
 4HvVzH/7xQGbxnQO3ZzT3NuoxEiHLwVmpQy/GwzuWWqwgolmJZcCpHJXtneHMZqt+vii
 hCQoUzQj4SLRf1Gbrg+VtpzrSbk15ubzQauB21e5fzGEK2NkOz4kOwcTInPngXmymqop
 Qlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000354; x=1783605154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0BdpKklJEsZFSAAVVOjqk88FpFD79mj7L+LnUNk4zJI=;
 b=j+vKRFQgVCbLYEWx6fsiuniQo9Qx3zIVPuJYQsEfAo4m1PAKIDu1giFGa/Evtx7edX
 Wm9vdFVEdssRL3B0sUN/Z1VwUNJcKGqjoGf3VR4ibFjwKi9wCYL/YAtGvCkNuNVEWwKv
 xWIf05vkS5tCmekjIaYWo2r5t5rE1nGtHHBifNJxii2WLrUz7va59I40CZ8MwsWgcwHx
 Yhz73WbvuQQIDPpmYd07B2SRLcpsm/q4Y06Cp2xfD0qkTYFEb37Ko/dnb8P8R+nmxYPi
 NswtjtzafVvk9y35vQFZo6l8BgtL1KAsLqSo2++eDfM5Xjkbrjbze4FXwdQvmYN2YixW
 AHPw==
X-Gm-Message-State: AOJu0YxWqXJuu2Jjyb3lUT6zotWc7hPJsoUOeFlYgGVmVRxfNEU9Mh6d
 IQk6o68TMqUXRj33GHCwiqL0EtW/513TTC/RNqavAoUwhKVG17yXkzzoAq5XrGl7bZxEQDUUJ9y
 XmqQcncIh2qM9JefOw7nEfpV45osKpkbWo5cBFmIjwgVAfASwrG/9FTw5LQ==
X-Gm-Gg: AfdE7cn2NAbBFXYH7aIkM7HaCxlsl+u2lgET0d/lrKjSr+D4ANEUcQWMvR/NbM45hNj
 bS8WHkwRPTqXdqWUkQ+k1PDAMip47CgZTS4Bd1C0k1d75IskApaH1LgHDUrP9IPNsM2ySmaCPVN
 SDgKl301BKxmV71u34d9eTz1dmjlwV2Pf1aoMbTFtuGUVLtzE7wueC+ysrWg5oknHrGCczv9sPn
 FIN+1uuySOO1KynpSq5f46UPBTozhK8YsAdyDRMz6OMp4rXFgoSVvzwXIEXs7Jv5kE/FkA979O2
 NivDlr4e15eoZOVbZ2tfXhvqG+vSpCBtuPcvj/BLfKpozAbeVTTDaILffP1cvMNpKigY4j9KkLr
 UYBq0pZ3tsfUtIx+Ccu8dG+xjEtkckjgmTY+mjh4JZIid+Q==
X-Received: by 2002:a05:6102:e0b:b0:737:ba2e:8a29 with SMTP id
 ada2fe7eead31-73dc05b5f94mr2028000137.27.1783000353868; 
 Thu, 02 Jul 2026 06:52:33 -0700 (PDT)
X-Received: by 2002:a05:6102:e0b:b0:737:ba2e:8a29 with SMTP id
 ada2fe7eead31-73dc05b5f94mr2027973137.27.1783000353129; 
 Thu, 02 Jul 2026 06:52:33 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:32 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 23/24] target/riscv: move riscv_cpu_set_aia_ireg_rmw_cb()
 to riscv_imsic
Date: Thu,  2 Jul 2026 10:51:25 -0300
Message-ID: <20260702135128.1188021-24-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CSLIEJASUMH8zwOsHuzIesFLWsVQxcX0
X-Proofpoint-ORIG-GUID: CSLIEJASUMH8zwOsHuzIesFLWsVQxcX0
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a466d22 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tRk87D2_djSq5c8C55gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX77gf+iqjOp06
 t1MWbFiNQe1ADb8dFNDRgmh8rdkx2U9+EfIKAZFqGq11hPYZgD/LHMb9nYPF77kiIipoefDSj9/
 eKLCFs7IbGacbw/9J5xLTR4nKTwevqISw2D+7PW4UThhW9rEtqEeqx4FT/ri8b+pMGebf/LGoQo
 H0WivMRi5984Acb72IUp9RiMdndj01MuEgt/FsrS5yG/mpfMcNIq7uH22DIu001MXSIRmOAqvyF
 ZkAzIGwXYAKeHst2xgQkXTxQN/7VAPiXnIJnZ2vwYZI13yvv4zMKmOreKJs0mHeu7xfIVEPguss
 I4J13NS5+Qf6k9xUoZnX6QlvqztNjnaMmsrAp2lbWpn1VubDIX6mD6zIpu+5rNINm8584ahgrq/
 LjA87G6QU7hk07ovXhG4R1IBtpsYezh8aM3HiwA3aU9Mfu5ucxY7nIcVB7NOz4xDV4MMZTDwkuU
 72mF2C9/ZTQXgqL8xqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX3ViMAK0c+WKW
 8nFIJCSdhaOaT2/gC7xUwf90Qt7EKDf1VH1DjxNdjPTK16iSmhxvlSuWuMpbQkUtsHdZGCbKGvD
 wnCN/FpkQsJ8pyT2ro7fybxnnhBSeuE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
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
index 7a4d8abe07..c9dfa7daff 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -680,9 +680,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
 void riscv_cpu_interrupt(CPURISCVState *env);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
-void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
-                                   aia_ireg_rmw_fn rmw_fn,
-                                   void *rmw_fn_arg);
 
 RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t bit);
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 71a96a20ef..07d9222652 100644
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



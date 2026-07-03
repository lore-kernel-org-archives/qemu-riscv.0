Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4B6C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:11:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiIP-0002fw-0q; Fri, 03 Jul 2026 14:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHz-0001nw-3F
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:07:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHw-0002Px-0F
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:57 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663Hicfw530762
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0BdpKklJEsZFSAAVVOjqk88FpFD79mj7L+LnUNk4zJI=; b=XaCoTdUnrYqJPJNq
 PYkIVq/22gWxtUWmOHI+W/XM5oU/t0clOH5pSWuqN2ZS3w3dUj+1ebcHSr3XVUDM
 gpkcQwuL3hXB8B9YhJKxcH4IdzjanrEn+XOA0t3bOBaOqL+gfmPrBQCI6Ur4zExb
 X4HbMIBSl7TDKtQbA52rr8QK5Jt1uFlsDur83nmmiRs7NyQZFIJdhvBK0S5B5ear
 t0pKtM5XE/vdg4H9YE9hBIT1Bu1WcKoU4lH1CFqRmikNWq4Af1tCvyvqei3ugiQY
 L/JEDseAEz9K7QnOeviupbO3a0oF1vz5jHW6tSBSRg9tEKHMDmqFwehF4C/DTzdR
 d5TAPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n3gw0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8f0867a75ecso16980866d6.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783102014; x=1783706814; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BdpKklJEsZFSAAVVOjqk88FpFD79mj7L+LnUNk4zJI=;
 b=dQxP6RDhmo0mZGMgfRcUY3dTNuaSz9BiliP813ubBaNMDsTuZ1YfWdEYonV18Y4LKC
 YIEs0NhJpPEFDYRKGDtjWXn7ThwcuzemFCj6+8YZrLY/me3HOCDmY/q95jrIwdKO0BwY
 WqWWLgtOcbjEfxVrDvHw8dlWDwHEcvAYswBumNgRmuGKgWKldZkv8DishZCL0gSlLiJR
 HzjZtxec2uiPDF7rFXxd/cqnvqo91sJrMss9M7JNjcuwjVlVsBhtmUPuPxyGfGEHKT8v
 S5gxGSp9gKj5TWadgwBxI1ZIdhr7nqQVbb/s3G3QXVCetB/HjLxliBFWmIbuVfG/UdHC
 QqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783102014; x=1783706814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0BdpKklJEsZFSAAVVOjqk88FpFD79mj7L+LnUNk4zJI=;
 b=m/lDimwdYjLFJjEAhK/ecLZ0FDt4BJASJw4yYQvGz/hW+D3Ycb78ZCelA8JBSF5mzT
 N2gg9FoHwogCa4k+yPW2mnYCHgMXSuJmRcExyG9dj0bs87QOZto5gmZxBXbvgWbw65Tn
 IwoZtlqXoBDDtd30du5VZwoSvB6n21j0HfgOKxbPqy8v7p5hUeOUgGbdwdIs711jqBxl
 LAOtAVptyNqs1DsJcAsUK0lOd1vIYmweFiHjyc+nTbtVRY1SPCXi5dlF1HuTNtG1UP6z
 wM4s5ydAxY2yTqrpvLVYOTkXEmXN4MAt+WVyD0K1IxjE6NpEDiPPI+D8wrK7fDr9Yl7S
 /lZQ==
X-Gm-Message-State: AOJu0YyOQlrdtYWSaD9FCuV1MDe5Uh/sqeRdLsqihzFGGkuD6hSxHWcJ
 0WKk6Z6R7e7etyNi2MHeEDyzbRvX/EhSo91p9BHpFKUqMbTllTQTZBiMyqubHWBTZG5l6shuwlu
 WJHbZuNztn/Bs+IMvBtue/1JvOkQqxATvw/tbh9FomLuOaZTKvZWOMdcKPA==
X-Gm-Gg: AfdE7clbK3EVcGvLNkTnV1Ojrh/a5ffAcSArx8iZzoTdZqgTn4noUmwpznJuNBCqOOc
 u3rILu/aO6IAPahUbcPLjM/uUx85X5K39Te95plWEMqlBbnMMTtlereGlQ5qR9BX0wHxRgcUuBg
 aWorIBtgxVf/zuVi3ZB4VFHXLi0OeRhdrbf0phBugyfEx2ITlUxSdBfuus07/1/+LuVglywjQz4
 5l9A+1TGNvWNGfhpMawUD/65enGJPRpvN8OS53HkvuztfHhFKzJcH+njpupIYJo9i2wLheh7NZN
 RC6UwZtN/ozpI9F2fAmaJr6jN0h1KzbEGqPtpja7cDbUXb8cFRRYZ1FX7Je0rJbgAntSwYvZ8xc
 jEWYAmfquVlJPsRGT0Ph/SFvnJMSEHlF4uymBwUW6VC52+A==
X-Received: by 2002:ac8:5906:0:b0:517:8d24:64d8 with SMTP id
 d75a77b69052e-51c4c1f1d3cmr9043591cf.13.1783102014382; 
 Fri, 03 Jul 2026 11:06:54 -0700 (PDT)
X-Received: by 2002:ac8:5906:0:b0:517:8d24:64d8 with SMTP id
 d75a77b69052e-51c4c1f1d3cmr9043081cf.13.1783102013959; 
 Fri, 03 Jul 2026 11:06:53 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:52 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 23/24] target/riscv: move riscv_cpu_set_aia_ireg_rmw_cb()
 to riscv_imsic
Date: Fri,  3 Jul 2026 15:05:35 -0300
Message-ID: <20260703180538.3346781-24-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX7AbqYyQ3G2/5
 ygaAeKsiSmDB6YwxOLg44rXNTVO0VuxxHuUM74BVk4r4SfAA9hb5VciIRd9+rbtPcBiB9ncZ0Md
 DORIwndTSnTlHf9O90N6QBCKSjXYgU8=
X-Proofpoint-ORIG-GUID: zH404kyXNrjVDjg0hCWBLc4xKr8IhDJx
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47fa3e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tRk87D2_djSq5c8C55gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: zH404kyXNrjVDjg0hCWBLc4xKr8IhDJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXydCaQeDZUUSt
 Yx7xJZPZ1vEhQl/B41AhNDI8+RTqLnTrG7fOtNdcwNZlxapDQt44ZO12PMUzlnAPgtKmb1l7O47
 46bdr3hqUF8NZFBzL82EcrMNMWUuaOR5jbdbEW8uwa/y04NrcY7QEL7TBzpLpNpS8AbpB1/fulI
 3W3Fd+0NrINr8n2QGMsq0NbV9iRnXO5BfkwYY8eMm52eYdJX6c4kYdtSta+ZUB9reX3aDJCOiXW
 zck+xhHUYE+lXit16VME9lcyVUa3XMapIXEtzvFaOB/15yfTN1U4+gAge4JqjjsGJ9zgeNpghqz
 7W2APtUD96MF+E+3KGVbI0f/obwL6QaBqyuCHL/PtGJz77gNPD26G67LwNgCqX8vNxf37EAtocF
 0LOqt7T39HdWbk8Zp8RtFIl8MElamGb31ETlXfJONYNZSAye+rQJ9DDC0o4Kf+lgJ77OxKcesv/
 kFhUkLrhPFSg8Axfqjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



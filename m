Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48286C4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:36:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLJk-0002iB-3C; Thu, 16 Jul 2026 08:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJj-0002ha-7o
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJh-000749-IZ
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:54 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiP4q2824057
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=dqyPARbkh64
 mZ2RIOOLnv5zdbrEo4chMNue1KyyBAxw=; b=LVYQNupj2926xBgCnYjGOjHuZ86
 WM+GhzooHKSSU2AUJ+g0aNQbrLhQ8OoKnZG6c9zEvVSklZ4gKtP1E8M9Mbyy8PaI
 RNt0B60qrBIGr+hCC1IoEv74fb2wg/K6nG1zM1Is0aXz+LIwaVj4PqYqhQbOZ9Pt
 zLrX3Cw62zIl0mmoWfCjY4nls3tofGABmTcbiFmiZs6qPScU+8Jh8sBOk7kTpVoq
 /UdOzP74cP6dq4xqgVMSmkvpurIyRTtw/MLjl6yvoxff/43fXFm5FXILMdtGoQ8Y
 58dcCvwXRwEFZy/JaBWWOrD+tXRS82V/U+JpiZvLf2tT0t4N9jg8vVV6wGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf1bm8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e62e3459fso1018083085a.0
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205351; x=1784810151; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dqyPARbkh64mZ2RIOOLnv5zdbrEo4chMNue1KyyBAxw=;
 b=knVK1JnfvGnoKcZidkEV1WUYBwTYBRTb4JXrUWsSCgu5uO42CIyblE6tn8tHh/HmdF
 MEFpR2FMUJaz5JuihuUCBa6YrkIkshk8tKyTgwyZrKZdVzZ8g4hH8a4UA194W2GAnQS7
 e5SpUdMX/zkg4X6M7igeYRd7aK6ckBIw5OWeCRFjW1QHoAkb8YZRD7HGOnb08eq4G7iN
 2jP2c8Kd+qG5f/4thUJ8gmmpk1Gkg9RbtOdxxxp7Z0Wgk/X5PJiZc5+3sCz67WRU6GZ7
 QeWi8hUPLu97WqaIq/WOOK4DvTIF9P33sIV0/K4R3uJT0PtbZCLQOVP/BA3VdXht+jQr
 5K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205351; x=1784810151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dqyPARbkh64mZ2RIOOLnv5zdbrEo4chMNue1KyyBAxw=;
 b=YFsZ/FrHn8+oJ6dIlypIjn8wUW3/t9+cjDPPryeUDnxKzELnPk1BAl+IeiLg3VOfD6
 9O+GFmzbViYm3aiJUKUsSY3Zglh72xQ4FGI7olPesm4cyuQ3FyKmF3WSwmboXAHLwz0c
 Cx995NCGiwWdKnlxZCs+Zos6zNpyN8Ozea3qlZLh3b5TWo5fUiYm/qUwTPyC+dZvtLRO
 Q0CBrz07RlQDCwZEw+/A9/l0NYTZXyyXOTDaQ63zI14mPlrzFYlSchYI4BfGmueiOLpy
 k8bnmah0MmUPuRUM4MY3cuV64OMBJSUQgq5011TJGcNyr1wD/1jY+gVy1v/Bk3HVyWU7
 4WWQ==
X-Gm-Message-State: AOJu0YxINiYjXMUglCdE5BzezryvYNGQts7M/Dw+zgwGSR3e7SX2jSt1
 j7MScBr5W8yprRO93q2kb6KtPAatuvwimvT8gE3eq1xBL0LjOZC2Y+2dkIg9ZBaK52p6p9bHXmF
 Wth9pejfj6xq3WbcGELojhY3/B8SxwUEUutlIjwBtU35M4czcU+VhGf1Y6g==
X-Gm-Gg: AfdE7cmTD9TJ5mzQu3OiPlmxuGigGTenS9RTdaT7XJ4ZsKsQZFcZxOlgQvj0M8l7ZPx
 lpceAsZk4t7ViDWXA+DbnVfv4rnU+aHduaN+B2OXDO28k1+y1Q4CwKm7+VWNbvtp4oxhTsNcME0
 u3rm5J5XkbsFZWXcOC+LKhteD8rWhLG+xzSJ75idWg8gCkkQdQctScE2YRpcq+TeEGKTTzOdDYK
 fP0dE0AXgOz7EUdvwBBynbaGXuGM0SSi2z4g3BrOW6DC8CyIzi54IRKDeaZp0fL4tx3ZT8ADcEh
 yLKaKkjkz3Y85N8j6PcN9V695YVkWNVoyoHuB97oEWi9SdWChezEg7Zn4SX6wM783d2kSEuzi+O
 ORIwIOYhZMzFcoKi39IFe4mGB/uwaO2XBfME=
X-Received: by 2002:a05:622a:4a8b:b0:51c:1408:6c13 with SMTP id
 d75a77b69052e-51e4f0baafdmr73387661cf.44.1784205350966; 
 Thu, 16 Jul 2026 05:35:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8b:b0:51c:1408:6c13 with SMTP id
 d75a77b69052e-51e4f0baafdmr73387121cf.44.1784205350314; 
 Thu, 16 Jul 2026 05:35:50 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:35:49 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 03/17] target/riscv/debug: Implement permissive type
 unavailable trigger
Date: Thu, 16 Jul 2026 09:35:20 -0300
Message-ID: <20260716123535.3709148-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: umx1xfZlCFb7qtZAmai_uzLQqHKuzKZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX/5ewFwM3LAde
 KbHr4/ZRO6zFF8hQJOBGVbnMIorFtZmG1Kv7KVXmNrKvwGlPhseDmVkJ+Q0cv2bFIEjX3voQwaV
 lLRpnbA1kjYhIhpDK+H/rmH9KYPrc/eR/i+lf5bZ4oVupwYaiYTWAbkYdEwgGkxQKNrMp++x8rQ
 y4r2Uk3caYS0RdEmw5NQx42vSjHiq2pfskz5R9rG0Q79nH58FmGip8oOy9PbPUB7OB/i8vnzi6C
 EcJudxfYjksGcyJHQ80JELFVaAe2alpzka9ZTb3D52pZbvI+drGxBptqem0tRDvo7MV1LcnQnNc
 vDX4sZDjAmerPFwe1AOXpDamh55/AVPm0bzKYJP+1oapqhPK25+FYXwRKrgd6DlpmI0umRP1qVb
 4ALez2AlgWn95gQzpHyh3oX4gX3Gbq4leVUepOZMJ9mUy23j8GvrVyBuv60BiDDPXxldr8bmbfg
 LPusOqtRpBEvhQnhcBw==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58d028 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=8_OeMpcRU3GNJPBcLSAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: umx1xfZlCFb7qtZAmai_uzLQqHKuzKZC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXzAsJ8hyWL0Ki
 NkB6c9AgGQcHtWtZqrh2zRCWC8gwAa8TGDAg3BGDLpnHSQG292kr7+agto3RAOXIReusV30pBtK
 j6AyvA9AjXJi7sguGoAZuag0LwwJxOs=
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

From: Nicholas Piggin <npiggin@gmail.com>

When a trigger type is "disabled", tdata2 and tdata3 must accept values
that are valid for some supported trigger type. Additionally, writing 0
to tdata1 must result in the type becoming "disabled". This is important
for the prescribed sequences for updating triggers.

Implement write tdata=0 -> disabled behaviour and permissive accepting
of tdata2/3 values in disabled state. This implementation could be
improved by checking tdata2/3 values against supported trigger types,
but it is good enough to be usable by software.

From the RISC-V Debug Specification for tdata1:

  Writing 0 to this register must result in a trigger that is disabled.
  If this trigger supports multiple types, then the hardware should
  disable it by changing type to 15.

and, when type=15:

  This trigger is disabled. In this state, tdata2 and tdata3 can be
  written with any value that is supported for any of the types this
  trigger implements.

Fixes: a42bd00166 ("target/riscv: debug: Determine the trigger type from tdata1.type")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
---
 target/riscv/tcg/debug.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 9e6c907742..c7cc67e244 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -829,6 +829,28 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
     }
 }
 
+static void anytype_reg_write(CPURISCVState *env, target_ulong index,
+                              int tdata_index, target_ulong val)
+{
+    /*
+     * This should check the value is valid for at least one of the supported
+     * trigger types.
+     */
+    switch (tdata_index) {
+    case TDATA1:
+        env->tdata1[env->trigger_cur] = val;
+        break;
+    case TDATA2:
+        env->tdata2[env->trigger_cur] = val;
+        break;
+    case TDATA3:
+        env->tdata3[env->trigger_cur] = val;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static int itrigger_get_adjust_count(CPURISCVState *env)
 {
     int count = itrigger_get_count(env, env->trigger_cur), executed;
@@ -885,6 +907,10 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
     }
 
     if (tdata_index == TDATA1) {
+        if (val == 0) {
+            /* special case, writing 0 results in disabled trigger */
+            val = build_tdata1(env, TRIGGER_TYPE_UNAVAIL, 0, 0);
+        }
         trigger_type = extract_trigger_type(env, val);
     }
 
@@ -899,6 +925,9 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
         itrigger_reg_write(env, env->trigger_cur, tdata_index, val);
         check_itrigger = true;
         break;
+    case TRIGGER_TYPE_UNAVAIL:
+        anytype_reg_write(env, env->trigger_cur, tdata_index, val);
+        break;
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
     case TRIGGER_TYPE_EXT_SRC:
@@ -906,7 +935,6 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
                       trigger_type);
         break;
     case TRIGGER_TYPE_NO_EXIST:
-    case TRIGGER_TYPE_UNAVAIL:
         qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
                       trigger_type);
         break;
-- 
2.43.0



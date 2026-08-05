Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65281C55174
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 18:25:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wrgJF-00006f-0X; Wed, 05 Aug 2026 14:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrgIz-0008Vj-BI
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 14:25:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrgIw-0007fz-Eo
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 14:25:27 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 675HSJCK3561174
 for <qemu-riscv@nongnu.org>; Wed, 5 Aug 2026 18:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=blTv4mizGpD
 GEZidjgr/H7vbQ68dRdp26PLrvP7to6A=; b=A07+AXgPi0qXTgKScvJC/Ll+ByC
 m0T97M3Oos517xUQuGt/d5M8w6Ogc840vSuVUHwxfPbVNXhUog0k7z1DY6v0ncJP
 dA6GkpV0fU8I81It2LHoWcYK0jJD6mS0RV6YD4npHSFHtoEOcEAoIuOtXQ8g3Gi4
 8fFWaCkUlnoyXBb5bonomjEprlPUOg8As+//HrnDhiFVE9/oFTX7d5Emh1vhT5bB
 fIBPJmTK/A0wvC7jnGytsKnlXs6GO8Hf8Jelb8aARShwP4nmioLu4mzLyMXn0gOv
 Pz//A5UZTtHwFDexXOavoDM2XymlZB92zt3MlUq9YV+mh/W2VyNLqzeDnKg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5shq1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 18:25:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92efd2ca21aso236884985a.0
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785954324; x=1786559124; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=blTv4mizGpDGEZidjgr/H7vbQ68dRdp26PLrvP7to6A=;
 b=AcjDD7e0cdIsVjtD4HoFiY/gJwIuJULqJMoFq/E6cchOcNShKqO8OebktPCoeNng1y
 gUjoISVDc9nArg2eWXnn8pTDE7JCmUhsg4PS6j2lSymVIVaJ7cJBTZ9BVv/EgISsOGdc
 rviB7+PRc4q1Y2/ZH7HBBaHmmSU54m+DQ/5yRJMoZ0xgL42xvaCu4zPvQnUUWVu1SDq0
 zc71YJlYi+GeSp21Ac1xqCg9jKhrboFVS0Aminj48Z3vxfXhD62lL6tiElfo0FmeNqXe
 bG8QjlaBQ+dWkgXd2ibAq92v+uctbiQiClpD+cRZC7HHCAsX0gFlrswRww5anVDHaccS
 B57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785954324; x=1786559124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=blTv4mizGpDGEZidjgr/H7vbQ68dRdp26PLrvP7to6A=;
 b=Vjkt5d6GbpsxBN1uYgz7JHHvUFtThiSEaDbqskvxayLpi1Dv0ogtzZ5QmZoFMuCNat
 00VMJDjVjz7SQopbq+9XMDMaGPkuJLJ5BBXxrfR8G8fbYa5FgI3OSQur5Cc7PxUYVKpn
 GGw3aVXn0pnjxfWXkeUyi/MUvsSU5Ix7YRkGj/LaZIIor/qv0MXajyX1yiEnPYJn+veV
 VSsJTWAIfnHvncdjknGyuoLdhg8KHlfYpiXJW4f69Q45E6WTPSv9MErNBEoJb5p3Q6wq
 1eW81LoRRDuzykPke5UHJbDKeZWG4wUIGoQ5td/QF9bpph4ijRFBJuf8SpzSzRCDftuz
 gerQ==
X-Gm-Message-State: AOJu0YzEaeAyCune+8thK6+yi0GaEX8v/gMPVDViXLiW8v4F/h38iltU
 Bpwvh9FGbolR0dm0E/yII6EGrttujbk92Zmkq0IrAISEM4CfKBfVixb31gXCiu/LrNTtok8jqY2
 y2oGo+wT52qzTS8nH6TXdV0tlI1KGthmG+efKfwdz+BqJWN0wM4CMBSZrgWHO88S6xg==
X-Gm-Gg: AR+sD12FtNZz1Qvib2LL4VFIrNyfIThYEdNUKyi/TutG39zYwDIN3azc342xnhD5ALR
 4vGJZUFbSONUccybtnOitblpXqy1fgrp71WTSpm9YN0WB/AG23kGXHp6r2yHssn3l+6fX6VtVhr
 Np/mJ8vYFilm5SpPC47H6bjTHVhel8I18NyJx8N0BXZyn5hmX7BT3e7Qw0E0kuyuVKXNh909Qwg
 ixvxdK9Ckwc/ZOiZ62OQu3UPj1hwaFLpIT0vHmHJTMf3h9SGyee6u8wmTH0sZ0lx3SO84EBiRB7
 pK/12G7n/9gsh8daPqJWg3tqwu9JZhI7kelp8rjjqBRtziuiH2IwcPpnzYFIhrfIGd8Sff58ppT
 n4GuU65Ed1yjGGs81q8lgSh8F6FonOVTjArO4pw==
X-Received: by 2002:a05:620a:8807:b0:92f:362:8097 with SMTP id
 af79cd13be357-936490579c2mr937407285a.8.1785954324249; 
 Wed, 05 Aug 2026 11:25:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:92f:362:8097 with SMTP id
 af79cd13be357-936490579c2mr937400585a.8.1785954323742; 
 Wed, 05 Aug 2026 11:25:23 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9364a3fc901sm209387885a.6.2026.08.05.11.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 11:25:22 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 4/5] target/riscv/tcg/debug: set tinfo version if sdtrig
 enabled
Date: Wed,  5 Aug 2026 15:25:05 -0300
Message-ID: <20260805182506.2943757-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805182506.2943757-1-daniel.barboza@oss.qualcomm.com>
References: <20260805182506.2943757-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xZFQEz-BzQXooQ8e_1h099L1WF_9vR-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1MSBTYWx0ZWRfX3Kl65SjNaQgh
 XV3UasYjAWOzxeD6wYC2FEvzlqE8a61Vb87tgbVAtE+fzZMvmarQEcD28tJPxcClkJLqWFZ3elS
 Jt5n2C7p2W1my0FaoNrS2vBFO1EjKcvOt/c7IkitFZ+KTBwxMBlV6WsfMWCADfKc9pqsdEK3mEO
 F7eeqeipHb5gxO4Mn3WfpXTaHZTsFrokGxVCsSgVfvk9tyUXEHAhMPhajrjFSGpe+sd7Pa8f/rQ
 X+C8ACuCI4QaqjvCBEcI+okYDrDpEaQNRzIiDkXDE/ZZYXt35vkSslDrWYjT/gbAIhbKAt3nD6e
 QM5JwfRpeg9Jq+7bxTKRYjsEjfx5moIOc6LUVh5Kvy1mZUzf4EFA3igqqhar5/gbigr3+LFAY3f
 vCrUnI4uv5vOjq3OQsgGFFe8UWTeeyGvg5AmiwvBJyvG8zGn032c36teQUR/C1fQn6OD2q+fnoP
 aGYRedKeFEAgmYQeDhA==
X-Proofpoint-ORIG-GUID: xZFQEz-BzQXooQ8e_1h099L1WF_9vR-q
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a738014 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9MmTmf_e1JsxRL0EyGgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1MSBTYWx0ZWRfX3qL+k33Odw3R
 6C0H5gw6HPvHFIojhSVpQSxDnBL6mq8ShnZ3A3y+KjMignD2Pp8nCJ/dGc+F570WlOuzUCbbSkR
 yT9Ry+06ogCMZOdmdUBHRKeLKeBWN1s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050151
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

Set 'version' to 1 if we're running Debug 1.0.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 11 ++++++++---
 target/riscv/tcg/debug.h |  3 +++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 8b23c8d045..06573c7b3f 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -957,9 +957,14 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
 
 target_ulong tinfo_csr_read(CPURISCVState *env)
 {
-    /* assume all triggers support the same types of triggers */
-    return BIT(TRIGGER_TYPE_AD_MATCH) |
-           BIT(TRIGGER_TYPE_AD_MATCH6);
+    target_ulong val = BIT(TRIGGER_TYPE_AD_MATCH) |
+                       BIT(TRIGGER_TYPE_AD_MATCH6);
+
+    if (debug_trigger_version_1_0(env)) {
+        val = deposit64(val, TINFO_VERSION_OFFSET, TINFO_VERSION_LEN, 1);
+    }
+
+    return val;
 }
 
 void riscv_cpu_debug_excp_handler(CPUState *cs)
diff --git a/target/riscv/tcg/debug.h b/target/riscv/tcg/debug.h
index eb635bc277..fcd92b768c 100644
--- a/target/riscv/tcg/debug.h
+++ b/target/riscv/tcg/debug.h
@@ -45,6 +45,9 @@ typedef enum {
     TRIGGER_TYPE_NUM
 } trigger_type_t;
 
+#define TINFO_VERSION_OFFSET 24
+#define TINFO_VERSION_LEN     8
+
 /* actions */
 typedef enum {
     DBG_ACTION_NONE = -1,           /* sentinel value */
-- 
2.43.0



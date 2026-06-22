Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4364CDB475
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:34:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNp-0000hm-DO; Mon, 22 Jun 2026 15:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNm-0000e3-Rb
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNl-0001rX-DX
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:34 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFXHmu1591963
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zTW6iltEwLv
 RjrstwtoU0aPT0/EdH3lbHOuPE1b69z0=; b=ht3jjsIsqukVmzp5vo9pbALyQFu
 qEjMH9Nx2IpbXXlRD5Zo90kK34C31IQFsS3EdHp8dY5RybAen0ZhdykNx9HJIfoJ
 4rFk8aNAbhFltouHrCyLu6o91GOTAzP4gUozQZIPF+P9y9zzCDUNM5PI2rEmT1pg
 zBF3fwaTDQoUmmvBC4VmFfex/R5xWuOfwkE61KA6fMSupoeV64tI3OBZcl3skClu
 7pGpJs9RtNgvfQrdsvGcU4bLnN9mf7hox+veoAZYtd+eKCFURI8KfBjBYxgM8v5J
 H4ceKqP9XrkB92WwcNf2+2Kyj5M8TCwpOA0jLyV1McBHbIq6WMfvZPw1FGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n41dwk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92158791d14so339987485a.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156752; x=1782761552; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zTW6iltEwLvRjrstwtoU0aPT0/EdH3lbHOuPE1b69z0=;
 b=OjvsT7yHDnk1a1h/4Lv12UBEMsq4PduSc6scTq2amv0HGI5ethIYH+KgN0CfWblf0S
 oA63yJCljJ+GRvzFT3dKW5j5xc6CChWIDoL8pKt3woSIebFJ3xdxS8ovCPx7HJNClLO4
 vzAOGTQRxGGBC/ntz6jAn7dD4WdiiHN+Cbjke6TH415l8ZoR1K2QouvfaAElOUfrjC2r
 1nlY1pxtr+gAs+XG/laQeV4yrUv2/xy5JH2srMGJzfBi3HHPbz3FLaBnMIqd5iREND+J
 K1fo3ObqLwL9gA6zVmObQZFJkDpTFmG+P0j60nDxJ7J3eUHTu7+83+G6yx6Qf8zyDr4j
 F/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156752; x=1782761552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zTW6iltEwLvRjrstwtoU0aPT0/EdH3lbHOuPE1b69z0=;
 b=ZLYwejDJFnGpzIyd5ycMS6s0qrdtTB0uygpm+qPnve/TMsPqFUckSSu/o2ZpJYgOQH
 ihmsXI+Ya8U+bbZrqfKLqywvq576v+p+jCAIdQFLSvENh9DcBHAnHcFrvVW7X8XlYxeJ
 5Jt7yl/GKLg6v57bYNVxc2TaF5Ia6WcO9B1nR/dN1mU6hze30gRap2tROqisbARbPNCa
 mDVqddXp4AA0P+ssvz41/jE+gooienk7+2froSBuRH5KUdqZtXZ5/v/Ubc2w6FjIvP8J
 96bH9RHeHr+IldTRvXGX+lXjJZ4ty2MRxXbyLlgRb4YSozW8gEHeoE0QT1AOciFPu39d
 Fv+A==
X-Gm-Message-State: AOJu0Yzy+lzOm5RSUCG3j5kXqjWXCYwGzF7wSoF4SPmLUa+EtsdCrZ0w
 8zn48M+gaBBkb+G5ZR5H6Cnplq2r/l/cCiIp2IBBqHDI0LJQ/Th4gO7Wips6mBvSGfdNNWqeRyr
 xkenAT7fa0reSG//kelBdoPSSiaJMEWLQ3M9aV6X141yDz7Qfly+93rTYFQ==
X-Gm-Gg: AfdE7clBUqEsXTJcLMqSRwEI9hJQqByClxcEud4Rs/6QJN9f2Mi7VOmpJxFzDmpXweo
 5abfZ+5gHS9f7Ms9uNyJI1Jl5Q94JU5NF0sVKsJuK6rUDAN2hrq917t0i5n/0G7PgOLydoMEqY3
 p2GteQhVYcEULTRmMm6zWleh/vwmeHfB4mt/APWWk4K1mqXCLfAx4l597ldqJrEych6B/rcpztp
 Vbs34OYRnf/Htwx8jUmsF4V54ipG6uwztIWHkbJ5ei9XY7lCFTB/9D58pbX+xP+E8ZDUaff3wmr
 vd/FGsWSpxFhF6BE+tZwLBJrfddx7Koz1i5OIW2Bn5fzSxxS/ifJoHwafX9vmxltetso4Y0uWn2
 3fpKoyx6KVYAQ26U2xM37888izCCa1Da9NNVj4BMjSUn/+g==
X-Received: by 2002:a05:620a:28d2:b0:915:675d:a2d with SMTP id
 af79cd13be357-9208d7e7a14mr2604405185a.51.1782156751762; 
 Mon, 22 Jun 2026 12:32:31 -0700 (PDT)
X-Received: by 2002:a05:620a:28d2:b0:915:675d:a2d with SMTP id
 af79cd13be357-9208d7e7a14mr2604398785a.51.1782156751288; 
 Mon, 22 Jun 2026 12:32:31 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:30 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 14/24] target/riscv: move riscv_cpu_claim_interrupts to cpu.c
Date: Mon, 22 Jun 2026 16:31:30 -0300
Message-ID: <20260622193141.1449724-15-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX2m/r6FqVtK74
 WnzLeiMBABy9PBPpDtdgkOszhmnfakYGvZWrvQkQBGfRi99LDy2rSRG+8S3ES4q9Ev78azLUWPk
 Hh7C35d+V6Y1Q87mTqU3Oip3GLrb2YQ=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a398dd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=P7v9EdgfUgEVytVI3b0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ktq3cH4LystEUwlpAnWQq77B2sSNxg2m
X-Proofpoint-GUID: Ktq3cH4LystEUwlpAnWQq77B2sSNxg2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX6FafBY6Z8M4m
 5u23QeVHMsdG4pGLBmy10/Jzsling5Ktf6QKqjB6bVmR87BOArIY62DY9yjUo6mH/tJt/ZogukQ
 +EeKn1kXQsKaN92W18d7Fl6whW/XCxGJHpw29J+ugep2ZH3GKQrgEaZIrjySB45rHnsUd0TgxKN
 APKQOb3fn8O6tRF+Tj3RxyIXEpgYSBF10U6hH28LW7rlIRZGOIzURY8Y4dMbUy6a8UiTBpNU3K2
 4lKgGevR0/yQJncNugXhc2fGgxui9tnSnCbXjmeiUG94moxdlzHrK8Y06xA3cEtBIax834cc8Cw
 Syju/0fpid17IIPJZ7czDsn1bxPLdbvMbTvSdeQRS2Yitq3zmzQa+gFlUhP6/P/TSokttHusxZ0
 pj9M6Em4HpjXKfu6BOHsq8VPpUCEtH04+KXuQkexgP7g4BQqrjvDC0s1xn/9cknyg1E4WRmZ8lL
 ulpDcxhfNStfZmtdqAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220189
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

The function is used by hw/intc/ files that KVM cares about like
riscv_aplic.c.  Move it to cpu.c to be accessible for --disable-tcg
builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c            | 14 ++++++++++++++
 target/riscv/tcg/cpu_helper.c | 11 -----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 41646acfb5..2b1fbe4b0b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -566,6 +566,20 @@ target_ulong riscv_new_csr_seed(target_ulong new_value,
     return rval;
 }
 
+#ifndef CONFIG_USER_ONLY
+/* Used by lots of folks in hw/intc */
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
+{
+    CPURISCVState *env = &cpu->env;
+    if (env->miclaim & interrupts) {
+        return -1;
+    } else {
+        env->miclaim |= interrupts;
+        return 0;
+    }
+}
+#endif
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 09ac1aeda9..f99fa636c7 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -572,17 +572,6 @@ void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
     }
 }
 
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
-{
-    CPURISCVState *env = &cpu->env;
-    if (env->miclaim & interrupts) {
-        return -1;
-    } else {
-        env->miclaim |= interrupts;
-        return 0;
-    }
-}
-
 void riscv_cpu_interrupt(CPURISCVState *env)
 {
     uint64_t gein, vsgein = 0, vstip = 0, irqf = 0;
-- 
2.43.0



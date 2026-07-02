Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29645C44500
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHqO-0003BJ-4E; Thu, 02 Jul 2026 09:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHqB-0002th-EP
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq9-0008Ed-SD
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:31 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0Zbi518963
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DMsulMZdTNgEhpkZipVmmogcRVvgw5giFw0hExul4Nc=; b=Y21unVCPTkPp4Y2Q
 Jkg3FuVZ+JrJH3uuX5ZggGBCzDMz+l4D64A9JxO1fjTa5s0b22kUmveqFS4AKmbP
 g8sSr1Ifoe1X3jxeVQtWNxScP9SaLdQ0ytdrQDLQgOQUuU1GMSs51QLWBlWiFIbC
 /hH2FMCN06/TBCzcAcSsnlKAkBbALhVmj16Z7VDyAj7tj/uR6+0RXjID2sgafwbQ
 u69J1Bl3OntbyTxgwlS/1nXrnOSSE20VS5Ccu6ZsaSokgMbpSl1Xn/g+vyWBCfM8
 ORiS1sMuEauU9BIqxokiHK6P36leil0zLQTst9xBectvjB9nDyTpqWo3sSxDV4+0
 BGrUEw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp8eve-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:18 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-967973f71fcso614606241.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000338; x=1783605138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMsulMZdTNgEhpkZipVmmogcRVvgw5giFw0hExul4Nc=;
 b=HNWlDdTj3SWfE1JkXLSnbhS5KJCM7jxMyvWOICf1C3NVVlZMadv0T+qcnCZX46/SZV
 kcX3C7l1mMp6eaLFwhwhQlkS9KWczZPZDzj3xN8v/zRbqtirqWIHh6gRy+9diVV5I5iJ
 guVTRJnjFkrUt4okp8zLmPfYnEdiNVWcXYzyzOCPo3OjirHVFoFa5dTGLFbslK7d5gR8
 +gZVccYuvKJ1MHI0Mv06Ad/g9BxHs+u8w4/ZrLYWl+vurCcbYU+GgHUS0TelxUMx/EL4
 0RYbh2l2po3dePBp+2Q6QJRXo9rLruLBpORPxQexBKb1DqFSr+MhCq4ozH3aXBpQaRRB
 Zqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000338; x=1783605138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DMsulMZdTNgEhpkZipVmmogcRVvgw5giFw0hExul4Nc=;
 b=miHc/hW7iOG2lg3QWh+LRT5FPNexv6VQsPfXLuikHGVOUboZ87fFL8ODMKGsKIoVoo
 yyzC/CDjE85kru292nZT9+/z0ETY24+Qmm5Z8My1oY9BX22/hN/amPW8LD08KgB/kVoU
 mIKYTlZF5LOhHz2uaUqmP28C1mb5qrDG81e847uDt9zoO9vJxhwpiKogzPRmmiJ1mibW
 dh978EZVfWxETB5e10N1Ur87DRWhG/lIklH3nq+wdUraK/+JVWqSQgCNZoVq02QfY2Fi
 m7ReMw518FpYYQSp7jyZzteg3OWzvSAbC7CC5f0Wi7DHD+IPvaUPB2Pv4xWKeAQEPgsy
 FArQ==
X-Gm-Message-State: AOJu0Yz5hxV2zccEYLWgJNzpUdic8okiKZvsYY5SowWmI85B8J2a1rea
 h/tII3Jkm78/O5hnsxTIgSUhVALkJK3OV85x8BfG9ViG9urKS9O42aU7tfnGFh9wNl4IprHz1cw
 J9//LOgre+Zq6PoNmw6l+eeJLqyZWvD76FnBmpz/BGEljdr/92F9GWjXa6Q==
X-Gm-Gg: AfdE7cles1QzgDMPartAq3xRkOuNgfIfHA7yqXYpo4Ffss4Y+ZVUU32RMyrdb2NcZAI
 9zuWe1MeUBGkaR+ZYgmjD9VMskTQHD5pLen+oTONg8olrhhYt+TIStg4lYma7qeABFK90hbNYBA
 Ec4mGZf4SpaSu8bIu4p1Gi6b6EGN8gv+oa2Ffrq7Rm3Z4ZCmw2krBPL9xGpZMCZ//EMHzsC0aV+
 lU1m8TZ6jP3gyUT/CHplDadvLsjBhF1uLYikyM0VBZ8wmU579njaHNmv/PK4nrUbgM9S+U40lnh
 gITfGJUGt4pVKKj35nFtvaWWit0nL8WhOqcjwaA9ZLkyEK92A7KzztPZdm46ciP6ul8v4hFI+jU
 xgD8wlG6x2dmci58Y86cFcIZZCiuHORjqlVIoXNSifQ37Ww==
X-Received: by 2002:a05:6102:80aa:b0:739:d787:be8 with SMTP id
 ada2fe7eead31-73da7bd49femr2752310137.9.1783000338380; 
 Thu, 02 Jul 2026 06:52:18 -0700 (PDT)
X-Received: by 2002:a05:6102:80aa:b0:739:d787:be8 with SMTP id
 ada2fe7eead31-73da7bd49femr2752281137.9.1783000337364; 
 Thu, 02 Jul 2026 06:52:17 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:16 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 17/24] target/riscv/cpu.c: filter TCG only bits in
 riscv_cpu_reset_hold()
Date: Thu,  2 Jul 2026 10:51:19 -0300
Message-ID: <20260702135128.1188021-18-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX/GGQdop8kkyb
 U+tkctaCQiCZgHncqzB5WHRsI8rH31UD5CKkrEh/g7REDNfb5r7B4swa/pbIHcL9CNhG6n7eUep
 mPVQeSx9PBbxsME55v7Uz8GwUlnPr94=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a466d12 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VLRNWGNRl9IGrp3TKBsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXyijcYV3YhT/a
 LlC0fWguEUYEQYXGuyAi1MQzDpmX2NHxb/kJClf9TF8MB6+U1eVQ5Qyt8IVw+k21x7aLN2wNlnr
 VHadhcfj1uUtTtvhDsKrWpLMg69puUrUbR2dP7mxs6HsPpLPnzFmh0Vaz0PWiguWgGzCqMp7vfv
 eOPUlTTUY2D0r6X00trxKkKkECTlRqww5pDiXiGoNiDWhAf1i9rDgEZC7cOEY6uGTjm9q3Q4uX/
 mMnRoNjer+CqBZblqy5a1fOnmOL7+plHb1Qp17PnxRuYwIqDYOrelNVWOzZUz8YZSAYlTBrK7MF
 gSWMwFcDMO/Aqalv94K8XMLPyVppuG95hs/aL3Rr1FwSENu1eHOkrqfRMb1YAoVCrNYZka0RkNs
 BWfYe2p4rYTBhaYN+R0IV2TasNKJWWj214ggQhRZgHRpiZWBvxMtcp15Ub8Ndwiv3+G7cdH6UPT
 am3DPm4XjG/dhhKLKbw==
X-Proofpoint-ORIG-GUID: mA6S5DkCc2MkqgClvNjODEhQgpqxEfF7
X-Proofpoint-GUID: mA6S5DkCc2MkqgClvNjODEhQgpqxEfF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020144
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

We have a lot of TCG only initialization in the common cpu_reset_hold
callback that prevents --disable-tcg to work.

Put a CONFIG_TCG ifdef around those bits to make the build work.
Eventually we'll create a TCG specific reset function in tcg-cpu.c but
for now this suffices.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b79dcc5ee..5a82e6563b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -965,10 +965,6 @@ bool riscv_cpu_has_work(CPUState *cs)
 
 static void riscv_cpu_reset_hold(Object *obj, ResetType type)
 {
-#ifndef CONFIG_USER_ONLY
-    uint8_t iprio;
-    int i, irq, rdzero;
-#endif
     CPUState *cs = CPU(obj);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(obj);
@@ -1020,6 +1016,10 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
                     MENVCFG_ADUE : 0);
     env->henvcfg = 0;
 
+#ifdef CONFIG_TCG
+    uint8_t iprio;
+    int i, irq, rdzero;
+
     /* Initialized default priorities of local interrupts. */
     for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
         iprio = riscv_cpu_default_priority(i);
@@ -1057,11 +1057,12 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
     }
 
     pmp_unlock_entries(env);
+#endif /* ifdef CONFIG_TCG */
 #else
     env->priv = PRV_U;
     env->senvcfg = 0;
     env->menvcfg = 0;
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
     /* on reset elp is clear */
     env->elp = false;
-- 
2.43.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4550C79FB7
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 21:09:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4PWd-0000wo-Pr; Wed, 09 Sep 2026 17:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4PWc-0000wV-Av
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 17:08:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4PWa-0000Vq-O9
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 17:08:10 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689JI2Pi2896154
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 21:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=rsVgFCfA8/6
 VrdcTgI54XidQGha/ag0fLThsBSj5BQc=; b=AUZtL2DavxkxGIix4C0ZuI+rG7a
 x6n+8g3JaiF3JN9IBWxaPyeTka6WKHBAuHRlo8W3A0uQHRirEZHQ+EZELmf8X/DJ
 nMTit6wuxTStdfXmRs//pZM5GSPmx/enuHm9OtPkN+1Yr2omu9LRb6Pf8TQDLnpL
 i5YER+LVj0v0fgG+C3D6eJSvctnSZDrA2kXmUz0bpnUycrA4EHzB09S2zDxHw0Ce
 fQ7S1mMdXKeJlo4sz6dhKIWlBeOF6wCj0jp9twosDnepDbXZAcWrItRuXzU+4mIu
 jRnOAwD+/Ly/ZjBgbLgERKblad3/AQp+XqjJtBZdKL5Nn92G8s0haUUFxdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygrjv1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 21:08:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93903982af1so1294125785a.3
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788988086; x=1789592886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rsVgFCfA8/6VrdcTgI54XidQGha/ag0fLThsBSj5BQc=;
 b=cVaQDF4wzAzwfhcB5YMWbbdxL5ViNdHVZPhLahBsCXGrFPNIfCiuNGpIWz7m/jmIpN
 tHU1cN9recyP3HHpKkVvCo5N7mPI9E0/sjNAfRFDxjHtDOev/Hf2YylH36Qmuah4pzL8
 qTfEdd4/GwUJMuHGDg2nN4YjKgY7UAioQjVfww38mZupRiajLk/uYl27QNcs6rbKrq/A
 F4h+0RUpeFAMmaEvVSpyTvUS9a+zPSVLQcaDiNEM/+amgQDJwGL2RCoLIfUHsxS/UhZm
 BuEXBxgmzuS9apsts850F9xyCb7Z25WJUYGdyWEl1GHDa9aINzZZcyAH8D4oGVeIGJrY
 Qv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788988086; x=1789592886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rsVgFCfA8/6VrdcTgI54XidQGha/ag0fLThsBSj5BQc=;
 b=Mo9PZTSzTtU2SNTDHBhb5gTLE6TP0l5tvm08xePUujs32DJgSSU91+4lJzwJOmuIvv
 C581zi42xEavOyFJUT5ahuqoxkqwum8SfDP7nCnqCBtLNYECVf8wLtU5H/8vyxX+gxzc
 brqofVa0q8YprY8r7CKRhKpSIe2l5zvrp3+qjRN2Ch5IE5z7C81F2O5dWxxgC1wZLula
 jqbJuOABtW1CN1BUlsuDIztJy3OVh44K2zSXM8VVwl9XnZTjtON8tUq8aGvnotnddf2T
 L9v9Q/Z1SA3vSASwy2Bv5SS6lgU9YVCbYZYrGsfWr3XxatmnagtnzhNvcrjDAIvF8ocK
 /81Q==
X-Gm-Message-State: AFuF++nAVzE2lHtyUtXdJ3PeT/kxlv80SQ3zZSCh5M4Ch94DsnG3W+4Y
 p2NiklujzvCPgOD8x/LzxmOhWc9DcqGZl4JWyQwLWmqW9prQ+GDOSgkCYIECR785jKJuG7wOC6Z
 X088H6xzUjEvVgkCn3uBYvANKMQCDm5QSkH/xBLN8NRcdnEA9TOKQde2fOQ==
X-Gm-Gg: AYBFou0T8hmVXZDL8ClX21fRW6CB2Qc5CkYb89tC81HVSDH+nyJGAU8u7qZynjUheDq
 mCgj704O/0kUw2fNZva03ejSWySm3WEI8CemPSA5g5L9Xzymg+WpQ1NiOzHZkRO8rVPtDT5sXA/
 H+lsVZAlcXxGfGSD+Wd8zPuE1u3vYI4LV6Ps7KfZgqgeSX6/+8LlJsHqpeQTy0Nuo02mDmIGXuu
 9R7FOmB2GHjc4HvqxbFXHyXGdR6tZOXqaYulbJSx1xW2NaUIJStXoFg9OIRcEa0lKBbMxhSPVU5
 /ib5rYNYKkyv9hC6Dph5K6PBcDVOv09XhammoAqry1mltjMjh+b1wcLz5OFuMQjj86LHAwCf8sp
 /uWgw847jii48AN0PW8YgSt16e5oJSLFmgkym
X-Received: by 2002:a05:620a:1a06:b0:930:f35d:41ba with SMTP id
 af79cd13be357-939807284bdmr3996663385a.36.1788988085870; 
 Wed, 09 Sep 2026 14:08:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:930:f35d:41ba with SMTP id
 af79cd13be357-939807284bdmr3996655985a.36.1788988085262; 
 Wed, 09 Sep 2026 14:08:05 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91040646d59sm151811336d6.8.2026.09.09.14.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 14:08:03 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v11 1/5] target/riscv/cpu.c: remove 'bare' condition for
 .profile
Date: Wed,  9 Sep 2026 18:07:51 -0300
Message-ID: <20260909210756.1767711-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
References: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfX7HQbDAwrqn9S
 oiJ0x83ZCTzQ9tqsUDAwD2sH7/O56bVHwEVgQwuvkzKnNVEgRQHniw/yg4udv6T1iwJxM4X5C/K
 U+3XZq3wrEAkXUavDOoyzgz0OE7+7lYrRhCUQPeGDmqCCGAQQou7zR+0gXdIR7hfH4/fpuqzhA9
 J/OCXwSEnpmOvOKV5pgNtW2eyc8xaDnSHBp0eZ/G9NFp6emfDNR4IhvgM7imnHu0NtpUqI9pxQI
 x9Ht7yRgYirbE1I14gJ+E25qxHjjR2E3d7EtBOZNJ6Kh7d9xKsW8ebii3rmJuhKvood56z8uFw4
 h2m5A04K5OMXI4aTN17K5nMhy0McWZr8CfmPYq7ujPRnxqk0BkRiK+kLeEbmkvRdhjSCGTBTl7G
 iDXxQEkoo3mM1D1vugt88Bh6N3iagqTyvr890/JAIPJFwuBmrFV3gXrzUXuUdAtIw6tUqiMGgHz
 1s9Uxi+HhQlu6poN28Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfX6a7dvGmKXwuH
 z2UkYA9HMjteSRAank8sKWcIjL6htIPLrh282EaHb/WAbZthXr6fgJ1HdQ3qsKnGoLmyJVKFTpC
 Pn2/f20FCmWSk9o8mWrqiW+DWD9RFaM=
X-Proofpoint-ORIG-GUID: HIG3_Vx-ql9NkdlDxnESI9yQqhYCDKsf
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa1cab6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8 a=GhL2bEVCvcqOW28JNKkA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=xVlTc564ipvMDusKsbsT:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: HIG3_Vx-ql9NkdlDxnESI9yQqhYCDKsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090236
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

We want to configure other CPU types to use profiles as an alternative
to adding every profile extension explicitly, i.e. a profile is nothing
more than an extension bundle.

This means that a vendor CPU can set .profile=rva23s64 while having the
same handling as any other vendor CPU. Same thing with all other CPU
types.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c71986da61..773aeba8da 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3103,7 +3103,6 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
         mcc->def->bare |= def->bare;
         if (def->profile) {
             assert(profile_extends(def->profile, mcc->def->profile));
-            assert(mcc->def->bare);
             mcc->def->profile = def->profile;
         }
         if (def->misa_mxl_max) {
-- 
2.43.0



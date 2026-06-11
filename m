Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC099CD98CE
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 12:34:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXec7-0000lr-IH; Thu, 11 Jun 2026 08:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXec6-0000lK-8y
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:34:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXec4-0003EY-PG
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:34:26 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BCT1Qi650326
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 12:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HHU0IyCiBIVulOgwgEzbUX7LMva8z5g63gfaJmFHxwI=; b=nsdKYkxsVX1JycWV
 Fdv3f7sne4KlHzyTL2pbIZQOwfjvlnuNfNp0V2PdWiP+9QjgmdQ8Rpi5TdI18q2a
 HBE9iQpxXy1dtx01nJCchfPRjbOzYg61LK3DDh64ZEpftjKgKBSoIpLexj7jQBAd
 5Vh6YuuclmZ5AtK61ok//Y0zoLpo/skBGmHJrs+EcxkMIsqk8011cWe4Li/UtX2x
 KrIaOT0qzkoroXPBniCtG/EtLlqQzTGUkdFx6cBabo440wHn8AGLCZTNmKWxvS4f
 LPdFP72ax7SMEZBbCBYbz/C8Jdw91P9gVxIrl/NySRPliJbJeNUljZdM69/UYuyz
 bWN7gw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ske4y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 12:34:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-915d1d4fc5aso831087985a.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 05:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781181263; x=1781786063; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHU0IyCiBIVulOgwgEzbUX7LMva8z5g63gfaJmFHxwI=;
 b=ikvaRH99HMIpHlGe8bUkC/gHRssvZGeupwASC/qb5dfGjkSRchL5459Lec2bxp65H6
 aiEXumC1qhro41kvC02IeAXVahP369d4emGq53ROflwB20OB7agbqRRjOmafhtVOneF5
 kzpXRoiVG8BGasZC5xtL5OJoteBF1zNMLzaSBOeZV+C4FPwkwOtN5fUYktg9VUggARp7
 LPNcpWob20yc5jSDliAdJkhDV2FAZyJ3igAeSJxsAsCQBC/QZKi0tld0pJ2+J7w8XDgX
 DGTjrJwE6ru4u2h5Q1nafCyB1aDNAF6Vze+tlwqxCvgHU2IqcUeXjTBV0y5FAtcfMbjD
 N5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781181263; x=1781786063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HHU0IyCiBIVulOgwgEzbUX7LMva8z5g63gfaJmFHxwI=;
 b=HbXo2Wolbibuo+3arl9cOoxeCNG3EE31+rQrMYKcfE88fMQKKfDLSD8MOzO3EIJo2Y
 mb17imq8ESv9DNc3Bu+VeEARUSF4FyCoIru1ZJdwmKrgk13BbLEyaMMexzVd4xvjypWu
 oqANFDtWgvlGvL8t4k5+8egSNY/+HGglJYJdj1hIhhPw0bgjei0WUJCyLhiebnPr+h9i
 WNpA2j0X22VSadI/urHpf3BoINjCyse+H6ZZe9fA/V3tHzIJPL810UQnvDxMUkUbMlUB
 DMosVtXbNcZTltmx/Vo+zQ2BCDmlWICkQ837zrG5kcQjn/WZT4DUmfw4PCZ1E2H24iZs
 KWeg==
X-Gm-Message-State: AOJu0YyfVSY9ngj4juQO7CV9OoYSz2i7ZBT2tWy8f0z+li4Q6TaXqvPP
 iz+BgDgxiV06XFUM/bb34EQJ91oCYc9kjiAHL8WIEy3ec9py2IrqXM0hJAcstll1YQ7jLoMhQHf
 +2dTk+NsZX60NnUroQ5BfhmyLD3nu/Umnbl6VSLBsQtcuM3XvCi+f3lP8PjrHSeW+Pg==
X-Gm-Gg: Acq92OGby2Dmn2RDrkcrJc+gAJKuFDhlTkRsYGuGpZqS5nEXkTGezvZGngItHagTfyy
 04hxNtWXbWQ6aIm8lX4gxFw4jGw7tg+5BBYF3mjFGYCzkP8ySUJD7BAvVZE7CcNiVYKFi6Jx6uy
 Hliax6v/iYPpOKKCd9WEk9IG2dg7gbiNRgoBv4U6W3q+eByjZGqRqQFVGYZe1k10sPJaZ0cTiu6
 PivBcxPTIkQPXypkFR9PU7DYQHln3N12TJwg4ryFxyAxiP48Erhhc2nhW/9qjL/VNfLEjztNpeO
 bghJ9DFrWOPqqqDi3opdL9/vg2y66XYqPCz+4+Z/Hrsv7hI257A/Li7Iww6rAkC46xDM3v1t0Sr
 XZizXmoEUgDYqen/GveeDphrwgI/xqVvX3TT4DFdMoZ+XjbJMtBPECCXUgjSFoT+iEKxTqwSv+H
 fFGpkIYbkzSsO0ZgTHvg==
X-Received: by 2002:a05:620a:2681:b0:915:9047:940b with SMTP id
 af79cd13be357-9160ac9ffa8mr369789685a.1.1781181263148; 
 Thu, 11 Jun 2026 05:34:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2681:b0:915:9047:940b with SMTP id
 af79cd13be357-9160ac9ffa8mr369783185a.1.1781181262632; 
 Thu, 11 Jun 2026 05:34:22 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (201-26-7-9.dsl.telesp.net.br.
 [201.26.7.9]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9160acd7904sm181042185a.21.2026.06.11.05.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 05:34:22 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 1/3] target/riscv/cpu: add CPU unrealize callback
Date: Thu, 11 Jun 2026 09:34:10 -0300
Message-ID: <20260611123412.2135600-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
References: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6cDWcorpslssGjDIWSvRSz_bDprNB1XU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX0XWLi/c6utPe
 aSGz6RvIL3LdbcSeVAo7DVD17F8rvKM0kV6EHm5I+KCxLCKlZmylRCbp6a/uxKCFiPABS0Kenk8
 oyYRB4O9QXkG5vNW3L21FsRPI/4PauE=
X-Proofpoint-ORIG-GUID: 6cDWcorpslssGjDIWSvRSz_bDprNB1XU
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2aab4f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MITIYaLR+oYcSln1dApPwg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-V4TLcwJ7WInddZtJMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX/2XnZCx86v2A
 Eu+sQ2c0islGJYcumP3gradDuqIjPffbpwgD3wDzUZufl74icuBFVXKF6AsKErENUt5VpzzEszj
 ee5k4xQoI/CKnk8wvDPTP9ZEQKdT9FvBAkOI40150W6wNTobCkJXBiDP5sMA5lWs5MsNqfULgS/
 V4WEN6GUu7jJPwEH9jUs+pDMXd3P9GyKJVKnTzQeXRbBQgbjzKJcWO+3s/Y1rZYXNdWw6mID3l1
 yelFULNuvw4UZToeCvBgcJ5vAxYXFpH+wOZLTW11l2x3Sp45F84JA1bsvGdkogMZ6GhtD38hi2n
 /dg+hhIS/mamPTUqQ7n8IR+iyaB7beAYMix1hIqx4mTqexJCT8KhMK5yLkGCEVatDhkPba4MI5T
 GYpBKPws+mQ6F0ENcjU5TCI/+b6u3N+t66S2DAfYnNqsISHJlQ4OOW6Zen8a+UJYojdpZMbScDU
 Lswxk9ra05iv+0w+Mhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110125
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

Next patch is going to dynamically allocate debug trigger arrays during
realize() time.  We need a way of freeing them during unrealize(), which
doesn't exist at this moment.

There's a lot going on in that patch already so we're adding the
callback infrastructure beforehand.

Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c | 9 +++++++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c1b10cc7ef..5b2133d811 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1012,6 +1012,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     mcc->parent_realize(dev, errp);
 }
 
+static void riscv_cpu_unrealize(DeviceState *dev)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
+
+    mcc->parent_unrealize(dev);
+}
+
 bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu)
 {
     if (tcg_enabled()) {
@@ -2667,6 +2674,8 @@ static void riscv_cpu_common_class_init(ObjectClass *c, const void *data)
 
     device_class_set_parent_realize(dc, riscv_cpu_realize,
                                     &mcc->parent_realize);
+    device_class_set_parent_unrealize(dc, riscv_cpu_unrealize,
+                                      &mcc->parent_unrealize);
 
     resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c98652cd62..11cd710990 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -575,6 +575,7 @@ typedef struct RISCVCPUDef {
 /**
  * RISCVCPUClass:
  * @parent_realize: The parent class' realize handler.
+ * @parent_unrealize: The parent class' unrealize handler.
  * @parent_phases: The parent class' reset phase handlers.
  *
  * A RISCV CPU model.
@@ -583,6 +584,7 @@ struct RISCVCPUClass {
     CPUClass parent_class;
 
     DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
     ResettablePhases parent_phases;
     RISCVCPUDef *def;
 };
-- 
2.43.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEE2CA9EC7
	for <qemu-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 18:27:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFyFW-0002zI-8B; Sun, 11 Oct 2026 14:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFO-0002wl-02
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFM-0008SS-GK
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:09 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69BIKP7w4186852
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:sender:subject:to; s=qcppdkim1; bh=QPCf
 QitHy5Wwi73PjMU3Xhy12JKS7TYpBYVzAmtUj5o=; b=b6pUcsZ5ujBjFRLODwit
 z2hnBw3KF8UTCuYbxML+Mn3P2I4wFe6BuYYvMtusYudSHicI1yGLFj2QAySOTuzb
 ODvOj70AfDeRfKv9eS3jbXos7JOyIcdRvWQkgRPQWSASvMOsQRVE+ot4vOh/s2bZ
 GYA80KK/RBKvfkFw2mzQ1W3rIMX/uP9gMY/baT1IVfI1TkqjW7qChlGeAZXMyA11
 bYY5hMXW8RPKHmQNIKapt1MPRPSrTgcVo2a5YuX97p9FeJw6xCcdZEkyka1IliTL
 D8/e+iU61gGVOThmeK8aoKTIANIKQRH5JvamsYgKN3Lyxft+3Dhygv3HFr2gdTtR
 Hg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7deukh8q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-3552883bd19so1560886eec.1
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791743166; x=1792347966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QPCfQitHy5Wwi73PjMU3Xhy12JKS7TYpBYVzAmtUj5o=;
 b=WhXKq0dB03jfykcRiVCTfteB0xgVhq+bxgO/9s5hkRnUjImrGNOw1Se6HAqw8w9Rid
 SaAQaKYUwe1EnNjJJetYJufjLg3Zc0CpSU1sIIemApUDEZMqdUB/EeXw5oD+zVKnvkgM
 3aCn5ATG2YKdJb69CBHKIp7k53+nJ3TyNhwmpUVaaISKCgd+Z3Sc1okFfE5xnRpeV1Ta
 kp4sUIKbKvrzEvi5endv0b4wZRXdlvSKEQ+tAJxcTKmXpRfAZVyo5/eWQ+YvA4yCkAKy
 shiopJpNKPVVrqlJosOIg9+FdkW522u83lzJt46zgPsz4WcJsLV10u8xtpzhYmS7Sinn
 lWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791743166; x=1792347966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QPCfQitHy5Wwi73PjMU3Xhy12JKS7TYpBYVzAmtUj5o=;
 b=CwNuDPOIr3O3LP8J7gvgSARlYkE+V288u3tIRKDOlVvNc7cKeJPcVeIx4DJQ1i2o6I
 JsIOiGLu0N43g/SM4GStcEuhybcD+G1kyHqdR5+vooe5MwcMsE5O56EP+vB9u537/awK
 y/QFLL2nwwYjVMVVYb3OzTxHaC0Ogds7tpJdi//YWk7Uvj6+0Jdp4UhDvWcP+YHRB7j5
 pZ+5wFMe651NLPaTbCDgw1E1SW9uJtcAUPF/68AOIMv1aH4AhXLD7GWewagLdcGg8M9B
 /9qd8tjmsL0CxbEyuu209dDjcXPwoSj2EACU43BDUH2QThVIppQurQy6MPeFtzA0Pe1U
 xkKw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxH20oJSh6HlW9LQDLdmtA+63DuX6jJB22Y+E+SsC7faNN9SCEakdSr3yai8eAM1qnYVipICaymwt60@nongnu.org
X-Gm-Message-State: AFq9FYJ5gsySd0JGznmIk635F4O5YC7Hw4qFQ6bgxKssj4i1ra8+TcmM
 hwsu3iLuisQGcWFUHz+yThLYz6SbVVJzYvHXK06rVxI64aq5CAexDCoUscopB3sJgLj/R3pq0v5
 9lOUhQwgFcyIKX1aqXYGkvrBvTPL2kOFnGsIb2+MTXG1u7eQE2Byk1F2v5A==
X-Gm-Gg: AYBFou1eDSlXaoeNEiJRWF7yZT3ZW9KTEmoVpEojfSYQduO3w6Xj8r7/kRq0BatK3SF
 iiymHnKWcOFi0mP6i+GgAODa+LRJuBuv7qzfE5qhmA8ECwjs2YF2w2G9giAKRXrfbH/+k708ukr
 Va15qHJteevVT94L1pRlBKUC+j+FlicUb4IWw/mi23xkzKEqhO2SQsYTvZccg7hTWewthVLPPFx
 li97C0DDItHm40IjJp2nEr0OTytXQYHKxa/lbCrVEcIWWVDiiQNtk/3qRsb/ceNyKiTmhKUuwpF
 Sip2MqLbMOrTgSMmPffrmxGYxizHEFIEMZdDuweKNcbUKeBHLWrnLhHRRJ4lEGQKG3dxRpCUnYx
 xvhuufqNmqocoAKrA11+gYsGODIGE05MIWmGN8XvPB0wKt0M+BO2UvQI=
X-Received: by 2002:a05:701b:241a:b0:164:475f:1a07 with SMTP id
 a92af1059eb24-16a55f1e60bmr10830911c88.1.1791743166505; 
 Sun, 11 Oct 2026 11:26:06 -0700 (PDT)
X-Received: by 2002:a05:701b:241a:b0:164:475f:1a07 with SMTP id
 a92af1059eb24-16a55f1e60bmr10830832c88.1.1791743165183; 
 Sun, 11 Oct 2026 11:26:05 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a5866477sm22505284c88.22.2026.10.11.11.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 11:26:04 -0700 (PDT)
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>,
 Drew Fustini <fustini@kernel.org>, Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH 1/4] tests/qtest/bios-tables-test: Allow PPTT for RISC-V
Date: Sun, 11 Oct 2026 23:55:49 +0530
Message-ID: <20261011182552.1071742-2-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
References: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Hv1grD-WG8QuOBKrtw9mhp_6fJsETg_s
X-Authority-Analysis: v=2.4 cv=Aud7T+9P c=1 sm=1 tr=0 ts=6acbd4bf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ou02Ivcb4NLdwMP0g4sA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX9BR9ZycPa/gh
 kzVcAPj4N/fMI85fgs4h4NO54mXks0fLboFnmdVQIvWmxcfxOwPLRMcFsO06DAA2l6gScYlranW
 1uZbKlIxYvNWSzlQXeuA6fUjTAFEfOU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX4W6rZa5V66Fe
 RyJLd7mymRNVRNHUHYy0R3GUZpWW9oGMJmIP8i6py3X9eXCCYj0YGBVyjnX79d09MuQsG88j+yB
 RkZgPFaUy+XDPKyTNruM9JH7prE2Ktm9yjUp1OeAQyJwsYDg7gzx+21/Sk9vkpGt64Jqxhbvfc0
 PnFd2TATkdi6Oml5P7ommeYB+FX9ei/80ojouMVK505NIDXv/0LXf5eMWECCjsVjjhxt2/b0m00
 2D4Q+H3FNysk1QcZCHZcchMbOm9T3LTDi9EgwPakRWrBzfNOPAqxpFQfUBJe7AkDLBy33mQjjkg
 uO3G1e3nuIqIPEnqOxb9Gc6fY+wwwWH/n/VKxbRXC4vevO6ATmRRxnmvf6yT3KHFIpca0rfnJ92
 7N5FyVEDWDFuyVlp7k4pMGzroMeUlGvzHnVQ9UoA8UgbMDXxB9HlMuKy1uXzp83Esu9KfQOW+Sn
 OOyN4VvSV+MaRqTgF6A==
X-Proofpoint-ORIG-GUID: Hv1grD-WG8QuOBKrtw9mhp_6fJsETg_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110073
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
Reply-to:  Sunil V L <sunilvl@oss.qualcomm.com>
From:  Sunil V L via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Sunil V L <sunilvl@oss.qualcomm.com>

Allow changes to the riscv64 virt board to add PPTT support.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 tests/data/acpi/riscv64/virt/PPTT           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/riscv64/virt/PPTT

diff --git a/tests/data/acpi/riscv64/virt/PPTT b/tests/data/acpi/riscv64/virt/PPTT
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..94be7a69a22e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/riscv64/virt/PPTT",
-- 
2.43.0



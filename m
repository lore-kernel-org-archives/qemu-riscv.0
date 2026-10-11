Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CE6CA9EC7
	for <qemu-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 18:27:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFyGK-0003LY-Ff; Sun, 11 Oct 2026 14:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFe-00034O-9K
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFb-0008UN-SU
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:25 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69BIMPYm537933
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:sender:subject:to; s=qcppdkim1; bh=TFbT
 Fpoz4msVzOvA76OFjh3YegaGvX7/iHzSOwQK+jU=; b=iIemfP4fbLcvqlyM4NVx
 wWzW9qc7PbkU8vLEBmh4yGdiPWmWL9YbYnMpJ2E8EJaZQqJKH0pRJMTzre9GTmUT
 x1tDp7DV36EmkxTjjeDYhqd0fZVctG6B18zP5ZcyXc8jYONwomPLgVsctIiWZdWl
 6ufKTlVuun26iOTSKxFPnulcOwjaO+5z7PFrPLMwmOhCULnziV/NVWsP8Aa5R/ZJ
 B4ow+J9niaXtsJY6soSbu2cLIHc6oDlwFoy2RlC0Xzc3d+EkS7Iks2CXlGGTJEqX
 AGOrjCd+TDkLFBWlQdAQre3DV4logubmuYQFmKWFsa6RI2Nyzepy82DmKpDCRmGc
 fA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxkpdv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-3592749a017so838188eec.1
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 11:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791743181; x=1792347981; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TFbTFpoz4msVzOvA76OFjh3YegaGvX7/iHzSOwQK+jU=;
 b=CuNGVRQIxPk2QOmfR9HAK8pE1LbqEmEKeUUfWKlL2q1JVEgYk7d9cHqLY4NAgoKtbZ
 9r63n07OOYrAn6oCGb1vs/MngLIpX27Z3C6vQuyrTHFh2i4LTBoD9TcAFxzZX0FDDD2Y
 vgVd0Ci0mqJVnxPg3pKP638Z9x3ZBMDl9Mwp8CAVkNXxTHlszVnyz5e+hX5P5uPyk5RQ
 aFiaLZcmEnf9qN8l4f4EsP+O3OBvJlRXcRgLTwiLiJqBiMl3cPtdr0yzY/AkYgKCJk4v
 eImwvfHwt6HiFJ4yHYbZgvVYhccjHSwLtgGYeQGi0KbdozW6vgYvBZ5ZuFluF9IiDK+O
 gTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791743181; x=1792347981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TFbTFpoz4msVzOvA76OFjh3YegaGvX7/iHzSOwQK+jU=;
 b=zWHliy4ZVjhI+IwAvfjpWSbwhAf1zU05VXTGbaTYez5tSXtdbzuQZo0WAY6alLrHQP
 JKtqHK+eDVcLn0sPynhwwjUUpvBCb9pXtXmV1ey+Pyj2mbgDVjhyr69ujBg2d1/+GwWD
 7wniSDSv5XZDaWYPBogWdOdJr0UpTB9ERx4IszpleBcU55k97HRKtLG+c0Xn2Mh/JN6q
 2fN8UjoqDaczfukzSgdK55FkZ//4Q0j6ztcIwvunfsSIEK4zd/NLT1WDnPuVlX7cxYEr
 5Uj34j4aiMAghws80i94z+spCBfRl1Nc6X4vGDdZm3ALy3R9nbFWS4JZ9ABJR3CC3RD4
 XlgA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzOfVzEFSeShFUXmwen4WJacuUNQaYCO3ZfOQj1e7eG6JBr0OO0FoPiSVg9DGyNsgvYYmVBY4rRETot@nongnu.org
X-Gm-Message-State: AFq9FYIu9wSzTSsf/um8svQcLvwQAnmvRrMU6AKnXrkt90HZ1ddIhmNq
 QP5HO3JUVx+N3aMrG2o4qRFNtTG+egSf0NKYq1Zny2IxEqHbQa8oDIxpbe2frL/qKmFovec4u0y
 I6czkapYmFIpcn6pJvuKMpU3BRQK0vnhT60rxmPX4Xj0UIsSzZTXIvEKAE1ITEVUprg==
X-Gm-Gg: AYBFou2LMwtiVPnUDUPitvgZvey+mYtd/ExLE1Ah+zGEhqLz1a/zMWzv+LQ26oiyzc3
 zi+31j7OJgOpOvP7Kz6BBz1ssYF8feC0rAwdPw1E3kXY4XU7MnKKjax4uZGiXADV6xzY5mCZmyA
 vFhjTQC9oVB3N1wVu706OsMurwaugsJKVOhDaB/IgbUkMAboG14XB8xwvnhTdcybipAKkWvvHuF
 gItB7U0+YeLH878r/v/4akEWcGC6PpmDrx6ht757EdNeDgI2rQnYcjOeriq+HUxcl5Ro50dXUUp
 Vi6kaKnvkt0a7gyTxANOhLyQwkiZVDR+11oAvsrXjBUdEVxZ8Z5Xdq8wQ7tERCxe3ezHru1N1K1
 YsVI7QhfjkNTV13EYVIoT8XA5mI1qwq1k6R32Ozt0NXhQ1nNghqTVLmg=
X-Received: by 2002:a05:7022:c84:b0:146:5f73:d45b with SMTP id
 a92af1059eb24-16a54fab691mr9918450c88.3.1791743180952; 
 Sun, 11 Oct 2026 11:26:20 -0700 (PDT)
X-Received: by 2002:a05:7022:c84:b0:146:5f73:d45b with SMTP id
 a92af1059eb24-16a54fab691mr9918432c88.3.1791743180475; 
 Sun, 11 Oct 2026 11:26:20 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a5866477sm22505284c88.22.2026.10.11.11.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 11:26:19 -0700 (PDT)
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
Subject: [PATCH 4/4] MAINTAINERS: Update Sunil's email id
Date: Sun, 11 Oct 2026 23:55:52 +0530
Message-ID: <20261011182552.1071742-5-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
References: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8L-VCQOnecT_Y-4DChU8ZeJaaFTRB9qc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX/DWLXfg29bsD
 HH+H14lIwc4FDgv0Lt8wOBzCoW20txvGRIUtS4m2ZEGREtKeF6mpEeJo2i3Xv9eca2SoBxEu1cn
 1JrPFlVRNifN5X84Hz+I7i64JPTNLc0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX7mDttCAllVgZ
 zY1SLThV23dg/O3BOCXcqrZl89at4Qwee6eyqP2lzElUfD9aVcmQMW9JiHfqdefoY+TYUxoNwqu
 HTJHQRBvn634y9UV/D1Mgpab7/3/dutpGtmsORPpDqSfhzIXEu3l2nNBOtQfqCb7ou9xon7ew0g
 +wEEn54n/a4/c1aLQA22NSiWIotsvRSLUud07WZJUQVVN6lIPMQvqaKvFsFGrejbtxuRdB6hCH7
 cDIPTa0Q+Pcmbym3Dor0zBxuSO+96x9c2vQvYmDNEVEnat1zQsRpldFLTe9tDUOLj4V0Iu4Hw81
 GVM4CUFSJxOxfcEEIjittcur+l05mi2v3iJYIzHDYPxmWUc9psM0qG2vQAPmQtjWMwzLegLQUUN
 9W3QbnRD77ICJJ7RTmVTfNr10Jy6GgyZ5AjHcg3YWrqgPyvm09sBnjAOr+ZmwODDDMykd+5V9rJ
 hcpRv4CGjZdNr4Tm6bA==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acbd4cd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bDdBU3oEAAAA:8 a=69wJf7TsAAAA:8 a=iDT6BKECi1uCQsOPTuAA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=DN7SgORnOiO7RqxRx1GC:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-GUID: 8L-VCQOnecT_Y-4DChU8ZeJaaFTRB9qc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
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

Update my email ID to qualcomm.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cc426451c2f..5c2282088610 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2335,7 +2335,7 @@ S: Orphan
 F: hw/arm/virt-acpi-build.c
 
 RISC-V ACPI Subsystem
-M: Sunil V L <sunilvl@ventanamicro.com>
+M: Sunil V L <sunilvl@oss.qualcomm.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
 F: hw/riscv/virt-acpi-build.c
-- 
2.43.0



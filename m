Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B509606A31E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 19:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U0hVcBcc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MEa9LVxf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVZpW-0005iT-Ee; Mon, 23 Nov 2026 14:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVZpT-0005fK-IP
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 14:35:55 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVZpR-0006qB-Bh
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 14:35:55 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANJ1nsV3211957
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 19:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=wQEm2p66UgyiG2rgx/y6wNVsgtEm/4Z2NAA
 BzyDhRZY=; b=U0hVcBcc1RAgBJNHXJSnbgxe0r6GNkNUKPZwFGYFtcizWHS1iFs
 HJDHtTfoHkls95xRF5YRjc3CT/NY46Rv3zI65hj5fR+Pn8CIq9L9UHKM0No8cOeH
 ngdZbZU1S0aVkH7ep9sRskghoqrfWJe9E2xp3aBuSHJZuaIOxZTDlOf0j5ejAap7
 Db+4pnxihRidWCcZvj9q6VqvmcnkwipnCswiiEhlfPyrwXtcuf1J1Nr6Lek+Y+Nf
 IR36r9e2Waok5pKtp0kXA38t6y3+J16C7CCkpjy9vsCKPrVFlOnsu/IR27ayEYhs
 GD9w4Y6sqKBIID5n8tCyVAUPWgiSGuky5+g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr4jt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 19:35:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91c6c1e082bso78632286d6.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 11:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795462550; x=1796067350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wQEm2p66UgyiG2rgx/y6wNVsgtEm/4Z2NAABzyDhRZY=;
 b=MEa9LVxfmZJbODvm3HpE7MdMWLYw22t18ntgKjfTArO62eY5W8gPnFh4gYOJz2GgjT
 DkBYc3yGf6BqdCpiUUO3Y6xCE7vYD73QXb6s7l18sT4piGGTzwDY7+4marpUjMZD57TL
 2TL9K9LaTy3pqc3iQlwRsyGIR7R5yRUWXuFstcmyFl/zqyvHAkszHLgOIE5XsvTAALUX
 949Xi712nVGingOG0qUrzNviC+z1utsMhSjfxBGy1ecHd2vLVv8fi4uyBa22Gja4HORz
 x8vBr4WMeASqACpFycBfaf898uxFxiLjIE5k71CNV30xcOcU2LD5rMKY2IHXWyTfj47m
 MwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795462550; x=1796067350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wQEm2p66UgyiG2rgx/y6wNVsgtEm/4Z2NAABzyDhRZY=;
 b=dLGjeVdHThWIlKjuer+GQDQOqkF0ykkZslW/gGxtqe+BB/M+GJU11G1Xei1om2IfP+
 My7QDVi1LvyGB/+ZbfCD4R0MiYZ23/jOzRzZ4UHEV0Osck6Yzv6vi1ymgvdCTtvRyWcJ
 swPqTbCmHuNgOVc+uFNvSzJidSuNcGZnkho4liIUi+ShXmf9dCNePalQuadrwguO+4OQ
 Zk5y+pmkNE/LLx/JlOJzz2njpdtf1A7XEwkcvy9O7cciTdE7+4jNribn7tQOg6wark7N
 TISMhctgTgndo2udNE+arRYqDmsO/wds75pPAasaWLqKswaWOynyN9vV8JlDYBA6H0Us
 MQWg==
X-Gm-Message-State: APuU4Z/KF7l6/GzAKEFHntjszRHCVzRFnJSpM4W6RCZMd4rMgDWtbcMi
 37/2kr5MAJjuePt+MhvfjQIdzpt4d3/K7tq8DdH3io2G8wJoB5oOZ6Bd0JO5qcloZ8V8yjMXVc0
 jplnMecofdhAYuN5y18RF1WJ11IOO5UIWdrUjJgRCINTB1ePlvsi3M6r7Og==
X-Gm-Gg: AZFdTZdXNSlrfv5Crg5iExbBwBrWzhmawEKt09hbj1k2iWFU0iT8uSN7fDlyQ4NFrP7
 9fjnUkkoGRiO1sC7P0IqUtTMih/hbRakrK8MuDEw21F5bn7Fhbl+2dn6vlj2xEe56ygdPAeaDmn
 HKU90wFrsimO9uZ8y0MyYQVCmt6A5WL95wu43qIFMBqidNSD4q6zPcuMgs472DM9fBNrFATTQPm
 sXAEnPGkMIytRu1QczndVYC0w36i6TBg3DReomNMq5Arw9jy1JsdIp+KTSlAhV8CrILplwtLZEw
 8Mtc+QXcCJixTBE1NlPTcfqWQMUuZz7GprmSzaXsELpaokApxFe3iwZeA8dJw6fvGSRZtnSiK+N
 TXNCSbmWXAewgVV8xWrYexJcpjyA3t+7sISEYAZ9szBVAC/VQENRRuFzfu6SUfCrhVB3Ob1qRJQ
 c9tCwH1TpwOg==
X-Received: by 2002:a05:622a:228d:b0:535:1a6:6e8b with SMTP id
 d75a77b69052e-55d76a1f717mr208316791cf.22.1795462550105; 
 Mon, 23 Nov 2026 11:35:50 -0800 (PST)
X-Received: by 2002:a05:622a:228d:b0:535:1a6:6e8b with SMTP id
 d75a77b69052e-55d76a1f717mr208316371cf.22.1795462549676; 
 Mon, 23 Nov 2026 11:35:49 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55da2408ba0sm24439651cf.20.2026.11.23.11.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 11:35:49 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 0/1] target/riscv: do not write RVG in misa CSR [GL4811]
Date: Mon, 23 Nov 2026 16:35:43 -0300
Message-ID: <20261123193545.15632-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX2/5zERbEafXJ
 lSwnMO9PCsFa3vd12lyPIURv3jSWKWCR9YEcS/XsaHQfPbHN8V2B6cDgDz073smtSMnIcWcESZf
 8GmuVWH77diU/q3m1nF5j/VirkWkDb/5lKi6X+y2iwcfBEmDqTRaCLbmqqEADnq3p4xWF+5yRpU
 xbrJOSX5JrZszulyifnR1zjDTYps9V8xwqiTjISyjnfirwmtVR9FNycVkBuB4UQPWYGypJLbz4T
 E2mOcqi/EaatuigM+GcBcybudEPNQHJGHQ6ve8e5/u3Sdl8NoAoPAFdyd6PoDFvZTYYPFiRhyCL
 3C7g7yr4ibDObpIEl+zStDWp14maktuZ5oaW7S0XkbFqzpkOaUE4OLey7jd1zUQBKxGdWD9r2SC
 /SqH4AHDquauM+c8ef4b8LE3YeKaP27KhsofC9C9JfL3gs554lY+n+GYD+MvkpZ1pDJNvQEFK2u
 Uywu/sWNLxQ7Q02LFBw==
X-Proofpoint-GUID: 0wnE_dri_0hzqWGhrCiuew1LeDcB3b7U
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049596 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dADub0cJKTBBEdyMd0IA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 0wnE_dri_0hzqWGhrCiuew1LeDcB3b7U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9/H9TJL5gwOO
 DqdesV6b04n4p3wJAwXUtO1jWKmSjHudv7fdRseYMWPPll22QIEGknIUzMTbKMuKcK8o8lRImQD
 Qy5ca5nnAPk6eWMFlkmlvfgXg8eglYE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

In this version we removed the change in the RVG description, as
suggested by Alistair.  Sashiko also wanted a "Fixes" trailer in the
commit msg so I added one.

No other changes made. 

Changes in v2:
- do not change RVG description;
- add a "Fixes" tag.
- v1 link: https://lore.kernel.org/qemu-devel/20261116215953.871862-1-daniel.barboza@oss.qualcomm.com/ 

Daniel Henrique Barboza (1):
  target/riscv: do not write RVG in misa CSR [GL4811]

 target/riscv/tcg/csr.c               | 17 ++++++++++
 tests/tcg/riscv64/system/meson.build |  7 ++++
 tests/tcg/riscv64/test-misa-G.S      | 51 ++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-misa-G.S

-- 
2.43.0



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681CB606A323
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l3H9ozPW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kq14SEBS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRTjG-0008Rl-Ek; Thu, 12 Nov 2026 07:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTit-0007y4-Ak
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:13 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTip-0002Tq-Oz
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:10 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC97H3Q2514188
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=H+sCbLt/EDRJTePa8WOgfEbGWf0x4hGuAxD
 bJwe5qKk=; b=l3H9ozPWDY6s13U/qpLAMSGEppijrXBalCuXCJCRQxAvkfPkKL6
 GVSC1jf7Ca1ScHOgT9MO02BehJHXr5gyHDWsnkgyDfWhEmCCno98Q0qIpF9VOBZ7
 376PTvjo4GTNkgnHoB+j/H8vGzXUasare/scmjnZQRdnTxtEiFko+i3Mh4aok/MQ
 1HFU+Hho9fWEzywz0bqBV3AS/XhRpZeukstUQ4IAR3JiTzR0xgWZ9ebtyMsX/qTD
 6S59YG2+wMWdtq49EjVJ/asjUMT2/1FQ6vHvg7r9bu2Srh32pEpVxKRnJ2+JPS6L
 jR+JX/dCLsn4Ef58EUzj++korq+84iDO9kg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1ugdt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-537548d4bc0so98781971cf.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 04:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794485760; x=1795090560; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=H+sCbLt/EDRJTePa8WOgfEbGWf0x4hGuAxDbJwe5qKk=;
 b=kq14SEBSMDCv5V1xg4mYjBZwij0Ah+k99wE9itPWRvPkTvqkI+4gGa778UI90FTS9H
 JrQF/yLvmcRv9ZIZ4rQvOTUZsSuG/ICqvlshmfx3AdpDBGcSyPn2fC2K9aR+igA2lrlp
 XmJZ4KhIYy16Mg8kF3k/V0dNOhNotSqiBFJNWKJ7QCRgKW8b0Eui4C9Kqb83UgdXbw8V
 vWGKw8ouOTV4Eia+aQBZk62pC30VA6mwq1nJPLd5yhP3fRFUnYt4haH/9QWZjwk4gToC
 1Q8TfT/nEKuSu6X5Tx2G3KBN3N16s/n+ekd5LosagAT0EP5iMN1FWC7wiRZUCS+LS3mC
 hRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794485760; x=1795090560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H+sCbLt/EDRJTePa8WOgfEbGWf0x4hGuAxDbJwe5qKk=;
 b=mjKpK+3gPpL1eqhO+EkQL2atFMtLZK5oWnTe0Aol6ANSnbenyK5oQj05OWoEo/N5gi
 yow67QCnZIelk/o5QRTjID2DSF5R4Cr2Ge99A1hVrqIHXlSI311t/lFtu5+JKiGZZblG
 rcaHXNsUwNNYcR7PRe7PP49m5Wt4AF2z+JSVReXCuvSlhkxmVtx/vDG1O8GpGTUqeOoL
 Wbsuslivm01SEyCLZRyI9TwWuMwFK0885WdBSpSzT6Sx9iZR8P3q284tRMJh0ZtDbW84
 QOpa6xD0f7RzXC39htUWxDgSfZM7NOp1z88tD3thyEYye2yDPrm9laVxAI2xJGvXmX2B
 K5FA==
X-Gm-Message-State: APuU4Z+eUJIGW9uut65Ug15nrQJ6HVqCHtdkWWH8hm5wcDJKqVTJJhaA
 k51byJeyXcxT60KVERTkVCIbzIhEVyD7Jm6ts7QIzRoop9M1ZM3kBMywzxRGMWDUDytuq+E3ALJ
 FVMh+ye+UqB6fX/cs3PSzlF4ChqNsyeH6kZ6ocKdDJ9p03ImzgUfKkMiQ/Q==
X-Gm-Gg: AYBFou2Wj3kmU8nXiNK6Ynmg5ifhpEK8m+uECLkzIz01jVDHDwlefgxJtPJF32ObYnf
 d+H7wKcnj0seWXQGwiMVuB82PYMMmpcLs53B9Rf1vzzah1iwf7fuhLvgoFwmEie1stkgh0P25jP
 dJqP3UKHRzUrXg5XymdrXGWdNdVO24kaTDUo3g/kb8pjdFJY1Vw9wTDClWKJC+zU98qxvDJoHPH
 iC2uGi4X6H5K12ftOOXNWg7hMuJiO1SOPwHTEhQTSBdeMnQIc4GDQUJBtzJ4+a44cdjX2QIs8s6
 Vje+RzzyC9bPuKA/JNzC50fjUQr1xtCl/bI27n77/JPFN92Xf7W61JZcXjGgLA6X3bOFvNYjycL
 v2WMRFdlPmx4BgG7UidGSvENgOCogZ9iMnURfNGWKsuWjbqhXPxLu9okPjm+eQGnS10YViltKSE
 W9gvqP2baH5rVqcVcuq84UW/PQn0QcEcZzu0YHjpZhGZtP
X-Received: by 2002:a05:622a:5b8b:b0:536:11c5:1dc1 with SMTP id
 d75a77b69052e-556c1b5fbc5mr80750471cf.76.1794485759566; 
 Thu, 12 Nov 2026 04:15:59 -0800 (PST)
X-Received: by 2002:a05:622a:5b8b:b0:536:11c5:1dc1 with SMTP id
 d75a77b69052e-556c1b5fbc5mr80749861cf.76.1794485758910; 
 Thu, 12 Nov 2026 04:15:58 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550af6096asm73538651cf.5.2026.11.12.04.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 04:15:57 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 0/5] hw/riscv: riscv-server-ref refinements
Date: Thu, 12 Nov 2026 09:15:48 -0300
Message-ID: <20261112121553.485439-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5ae00 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W-WtfK5NM88bNPkTKY0A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: dFOT61KEs-s-Yuz7KZ1M6sL6Y3ey7_AW
X-Proofpoint-ORIG-GUID: dFOT61KEs-s-Yuz7KZ1M6sL6Y3ey7_AW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX2/wlPisMaC6r
 L2fZ/Qzr6ssNub3Uh+yU8yRjwAvxvmySGoPvkqxDPc6OzWOVgJDwkoQWlU18sNTUQ+6mtQ8IMNG
 zZ5cH764DoemMBvOk7vaLZRzOcyK3kEAAESnCdWidXdmRiE0u1OXGC4S+xzpdc7IsD9Hj8gFqzW
 SJ6ziZS04puYHrQkdLqo4FIxfnOaMt1QaCGcDw+dXxvyqvedjP+0R8i7hZadhav2bStbd/QhciP
 NTNlyo5ujRzb91P5POlLcteaup6D+yg/lVL3Ud6iDhG0C7U7P222TKI+JCu0XpTnW6iaj1Qq0JA
 c3qNN3y41MovJP9PKw0bgeUjVp0SKml/9JZHKiQGrpumG5cGDD4090iaTCruD54Tr4KGZ6s9Nx8
 dqV5KbFxM9A+/QEB610/guUcUpbd38cswjJPxQSL4C+b+Y4ydRYOzqnQt0x0APactgDrDXeEU5d
 I/cK7J2gTbGfUapBRcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX06D28abWoI8J
 xUZUjp3aH/bmu9IzCWXXb+BOh3pWk4NfRMfK2sr7uoD8pbisY7NpWsJ+GGZ+NJUvDzy9y4u/dKH
 rCbMFKwpkUlqR/A2ERYDcHdS1Po3Law=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120048
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

In this version we simplified the way we're setting hpm-counters for
'virt' and 'riscv-server-ref' by simply adding a new param in
riscv_create_iommu_sys().  We'll revisit this decision in case there's a
need for boards to change more IOMMU properties during device creation.

No other changes made. 

Changes in v2:
- patch 1:
  - add a new param in riscv_create_iommu_sys() to set hpm-counters
- v1 link: https://lore.kernel.org/qemu-devel/20261023160913.24992-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (5):
  hw/riscv: allow machines to set 'hpm-counters' for riscv-iommu-sys
  hw/riscv: make UART FDT helper consider baud rate
  hw/riscv/server_platform_ref: fix UART baud rate
  hw/riscv/virt.c: fix base baud in serial_mm_init()
  MAINTAINERS: add contact for the RISC-V server-ref machine

 MAINTAINERS                                 |  8 ++++++++
 hw/riscv/fdt-common.c                       | 19 +++++++++++++++++--
 hw/riscv/riscv-iommu-sys.c                  |  4 ++++
 hw/riscv/riscv-iommu.h                      |  1 +
 hw/riscv/server_platform_ref.c              |  9 +++++++--
 hw/riscv/virt.c                             | 17 ++++++++++-------
 include/hw/riscv/fdt-common.h               |  1 +
 include/hw/riscv/virt.h                     |  2 ++
 tests/functional/riscv64/test_server_ref.py |  3 +++
 9 files changed, 53 insertions(+), 11 deletions(-)

-- 
2.43.0



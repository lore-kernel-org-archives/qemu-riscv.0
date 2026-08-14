Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831C4C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 04:53:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wujvF-0008Nk-Sr; Fri, 14 Aug 2026 00:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvE-0008NX-NM
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:53:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvD-0005Gp-1o
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:53:36 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E4QeSi3614508
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=skq5ZAiNcmJWYXsxm2M0Iy
 LH4eFn588s+C8+yB413JU=; b=fFf6QugyAWUSYMsPBKqGDD/H8CtwK1dJd2vmW6
 yPozHXypSbsHAc9UsnF3AVFDMg0aMx3N1ntYo2X1kddKa4CZpVD1VOuOfLaWphbo
 5QuCMxAU3zbP7jrlJwcdkpN1EpMsAiQLPJWoll3GYSwilJqe24qUlWwc/5s6+jgW
 EPqefm6bQJUQN8qLGf1hMoloYJgDBCsarfRFCL7l7LBB5EurZV5i+CcRrhCOfwOi
 DwpS1zfjSZJYTK/CPuFSU+5HlXOLzyDwJk+e91zL2eRg3TCKmxQB8w8xsOpxCLEV
 rfCCKl7B3bebfhmDbVuaCX/V0rh3T50QIftQPs6bP12UJTRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy2fgk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:53:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2ced1ed870fso1410935ad.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 21:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786683211; x=1787288011; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=skq5ZAiNcmJWYXsxm2M0IyLH4eFn588s+C8+yB413JU=;
 b=PzPUbadkML7iN4JnmrSd0Bm+Sz4/UHc6XAG7jVxWdVQz+aW/bOyUQJZydVsTz6qDzo
 OWTgeD0jXCC5KcRRd/N+t52smUb4EfwOfGS5VI72hYV+cE0fsxn/NsVg073tWbYZsQvw
 TRMWAvdZxYMlW+8qtqjnvO1VPLv9dvjV4Iep68K6MZ4XwJ254RWildmPR40UggCOKl3T
 hMiXxNYHGxWlDh3deR8wdz5INmrCOzIKvizgQ51gHzMXKF4vs3EoHaNTJZfQG1ZdqsKC
 1vi0p6/B+02sc/CpeD2xG3TnIp9YF8g5kVcOEFdUDUiM0X/VU4xzdgGLhmWRdyu5FS61
 j2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786683211; x=1787288011;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=skq5ZAiNcmJWYXsxm2M0IyLH4eFn588s+C8+yB413JU=;
 b=Amtuf5ZvKDUWqG2imSka6UZaeqtjfXBBu1dsPUoMqwXrzM2FHIg0keYZ9Ys44I+VCL
 1Mx19xRstd870TlqC5JXcK5LcrRo2HNbNfEvDc6YKnGCR5rHEKqZjIZVax4PgBS5YV24
 s07KouhzOhDTZ9RhFE+YR8HBH1xbLm8IfzXwoE4oyIB2Bs8g3u34XfTTeTtP2bNpT8tQ
 AZP4JMwifpzvY77i5ztIaobgC2xbFSzV89soFGzWW+iF/XAdFMcEskaVF6+Z6Dyh+vUb
 AsUItGr8JSqMN+iCclUhve5PowY3SRwsYyz2kvAljPt95Q1rEUKc03W4Ayphc4+qHGX1
 JfCw==
X-Gm-Message-State: AOJu0YwS71Elr43kHRY3U/esIQBxY2nlxs3+pvtxHq8gmgeTKJgiXkwY
 kconFGm4E3LX865+/v2PQSNfYkP/Xw+9G59JDYukZVweJYhdA9rum2RTpLy1sZRZOFThYNkNgC2
 A2lX97Y+DTDAZkHlBMcd7WGGcwoMZqOnBd2NleHfvr4oELAFt1txqHZfO5rHHE2x/cQ==
X-Gm-Gg: AR+sD11ofVNJyiXWhxKLTDVKbbdaHUfReSHwcKduItG1INeQJEitWyg6SGywGgzF/d/
 MfBDWkj97iIttoVRUJtCY/Qwd/XfdyCM8gxfJcyjZvVrBPwK9+2l8cEnJKRoF+gowICVLcZXz6c
 3y+3yZ2UNvCorMY6tzyyvyfVfLx1iOXm/cxSn9Ls8ogcs6EVDS18qrjjXigwqq74jTDf8heQtEN
 /Gg5ZuXivWHRXti7Y/3oVKitWQiolnblbebeWl8aWwsevq9+QQyEUaCSXrokkgwv5v2ge9V7sEc
 qhw8RImVv9KadVHzmgay4s1r40qM75ielMp0bubNZTyUOGE7gu0HbOvjGuauJXu5e5GNq4+nMIo
 y8lrXEzBNoNGnQ4rwyJmkPoViedflE2EgMD8zGPD7+0p6YKGsPIgErDf41uqj6iX2cUunB87TXr
 wGRlb1pe9IGnH73LJd6MEayQwEgEX8HIY=
X-Received: by 2002:a17:903:2ce:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d3b0827041mr23711345ad.1.1786683211043; 
 Thu, 13 Aug 2026 21:53:31 -0700 (PDT)
X-Received: by 2002:a17:903:2ce:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d3b0827041mr23711115ad.1.1786683210538; 
 Thu, 13 Aug 2026 21:53:30 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31f15063cd8sm10625665eec.9.2026.08.13.21.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 21:53:30 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v8 00/10] riscv: add initial RPMI virt support
Date: Fri, 14 Aug 2026 10:23:04 +0530
Message-ID: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfX3383iEQ60611
 2MBsmViLpoxwGGd6pR172cOXrLuryslGFWYNIGCRVcmOzrWArRcEzfZQGD30a32rL0fTlTZiEk4
 66dZJO51neM9i2nnvNAjCrFZ/3pHQLTTotp1mqsksXQD2Eu2pgo7+g/Ny8oIGmeY+PGaiuULunX
 J8UtTocstReqSsI5Xs6qcJgSc5L2FPY4/rGDOssZO9cS+KkuYEZv9oSJ1oitRNO+kzUVt4RKZsI
 bkvUjn/n/uQ/uFWa5nzoxEDIU/A8h9lclZPWINy8Gr7OAbO2ARt6xS1tM4VqT/t9KZ5Jd+FTQmZ
 G6pbk6gb3w9FvtM/Ttc24wycqumyuYGltlpBqaOoo/NvP6mCa98+JDphUo2SsfQE/DKAWMx7vv8
 dgtxgUz8WGsnzHAbVdxXa9H1Ybh/z7flx99wBUF2d6pevOVEzWt6wPcthNm9vnsDrfxNnm48M25
 4HFSdHr5qZPUqyNKQ6A==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7e9f4c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9ONo2BjGoRSARuvHahcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 2P7Or5Ax9AyWSNmijaeV7pCLt_KmkLbm
X-Proofpoint-GUID: 2P7Or5Ax9AyWSNmijaeV7pCLt_KmkLbm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfX1KWxLhskaKCA
 440pM1C5NinqCjS+pK71j3b0d9s0I2npCIzO4tHVjXTDDEUIgHiYUrUjkV3q1iovC2qDzqtP/EV
 FUh26NyuG4enSmGSux0wAFvnK9ImDnM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140036
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This series adds initial librpmi-backed RPMI support for the RISC-V virt
machine. It covers the optional librpmi build dependency, the RPMI
transport and Base service, virt FDT wiring, opt-in machine support,
System Reset, HSM, System Suspend, documentation, qtests and a Linux
guest smoke test.

Changes since v7:
- Drop the redundant internal RiscvRpmiServiceKind field from
  RiscvRpmiServiceConfig and use service_group as the single dispatch and
  FDT service identifier.
- Move the RiscvRpmiServiceOps table and service_group lookup
  infrastructure into the System Reset patch, so the HSM and System
  Suspend patches only add their own service entries.

Changes since v6:
- When RPMI is enabled, advertise reboot and shutdown through the RPMI
  system reset service instead of the syscon reset nodes.
- Extend the functional guest smoke test to check the RPMI reboot and
  shutdown devices reported by firmware and exercise the reboot path.

Subrahmanya Lingappa (10):
  build: add optional librpmi dependency
  hw/misc: add RISC-V RPMI transport and Base support
  hw/riscv: add RPMI FDT helpers
  hw/riscv/virt: add opt-in RPMI base support
  riscv: add RPMI system reset service
  riscv: add RPMI HSM service
  riscv: add RPMI system suspend service
  docs/system/riscv: document initial virt RPMI support
  tests/qtest: cover initial RISC-V RPMI services
  tests/functional: add initial RPMI virt guest smoke

 Kconfig.host                               |   3 +
 MAINTAINERS                                |   3 +
 docs/system/riscv/virt.rst                 |  65 ++
 hw/misc/Kconfig                            |   4 +
 hw/misc/meson.build                        |   6 +
 hw/misc/riscv_rpmi-stub.c                  |  16 +
 hw/misc/riscv_rpmi.c                       | 544 ++++++++++++++++
 hw/misc/riscv_rpmi_hsm.c                   | 287 +++++++++
 hw/misc/riscv_rpmi_internal.h              |  41 ++
 hw/misc/riscv_rpmi_sysreset.c              | 206 +++++++
 hw/misc/riscv_rpmi_syssusp.c               | 191 ++++++
 hw/riscv/Kconfig                           |   1 +
 hw/riscv/meson.build                       |   3 +
 hw/riscv/rpmi-fdt-stub.c                   |  37 ++
 hw/riscv/rpmi-fdt.c                        | 103 ++++
 hw/riscv/virt.c                            | 176 +++++-
 include/hw/misc/riscv_rpmi.h               | 106 ++++
 include/hw/riscv/rpmi-fdt.h                |  41 ++
 include/hw/riscv/virt.h                    |   3 +
 meson.build                                |  14 +
 meson_options.txt                          |   2 +
 scripts/meson-buildoptions.sh              |   3 +
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 184 ++++++
 tests/qtest/meson.build                    |   2 +
 tests/qtest/riscv-rpmi-test.c              | 684 +++++++++++++++++++++
 26 files changed, 2725 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/riscv_rpmi-stub.c
 create mode 100644 hw/misc/riscv_rpmi.c
 create mode 100644 hw/misc/riscv_rpmi_hsm.c
 create mode 100644 hw/misc/riscv_rpmi_internal.h
 create mode 100644 hw/misc/riscv_rpmi_sysreset.c
 create mode 100644 hw/misc/riscv_rpmi_syssusp.c
 create mode 100644 hw/riscv/rpmi-fdt-stub.c
 create mode 100644 hw/riscv/rpmi-fdt.c
 create mode 100644 include/hw/misc/riscv_rpmi.h
 create mode 100644 include/hw/riscv/rpmi-fdt.h
 create mode 100644 tests/functional/riscv64/test_rpmi_virt.py
 create mode 100644 tests/qtest/riscv-rpmi-test.c


base-commit: 9eb08992b1df4a3dfcf442b1239678095e50471b
-- 
2.43.0


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE13DC43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 07:57:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjY1Q-0002Te-5p; Tue, 14 Jul 2026 03:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wjY1O-0002TV-He
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 03:57:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wjY1M-0003Zy-CV
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2026 03:57:42 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E6SXqA3954638
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 07:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=5Z1VbaISfen1BwwS6TsSjh8FCYZbQa3EsNO
 lhIfh12U=; b=D6YnAup744hKbuDq2WwSaxTOP6vloycLHVWXbaU8XYeWczyBjyM
 FilYfO44F9cjpBpvYtfyAqcmCpJ6h4cxUoP4PQtSOrvKPAulJaLGjAS8edLSZOID
 ClD5IpKQJ637ifsgJg1pmLMLy2gdgBGISNZa7WDfIH/k6a2/j1NnR9L0+YN5eCty
 rsuSG6MDjZcFi5S1dzInhzt2WPGNxLwWFdE3XOjSWHziVTIPtfaWn4ovKRx1HgPS
 fQfRecpTMQimhayVUGCwNT7nm09YhIkHO60PdIzEeD/GRUWdy6rbnq5VqxRJMwOD
 hwPuLhR2HvQapL+EBwbEcutKfyJqs5mKGng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jtr5d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 07:57:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c9e11ee2b43so595928a12.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2026 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784015857; x=1784620657; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5Z1VbaISfen1BwwS6TsSjh8FCYZbQa3EsNOlhIfh12U=;
 b=QXM8K+/p/0YJ9NabayTrZWbkaXhHEZk2VW7Fu7hdk9KBKXAfrgRivqM1eoU5KixHk2
 14AUHzS8L9nQ2SeK0IjVF0MfwU1m1Zp5vZW2QAoVQfnMQnWJD5/CLXK6MOiaJS7zLmpR
 MFLIHsTvzA2k4FFH7uYle3zXjYa2kir3Od8ejsN8fkwKPYTuqlDLIfT92hftXdD6Nni8
 5aR69/9DaxChNRcWAr6oCfqOmYD1EX6vHwIlF5TE17D19TNYRUvj/ZtqQSIVu3EyAXwi
 LaMolzXyptvWaRkCC7Xi7hZzHMbe8bqbaT10fz8rv86Z9DOkPZzMHkCSXPYXBmYBbP+F
 GO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784015857; x=1784620657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5Z1VbaISfen1BwwS6TsSjh8FCYZbQa3EsNOlhIfh12U=;
 b=HING4C8GxyY6YcUAgaAKofmlgYxAlOm5VAjLJvyinIND5wL/sSIxL6E/W2HRgul/Hn
 jZ+otRvLxPwICIZzVlZ5Q73IvHBqwdUMiMz6R1F5FOpo0g/4yFZEO5ABXymrI6/wZ4Jo
 aw4a0FSidtVHfh/ChlXSO/uPJ5LhpcFM73biYN86B1+Cs5jTdu3SioJpkmfQi12hRZ/Z
 FrLd2GuYutDWSCOnEY7hvTi/MU0ArzQpDTNxLr35DCtc4QgUfyy48LAGKNwsup/Ayl4N
 HZgzINAhKaCou0uXJXU7C9qjqgVIh19DXzKwpWG7ZDy7nEpyh2n9Uuhren550ODCd0/O
 1/Uw==
X-Gm-Message-State: AOJu0Yy1Bi4iVrucKbb03VDSaD/GtaKH+LDfiFK0cnrqXzCycsTkDmRx
 xfh6zJzK7CbrtleuHNlfIbeEu7VWHIdPiW0YvqB0EbSt5guj7hGUApuUC4PCr3RNC2rPugfPQas
 fZg8WiKs55CtYFLu80/s8luRRJwNOes7MV/C0qTbInYJcq5saU9vQ/MPaGEfZE8acvg==
X-Gm-Gg: AfdE7cmpF43f75H0T4Y8ELA7pF3M34Xo9NyMkY9KKRDDldYKoMHypJVHNO0WzF+A7eH
 IaNh9aHRFbU+uVv20TG4Njxb0QKQFSir8T/Bbu9psJJax7s4rYRXPOBAFlov48GvLFtOXYAgHAj
 y4cL5bI7yvX7R1OCiNaLYm2ILIN7foVmaFVAi2xpPNfvzVMFkwXMVASKP+6qbeenRSb/r2tNKKv
 qDsCwDTXxTJHQeW5QCoYPK4pPbvANIHN2NaaOTFB3mu7qPo0tUVESke0cfhp714n4b6cY8JoT2y
 Xf588+m7YB2Vsy2PP3M9ubbVvG9TNdDuEmzOK7DbRE78o+4E0NTTgL1MBr4dB2LNDegX9FqkXAt
 L56A6ROVL6jJmlf9Z9aSizV+ZmsMdDTqLUCD64gkLWaJsuezdpHQYO3Gg8okBjfq+nSdr8dYh3I
 kuighk8U3Dwq2eSPAYfO3UJFbJ/xeFl1VHauPUPZsYFA==
X-Received: by 2002:a05:6a21:1b81:b0:39b:8b59:4ec9 with SMTP id
 adf61e73a8af0-3c10fc3ff4fmr9129375637.0.1784015857062; 
 Tue, 14 Jul 2026 00:57:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:39b:8b59:4ec9 with SMTP id
 adf61e73a8af0-3c10fc3ff4fmr9129361637.0.1784015856571; 
 Tue, 14 Jul 2026 00:57:36 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311950eb930sm55606355eec.8.2026.07.14.00.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 00:57:36 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v3 00/10] riscv: add initial RPMI virt support
Date: Tue, 14 Jul 2026 13:26:49 +0530
Message-ID: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9Ti2QPPKJlcIaMJhZITryJ8Yi_85zrK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MCBTYWx0ZWRfX64S9tQ/d/K/t
 snCC6qRtRbhs6adFATdzcTPv1YpazxuNYPhLn15Q5BKwVqcaXyZJtC2mSL3OxLMtpjJdRGZhw0E
 /FKrfWJfevNSF3WWCJsLQsmkdn06ymLDFjXAiMerCRnmpi8zv5kH2gon65dGNE6twCtXWsvjQS/
 auvW7MSbHN5KWC0GzJ2qqRwOrR4Z9M6VsnGw7UF522uHJQKo+fYEUw+JYEwKB6mabMXYwAWDiA/
 fTPyG13MB11+tR0yfo24rdT+dmMmOxQs113rF/nakX/F2LsGMx2a77iEkHd4HTsLe7bd/Rk6MYT
 DYpV2IF24BSWk0weOOObu5Kf5BFBRySe4k/Xki0x7hAnNmVauUrqvAgCR+e2crrCuUD2PxPa4AF
 x9xgtjt2xRb+e9ICW2aB4k95YojYOI73qCfYZoC9mjf/kYFdgL1gVVp6gB5LbqMduZilxNfs5tJ
 Z1O8ou7gOE4eXYQbdjA==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55ebf2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=twhuoArYDQxYaH4b0aMA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 9Ti2QPPKJlcIaMJhZITryJ8Yi_85zrK7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MCBTYWx0ZWRfXx4m1MQE8jKrl
 vUAmifNQCEazrGVFzitFUtcGRAbV+P4UQoJ3pqljSmxSQtJyBWuycKr+MW+gHUuTFuv52hxm8/u
 iHUYSJCnAStMJjuO9L7aoSNBlQprM+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140080
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

Add optional librpmi support and the initial RISC-V virt RPMI
implementation. This series introduces the shared-memory transport, FDT
helpers, opt-in virt wiring, and the Base, System Reset, HSM, and System
Suspend service groups with qtest and functional coverage.

The implementation targets the RISC-V Platform Management Interface
(RPMI) Specification v1.0 Ratified and uses librpmi as the backend.

Changes since v2:
- Document how to obtain and install librpmi for QEMU builds, including
  source build steps, Debian/RPM package targets, pkg-config setup, and
  the minimum librpmi version.

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
 hw/misc/riscv_rpmi.c                       | 558 +++++++++++++++++
 hw/misc/riscv_rpmi_hsm.c                   | 287 +++++++++
 hw/misc/riscv_rpmi_internal.h              |  42 ++
 hw/misc/riscv_rpmi_sysreset.c              | 206 +++++++
 hw/misc/riscv_rpmi_syssusp.c               | 191 ++++++
 hw/riscv/Kconfig                           |   1 +
 hw/riscv/meson.build                       |   1 +
 hw/riscv/rpmi-fdt.c                        | 103 ++++
 hw/riscv/virt.c                            | 167 +++++
 include/hw/misc/riscv_rpmi.h               | 126 ++++
 include/hw/riscv/rpmi-fdt.h                |  41 ++
 include/hw/riscv/virt.h                    |   3 +
 meson.build                                |  14 +
 meson_options.txt                          |   2 +
 scripts/meson-buildoptions.sh              |   3 +
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 172 ++++++
 tests/qtest/meson.build                    |   2 +
 tests/qtest/riscv-rpmi-test.c              | 684 +++++++++++++++++++++
 24 files changed, 2686 insertions(+)
 create mode 100644 hw/misc/riscv_rpmi.c
 create mode 100644 hw/misc/riscv_rpmi_hsm.c
 create mode 100644 hw/misc/riscv_rpmi_internal.h
 create mode 100644 hw/misc/riscv_rpmi_sysreset.c
 create mode 100644 hw/misc/riscv_rpmi_syssusp.c
 create mode 100644 hw/riscv/rpmi-fdt.c
 create mode 100644 include/hw/misc/riscv_rpmi.h
 create mode 100644 include/hw/riscv/rpmi-fdt.h
 create mode 100644 tests/functional/riscv64/test_rpmi_virt.py
 create mode 100644 tests/qtest/riscv-rpmi-test.c

-- 
2.43.0



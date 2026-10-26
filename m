Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F2606A31A
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXSp3gDo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XVpozVLk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLKhH-0003CB-0a; Mon, 26 Oct 2026 09:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKhE-00031J-TF
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:25:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKhC-0005Lh-MA
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:25:04 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69QAtKm42541824
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ZvSuFQ99v2Fd/2Hvfa9fu6VLCCTWpL7pug2
 l8nlXpfM=; b=SXSp3gDonxjJSOfaEgmzu75eQcp9esPqleO36+wxbACAh1LtIQ6
 dWF+JZnD6QENSrRUsUqncWBzT0f5/hY1zJkwZ01N/O+jdRqm+b2izfjDU82O3gBR
 rtq52UmBs/eflPhB836uYHMgo5tWJtuPb4Aprhnwk8xZ82bvfb7TsWUD0pRBdSBz
 gfAPg+Wf45mcqbbTTl6Z7iHI3RlW96Wuv/JbRrFgj67C6s19s/uvOumIzlTiVsc5
 qyR2vIcW8WXOJaCnLrwv7hyQoz3oqcrkmiBGI2zY2RID+E/tmN4/7nuPEL1mhb3V
 ug4l9pCu5S6Ie5jA4AC3XiGBRjmer/+EIwQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdam63-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:25:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2e6091a7090so2646065ad.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793021100; x=1793625900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZvSuFQ99v2Fd/2Hvfa9fu6VLCCTWpL7pug2l8nlXpfM=;
 b=XVpozVLkSg9/cpLBjqazeDVKNjJVRriLhlXUZKygbLBPrzPeglvDwAKCra+XiSuQsO
 KeXtuUC04C4y2tRfIuaCWkPdjWrRcIj/mHGlgOyWzT0/FK4R20yCKWNE90HWAQjDfcCm
 lRYAf7a+xVZ7w8iohyXPufhQstXtG6Frg/rHc6gZemBKDRAJpUrVlc17GrDUd9vavHSl
 3TVfCFj59e88BnCZmdi0Y8Bnj4ioWB8dB4r3xw0zFSC6eAn6u9dDxunwSMWczHp7jdGF
 yeIzuR35exQ8pgcy3HYKJaatKbvPDcH0NSvMSV/wJpPkpQZNcKk4Af8ajOIegna9voxT
 gH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793021100; x=1793625900;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZvSuFQ99v2Fd/2Hvfa9fu6VLCCTWpL7pug2l8nlXpfM=;
 b=HsdpxlvcJPGI9NBsGTbZ3AVi26KIYkZo3AcidrXbLwB9lXe8fROBzldWqmtmT7YESq
 n0jlzFa9tPks+dqGc2KzVMS+vRNaAwmL0ibfyz6Oi5i6Cjhq2NA3HOVhJWfItbkUbFbM
 UCQmVE41PmB7JdUIdlRk28mXOBymCGttWUisnKGRR9Fn1P7BEj/Cx3HyNf/fggnGsCHT
 ny/3F3lK4L6vh2iuce9L58FFqXl4Tpxr6gGZoqINGvBULuTJvQ1UqOXUhKlwAN0i4d7a
 GLXuZKdhhCTvTWy7CWkD+ZAtJgx8/80tUtWfnAA/o7toO7zWLqwgxkyjiC7VuB/bwrFr
 pkDQ==
X-Gm-Message-State: AFq9FYLclkoxxZ6zJjxcVkpfldbcH2edIHo4AoZIDvyfoRBE2VoHbPsy
 jfN/Dsf1FwO6lkjTFp5kmkXSKERDs6mT2Tw4sVSmgNNIBA41l7nl1hSsVhFS+hBU8T50ck/7USy
 Kt59QxhfazC3gwtj66RKrXR3TIhw+Q1FkQc0Smml6au5oOxzGMG5m1EDV8A==
X-Gm-Gg: AYBFou3Ct3WDZm5y/tH4vNJvZzLQcgtYd2IF97bcNs/u056NpSMIq2IziCRE0l3phN/
 mflPy2pF8OomiOTdXzuy+uSw49Nh2ZGvpPpefq4jc/NsgMqNGwkHiYtZtE0k70DHleuWTKPSxJg
 l48lKNH3IWkz6k0EMsI5NNaK/jOC6tKfPW8irqpkxBWtCXO2acK/PBE0rri8WKYJ7YYN0Xvl+Xo
 TWHGOqBWmdlEBmCEwohb6LALPillzBaU9CDDdVIiC0YWCmo61Mk8aLZlis5LiY8w7nbkvKUEy4P
 ptx/W9OHK2QH36xbkCDnPE2iYk8KvoaUF3NRfsOcDFUs9fjpxhCMPTX1eerUi5HrHFmasC9NKB8
 NcVW/HoGsrcRBYwT/wUhPNbRL9OhMb37iQ6tZiAZTPVgSoLFa0auT1mkg0JcKhpZogzA1lEdrHZ
 bwBeGpGrUy/rHDnU9FL2E1tYB2dOwxaw==
X-Received: by 2002:a17:902:d4c1:b0:2e9:65bd:62c7 with SMTP id
 d9443c01a7336-2ea9b8db07fmr94435215ad.0.1793021100184; 
 Mon, 26 Oct 2026 06:25:00 -0700 (PDT)
X-Received: by 2002:a17:902:d4c1:b0:2e9:65bd:62c7 with SMTP id
 d9443c01a7336-2ea9b8db07fmr94434765ad.0.1793021099284; 
 Mon, 26 Oct 2026 06:24:59 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm24312725eec.17.2026.10.26.06.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 06:24:58 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] hw/riscv: add RPMI support for server reference
 platform
Date: Mon, 26 Oct 2026 18:54:47 +0530
Message-ID: <20261026132450.2697115-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gJr9m7Xn3yCWk2Atz9_WYDFZR5vw6fRH
X-Proofpoint-GUID: gJr9m7Xn3yCWk2Atz9_WYDFZR5vw6fRH
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf54ac cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=do0brKAVnJz7bNJZ1B0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX5wvUGHGrZeAe
 H7M7B57WDjyZVW7MaLtXSk+/Pqx74Nr6GxaRfq3/prU1Eet5zSx+LOPiNYNrqK2KpQW/0NOMfOb
 D0Zo3ZPPDUNTMvOHGmiNlwlCbQSkekY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX30MuvQ8t9lPN
 eVNdChYYSUgnNm09+GH11wub9pAyYk7TdS0C2eNoujLKqLAbqHmcZ4tyX52ffKJvA/Ct20n1tHU
 lFtOX3oizgWgctS90QaW75K2OZqn4KB8w4Y0z7BiNdijHyDnITHeBO2mmykYk1WSyQwRLSH0Wfu
 KIr/LFhB8gWAFCWh6rZU+aETQNtr/bkLav98a+UvKuURw0kwmSha/4IUfP/9p5gnVv6FMRfFEOj
 sL/ggy7VxzB3pB0v2zSKnMxKjlzK43pTJ+eC2BdSjVY25NQQytWG1lmkKg07uEcHWG93SRbXWIB
 8DoS40pZSluy/5qa0VS79O/HXURl5EKLXw7pDH48mVhlQfvdKLPrhcvTrCk2gg3yxDjLFsikG+J
 5cN1LTfOfhVdqgsNH3cKBqj0SA1tCQ82WChs52xy7JuIy5YwFSKTKXsFQ+Ucgy7W5ZS/SeEpxjQ
 g0e2b+xoIICoWU/J67A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260053
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add RPMI transport and service-group support to the RISC-V Server Platform
Reference Board. The series applies on top of the initial RPMI virt support
series and wires the board's reset, HSM, and system-suspend operations to the
same librpmi-backed implementation used by ``virt``.

The RPMI FDT service nodes are emitted as ``/soc/<service>`` siblings of the
shared-memory mailbox. Each node keeps its ``mboxes`` phandle and service-group
ID, and the server-reference qtest checks this hierarchy as a regression.

Changes since v1:
- Series-wide:
  - Rebase onto current QEMU master, where the Server Platform Reference
    Board prerequisite is already present.
  - Replay the RPMI virt v12 series and update the shared FDT syscon helper
    call accordingly.
  - Fold Charles Perry's FDT/schema fix into the server-reference changes.
- [1/2] hw/riscv: add RPMI support for server reference platform:
  - Emit server-reference RPMI service nodes as /soc siblings of the mailbox.
  - Keep RPMI mandatory when librpmi is available.
  - Retain configure and runtime warnings while allowing no-librpmi boot.
- [2/2] tests/qtest: cover server reference platform RPMI:
  - Reuse the common RPMI protocol tests and register the server-reference
    machine-specific subset.
  - Add regression coverage for service-node paths, mailbox phandles, and
    service-group IDs.

Dependencies:

- The companion RPMI virt prerequisite:
  [PATCH v12 00/10] riscv: add initial RPMI virt support
  (the `part2-rpmi-initial` mailout directory alongside this one).

The server-reference board is already included in the stated QEMU master base.
Daniel Henrique Barboza's original v9 series is retained here for provenance:

  https://lore.kernel.org/qemu-devel/20260903183125.682865-1-daniel.barboza@oss.qualcomm.com/

Apply the server-reference patches after the RPMI virt series.

The exact replayed stack is available at:

  https://github.com/slingappa/qemu/tree/server-ref-platform

The base branch is the RPMI virt replay on the server-reference prerequisite:

  https://github.com/slingappa/qemu/tree/server-ref-platform-base

Testing:

* librpmi-enabled build: passed.
* Server-reference qtest: 24/24 subtests passed, including the FDT sibling
  hierarchy regression.
* No-librpmi build and expected configure/runtime warning behavior: passed.
* Real server-reference Linux boot and RPMI guest reset, suspend/wakeup,
  reboot, and poweroff: passed.

Subrahmanya Lingappa (2):
  hw/riscv: add RPMI support for server reference platform
  tests/qtest: cover server reference platform RPMI

 docs/system/riscv/riscv-server-ref.rst |  41 ++++
 hw/riscv/Kconfig                       |   1 +
 hw/riscv/server_platform_ref.c         | 144 ++++++++++-
 meson.build                            |   4 +
 tests/qtest/riscv-rpmi-test.c          | 319 +++++++++++++++++--------
 5 files changed, 402 insertions(+), 107 deletions(-)


base-commit: d73149283205645625bfa9fe029cfb68e4c4a9ae
prerequisite-patch-id: 9def488de98fc23699367d9927a2748614b568a9
prerequisite-patch-id: 9cbfba6703781182b08d9a639510b02a3f1ad53a
prerequisite-patch-id: d6ea62843f075b7b7f4000096ee31c6b566e1d92
prerequisite-patch-id: ad6707f93581f344c7e268834b159d019f45476c
prerequisite-patch-id: 1be7a5599a2f93d2030e874b5174ed0a7ee5e593
prerequisite-patch-id: c798e606a4fc4e4adae39e168d6267d143436f34
prerequisite-patch-id: e640b0babd95b0a1ee38f29b08775ff83a2ed197
prerequisite-patch-id: 29f7ddf0db5ffe290ebd6158bc4b4ffdb17cc612
prerequisite-patch-id: 2866353e85e88c0013ec1d4d849f4d779e90180e
prerequisite-patch-id: 29b62d3041ae2818a4e2593e478cf6f453061dcd
-- 
2.43.0



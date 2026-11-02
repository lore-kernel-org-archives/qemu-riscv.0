Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B5606A330
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e7VEbYkP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZF8qeHD6
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNnXu-0006PS-H8; Mon, 02 Nov 2026 03:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnTY-0002wU-J4
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:33:08 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnTW-0004v8-TW
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:33:08 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A23v1fq2752042
 for <qemu-riscv@nongnu.org>; Mon, 2 Nov 2026 08:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=OwQojmcpU5eTIzULAINk8oiped9vN+f3GjK
 8xGKTfnY=; b=e7VEbYkPhEL0nigcBqH3r3IRu1Wh3MZ5hLNzrz9+1TR4YBZab78
 SikKbLh582KE/eyVMrWiIFO/Js6G/t9RC1V8nJqUskgbNELPfCeiV6/Bz4VZOqNd
 QQXQqRe4If0nisaF4fzjOy90D9b3mHfLv9rEBeVNe+warPVZVDSW86YRYOM1myaQ
 WAGH2gIarc7Y3Nim0rfdG3RGvIimWnb8mbFmO76QuI6ZkVw8tTmjbzOb//IOYZdu
 tNrNuZfhRe5202moJLrmgcGc5QnF5EXla7/AQTu53rbECqzGZEXWzTuCfev/2sZo
 o7MUL5lhfGaSX4CXx5jepsTZPcPLx3Q48qw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201dp2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 08:33:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2e93d3a7335so8810645ad.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 00:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793608385; x=1794213185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OwQojmcpU5eTIzULAINk8oiped9vN+f3GjK8xGKTfnY=;
 b=ZF8qeHD6ALJSjsyWTE0oOScxVL6u5NpIWQvUHl8zIDsMH2/IoYZV2TDrg9cBQdG+dL
 7kdVJnIVMf4mEztpeNXgNpHMBESIT4WMuQxslqTQ84620kNzxFs7GRt9rJiMwAIh27zO
 Cqk6cI4oVog7LLK2MzAwZ2b5Dl7QIwn0GG0mupAtk9r4L3IiUZrV1hcz+LsXaVPOfH5P
 i15S8bet5dp2bpUh/AEkYlTdXSJiYUB4HGtrpP3xYay6Okh0smkCbMn2S2WX0aoTn/Oq
 3ed4erkBEQuT4uTTFLwz3DkoLZpVo6jvebtqMpu7QGbvrT5uKbgWz2t0GFNgv0HmmZOQ
 Rg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793608385; x=1794213185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OwQojmcpU5eTIzULAINk8oiped9vN+f3GjK8xGKTfnY=;
 b=pYEHvdFsLg0rEV/M2doXapKU7syOy6knoJV1aPsgXHRn2S8iDBsgmc/N6h4kjHtV2c
 YwoVMCfDdJt/qbW3jAobUINpDy1k21EImKXgEvG3aB7wBpu8da+hkoLVi1NdjZj/mwlJ
 ez1af8yAn5oHZgfQhttTlQXKu0YxDhp1jkK5qlaSH5y2AYKOkL7rxWpf8c0nzXpOIQN4
 7XkS7IxddtBnZ/dGNyCFTAY/aL9Mqh5ONoqCH5se7tSG2Jl1NM3KjDDJO7TuX0UhzHIx
 HPr4rrU6XIVVF9RAMnF6qzB6OpuMi1Iy67knOl6jKKqzhvAxQ8Zl1QlnC1rVqU6Motgg
 ibrg==
X-Gm-Message-State: APuU4Z9GXcDmOukuHKhYbqPfSHoXfFsQjglKPCK1G9Sxz4KTVQgqM6/9
 5HItlNapSqmrPdlvrd45vMaxv9dKruaa1Emhn5DQ6iMoonAs/x+AIvKFfRjO9M33iShvsni3YRj
 sx47mF0kzaPcHTnfjIVYpv6e0DDkiPSH8lvyAApx3mqy6KpjAOk+UYTN/WA==
X-Gm-Gg: AYBFou3WSLbTqQwFRonq36txRYsuIyyCaN+4x8Vlhova8kShw87jERs/d1PAeJZUzF/
 wRqP+xBaIq0SSsyFEdS9BxKwwK3XWOlpELp+NK2uhV2Pn67h39UyhxcefZvSPLVUK/FQILjQcEk
 dYTORzSbbzwHCa50LzFb2Ls/96Es5u973YgzKg+4hKxMsbEWJCIDbtzbWK1M2wxr1/uctiBFjGc
 QsbS5egKVg0+PhUe9KbEeiTBowJE0K60/sf49SZTuikkrizSpJKlMArlGCb2a+PWHJ03umcA8a7
 E9WgomNM41WRSO4E1zi9H36yjLzOMR/+lyN4kyVXYtEPemDA7PUBDut9u2lQQQVPkoXlBkmomT/
 icB2RmKDwfQyfoIIeRSKxmHjCfK/yfBcisucBySf7DMK4OvOpqEKdDtLRoRiGXKDCEU9Fc5nWNG
 MtR3P6aEBvnNzNm4mUSLnUtJjWswMQ1IWtLegXW7x8OqUKtpnoyQbJYdcbG+Vx2nRw+p01qLrWA
 p2g0NuZ
X-Received: by 2002:a17:90b:4fc5:b0:3a8:9db2:a59 with SMTP id
 98e67ed59e1d1-3ae891891f1mr13051186a91.0.1793608384928; 
 Mon, 02 Nov 2026 00:33:04 -0800 (PST)
X-Received: by 2002:a17:90b:4fc5:b0:3a8:9db2:a59 with SMTP id
 98e67ed59e1d1-3ae891891f1mr13051144a91.0.1793608384379; 
 Mon, 02 Nov 2026 00:33:04 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a42a96172sm32074372eec.27.2026.11.02.00.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 00:33:04 -0800 (PST)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v3 0/2] hw/riscv: add RPMI support for server reference
 platform
Date: Mon,  2 Nov 2026 14:02:55 +0530
Message-ID: <20261102083257.3405653-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0LM1bforrsdks4dx8AsIf3GYHbteE4uW
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae84ac1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=BuW6VaZA-UvrB-SslPkA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 0LM1bforrsdks4dx8AsIf3GYHbteE4uW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX8F6Ra7u2tENu
 v5OWzO9PrOkxY/Xp1u6bs4jxLJ+gJP1Y20Oge8+br/KrMutfAfKsB5tFU7GL5q3faoe/bvnGCOj
 2gS3MQWN2RDPr+p6j6NaS1T9hqbSr5Wug4VFDroQv3kXmOW0ObQlhhh3WZtrVunknQOZyaHR0Rh
 j30PHujdfZVAp9b5IgbUukHtjt45+bGmotL9X8SoXUY0GQzXV6xxO3dcicif/6duzU8jfMoInyY
 J4WzPBj+hwyl3hQ7fCBZcqvXUBFbQ1XWOn/gGQlANNy7BF/+8juUQaXLx7Dhrd8KQSjyeMTLI/T
 vMZmmw9T+5MBDIFBqVS7LURCv2yIZdRFU+B/hmeWeGdAkgTUGt5cbCBBtUU7Tvzp2XadBAR6S95
 FM+W3n3Nk3c9YiSIE8FXRzFZXfKEWCc+lMkFu32B3MYJA3vkrbJPytyU4LNx6NT9iBan0quuyny
 YL0Ahod3GPS8qkdZAiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX528lH0FFdUxr
 GkjEJE+wWXxI5/aXeKZvPhgMxlbfK0oew8o25hqWyFpfcOmbkqrV60H4csdVFSVv1a+R4Tv2YAC
 4PCaYXX27PFtEb2KM5T2zGrBnaWDHB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020033
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add RPMI transport and service-group support to the RISC-V Server Platform
Reference Board. The series applies on top of the initial RPMI virt support
series and wires the board's reset, HSM, and system-suspend operations to the
same librpmi-backed implementation used by ``virt``.

The RPMI FDT service nodes are emitted as ``/soc/<service>`` siblings of the
shared-memory mailbox. Each node keeps its ``mboxes`` phandle and
service-group ID, and the server-reference qtest checks this hierarchy as a
regression.

Dependencies:
- [PATCH v13 00/10] riscv: add initial RPMI virt support.
- The server-reference board is already present in QEMU master at
  d73149283205645625bfa9fe029cfb68e4c4a9ae.

Changes since v2:
- Rebase the server-reference integration onto QEMU master and the v13 RPMI
  virt prerequisite.
- [1/2] hw/riscv: add RPMI support for server reference platform:
  - Add an explicit ``rpmi=on|off`` property, defaulting to off so the
    existing board remains migratable and retains its legacy reset/poweroff
    device-tree nodes.
  - Gate RPMI realization, reset/shutdown callbacks, and service nodes on the
    property; reject explicit enablement for KVM and no-librpmi builds.
  - Document the property, migration restriction, build requirements, and
    both device-tree layouts.
- [2/2] tests/qtest: cover server reference platform RPMI:
  - Reuse the common RPMI protocol tests and register the server-reference
    machine-specific subset.
  - Add checks for default/off and explicit-on machine policy,
    service-node sibling placement, mailbox phandles and service IDs,
    legacy syscon nodes, and migration behavior.
  - Name the RPMI-off migration test as a policy-command acceptance check;
    it does not restore a destination VM.

Testing:
- Librpmi-enabled and no-librpmi server-reference builds: passed.
- Complete RPMI/server-reference qtest stack: 29/29 subtests passed.
- no-librpmi explicit RPMI enablement rejects with the expected unsupported
  build error; the default server-reference machine realizes successfully.
- Normal and TPM server-reference Linux boots: 2/2 passed.
- Normal and TPM guests reach login with RPMI both off and on (4/4),
  tested against this series on November 2.

Subrahmanya Lingappa (2):
  hw/riscv: add RPMI support for server reference platform
  tests/qtest: cover server reference platform RPMI

 docs/system/riscv/riscv-server-ref.rst |  43 +++
 hw/riscv/Kconfig                       |   1 +
 hw/riscv/server_platform_ref.c         | 149 ++++++++-
 meson.build                            |   4 +
 tests/qtest/riscv-rpmi-test.c          | 418 +++++++++++++++++++------
 5 files changed, 519 insertions(+), 96 deletions(-)


base-commit: 6321a4ee8b32afc3c106f707176073a25e768357
-- 
2.43.0



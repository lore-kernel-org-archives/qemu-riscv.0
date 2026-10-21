Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B93606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PS3emNt2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BTOpP5kd
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMmW-0002ZC-8L; Tue, 20 Oct 2026 23:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmS-0002Y5-Gh
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:14:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmN-0002ND-5G
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:14:19 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F1732562962
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=9/tyfRNUDZU2SoHXA+oloV
 xrtrHePy1Li8sljdHgIKU=; b=PS3emNt2ufr1xMd+2aZVtpu5pbu2pyTDsWuw1d
 fX3/aD0qanIIpFQdBqjrLbCCGlzl3+22xP1h7LDh8dHhApxiHQmfRs3P17EV0i1G
 UwTLyROgkBenqS39S3L5rnVSwBSBhkeb/c03uW+zFric2G2xeO4bFE8Pfn6zn7uU
 5ZllUrzF/cScLjBUAawMKH7dStBU+KL5dfpuEszN11f46m9ZSnEUq36fI5aX3pns
 WQXglC9JjakmdWmoWU1OJ1sjzGylA7IkVyHrN8jSgUhuXIx5q09QRA2sk6WvyWE2
 2X3v+70ZHnhz1LtPu5HBtKyRQAl9HVBhiiVdpLczSh8vgnuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd23kr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cb6391e89so64694885a.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552451; x=1793157251; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9/tyfRNUDZU2SoHXA+oloVxrtrHePy1Li8sljdHgIKU=;
 b=BTOpP5kd7R3mWyz6rN9U2wvhoUXvXWeRu1vki+gjKbs8qDbTU53zINgBhJAypPCwxL
 dhKk55X3/153fnmFc2f1J2TJjcNCAZDdQRrUHNWx3wSVZO19QouCqJ07jiAwFIoco2LI
 oufb3eGzojTEiNDNYYcdtZCFDpSjUXKXIctgJdoEuDFh/rdfA+G85aX5VqEQ020AYxea
 E242xYGv8JOKePkRCcD76tjESl9S0ze5OIDtDdu1B30O8ZITEkNV4kaW/Ds1DPER+F2I
 kZRBw62DFJ6eFItF9J0gEj4apYg7Wy+GbPM90K2a16asJ8vwSfI8Mi/SVZqxug9bJWht
 eRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552451; x=1793157251;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9/tyfRNUDZU2SoHXA+oloVxrtrHePy1Li8sljdHgIKU=;
 b=V9whEv7Bdz3m76FP2Tp11TllJc3S+C/s1jzREwrfZYzFxSHMQR6mMhTvhvmDelasZb
 VbxaznhOs0jlx4vgS1D/HTOWe7kmwogzjT8YXj9YC8o2FaNMSTATcg7UCiewkt7fqSHU
 q5YPEW+zWW7FSeFohdBk29SpNKBRYxgplcHAVjyfRha7MVLhg968Sa1EJ+7dgimwYlxI
 Xg9MMC+icUaumdBI+NS7m6JXIHZD5uxxtk9N9v46Q7m3H3gxe/jLwf0xnf75Zyx0A1LH
 sAcgypth0dZhVGJcWLjUVAa+YFh6wkFTHnenHk6gZTrQT8XM9IzaKVIhpfYYZ8AvGNL5
 sorA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzmabkHulXZh9EstkKCvwZ4XvBB00T4uohyk49wK1woYAZvtbpplT2UlYFjGF8bw4zCwSs39JWPM4Hd@nongnu.org
X-Gm-Message-State: AFq9FYLfjpw+QHo7ltUdqhCDTamggpjfKWuZZOBOtu3BWK+Ti6cRZjTP
 xGC9QCdjES8S//AACImvAgUoukMmUm/FqlvHYvdD9SjZqFCWbekEnIuiSBqPS7NBoFVCl4w+R6j
 umVUvxSFkaQ3zxqToBN0n1Zimv6rNq5AwnLp3h2hNRnvRQG0R/vf4HNb7Sg==
X-Gm-Gg: AYBFou35xHD5D/p6WgDiOLSQxgMykKl2eJc9lJAG8GTmwMAcvqsVQXNm3fb5Lkqyc92
 Rm/dk2kmPCv+18jiuV5STmrDhPYws+UCb397EEyMwnFPKmDsWAPlIKTjy4teVxVwQeu87RaxqnB
 egXI2Y2aYm4tnX70UXMpWLI5I6SnhfMduPRnk54pLYigyMtC63VklxlCwMWJ7vwTIQkOswYpDKL
 NOq/wJVtmuzRR6MddCbeEl1ljcIHIY1coe8s3zbwcrz3op905M/U+y38XSCiDZgih7ColW0HMS8
 rrByr5cRYK57DsUlBofC/L/24wr9QpBVz29YtcVus5+wxc6EkRDDehCXeVVM2BIE4lO3E+4pN/w
 5PlQW6iMh6tzjWvR8jipLbFqRBUwitmiWmQoBhrJI
X-Received: by 2002:a05:620a:17a2:b0:93f:34c9:925f with SMTP id
 af79cd13be357-93f57f05e21mr225097085a.17.1792552451208; 
 Tue, 20 Oct 2026 20:14:11 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:34c9:925f with SMTP id
 af79cd13be357-93f57f05e21mr225093885a.17.1792552450655; 
 Tue, 20 Oct 2026 20:14:10 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2583e25asm2406639f8f.46.2026.10.20.20.14.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 00/33] cpus: Add common CPUClass::exception_name() handler
Date: Wed, 21 Oct 2026 05:13:33 +0200
Message-ID: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX5QyQMw2YET9v
 49t9y1WCGPJTpwMrrS1Kr5oJjqMlqx5FAq2amutF27pyPvaQBZS4BSOHikOIFb1CbJtKEzVD/LN
 PFdIPy05bh92Map6Bvjo5y0jWQqxJCScFIXrdUG9VgXgXnXO7WtYrxEVSxU8+HkXFGAa4phJiCT
 QBP1nB6tTzFrcjVsHSyMvvMDsUuuuG60DZmqC4xOcwhUf6EomWgcgOE8VVqlChLx+DVLFCqJ23H
 m6+nniqgDyPhybHykWy7tBE2+kfu5Ke8Bz9zZEvt4+FQwpaIFllCta77f93AonekvGkmreX+efQ
 JP/+wIv4N5FakF/cJX7QTzVI1A6myTpl2eLnzW1vHqtrwdmDsOH+Z87zYu0oAtnPJZ3JZ3RAV5I
 Bf1ByxQklp+Ok99SqYe1NFWKiIBS+oIgaxI2y1r8nwefqBWGqrNyQNem8BeWVlg4EhPAWhT1u06
 pG+0qtbzXLriuIBSPcA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad82e04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=fwSM-n4fPOTFBuO-yL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: PMgGpNXaQrEfKVzwrwCOTVOpId2xXyh7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX7Fjpwdy4uAbZ
 XGD6w7o94hRGw5gNx0V2zccWypP9VBJ2AuBpxdOniRryF4pIFkh+EXmIP/5cDjobtdWOKQRyZ0S
 pshTP2mzyFiTIeE9MT4rhCMgr6RGaWs=
X-Proofpoint-GUID: PMgGpNXaQrEfKVzwrwCOTVOpId2xXyh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Missing review: 1, 2, 5, 14, 19, 21, 29 (all news except 2)

v2:
- Addressed Pierrick suggestions
- No change addressed wrt logging-prefix (patch 2) because
  not needed so far.

Add qemu_excp_name() to resolve QEMU internal exception
values.

Add a common CPUClass::exception_name() callback so the
generic exception logger can resolve architecture-specific
exception values to human-readable names.

Re-use existing methods (expose prototype or refactor) when
available otherwise implement new ones (AVR, X86, MicroBlaze,
S390x, TriCore and Xtensa).

This series is the base for consolidating exception management
in accel/tcg/ (more series to be posted on top).

Philippe Mathieu-Daudé (31):
  qemu/osdep: Add ARRAY_ELEM_OR_NULL() macro
  cpus: Add helper to log raised exceptions with '-d int'
  cpus: Introduce CPUClass::exception_name() handler
  target/alpha: Register CPUClass::exception_name() handler
  target/alpha: Use a static table in alpha_exception_name()
  target/arm: Register CPUClass::exception_name() handler
  target/avr: Implement and register CPUClass::exception_name()
  target/hexagon: Register CPUClass::exception_name() handler
  target/hppa: Register CPUClass::exception_name() handler
  target/i386: Replace magic value by proper EXCP0E_PAGE definition
  target/i386: Implement and register CPUClass::exception_name()
  target/loongarch: Register CPUClass::exception_name() handler
  target/m68k: Register CPUClass::exception_name() handler
  target/m68k: Use a static table in m68k_exception_name()
  target/microblaze: Implement and register CPUClass::exception_name()
  target/mips: Remove unuseful EXCP_LAST definition
  target/mips: Register CPUClass::exception_name() handler
  target/or1k: Register CPUClass::exception_name() handler
  target/ppc: Dump EBB exceptions names
  target/ppc: Register CPUClass::exception_name() handler
  target/ppc: Use a static table in powerpc_excp_name()
  target/riscv: Register CPUClass::exception_name() handler
  target/rx: Unify BRK and INT trap handling
  target/rx: Register CPUClass::exception_name() handler
  target/s390x: Implement and register CPUClass::exception_name()
  target/sh4: Register CPUClass::exception_name() handler
  target/sh4: Use a static table in sh4_exception_name()
  target/sparc: Remove well tested DEBUG_PCALL definition
  target/sparc: Register CPUClass::exception_name() handler
  target/tricore: Implement and register CPUClass::exception_name()
  target/xtensa: Implement and register CPUClass::exception_name()

Yonggang Luo (2):
  target/rx: Define exception vector constants
  target/sh4: Define exception vector constants

 include/hw/core/cpu.h          |   2 +
 include/qemu/osdep.h           |  12 +++
 target/alpha/cpu.h             |   1 +
 target/arm/cpu.h               |   2 +
 target/avr/cpu.h               |   2 +
 target/hexagon/cpu_bits.h      |   2 +
 target/hppa/cpu.h              |   2 +
 target/i386/cpu.h              |   2 +
 target/loongarch/internals.h   |   2 +
 target/m68k/cpu.h              |   2 +
 target/microblaze/cpu.h        |   2 +
 target/mips/cpu.h              |   4 +-
 target/mips/tcg/tcg-internal.h |   2 -
 target/or1k/cpu.h              |   2 +
 target/ppc/cpu.h               |   2 +
 target/riscv/cpu.h             |   1 +
 target/rx/cpu.h                |  14 +++
 target/rx/helper.h             |   3 +-
 target/s390x/cpu.h             |   2 +
 target/sh4/cpu.h               |  22 +++++
 target/sparc/cpu.h             |   1 +
 target/tricore/cpu.h           |   2 +
 target/xtensa/cpu.h            |   2 +
 accel/tcg/cpu-exec-common.c    |  38 ++++++++
 target/alpha/cpu.c             |   1 +
 target/alpha/helper.c          |  56 +++++-------
 target/arm/cpu.c               |   1 +
 target/arm/helper.c            |  76 ++++++++--------
 target/avr/cpu.c               |  16 ++++
 target/hexagon/cpu.c           |  34 +++++++
 target/hexagon/hexswi.c        |  30 +------
 target/hppa/cpu.c              |   1 +
 target/hppa/int_helper.c       |  88 +++++++++---------
 target/i386/cpu.c              |  30 +++++++
 target/i386/tcg/excp_helper.c  |   5 +-
 target/i386/tcg/seg_helper.c   |   8 +-
 target/loongarch/cpu.c         |  38 ++++++++
 target/loongarch/tcg/tcg_cpu.c |  45 ----------
 target/m68k/cpu.c              |   1 +
 target/m68k/op_helper.c        | 158 ++++++++++++---------------------
 target/microblaze/cpu.c        |  14 +++
 target/mips/cpu.c              |   1 +
 target/mips/tcg/exception.c    |  13 +--
 target/or1k/cpu.c              |   1 +
 target/or1k/exception.c        |  21 +++++
 target/or1k/interrupt.c        |  19 +---
 target/ppc/cpu_init.c          |   1 +
 target/ppc/excp_helper.c       | 139 +++++++++++++++--------------
 target/riscv/cpu.c             |  29 +++---
 target/riscv/tcg/op_helper.c   |   2 +-
 target/rx/cpu.c                |   1 +
 target/rx/helper.c             |  62 +++++++------
 target/rx/op_helper.c          |  17 ++--
 target/rx/translate.c          |  23 +++--
 target/s390x/cpu.c             |   1 +
 target/s390x/interrupt.c       |  15 ++++
 target/s390x/tcg/excp_helper.c |   6 +-
 target/s390x/tcg/misc_helper.c |   3 +-
 target/sh4/cpu.c               |   1 +
 target/sh4/helper.c            | 108 +++++++++-------------
 target/sh4/op_helper.c         |  16 ++--
 target/sparc/cpu.c             |   1 +
 target/sparc/int32_helper.c    |  21 ++---
 target/sparc/int64_helper.c    |  42 ++++-----
 target/tricore/cpu.c           |  18 ++++
 target/xtensa/cpu.c            |  23 +++++
 target/xtensa/exc_helper.c     |   3 +-
 67 files changed, 740 insertions(+), 575 deletions(-)

-- 
2.55.0



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A371606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 23:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXiDCV0q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gUrKH0Ac
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJfVX-0007QC-2N; Wed, 21 Oct 2026 19:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfVV-0007Py-5r
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfVR-0004wB-Va
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:04 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LKeCqi2160351
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=3WAcJ1420x+ZgmwoeSaHEpfAcwxyM4BlYq2
 /i8OSxPY=; b=GXiDCV0qvaBjpVA8PbEM182J3H9kfUpB/Z6XN4jtMVhBZG1F/Pm
 6QRvTVAXnAaLf/cX3WV/KCuUELxbtZZ/OIEptiFalWYn9DkN4duTnwRbR6cfIQKi
 k+RjpuldRvLSkQObFEZvVQLXYKF0WNCQ8RvUqyLerculWW/y6YUA32Az2dKmNNJJ
 GRVlQ1WP9Xo9zYCpNd7Q4HviwoeORit77ZPjGqi3jrzoNtnfbpP1jCSHSHla+4pp
 Gqov0ShDWpAXFgHXfxlVDd7D88NgpQOcI8SoiKIDd8xsJGPmEzPztnIqCDFHjlhA
 CBVjWmCGdvvTP5XEuTKJgfXzArVEcpV0FPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3h33f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:13:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-53661e036a2so24615821cf.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792624439; x=1793229239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3WAcJ1420x+ZgmwoeSaHEpfAcwxyM4BlYq2/i8OSxPY=;
 b=gUrKH0AcLTXstrwizyUqRmsJ+0ZbU2f4lvvp+Up3jcMyPvjQPNb/J2UQ8SB+Q5PC/W
 cvPkcQQhyuQxrJo0MXfwNhXpxV/dYL26YT+/uzf9MGwSB1VeTh8ADNRYKMTQYJUm03e8
 u9Fejl+JRi0i38SkAmrjUqqYijz2HJd6dNgW/ycf0gaeXv0tV07C8sdfo9p6zSBNAJyy
 J062fvP/dgnn0VdYKzSt4Xuu6TYMh6AOfxFt0T3vb10N8Hl5AKGcuPW5hSvxVBLDBc5S
 ansSTd2fgNgdLuJoTImcnxa+GQ2gwA6CU6tANnAqrdKTEUKsqyvmxL6DZSQkXnkbhTUN
 dyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792624439; x=1793229239;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3WAcJ1420x+ZgmwoeSaHEpfAcwxyM4BlYq2/i8OSxPY=;
 b=AhlRgVDfsLwZ4JMtcMGbDjON3wHnFuovsXrH/eHKv7D7oyI8/FcCdMhNlkLjOzIpVN
 6tKJ3foTqS43b+y4aPcUxwxBS+QxDvwawAW6Hc3TVAAXbw8b3x9g/MwSeU4HMJ7LwAxu
 LRV/IHFwJPJTidcZXMCbz8qhUtTqEpC8XWuG6TnR0T+kVifreBkWkiz6lBeXjvNo+HW0
 mAFhnMsQn1AoCNKMV5YMqUpsHDg25YjnUIPLQVKGjTbW4DKRpWsP28KGAsbMSjnWFVJp
 +z5SUoSrRQattdZtLU2uq+awLwcp9YfY1eTE2Bq7nejLnxLb69zf2GgXRWsxE86qXCCd
 RIcw==
X-Gm-Message-State: AFq9FYLNYzvTciZWaThXK7uwMcyoBpv/5PXFXhMgoLmJh+BO22jQvmVV
 ZaNrFEX5t9IgX3UKKWLWMxC3grSRr+4X4QuiO9fkMbo0ekni/8iYCi6Ht/F1jdCY1zse/r6TOpt
 y1Gwy5snQDQxnslg/hWp/wP88g0FzmU74dYmDd9OyC8wXNbjMdvbmDW+Y6Q==
X-Gm-Gg: AYBFou1aygW0S/ae/ZwfGGvUb0zRL0l2l7s0tcAQR8xIeWniuYJX0DJJdOcOYiHYTXZ
 w3GrIkUXpyEWSW2KEmYw6aq/fL8TBRj+9iQsTgYeTmdt7et/+hDbPd3Ked+MZPx8rAVF/2XX0mV
 7R6zIJrpohRm+TIpAMV/+qzUm0U3aKZMDHWH2EEpoaS4pekiEPavKxIzNQkl6yhQX9e6v/Vw9yx
 TMEq9kvaimQ7JX9IjbMM5LRVEh7TAbT9KruXwmPLjMiO27b/GH8gIysRNe503eDwapnyt8bKpEo
 9Fl6nm4SCCs3edFdZFmS0prgJY5UzUogGD1PG/A+7ou6GJ9EhUF113GxqUSA2/IH6viyKlAnE0s
 5+2z76Vew3qq9XNXG82YcLBMIGR9ZoyArLrmHriwR++xCwTN7nw7WIdYUgDb7pp7WOTbcvim9+Q
 ==
X-Received: by 2002:a05:622a:3cb:b0:535:84ec:baaf with SMTP id
 d75a77b69052e-5369b85ed01mr59072851cf.43.1792624439096; 
 Wed, 21 Oct 2026 16:13:59 -0700 (PDT)
X-Received: by 2002:a05:622a:3cb:b0:535:84ec:baaf with SMTP id
 d75a77b69052e-5369b85ed01mr59072341cf.43.1792624438472; 
 Wed, 21 Oct 2026 16:13:58 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com
 (200-204-190-237.dsl.telesp.net.br. [200.204.190.237])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab6cd0dcsm11995651cf.6.2026.10.21.16.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 16:13:57 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 antikostya2@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v4 00/18] hw/riscv, target/riscv: initial e-trace support
Date: Wed, 21 Oct 2026 20:13:27 -0300
Message-ID: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad94737 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F-xNRSD0FtQiUKPuQsUA:9
 a=dawVfQjAaf238kedN5IG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 59XXMA-68W0YEIVIApd5HyR-EwSqsY4J
X-Proofpoint-GUID: 59XXMA-68W0YEIVIApd5HyR-EwSqsY4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX4cidDzd1rxi8
 z0+iXUyxKOmiQ6Uqou1dqUWjn3JEqv8FJe4gL3PMlxz4o2q7bIplofr8otuv0pXZxk1xbytwSeT
 V0sb5BooAto/pKu72BOSRFJ/B4yT7hwNnF3Atee5/pQWda0HU+kvsgdJwyCvKFcIAZTJcvIXro4
 vLtKkkmhzv7vFI3MuvIL5sICSWVAxbvQRjczSRSZkwqMTqaBRqgK+aL7X2cKKSBb6RH7i8G9q7R
 ZgCoL+AKlLjtk09rQKiVo5+mFL0C8wyybLkPDZBM3EqFCJVkL/3e4e2LlfYPRP3zYjv7GHe4inN
 8gn/xlSpILVDUN9I2WR7S3UlWCSo/KLi/Kyj9zoXzlgxIcpgf/4jzd7xC3QM1EGwt2DcSK+pgw7
 qWU1bgMqbT6J4KpLDwzDJn+y0bTAI3zEks5UTGHRyFfvthjPDQ/O77Y6zxEQgwSxjN/gLGTEv3V
 QbJnLZ3mJxsCtGkG3oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX97z8ogDxeh49
 VJpSa4uGjXM/ek/+6OSZUIr2d6NcoZanRm2+9UYI2bFElWi9UH016lKHRa09gElqhsXCjVvkeo1
 oR+Sa2yN9VLeCV5Af+12aEz8NcO8fkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210092
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

It's time for a refresher of the hwtrace/e-trace support for RISC-V.  It
has been awhile since v3 and we have Konstantin posting patches to
implement N-trace on top of it.

For this new version a couple of design changes were made, most notably
the FDT functions are now hosted in fdt-common.c and we're using an
EXT_TB_FLAG to enable/disable the trace session instead of using a TCG
global.

A new patch was also added to describe what we're implementing and some
design decisions made w.r.t TCG instrumentation and encoder parameters.

This emulation is being used to support the development of the Linux RISC-V
e-trace driver framework.  Newest version can be found here:

("[PATCH v6 00/14] Linux RISC-V trace framework and drivers")
https://lists.infradead.org/pipermail/linux-riscv/2026-September/100456.html

Patches based on alistair/riscv-to-apply.next.

Changes from v3:
- patch 5:
  - move FDT creation code to fdt-common.c
- patch 7:
  - move trace_helper.c to tcg subdir
  - use "CPU_TRACE_RUNNING" EXT_TB_FLAG and ctx->cpu_trace_running for insn instrumentation
    instead of using a TCG global
- patch 14:
  - use ctx->cpu_trace_running in gen_trace_branch()
- patch 16:
  - use ctx->cpu_trace_running in gen_trace_branch()
- patch 18 (new):
  - add documentation
- v3 link: https://lore.kernel.org/qemu-devel/20251229184656.2224369-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (18):
  hw/riscv: Trace Encoder initial impl
  hw/riscv: Trace RAM Sink initial impl
  hw/riscv/trace-encoder: add trace start/stop logic
  hw/riscv/virt.c: add trace encoders and trace ram sinks
  hw/riscv/virt.c add trace encoder and ramsink fdt nodes
  hw/riscv: add e-trace message helpers
  target/riscv: add initial trace instrumentation
  hw/riscv/trace-encoder: write e-trace packets to RAM sink
  test/qtest: add riscv-trace-test.c
  hw/riscv/rv-trace-messages.c: add encoded trap message
  hw/riscv, target/riscv: send trace trap messages
  target/riscv, hw/riscv: send trace ppccd packets
  hw/riscv/trace: add format2 msg helper
  hw/riscv, target/riscv: send resync updiscon trace packets
  hw/riscv/rv-trace-messages: add format 1 msgs with branch info
  hw/riscv/trace-encoder: send branches info
  hw/riscv/trace: update branch bit in sync messages
  docs/specs: document RISC-V hwtrace (e-trace) support

 docs/specs/index.rst                          |   1 +
 docs/specs/riscv-hwtrace.rst                  |  96 +++
 hw/riscv/Kconfig                              |   5 +
 hw/riscv/fdt-common.c                         |  70 ++
 hw/riscv/meson.build                          |   3 +-
 hw/riscv/rv-trace-messages.c                  | 373 +++++++++++
 hw/riscv/rv-trace-messages.h                  |  40 ++
 hw/riscv/trace-encoder.c                      | 610 ++++++++++++++++++
 hw/riscv/trace-encoder.h                      |  62 ++
 hw/riscv/trace-events                         |   9 +
 hw/riscv/trace-ram-sink.c                     | 263 ++++++++
 hw/riscv/trace-ram-sink.h                     |  83 +++
 hw/riscv/virt.c                               | 128 ++++
 include/hw/riscv/fdt-common.h                 |   4 +
 include/hw/riscv/virt.h                       |   2 +
 target/riscv/cpu.h                            |  12 +
 target/riscv/helper.h                         |   6 +
 target/riscv/tcg/cpu_helper.c                 |  26 +-
 .../tcg/insn_trans/trans_privileged.c.inc     |  11 +
 target/riscv/tcg/insn_trans/trans_rvi.c.inc   |  13 +
 target/riscv/tcg/meson.build                  |   6 +
 target/riscv/tcg/tcg-cpu.c                    |   9 +
 target/riscv/tcg/trace_helper.c               |  62 ++
 target/riscv/tcg/translate.c                  |  16 +
 tests/qtest/meson.build                       |   2 +-
 tests/qtest/riscv-trace-test.c                | 120 ++++
 26 files changed, 2029 insertions(+), 3 deletions(-)
 create mode 100644 docs/specs/riscv-hwtrace.rst
 create mode 100644 hw/riscv/rv-trace-messages.c
 create mode 100644 hw/riscv/rv-trace-messages.h
 create mode 100644 hw/riscv/trace-encoder.c
 create mode 100644 hw/riscv/trace-encoder.h
 create mode 100644 hw/riscv/trace-ram-sink.c
 create mode 100644 hw/riscv/trace-ram-sink.h
 create mode 100644 target/riscv/tcg/trace_helper.c
 create mode 100644 tests/qtest/riscv-trace-test.c

-- 
2.43.0



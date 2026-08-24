Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3442DC5DF81
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:17:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySg9-0001Qn-E6; Mon, 24 Aug 2026 07:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySg6-0001QG-J0
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:17:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySg4-00057d-DM
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:17:22 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99DTf2355918
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=YPD83kuQ+6pNQ4ET6igkgI
 wLJF0cbgUoJH3jQr4+9Og=; b=CoSkdgpDDrtIpdqWTyAg0t8qxwTn+7xJ+UTrkS
 U9KN27qWsDX03EBotj0Odw0Dc7UaOscOLZCIC6JQV6jtWlUlm8F/eaOquxYnjVXF
 INwr48iub1lW3CEvjXaBXnQm5EmkjkxF35xEvFpG/9PP4w2p5NZWMTuYR7znT5ut
 iOJcuH5cqqdbtF4c+5QFNmhmIZ73l+IPrdlCtGssyHoILd8KzU6W8bQO5Cky1+fL
 bfiTDo2HxeUQxadLtIrJsy9BBjwPPh4ib5rQC4vO/dDYetkFLZ+NfsA4UheaCGQN
 yYGLTQBWPM8L4cGoCisy93pyI4OuUqUvtd7yCpbvk+ua5kJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn96dk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51bf321d786so27619101cf.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570238; x=1788175038; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YPD83kuQ+6pNQ4ET6igkgIwLJF0cbgUoJH3jQr4+9Og=;
 b=GonGar+UPIZ6JPhWwvsfmKLHS8zdgNzBDilaXCDGQY8unhyShE405Ig1+r9BS9GImH
 GEALKEjr0o5CYC0GSvRJQHnlT163dAS6CzmnLa8ji1M+LTgXEU73Oqak424BrGAgi/6j
 hIuCqtczsON7/KoYXDSreKenODEDi4k+zjrqRTtfR5yTmYcfDtwg5Gl2ajUY1AkqE3iZ
 nTGdSBne0DXx+47GmyKbc+cvefkq2f5D2bM6pC+1HPeRJ9kOL0MPQk27wUiSePtquBmb
 KA+tKpVt17l2L1sWdbFG+J/A7P0Zx+YQr3r2LFrr7ZpfhLWTWJ6pQqP8HCgfhBekcmqx
 wksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570238; x=1788175038;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=YPD83kuQ+6pNQ4ET6igkgIwLJF0cbgUoJH3jQr4+9Og=;
 b=PfzKkDn89QihHzJMSQ+YqlzA69GPExKbu2Sw5Q+XmMazjtEqxrFC93mJ6usyDM6i1I
 6A/lPGls+/A3dal1hFsbkpXif/y2J/mI0rqRcf7MqsAVePv/MVkXlG3T14jOez6YjUVX
 5+WAfr2Bbq0uiaLt0oW0AsBenJhDgSXQdWqeFL1Xw35P/ZUqIDuEyYMcW0jh5RxlwzQ7
 mk1F7yMMzkMz1kL6lIC3Cmc1r1+h2cknHLbyiiNkvTYB8iKtpb7sHaWpqQs0m3dumMtN
 ach7V8OThNlaxEDlsKqXfjQ/SWRZwuPPfPWmFDTq95P7qFD7j53R/9JVkUMHMFvCHO1U
 Lsjg==
X-Gm-Message-State: AFuF++kX1cyNFl/HYS8cybaqxeb5dEOmd+UmvcrgtLeGCnS4yp7XjWV0
 wU35ju7mpv6pFskojqNqcKa7PCzmC1JUZJo5HWgBp6Hf2Et2GGTFWaqUPJKDgSGuQO5xc51ZEuX
 T/uq4XhuLhGKWQ1hdAG1OiRvMuKS0NkuhCEphhp8TMHMN5szxRdYeOX0+Mg==
X-Gm-Gg: AR+sD11jnRPoJyAuCtp/FT3JloqcoIROwwqX8a6viLeyNJUhhxC3RjCp9UT+Jt01ZWy
 1B4G4dGrH4yw9SH3qlRfYq7YdCESFbQfaU8RxAv6rS9FCSNOZbSiS7cdswxsGh54IJUx7uwVFja
 cfERygTBwTYxV7BiCB3ZRsQIkD+55UQH3R3dCxSkvYgPFfAiRPu6oQVjrqgmR4dlERNpr5OoVHj
 G/gO8bg6v3npZ6s6n3DKCdxQjxgkxx8XhoLsg5Pk91/SKDM7DtvvGX05QClFmk8SuxdEGoNz/tE
 OyOSxpSThLUpv7/6+tdGh0Pw6w/fXJkFJJ+A2ip2FRoLK7BpRh4RWa3hxgcLPtj6qcSdkF5DtRi
 azZDWetc0OG3bkcIhRi776kMyiEqEqVvlZzlXuOn0c6DhaBJcNg==
X-Received: by 2002:a05:622a:1ccc:b0:51c:44c:6ad with SMTP id
 d75a77b69052e-52df5a07b4cmr260561291cf.21.1787570238097; 
 Mon, 24 Aug 2026 04:17:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1ccc:b0:51c:44c:6ad with SMTP id
 d75a77b69052e-52df5a07b4cmr260560651cf.21.1787570237517; 
 Mon, 24 Aug 2026 04:17:17 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b161sm1336403066b.11.2026.08.24.04.17.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:17:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 00/20] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Date: Mon, 24 Aug 2026 13:16:49 +0200
Message-ID: <20260824111711.26297-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXxReBUb5ktsZ4
 rkCJ9DIjE31hVkCPvoQ8a8czKQIc2G0KsMJuZ9p3KQruxvAait3FDksM8XnN3XkyPRVuCcU6CMf
 nc3yBrUvRRiT/+XPGQ0UDJ74Edg7cyE=
X-Proofpoint-GUID: tar-va27eZiLQ8hxBY96EOc1ghLhQbVK
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c283e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=WgZ0fXF2DweS4szHog4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXxzR1krR+qG27
 k0Sr1BhF1j7Fe9gLsNravunjZzZNhg9H3JljZDiZsO95YaQqsiqhzzNSxvOUS3NxXkIZ42OtaIa
 JQ6hjadJmaah4N5Aq7bktGS5VrO1p6xiXsYafHt7cKRfsfCBveW3BNr11QU9A0JzHFxevWztMV0
 xTAs66IKw9mMiWXAIbfdCSpfS3wVxYahIYizmddWBbsviPfsD72ByLee3yQCeL9iS4wrRUAnWG9
 1mUUYndWXajroOJg0/SUQ6K1peSZrvJFvi6btdeCKJ9Lk17noDZaMv6bKXeOemQqusuMrxBRH0k
 ORDTqph97mk2UqzlE3+6mzZtsJB6l/oIycFF98N79IhYD6E5clRTJAhyxlRxUgSeKuRbnFSVXh/
 Cjf45NeIy5eN55X+Y2NPQfskSpbX+LwzsJ49hs6mBKfu2wCBICo7KwgQRcYvTPhYgpCwms0fF0N
 H5nENEAtXDlO0c7c+vQ==
X-Proofpoint-ORIG-GUID: tar-va27eZiLQ8hxBY96EOc1ghLhQbVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Missing review: 1, 6, 11, 18, 20 (all new)

(I plan to merge myself once reviewed)

Since v3:
  - Fixed _Generic (rth)
Since v2:
  - Reorder _Generic changes first to maintain bisectability
Since v1:
  - use _Generic (rth)
  - no more RFC

No functional change; purely const-correctness improvment
to enforce has_work() callees don't mutate CPUState.

Build-tested.

Following checkpatch.pl errors ignored:

  2/15 Checking commit efef90983aa7 (cpus: Add const-qualified CPU environment accessors)
  ERROR: spaces required around that ':' (ctx:VxE)
  #46: FILE: include/exec/cpu-common.h:89:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #62: FILE: include/exec/cpu-common.h:101:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #90: FILE: include/hw/core/cpu.h:605:
  +        CPUState: \
                   ^
  total: 3 errors, 0 warnings, 64 lines checked

Philippe Mathieu-Daudé (20):
  target/i386: Remove const qualifier in ptw_setl*()
  linux-user: Uncast void pointer argument as Object in
    target_cpu_free()
  cpus: Add const-qualified CPU environment accessors
  linux-user: Replace env_cpu_const() by generic env_cpu() equivalent
  system/cpus: Constify various CPUState arguments
  target/arm: Constify CPUARMState for various cpu_*() getters
  target/avr: Constify CPUAVRState for some cpu_*() getters
  target/hexagon: Constify CPUHexagonState in
    hexagon_thread_is_enabled()
  target/i386: Constify CPU*State for cpu_*_interrupt() getters
  target/loongarch: Constify CPULoongArchState for various cpu_*()
    getters
  target/loongarch: Constify CPULoongArchState for various tlb_*()
    getters
  target/mips: Constify CPUMIPSState for various cpu_*() getters
  target/s390x: Constify S390CPU for cpu_has_*() getters
  target/riscv: Constify @iprio argument in riscv_cpu_pending_to_irq()
  target/riscv: Constify CPURISCVState for various cpu_*() getters
  target/sparc: Constify CPUSPARCState for various cpu_*() getters
  target/tricore: Document architectural interrupts as not implemented
  target/xtensa: Constify CPUXtensaState in
    xtensa_replicate_windowstart()
  cpus: Constify @cpu in SysemuCPUOps::has_work() handler
  accel/tcg: Constify @cpu in cpu_mmu_index() and TCGCPUOps handlers

 include/accel/tcg/cpu-mmu-index.h    |  2 +-
 include/accel/tcg/cpu-ops.h          |  2 +-
 include/exec/cpu-common.h            | 29 ++++--------
 include/hw/core/cpu.h                | 21 ++++++---
 include/hw/core/sysemu-cpu-ops.h     |  4 +-
 include/system/cpus.h                |  4 +-
 target/alpha/cpu.h                   |  2 +-
 target/arm/cpu.h                     | 55 +++++++++++-----------
 target/arm/internals.h               | 69 ++++++++++++++--------------
 target/avr/cpu.h                     |  6 +--
 target/hexagon/cpu.h                 |  2 +-
 target/hexagon/cpu_helper.h          |  4 +-
 target/i386/cpu.h                    |  4 +-
 target/i386/tcg/tcg-cpu.h            |  2 +-
 target/loongarch/cpu-mmu.h           | 20 ++++----
 target/loongarch/cpu.h               |  6 +--
 target/loongarch/internals.h         |  2 +-
 target/loongarch/tcg/tcg_loongarch.h |  2 +-
 target/mips/cpu.h                    |  8 ++--
 target/mips/internal.h               | 10 ++--
 target/ppc/cpu.h                     |  2 +-
 target/riscv/cpu.h                   | 53 +++++++++++----------
 target/riscv/internals.h             |  2 +-
 target/s390x/cpu.h                   |  4 +-
 target/s390x/s390x-internal.h        | 12 ++---
 target/sparc/cpu.h                   | 12 ++---
 target/xtensa/cpu.h                  |  2 +-
 linux-user/elfload.c                 |  2 +-
 linux-user/i386/cpu_loop.c           |  5 +-
 linux-user/i386/elfload.c            |  2 +-
 linux-user/x86_64/elfload.c          |  2 +-
 system/cpus.c                        |  6 +--
 target/alpha/cpu.c                   |  4 +-
 target/arm/cpu.c                     |  6 +--
 target/arm/helper.c                  | 41 +++++++++--------
 target/arm/tcg/debug.c               | 18 ++++----
 target/arm/tcg/hflags.c              | 35 +++++++-------
 target/arm/tcg/m_helper.c            |  8 ++--
 target/arm/tcg/op_helper.c           |  2 +-
 target/avr/cpu.c                     |  5 +-
 target/hexagon/cpu.c                 | 14 +++---
 target/hexagon/cpu_helper.c          |  6 +--
 target/hppa/cpu.c                    |  6 +--
 target/i386/cpu.c                    |  7 ++-
 target/i386/tcg/system/excp_helper.c |  4 +-
 target/i386/tcg/tcg-cpu.c            |  6 +--
 target/loongarch/cpu.c               |  4 +-
 target/loongarch/cpu_helper.c        | 20 ++++----
 target/loongarch/tcg/tcg_cpu.c       |  4 +-
 target/loongarch/tcg/tlb_helper.c    | 26 +++++------
 target/m68k/cpu.c                    |  4 +-
 target/microblaze/cpu.c              |  8 ++--
 target/mips/cpu.c                    |  6 +--
 target/or1k/cpu.c                    |  6 +--
 target/ppc/cpu_init.c                |  4 +-
 target/riscv/cpu.c                   | 17 ++++---
 target/riscv/tcg/cpu_helper.c        | 18 ++++----
 target/riscv/tcg/csr.c               |  3 +-
 target/riscv/tcg/tcg-cpu.c           |  2 +-
 target/rx/cpu.c                      |  4 +-
 target/s390x/cpu-system.c            |  4 +-
 target/s390x/cpu.c                   |  2 +-
 target/s390x/interrupt.c             | 22 ++++-----
 target/sh4/cpu.c                     |  6 +--
 target/sparc/cpu.c                   |  6 +--
 target/tricore/cpu.c                 |  5 +-
 target/xtensa/cpu.c                  |  6 +--
 67 files changed, 352 insertions(+), 345 deletions(-)

-- 
2.53.0



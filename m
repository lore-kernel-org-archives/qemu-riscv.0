Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FDBC5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:16:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx99W-0005MR-7g; Thu, 20 Aug 2026 16:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99J-0005KW-L1
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99H-0001tB-Dq
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:05 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7mKw3491838
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ty2W7x0FL79KHD8WFGy5r9
 fs4m59Z35jx+PNPaegBMM=; b=VnyXdVkrXryFfWzYpIfZz3DRPXLzTw+hBT9aTY
 sMc4Xu0NscHdJgtfdrUzzLJ+scnlUfRxPo50XtbL0pWOOZAXe34hdGdwOFuRDp1d
 I3Dg6POiGxwEpRS7Fb9YIuSUbTTOvYkqR6Znmy9M6h5Rd6b2sn7qd+esrornoFo0
 mm8taLG+FjP83bzK6nnRpH6zdbbObDahNK0JQ3n4XQ4sQYXGx/lbhIl3asbTAY56
 f9sI59PLE1C56Z4C+riU8xq87egI0f2V4gneMUZq1uxd1PdwxWbyK8T0ys+xIkA4
 TcLCNfxz/m9WiAJObMFRupjNioqjvUHp6El3sgMmbxiZeX/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytcaqdh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1a97644aso2453241cf.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256840; x=1787861640; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ty2W7x0FL79KHD8WFGy5r9fs4m59Z35jx+PNPaegBMM=;
 b=WSDif2gk3lwn40UO4yVihlNhKc0FCoN3K7/2Jj68IiQDnypNn2en7nRfeGI2XkXEiy
 o6iut7HzJHalAF5Tgnhe28UGV1WsBQB7pAcxWIyq26E7KYFfHMDSwObJuDU2NIHA8jzP
 PdIwd1hpN72bQ4ncCApORkoowXcX35DAYwRmX5U59o763L8AaRIUxuelbCNBJtaZgna6
 jlcQNy9RE/45OH86Idu4gnbNvz+fJONHuOFTAbN3xuQg0Ez7F0y0i8Z0SDzpGB1gSZK/
 DJru61s1bFg/EhAu60h/9B00pXmNegw6f+YViKl/+dLCMVDaau6aHg1gbRvoarIPEBnP
 tP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256840; x=1787861640;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ty2W7x0FL79KHD8WFGy5r9fs4m59Z35jx+PNPaegBMM=;
 b=mGFOl9lg9PbuFEf+i8Ws6hv05bExP8Jp9JqcnAGOK0ffSK77p0wKl7oKOx4eCOO3jl
 GJjQRaGXpQm1J09G71mMZ8wSOfiN9Iyfc1+KY586jFthIAxxcc4zLJ711OKollhRcnVx
 M/AOKYn+FIr7zJEuI8kIHis5VDvX9kzCxGS5ZNIC5DAU7i3aORLkdroZ9sGt4V6KMBOj
 EABzHuJkMo9ZKsyc7Tj+A+oH8ARBJeWNNuxEYezpsTq494FUFdoxJ4n3YiMo2VuBPm8O
 G8tJLLxAIbuNqIedpga5MUTPpKxbgy1DDiS9YeywmKbHnrTnz7yREysgc0n3W6ESAVk4
 0+6g==
X-Gm-Message-State: AOJu0YxLP3NOX8YVBtAGYL9VosEq31muPzlDyAOogBFa6oXj1u0qaXOx
 MIk5n6SqvQWFXYEz5cRPyLJqZM6z5FRyIC0MJDYPTmSGEaZxhGODNN7WCotRoBGFUBwcjjJaRcK
 Qo7bU4bzNSRPVDv9SxAkXroxZcU0f1txN28clwCEPUmc1Qk+FbFUIJafj6g==
X-Gm-Gg: AR+sD13hNWC5AklH4jCmh13CGOHeA9qg9R2GhiUARQJn3HLWhKUb6CF8pdlYEKcyjmp
 AFdv+WNuw8cjQNwMx3NpyvCOtAKMYKYL4a1VSnFJ8+5stCoIBpPVcuBvJa2xMNHS2K7rNPPOTVI
 XyL8joAO6r1eS7Uaq4zeg1IWWl91dPJ9s5DlKkDi2q+u8/iAzvnwjXRg5GI3dRKE2JvNSdVPJfb
 MssU3uDcOtocySvNboQinTchb0c8c3cgz4uqqreTZ9FtJnHshcERqOAYzTLRNCL4agNue0Apd//
 HBQUBbkg1KSKsBchoRba77Gh+uXdDfOMAugFGHKlbI/8O+Bsbyp+qkeN3FrEFilI2OZ1Fpurbjp
 OGlY0DjC/N5Co3hwQgGZoLWyZjjkYYiVSKZXMyTK/5g==
X-Received: by 2002:ac8:690c:0:b0:516:d955:ea2 with SMTP id
 d75a77b69052e-52df5524c18mr12777191cf.0.1787256840261; 
 Thu, 20 Aug 2026 13:14:00 -0700 (PDT)
X-Received: by 2002:ac8:690c:0:b0:516:d955:ea2 with SMTP id
 d75a77b69052e-52df5524c18mr12776611cf.0.1787256839821; 
 Thu, 20 Aug 2026 13:13:59 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c45d1sm12796010f8f.30.2026.08.20.13.13.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:13:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 00/15] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Date: Thu, 20 Aug 2026 22:13:40 +0200
Message-ID: <20260820201356.29775-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a876009 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EsJihUnQuNbXHJ2VNycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX0j+mbFzNnbO/
 fZvJqId/NuTQ+UBLW/RJD94NqRel4kViF24baLicrQVTY2Vwo0+tDEpilndIPqfm2netWIXOofx
 bYBUj4WOho1twhHK4JTyVSuhBe/w47QoIpRMXAWD8yVc7LAdVn3bP9zBzY6CpUNTcLc0OSlJrpZ
 Ev634uRruRWfJ2odGOJ+4yBhROksVD0QrnETgZoOFxOokvPsvTuwWy8CpFTG87nOwdoDZ4W16Cw
 eFWxkOnoJc3FbIoiSy3eAqInHqq2FWyhVEwkGBd9Ul/JbwF6vTW5WIB9T0Hevc+1/yCWBmosU0b
 njhWbZvzHuTMbc+WET996gM2L+Uf62aOxlnB/W6Zr2gs28Isjh4+3jvFlVZCGRY4tWVeQwFmUQf
 XBYmqxNrU4wny4cnYMWbPKiTUQVaGCv/b1YePJOJUqGYqK68Xr3vyH4KwCLhUPJcy9FINqaCfm8
 ThsgtKzkGoUjr91D7vg==
X-Proofpoint-ORIG-GUID: oo4wI7-K-jBdNXZe1pndBFaOCnF9r8xn
X-Proofpoint-GUID: oo4wI7-K-jBdNXZe1pndBFaOCnF9r8xn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX2a8VKN3qBuAH
 Zxq2wPmAdJHKwSZMKveKIVCJWFK5YT0bEPw4O2K3Tq2CVJSNbvnpFVjW+GTSQUSv5UytjP7shwW
 iutrMS07h6VhBgKreoDUKt8+Qq+C6Og=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Missing review: 2,12,14,15

Since v1:
  - use _Generic (rth)
  - no more RFC

- Patches 2-11 trivially add const qualifier for various
  cpu_is/has() getters
- Patch 12-14 add const-qualified variants of cpu_env(),
  env_cpu(), and env_archcpu() using _Generic() macros;
  consolidate the redundant env_cpu_const() alias and update
  linux-user to use the generic accessor
- Patch 15 finally convert the SysemuCPUOps::has_work
  hook and all target implementations.

No functional change; purely const-correctness improvment
to enforce has_work() callees don't mutate CPUState.

Build-tested.

Following checkpatch.pl errors ignored:

  13/15 Checking commit efef90983aa7 (cpus: Add const-qualified CPU environment accessors)
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

Philippe Mathieu-Daudé (15):
  target/tricore: Document architectural interrupts as not implemented
  system/cpus: Constify various CPUState arguments
  target/avr: Constify CPUAVRState for some cpu_*() getters
  target/hexagon: Constify CPUHexagonState in
    hexagon_thread_is_enabled()
  target/i386: Constify CPU*State for cpu_*_interrupt() getters
  target/loongarch: Constify CPULoongArchState for various cpu_*()
    getters
  target/mips: Constify CPUMIPSState for various cpu_*() getters
  target/s390x: Constify S390CPU for cpu_has_*() getters
  target/riscv: Constify @iprio argument in riscv_cpu_pending_to_irq()
  target/riscv: Constify CPURISCVState for various cpu_*() getters
  target/sparc: Constify CPUSPARCState for various cpu_*() getters
  linux-user: Uncast void pointer argument as Object in
    target_cpu_free()
  cpus: Add const-qualified CPU environment accessors
  linux-user: Replace env_cpu_const() by generic env_cpu() equivalent
  cpus: Constify @cpu in SysemuCPUOps::has_work() handler

 include/exec/cpu-common.h        | 29 ++++++++++-------------------
 include/hw/core/cpu.h            | 21 ++++++++++++++-------
 include/hw/core/sysemu-cpu-ops.h |  4 ++--
 include/system/cpus.h            |  4 ++--
 target/avr/cpu.h                 |  6 +++---
 target/hexagon/cpu.h             |  2 +-
 target/i386/cpu.h                |  4 ++--
 target/loongarch/cpu.h           |  6 +++---
 target/loongarch/internals.h     |  2 +-
 target/mips/cpu.h                |  6 +++---
 target/mips/internal.h           | 10 +++++-----
 target/riscv/cpu.h               | 29 +++++++++++++++--------------
 target/s390x/cpu.h               |  2 +-
 target/s390x/s390x-internal.h    | 12 ++++++------
 target/sparc/cpu.h               | 12 ++++++------
 linux-user/elfload.c             |  2 +-
 linux-user/i386/cpu_loop.c       |  5 +++--
 linux-user/i386/elfload.c        |  2 +-
 linux-user/x86_64/elfload.c      |  2 +-
 system/cpus.c                    |  6 +++---
 target/alpha/cpu.c               |  2 +-
 target/arm/cpu.c                 |  4 ++--
 target/avr/cpu.c                 |  3 ++-
 target/hexagon/cpu.c             |  8 ++++----
 target/hppa/cpu.c                |  2 +-
 target/i386/cpu.c                |  7 +++----
 target/loongarch/cpu.c           |  4 ++--
 target/m68k/cpu.c                |  2 +-
 target/microblaze/cpu.c          |  2 +-
 target/mips/cpu.c                |  4 ++--
 target/or1k/cpu.c                |  2 +-
 target/ppc/cpu_init.c            |  2 +-
 target/riscv/cpu.c               | 17 ++++++++---------
 target/rx/cpu.c                  |  2 +-
 target/s390x/cpu-system.c        |  4 ++--
 target/s390x/interrupt.c         | 22 +++++++++++-----------
 target/sh4/cpu.c                 |  2 +-
 target/sparc/cpu.c               |  2 +-
 target/tricore/cpu.c             |  3 ++-
 target/xtensa/cpu.c              |  4 ++--
 40 files changed, 132 insertions(+), 132 deletions(-)

-- 
2.53.0



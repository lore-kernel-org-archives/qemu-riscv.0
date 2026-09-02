Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0411C624D3
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 15:23:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1mll-0002FI-0N; Wed, 02 Sep 2026 11:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mlj-0002E3-1n
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:20:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mlg-0008QC-Nj
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:20:54 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682EdRjU2947771
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 15:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=pZ4anDqGKCG1Hjgnuccy7B
 IDBeWYSFknLoMsOiAVLdM=; b=kiAQWffB+twUUu3jLfILytEbAgBVb7uucGRogp
 k/XOTuDYB1PvOBYelc+5rYRMh4WT5ihA5y/72vXo5+26hOt5jAW2IN9c+Q5tqUiW
 0eIxc477hlsWVwyybgHwqSmxNPP6meCh7nkVgeCvdM4Z3SA7en5X9uYIVjX2rA3R
 btXFPORhYaI+mtDV70Ki+Qu3xX3gnvwsDFhNwtCwL4H0UYMhYXujPHLBxrfgfZdM
 KKJev6aXorIUwjxI1poWiB/qC6cQ/ER2VjKE2s/jVrgyRnSxBI8yH623r2MiF0np
 1FICo0Tx9BpYDamaW9K/rOpP/BzqrnmfMrGlFRHP/588a/yA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrng58r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 15:20:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93494cce712so248987485a.3
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 08:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788362450; x=1788967250; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pZ4anDqGKCG1Hjgnuccy7BIDBeWYSFknLoMsOiAVLdM=;
 b=OTQQTlnBbdgMJ0JrxAd25wMWmKopYj0t2oglNeScrQLGYFrv9fwi809C2eI3mGr6MZ
 WK8PGMV9Irg5xw7JYah1R9PSuEm/FISpyRUxpBFoZaldJSmgl2KKFQxmvDQ+B20I34Td
 zcQtWrWCF2VeeJE1CBhp3t4BHXbizCqSdid88ybun1vHDL6i+yrXNolsmVAlMG4/y5bZ
 g8Wul8my1i719UKF83lxREI7QmS1YpNwtVvFWQIZfiuwAbj7wm3lejvHgRluwgCEFSVg
 jTbcSX+vamOVcTFQrnx4PLloKETk9ptISWI7FYQpHtHIc67S+bFamhN9UTRc9R2+RPos
 aHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788362450; x=1788967250;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pZ4anDqGKCG1Hjgnuccy7BIDBeWYSFknLoMsOiAVLdM=;
 b=m41MYgUD9Qbc1kgEBU8wOclIGU6j7iRMxvMp/KSl/J9jv+f2F7jUyCL8TA+3h+iS23
 YVBRizOI8h6s93AXKgkuxdk8BF931Yus5ketTtjEVyn4DxQ/RIny+U8NiTtJdyMPzMEv
 9Qdc+vt0AkpOVstlwGNocwpE4/c4UKWen1lbJlOhT3jZEuEn0bxH9cB2DPAn5HmPXZU/
 vMZKctqVXQoC8NVuXQORizli+aZpH2siXTqzBuPmnJ5nGSRM8miYC4CHF0fBKA5iPuia
 BEmxP1ycKaOstt6wvQDu1SqHx/cfrJtl5H7+dHTS78pLd9MlwBgUngDm+RH3vijs00+P
 D6yQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq6rWIRizZ07a0H9+YDtUd/tb07OUYCh6PWJl33BEcdE1I6hBbG35mMvzj8j9kPi07NT1sQpVJ5rpxe@nongnu.org
X-Gm-Message-State: AFuF++kAF8B/QXkQj6m+nBT5YdUH0cAjpNa+WzM5a5HFKSq3VCvdKp94
 p1uIdVofaPF4j0R4y5VVOVla7fxYhTj9sDICSWYcDAriYmU7ibzr5b9/ynO6vG4HxqdvGZJUXfo
 93iFD8Ry890V0ewG9ZwkQnH1TB42y4e5RgQ5Z56qKDrXeeYU1cAdswtLYJA==
X-Gm-Gg: AR+sD13bmRGbDbXXbF9wZl5rwvLBKEIFBuJNm8+d/b7vuNpPg7GB0cYcZerA+3Aookl
 8Cifq5ZvrAnsPKyBLcYxJ9Y9HAjrRM6WOJtFd5/RLVTwQSOWEVheI2OslJ/W0dAq3PHJlJfiNfS
 usfKtzrtcfmj0IrVAiGLm5LPN2ydC1Fa9n/sbbdXET3HXbpvZvM+kpEFAYW+FqDw+hOfaEUKbmp
 NYes99rjiwXjBZ/Fq7cHZgGrj9IuOj4mhwzrk5hXxwsHSGF90RcZp/OO6hGg+5XYVdEuk00lgGM
 T+9XyLf1gAy3Y670nrZBHMtx+tjLr3cEwTkN9OeMC6v90dQiOo/qVhx1zKo7etucq3qeYdjZIq1
 uqoaXpu8n5PtpGmOtXAnebENQPlTcJ/p7BjDkq74R
X-Received: by 2002:a05:620a:690e:b0:939:6c31:2318 with SMTP id
 af79cd13be357-9396c3124b5mr174926785a.34.1788362449688; 
 Wed, 02 Sep 2026 08:20:49 -0700 (PDT)
X-Received: by 2002:a05:620a:690e:b0:939:6c31:2318 with SMTP id
 af79cd13be357-9396c3124b5mr174917185a.34.1788362449190; 
 Wed, 02 Sep 2026 08:20:49 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdd73f7a4sm160385825e9.12.2026.09.02.08.20.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Sep 2026 08:20:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 00/11] accel/tcg: Push BQL down into per-target
 do_interrupt handlers
Date: Wed,  2 Sep 2026 17:20:31 +0200
Message-ID: <20260902152044.31291-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oa9R_eJdkHONY6AEz98p2WbIMP3L0916
X-Proofpoint-ORIG-GUID: oa9R_eJdkHONY6AEz98p2WbIMP3L0916
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a983ed2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=64Cc0HZtAAAA:8
 a=aj3i90qetJ7cPP56xCgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX8vNe4RaHafh+
 W5+oEfAkQdtzxRkOO/5LJB0+oMYnVt30CWaeLZ6v7GI5stPkgishdKnNEe+CTjhjWSz5g6S8aZA
 mvSFkNCST6LzOemN4MH6YkFCx/54FJRemo2TFn3nR2avpOr3ORPPQhCcI0mkHcC5gwvcI/P54T2
 zjpdM0YoV9ktH/Wd4qH/OhqQVICuqHwIeQ1N3ywt3sEc9twVGsBaRcwcYt8FKFbT9qg3AE/5ARQ
 85H/BduD1BW0ekuoHjssJyYc75g6Zcb0A8EOnkTna4kZetXO5NXcf9VyBxjQytZCm+A7vsBCM7T
 QljfsS0KwDm6ixQOJ/3aMkQkvGQlCwd4BQd7capwc3SL55Rg19T2EsqnLmPQOzygpOVOfzPD3Cx
 g3rmxPdVe2uI76ir3gEqSmyjPRcZpXNcud8SpCDrmLwe9sk4AtnuovwmFQCLuty237oihxzc61u
 yY0x7QRpnR0WJrafsOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfXxAEzLbfN3z3G
 Lk0LZUe/XKiPT7y6u3axgWsdq6Czm5+hdPuhZgLZk1TiCnGHO/GfLXNOX23i4didJ1PLzWF6GPW
 LAh/yzC+63d4F7bRI1Pg6YhlbSrG4Oo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020135
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

This is a respin of Robert Foley's v2 series from August 2020 [1]
triggered by a broader review of BQL contract in my halt-to-exec
transitions series by Peter [2] and Mark [3].

v3:
- kind of rebase
- rename misleading fake_user_interrupt callback names for clarity
- restrict interrupt handlers to their appropriate modes (system vs user)
- explicitly document that do_interrupt() and cpu_exec_interrupt()
  callbacks are called WITH BQL held (explicit BQL contract in docstrings)

v2 Summary
----------

This series pushes the Big QEMU Lock (BQL) down from the core TCG
cpu_handle_interrupt/cpu_handle_exception paths into per-target
implementations. This allows each architecture to manage BQL locking
granularity independently, reducing contention on a known bottleneck
as measured by QEMU sync profiling (qsp).

The BQL has long been a scaling bottleneck in QEMU, and the
interrupt/exception handling path is one of its heaviest users. By
allowing targets to acquire the BQL only when needed, we enable
future per-target optimizations.

Refs:
[1] https://lore.kernel.org/qemu-devel/20200819182856.4893-1-robert.foley@linaro.org/
[2] https://lore.kernel.org/qemu-devel/CAFEAcA8xk8y1W0UvttpVhKYuoMBSQqZoF_15of0Rrq4wKkWDuw@mail.gmail.com/
[3] https://lore.kernel.org/qemu-devel/69d07179-388e-4285-902b-36788b2b3da1@nutanix.com/

Philippe Mathieu-Daudé (10):
  target/arm: Call arm*_cpu_do_interrupt directly instead of via
    TCGCPUOps
  target/s390x: Restrict interrupt handlers to system mode
  target/i386: Rename fake_do_interrupt to fake_user_exception
  accel/tcg: Document cpu_exec_interrupt() callback contract
  accel/tcg: Document do_interrupt() callback contract
  accel/tcg: Add do_interrupt() wrapper for targets to manage BQL
  target/hexagon: Move to do_interrupt() (BQL acquired internally)
  targets: Move interrupt handlers to do_interrupt()
  targets: Move BQL locking into do_interrupt() handlers
  accel/tcg: Remove do_interrupt_locked() callback

Robert Foley (1):
  accel/tcg: Rename do_interrupt() to do_interrupt_locked()

 include/accel/tcg/cpu-ops.h         | 32 +++++++++++++++++++++++++----
 target/arm/internals.h              |  2 +-
 target/i386/tcg/helper-tcg.h        |  4 +++-
 target/s390x/s390x-internal.h       |  5 ++---
 accel/tcg/cpu-exec.c                |  7 +++----
 target/alpha/helper.c               |  3 +++
 target/arm/cpu-irq.c                |  2 +-
 target/arm/helper.c                 |  1 +
 target/arm/tcg/cpu-v7m.c            |  2 +-
 target/arm/tcg/m_helper.c           |  2 ++
 target/avr/helper.c                 |  3 +++
 target/hppa/int_helper.c            |  2 ++
 target/i386/tcg/system/seg_helper.c |  2 ++
 target/i386/tcg/tcg-cpu.c           |  2 +-
 target/i386/tcg/user/seg_helper.c   |  6 +++---
 target/mips/tcg/system/tlb_helper.c |  3 +++
 target/ppc/excp_helper.c            |  2 ++
 target/rx/helper.c                  |  3 +++
 target/s390x/tcg/excp_helper.c      |  8 +++-----
 target/sh4/helper.c                 |  3 +++
 target/sparc/int32_helper.c         |  2 ++
 target/sparc/int64_helper.c         |  2 ++
 target/xtensa/exc_helper.c          |  2 ++
 23 files changed, 76 insertions(+), 24 deletions(-)

-- 
2.53.0



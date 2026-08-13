Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF74C5B572
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:18:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuZz8-0001q9-CN; Thu, 13 Aug 2026 14:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZyz-0001mY-Co
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:16:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZyv-0001x5-Q3
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:16:47 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFU6w13500759
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PWFJKPjiUmt2MzQeVSdtz6
 +I6h5J0GJ1E7SS22Bc2ZU=; b=i9P0McYtdYz9t6lpEeQncewevRg0h4yiVxMWJA
 j4+P8d2tQh8v2ko3emcxDUNqhIAfjATjE3ACGbrPeYI0esHXNFUpawWGkgnfZGM/
 8OZwqM6xSmfrM1jQdBQY/BuF0uioEpRLvK45/zZJu1NXOU4l0b0evFMV1jvS5uAS
 wx/qVUPglsQpFvhlgsnRy7PxHFd859NbDtSD64AuUad0Fgealp83JknpV4zo5Ju0
 efRb5T6dtc/KYptsebrqpFcV9P/Myud+22XetzMFC+LRvEMVhfC6zCTviVi/EjZ3
 /FtI3drB1uXd9nzEaL3qGvTAW26ltBud2hRTvVz19JUqHVcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g181836pw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:16:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51ebdfceddcso2461181cf.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645004; x=1787249804; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PWFJKPjiUmt2MzQeVSdtz6+I6h5J0GJ1E7SS22Bc2ZU=;
 b=kkGUWCmNebqUVBnK05aibcs38pEWaqKYKC8Ki2ZKn42CvhWALYUby7eLjZeuux7HSQ
 JcUuDHmAMHD4gZJiraW8dN+hat3R6JnzIkkuCyOu9DqkTeAJ19iT6MeGVkuuv+cLVQF8
 ki/7QxImGecTBLwyUTBvReZeEwESn7kQ4AzR8x0IrHNSKa4+ROnW9BvEFOZkABeAN6sb
 Cp+S1QCIvCJqqyrXm8seZAr+Xe74KZ/rhq9uyW5MqIVfxpv/g4aS6VfFJfpqjQl0zrbU
 n1sdw30+bqHPIw95EzTutuKoAPDhDEFdYIqT5G/+ByOXi57nOshh5auaIxanZUOyZkur
 geiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645004; x=1787249804;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PWFJKPjiUmt2MzQeVSdtz6+I6h5J0GJ1E7SS22Bc2ZU=;
 b=a6fGhcfsVRBNzB9KTwRSBW2c29njyMSlG1Z+AtWw1G6h5RnViBtAvO9F550dhjOdot
 wjMLir+owmWsCAyBVWC0aTJiNX/3mHazts4qKw9j/XLFuuUQ6ykkC4zef8ShSPCDnoaB
 Q2o7gsfYbXFIP/5L0GUYbc2mCkIp/AG7jPrPU9AMOXiuuzbbXKye+9ZnSkmuFilOtuDN
 c7mrVis+kYLndEPtTnkiEDvrPpXI284cCUKE3yjMnmORxVRg+84Vrxg1mPI/vlapzyuc
 6vjIjmQMjKGAHYRRFzAS9c9OM0oQr0la32mQSwLgU5B3s+MvfBELaY+98+zTne7qoCpz
 A6CA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/m+8xpZnMDWioYXYmx54U2+oaA5tUL9DnrJs1XUNyEBf7AoQbHdR05c52eIyTXChot9zwFfzUnIVB@nongnu.org
X-Gm-Message-State: AOJu0Yw0nTnqXhM194gM5/2q0WU5fBpuh7KL3/kHElG+ZZfRDS3SMKHn
 Gj+Q+MJPwqaErUUWfxZYcQHw4Hn7/ZcYlmOuz7XHoZm6ZcEJAKbyOnIV2ok9/9+oxYBf+xckDjk
 EIeJEt0pNU/LKt06a0ukF3koO2XbjbyRGo8L6lGlCkb1naxrG+rpuWM6MHw==
X-Gm-Gg: AR+sD12bsCRR8VeiRN5G5mwk3S0VEStBf821YWiVlxxRf0RhNEB/Zv+i0of823MnlYf
 UPb/TrYFjwkRrwPLubub8YOBUfp08azxDgYJF2bkGyyL+UKqGcWiPLU5V/048szUa8QNH+e/5LO
 MWdhXI3firpMw3RF00cidEKsJvdkfiF4dsApPD6/Y+jIwAdBzaqaPD/sSGjcDfzcuhlgcvcg9Xd
 3K5+A/QwVb7j2uIrK3QXFvqjZbiqwTHYxsjbdIr9sBEB2XaVN0EKsSTZZuEXOCieLj6J3o7wXUS
 WMh5hXrFUtSsgvCry58NFkc8eEJneFSS+L+P+tGxTNXgGYzJOo27fPTuPlO8yAhsO3E8vkEoG4S
 zW77cnPpFsm8IxR3NfQGIGYPG0yrHIw1hAf+T2Om/fg==
X-Received: by 2002:ac8:574a:0:b0:516:d781:589a with SMTP id
 d75a77b69052e-52d73d93483mr80959841cf.22.1786645003600; 
 Thu, 13 Aug 2026 11:16:43 -0700 (PDT)
X-Received: by 2002:ac8:574a:0:b0:516:d781:589a with SMTP id
 d75a77b69052e-52d73d93483mr80959031cf.22.1786645003075; 
 Thu, 13 Aug 2026 11:16:43 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c07d2sm1220943f8f.30.2026.08.13.11.16.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:16:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 00/16] cpus: Improvements around BQL locking,
 improving docstring
Date: Thu, 13 Aug 2026 20:16:23 +0200
Message-ID: <20260813181640.6537-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX06QB1EYzBBRi
 gzPF8F47NcjP4wX/5RIjVDIRW9XRwRTRbhGeHcSTVCONh1khPI2ZSa/SWwGrCsq/nqUCnkn1cBW
 EG+rFAGkjJjEPnXUFl1vI/iJOeMwqTM=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7e0a0c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2yYdEO9dI-2tQnahI7EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: q6wleR6II8El-LCI5MW46jjQtWvVMpqH
X-Proofpoint-ORIG-GUID: q6wleR6II8El-LCI5MW46jjQtWvVMpqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX9y9pvYhD7LsX
 GcuGHtdJDoEz3/F19JueDYNfsUI8lPadSDilylK5w1RiI5sp2UN9hbUnfHUqQbHSma+NihnCKwW
 wbOmAcxZp+81AP+KirtNigq4ssTf2RhevzAUoHnEBWFHQAJZcZHwr2cJhop3d6CdUn04o+fbUGf
 lsWaw++fPJITNYwBFLLZHPRGI13aknXwQd3KITMCACErZD1GjEQ8LdQqdtW9MtLIUq2IF5PTvBc
 OXojL+NWmTnDlHYajeN/YX7Ygrv8Iz0xd9dYV1fjlOkiuVoDtBodWYQ5PaonzaL4gVDhT2Tgq6i
 svn2SSiDUtjAgik8B6RCk+HEGV8TbalZe5iYK6EYz6j3xCx4aguLOTL8TvRr7lqNfRpzWuRJRwj
 guj6armZI7FXqHKavj3xVMa7WdeBp3m33k9IapnTVpm9EmqX+uXJAqKrqZlUzLDP9mqBlnd0+bN
 2yKaHB5IeIJJK1G7z9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Hi,

While working on the hybrid-accelerator, I had to debug issues
with vCPU scheduling and BQL. This series contains patches I
wrote mostly as note for myself to better understand what was
going on. Please review carefully as I'm way out of my confort
zone...

Thanks,

Phil.

Philippe Mathieu-Daudé (16):
  accel: Label outer / inner vCPU execution loops
  cpus: Improve qemu_cpu_kick_self() docstring
  cpus: Rename cpu_stop_current() -> qemu_cpu_stop_self()
  cpus: Rename qemu_cpu_stop() to qemu_cpu_ack_stop_request()
  cpus: Improve cpu_pause() docstring
  cpus: Improve cpu_exit() docstring
  cpus: Document process_queued_cpu_work*() runs on current vCPU
  cpus: Slightly improve *run_on_cpu() docstrings
  accel/tcg: Use RUN_ON_CPU_NULL for tcg_commit() callbacks
  accel/kvm: Clarify use of @r variable in vcpu thread loop
  accel/kvm: Consistently return CPU halt state from
    process_async_events
  target/arm/hvf: Move flush_cpu_state() into the inner vCPU loop
  target/arm/hvf: Lock BQL outside of the vCPU inner execution loop
  target/i386/hvf: Lock BQL outside of the vCPU inner execution loop
  target/arm/powerctl: Move BQL assertions to async work context
  target/arm/whpx: Fix argument order typo in memory access error
    message

 include/hw/core/cpu.h             | 54 +++++++++++++++++++------------
 include/system/cpus.h             | 19 +++++++++--
 accel/dummy-cpus.c                |  1 +
 accel/hvf/hvf-accel-ops.c         |  1 +
 accel/kvm/kvm-accel-ops.c         | 10 +++---
 accel/kvm/kvm-all.c               |  1 +
 accel/mshv/mshv-all.c             |  2 ++
 accel/tcg/tcg-accel-ops-mttcg.c   |  1 +
 accel/whpx/whpx-accel-ops.c       |  1 +
 hw/ppc/spapr_rtas.c               |  2 +-
 system/cpus.c                     |  9 +++---
 system/physmem.c                  |  4 +--
 system/runstate.c                 |  6 ++--
 target/arm/arm-powerctl.c         |  9 +-----
 target/arm/hvf/hvf.c              | 16 +++++----
 target/arm/kvm.c                  |  2 +-
 target/arm/whpx/whpx-all.c        | 10 +++---
 target/i386/hvf/hvf.c             | 20 +++++++-----
 target/i386/nvmm/nvmm-accel-ops.c |  1 +
 target/i386/whpx/whpx-all.c       |  1 +
 target/riscv/kvm/kvm-cpu.c        |  2 +-
 21 files changed, 106 insertions(+), 66 deletions(-)

-- 
2.53.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D013AC98302
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:50:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93gi-0003Xo-M1; Tue, 22 Sep 2026 12:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93ge-0003WX-PQ
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:49:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93gb-0002CQ-Qr
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:49:43 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjKQT318032
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=fnZTb+1ILyES5h9HPeC4Ea
 g0BwGQLUQ5aNf0G7SiUtU=; b=YgQp5qPbUFDuHhPaFxx2PwQ8r8M3oBUZ9NhobY
 m+/jeWTrA6etpGzr3anISOI5ccBsLPiPRnH0bCTMDVRcrTWI97BAORL+z7yiXfKJ
 ip+dXoyq8kDoPN3yuTe8R2tCLg0YhFac97TvFDZitIloSb+hTegKn3883vxXsY0b
 wPlBws06Jng7My7FC5jfnWTnGWvistXBtoztCdJsvzrlvqWrVvfN4ILx5OnEVpzg
 WGdfoHBPZl2ItstSOZ76C1lk+Ax1OuinWrLCryumiUqyKiLfo7OkZcDWI/VHyx7D
 AEc2yLQHJlLALR22Kn35gb4iL/9xp6IamGEupo1jKNFDR30A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqj7c8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:49:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-79013d05471so384137.1
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095779; x=1790700579; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fnZTb+1ILyES5h9HPeC4Eag0BwGQLUQ5aNf0G7SiUtU=;
 b=WK30ZiK3yXT6MEEVGzTjwABeQ1bB+d86sk8OT4+prlAYazZw+kAlzsbDJQfHqycV3b
 em9dGHszEsjmTTNlwlMUjvUg6eQ1BMGaouUHN4yfoDLlwF6xwUkOrjRv7Rl9PKLwQ1R3
 BycIct6RxzrjZcwVQrsUqDSnKwpWtLJaoS9AuR+X0V3q2flbUkLiJ+8EzaK2NUOi9woh
 kIH0jCMQhZap2y8eKLx6JOSy/tdevdewU8DyXfqO8PCT1CkhWGRUcl4mfgGpwGYU+96a
 gmJPhXWsgdNODx0wCRu4Pcm4Ha02a9H4XEbEKcsYFhmDpYSMLOU1dFWRa1iMOtBtEgs0
 CYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095779; x=1790700579;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fnZTb+1ILyES5h9HPeC4Eag0BwGQLUQ5aNf0G7SiUtU=;
 b=fflyB944TV2Kb48b4MD+5kalmy5H6p7YUa3KD+3g+e2Im0mRS5A6nUw8EFaFpfcUSK
 93aVHweLOO1Js8b7B2OPldzRJ62sdZf+b4zsOX3xCrgmqxAM4J+y/nzd6lNmzpruydK0
 PW2kmEiJzCd6V2ySmO+Fdfv4HnnBNVhrpgfS5qPxOVUrGT8TphXGh+64wNeNidEBLlIU
 JiMTjvPthyfzhqOFKhBFYSCdq32wYw6Eabb/rHZMjF8Uj+btRJ60Gv9jOFIQKIN5ZkjJ
 /RZ2R7sifThrlonchZdmSsuJZ9do3Ccs7PyJ1idsaBfJfUaVCt9I/QKH/Mxue+vAxWTG
 PxSA==
X-Gm-Message-State: AFuF++kP4tU/olFkHYDEK4laHahRmRe7ieRZEVECmzqXiFABPmh2vcb7
 UxEaZfoWgba1j6NXV5Z65XcA97gC1ZOIrN9JPxnYfvGMqLuSc5wQ4/Qq47F8WpeV2FsmLOUUj+X
 wGMGxTUrQ4Wzluknr9NmsQhvxUfWPpgaA6tKrcGPTruuN8EyaekPZ1CEqhA==
X-Gm-Gg: AYBFou30ZdyZOW193wUzxjQ6/rbAcMjA2qyRdLovJKSMiBSISzzgO7dO98lmCfNZHZD
 VVJ9lkYA5y3h+GBohDiC3TE+lEITIb1SqlQQ72i3fy4KXNi8RdxiFDf3Mf/C+5U7ylf0LHwjvwk
 Cj9KWK4iq4xn91qtfVlxm791PJhCV92xRDn1oirlp9N69bB5yO84C9QpFS6u5HG6ZLINimrW4Oq
 YmNc9CmRerVBSK8LycLOi71RDHl5iJQ8MA/lyGK1adXd/F21C/xgVRpuUK+2AYQ8KXLFJ77X10N
 AtvXdAqN8P8o5e+Kb1nVMN/Mmi6W5Nu2UbASBEV0taO6mVgS+hqleTpuq65WEttzZ4OnVA9UsDs
 jhei4vvosLVtlyie93qa8H9WP7qLXYsIIRPb2/vTI
X-Received: by 2002:a05:6102:a47:b0:7a6:e302:e24f with SMTP id
 ada2fe7eead31-7a6e31243femr6675143137.24.1790095779293; 
 Tue, 22 Sep 2026 09:49:39 -0700 (PDT)
X-Received: by 2002:a05:6102:a47:b0:7a6:e302:e24f with SMTP id
 ada2fe7eead31-7a6e31243femr6675069137.24.1790095778766; 
 Tue, 22 Sep 2026 09:49:38 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1ccccfsm3169625e9.7.2026.09.22.09.49.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:49:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 00/17] accel/tcg: Make halt-to-exec transition explicit and
 remove cpu_exec_halt
Date: Tue, 22 Sep 2026 18:49:18 +0200
Message-ID: <20260922164936.15189-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX8MDO+4bxmV9d
 jjxWXtNpQ4iMaWh5PXiaBo29m990CKHxcyiPdLHqAgufmZ+ePdoBqISWWoryxdkIF2GoQexccyA
 AOvvZXkrRXmlTvB4uH9bSyJRh3kHKOSbDvheEpqLnzeyRY8FavsFVZ+ukwcb1wnxqxulKyDVy3O
 40nTmGp9gbsKgfcuPzwooK5HIE6Dr+bjV66IhUvltmVpp1tsnLGFiSf+CryTNezwzXAAfG13W69
 bAjqwckTCwEzy+LlBo78lJQG4HN6ChGsInpteuBqGT4svqunJXvk53mP4jhHu0LTi1pgZa8/+Ww
 ASHW4T7iFFKrAp7Nv8l24Gyziaa2/trTz/TDApHw7Ut/HrwRXkikCz73msPdOSTH1mz4ci79exV
 P+nUZSjmlZ3wPHWPTgpn9yeJ0IfHeMrmOYMLIatlcuKbQA5Xal7HDzp9vFAp8AiVg3jKKE7a9+D
 LEbLAwE/z3tMOUymCfw==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2b1a4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=IL0c7CRWWM0nRW6uXqsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: lzem_ITAHVISLiZDOoMgLh_35Je5xeuF
X-Proofpoint-GUID: lzem_ITAHVISLiZDOoMgLh_35Je5xeuF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXx6GDMw2j9+5f
 twZgZVrbn4nGQjUXqozQaYrvGP0Ns+NMQ8+Hfze8syc7Khub8Yf/D4QQSfqK7fVSZHtp/Py5qiQ
 yckuC/FWs6wBsRP5zwhP+/fIOLRx/m8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
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

Since v1:
- Collected Richard R-b tags (sometimes commit description updated).
- Documented the BQL and synchronization requirements of has_work().
- Renamed the callbacks to poll_during_halt() and leaving_halt().
- Addressed Peter's comments by removing racy halt-work assertions,
  documenting the BQL contract, and explaining why x86 #DB delivery
  through do_interrupt_all() is safe without the BQL.
- Addressed Paolo's comments by making ARM PSCI state updates atomic,
  kicking remote vCPUs after power-state changes, and ensuring x86
  APIC polling runs before cpu_has_work() with the BQL held only
  around APIC access.
- Sanitized s390_cpu_get_state() for atomic accesses without BQL.

This series was inspired by a previous thread on the list [*].

Refactor the CPU halt-to-execution transition logic in TCG as
something more explicit and composable.

Core problem: TCGCPUOps::cpu_exec_halt callback mixed concerns,
it checked for work, processed async events, and handled state
transitions all in one place.

Solution: introduces two dedicated callbacks:

  * poll_during_halt(): Process target-specific async events
    before checking for work. Called early in cpu_exec().

  * leaving_halt(): Perform target-specific state updates
    when transitioning from halt to execution.

This separation allows the generic cpu_exec() code to orchestrate
the flow cleanly (process events, check for work, transition state).

Only 2 targets need to be migrated (x86 and ARM) then we can remove
the redundant cpu_exec_halt() hook.

The changes are expected to be purely refactoring with no functional
impact.

[*] https://lore.kernel.org/qemu-devel/CABgObfaDAhrpnVqQaKgG6uxPQe1YDu77YOsUEx9nqrN=3M2cGw@mail.gmail.com/

Philippe Mathieu-Daudé (17):
  system: Document has_work() synchronization requirements
  target/s390x: Use s390_cpu_get_state() consistently
  target/s390x: Make s390_cpu_set_state() return void
  target/s390x: Use S390CpuState for CPU state APIs
  target/s390x: Access S390CpuState atomically
  target/arm: Un-inline arm_set_cpu_power_state()
  target/arm: Kick vCPU after updating PSCI power state
  target/arm: Access PSCI state atomically
  target/arm: Read halt state atomically in arm_cpu_has_work()
  accel/tcg: Refactor poll-while-halted flow in cpu_exec()
  accel/tcg: Introduce poll_during_halt() and leaving_halt()
  target/arm: Split leaving-halt handling from arm_cpu_exec_halt()
  target/arm: Convert cpu_exec_halt() to leaving_halt()
  target/i386: Split APIC polling from x86_cpu_exec_halt()
  target/i386: Split leaving-halt handling from x86_cpu_exec_halt()
  target/i386: Use generic halt transition handlers
  accel/tcg: Remove the redundant cpu_exec_halt() hook

 include/accel/tcg/cpu-ops.h         | 36 ++++++++++++++++-------------
 include/hw/core/sysemu-cpu-ops.h    |  6 +++--
 target/arm/internals.h              | 11 +--------
 target/i386/tcg/helper-tcg.h        |  3 ++-
 target/loongarch/internals.h        |  1 -
 target/riscv/internals.h            |  5 ----
 target/s390x/cpu.h                  |  9 ++++----
 target/s390x/kvm/kvm_s390x.h        |  2 +-
 target/s390x/s390x-internal.h       |  1 -
 accel/tcg/cpu-exec.c                | 20 ++++++++++------
 hw/intc/s390_flic.c                 |  7 ++++--
 target/alpha/cpu.c                  |  1 -
 target/arm/arm-powerctl.c           | 13 +++++++++++
 target/arm/cpu.c                    | 31 +++++++++++--------------
 target/arm/tcg/cpu-v7m.c            |  1 -
 target/avr/cpu.c                    |  1 -
 target/hexagon/cpu.c                |  1 -
 target/hppa/cpu.c                   |  1 -
 target/i386/tcg/system/seg_helper.c | 17 +++++++++-----
 target/i386/tcg/tcg-cpu.c           |  3 ++-
 target/loongarch/cpu.c              |  2 +-
 target/loongarch/tcg/tcg_cpu.c      |  1 -
 target/m68k/cpu.c                   |  1 -
 target/microblaze/cpu.c             |  1 -
 target/mips/cpu.c                   |  1 -
 target/or1k/cpu.c                   |  1 -
 target/ppc/cpu_init.c               |  1 -
 target/riscv/cpu.c                  |  2 +-
 target/riscv/tcg/tcg-cpu.c          |  1 -
 target/rx/cpu.c                     |  1 -
 target/s390x/cpu-system.c           | 26 ++++++++++++---------
 target/s390x/cpu.c                  |  3 +--
 target/s390x/kvm/kvm.c              |  4 ++--
 target/s390x/kvm/stubs.c            |  2 +-
 target/s390x/machine.c              |  2 +-
 target/s390x/sigp.c                 |  9 ++++++--
 target/sh4/cpu.c                    |  1 -
 target/sparc/cpu.c                  |  1 -
 target/tricore/cpu.c                |  1 -
 target/xtensa/cpu.c                 |  1 -
 40 files changed, 119 insertions(+), 113 deletions(-)

-- 
2.53.0



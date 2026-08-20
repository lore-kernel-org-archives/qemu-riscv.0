Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A526DC5DF82
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 10:48:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx0J9-00089N-Sc; Thu, 20 Aug 2026 06:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0J8-00088Y-He
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:47:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0J6-0005fU-Hf
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:47:38 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KAP1Yp2214909
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=yOfrwN7XZTm7KWpYEY0Hp9
 MRR/g+kSAHFmxWgdqlD5s=; b=DmFfoDKDeokIwoVdSLlZebUoJxmlJxuQmshR8n
 n+6SzGdBK2oXXl8aRvADIDAtKHr4AZ/kxGEZ+aIM02guYcArO505xRN+ljgisSS5
 cckfAq8szshuYruIxCmZ0+j2UlUlkOT/nwAn0A0N3ItoiUbJfP2in+B+4lyRDsmx
 tWezfCylkII51uRK8UgTbXVUQqP7RAyp+9rPKjY985ZXHAkfGo+t/0OuJ9Mhie19
 eTaopn4mJFxgreNL6OAYvoozhhUM3j2DrjJEb2gS5udZofHLna5kPUTdWpYkqP5C
 A5kKwyY5MjENCj8rU/PEDxMOtjMO6QJHz4f4pqSObK8ZAGHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytc82q2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:47:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9372b9db132so87466785a.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222853; x=1787827653; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=yOfrwN7XZTm7KWpYEY0Hp9MRR/g+kSAHFmxWgdqlD5s=;
 b=TwwMmsDDBiCB5/wE3BDBFmL/RzEjPV7cwUMzEGwAvfzh8WYjWSRvP3upNxb5Q8itRD
 GK1rbnwU5tWcYasfSxOpfG0V9sDDgNtju9XiWLWD74Vs9DeFq4mjMEIxCvMzTPBcjDdG
 XO19twwWS1qm5qGhw44aLugTwWujEYxbns4qohPzlbci52o61/xWhM5Dew3RL2dXHTFx
 yLzdtHTMjDtC4yWDbt2lHBaiIlE977rkVfxJh+xYmsM6NHwkqgObAa+pckosKIPqj7WI
 BBfVISQl/eVQL47laLyghB8bGaHYD72xI4NgqxbnUwl+7vNxXt2pxgFNVcCzGIqUMwfX
 YIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222853; x=1787827653;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yOfrwN7XZTm7KWpYEY0Hp9MRR/g+kSAHFmxWgdqlD5s=;
 b=i2Q9I2zscH9COYWchhsNUfynfOvDQNloiUOOFu1fzmbeOKxfhhrvSKoFgJh6eivE5U
 QsGshJsAqWofLik5AyhgMPcxQObsbzI9Dr005C7T4m5bmABiP/FZIPHcQnoniB5I+NZO
 Cahzx1wPwxlRmqsTdqlhdJ+DmtB9A+5XLXpPsHvsJ+1QtpyHC7yry/db4XBcCF/5wUP7
 i7vjfvKbSrer4CIXnn2n9QGiLj6FItevedntPcbpyR4QRQBlxN9NoMFeY851/TOBNaUY
 U6JxwceGk/8ljU0AHAdcJKqoYUz8LEyRoMBU8GHkgkS/rEyiNyeLtcrPWWZqW86bpBUi
 0hyw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqs6bJSWKqAed5b0qbIJe9FbQSDwm979k23nsBey9JF25hl8z3w9F0Nu6U/7m/4les+AzdqG3EZ07NI@nongnu.org
X-Gm-Message-State: AOJu0YxOCaGVEdm6OfEIz/rhY9ci5vhZ+A2RdZ6ovDCDG435Imb5IAEZ
 WxS/M0zVdHqbMeen53vGNEB0yWKV2vYRnZNxPOetwIPV2TZiMOcWrEJH6ECMU+joxOTqt6lsXJX
 9iS9v1RB5I+bGH2I/mozY+8C/iw3VU2zdCZJtmg5kJTY74T+ZkdTyzy+UdA==
X-Gm-Gg: AR+sD12Ti/KWGAzBP8NncAAwNZjDtDMrx8QfN5qxpdhUxeFQSGPPzWAppncduPS1YcV
 FQR82cci3A1W2ZVxr4LTYrFnhQF11J9WOCRizhN6IVhXp420pA89rOd3lEY1O/CkMnTaMSd00p3
 1BhrbQW4rNSxMCgDQEu7S3B5YiST1Q7a8WNkL7a2Febaimd+hLsJZuRfdno5LMOl8A7EgyQ6vS1
 K0pPlB2HVvnIhW7jw3ZRhTGm+JJXbHKIlG3dO0AYCSuj3irn3kEo0bEHCzUpYNfy3uqKF2GHG0K
 pqLGU03XjyEXBz5gHplhGLZ1gheHa5wuquOwdVFcl08Sv1LKvZLbUnki5GzGwX0+Zjcr9RWjLBh
 7JNvir/KRMk/bD7u34ft4xMh2iM8ysuezBGE8ZA1VxA==
X-Received: by 2002:a05:620a:8006:b0:92e:eff7:34a4 with SMTP id
 af79cd13be357-9371e6b7d27mr1034891685a.43.1787222853396; 
 Thu, 20 Aug 2026 03:47:33 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:92e:eff7:34a4 with SMTP id
 af79cd13be357-9371e6b7d27mr1034888285a.43.1787222852965; 
 Thu, 20 Aug 2026 03:47:32 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b7d3asm11787735f8f.23.2026.08.20.03.47.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:47:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 00/13] cpus: Constify @cpu in SysemuCPUOps::has_work() handler
Date: Thu, 20 Aug 2026 12:47:16 +0200
Message-ID: <20260820104730.25462-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a86db46 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=AAaQe5pYXAwOW-7l4ZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX0MJMrV9/EaOf
 lVDzl7NVpt6otzPLQAltUbr2UQWEeTrO10gXSBMnVlB1rKg0fWdLAuQkzM5nH9itZ6u5UvhtM55
 CAAzxVvVqipuijpq9T+UzTpI4rP1L39pMrf3k7CVwDnUmXZyFU3peHKhh/VH53fYrW3Op6EsKbx
 yLQyxGbuwGpS5dbiSrYY9fyaqSzyJLbz2FMZ7Ulp45IUIjY94zQxsWk8jpGnFTkRkKt/CKBzHD7
 M15jNuJrqJ1iJ3NOmkS1ubL9whj0A/qmft5hK2YuuJAL8Rmx+iglsq5NvgL3w44zDIXOux5gf1m
 TfYGN9mozLSCcLcXhyoQoablmcvfE6+LGuj1YCqX2PXZ4QjhzxsUolRNAJwjlNWJVZJCq4vv1gF
 yrdfL1+FVnarVP3o5Djqixi79ypp2+tPhfcWiVYERlJDW0FOza57+pbu4qoXeSfIuNCfzy7NNfP
 Tj6LQ9lg5KQy7t6EZuQ==
X-Proofpoint-ORIG-GUID: mqtXN4aLNE4IrEeUz4Sw39GkR9G31y3e
X-Proofpoint-GUID: mqtXN4aLNE4IrEeUz4Sw39GkR9G31y3e
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX/DxLyjZ19k9B
 PrPazx313hdQp0sqrF5eDD0HuRc/WrftE0Oh5LAGk5Akd6nnd3LCJReKkNR8b9eorFcFr5vMJwP
 CZRwo9a9zFavvnCfu1PCklR+8VU+d9s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200079
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

- Patches 1-8 trivially add const qualifier for various
  cpu_is/has() getters
- Patch 9 adds const-qualified variants of cpu_env() and
  env_archcpu(). Not sure if this is a good idea so marked
  as RFC.
- Patches 10-12 complete the cpu_is/has() getters const
  conversion using the new env_archcpu_const() variant
- Patch 13 finally convert the SysemuCPUOps::has_work
  hook and all target implementations.

No functional change; purely const-correctness improvment
to enforce has_work() callees don't mutate CPUState.

Build-tested.

Based-on: <20260819145649.23439-1-philmd@oss.qualcomm.com>
  "Make halt-to-exec transition explicit and remove cpu_exec_halt"

Philippe Mathieu-Daudé (13):
  target/avr: Constify CPUAVRState for some cpu_*() getters
  target/i386: Constify CPU*State for cpu_*_interrupt() getters
  target/loongarch: Constify CPULoongArchState for various cpu_*()
    getters
  target/mips: Constify CPUMIPSState for various cpu_*() getters
  target/s390x: Constify S390CPU for cpu_has_*() getters
  target/riscv: Constify @iprio argument in riscv_cpu_pending_to_irq()
  target/riscv: Constify CPURISCVState for various cpu_*() getters
  target/sparc: Constify CPUSPARCState for various cpu_*() getters
  cpus: Add const-qualified CPU environment accessors
  target/riscv: Constify CPURISCVState for various cpu_*() getters
  target/hexagon: Constify CPUHexagonState in
    hexagon_thread_is_enabled()
  target/mips: Constify CPUMIPSState in mips_vpe_active()
  cpus: Constify @cpu in SysemuCPUOps::has_work() handler

 include/exec/cpu-common.h        | 11 +++++++++++
 include/hw/core/cpu.h            |  6 ++++++
 include/hw/core/sysemu-cpu-ops.h |  4 ++--
 target/avr/cpu.h                 |  6 +++---
 target/hexagon/cpu.h             |  2 +-
 target/i386/cpu.h                |  4 ++--
 target/loongarch/cpu.h           |  6 +++---
 target/loongarch/internals.h     |  4 ++--
 target/mips/cpu.h                |  6 +++---
 target/mips/internal.h           | 10 +++++-----
 target/riscv/cpu.h               | 31 ++++++++++++++++---------------
 target/riscv/internals.h         |  2 +-
 target/s390x/cpu.h               |  2 +-
 target/s390x/s390x-internal.h    | 14 +++++++-------
 target/sparc/cpu.h               | 12 ++++++------
 target/alpha/cpu.c               |  2 +-
 target/arm/cpu.c                 |  4 ++--
 target/avr/cpu.c                 |  5 +++--
 target/hexagon/cpu.c             |  8 ++++----
 target/hppa/cpu.c                |  2 +-
 target/i386/cpu.c                |  8 ++++----
 target/loongarch/cpu.c           |  6 +++---
 target/m68k/cpu.c                |  2 +-
 target/microblaze/cpu.c          |  2 +-
 target/mips/cpu.c                |  4 ++--
 target/or1k/cpu.c                |  2 +-
 target/ppc/cpu_init.c            |  2 +-
 target/riscv/cpu.c               | 14 +++++++-------
 target/rx/cpu.c                  |  2 +-
 target/s390x/cpu-system.c        |  2 +-
 target/s390x/interrupt.c         | 22 +++++++++++-----------
 target/sh4/cpu.c                 |  2 +-
 target/sparc/cpu.c               |  4 ++--
 target/tricore/cpu.c             |  4 ++--
 target/xtensa/cpu.c              |  4 ++--
 35 files changed, 120 insertions(+), 101 deletions(-)

-- 
2.53.0



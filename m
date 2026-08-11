Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB7AC5B572
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 18:34:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtrIy-0006wC-IH; Tue, 11 Aug 2026 14:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrIs-0006tv-Ah
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:34:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrIo-0002Lm-BN
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:34:20 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BHtnSU1015585
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=U6nPqz+NgDGjy5XjtQPM0M
 8BR2zWCmNRHfhDxymV9N8=; b=nHrm0FxqIvYYdyKPIvXOiW5a6jVbfn4zjQHXO5
 oWjOHW9yJNLxKamQ2ZYGKps574GCFomXL9rqgMS56IGt3cmwMwd2+6M5l57uAyUp
 XelcxwwkFFFzv4VmAnKCBQ3D/vHWXsLlrUUpOD+7Itc2/fshCFo/QPHT+cwNRUEt
 KdyEclD1EQaQW9cKq2jSQMq4DDMQa2xH8QncYqNO1k4rJcNEafq3RCybb98ejlYd
 qpCBlBU3p1qe1JI0eQfCa5NNWmhSbo4rATpnsDe1AOTnpqP9bRkv/ZYsXAz93mSr
 E7RaKoADrp/5GWUOn98dPsFael98tSrm7BuLKJYPCM0DsEhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrg4km-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso2086551cf.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 11:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786473254; x=1787078054; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=U6nPqz+NgDGjy5XjtQPM0M8BR2zWCmNRHfhDxymV9N8=;
 b=XM83x55jbbR0ZToB8lDdYFI8fEUKusnNulPY5oeJP6nkdE3EfrO8LogVf6cqA7CQ9s
 ckAGu9nuwx3fcCa6MpwTAqMGqCZxe4n8Jbi/jw7NIZZxKVSChOo7nI0v9EHUlsUt4Wvx
 GGTBZTWZwGzwQ6YjQ/02sT2Hb0F0mN1Y0L1JutKcLFBWG5xwj4oORrx5OtKpYCf2iorh
 iQKdFyECtpUyf5D8CNUCciDiYtSGO/WO+Fp8/V1W6F0ZKqif5mEczGi4BdakzSCV1kMo
 3yuec28zTouWYeHGzJQNFv1ZE1+4/rfX49kBNL43/1Yp3i5BpaeWCn0iN8WJceE5QplG
 nB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786473254; x=1787078054;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=U6nPqz+NgDGjy5XjtQPM0M8BR2zWCmNRHfhDxymV9N8=;
 b=rk1z7B4VB0irlLFelAczyEfMzvtMcB/ydGKQjiB1HiM7JLh+9CJcpqPSjd4UFif1eN
 TXA+dS2etOSIjxSjk//M9ml+jRwI9b6KIpoTDdja59bHdCAI8ftU8D+G4BpdXVVaIaP6
 WQkNzMpX481DjBcnzcDcD6J17CIKiWiHefxFiEIj3fFxy4aoP7cmFyuZVBzb4GzUPudB
 g6JNTzASAqGMehFbLclQDBlbnJcEiRXaIZM1UanebJtX1KrW3QvHvcEZ1g8eyAQnXm8D
 18OlupN/x7E9nUZuCQtLpm5gM6tf4ez1UF40ljNPpXJzqfwr/WIkcjpJLJ3T9uKoKp05
 PxGg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqBYW8YDPxig1/qoEPe8o6plKiAeTjmWeAXHwH4geil9Qyaje/tcRc8YRMU6rc999LJlq8195S638KW@nongnu.org
X-Gm-Message-State: AOJu0YwiylP6XoBOy11SnCcMzzYo7t9kO7NdxYyMHTQt4nnoGJkh0RNV
 xy5b2MNm8+xH777o9H1d7txtQVzeuOcJpbUMaELXqVp/7adWDAOsPzrEgLHiKmmJu8v2NaHMpHq
 /x9Zwg4lYBfOj98TNErxqEynZAi2HB4JjwuyPpvwTn6Tbk9ZPnBX3KMGrz6uRckFURA==
X-Gm-Gg: AR+sD10qUXpS7J1vqQ4yLgPFpJIzobjP2ZHuv2bKlUfdBkb30B9yHo1RSHd1x/BlSME
 LI5B6V1VL4GsqE3xpWMJrD3xxSShObioRTu6oV5tLOQsLyn/6iuLnaDsbHcPUwlB+YxzGoJ3PrL
 TfUB9tOvSwmitaGXwkaDwVPf3ccuNh3fkVIYAekjgAqd3Gc6t3pPneEKLYzH1sLuq2+XFtU6PGr
 /FFqb9ytzCKiOcI7yFK6qI0Akp9r+YClnnkmRQvhNEg3FrzogvMDQL5Rh7cntp77KLw4IplUiIB
 ASLQPEOaHBya+HzlZYc5SHbpTwyVIt7F3kTZ4ARfa2Mm4j4PxPSZPGN4S+MLJNg3RRUhfzwYqo+
 W6dB8wHRd+yqX/idlF7SofhkUK/2mPmeuGqOFA6/99g==
X-Received: by 2002:ac8:590a:0:b0:51c:ba4:d837 with SMTP id
 d75a77b69052e-52d600f6953mr25081141cf.18.1786473253834; 
 Tue, 11 Aug 2026 11:34:13 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:51c:ba4:d837 with SMTP id
 d75a77b69052e-52d600f6953mr25080621cf.18.1786473253369; 
 Tue, 11 Aug 2026 11:34:13 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997aabab7asm10382785e9.6.2026.08.11.11.34.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 11:34:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 0/8] hw/cpu: Slightly sanitize CPU API
Date: Tue, 11 Aug 2026 20:34:02 +0200
Message-ID: <20260811183410.22428-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5UtlLRGJkpvWn0HM12g0-u0xp-Jzt0Uj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX9MlKPj22tYeH
 mwE75lwcq9WyQ7J6mFfMp0Q/VdinijvRaHsjVodjlc/plZC8IaR3EBCquP1ZQOEPMweHKxm1wXL
 ar4SpWKjkiMmGZ1mAnd/N7/KI6r6+yw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfXzaoBvcgU0l4E
 Qdmm+3XpnrmkJhsoeLvqgfA0DiaXly+IyrfIM8/5pHuoG7QtJYcRg/ZCCCwOGbg3faFJHeJUnmr
 oiWk1kg2U+iNM/zYohCCZil3MqeXVNufmRnwV9wIvt2rtey9DtqvwxxPoaOJZHVWsDKJVIHTH/e
 TjX6LneFEoGYt7YlgKFRbyyTnCWI72bdmW7sRLfcFpRdQr7scj/8Menrqv/N6xmrZg0H82KTzth
 jP9RkasarQTA/9Kts3s2M44z90wz7+FVmhTLo6Kik2yKY5qhDnal60TCIu7WKqH2LBOGnrn0cUR
 V+zFJhtc5Da66dy/vU3IwGGmeV9KNwrU7x2tzUYgxJEhMDTk4MzFdwDEuKBFz+X7p6t/oR3aJaW
 uoHH4tzBzYKP56lrvUDLJNG9pIm8f+VOe+jh7d7EbZEmdT/GrttwDaVxOuAp0zfK4+NT7ra3ORM
 PGEqcOgFj9Zm7q9jxvQ==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7b6b27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=l5eZHeLn_C_0ZvgPWV8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5UtlLRGJkpvWn0HM12g0-u0xp-Jzt0Uj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155
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

API cleanups, mostly removing system-specific code out of
cpu-common.c. Code churn renaming functions, in the hope
to make things a bit simpler to understand.

Small patch set extracted from a series clarifying CPU /
accel synchronization, itself a preliminary work to introduce
split acceleration, eventually.

Philippe Mathieu-Daudé (8):
  hw/cpu: Correct CPU_GET_CLASS() comment
  hw/cpu: Include missing 'qemu/accel.h' header
  hw/cpu: Move internal declarations to new 'cpu-internal.h' header
  hw/cpu: Rename cpu_common_realizefn() -> cpu_exec_realize()
  hw/cpu: Rename cpu_exec_realizefn() -> cpu_common_realize()
  hw/cpu: Rename cpu_exec_unrealizefn() -> cpu_common_unrealize()
  hw/cpu: Extract cpu_exec_realize() out of cpu_common_realizefn()
  hw/cpu: Move system-specific cpu_exec_realize() to cpu-system.c

 hw/core/cpu-internal.h     | 23 +++++++++++++++++++++++
 include/hw/core/cpu.h      | 15 ++++++---------
 hw/core/cpu-common.c       | 32 +++++++-------------------------
 hw/core/cpu-system.c       | 29 ++++++++++++++++++++++++++++-
 hw/core/cpu-user.c         |  8 +++++++-
 target/alpha/cpu.c         |  2 +-
 target/arm/cpu.c           |  2 +-
 target/avr/cpu.c           |  2 +-
 target/hexagon/cpu.c       |  2 +-
 target/hppa/cpu.c          |  2 +-
 target/i386/cpu.c          | 10 +++++-----
 target/i386/kvm/kvm-cpu.c  |  4 ++--
 target/loongarch/cpu.c     |  2 +-
 target/m68k/cpu.c          |  2 +-
 target/microblaze/cpu.c    |  2 +-
 target/mips/cpu.c          |  2 +-
 target/or1k/cpu.c          |  2 +-
 target/ppc/cpu_init.c      |  4 ++--
 target/riscv/cpu.c         |  2 +-
 target/riscv/kvm/kvm-cpu.c |  2 +-
 target/riscv/tcg/tcg-cpu.c |  2 +-
 target/rx/cpu.c            |  2 +-
 target/s390x/cpu.c         |  2 +-
 target/sh4/cpu.c           |  2 +-
 target/sparc/cpu.c         |  2 +-
 target/tricore/cpu.c       |  2 +-
 target/xtensa/cpu.c        |  2 +-
 27 files changed, 99 insertions(+), 64 deletions(-)
 create mode 100644 hw/core/cpu-internal.h

-- 
2.53.0



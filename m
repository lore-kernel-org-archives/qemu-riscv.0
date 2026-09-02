Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA10C624D4
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 15:23:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1mn0-0004JK-15; Wed, 02 Sep 2026 11:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmy-0004Gg-Vy
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:22:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmv-0000Mt-SY
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:22:12 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682CRFEW2001738
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 15:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SjB+WsiUNVtJNvJVB5dqKRZIiGYlMTYMCAkchDEtNgc=; b=TUDPoA5uCVbKCwsC
 IMgSPhLFOiV4N7UcK99Sbemz82kwmsh8TXE8cCqZgH+8HyRImfyCMltv0+jBXjD4
 vET/gdrQ6C5KD86Wc8k/5EpuKwgSAQq4JZxDm1TFsdkdo35bv+ir/dbP24+bubJW
 FFmGJmmR5/uFHcbB6HPR6yZwVuSKyaH7Iuw/LO/m7/A0v55cymY1CeK4swIPq8uI
 5eSRwaYLlAkrV/kicszyzvSD+8bmwF/WcsaZNbb1wuNROGfg3rRPvUxFtd/+kWbt
 g7T597L6gZ5/FbaLlr5S4HSbAy+AA7CUpRCbX+jXqQCCXvi6iZgWolbKlyp39v5u
 1P+F4Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy1ffw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 15:21:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-97ca6578487so755174241.3
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788362518; x=1788967318; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SjB+WsiUNVtJNvJVB5dqKRZIiGYlMTYMCAkchDEtNgc=;
 b=VrN7xDni5XM1kpAi6f9dJhUIGrlsvr6cJ/cnyxp7f056yXQHaogy6vi/nJf9urPwO2
 OIITDZByOqbo03x2ODl8OeCBPvRR8disE+L5YVZ44gAj2CG6aOIzKTOWyJd0/azfPdJx
 ePlMev5rNKKivTgIG1svHpjxk9RUc/IT/4vxvevYjSpWi3yAwe00oVW9XY0JJ3HWgur3
 GXByN3hQMxwq5o6oQBpNBDapr8bnGCkpluq3FfrnbAhIVwM9uwwMBsei50Sa7M/Jhtdy
 i0ph6+4R6vsid1e4N87PIHSAd7XBUkGdBtBpB841BdOtLgeQViu/n4ugvl+EGMKTu+7Z
 8VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788362518; x=1788967318;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SjB+WsiUNVtJNvJVB5dqKRZIiGYlMTYMCAkchDEtNgc=;
 b=Gq/8jnxzT6Xcz67CuEUkjGVOEeTOy53sOog1o0phG8IWsJm9gKYhuu4vnvJ3FG3UUQ
 sxq4WKSxGIxK0TDnec1wN4kJ2E3uqA5mCiU46CQuAc6C44ABeGHsHTMWqNLCm4XQi63H
 KO/nMFsMX18zewE8weNmDN2D6ZLjneNlTaEjyNhBcVBhlFgj7nKmnxn6A0hvscF01g5z
 I+43M46N/qp5QxLUYXH+OAOlLtaJ3STzI9100I78R6U4SHWVURYHKTW105ZgC2JLFmOA
 SJaF72gEyw/Ip92bc8rbYzezH1eCBe1RvKMaYfRQBl9mPyNCzbomCGFw2EjTWYEDanXd
 vgXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWK7xhszEJ2iSTb93xCGtJ6O4N7rchEvM4OR11hH6VJFTYZum93Rflx+POCbZzIReJo7xzKwvo+ywy@nongnu.org
X-Gm-Message-State: AFuF++nYnYt+khEoKqbXlznwocVwDWx/F7HSa/29gL0VugoG4kfaLPiG
 jky2Q4ie9p5T9HgacpFEA42I0uO2qVMUa2G+bAyDFmpMzxTP9tdo6uDIBf+QZhJiWQHnruEPAvh
 mhkWp8p89+pqMk8+F6GyyNLjimPBQ6fW1yOOH2yQB2KdiGL0B1Nud0pI4zA==
X-Gm-Gg: AYBFou2HRNdgcImzCyjOBjj7lRWegkUH1WfcheoyAIaYWmBQCPqcTfs6aIUiBY2/KsR
 PUZ0CU4aqMuB68MZSy32edX0BajC56bwl7wd5aKjtvg3/gncUucjtzsASlT3vxg+dZoHz2r+77a
 /wkrF/SO0kfBMzueISH8BaFiPqULFAfHHtpW7MAdUpLc7pQgcMTknZ683c/5ENbtBcAiqoP+Xj0
 aZv6CIwd2/WV4niz6ACdfIhPGiLKATFuY3YyEweLnt91Lo3MK7m64fkkHcoIs69YTP1SeDafNgy
 zhWNqo+6KMjytnIoATo80xL5yx9+fuNH0UU4HjLZwDAWKRA/8DVWwd2PmcWxBT9R54s3tDRROqd
 maOUvsUdrjqdgQ88mQZoDTHuAL0Sxys0/VcLmpQoS
X-Received: by 2002:a05:6102:4243:b0:786:e7a0:603e with SMTP id
 ada2fe7eead31-78a1f233cb6mr2343298137.7.1788362518031; 
 Wed, 02 Sep 2026 08:21:58 -0700 (PDT)
X-Received: by 2002:a05:6102:4243:b0:786:e7a0:603e with SMTP id
 ada2fe7eead31-78a1f233cb6mr2343259137.7.1788362517484; 
 Wed, 02 Sep 2026 08:21:57 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce309e418sm97965215e9.13.2026.09.02.08.21.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Sep 2026 08:21:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [RFC PATCH v3 09/11] targets: Move interrupt handlers to
 do_interrupt()
Date: Wed,  2 Sep 2026 17:20:40 +0200
Message-ID: <20260902152044.31291-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902152044.31291-1-philmd@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a983f16 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-wU1GuQjd2BOtWieTlsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: kApkT5oERhhzrVVed29OmngRy5RqNaIH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfXxI4ArpX+rytB
 xl3C+orC2LWubww8EdBPvXeWp6QBBcxpOYrOVxBayUNd/J+5K6WQsUbmKIL4wBXkLWU8n8d2T+o
 NKYpaUXqEKM5aM8kGg5vuE0jg8OcNj0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfXyE/9enaSbS8Y
 Poe88ff7drTatRnXpPyCBm9Sf1lfeStFIlOB0kIUBNV3Lz3uDX7iPMeiigOx6wsGZJaB2Znza6q
 LyUCT7Ngp7AICi/fdYTJROorflgsV0McQw1vm7V/p3hU12YU6VX5AgX8G1cQMRPJNdR0bzHDlWm
 CB1FpwYix7v9aE2w9fVFR1IvxxlBSyzzLNOsDdLy8jMfKCPPVHgh6sLCNty7N7YcHH4xg72ZbpC
 S+HvwlkVfl4ycS+IS3HQxBkRW2QeexSjLo1f3+svMAtkp7JuUPJYDUoj1VpTVjG5ETclSC0Zx0h
 TFC4zus0EXeJR84SA9p59d44zfR2AOfNNozgtzmHo6nUIloUxzyPXM/XlYp4hNq2x2TRq82jSyp
 RcVZyGVuZvCOMcuNqXpKiIaH3tT6ULE28Ln6DE2xy2nDq/nMPZnEWYpf6zZUyGylwh4LpYEYHsT
 R9nQQh6DN7Q/VziAM5A==
X-Proofpoint-ORIG-GUID: kApkT5oERhhzrVVed29OmngRy5RqNaIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020136
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

LoongArch, M68K, MicroBlaze, and OpenRISC interrupt handlers
don't require external BQL protection, so move them from
do_interrupt_locked() to do_interrupt().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/loongarch/tcg/tcg_cpu.c | 2 +-
 target/m68k/cpu.c              | 2 +-
 target/microblaze/cpu.c        | 2 +-
 target/or1k/cpu.c              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/loongarch/tcg/tcg_cpu.c b/target/loongarch/tcg/tcg_cpu.c
index 6455ae0c99a..4b1d44a1644 100644
--- a/target/loongarch/tcg/tcg_cpu.c
+++ b/target/loongarch/tcg/tcg_cpu.c
@@ -329,7 +329,7 @@ const TCGCPUOps loongarch_tcg_ops = {
     .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
     .cpu_exec_halt = loongarch_cpu_has_work,
     .cpu_exec_reset = cpu_reset,
-    .do_interrupt_locked = loongarch_cpu_do_interrupt,
+    .do_interrupt = loongarch_cpu_do_interrupt,
     .do_transaction_failed = loongarch_cpu_do_transaction_failed,
 #endif
 };
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 85496deff67..9b52ad5fc23 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -712,7 +712,7 @@ static const TCGCPUOps m68k_tcg_ops = {
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .cpu_exec_halt = m68k_cpu_has_work,
     .cpu_exec_reset = cpu_reset,
-    .do_interrupt_locked = m68k_cpu_do_interrupt,
+    .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 649bcebf703..389a5124b12 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -450,7 +450,7 @@ static const TCGCPUOps mb_tcg_ops = {
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .cpu_exec_halt = mb_cpu_has_work,
     .cpu_exec_reset = cpu_reset,
-    .do_interrupt_locked = mb_cpu_do_interrupt,
+    .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
     .do_unaligned_access = mb_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/or1k/cpu.c b/target/or1k/cpu.c
index 83dc071c180..66c00c0930c 100644
--- a/target/or1k/cpu.c
+++ b/target/or1k/cpu.c
@@ -268,7 +268,7 @@ static const TCGCPUOps openrisc_tcg_ops = {
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .cpu_exec_halt = openrisc_cpu_has_work,
     .cpu_exec_reset = cpu_reset,
-    .do_interrupt_locked = openrisc_cpu_do_interrupt,
+    .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.53.0



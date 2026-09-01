Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B5CC624CF
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 09:56:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1LD6-0004RG-2v; Tue, 01 Sep 2026 05:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LD2-0004Ms-0W
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 05:55:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCy-00080a-PF
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 05:55:15 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179CR42061563
 for <qemu-riscv@nongnu.org>; Tue, 1 Sep 2026 09:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MTwxkxS/Zd7vHUks2tQPGnCsvxECdtOVgx/W1zGj3M0=; b=KKLY84XWz6E7NiN5
 shSzybLuGq/TjJf3+hEnL86UvyXqQr5Y88A3HXtX5vCILENTSznXJ4T9T+zoFLy4
 eAC0bfw8ZW6hKGWOcdFT0Zeq3MBoPwNv6Afkdwkf0QsTlquOJz3+gRoiLSFYGeFm
 oZieBMOArHzILrqV2+yZw52VXqf1S+yUbGLRzZKXfUKFISq5RWn6jKhqK7Tu4H3C
 Lu1kIHFjZmr6Mh3livHZ2VbqakZCesH0u/gdlZxZpyBHdrny73E4yiSiVIl/jQKK
 usrNVhyMiXfUzwjF90uvIkhvDG0Ld0qdrBjhnLw8dVuenrXH8rR1B67KwG8Qpzux
 jEoPwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh1e4c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 09:55:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9390ca1a9abso116222385a.2
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256510; x=1788861310; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MTwxkxS/Zd7vHUks2tQPGnCsvxECdtOVgx/W1zGj3M0=;
 b=Tu6V/TQaA0iKV74nPMTPjbs77BAmXfqGCVdGZcOFzbm8JdSiq+ibrnXvB4stleEhE7
 jqQhuX96Wvfcqb3arH2VXLS3TMuLBtsYYU4dcTbDZcrX8ptwa4ppI3A5LPJqhgm+yJBX
 xkSJKNUH0sifVxsXGN+HSmVSGmxgOQAbLIip8RPr4TVzV14d7lJOjFoWbjXXmwTjdhHO
 o+bgHFALf8zXmbsjbAl3FJHb6HaBX1Yg/g6kX0+xmdXa3jLRcJsMC1j3KRn+oeeSGs/V
 aNu2URyn+z3cDzuU+q0K5i0vxLllpk/sNq5cSlAvi/l7WeLJ6DqwEjGiYTIKzPgvjxE7
 Jnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256510; x=1788861310;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MTwxkxS/Zd7vHUks2tQPGnCsvxECdtOVgx/W1zGj3M0=;
 b=Ht7L8c8egkRf1z1WwfWWQS4q+7NnjMaaHFUPXAXVjjn5cfFE90FlHNZww2qOcMWO4b
 QVmEJe5ZkyQhCc+3RfKumEkHBGdaOh/M9jks9MnE/5CGXOH0V5xVVDwHwpzuqPW86Cty
 0GdZAZLFKVNLFHSTizvvwXDLXyuqUL6q29mqT/YdHR/Ieb5B0GDH16fLTKQy7ikVM6rk
 P8BACb9MTaqdzUyEQtnR+fM1avZBXdCHeGD9Hj70goLN7SlE6ypUWDY3ekT9Ti1MdYV1
 QKNQ+WEX+6Cx/3ozjAFrgXurPKbKX5LHazRgjgymtEDCQt+lnZFP9GalEB1S4DQBlBnm
 OKKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqVf3VubpnL3WSrG+FaPRP5jjZoe229Q66N+YrOEW946hBA9h2xPUGzLEyNJUf3wrXXkqYsqwkxZGPn@nongnu.org
X-Gm-Message-State: AFuF++nC10hbmq1vyzDKGC63e7+qs04XTwnsrnukDgNLoYCOrJJKGdfJ
 5xzXwA59Y7a+bWAJ1rWe8iLRd9EoXxyXnFaD0ISZLknMsqtygSIDXiVeR2Tbhu9w1iL7XpcAvPr
 3dRjxBgxMfHUdvl6aDO7HtMv4YWoL+FlTlgLzNj5fYQ/J41/naP5ndvu84g==
X-Gm-Gg: AR+sD13oxkoXrnI9mE5vbulz2tp3b2mYhiVOb3Zu9NJJjEUuKueUM4+lmqZ3HkaEt33
 BP6ogLqne2trpu3Jx8iL/k0cikGIB3vbahJ/WDsvest09sCaef5+RvenYusQ9mJwMpzsRpsTY3y
 B7q62CMzvMPHymdPTaC1yfo3jHV5MluQod1EgJDs9hc1cEUTBoLHajyOfHBo/fsjrKQQszTvjnR
 zKCIAQsuBdmlDkwqfmg0h2Q0WH6PRtS3cSH3mNafuZnVTDBfFNpmYl29srsVOEi2haRHl+WkmEd
 DDvJItfPUUchC7QU+kk2hnRdPTNCVb0p2ClJhIxAv7yZaTyUmY/H0nTXisBOzdB5NWicsEiOB7h
 4y00P/i+3bmW/MxY2dK4kZrWPPyW9opvquLKEoHTz
X-Received: by 2002:a05:620a:4802:b0:92e:dddc:6588 with SMTP id
 af79cd13be357-939139b2552mr3551146985a.42.1788256509650; 
 Tue, 01 Sep 2026 02:55:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:92e:dddc:6588 with SMTP id
 af79cd13be357-939139b2552mr3551135985a.42.1788256508386; 
 Tue, 01 Sep 2026 02:55:08 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce1e1ebsm56962825e9.14.2026.09.01.02.55.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:55:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Helge Deller <deller@gmx.de>, Song Gao <17746591750@163.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 21/21] accel/tcg: Constify @cpu in cpu_mmu_index() and
 TCGCPUOps handlers
Date: Tue,  1 Sep 2026 11:52:27 +0200
Message-ID: <20260901095229.72018-22-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX2duS76iSNg50
 mlB3hoNPStHr3BbbgU7f8GhnqOojSDCnUlJHitZNWlLY8NbchA0fJfj+tJ32pvRguObiZmmX6uH
 B+5Whq7tDoAfkYZbldB1mMMMjMfkCl4=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96a0ff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=g_x95mRnQQNavG41apYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cCks2rMwljQ-rD7O1OFNKFwkqwaMNXCJ
X-Proofpoint-ORIG-GUID: cCks2rMwljQ-rD7O1OFNKFwkqwaMNXCJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX2YYCM5GjsH6r
 bxh7I/OQ2PcYArDe6230Vj+gscMoDN220V5FUEA9aoIEbjckUkU92TOloJcgec77ooFNY3NZVrx
 aVzkjhVrgVJm1sqDfSQVzKIIWJ0GVWNyvRYB8qbI5+Ele7ueWj0mMRTSfXnyVpdmh1p4IXXvo2n
 h4OgdbcHUZeF9LsOEnC+i0viq76FVRAc16ix2F0G8xks447GCBsa8/juwivD23xH4SrMUGNr2uk
 OzRfUEYTgJIq+bKxM8tSfyJz0HY4gOcnAmP5wLwXklZt3n8UHarcgoeQqZtjzM4y+v7zMBsyt/y
 b2cXxjyWq3RLhjvrX/vTkfbiGecf4/Qk9+zBCNfTiRkgfN43letJ5ItTQoIy0/obDxEpUpdGC0O
 L3D/vh7OEZq3kuBip+Mt0PBRbHUesqgm1MBhUb6tQqVvlR49LLzN1DTRH79nUygMAgcY32+YJyd
 FVTaadP+P9hjS+i0eTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087
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

All functions called by cpu_mmu_index() take a const
@cpu argument. Propagate the constness to the caller
(CPU state should not mutate when resolving the MMU
index of the current translation regime).

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/accel/tcg/cpu-mmu-index.h | 2 +-
 include/accel/tcg/cpu-ops.h       | 2 +-
 target/alpha/cpu.h                | 2 +-
 target/arm/internals.h            | 4 ++--
 target/i386/tcg/tcg-cpu.h         | 2 +-
 target/ppc/cpu.h                  | 2 +-
 target/s390x/cpu.h                | 2 +-
 target/alpha/cpu.c                | 2 +-
 target/arm/cpu.c                  | 2 +-
 target/avr/cpu.c                  | 2 +-
 target/hexagon/cpu.c              | 6 +++---
 target/hppa/cpu.c                 | 4 ++--
 target/i386/tcg/tcg-cpu.c         | 6 +++---
 target/loongarch/tcg/tcg_cpu.c    | 4 ++--
 target/m68k/cpu.c                 | 2 +-
 target/microblaze/cpu.c           | 6 +++---
 target/mips/cpu.c                 | 2 +-
 target/or1k/cpu.c                 | 4 ++--
 target/ppc/cpu_init.c             | 2 +-
 target/riscv/tcg/tcg-cpu.c        | 2 +-
 target/rx/cpu.c                   | 2 +-
 target/s390x/cpu.c                | 2 +-
 target/sh4/cpu.c                  | 4 ++--
 target/sparc/cpu.c                | 4 ++--
 target/tricore/cpu.c              | 2 +-
 target/xtensa/cpu.c               | 2 +-
 26 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/include/accel/tcg/cpu-mmu-index.h b/include/accel/tcg/cpu-mmu-index.h
index e0fb6ef91c8..01152075372 100644
--- a/include/accel/tcg/cpu-mmu-index.h
+++ b/include/accel/tcg/cpu-mmu-index.h
@@ -30,7 +30,7 @@
  * Return the core mmu index for the current translation regime.
  * This function is used by generic TCG code paths.
  */
-static inline int cpu_mmu_index(CPUState *cs, bool ifetch)
+static inline int cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
 #ifdef COMPILING_PER_TARGET
 # ifdef CONFIG_USER_ONLY
diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index a88cc4dc572..69d7ec29115 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -102,7 +102,7 @@ struct TCGCPUOps {
     void (*debug_excp_handler)(CPUState *cpu);
 
     /** @mmu_index: Callback for choosing softmmu mmu index */
-    int (*mmu_index)(CPUState *cpu, bool ifetch);
+    int (*mmu_index)(const CPUState *cpu, bool ifetch);
 
 #ifdef CONFIG_USER_ONLY
     /**
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 378bd96d941..1c9f9fce20b 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -383,7 +383,7 @@ enum {
 
 #define TB_FLAG_UNALIGN       (1u << 1)
 
-static inline int alpha_env_mmu_index(CPUAlphaState *env)
+static inline int alpha_env_mmu_index(const CPUAlphaState *env)
 {
     int ret = env->flags & ENV_FLAG_PS_USER ? MMU_USER_IDX : MMU_KERNEL_IDX;
     if (env->flags & ENV_FLAG_PAL_MODE) {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index f1a80c890ee..d582cefcfa4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -55,7 +55,7 @@ static inline MemOp mo_endian(const CPUARMState *env)
     return EX_TBFLAG_ANY(env->hflags, BE_DATA) ? MO_BE : MO_LE;
 }
 
-static inline int arm_env_mmu_index(CPUARMState *env)
+static inline int arm_env_mmu_index(const CPUARMState *env)
 {
     return EX_TBFLAG_ANY(env->hflags, MMUIDX);
 }
@@ -431,7 +431,7 @@ void arm_restore_state_to_opc(CPUState *cs,
 #ifdef CONFIG_TCG
 TCGTBCPUState arm_get_tb_cpu_state(CPUState *cs);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-int arm_cpu_mmu_index(CPUState *cs, bool ifetch);
+int arm_cpu_mmu_index(const CPUState *cs, bool ifetch);
 #endif /* CONFIG_TCG */
 
 typedef enum ARMFPRounding {
diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h
index 85bcd61678f..1127861e337 100644
--- a/target/i386/tcg/tcg-cpu.h
+++ b/target/i386/tcg/tcg-cpu.h
@@ -82,6 +82,6 @@ extern const TCGCPUOps x86_tcg_ops;
 
 bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
 
-int x86_mmu_index_pl(CPUX86State *env, unsigned pl);
+int x86_mmu_index_pl(const CPUX86State *env, unsigned pl);
 
 #endif /* TCG_CPU_H */
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3fb51bbeb82..56264752c1b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1736,7 +1736,7 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn, uint32_t val);
 
 /* MMU modes definitions */
 #define MMU_USER_IDX 0
-static inline int ppc_env_mmu_index(CPUPPCState *env, bool ifetch)
+static inline int ppc_env_mmu_index(const CPUPPCState *env, bool ifetch)
 {
 #ifdef CONFIG_USER_ONLY
     return MMU_USER_IDX;
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 998bbb0d7ff..cd5f9256b24 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -373,7 +373,7 @@ QEMU_BUILD_BUG_ON(FLAG_MASK_DAT != PSW_MASK_DAT >> FLAG_MASK_PSW_SHIFT);
 #define MMU_HOME_IDX            2
 #define MMU_REAL_IDX            3
 
-static inline int s390x_env_mmu_index(CPUS390XState *env, bool ifetch)
+static inline int s390x_env_mmu_index(const CPUS390XState *env, bool ifetch)
 {
 #ifdef CONFIG_USER_ONLY
     return MMU_USER_IDX;
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 21d4f8ac23b..3bf88702dc1 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -93,7 +93,7 @@ static bool alpha_cpu_has_work(const CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-static int alpha_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int alpha_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
     return alpha_env_mmu_index(cpu_env(cs));
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ba66359d410..63ef00735ca 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -126,7 +126,7 @@ void arm_restore_state_to_opc(CPUState *cs,
     }
 }
 
-int arm_cpu_mmu_index(CPUState *cs, bool ifetch)
+int arm_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
     return arm_env_mmu_index(cpu_env(cs));
 }
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index a96bef46ff1..24a5a9debc9 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -50,7 +50,7 @@ static bool avr_cpu_has_work(const CPUState *cs)
             && cpu_interrupts_enabled(cpu_env(cs));
 }
 
-static int avr_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int avr_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
     return ifetch ? MMU_CODE_IDX : MMU_DATA_IDX;
 }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 868aef0cde4..2bc58fc6305 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -482,11 +482,11 @@ static void hexagon_cpu_realize(DeviceState *dev, Error **errp)
     mcc->parent_realize(dev, errp);
 }
 
-static int hexagon_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int hexagon_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
 #ifndef CONFIG_USER_ONLY
-    CPUHexagonState *env = cpu_env(cs);
-    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    const CPUHexagonState *env = cpu_env(cs);
+    const HexagonCPU *cpu = HEXAGON_CPU(cs);
     int cpu_mode;
 
     BQL_LOCK_GUARD();
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index dbf58466c24..ec351302406 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -140,9 +140,9 @@ static bool hppa_cpu_has_work(const CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-static int hppa_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int hppa_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
-    CPUHPPAState *env = cpu_env(cs);
+    const CPUHPPAState *env = cpu_env(cs);
 
     if (env->psw & (ifetch ? PSW_C : PSW_D)) {
         return PRIV_P_TO_MMU_IDX(env->iaoq_f & 3, env->psw & PSW_P);
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index e4fc212aca5..da1498ee45d 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -114,7 +114,7 @@ static void x86_restore_state_to_opc(CPUState *cs,
     }
 }
 
-int x86_mmu_index_pl(CPUX86State *env, unsigned pl)
+int x86_mmu_index_pl(const CPUX86State *env, unsigned pl)
 {
     int mmu_index_32 = (env->hflags & HF_CS64_MASK) ? 0 : 1;
     int mmu_index_base =
@@ -125,9 +125,9 @@ int x86_mmu_index_pl(CPUX86State *env, unsigned pl)
     return mmu_index_base + mmu_index_32;
 }
 
-static int x86_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int x86_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
-    CPUX86State *env = cpu_env(cs);
+    const CPUX86State *env = cpu_env(cs);
     return x86_mmu_index_pl(env, env->hflags & HF_CPL_MASK);
 }
 
diff --git a/target/loongarch/tcg/tcg_cpu.c b/target/loongarch/tcg/tcg_cpu.c
index 7ea2a1eb933..a26233d5eed 100644
--- a/target/loongarch/tcg/tcg_cpu.c
+++ b/target/loongarch/tcg/tcg_cpu.c
@@ -301,9 +301,9 @@ static void loongarch_restore_state_to_opc(CPUState *cs,
     set_pc(cpu_env(cs), data[0]);
 }
 
-static int loongarch_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int loongarch_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
-    CPULoongArchState *env = cpu_env(cs);
+    const CPULoongArchState *env = cpu_env(cs);
     CPUSysState *sys = env_sys(env);
 
     if (FIELD_EX64(sys->CSR_CRMD, CSR_CRMD, PG)) {
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index da3681fab1f..f1fd2e6f14d 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -82,7 +82,7 @@ static bool m68k_cpu_has_work(const CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-static int m68k_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int m68k_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
     return cpu_env(cs)->sr & SR_S ? MMU_KERNEL_IDX : MMU_USER_IDX;
 }
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index d1d2f0ec7e3..524175d2236 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -133,10 +133,10 @@ static bool mb_cpu_has_work(const CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-static int mb_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int mb_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
-    CPUMBState *env = cpu_env(cs);
-    MicroBlazeCPU *cpu = env_archcpu(env);
+    const CPUMBState *env = cpu_env(cs);
+    const MicroBlazeCPU *cpu = env_archcpu(env);
 
     /* Are we in nommu mode?.  */
     if (!(env->msr & MSR_VM) || !cpu->cfg.use_mmu) {
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0f39f8fe0a5..a428176d9e8 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -671,7 +671,7 @@ static const Property mips_cpu_properties[] = {
 #ifdef CONFIG_TCG
 #include "accel/tcg/cpu-ops.h"
 
-static int mips_cpu_mmu_index(CPUState *cs, bool ifunc)
+static int mips_cpu_mmu_index(const CPUState *cs, bool ifunc)
 {
     return mips_env_mmu_index(cpu_env(cs));
 }
diff --git a/target/or1k/cpu.c b/target/or1k/cpu.c
index 10b13ae69cd..c9ab5c0f1c1 100644
--- a/target/or1k/cpu.c
+++ b/target/or1k/cpu.c
@@ -82,9 +82,9 @@ static bool openrisc_cpu_has_work(const CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-static int openrisc_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int openrisc_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
-    CPUOpenRISCState *env = cpu_env(cs);
+    const CPUOpenRISCState *env = cpu_env(cs);
 
     if (env->sr & (ifetch ? SR_IME : SR_DME)) {
         /* The mmu is enabled; test supervisor state.  */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c72a7168a23..a33a074b796 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7215,7 +7215,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
     cpu->env.nip = data[0];
 }
 
-static int ppc_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int ppc_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
     return ppc_env_mmu_index(cpu_env(cs), ifetch);
 }
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index cd303660f1f..a0210ca50e3 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -95,7 +95,7 @@ static const char *cpu_priv_ver_to_str(int priv_ver)
     return priv_spec_str;
 }
 
-static int riscv_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int riscv_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
     return riscv_env_mmu_index(cpu_env(cs), ifetch);
 }
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index dfa09a85bce..c5dfba8976a 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -78,7 +78,7 @@ static bool rx_cpu_has_work(const CPUState *cs)
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
 
-static int rx_cpu_mmu_index(CPUState *cs, bool ifunc)
+static int rx_cpu_mmu_index(const CPUState *cs, bool ifunc)
 {
     return 0;
 }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index c34f4b23472..a043f1e7920 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -311,7 +311,7 @@ static const Property s390x_cpu_properties[] = {
 #include "accel/tcg/cpu-ops.h"
 #include "tcg/tcg_s390x.h"
 
-static int s390x_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int s390x_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
     return s390x_env_mmu_index(cpu_env(cs), ifetch);
 }
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index b0ed356d0f7..f8b33844d2a 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -113,9 +113,9 @@ static bool superh_cpu_has_work(const CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-static int sh4_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int sh4_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
-    CPUSH4State *env = cpu_env(cs);
+    const CPUSH4State *env = cpu_env(cs);
 
     /*
      * The instruction in a RTE delay slot is fetched in privileged mode,
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 8dd9b0d5ee3..f1ae16c91e9 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -790,9 +790,9 @@ static bool sparc_cpu_has_work(const CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-static int sparc_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int sparc_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
-    CPUSPARCState *env = cpu_env(cs);
+    const CPUSPARCState *env = cpu_env(cs);
 
 #ifndef TARGET_SPARC64
     if ((env->mmuregs[0] & MMU_E) == 0) { /* MMU disabled */
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 357f3737053..09d4270df60 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -117,7 +117,7 @@ static bool tricore_cpu_has_work(const CPUState *cs)
     return true;
 }
 
-static int tricore_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int tricore_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
     return 0;
 }
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 1b299568776..8cf973632e7 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -148,7 +148,7 @@ static bool xtensa_cpu_has_work(const CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-static int xtensa_cpu_mmu_index(CPUState *cs, bool ifetch)
+static int xtensa_cpu_mmu_index(const CPUState *cs, bool ifetch)
 {
     return xtensa_get_cring(cpu_env(cs));
 }
-- 
2.53.0



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4114606A31E
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 22:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMySUJmB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9/kBF/y
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWhum-0007z6-GE; Thu, 26 Nov 2026 17:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWhuj-0007yS-7b
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 17:26:02 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWhuh-0003qV-Ii
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 17:26:01 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwd2r361595
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 22:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FfWIQOvA48hGvDH3/L9ElaJ5QgP3nRlxFpJMNYoH4KY=; b=AMySUJmBXTWKwD8Q
 +/+M1D8MsTne719FTlSLFmycC19sN+KMd45g/dfDizJrh6tu8hQWDgkbg9OvIItf
 9t6U8MvOCT4/IPndlur67RWqpKjinn+r8j1a/UJSZjZAPGWBIVkKtvbwJXyWXXpp
 cEBSrzHcewm9qEZC6JHaunLNI/cj8NWqkeg5AT1V5LDycfIGN6+LdIACUorYgc3u
 iUzd0/yu23MC6i5pI6wCZXSkkD5CBcNp+kae+GbQY3Hq6iaFp+9xVjC6nWXQFpsz
 TtK+leJhh3uh3Avc8BDuIt2z9n3/R4ZINsZQQE/c7uu9Hc1WXKF1CsPi4B/QX506
 Ut159Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rk245-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 22:25:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9495c71055bso486916385a.2
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 14:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795731957; x=1796336757; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FfWIQOvA48hGvDH3/L9ElaJ5QgP3nRlxFpJMNYoH4KY=;
 b=A9/kBF/ySLPUgrtb0MIaZjfEJvg3dUYpcSpaV2mhDe0CsoCbKuz4q2rjWNjE4Q7HVz
 ZQHn2tHn0s2GBIKgJ31ktaiX9Qm0qq3ET8a3T0rw7bgPhf/UBS8jYxezV2JLiM9kQXWp
 F0zzs6Qo0D4a18tbis7kkhh50dpTCxvOIz3ue/jHYoNdN4c3e6SvbLOebgyIvWdi8zXW
 vqQn72BW7UaIOtNDRODrUwqpD7QF/27KjwIeeyQmak+L1/F5wA0PBSgpuQVljYby0IKL
 mY0GtLvneapuKp9XcrCnKiqWo56t+pcdM3GG+yFJ7BEyg0BHukCxvRzCeZsleBCVGZzo
 aHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795731957; x=1796336757;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FfWIQOvA48hGvDH3/L9ElaJ5QgP3nRlxFpJMNYoH4KY=;
 b=KkBn7TUKbY5zIUfWLi1EsrD4jDF/afZD+QFnAx/1Hfe2cMQ6pK6M7tjm9hSo+EowGj
 y6d5N82/bclKPxH/sTSXVUqBlwkAgcx8TPDUiTutE+/Mf+4sy6UJ1lvUvGggGQ8+uOim
 GtmbWK/FtszvQuq/WXJoIOGgAWrFTiJlcsZrWE849ZaA1TKLVXrQR3DAZilVHDtd9ayX
 Xf3pg7Gyh77inQrzutseua9KRDUiAkcoYBzDfol6JFLWRXCIf4rEINNY5wRzjXlYb//J
 99tHkhtzwCN128oMFyN4GDjf7J8IKAfkSpI3VlD4gcRBWyA/88if8LjdJvn/wcWOXXNQ
 NY9Q==
X-Forwarded-Encrypted: i=1;
 AL+hErFodn6J33l8bMzJcJdZWrqucp7rxWA53MLO0Hv17JPP6IPmfJy/cCfAIsUgrubc/2fEnHEjIYo5fddE@nongnu.org
X-Gm-Message-State: APuU4Z/TKKNKesMmIHw/6ERdObIMhQHznTsChI9tUYsCzkiHs0YkMG+8
 VLmmVXDFZFqfOkeCzx+I7F6+fDK8tYCrNLKG5uyg+JnSvkqswtaLv5bLHgj/TeVdzEW1pbJbPPI
 jwSJnYQ936POkatGfCdcLMCkRccC3KQJ00RWVHFf9hXklNSIyDISsYPpEsA==
X-Gm-Gg: AZFdTZc9TThCYAy9qx6Pc0g3a07RpXp25s0T5y4sM3yUuZDpTAN7orxI1S5tR9CpkuC
 XSHfrODE4x3oiAe+yBEprUV62WuM1xPReIYrpJM4fvvtdGH0HIdRDwt7VxDtAf/5Kvg9QxMYl8l
 8UJor/qwTd09eR4hmsRFh6xjieqCaJZVT5lFCREZASlCUkZW+OzTTo5cY09Sr5Eyoh+wg1MPs4F
 eQZ1eA+GzJ5Q0EqnQDgCMh6lcBt1/5hrQkOCIPHmubBMKvq803jMzstQsiM6n411FD4FAxp3kyI
 u4z0wX0Vu991RC9226smDJmedKS5DicIcbYWChJppJ7R8uzplwpxf5W28L6sIFDVrjFFo36AzbK
 AlpyQyI3OtsAqrcKVjgjkzBs202tADkcRu94BSn6nPfd8sVIL9BZ7Glgcg3Cucr4sxkEyf8Ntwh
 IsOlND6vPEskUFLA==
X-Received: by 2002:a05:620a:1a09:b0:949:77c5:a58a with SMTP id
 af79cd13be357-949ba9ef1ccmr3913061185a.33.1795731956792; 
 Thu, 26 Nov 2026 14:25:56 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:949:77c5:a58a with SMTP id
 af79cd13be357-949ba9ef1ccmr3913058585a.33.1795731956374; 
 Thu, 26 Nov 2026 14:25:56 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989e3sm43376213f8f.52.2026.11.26.14.25.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 14:25:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, TANG Tiancheng <lyndra@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 3/3] accel/tcg: Do not write qemu_icount from seqlock readers
Date: Thu, 26 Nov 2026 23:25:30 +0100
Message-ID: <20261126222530.62175-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126222530.62175-1-philmd@oss.qualcomm.com>
References: <20261126222530.62175-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4OCBTYWx0ZWRfX6u4eIqEetN6E
 Uhw4obGHs5qApkPXq8wnGKJb/ozbMwwtoWBlerfMpuSwnUKs8Ix7W3LsEeCJNd6mNbrDq/BIekI
 Bct77T9i6JtdJRF1f7XAQ2qSLbu9rWg5+2O0cDMlEId26rPWjIZHge0OVjqsUrhE2PaGnJInhxv
 OJj761cL0XNWcLjIlHGRnYa7AtVw/nhh5h7muDdX18b4iXl4a001S1Kv/qZV/Ks+/gIa1qMUWtS
 XyUYIetJBhO7lOEB5OKtOzxBAjy6IY4CDAaUdAF5gB51M09C2QbGJH/6Dwf+HoAOMGtB1ZvRAi0
 3Fkeg6TtdNp3PN4OYf3T+MgCXyA+FaGmYP8/Sjg8S4vWjKACouPI2zr1FwHHhrzJdBe8DSqsQbo
 XTzk5ll4SMg8i+mqL8SEL+8hIITnReqz7o4ECWbdsodB3O9KTgLKY0EHqT7aCUVVBFLoAn0F4ar
 yY2oAnx98T7V3/9NJTA==
X-Proofpoint-GUID: 0ZLs9rc2-clwq3jZesjSXsh0n6DYsCw6
X-Proofpoint-ORIG-GUID: 0ZLs9rc2-clwq3jZesjSXsh0n6DYsCw6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4OCBTYWx0ZWRfX5UkZNVWlKHFn
 wFO2QzazmiNFVUW1yITQFT/UjYyMdtYhI/wuz5hhMS/NceO5DYNswjPKSEgQw6g5Cbf9/2Rd7mo
 x2KIlm9cpG+/dkqH2bZX9Ya+ADTxGrk=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08b1f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ISvMSLdbocKUt8YgRNsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260088
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

icount_get() and icount_get_raw() updated qemu_icount inside
the seqlock read section, without vm_clock_lock.

This fixes a narrow time-skew race in adaptive icount:
icount_adjust() reads qemu_icount twice under the write lock,
and a vCPU update in between is lost from QEMU_CLOCK_VIRTUAL
(up to 0xffff instructions). Reproduced on riscv64 'virt',
whose cycle/instret CSRs read the clock without the BQL, by
widening the window with an injected delay.

Update under the write lock before reading.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 accel/tcg/icount-common.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index b52d22f3a1cf..ababf7745b27 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -125,6 +125,7 @@ static int64_t icount_to_virtual_ns(int64_t icount)
     return qatomic_read(&timers_state.qemu_icount_bias) + icount_to_ns(icount);
 }
 
+/* Callers hold vm_clock_lock (used by REPLAY_CLOCK_LOCKED) */
 static int64_t icount_get_raw_locked(void)
 {
     CPUState *cpu = icount_running_cpu();
@@ -137,19 +138,28 @@ static int64_t icount_get_raw_locked(void)
     return qatomic_read(&timers_state.qemu_icount);
 }
 
+/* Callers hold vm_clock_lock */
 static int64_t icount_get_locked(void)
 {
     return icount_to_virtual_ns(icount_get_raw_locked());
 }
 
+/*
+ * Readers never write qemu_icount inside the seqlock read section:
+ * the running vCPU folds in what it has executed under the write lock.
+ */
 int64_t icount_get_raw(void)
 {
+    CPUState *cpu = icount_running_cpu();
     int64_t icount;
     unsigned start;
 
+    if (cpu) {
+        icount_update(cpu);
+    }
     do {
         start = seqlock_read_begin(&timers_state.vm_clock_seqlock);
-        icount = icount_get_raw_locked();
+        icount = qatomic_read(&timers_state.qemu_icount);
     } while (seqlock_read_retry(&timers_state.vm_clock_seqlock, start));
 
     return icount;
@@ -158,12 +168,16 @@ int64_t icount_get_raw(void)
 /* Return the virtual CPU time, based on the instruction counter.  */
 int64_t icount_get(void)
 {
+    CPUState *cpu = icount_running_cpu();
     int64_t icount;
     unsigned start;
 
+    if (cpu) {
+        icount_update(cpu);
+    }
     do {
         start = seqlock_read_begin(&timers_state.vm_clock_seqlock);
-        icount = icount_get_locked();
+        icount = icount_to_virtual_ns(qatomic_read(&timers_state.qemu_icount));
     } while (seqlock_read_retry(&timers_state.vm_clock_seqlock, start));
 
     return icount;
-- 
2.55.0



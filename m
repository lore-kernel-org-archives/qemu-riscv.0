Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240E8CD4F26
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:08:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB9h-0007rh-8H; Tue, 23 Jun 2026 20:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9Z-0007c6-Lm
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9W-0003JE-Mw
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:40 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK1D4n1259741
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=FAFAbbkiera
 qKgzFY/50UsOxfNtGrL/uy6qUk6k1aiI=; b=bralpz5+EPy5owInHZooIiIRFYu
 xQScG4Ejk2+SSM0cvR6rYfnHaXgaudy0THQAfUUg4mopGir4p70zjXITwxS3XY7t
 cehHhOPF7hN7t2rhbJoZStHSfFHxkKfpCuDwyXtKseHosTT8D2LAxN/DgzkSukUN
 9HyAo0Nf3ue0joR2MqBW9tJg0c+ph6XSraGv+Y53kDWjoOTLPM3p/tyPEAJxBWM3
 7+GpsLVEKqj3kYM+lB7QaxoN9TQHuxAPzraCVBXVfiEA1FJaNBh9dkof3qXsMGIu
 RCAg3TsZomGsNfLYcFoNfNEd9DQ1eNt/2Fv0OabdKSB5XM90RkjeFOz4xQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvv3wr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9227d9b3b5cso102540985a.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259646; x=1782864446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FAFAbbkieraqKgzFY/50UsOxfNtGrL/uy6qUk6k1aiI=;
 b=cH+/+u9FXhzxO035kP4yqdSWk9DXxE9C+QJ6NsxFpeoBV3zB6WNNSPTBitJCpxMSTe
 ZLNpt9A1oy58bBIjVpZEBCk+EurycyGF3QPNiAXzJ2ufrARS8qeowT8WMI35bubrTrTI
 XCXG6cQ9xcboH0xIdEqgSLGJrYskIO6AZeccH12Ej7OmDBcLdNqAM2RkTVfq22Q0JgJ+
 yR9HYYW+Q/pTC4vfWTqEPqEc3P6V+07Dh/E1TwmNBZGhDm1Pl0H/x3dzfFnfN7kPmCQx
 FHKPqx/cY4+dIjfeVxlB6KG+l8NAKUjD6IMW3LwGzxPk2Nl7qLUEVzQKE4g65VZhIwQ1
 doIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259646; x=1782864446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FAFAbbkieraqKgzFY/50UsOxfNtGrL/uy6qUk6k1aiI=;
 b=D3KHwuQQk7qSRMyquzLACXYZae1rjFfiobABodYQo37vWEhYflf/m3C5ALyxNVMKRQ
 rqNNLvXTorQd4ZvZF8GTAiEHBZv3+Fo33s/o6Jo0HVljLd6EwD+KVBD6eZPYAyyO0O44
 b8Ck/q183C5SP/FmZX1qOpaJljkIwMCTOgz51zquFg/t8uwhAcMdPzPoZzq16ZTSqzSI
 J69rQQR0bhIfBAIc+O4WRS6+SBFaZIDOqMsmVcI6uSszZT37c0h4GFK3HjOZ/KPuOwPu
 hMr9tEgyi2fX2MFTJGuXNtZ4yhybpmDF9iRC5MQjZ+D5S4n7pjGced5RlkVgRo1obKDi
 sYKA==
X-Gm-Message-State: AOJu0YyXGMSS3H/m1aUmCCA6Ium/vBY66Fbn2+8ELyY0Y3UMtwPPH8dX
 Hn6K0cmMe3X9GwbbfeuYS7S/21tNrKOjv/b/T4GsD3McIPhBKMweQ4Vo2AfHSSsjimGpacJxC2c
 2cHoDkiuYHeILxLqGiOjbMJwdFLs1v9XRhS0niMKsOVf5paaHAmtOqlNnqA==
X-Gm-Gg: AfdE7clyg3+QiK39WMsljAahdJpEULH1+VmuPgF7+SXPtbqd/rC2DFMnwZfQpEzdMgU
 3L/jor/SaxgAcy/OPuDpZtxCz/5HpeO+9uYVLErR2DyKkoRmSoAMS+8aTRbCsZmRdlq3pmk1FxO
 qbnKZqkKK1zhz8yMmAq8Q9hbR8Qh+LADWIZO/q0Mq+QSPfRFHflTU4Gad3xDxjPl0CvqcONUmhz
 Bexz0ypTKcs9rkluHqMGI+IVmFexYk8IGTcnJDt94w9AaUh+nGX8rBljcQ+7ta+ww6VNLRLOK8s
 wTCGICptL1zl9jj8j6F/kM3Y5YEYUWqfpzfPZTAvT9Nl8zXHgQ2/3oHxQjMnjfUCBWmUkospF7Y
 t5D6qwwPeVSYwBrrfDvgFihqgWZWU3tSfM7tnKaVjqUaVyw==
X-Received: by 2002:a05:620a:2705:b0:915:cda5:27fb with SMTP id
 af79cd13be357-9277f8c955fmr227697685a.54.1782259646166; 
 Tue, 23 Jun 2026 17:07:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2705:b0:915:cda5:27fb with SMTP id
 af79cd13be357-9277f8c955fmr227693685a.54.1782259645735; 
 Tue, 23 Jun 2026 17:07:25 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:25 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 15/24] target/riscv/cpu.c: handle TCG bits of
 riscv_cpu_dump_state
Date: Tue, 23 Jun 2026 21:06:22 -0300
Message-ID: <20260624000632.2149359-16-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3b1fbe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=n_Gjmr79VRyvsDPUZ2MA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX7dxbrMnEdcg9
 0GLE+Mq8rrIW/THbmuiEaWML9LpqEVHkEKX3OLhzBTqyKYs5yOSbIsqrXFr1s//KUho9g/NWnf5
 Tx09uqGX59G9McZqtqAV3QIl0o9R13A=
X-Proofpoint-ORIG-GUID: 91H_DuNIt8rzvnNQRoSG5Y8huOOiS4ZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX50C9ebPGQbHp
 2U4HiVNTH0+h7tXNRiaBTb1a1qbW5VQ6WZtf1jv1xOHOVYVZfmNST2maTjrFsvYxj8gcMMEUQm8
 3VPYTYnDvYfnlJX6sS95R89ZkM8F28oHB8jjpDLQAJQKK30LReUrLDe8duqwwHzxuBou+YP/+Ho
 Ao6kwZ1F1VVr4DVYOvh12tZWfwfoLB+H6ndrcHvX03dxtjqYfzAUBCi2/+gSq5iVkBEJxE9z+vZ
 4q+uJ1GlvpYyddb6vYDAq9qlgQiVjrVTKDwGethTaG6Z3oR70DuFYB9HmpOyHPb4AWj/ErXt2Zu
 M5Km0V+W1uRnrIoy5/5tdt52suVzTDfL/Ju7hB+e7+FsIH0qxohWUzqpF0LYWDH8VcUcTCSBfGP
 FMnXDLfnuQAcQODYfsIjfJSrnHXNwg==
X-Proofpoint-GUID: 91H_DuNIt8rzvnNQRoSG5Y8huOOiS4ZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230199
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

riscv_dump_csr() is a TCG only function but we'll have to implement it
at some capacity for KVM eventually, therefore put it under a CONFIG_TCG
ifdef while making a note that this function is unimplemented in KVM.

The csr_ops array is also TCG specific, thus the for loop inside
dump_state that iterates it is also TCG only business.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4fc0ee2823..7bd5bc0fc1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -605,8 +605,10 @@ char *riscv_cpu_get_name(RISCVCPU *cpu)
     return cpu_model_from_type(typename);
 }
 
+/* Note: this function needs a KVM implementation.  */
 static void riscv_dump_csr(CPURISCVState *env, int csrno, FILE *f)
 {
+#ifdef CONFIG_TCG
     target_ulong val = 0;
     RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
 
@@ -618,6 +620,7 @@ static void riscv_dump_csr(CPURISCVState *env, int csrno, FILE *f)
         qemu_fprintf(f, " %-13s " TARGET_FMT_lx "\n",
                      csr_ops[csrno].name, val);
     }
+#endif
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -655,7 +658,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 #endif
     qemu_fprintf(f, " %-13s %" PRIx64 "\n", "pc", env->pc);
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     for (i = 0; i < ARRAY_SIZE(csr_ops); i++) {
         int csrno = i;
 
-- 
2.43.0



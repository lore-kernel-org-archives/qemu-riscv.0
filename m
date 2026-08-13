Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBBFC5B572
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:19:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wua1L-0004yJ-R7; Thu, 13 Aug 2026 14:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua10-0003Zi-0e
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0w-0002Hn-ON
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:53 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DH8guY304738
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WkLF8awV/bRgmolBst9AuOseYgP5YAXlCZ5MmoxHNDQ=; b=QNc26D0gQLRHqQAn
 38oRtw3lbi0D02btV1plIuqbbRNmhBEOMsT+vr+5lD6EE/OS1nqiGg3v6XG2AZcq
 oy0RxoqrFL25TP1TpD28jw8KqWQ/bN6EiriQ64EZUOl1LXrpXd+pW+9Yugnb1T58
 JNOqxjWP4U5KiBQaYu1sqy1bu/Enl0u9PSz42o0D96OPMzdt0rxNf8ovRGqDZWnB
 hDOEbMDekOGhHdIVUa/jWqa1zFc4VYWnC0TJ9zZkP6LdcOYFGH3IMuGa/O7i6R9y
 ZG4dIIbP/aDlBOyTs6544uyh4SVGI1dwDckJNR3LsgnJN4Y8uAUvwuDDORNyU2wX
 K/fCDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2nga0v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c01ff996dso3483611cf.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645114; x=1787249914; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WkLF8awV/bRgmolBst9AuOseYgP5YAXlCZ5MmoxHNDQ=;
 b=WngrWPSm3CzbhelqTWLvkGD0qtgqBQBVmpl8yLxg6W8HMPKXLFj/aagfC8DVHNCSJT
 P4QY6qAwPlnrPFYCSbkMQcajN87PBhx3jw8ctDaqeR4qkTLTKoIpRJEdVFf0vDTvhF7x
 rddn/m5CfvOzG9+e/HMHar6+97lG/AYjV8g3S6NtpPSd8/qS5Ks1pxcVZRaTnbkLUhB4
 hCE5FiAFcazqwqEdHeMDkf+Z8RMqwedoahtVzodi0hydtkaobUAySwTSURd8HDepjmpr
 yeWoHo21bdJNa0yKRY2QNsixHGw+kgO7aw9aBInSq8WHRPlJIj61b2MOlGtdLqYmNL1B
 fPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645114; x=1787249914;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WkLF8awV/bRgmolBst9AuOseYgP5YAXlCZ5MmoxHNDQ=;
 b=FbpN0yp6e2c73XjW2zK39zX8/uUqQ54n72sfaI2NHUQ4hLcSI71pb9/bdruJjA+wmH
 Z+pZOtjvSu2aNplGrPXgEq9XzCh5lR/dygkZ7GnHw/USvjrW7snno4zxTrKbhoH9xfBa
 GS1OSbH8kBhGCGf8thpdKZ1h7DNzSuF5TCOK3kUrk1c8cTkV2rHJrMjFJf2089pPc/mZ
 TNZqeRgHyPYVys02TJ8fnoe/A4+6Z6GO9IiIaKJfp/PuVmB/jaLCs9p99TQ1d3xTdMmq
 4EPEmt3f3svSkJgFtC1BeKlAzMZmAGBQ5cGCa2QzOIUgs8C+qYF+Hj3mUfklBbLXDGRD
 YPTA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq2C8o77ncWStaLWW4nJ5MCZbzY0nGxRyhjtSz7/pgT10DKzWTfq5XXlHekcuFQF4sdVRtcvjoq2Uv7@nongnu.org
X-Gm-Message-State: AOJu0Yy0IAPeIhI9axyJ492ZrJyMOOhswL1hXngoNUTgWzmiRH1DcQ5V
 /pk2DmWMHlhxskqFhBswSwt57ydD8S8SOfZrOrM19HSe+CkYQQaRK6fAHClYTYdJMforO9s4U86
 doL55LcXd1llRZ3hHd8dxEa7LGcJUi0BkIyJUN4LwC9gx1coc98m8x1DPvQ==
X-Gm-Gg: AR+sD12uWXJLesGok6VA5otk7EVf7Og2KUYSMmq7//5U4lL5lXx8EuH6lGMrSh+oU2j
 uIL4eudG6hCwN/k4pWvZsuMi1KHl0sy6Qaw8VV/RDo313o+2R8HBfprAwxzAWB61PYbHRKH1UVx
 eKVZwppruXx7OJGTJZmnxkIgauQekhETUnw6XPuA7ZLprO5zBP6JxTHqYovTrp4MVaToHK+IdCV
 Cx3HA3kmfYE4fvBP7n9cIGsz2dvvaFEESXpfEOBYOxiu0r0gUlHDeIClbY6Q/1e+nfS0SMilrRN
 snu2DpFmDHxXXXRmsi94H5LdgOfoozDjr6z/hu/LFpiNYP6lNxbJQKz4PZc46g/G2zroB7w7v39
 LiJ7Hyu0Q/ZtoAu+LOWKB+OwIKN57S17ZEx6EaYkZkA==
X-Received: by 2002:a05:622a:1355:b0:51c:f3e:7819 with SMTP id
 d75a77b69052e-52d73df4d17mr78564661cf.39.1786645113703; 
 Thu, 13 Aug 2026 11:18:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1355:b0:51c:f3e:7819 with SMTP id
 d75a77b69052e-52d73df4d17mr78563731cf.39.1786645112979; 
 Thu, 13 Aug 2026 11:18:32 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f21a068sm1190899f8f.12.2026.08.13.11.18.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:18:32 -0700 (PDT)
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
Subject: [PATCH 15/16] target/arm/powerctl: Move BQL assertions to async work
 context
Date: Thu, 13 Aug 2026 20:16:38 +0200
Message-ID: <20260813181640.6537-16-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ApXeGu9P c=1 sm=1 tr=0 ts=6a7e0a7a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LLcwgxkfhdatqMbCiJoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: tfXKLUz4q7rwz7VY1ilk57jsTBL8LWyV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX41gMvyynWX4w
 hjkn2hGVIJKWjKBxIy/CYUyNMGbOGSIHzPfoNbwjJeLbgv7ZPmSgQi6t4Tcm7NLMxULwn2unjqX
 W1hQ1nVO/p6Y0QpUzm3zUJFKgxbtDMw=
X-Proofpoint-GUID: tfXKLUz4q7rwz7VY1ilk57jsTBL8LWyV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX3lENLpu4v4x6
 6AswV8XFaUaIG8WrOCPn6ztmuKVV4eX/jdm90fAsw94fiEa7lYAZAYMf0lpo3ERoAS3b4wPtdv/
 tZiGpaeDuy+n1w6+/G7iIXK5URPsYsy+unH6nyqYlHpbxF4dl+R+s1ZeTTFeaI6wjZAy8AssROq
 2YWlGI78e05izSNyT0ftS7jmGQeIwoCctHxySl8M1Yk6e5wucYKbN5x/f8fP49XEAln2g34e6i/
 jtSbt+4sDQOsttgqSOjyAJLLaD4KeMFje3E7fWd9ebIMvemAcbNSXNkdShZAYvSgNle7u9UhkIN
 7An/VKe82i7FSCAiySSTRdZ03GN4+gM+Ym/1GiDJ2/fEeApHc9bbbdgulEwXHedqJMKRedy4k/s
 Z5alWUb0gRSy7gK/R3foo1xPJyZocR3LEStSF6bhqOt+Q4iAB9VsnN7d7+YEgh/sxQHEuJDkgPI
 9XCg2JxpRPnaKBMDaxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
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

We can not guarantees the callers of the following public API
functions hold the BQL:

 - arm_set_cpu_on()
 - arm_set_cpu_on_and_reset()
 - arm_set_cpu_off()

Move the assertion to arm_reset_cpu_async_work() where the async
context guarantees the BQL is held.

Fixes: 062ba099e01 ("target-arm/powerctl: defer cpu reset work to CPU context")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/arm-powerctl.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index a06be5cc997..a938b30943c 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -88,8 +88,6 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
     ARMCPU *target_cpu;
     struct CpuOnInfo *info;
 
-    assert(bql_locked());
-
     trace_arm_powerctl_set_cpu_on(cpuid, target_el,
                                   target_aa64 ? "aarch64" : "aarch32",
                                   entry, context_id);
@@ -194,8 +192,6 @@ int arm_set_cpu_on_and_reset(uint64_t cpuid)
     CPUState *target_cpu_state;
     ARMCPU *target_cpu;
 
-    assert(bql_locked());
-
     trace_arm_powerctl_set_cpu_on_and_reset(cpuid);
 
     /* Retrieve the cpu we are powering up */
@@ -249,8 +245,6 @@ int arm_set_cpu_off(uint64_t cpuid)
     CPUState *target_cpu_state;
     ARMCPU *target_cpu;
 
-    assert(bql_locked());
-
     trace_arm_powerctl_set_cpu_off(cpuid);
 
     /* change to the cpu we are powering up */
@@ -276,6 +270,7 @@ int arm_set_cpu_off(uint64_t cpuid)
 static void arm_reset_cpu_async_work(CPUState *target_cpu_state,
                                      run_on_cpu_data data)
 {
+    assert(bql_locked());
     /* Reset the cpu */
     cpu_reset(target_cpu_state);
 }
@@ -285,8 +280,6 @@ int arm_reset_cpu(uint64_t cpuid)
     CPUState *target_cpu_state;
     ARMCPU *target_cpu;
 
-    assert(bql_locked());
-
     trace_arm_powerctl_set_cpu_off(cpuid);
 
     /* change to the cpu we are resetting */
-- 
2.53.0



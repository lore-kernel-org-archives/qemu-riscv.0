Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0C2C98308
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:55:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93m8-0001qP-Me; Tue, 22 Sep 2026 12:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93iS-0004r3-Ke
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93iR-0002cD-5b
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:36 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjdat898359
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /5gPZ0r9el1io2TJV/MmocNJREFtJ5CHkCI5Btb3anw=; b=Okl6fnSzLg3w3KXP
 KepJgd4JfV7xql5QpTPjxhV1kNHOsAzIwk/GY+XX7RGjB8JWUJvgu1lrgu/qJKM/
 8zpvzfS4Ax2+Jgo8tmFDayfzoAInVFVURvz0B3msbdGNN8gMfkchB4Ce1UZXPDYw
 emb6dzhMOpFHN6ea5d4XtRbDIjii9xByoac4hVUpMQjFaqVNUibW23ywrsdahsds
 fLcYTXyBmAoXSfZKtjMMKDok/jpVG4sYS7mccH4PiCV088Xa99YsnoudC5Hy5baS
 e8D4rjnnixH1a2fSn5wjNOz2Fl6jb0VnTaIsTfkqviryDV/eeR+bptrYzRY5zp+l
 MxLgWg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkvyf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:24 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-98055f91346so19219241.2
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095883; x=1790700683; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/5gPZ0r9el1io2TJV/MmocNJREFtJ5CHkCI5Btb3anw=;
 b=G/yvY4vtNMLDl9M2MDVGkuwZl9jhSbqYu5G47T+12OIepANcCxGY2mvcrS6xBRYgbW
 nSwrDxm/ekFaNHUQVlBmzMjgdNopM3Y2zbj84F6AEVnp6IEwBdEX2NWfaZVla8YZ5Gcx
 +jmNW35jcWjs9nF+99Npt73OGSAo+sCi3oPYzdqeQcZtVeO/3xbBVS767x7pwZPoGJ6U
 18HEgiVlbo/kGjdhk+eD9iUNROyJPg4aBU9lAkN57Q6TgqykXzM9c/yWhoENmCKrHHqZ
 NVrJUXuJ1dpwRDqSrBZutyGkQEvj9e+g4SgxHU4f0BXjFPNBqS/pcqoZ1G2QPHPsx8kd
 HvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095883; x=1790700683;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/5gPZ0r9el1io2TJV/MmocNJREFtJ5CHkCI5Btb3anw=;
 b=PysvMR9dS2Xv8aY0UHfHqbAazXiZhUzKGH+5AOQWAhmDy3DJgCS40pyN/oWyNPwndP
 1KYVvz7ZK7QIfNgraX+t9zp0V7Vn34T0RW0nsPBCrlOgADU+Q1ZlLH5bXclxOiEuNvSR
 Kj09PA0wGar4jyKgqYoqq5VMbOI/RbKa5JJtPYYt5la9W5enSl4GcgMMJMQnhOIDyiOX
 rEmQMRNYAJbhV4oxNeF8jg355XGYpNiz4C2DutCOsH9Xm0ywn+yIeQEHKmLJvZOHa3mF
 UDeARx0/+7n3XYxyp/0Or3ZMXTddTAPwOy0AC4qjTqc460aANfzNgNCMJzQ7+3lKhyQr
 pAuA==
X-Gm-Message-State: AFuF++lDMyzk+CPRY3J+rkvJMGcJxQk9hj3hvBe+msyUaXe9Ez4WxfP0
 aT/ow6kHJjedK/10wVL8hsXmppHPN2fmc3kjtYV9AB3+OFRUVI0Z5cpvokbbUCiNTOUcjeDEQ/y
 sxLRHxB5QDkQQk7vBosY4aNqleLnPbDXTlcpd7EihczwgbehSaHU3CFjRVQ==
X-Gm-Gg: AYBFou01r+WruxlW2Dk2IbpinPEhxymqkWkroT92e6RSttH9cmdOpng+fkhwr46CBBk
 SEJO6YP4JsTYWK/5UiQD4+YL/L1bazm3rUMPi+BlKUyEc+DYvywtW3FOezFaPBBF7zHlR3MXkCP
 bf8HfBgiiGSMrnAgw+uxH2G0swCMNnDqHasxUQsBSYfjXT+lkxjrIFw0jquw/Zgb7I33vCrXyBM
 dLAb/o+oPKP6EkXd2iYm5py2yZnRulGIGLG6wX1rvqoyvwHDtrDzwHnZaT5RqdkJ/Zhy3Y3z/r1
 CT8LCcLa4PQZJ+yQMk37PjKFRSXkj/0yzUN+2ZVF3RTrxgzsRF9v+EB5JzlVN9qAQCyVYs7EPeh
 /7g/ilJIUrSajjsj030sEr8r4kbNG3c6IM/fiXFyf
X-Received: by 2002:a05:6102:e0e:b0:7a6:ef60:dac with SMTP id
 ada2fe7eead31-7a6ef6011abmr7772062137.34.1790095883529; 
 Tue, 22 Sep 2026 09:51:23 -0700 (PDT)
X-Received: by 2002:a05:6102:e0e:b0:7a6:ef60:dac with SMTP id
 ada2fe7eead31-7a6ef6011abmr7772001137.34.1790095883035; 
 Tue, 22 Sep 2026 09:51:23 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1aa057sm3671895e9.13.2026.09.22.09.51.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:51:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 14/17] target/i386: Split APIC polling from
 x86_cpu_exec_halt()
Date: Tue, 22 Sep 2026 18:49:32 +0200
Message-ID: <20260922164936.15189-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2b20c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=h7OMh5kjI76PbTVxvEwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jWhJmLJLWZXd6p8VB9POVPU11ScKbwP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX86qpgPbZJSiT
 HPMtA5mknT6eosFMUcpgOs6fmRcBENjYHYZF+W7FGXns5DUPB8z5gp8/+Rdp2qE4krnwd7fXHoJ
 ZxipZUJ/dhZOW81cDK5zUcDIRgjHSvfgJPiFbEFqZVHyDdqcn6o7ENMcoXnzZnSJl5NqOYQlZp0
 HPgUb+AfO7hkE8DqiwmtJIBVkzgU4GuhoS9ifP2My/esG3XP5lygBU2nVVstv5R70D8bRZ3p4rC
 0JGtYyXEBg5Xw5xD+hbIiPav92nP6ePOSHl2aEPMGDvc8BbPvFIAmKQLU9XWGgDeh+/QV3NED0f
 8XlItP3N5WRqOJpMI9HDEWe/x0+fd2R6zhvvWdvdvslzxtBm+b+905boWgehJDSgUOGHsn/gXfd
 NMWl13DDVbfLHnKPUb+yf9+EzmYelz0H89UcuBskki63yKzJGVc1qqZq5bLNCBOPoPM3MgW6Ugn
 Q3snlDR47X2wEkVQhKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX2ScK8DPPRoo/
 WnoVsjX2/9DyoAuhErJEL/tiPYZR/EjUy4rVjkqFGV/qY3DZhdC2PR3t3YpQK2bDUvU9pjt1w0+
 WXcMVmraIe2H6rhQTYv6zhk+yJkeffE=
X-Proofpoint-GUID: jWhJmLJLWZXd6p8VB9POVPU11ScKbwP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
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

Move APIC polling into x86_cpu_poll_during_halt() while
keeping the remaining halt handling in x86_cpu_exec_halt().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  1 +
 target/i386/tcg/system/seg_helper.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index f4b2ff740d5..58e8ca0bc1b 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -37,6 +37,7 @@
  */
 void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
+void x86_cpu_poll_during_halt(CPUState *cpu);
 bool x86_cpu_exec_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/i386/tcg/system/seg_helper.c b/target/i386/tcg/system/seg_helper.c
index 8c7856be81e..9ce608a0bb7 100644
--- a/target/i386/tcg/system/seg_helper.c
+++ b/target/i386/tcg/system/seg_helper.c
@@ -128,10 +128,9 @@ void x86_cpu_do_interrupt(CPUState *cs)
     }
 }
 
-bool x86_cpu_exec_halt(CPUState *cpu)
+void x86_cpu_poll_during_halt(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-    CPUX86State *env = &x86_cpu->env;
 
     if (cpu_test_interrupt(cpu, CPU_INTERRUPT_POLL)) {
         bql_lock();
@@ -139,6 +138,14 @@ bool x86_cpu_exec_halt(CPUState *cpu)
         cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
         bql_unlock();
     }
+}
+
+bool x86_cpu_exec_halt(CPUState *cpu)
+{
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    CPUX86State *env = &x86_cpu->env;
+
+    x86_cpu_poll_during_halt(cpu);
 
     if (!cpu_has_work(cpu)) {
         return false;
-- 
2.53.0



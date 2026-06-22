Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF6CCD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:35:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNi-0000bt-NL; Mon, 22 Jun 2026 15:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNe-0000bL-KP
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNd-0001qd-3r
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:26 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFXVAU1647498
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=bqoFOqi9y2j
 ApoBFiQULiZlsCkxGWjY/YWJcwDvQwNI=; b=XdDEwLm8Rm9AjxpnjX9N86/Z+VO
 xjc+/hoTxrxNs4mRbK38krqf70uBUZm4j7BoRjeMJ21M1KsOUcBDe8KoZxWxjTqb
 li8A21313qk4IiWSgEk6RtDdLGI8/f/CDuL+i7FUxZGspK52DbmLzEUBSNCI5Qu0
 Hsf8moIKToti/nWkoWw+e3vto1RTCFiFyMX88wMVEaQp55I7bxAMxqu3lb3J6NGb
 Jy5y8VRc8CSTIncM3VpgdD2EgNTA3e6AKBTsUyymVk7vgwHisxLTKUJ2cKunpmRg
 cFYye02ZF7qwKslkArzLZzOQoP11rcWqFdTmr5f1PgQFP6jTq/zCnJMgAxA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37h9yax-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8de2adc85efso101902406d6.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156744; x=1782761544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqoFOqi9y2jApoBFiQULiZlsCkxGWjY/YWJcwDvQwNI=;
 b=Qe1+AfxsEpe8iu+YQmyyfWvXtDy6L7Mes3yEYhz5R9jRgbTOxGE+/OXgyRi0q5BkXB
 35mGEm5TlLzC+/2UZia8f4C5405XmHOPwQ9jJ931pCg+35vYuYvrOg7FXU5KeIl4rTDb
 cMz6RgUmeaUepxzJROuNOzl16nOjCAGsdSM+5zf1eRdwQv6aWJLT0jfnf2t6XxRqsj4R
 Z+v3gLKYF1lMlHKEWBsxxIjBECdCb/3P+gQIyMLu5ctz6c95tGLEgB4TH/kwfcB9OBNQ
 zfQksANpiRw+px1b3ki72/wacSoFrIyrf2T1eaOsGVUqgiDVnsuFv1gRfKODNHKbqx+v
 qe/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156744; x=1782761544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bqoFOqi9y2jApoBFiQULiZlsCkxGWjY/YWJcwDvQwNI=;
 b=Pc/xR1vPy/Dff4Q+Y0Wtya+y0DWdZsgICICQaCiEcIEXvc8WZ8USU+mG0oQUIT4m+x
 B+0ZgL4Cvl/94S8+F5Pd20xfaV3KkTV6/OWkhWX6cly8yZGiebkvJx5SgOyJf0MDi2sT
 hoF3oI34BA+zBgiVeflCotQUOBRHUviFXj40Auyujdcrv0KBMEaWyLekRXPsW2AOSEqz
 hF+1PV9ZiVylQ3Jcozn0JK8It8aovvq1syAM0Q8tGaCk7KeelqJ/GSEEl0OGLTIqfvJn
 mOSMXXIaQ9H/nvyC+CnIIwwm4HyzYja8sj+IZm0ygXXLsgXqafgGn3f8T5PKo+zHzyRM
 3G5A==
X-Gm-Message-State: AOJu0YysSZrtFQJQxP9tPFyx7F9m2/yem3f+/Y2ZqU/z1VpU7utIsM6d
 jGg9cMTCWCLe4BCJrE11BZDUxuoJazW7JXKUxqt3WO9X98b53+9ndEbTPG5/rq898StEO7FpmcQ
 CuKZg8rgwcVwiO2EIT6pnM6tiDNvoq76pUxsz0Q6lUo7qxZvH+t0vYVw+fg==
X-Gm-Gg: AfdE7cl+1cGcpbqMCWhhEHE7s1UMlB3jAV3rDze5oxOmEwOCeGXZyJYeLfALHkRA0si
 s/lkx/gdKvvx1QghbfwifxC3VtraUY2hTe/WGt6H2UbS9zEfdvAKKSs53nMvQbTU1dtNwAvyAhw
 9KjAPGsLt4L5pqQ3OjIRUEe6hDCpWve97TLsJ404hFRGln2QK+wDS3q+QzRIiJ2WxiWL4DULnB1
 OJbgKc0M/WWOSjUoEU5bGru+MUt7+UBxF8JrpOcE5OmPxCqY7EBZYyk9gzhNT5Ly2eQE2JtVMj5
 DYXSjZdWZEK9t6HwXTT1rm8MDbNRZXTy7yQSuHPL9sN/wrm4uCvkZoiHmb3B8sNvC0A4HfE1LOO
 K5+lw9YwFQ4YNa00s04qyAbmW6QC7U+V4OtN1JK5vEZWBqg==
X-Received: by 2002:a05:620a:1a1c:b0:915:cda5:2803 with SMTP id
 af79cd13be357-920d480ec73mr2112870885a.56.1782156743495; 
 Mon, 22 Jun 2026 12:32:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1c:b0:915:cda5:2803 with SMTP id
 af79cd13be357-920d480ec73mr2112866385a.56.1782156743080; 
 Mon, 22 Jun 2026 12:32:23 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:22 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 11/24] target/riscv: move riscv_cpu_set_nmi() to tcg-cpu.c
Date: Mon, 22 Jun 2026 16:31:27 -0300
Message-ID: <20260622193141.1449724-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ux1cNgmX9v7kN9puzoTqJUuSeV1wZ4sv
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a398dc8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9Y5uhDEGy_uPjlLRjCEA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX3iFWRaU7vm7n
 f95bqbhRGBtOO6obw5ZJOuKnZQrf7ew8PfW7bJkFkrDCUYHvCJJ+Ki0dkinRbuB61Sy0VpnsCG/
 6tPxhlBUTt4MJnLTW2k+0RY98yozI4E=
X-Proofpoint-GUID: Ux1cNgmX9v7kN9puzoTqJUuSeV1wZ4sv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX0Ry7eAkpUHup
 jj0AnFq1az2Oh8xMIk+ZfBWN51hJ/2dJMVcwO9xhnYiHZZdQENQX/P//k9802WMezWQ9HHKVAGU
 sUM6377rV4Ymu/WiW+B38CaQTP4TSMU9BHnclYHa5iKsC26fcr9l6MkYUtv1DsvLawEk5sM6ZFq
 1oYV3JftzE3SQP+QAI6LVYRsn+oO7mSVnsBdCCkLCNVaqodVdR2gthfHSks8X27NNmS83MzDBzj
 ObxSUhL0UNfIwVTgfdo2CG6J+dIxcdC1OL82WUbwq1xAkAwfHdupOQ3keySKpzcrQvt8Yq1B3UR
 sJa5upPAarBKF5ChDQJ0ndfffzNi/Y5kU/J9iNg9Ci1aD2s2aA44TQ+MeIAvS34wZafDjARyPj4
 nESl4ggyDhTTXSZdyVCcGXtAuJYWsNDS3/vuTFHCWWjLdjCyAuj2GoAX9P4yLNoafXpfCMdlFdA
 Mbhx/DTODksYM8nF4Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220189
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

This function is related to Smrnmi and non-masked interrupts, firing up
interrupts via env->rnmip from riscv_cpu_local_irq_pending().

This is all TCG only code.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c         | 8 --------
 target/riscv/tcg/tcg-cpu.c | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0c5e000f17..74b6daa76b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1160,11 +1160,6 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
         g_assert_not_reached();
     }
 }
-
-static void riscv_cpu_set_nmi(void *opaque, int irq, int level)
-{
-    riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);
-}
 #endif /* CONFIG_USER_ONLY */
 
 static bool riscv_cpu_is_dynamic(Object *cpu_obj)
@@ -1183,9 +1178,6 @@ static void riscv_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
-    qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
-                            "riscv.cpu.rnmi", RNMI_MAX);
-
     if (mcc->def->num_triggers) {
         env->num_triggers = mcc->def->num_triggers;
     }
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index fef66557c2..0d0a704179 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1662,6 +1662,11 @@ static void riscv_register_custom_csrs(RISCVCPU *cpu, const RISCVCSR *csr_list)
         }
     }
 }
+
+static void riscv_cpu_set_nmi(void *opaque, int irq, int level)
+{
+    riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);
+}
 #endif
 
 static void riscv_tcg_cpu_instance_init(CPUState *cs)
@@ -1674,6 +1679,8 @@ static void riscv_tcg_cpu_instance_init(CPUState *cs)
     if (mcc->def->custom_csrs) {
         riscv_register_custom_csrs(cpu, mcc->def->custom_csrs);
     }
+    qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
+                            "riscv.cpu.rnmi", RNMI_MAX);
 #endif
 
     misa_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
-- 
2.43.0



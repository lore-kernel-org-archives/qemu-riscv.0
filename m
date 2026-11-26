Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2866606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5DMCXqW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XW7lINDt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj39-00010y-BM; Thu, 26 Nov 2026 18:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2s-0007gv-CJ
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:38:30 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2o-00015p-SM
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:38:30 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwAuB3340049
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g5XI5jXSYtDdcGSE+cnkE29fdLOtqCwMQF6Z8XMfBgg=; b=a5DMCXqWg8zC1gt0
 v1lWwS6KriA7IhUo3H4KQUDm2xGPAmeLA6qmLe2wmlXdut093AxPhYRsLp7S4+ZE
 9Hxq3KemKiSfA70AdJoJ+EvOZt0ZQmCMGAglp27cZmY6JxWWU7imWOSKcPCvsvTp
 Kh1e/LPDXgretHLbDpJ2x3JpJuanFiyLjkQ4/a9VKJl0rC3l1j8MxAj6ZNnQfRcd
 pndCeqex3erhEntx9tYXa2qi8aHqpuHfWZu9Em9tBs/LK6mtmS9jH4ImSYXMHPi6
 1/Xul/lX6iRhSsZ9LQw11k/KR6OMxrOREea7Mo6+VcbPNijVNtm0r7vCD8DIJ1Nv
 JhxEBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqhdug-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:38:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f5844e383so1109388185a.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736294; x=1796341094; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=g5XI5jXSYtDdcGSE+cnkE29fdLOtqCwMQF6Z8XMfBgg=;
 b=XW7lINDt1CFZgCylfxWE58aa7n7etYpGXmiEb0SLcn+ncqAKJ06BJd1A/enG3SqNcY
 IMbqoGyx1zwqMImD43DAdmIjnvwWboYpAmC/yuVFRP8wti91puGSY86lZy+kauO/z+MI
 7L7SltcDEkq4pHAofxoEtJ4y1+y78YjeIIeqljklUz9LLmUhvZ1KhJg+rwZFpidD5Cic
 kgXgp+s941pTL80j/c6hzZDyEIKlb5UUT0ruq47qmRcUJtvZQMhdUkPRvURS1eod2EEF
 QmVhcZn44LZJUp7tIKRRDnK9NUI2HXMl3esOjklLztMeMyh36FNjbXBqGEt0rUJxm33J
 mn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736294; x=1796341094;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g5XI5jXSYtDdcGSE+cnkE29fdLOtqCwMQF6Z8XMfBgg=;
 b=R+5DrOUjjRq4QNNdVP6+1UaqCJasB3RsaNR+jqKS8KyAE1Dm9+2pRw/Ll36zBMlEyX
 /nGmJq3P+uIu057r00doiKTMvVu4Zz/Ye4okcHDdxbC7s9iATknLKIKgRlinGG2z1JYH
 TWMbr/1AQJWuktfb6VHUUsG3ty/shHaSwBKvm1AKTwia1PGM3uBsy6JdeGNKE30FOklo
 AuwMbatuSytz8xCwqekOnxsH60FsRk5l+rmXlyPTQ94yfJoe+6yuCBDpVRwx8mXeOGPs
 E9m9nyjr8QZ7o4wSYRCvUMrIDPAjIopvtBKF8YwHBwK3bvBl99mjCWhJ0E8VZ/5Mn6VZ
 Swgg==
X-Forwarded-Encrypted: i=1;
 AL+hErGCUE9xnD8DJnevs7QzxwNoUSY6vw090XPCED1l5w5YL7siy5FdC65gB7eOeu3N7XaMpHOg2bYA7jwh@nongnu.org
X-Gm-Message-State: APuU4Z8Z0Zy8JOGObaoMsOk8tCQ9aM6mSOtcDzZXcjDU9jGY4G0QcO8f
 Uuqb0FcLA4U7Rr4gH+L2rghvQVZ9FED0+ubzBsvMTH+hzrBzRhjgmd7wTnbSsi2t4/H4D6buiBc
 1umKAuDbABywlpoyWnnYjpqw4MGePad16k9yMTZWxWtJPF/R9GZilJmzNodQCVp85WA==
X-Gm-Gg: AZFdTZfLkZnb6M5WcK/9Wpl/XS4oJkp/JjC5D5GvIzWxxlgBbsuZJRI3RT/z7wMkVwi
 Ndeh00Nx2D44Y2Qn4Fm8DjpSfkGl5VCZecn9qo69a1TfHwIyI6as2dEzf79WaeDT9iH+ivVVROt
 ibQoRGh09h65wfZo7XKkyQnoQj8fabGw0QWlJaEsNiqp9YrGiA6DHOq9We7YgnWhdhMNilMX0Hm
 ICYGc/WCLwngzjxG4Pk9M/0TXLiaVCww2ktZz4ht7rwm3Zonb1iUpaYDswE7yRl944OmqYGK2Hu
 Sp7OS/7ymJTLegM+IzLKgGgxsCSmQVoLZ8gcvjakhfb3bnaiYu5rB2AfZdWpO0aleDzRVgtlIgI
 ehyXkuNBeANXnEwnH2Pf0YJMaajyutOSxnncFvjFkmsZF3CpD/6iggGvUbPVKTvI+mDOaw89JAo
 mcuYcxM5EUe468AQ==
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id
 af79cd13be357-949ba965bdamr4432344085a.26.1795736294357; 
 Thu, 26 Nov 2026 15:38:14 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:949:75de:b222 with SMTP id
 af79cd13be357-949ba965bdamr4432337985a.26.1795736293830; 
 Thu, 26 Nov 2026 15:38:13 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8533579csm553612915e9.2.2026.11.26.15.38.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:38:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH 16/24] target/riscv: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:54 +0100
Message-ID: <20261126233604.67722-17-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8HbbfVxjGp2BsXG-ZI-YJFSRzAkzXxjA
X-Proofpoint-ORIG-GUID: 8HbbfVxjGp2BsXG-ZI-YJFSRzAkzXxjA
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b08c2e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LY2AvKqd-hjfOO1We7EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX2l0hU5uUW8sE
 BezCRejQoCbHOTwal2drP5taykX3QiUQqBpaMCwbLmMTqyhtIoht+RKDJFb/XijX2QJEmUnmjwY
 PdU9jVtFGpDp+Ipx/FrV96g1hRt/QtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX/8xoL4IPYc5R
 Kql/4tDqqljayij2Xi9J6raDAQaeU7e6GDUgzbdVddqOQEvpvmwC10tBjnRAL7vCGddNicjYtiZ
 5ao0TOa6q9Dv2vR4APRsGm+WmhWLqX08a2OWZWqCu5ganV2hPXiGNr5C2K8j3W49+txw7KEIZ8w
 +NhpAA72stf6oEYJkRIq1ljfkSVczc4WuvXT/yG8zXkxjGsHjKDXiFK1gJaA+YBRcIkanOS5DUC
 ohh3Kdtw4W6RpPk9SKeBvF3s2yhFkGw++egKb/hMc9D1lQVedvMlr3CC1ML3VT3CaFPh1uu0+DS
 fhHQpXxUBHNBBzK0H2NjZV0fLwtLtbEv2H9uEgNnu0GATNIoxWlc5nhPFWpzZNq5tWoocQxjkSj
 HLd7OultkIIAo8FsfXA4Q331cCXb2SOsoT4OJ556vESJJq0ztAiW9WbKWPLIacUcESz9lWX1RQw
 Gfhihq1O1jG1PHUjFDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/tcg/tcg-cpu.c   | 46 ++++++++++++++++++------------------
 target/riscv/tcg/translate.c | 42 ++++++++++++++++----------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5834ec1524f1..362471d7c8e4 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -104,7 +104,7 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
     CPURISCVState *env = cpu_env(cs);
     RISCVCPU *cpu = env_archcpu(env);
     RISCVExtStatus fs, vs;
-    uint32_t flags = 0;
+    uint64_t flags = 0;
     uint64_t ext_flags = 0;
     bool pm_signext = riscv_cpu_virt_mem_enabled(env, false);
 
@@ -126,19 +126,19 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
         uint32_t maxsz = vlmax << vsew;
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
                            (maxsz >= 8);
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
-        flags = FIELD_DP32(flags, TB_FLAGS, SEW, vsew);
-        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
+        flags = FIELD_DP64(flags, TB_FLAGS, VILL, env->vill);
+        flags = FIELD_DP64(flags, TB_FLAGS, SEW, vsew);
+        flags = FIELD_DP64(flags, TB_FLAGS, LMUL,
                            FIELD_EX64(env->vtype, VTYPE, VLMUL));
-        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
-        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
+        flags = FIELD_DP64(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
+        flags = FIELD_DP64(flags, TB_FLAGS, VTA,
                            FIELD_EX64(env->vtype, VTYPE, VTA));
-        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
+        flags = FIELD_DP64(flags, TB_FLAGS, VMA,
                            FIELD_EX64(env->vtype, VTYPE, VMA));
-        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
+        flags = FIELD_DP64(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
         ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, ALTFMT, altfmt);
     } else {
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
+        flags = FIELD_DP64(flags, TB_FLAGS, VILL, 1);
     }
 
     if (cpu_get_fcfien(env)) {
@@ -147,26 +147,26 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
          * the start of the block is tracked via env->elp. env->elp
          * is turned on during jalr translation.
          */
-        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_LP_EXPECTED, env->elp);
-        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_ENABLED, 1);
+        flags = FIELD_DP64(flags, TB_FLAGS, FCFI_LP_EXPECTED, env->elp);
+        flags = FIELD_DP64(flags, TB_FLAGS, FCFI_ENABLED, 1);
     }
 
     if (cpu_get_bcfien(env)) {
-        flags = FIELD_DP32(flags, TB_FLAGS, BCFI_ENABLED, 1);
+        flags = FIELD_DP64(flags, TB_FLAGS, BCFI_ENABLED, 1);
     }
 
 #ifdef CONFIG_USER_ONLY
     fs = EXT_STATUS_DIRTY;
     vs = EXT_STATUS_DIRTY;
 #else
-    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
+    flags = FIELD_DP64(flags, TB_FLAGS, PRIV, env->priv);
 
     flags |= riscv_env_mmu_index(env, 0);
     fs = get_field(env->mstatus, MSTATUS_FS);
     vs = get_field(env->mstatus, MSTATUS_VS);
 
     if (env->virt_enabled) {
-        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
+        flags = FIELD_DP64(flags, TB_FLAGS, VIRT_ENABLED, 1);
         /*
          * Merge DISABLED and !DIRTY states using MIN.
          * We will set both fields when dirtying.
@@ -183,16 +183,16 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
 
     if ((cpu->cfg.debug || cpu->cfg.ext_sdtrig)
         && !icount_enabled()) {
-        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
+        flags = FIELD_DP64(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
 #endif
 
-    flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
-    flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
-    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
-    flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
-    flags = FIELD_DP32(flags, TB_FLAGS, PM_PMM, riscv_pm_get_pmm(env));
-    flags = FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, pm_signext);
+    flags = FIELD_DP64(flags, TB_FLAGS, FS, fs);
+    flags = FIELD_DP64(flags, TB_FLAGS, VS, vs);
+    flags = FIELD_DP64(flags, TB_FLAGS, XL, env->xl);
+    flags = FIELD_DP64(flags, TB_FLAGS, AXL, cpu_address_xl(env));
+    flags = FIELD_DP64(flags, TB_FLAGS, PM_PMM, riscv_pm_get_pmm(env));
+    flags = FIELD_DP64(flags, TB_FLAGS, PM_SIGNEXTEND, pm_signext);
 
     ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, MISA_EXT, env->misa_ext);
     ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, BIG_ENDIAN,
@@ -216,7 +216,7 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
     if (!(tb_cflags(tb) & CF_PCREL)) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
-        RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+        RISCVMXL xl = FIELD_EX64(tb->flags, TB_FLAGS, XL);
 
         tcg_debug_assert(!tcg_cflags_has(cs, CF_PCREL));
 
@@ -234,7 +234,7 @@ static void riscv_restore_state_to_opc(CPUState *cs,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+    RISCVMXL xl = FIELD_EX64(tb->flags, TB_FLAGS, XL);
     target_ulong pc;
 
     if (tb_cflags(tb) & CF_PCREL) {
diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
index 79b0f444efbd..255433593dd9 100644
--- a/target/riscv/tcg/translate.c
+++ b/target/riscv/tcg/translate.c
@@ -1323,45 +1323,45 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     CPURISCVState *env = cpu_env(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
     RISCVCPU *cpu = RISCV_CPU(cs);
-    uint32_t tb_flags = ctx->base.tb->flags;
+    uint64_t tb_flags = ctx->base.tb->flags;
     uint64_t ext_tb_flags = ctx->base.tb->cs_base;
 
     ctx->pc_save = ctx->base.pc_first;
-    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
-    ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
-    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
-    ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
+    ctx->priv = FIELD_EX64(tb_flags, TB_FLAGS, PRIV);
+    ctx->mem_idx = FIELD_EX64(tb_flags, TB_FLAGS, MEM_IDX);
+    ctx->mstatus_fs = FIELD_EX64(tb_flags, TB_FLAGS, FS);
+    ctx->mstatus_vs = FIELD_EX64(tb_flags, TB_FLAGS, VS);
     ctx->priv_ver = env->priv_ver;
-    ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
+    ctx->virt_enabled = FIELD_EX64(tb_flags, TB_FLAGS, VIRT_ENABLED);
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-    ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
-    ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-    ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
-    ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
-    ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
+    ctx->vill = FIELD_EX64(tb_flags, TB_FLAGS, VILL);
+    ctx->sew = FIELD_EX64(tb_flags, TB_FLAGS, SEW);
+    ctx->lmul = sextract32(FIELD_EX64(tb_flags, TB_FLAGS, LMUL), 0, 3);
+    ctx->vta = FIELD_EX64(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
+    ctx->vma = FIELD_EX64(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
     ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
-    ctx->vstart_eq_zero = FIELD_EX32(tb_flags, TB_FLAGS, VSTART_EQ_ZERO);
-    ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->vstart_eq_zero = FIELD_EX64(tb_flags, TB_FLAGS, VSTART_EQ_ZERO);
+    ctx->vl_eq_vlmax = FIELD_EX64(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->altfmt = FIELD_EX64(ext_tb_flags, EXT_TB_FLAGS, ALTFMT);
     ctx->misa_mxl_max = mcc->def->misa_mxl_max;
-    ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
-    ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
+    ctx->xl = FIELD_EX64(tb_flags, TB_FLAGS, XL);
+    ctx->address_xl = FIELD_EX64(tb_flags, TB_FLAGS, AXL);
     ctx->cs = cs;
     if (get_xl(ctx) == MXL_RV32) {
         ctx->addr_xl = 32;
         ctx->addr_signed = false;
     } else {
-        int pm_pmm = FIELD_EX32(tb_flags, TB_FLAGS, PM_PMM);
+        int pm_pmm = FIELD_EX64(tb_flags, TB_FLAGS, PM_PMM);
         ctx->addr_xl = 64 - riscv_pm_get_pmlen(pm_pmm);
-        ctx->addr_signed = FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
+        ctx->addr_signed = FIELD_EX64(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
     }
     ctx->ztso = cpu->cfg.ext_ztso;
-    ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
-    ctx->bcfi_enabled = FIELD_EX32(tb_flags, TB_FLAGS, BCFI_ENABLED);
-    ctx->fcfi_lp_expected = FIELD_EX32(tb_flags, TB_FLAGS, FCFI_LP_EXPECTED);
-    ctx->fcfi_enabled = FIELD_EX32(tb_flags, TB_FLAGS, FCFI_ENABLED);
+    ctx->itrigger = FIELD_EX64(tb_flags, TB_FLAGS, ITRIGGER);
+    ctx->bcfi_enabled = FIELD_EX64(tb_flags, TB_FLAGS, BCFI_ENABLED);
+    ctx->fcfi_lp_expected = FIELD_EX64(tb_flags, TB_FLAGS, FCFI_LP_EXPECTED);
+    ctx->fcfi_enabled = FIELD_EX64(tb_flags, TB_FLAGS, FCFI_ENABLED);
     ctx->sdext_step = FIELD_EX64(ext_tb_flags, EXT_TB_FLAGS, SDEXT_STEP);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
-- 
2.55.0



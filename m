Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA4E606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTPay10F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F/+z2EiO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMqL-0007XU-Vq; Tue, 20 Oct 2026 23:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpD-0004ro-GX
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:17:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMp9-0002zE-CB
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:17:11 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FGi13988816
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hPwTMfh9tl/gdAjpUv4siVapEpR/STNR2Jm7XAvIl40=; b=PTPay10FMosYp+/G
 nycyFgPoRC5yRXY78whzE5eabhdyXGiiWJLMt9KxuxPHO1WDnFuMwB0F/praUa0y
 lC+++2AJI5fiETXJ7BVDZ7+lEjWkTKstPozVORpTZJ+iMG62CAjCHF5sZPCWr1cX
 XGawYUEu1ZF9eVUr92p5499yX9wX/moyhL/YJ7N/XiHE4ux9L8SmTVj8tK4P1QMu
 Aoa3Ei77fCg8mw66oon46ijsFuMkAGZNRJv/6DPHO8RT0lff/mcuyyDe/zuQhS7J
 4OgJrlMlsUqCmziz9szbblsGkz4yk3BhwhNfro2TbKQFfvxLrmhQMVurdXz5ynco
 64L57w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhrd3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f568dee56so65521085a.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552615; x=1793157415; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hPwTMfh9tl/gdAjpUv4siVapEpR/STNR2Jm7XAvIl40=;
 b=F/+z2EiO04TDTJHO4J0G9BQqvn2z7rhLZf86Omek0Ll7sBrk5bZazfdWHvSn/7Llfd
 sqoGi8kumSWvEMyQj132UYDntBx8FqoWwWmIo0C5UpDctfQcwnVRW6Nc3RuQVxgR2BLc
 91jNR3GQxUF6/vZolrM6cOBeztGS4q4crLJssusRetFG78FHE9luLdulGt5pVrnR4bdV
 6w9690Rrfb/D2BGUkb7S15EAQ8YFNVCUgLamGE5ciQkWn4UHkUz8Ctkm8+5fyGhGibxC
 x8ST9URPfzBopipWXwlmnZhCSD/RIj35qnt7Y+hGHq0JhMrSBAX18cBcFUW0Ht+nDSqu
 6atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552615; x=1793157415;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hPwTMfh9tl/gdAjpUv4siVapEpR/STNR2Jm7XAvIl40=;
 b=Aj/pSFrDDRpW/vFlXeSKnCKNa2NomstbAMg/ounbwY56VmYEJ/Cf9phEekBl/pjaJr
 NvrjtT96ka+XX22SYJe3B3sYqdxfibb26Y9SYPr2VDFyWT5ADURfLVsBE9ZMiAsnP0uS
 hCkTtjO3JIZ+s93A/IQLnJ8cPZ2eNymdAg2t3YcnBTEQn7ZQ1Zk42ruKX2+Z4lQBS4Qh
 xeUxg9SZYxeJr8NbfIN9eUD93SotoOH6sSRiPULMP2Zwj/YVTO+AkjTWkJIxCUJoug+3
 9j1LgrE1k7FInGGEMxsKwvWrmdGGuWofGYW30UMj7cDBcuhedFtQJXGuLrfImYKV6x9C
 Nlng==
X-Forwarded-Encrypted: i=1;
 AKwUvBzX463QyqH5wxnDi6oiMaczEvEn6E/8zMzGB4EBA8uUBTHZ+3KqJY77oFCvN6ENsH98yeSdrT6VDnLk@nongnu.org
X-Gm-Message-State: AFq9FYLnOniGDc4d+cYHb1nY1juDLVzvVoS0DMKd5sYtixuSaWjtLTq9
 D7PR5RoLaMdiJAFRqdmYwzE4Q7drazwafNOGMFRTWWLkKYsIk12ME158Zd0uDWlVxwMttYWIeaW
 2Gn0Z0irlaojL/TFjKu2PQ25YhIXdkIEEVRCmSZMI/wn2CDZYj9+1zaHIeA==
X-Gm-Gg: AYBFou2SNmQ4AL0nf07UTvASB5JBur+yQMuF3fO2xNefHSEH84SLJM18Awjt/fnQesm
 ye54D9ahNhInxmU3HvhAlBRapYIZeNCYWersi23+cxEiKJPrf6hJSOEH+QB5/NnRJfk+sKoxqJd
 +HZWgUnap4l7d/UrrGRg5fmAMWUZKF8OxIspSsMMSNnvD70kqZfiaU6L5yeQ0NpQw9H4NetAMPI
 NeJObhqgHgDIusnepwXgZCH2YcDFYVcoXiGBhbcDRhohKTf2y5Dn2mfl6Rl4RbzdmVr56a/urgr
 LCOw/PD2jACZtJdob1iXfej6bIGoqs52crFvLDrYJCbQCncCDZP1OlvrxUJpwH17agb2Bawfr7C
 LhMCOcBuIHL5L9me7IX/2KnAPtvWSxmkaHTfKTWmi
X-Received: by 2002:a05:620a:2788:b0:93f:3576:d43c with SMTP id
 af79cd13be357-93f57f1efc9mr223720085a.19.1792552615241; 
 Tue, 20 Oct 2026 20:16:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:93f:3576:d43c with SMTP id
 af79cd13be357-93f57f1efc9mr223717985a.19.1792552614771; 
 Tue, 20 Oct 2026 20:16:54 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25835d3bsm2390224f8f.39.2026.10.20.20.16.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 21/33] target/ppc: Use a static table in powerpc_excp_name()
Date: Wed, 21 Oct 2026 05:13:54 +0200
Message-ID: <20261021031407.24862-22-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXyVgP/lWfL64O
 TqWyOs9uSu+5mSm/WWdbc53EgenudatDzRwpvjnUnrmeJCw47ubld5AfyxFyYWk0yTQXHxdKByo
 fG01cJ11DCwqZ54BmBifQSvOLD9mW2ZT6nVJ5e7FIkLXZO/TWVFfxozAuXiqArr83sXM9NR2d3n
 cssZkQXsS9Ph//j/iIeO66OdOUXQCBZAuJlblVC03l4l5OS2pdPCTvvpiKpgbfxxeklIQAr3xBz
 W4a7/03DUTyOrccCsOdgFK1YTV/KEBD9rfFPqz2O4A/byUC/JDWLgAhf4VB0oZtRRs09KEiXsWv
 xChOktSwyCbRobeTFJCTp47KBB6AHJQDMwPhrCNqT4G9CW97myK3AKyRVRucy21oiNTyBdWuKkD
 gwVQeoPHJe3Ewl3Se+9eQjh7Q2susTZZY/3o1cyTwchK5CCYQd60/J1OZs3H/GbGMB2euHtU1Mk
 mjuNTtrHSnUvr1LBZBQ==
X-Proofpoint-GUID: iogmZW06xPw4WKs-083NWk1RK-o6iYXE
X-Proofpoint-ORIG-GUID: iogmZW06xPw4WKs-083NWk1RK-o6iYXE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXwEjRgEJgHnoG
 lnQgWPVnxw9Lt/zKqBGjApWhFI9aE8SN0Ihud6tyYDhDazdHj68C9T/vXs9FB9zFIn7/J1lTnWq
 L0adW2UpNe/DzGcUxcQ29FNDG6vro0E=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad82ea7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XJmH2WDaBb6-5EqxUU0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the switch statement with a static lookup table.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/ppc/excp_helper.c | 136 +++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 66675f1fdb4..1566f0c4741 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -36,74 +36,74 @@
 
 const char *powerpc_excp_name(int excp)
 {
-    switch (excp) {
-    case POWERPC_EXCP_CRITICAL: return "CRITICAL";
-    case POWERPC_EXCP_MCHECK:   return "MCHECK";
-    case POWERPC_EXCP_DSI:      return "DSI";
-    case POWERPC_EXCP_ISI:      return "ISI";
-    case POWERPC_EXCP_EXTERNAL: return "EXTERNAL";
-    case POWERPC_EXCP_ALIGN:    return "ALIGN";
-    case POWERPC_EXCP_PROGRAM:  return "PROGRAM";
-    case POWERPC_EXCP_FPU:      return "FPU";
-    case POWERPC_EXCP_SYSCALL:  return "SYSCALL";
-    case POWERPC_EXCP_APU:      return "APU";
-    case POWERPC_EXCP_DECR:     return "DECR";
-    case POWERPC_EXCP_FIT:      return "FIT";
-    case POWERPC_EXCP_WDT:      return "WDT";
-    case POWERPC_EXCP_DTLB:     return "DTLB";
-    case POWERPC_EXCP_ITLB:     return "ITLB";
-    case POWERPC_EXCP_DEBUG:    return "DEBUG";
-    case POWERPC_EXCP_SPEU:     return "SPEU";
-    case POWERPC_EXCP_EFPDI:    return "EFPDI";
-    case POWERPC_EXCP_EFPRI:    return "EFPRI";
-    case POWERPC_EXCP_EPERFM:   return "EPERFM";
-    case POWERPC_EXCP_DOORI:    return "DOORI";
-    case POWERPC_EXCP_DOORCI:   return "DOORCI";
-    case POWERPC_EXCP_GDOORI:   return "GDOORI";
-    case POWERPC_EXCP_GDOORCI:  return "GDOORCI";
-    case POWERPC_EXCP_HYPPRIV:  return "HYPPRIV";
-    case POWERPC_EXCP_RESET:    return "RESET";
-    case POWERPC_EXCP_DSEG:     return "DSEG";
-    case POWERPC_EXCP_ISEG:     return "ISEG";
-    case POWERPC_EXCP_HDECR:    return "HDECR";
-    case POWERPC_EXCP_TRACE:    return "TRACE";
-    case POWERPC_EXCP_HDSI:     return "HDSI";
-    case POWERPC_EXCP_HISI:     return "HISI";
-    case POWERPC_EXCP_HDSEG:    return "HDSEG";
-    case POWERPC_EXCP_HISEG:    return "HISEG";
-    case POWERPC_EXCP_VPU:      return "VPU";
-    case POWERPC_EXCP_PIT:      return "PIT";
-    case POWERPC_EXCP_EMUL:     return "EMUL";
-    case POWERPC_EXCP_IFTLB:    return "IFTLB";
-    case POWERPC_EXCP_DLTLB:    return "DLTLB";
-    case POWERPC_EXCP_DSTLB:    return "DSTLB";
-    case POWERPC_EXCP_FPA:      return "FPA";
-    case POWERPC_EXCP_DABR:     return "DABR";
-    case POWERPC_EXCP_IABR:     return "IABR";
-    case POWERPC_EXCP_SMI:      return "SMI";
-    case POWERPC_EXCP_PERFM:    return "PERFM";
-    case POWERPC_EXCP_THERM:    return "THERM";
-    case POWERPC_EXCP_VPUA:     return "VPUA";
-    case POWERPC_EXCP_SOFTP:    return "SOFTP";
-    case POWERPC_EXCP_MAINT:    return "MAINT";
-    case POWERPC_EXCP_MEXTBR:   return "MEXTBR";
-    case POWERPC_EXCP_NMEXTBR:  return "NMEXTBR";
-    case POWERPC_EXCP_ITLBE:    return "ITLBE";
-    case POWERPC_EXCP_DTLBE:    return "DTLBE";
-    case POWERPC_EXCP_VSXU:     return "VSXU";
-    case POWERPC_EXCP_FU:       return "FU";
-    case POWERPC_EXCP_HV_EMU:   return "HV_EMU";
-    case POWERPC_EXCP_HV_MAINT: return "HV_MAINT";
-    case POWERPC_EXCP_HV_FU:    return "HV_FU";
-    case POWERPC_EXCP_SDOOR:    return "SDOOR";
-    case POWERPC_EXCP_SDOOR_HV: return "SDOOR_HV";
-    case POWERPC_EXCP_HVIRT:    return "HVIRT";
-    case POWERPC_EXCP_SYSCALL_VECTORED: return "SYSCALL_VECTORED";
-    case POWERPC_EXCP_PERFM_EBB: return "PERFM_EBB";
-    case POWERPC_EXCP_EXTERNAL_EBB: return "EXTERNAL_EBB";
-    default:
-        g_assert_not_reached();
-    }
+    static const char * const excp_names[POWERPC_EXCP_NB] = {
+        [POWERPC_EXCP_CRITICAL] = "CRITICAL",
+        [POWERPC_EXCP_MCHECK]   = "MCHECK",
+        [POWERPC_EXCP_DSI]      = "DSI",
+        [POWERPC_EXCP_ISI]      = "ISI",
+        [POWERPC_EXCP_EXTERNAL] = "EXTERNAL",
+        [POWERPC_EXCP_ALIGN]    = "ALIGN",
+        [POWERPC_EXCP_PROGRAM]  = "PROGRAM",
+        [POWERPC_EXCP_FPU]      = "FPU",
+        [POWERPC_EXCP_SYSCALL]  = "SYSCALL",
+        [POWERPC_EXCP_APU]      = "APU",
+        [POWERPC_EXCP_DECR]     = "DECR",
+        [POWERPC_EXCP_FIT]      = "FIT",
+        [POWERPC_EXCP_WDT]      = "WDT",
+        [POWERPC_EXCP_DTLB]     = "DTLB",
+        [POWERPC_EXCP_ITLB]     = "ITLB",
+        [POWERPC_EXCP_DEBUG]    = "DEBUG",
+        [POWERPC_EXCP_SPEU]     = "SPEU",
+        [POWERPC_EXCP_EFPDI]    = "EFPDI",
+        [POWERPC_EXCP_EFPRI]    = "EFPRI",
+        [POWERPC_EXCP_EPERFM]   = "EPERFM",
+        [POWERPC_EXCP_DOORI]    = "DOORI",
+        [POWERPC_EXCP_DOORCI]   = "DOORCI",
+        [POWERPC_EXCP_GDOORI]   = "GDOORI",
+        [POWERPC_EXCP_GDOORCI]  = "GDOORCI",
+        [POWERPC_EXCP_HYPPRIV]  = "HYPPRIV",
+        [POWERPC_EXCP_RESET]    = "RESET",
+        [POWERPC_EXCP_DSEG]     = "DSEG",
+        [POWERPC_EXCP_ISEG]     = "ISEG",
+        [POWERPC_EXCP_HDECR]    = "HDECR",
+        [POWERPC_EXCP_TRACE]    = "TRACE",
+        [POWERPC_EXCP_HDSI]     = "HDSI",
+        [POWERPC_EXCP_HISI]     = "HISI",
+        [POWERPC_EXCP_HDSEG]    = "HDSEG",
+        [POWERPC_EXCP_HISEG]    = "HISEG",
+        [POWERPC_EXCP_VPU]      = "VPU",
+        [POWERPC_EXCP_PIT]      = "PIT",
+        [POWERPC_EXCP_EMUL]     = "EMUL",
+        [POWERPC_EXCP_IFTLB]    = "IFTLB",
+        [POWERPC_EXCP_DLTLB]    = "DLTLB",
+        [POWERPC_EXCP_DSTLB]    = "DSTLB",
+        [POWERPC_EXCP_FPA]      = "FPA",
+        [POWERPC_EXCP_DABR]     = "DABR",
+        [POWERPC_EXCP_IABR]     = "IABR",
+        [POWERPC_EXCP_SMI]      = "SMI",
+        [POWERPC_EXCP_PERFM]    = "PERFM",
+        [POWERPC_EXCP_THERM]    = "THERM",
+        [POWERPC_EXCP_VPUA]     = "VPUA",
+        [POWERPC_EXCP_SOFTP]    = "SOFTP",
+        [POWERPC_EXCP_MAINT]    = "MAINT",
+        [POWERPC_EXCP_MEXTBR]   = "MEXTBR",
+        [POWERPC_EXCP_NMEXTBR]  = "NMEXTBR",
+        [POWERPC_EXCP_ITLBE]    = "ITLBE",
+        [POWERPC_EXCP_DTLBE]    = "DTLBE",
+        [POWERPC_EXCP_VSXU]     = "VSXU",
+        [POWERPC_EXCP_FU]       = "FU",
+        [POWERPC_EXCP_HV_EMU]   = "HV_EMU",
+        [POWERPC_EXCP_HV_MAINT] = "HV_MAINT",
+        [POWERPC_EXCP_HV_FU]    = "HV_FU",
+        [POWERPC_EXCP_SDOOR]    = "SDOOR",
+        [POWERPC_EXCP_SDOOR_HV] = "SDOOR_HV",
+        [POWERPC_EXCP_HVIRT]    = "HVIRT",
+        [POWERPC_EXCP_SYSCALL_VECTORED] = "SYSCALL_VECTORED",
+        [POWERPC_EXCP_PERFM_EBB]        = "PERFM_EBB",
+        [POWERPC_EXCP_EXTERNAL_EBB]     = "EXTERNAL_EBB",
+    };
+
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.55.0



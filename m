Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8538F6071548
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LwffojDg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIWa5+GD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMpr-0006OX-BL; Tue, 20 Oct 2026 23:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoZ-0004TA-8S
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoW-0002tE-Qd
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:31 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FCqb3116348
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3G8nt6Kxp+1K+nUkKwFyrDB7DqQ1S0+arugjesbD5Eo=; b=LwffojDgRNAD1Iru
 Tg36DQys9EktgcqQEYQFoyacmC1SH6okYbN1ljUFD0Gjg4P5msqGevcn8MBxjrX/
 2iwdTZEM9Q6J4pYqB//3s/vuZvk+fKKLX4Q2MChXxtnQuHocgPiKaktg8TySEXhF
 JzKkLLPOraUlx1N4Uqu3c1Z3yv/kO48ZZOvnP+spzc72cHBB89edyhEJMeMPjjF+
 160W88rSkHbgPSoOT7aESerOv7FuELqt4egVYLZyrt/KwGyqLDkiP3aD0xlx0uVI
 Fmjupciv62/n/HJiV0NZ4sbPW/Z2IqnNn40Dg3QV1CCvBXOWXG8mf7PD3cTb4U2P
 0HhhzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hsr25-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93c5ab5c136so54551485a.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552577; x=1793157377; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3G8nt6Kxp+1K+nUkKwFyrDB7DqQ1S0+arugjesbD5Eo=;
 b=kIWa5+GDhRmDhl3u3EVcELMwKRPTP7B8LmD0a6X0+xIkHkqXLDTVmZS1Fq3y7kPYCa
 fwxUzHtacXab6tgdTifMRdwLqHoX4autOexn9l8GOjAWTYUJE1Vp5QZRAPuOB3WsNbTP
 MSfn1b/oepO1VXG+75LL2nQADyLKQoW8wSO6bboSFEjaAUsnSxfHQfHhKgCXFnKIrJZV
 fGUG06LmUsN4+1INTwdb4v+ovToUbnSVkiEGZcq7uluY/BF0yDGbitqIxqC/totucuSO
 XP2Fp38fhjGk09qnokCX3JKyQySSxNI2mRP4MBrBPdeU/oRk/Mb5t4JS6JslLdO5Ocld
 xuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552577; x=1793157377;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3G8nt6Kxp+1K+nUkKwFyrDB7DqQ1S0+arugjesbD5Eo=;
 b=w+tx/r7C2Cwtfk6+SBnRSRvivX/MR4esqWzi2ovm/W4djQ+8qY60yxGsFvmivK6zSI
 5ZvxrZgB+UsZgLNXXnjLcSYq2gZ7ZAi6hADuHpYiWiBmDCC8A3L9qbxD+83P7cAstaXA
 T8PPZ8fFH2PV3BiWc9Pt+jzp6mI/oDltNbyMHQv0tZa1KXXr2Z0ThmGekuY/WQXlFjDd
 lzHhcB5bAxvXOeDkvuqENrVKjDpSZxCTJfwDil2pQFDcHtcY/UAhoi1waZOnrrMXWA/i
 EUobrcZv5omO1WCPDwUd3mb6A3mDsTvqx9DTFFWS3BQLcpF3KPDrV4CcVVH3hWLMrveb
 SO6A==
X-Forwarded-Encrypted: i=1;
 AKwUvBydp2vP+O7zE/3WJHRnIPA/fWmKHHhDw5L3bxh7jTJIopHslAzJ9OOSMg1ptcCu567NK+Q9aU3EGNGt@nongnu.org
X-Gm-Message-State: AFq9FYLpQROG3ZNug9dJogXRzoAIGgxMJmjxiUlIaGCWvKNofNDFg+rY
 L3iPvu2LwHF3YvqAfSjEkpAob2weicATinDOnlWoSZnIj4LQLw6oAOx2shgHHu5AtzW6XOA/kg9
 hhkM2SzvvS0Y8krDKGa2KwtqlMwHHpukwaAz01X8V8/MXp8o8vkqALc8XCg==
X-Gm-Gg: AYBFou1UvAtb6cSIkEoy9ObItVhotvvVVarghVXBSs2rPyTBCHK5EAKDvdWTKezCVwg
 AWg4SqV+D3zRHpO4cS4+ByYnoLzMw3fLb+uBV3Ir/erHwehZ/wVHJXqoqVHZ6KgYWk2hVouEbkD
 Ny2TNzdoOlaJc+vuDGfPkFko5cv+Z6DMcmxOYfkLgW0PtpafxcZW+N7pI/Pu4p+DwMQcBhn1coR
 rtDInAA84OpVVnA7KVsLUaf1tcHSW3tKXrGFz0u8E5SojHvdCW6aL6TMyMWtvSI02TAdMquTTmO
 9N5o3EPwaa9gifmdpNXxYEQgTlsu6d09jKuepkfzWJwH2dt0RjZztdVjq2drVFbjOgDzpXp4jgq
 +/yW9kkJ99pT3JLp68H298H+WyfOuOlU8pzkzTCyZ
X-Received: by 2002:a05:620a:4508:b0:93e:920c:c00e with SMTP id
 af79cd13be357-93f57fa0e84mr223641385a.21.1792552576360; 
 Tue, 20 Oct 2026 20:16:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4508:b0:93e:920c:c00e with SMTP id
 af79cd13be357-93f57fa0e84mr223637585a.21.1792552575919; 
 Tue, 20 Oct 2026 20:16:15 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb698ce0sm45223085e9.2.2026.10.20.20.16.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 16/33] target/mips: Remove unuseful EXCP_LAST definition
Date: Wed, 21 Oct 2026 05:13:49 +0200
Message-ID: <20261021031407.24862-17-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad82e81 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6PapexcjMrqzk0dJnxcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXwUwdCx+utsml
 u/9SR43fJTK5F/cTOxc+F783Z90v67QHxJnagFVnHx+ZpeaG5lV3nAX91kOIe7ZJY4klHJ5if12
 6xNtsZjIa3Os4z2JAvfI29oEWVCVKic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX70CSQPX66qw/
 qiADiCX3rF1Q/ogIpfCCe68qPwCVvRMpo6ABA6gU5ClnmqH+n+LuzrLygqScpo0MQnX9wP798Pz
 t6M9192O0iFvasHZyKq/NEiyjpfC0FrsJhlhh7tNKBNKp0e6cLiVAm/KOU29F+MyFCiJMpvCvWt
 LgLtrUtzXLeHwBaTIRbKuhtwCV59mfQC55KwL1FOSXo8ihE2Rxj5FBAfXZY0ghvFgAW8HM1HxQb
 NiTI7iRl2FNQH9jvYD2tSl8i9elTuHVcsIURo8jWHgndl7FFgADP+wmK2XQddZj3F5kdBMAuilk
 J42dGYxrpkT09IsvlxYrtbAGPbUY/TbTiNb0+lO6Ob97xoDprUrXfF1+IQoe7JYv6BzEnvwleyv
 UjlR79sKIZNuZWWqxvU7gPhArTUQlXBOYb1bSiBEUOyeyj0AGNWdfgtM3wLsfMi26kmNfAm30V+
 vcrjPCFSSrDS/Ag2q/Q==
X-Proofpoint-GUID: sTlFbbzsulCVrZmeaHMprCy6yf27BPIy
X-Proofpoint-ORIG-GUID: sTlFbbzsulCVrZmeaHMprCy6yf27BPIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
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
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Check array boundary with ARRAY_SIZE() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/mips/cpu.h           | 2 --
 target/mips/tcg/exception.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 32549791a18..5d8b78a70b8 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1347,8 +1347,6 @@ enum {
     EXCP_TLBXI,
     EXCP_TLBRI,
     EXCP_SEMIHOST,
-
-    EXCP_LAST = EXCP_SEMIHOST,
 };
 
 /*
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 630b8b809fa..2f02f9be877 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -88,7 +88,7 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
 
-static const char * const excp_names[EXCP_LAST + 1] = {
+static const char * const excp_names[] = {
     [EXCP_RESET] = "reset",
     [EXCP_SRESET] = "soft reset",
     [EXCP_DSS] = "debug single step",
@@ -131,7 +131,7 @@ static const char * const excp_names[EXCP_LAST + 1] = {
 
 const char *mips_exception_name(int32_t exception)
 {
-    if (exception < 0 || exception > EXCP_LAST) {
+    if (exception < 0 || exception >= ARRAY_SIZE(excp_names)) {
         return "unknown";
     }
     return excp_names[exception];
-- 
2.55.0



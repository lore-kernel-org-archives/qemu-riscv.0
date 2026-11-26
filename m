Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD10606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AHmNuEz0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTsw/ffV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj2o-0007Ba-MW; Thu, 26 Nov 2026 18:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2G-0005tD-W1
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:37:56 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj29-00087c-DM
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:37:49 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJw8EE2354103
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vrKhK5W7SiJJIMTyhr8R3o+GZCDhh1u204E/b5tNOeM=; b=AHmNuEz0q8Up3Rmj
 sEG+1DumHmNxsZA2mCmJJJBioMoVhHJpTtJ/ejVCd1NOaSdAM78Cqi4HRKIq7geC
 TQOQ+Hl/dyhuQwxUxdDp0OCyOuMGVCkL8vHt/C+R43Mi6VfhkmC40nVIK1myVV+J
 k3cdO/j//FF13Axawu+oyGLBLl5tXF1abD1YeglM0+OvbajFJnHhUAR5Qp1u5acD
 Jm3MWwxttKxQtfI4+zHJvei4V6+AQvWTUd/zd2JE1+GsUvySN/1+HT42HFAaBmn2
 +Bvm+bwDKQthBMGBO+aaHUVsSNHtF0Jd7DRgDvcsmuJWRiHEcOIjU8WdgKPTiTMe
 QZN2kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7u3ps-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-948d83322f6so612724785a.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736254; x=1796341054; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vrKhK5W7SiJJIMTyhr8R3o+GZCDhh1u204E/b5tNOeM=;
 b=OTsw/ffV152MQiEy0nUoAKoWQNgLuh1mKAOL+6Qt9c8MyNy2VN7wPeNoDuJWM2qoH8
 FnY/8s8lZlyqlFDFK0XySK4AIkGtmVFMwbl0iB/TJ8ZIUx+ocg4hudRgMDBrh5iWkLmE
 PaUfMKLc2QPwBQUYl7K0bTnr6g/4DjMtCdAQKKYQSmcrbGD/H6D+ACGvaHQ3fGpmipzI
 YHBxs0pgocBAzYNKEEdAMR0haZr3ldskU6AZLlcRYjeRppu+BQVq1Cy9xo5k9pMBMSKf
 8joH6yi9MbY0bqgegaVjV57ajWSKaDPNItEeNDwwfTo4C+UQtDL4/cHqAfMrzrVqpe80
 xHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736254; x=1796341054;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vrKhK5W7SiJJIMTyhr8R3o+GZCDhh1u204E/b5tNOeM=;
 b=lfA9ndUmsL1OX/+qpYZEe2gzXLhFEHXWu2IA4StCKzc+T+JE6+VtutkArZn2d0wnhj
 MwkzfqiudBRHwypOuXZXBwalefTzd687RQzEHVY742q2REbcvGH8lAPa+rgnLhcoyAfZ
 pIR8MVA3SM985mbE/AQukJX26TPsqtOKxo/+YZ9fulKzSG+WcBOmuzpDo9uIr9kEdrSY
 rN5uB+vV6inFuZHoNG12PIOtLYZtTDN085YTPjvwjdsrbLf4tFT6U3QucP/W/kax3lIp
 /NVdlXT3G21geTKShaBwSvixYICSLURJgF6Plbis2QY0QQt3QA5V9HKbBTHM4mm09FQF
 5wbw==
X-Forwarded-Encrypted: i=1;
 AL+hErGM1pojl8GL4CZgURmPwz0cJqLi92u4PVQ9dlFsckmEAQ+E2AEP0C8c71YR1EPOzYG2FQHMKJbWYnsA@nongnu.org
X-Gm-Message-State: APuU4Z8EQngWaEPa/SAaNJOSUG1iyV9P6063M+EToA/DGV0NyoXn28ZI
 MRnhcstH+KPxrkHi64mEm7i4jqgh4Yv9yLYfuaTA3cmq1EFqQePjTmOIux2wdnAQQ+7tx44uIIJ
 2H8/9AqHZgxqyEEuPxFMrOmXgzWFbGKC1NsaJJRr2J3uE1UHQUD8kNgHwmA==
X-Gm-Gg: AZFdTZfXiASbGu8arNyvLmOf1/2CHlHb9rp8cVQXvpA3U98wfefgYEJJRXMtMT7ODwP
 Kc3vC/vPGLat/FpKmj+WgVVsctsllL3Q5bqDMVnCGDj3OfVn45Ss/QIJ336ptxEOVotjOUSG0xU
 wlfz5zQLg9rSXZ0doRuLB/ZGZZB7LtATI6JlBJoMbGFCw5wXtPOIQQrMgyvNJ6dpPx6pouTid21
 HN28RhUkigBE+OMjJyC/rloNR1cN8ACw2rBQhvkaeaBmFqpbkfsNYv82I06XKgLryklKWaB3kra
 ixoG4+aBspo9dCNVlbPM6CJ6KQMwvqF6X1gWX1nQFzx7xScwy+3SKchb2gSSrLxbK+HX9icPfg8
 nihws3+j9bHO+8eajskOxFI+fa3ifDxkoKqzGtrisfwvgcGb5LQzxWj6p30Osk3q5oskx9M651k
 byZDkJv7EOV9m7LQ==
X-Received: by 2002:a05:620a:44d6:b0:93f:34c9:925e with SMTP id
 af79cd13be357-949ba9b3971mr3920516085a.19.1795736253832; 
 Thu, 26 Nov 2026 15:37:33 -0800 (PST)
X-Received: by 2002:a05:620a:44d6:b0:93f:34c9:925e with SMTP id
 af79cd13be357-949ba9b3971mr3920512985a.19.1795736253383; 
 Thu, 26 Nov 2026 15:37:33 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a680355sm35925158f8f.27.2026.11.26.15.37.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:37:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 11/24] target/m68k: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:49 +0100
Message-ID: <20261126233604.67722-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXyEzy/V+HPBna
 EjCUEir7YNE8I1fyTh0JE4aeWHgmaBgVrsEIh8y0iOuXaSRbQIAwRKbOPjc2addHDIKBmpodbst
 3jXLfKdiIYDp1e8Rl5jzJEbnRPzXCn8=
X-Proofpoint-GUID: LKDW6zzS-nx6pg1qPlX1wbR6sMX7DbyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX74w8TMPCQ0CU
 9iLe7qDSgIJAvXMiai2Re02+x0CMy1cTeW68o1S/hGABfa3Ah9MuKSdoVj7wv/AqMjqIkxj7Ntu
 qu9caQvh4z/hdDwVoFLHG85oTEObxjjZWsaOPeTekv+5Qbolx+8zs6k/EOHGvuIo3/t7MvIyvQO
 E3xKxAK4AHnRga4hlQijbVHlaONvDTtqvsSCcHEEQfAoVEW65qDecIsOcJt4os+J6kaLGQYic6p
 QQC3JpJd668x31GsRDLhI+MBMbGT8QOsZARLEVUcDSm15xdMNw81/RAUf8d+h6QAGiDjSdcvNjU
 iyuuFvKlNNigvfCHCNDAbk6O2caUDiXKJMiBOzFAhYIqTyVP833HR8v7BDx8lyLnpkKl5Qe8exX
 D+OHfQpwuA8VUSlMDabIBsLAO+MQpya5/92wAjIM2uer5GF9uqJAwg66AanRH+LvTONrp9DVvbz
 7+RNrbmTsVdoV9iz0Xw==
X-Proofpoint-ORIG-GUID: LKDW6zzS-nx6pg1qPlX1wbR6sMX7DbyC
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b08c2be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kLFFoVEq7Bwz4vqrUBEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260093
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
 target/m68k/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index f7d289e591a2..74ac2a177cd5 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -47,7 +47,7 @@ static vaddr m68k_cpu_get_pc(CPUState *cs)
 static TCGTBCPUState m68k_get_tb_cpu_state(CPUState *cs)
 {
     CPUM68KState *env = cpu_env(cs);
-    uint32_t flags;
+    uint64_t flags;
 
     flags = (env->macsr >> 4) & TB_FLAGS_MACSR;
     if (env->sr & SR_S) {
-- 
2.55.0



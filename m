Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E9606A322
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4s+OgE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlYTn5I5
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT0Xl-0000yt-PK; Mon, 16 Nov 2026 12:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xT0Xj-0000yF-GQ
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 12:30:59 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xT0Xi-0005Gg-0a
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 12:30:59 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGGIcqQ2791702
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 17:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=R/Q9Y3qFoua
 OmOXVwiSfhelknx48ZpAoMrzIEvig/w0=; b=nb4s+OgE5J4ZFss/fFNP/Tf5kyq
 AQbTe9xsYmqKyUEZUv/M4R5/YlymggEaW76BZCBwH1RVkab8Wx9pgAxrijOg269M
 dWN4MVRTadevZ3TGGd/sA9RWW8sqgRcNYJHhXQGxYZpIbkuMK7MsdebRhWtd6uu6
 vMfF30/hHoWHrqqHNISIwGI+02FqIw3ec0zP6kJj2EI24vDE+I8NZV9OxPBYwb0W
 lqWwCOCCukoeoLptkm5kX75bQ92IaCRsDGisu4p8oujcZ9oiHTYoMacOGz85tvlg
 DvOb8ygJRy0t76Zn2ujhrXKGMk2Q7S1uaOfR7D3eihJ2nXtnj/OXpcBJLdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfhh1y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 17:30:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cb7f9bb86so329044485a.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 09:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794850255; x=1795455055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R/Q9Y3qFouaOmOXVwiSfhelknx48ZpAoMrzIEvig/w0=;
 b=QlYTn5I5wmLPMZHWr5wBT2gVKmoUTKwKSopyx0ELE4HzOGeKzKSZ37Rz43SBHAQNcF
 OFxIeOBvuqVWYVd39Or5/rFdQctgcz2KPQJhppxtkucP+kFFvADwiPdy2cObxvrTATmV
 4yfpqyDmGW9BWvnFWWPSZ658d4G9aYKUjRNIY+FBx+dDYfVjeBhjdCdoFMnbWqmgFhDs
 8L6SZDM+DFIAe9u9c2N/pEOfsrri/wxvxmEE70scoWF4HPmYeA33clY6JvY0eKrpL3O8
 57l4k7Uy+dGfSkZ2erVCyunZShA4McuH2CY2qT/HaFp9S+wFudLKvmJZcNeK7iLj2+80
 Mweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794850255; x=1795455055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=R/Q9Y3qFouaOmOXVwiSfhelknx48ZpAoMrzIEvig/w0=;
 b=dmr6Q0tu47N8fUQ1KGWSbpNZAZ/h27CpFC3G6wxe/rzuYeiR26a5W75lEcaVJC6hoH
 sgs8G4xUOw9IVOXC3KwtqNbN5mM6ppdLDZuRi6a6qwDmV8SN7fhWkJ5PIQGt00O7dBBr
 cjYfpTeqrZuzb9PVol7MywDp7i3i95JoTNmxku53s2L6iXNhIDaGvkK0fcVU3xgoerWr
 3zg/D2YhofKTJaLI1dOu2Gq2tk5Fr/eFSYnrskG5yTKmKuiyziNzJgIUSudRuutkTjQU
 FXb1oKCn6PllFaALJ//HF9udA3u1GiUEho3XYdmZsuXM8HSudYMfFS51HGyvSD4P3xIE
 Lrtg==
X-Gm-Message-State: APuU4Z/yPGDdLic6sZVBqF7/Ug2JS09xKudYvvicYEWXHeAmhb8tHm3u
 I6dYoOxLvPy4bNq4W+BrspiF/84g4lSZAXlCJwGEPzzRVGE0MV+5tasOgVPB8wQcuBvt4NA66yt
 7+PG6iYAcKbIhoQ6lZg5yMIyIMfiZc38Cq1/+zaHE2wwvMnxBYAnLp1X2hA==
X-Gm-Gg: AYBFou3fMnI5yYcmiTRFTc8Yrm3IScYV8Dmkx5hod+AGKS3U+JbyhekVp3+TJAuq0ia
 wIoyDQIVD5dg8j9ihsD88O79Fk9omy/vS//8m6CF5c9lu0P8x9ia1e6pQpTxnwnVyTEp/WGGAUM
 JswIMbuM9OM0rJLikSRJ3WNrdAt0EVIOp0siVKIu9ki9nRAWvirx7W0pPJdWTq/vtS5oNUviags
 3jvHjvuLrKJGGFjzLlLhN+PtWqpwu1E5j+cHNKwyhA2Te1rDhLlEGk5StlP+J35pc19yWz2XsV8
 QSNbYFt0x3Xz8/DeMtzu+FRo84ceUMZ0gU593ZzclGIVgLJurknwEVCxP+S9wBi96hrFcqwLBkb
 T7xkctZ2oL64C17xjjACtb+VsSYTQxevHMNDd+ccWUfSVHL7QZkQ+rbK9V5Hw6T111Ysy143Fhd
 TOw0NwphimKHw=
X-Received: by 2002:a05:620a:6cc5:b0:947:9217:67c8 with SMTP id
 af79cd13be357-9494bb8799fmr1908889885a.72.1794850255379; 
 Mon, 16 Nov 2026 09:30:55 -0800 (PST)
X-Received: by 2002:a05:620a:6cc5:b0:947:9217:67c8 with SMTP id
 af79cd13be357-9494bb8799fmr1908885685a.72.1794850254828; 
 Mon, 16 Nov 2026 09:30:54 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9494c8b5c1dsm898530385a.33.2026.11.16.09.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 09:30:54 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/3] target/riscv/tcg/pmp.c: remove no-op in
 mseccfg_csr_write()
Date: Mon, 16 Nov 2026 14:30:45 -0300
Message-ID: <20261116173047.812886-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116173047.812886-1-daniel.barboza@oss.qualcomm.com>
References: <20261116173047.812886-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afb3dd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WERq1Tg1Nl5IKGfG0e6imA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sd8IT5uBP3HpCvPSugYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OSBTYWx0ZWRfX/MMz8quDy0c0
 Ts03Ns8jQrmOv5o0wx6gOUddG20w1lN3IRRSA59B66vpgb/yi9VKdwePc5PdWExl1dkqU1GgBeH
 hW9eHD2F5joFgfs70bipBN+i22O1ZVg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OSBTYWx0ZWRfX2QhOGzvcTdnQ
 nlYymFtvDyU52sjcmwZtKShmIaqh31WetTO/0Lpz/UuRc0/Bl8iQ28JPjqzDN2gvjClCWiuuo6T
 iLhN+pFHJ5QaNxvGJzJQiHdBg/AGrHUPEC7LF+D/Wc6eQSzKAkKteZV1YgP0lzuGI3w4UYQH8I1
 2pk4xX/ln+bHPyhF/uUoc3kBiffskxUGivOzoEiGsTRV8geaTRu71vFjKLTOuLPjoAsziCcJoi/
 1LDT267ry6VP9h5DokF9omYictGtLk75clJnB9IO04m4a5Ztf4a8TFcO1rzZ5OWHi2TjYLpcoxW
 NlvUO2lfiDTayUihFT55YTssZL99sf/qc4WSthnWEmPKQarJlsbYz1L8NxhHQ4vjHV60Z3+n2lR
 FyWcyj8ul/itcN636Te/XUG8gOpNeid/s06PceSwxKrpFVAuGUHN7rv8oyqT4cD9YCVTo3Luzao
 8UV0MH97oIyAZkNhCag==
X-Proofpoint-ORIG-GUID: A2FrPCmUHB4u-pzkpBw8Ak9ybcobihpK
X-Proofpoint-GUID: A2FrPCmUHB4u-pzkpBw8Ak9ybcobihpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160069
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

This is a no-op:

  val |= (val & MSECCFG_MLPE);

Doing an IOR with 'val' and a bit from 'val' and storing it in 'val'
does nothing. 'val' is unchanged.

If we analyze the commit that introduced it we might have a hint on what
was the original intent of this line (a bit clear ... maybe).  We're
going to rework mseccfg_csr_write() in the next patch though, so instead
of trying to figure it out we'll just remove it.

Fixes: 4923f672e3d7 ("target/riscv: Introduce elp state and enabling controls for zicfilp")
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/pmp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 04df53c234..7b41c628f3 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -712,11 +712,6 @@ void mseccfg_csr_write(CPURISCVState *env, uint64_t val)
         val &= ~(mask);
     }
 
-    /* M-mode forward cfi to be enabled if cfi extension is implemented */
-    if (env_archcpu(env)->cfg.ext_zicfilp) {
-        val |= (val & MSECCFG_MLPE);
-    }
-
     env->mseccfg = val;
 }
 
-- 
2.43.0



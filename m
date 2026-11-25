Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8560606A323
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H1j1zW9+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGovdm5f
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWA4K-0005bA-MB; Wed, 25 Nov 2026 05:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWA4J-0005aE-W2
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 05:17:40 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWA4I-0003B6-8J
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 05:17:39 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9mRqH4131759
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 10:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=7s3e05jPnPpSupK/Fl+yjTI6DjiuviOW5DE
 A007d/Nc=; b=H1j1zW9+D5sEK7yvd7XS9B1DOKxXRNFvYoBCr6lrQiAuIDCvcoG
 3C63lwzVwP4hxC105KCb26pMSxw+x2DSeo440wGfhK3nxcwYSpRrXd3S/0p70/X9
 asl6Js8RsYJGeqllaeO4JHiGWEepN/65eBi5Fxcwfbx8duSg2OOFf5efBBKZ4OWg
 TtjDkK3zuomz9LFC2psQMc0KTp9erBaDaEHaA9UV/czkTYPAAe3bhq47ip+yI3vV
 r9onap+WqVZLEcgVcE/ZN6B1jPFLRXCgEg2hdWRAdrTa0jx2hkiKoUSiNXlvewCM
 NA/mFo94xi+jwezQW37teYBrRRacsjSRK7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrapn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 10:17:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f20addba1so866306085a.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 02:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795601855; x=1796206655; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7s3e05jPnPpSupK/Fl+yjTI6DjiuviOW5DEA007d/Nc=;
 b=jGovdm5fZZfEaYIpYyrCYlKjYoPlEIUN8ZwF5/oNmoTcDDMJJqx27lQHkVAsj3tmL1
 VGtB+VFDwpdvUt6H7OqSP21IYqf/IyNhaT4FScAXt3zrp/FJpixmXrRzi3FvXzB3SsZJ
 P24kVaifY/hqqDMtXrpPwYW19A0DM9v74sedpyKdZqAUUp14PZuYolDnZ0Y6E4wKJpXB
 Efko1XiKiPuXKPvUeHuU9o2SPfD+uVRwZVrdYZLLfQQA+HI3OZ8R8vvwPwBG03AUZj9r
 HedwJNdwDJ4VaPBhym0QOTWUY8nmHA//o63+gD0a3obrlQPQn2IHbQ9wDaHmR24+K3Zp
 bU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795601855; x=1796206655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7s3e05jPnPpSupK/Fl+yjTI6DjiuviOW5DEA007d/Nc=;
 b=UYvD9LgdMGojzJzCt7yHpaFRPUzaELeSdzNKRL21am/LBQWYKWdEaE6NcTDtEoZKMP
 bhW3DjTkWvmfHNSHJt9+CPFZ80b4K+JjwFoLSUBNFofo+x07OrjXPr6+hWCBzbuxyiSW
 mttX4KKVHR0myxwwvQVL7So7q+JRXQAXMH5FGfZm9n1k3uEPw9HYKQM0WBze9S/AKdmv
 JOfluNFYzggfNt/Rdnj0p4B1e3yAUsvquwOLs85DX6ZiD47NVPNhlpks+oj+B2C78wEd
 yzS2iy2FoQvdlmcOvwnkO0YesuBIZXKMKjbbL9zGbchJ/0+CLL2Z0euMSCq7ZWnf1Rtp
 P3Rg==
X-Gm-Message-State: APuU4Z9lvtYxH36VoNgqESqs/BiZCAJxNDtbXW1uFhzImf5PSCem+9R2
 iADFiHwiy6u+PFrdMB8ovA0cfLTT3mgtdHlzBKhxnnTNgYiS5ZFnunMzzG9V3HzjR/ryFBxxNJz
 DFM3S5EIHkgK8hEIzJdsSey9tX3Zr/1h5TLcHVZAg0vQ3QrvIWGw23DbuHg==
X-Gm-Gg: AZFdTZf3RMM9t3uuxdqJqgNkmf7jncATiKGtgxTXpkotkrbdQ1R9d0VR5b0IHzmSC3S
 csPWNc30JtZ1N/EmNrDv9pZ7M2WnuturfVm2YjDzOhi9Crx/iMFIF9mg4ZB5FY2sE8n8OYkXpZ8
 T+zZ8zUePUL8RDTrzhOaxPkuiTEZ9d/dOWf0BaH29DfhwkAqi1cxj52mMDOofyaqo7RnMxs/iaE
 957yH1Kl6PtCWco+kh1eIQUyPCsAE6c5NZjinaVO6mEYdIfr3Z7I9jBhcf4J65LfSHwuzXP1Z+Q
 MbwXnxwhb92d3eEITrVdGmlpzi4I5u1OZyGJpAPFAiBkqqO5qZ7wzNC5f5ehKCeAMUowhtTleWO
 uDXzmxfxh9u3fjH9EZ3gXiDso+se8u5alLUrrrcJQohpzgwXDXiCU4ZR7UeMKM1FnUKas5KtFBF
 tUQwX8pxYuCw==
X-Received: by 2002:a05:620a:3722:b0:949:472f:226e with SMTP id
 af79cd13be357-949bab15455mr3373524385a.71.1795601855418; 
 Wed, 25 Nov 2026 02:17:35 -0800 (PST)
X-Received: by 2002:a05:620a:3722:b0:949:472f:226e with SMTP id
 af79cd13be357-949bab15455mr3373520785a.71.1795601854905; 
 Wed, 25 Nov 2026 02:17:34 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb34ad6dsm1280811085a.12.2026.11.25.02.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 02:17:34 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v3 0/1] target/riscv: avoid amocas.* x0 clobbering
Date: Wed, 25 Nov 2026 07:17:29 -0300
Message-ID: <20261125101730.228914-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b5c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5YhHKsphd0Gvzk42CI0A:9 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Mafi2m2IIDIpbb7GBFqyoFjKH6Z3VKGK
X-Proofpoint-ORIG-GUID: Mafi2m2IIDIpbb7GBFqyoFjKH6Z3VKGK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX1lf8JoleCYkD
 B4CfOgGyslON21wr6SJZ3tMWiQ6mArEIL7KNuvxw16IZNebKzCI4+6hfHR55a2xXBhAbeednmie
 aHAj8POU16IRyEl4uJZyFUkRR5vLTbY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX6NFCAg9HemMr
 ShuNEHxIoy4jBiLFw6/eUVOOFN/jMsxfebRB/E4tBJu29uzq1iIQCpCyWIakEcslSkSRUwuxZue
 /QPEfpeyfG0w0GDtNwNCMDUDa4Ft2bbEISIxsAVzu6NVsUd8L8bdaJNXpa4YmqjMjluhvOGa6XZ
 IDdGZyL+8lo5OZcy6GszLzeO2o1aeQ5XuVURUOlZykhqn1x6Q/GUL34RuNCWYbDGwLphsZ07mOk
 NZPS7cRnp5OBnZIqq7w1w5qk4/XXX7XmsYcZ1PNCiIZ2+o8FMeGGcoe3BfRqB609XyU6d/s1fqA
 /hJqRrgXB6EQOfsec1A1RQmG253nJMiE1haDjejCqaIiT5QhWpmAZ+oIzQV5js19HiDEHSF71jB
 WG46wZnE7JPbNc47nW3RALp2HP+1reaI97N2eEGjaruabKEYaeSYRGPmeKJSK3t/muBtUO5Alqf
 VZS/j1E6U7euZg+e5Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This is the same as v2 but rebased with alistair/riscv-to-apply.next.
No other changes made.


Changes in v3:
- rebased with alistair/riscv-to-apply.next
- v2 link: https://lore.kernel.org/qemu-devel/20261112125307.485690-1-daniel.barboza@oss.qualcomm.com/ 


Daniel Henrique Barboza (1):
  target/riscv: avoid amocas.* x0 clobbering

 .../riscv/tcg/insn_trans/trans_rvzacas.c.inc  | 15 ++++--
 target/riscv/tcg/translate.c                  |  5 +-
 tests/tcg/riscv64/system/meson.build          |  7 +++
 tests/tcg/riscv64/test-amocas-x0.S            | 49 +++++++++++++++++++
 4 files changed, 69 insertions(+), 7 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-amocas-x0.S

-- 
2.43.0



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C8606A32A
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T0jCkbb7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jERPfvUp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR2Ht-0001vP-Pd; Wed, 11 Nov 2026 01:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2Hp-0001tc-UB
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:58:26 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2Ho-0007u3-3P
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:58:25 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5LVni1345293
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PRXOSpARm0saCp+f+u9zQS
 VUjEZiT8BBK+1N7lxLNdM=; b=T0jCkbb74IvLhhb+eN2qvfHnIPVqWGkrbU45g4
 Mm7RgThEdqrJ4n0CTzEmK1l5p1vrjzbvEP3p95IG3l2J8tB/L9Ddf3dQBBMZYSoU
 EMQtG130kbGwKMMZFHQ42V94Gd0RM2cry0aPhw4BQ9zdMYkI51XLsKW4dUPg3EuO
 UDdJWUs1EtEnRg2VrGRvBMqkOwjzwzxfnPnkxvJ/h0NBKrAQtLoDb5f75foLdYdb
 xBEGjUhAYQkUhHWArACbMfzfCRRcW2vbVIKKJJfJ+wi6+IYOSqQdCWMIJYsPUDKs
 G8m9+8TEtgl+vrcNk85ZqDkdrjKAB5PIDBiMaKIIHgetOoaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufvs35-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:58:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f62934ef6so659648785a.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 22:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794380301; x=1794985101; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PRXOSpARm0saCp+f+u9zQSVUjEZiT8BBK+1N7lxLNdM=;
 b=jERPfvUp2RCHc1odjoDp+WB4K3Vyu7QBf0kXjldwkNACCNebeDTj3S3LIOP2YGTvog
 /6Vl0vUlJ7Mytcp/oD1L2kxEvwxBChOgDMuGpTILHirOe+/N1cbPr4/1jiWjl7x3ZGy3
 B6xC6L7OqU34QuNu4XAH+aNE2g4WNcVUSHtfHMR4QnEnVEg/yCXaStyMJO5xuog7Uwr7
 2KnL2ckfNrmJZ3YsYRE7SCnjSGr5KotCwFxdGKOvF3Y8jmq6BJun2WUvnXIdDHul3/X8
 gtyTEIl6GPJZpqAvkin1RXVzIfa588CTGwbTfJXfmAzQhsype8uoyozP80ukq2VYiI8J
 Uypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794380301; x=1794985101;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PRXOSpARm0saCp+f+u9zQSVUjEZiT8BBK+1N7lxLNdM=;
 b=ZvgKimj7WuuKdg9cusmZ7U0aDMxQtMVgk0yNtExVmG4I8YNOERznTGd+S1rHfceZr/
 hCKMxigptrZKhrSzL7bM/Kc6oZFsBfjf7VMlNH4kjtduXNnD9FEk5K5Ds1ghA/8cnLO9
 ZvyImyWFo1x0MaNhpy6qbXi3rEUQiReA8kGIm4y3oIRC9cFkM/A+BKOh60tdRVqsKhnb
 Ps47+Du3EqA1/Vl1U3BcXRVsYQ3DxNB8TmcozeWBVHrbayiyMoTLN4fMyoGf6AUMkL5D
 CBFxo0falxdE82JcO8Rdld5GyiMRQluGDBBsouuMDxaOLm1KRQuYi0nV1+nxsBqoBWqM
 F71w==
X-Gm-Message-State: APuU4Z+92U3Q/ugj7SApmDAdfRAM7zp0uC3RCAOc/Ln4C7LEzGNME0Ts
 PqyfX6blluhlE6WQAi74/i3ecE0JnLZCX6aurPXu3V85RQQPUV+uoiNyBKW/P14dJZEslSnb1jc
 lGghdNgCq7CBybu4r73RP3YayAvpgIJf3YiMz+W24YYvP7VLmPk1If8AnhQ==
X-Gm-Gg: AYBFou2w4mGYSojlAkon0qjY3kqT7KsLFaJcy8UEqG+rDWmYT9fXrCX3z73TwJiVBpo
 OaX6jtBdM+Br9hYv82FQd+a1UpKpcT9vLGWZa2Ict9RtWQpW7IRiA+RKhMl61bcmer7zIhFNhzZ
 PXENKMxPSQ17rNY/ohbZ22aALcmqH8Ckn61A8C2SqXbKDq59IrA1dtYUVXpcA4wtJS9E8vaVWHG
 cZycM3YN3pYO/QlsV/kID7MfqZBaSp+GMHSGhcggbPVBWEhz9V+pVz1O7QmAKeX/qfxtqEdxd/6
 3fw22H9QZFOFD1RPvGfJ8WGu1xK+w3eHX3HHHXWFFcyHyH1Q7gfwnLEYNyQEVucRiwEZHy77EnZ
 0q7Ro1dHSrBBr7UhQPXp8EmvE9IZtPReDySnRu0dbMD6YKfbvkyZRH4ID15A5/qifYyyIWY3CCI
 um05KiCrB0IKw=
X-Received: by 2002:a05:620a:271b:b0:947:8344:17a7 with SMTP id
 af79cd13be357-947afcd6addmr212858985a.11.1794380300829; 
 Tue, 10 Nov 2026 22:58:20 -0800 (PST)
X-Received: by 2002:a05:620a:271b:b0:947:8344:17a7 with SMTP id
 af79cd13be357-947afcd6addmr212857085a.11.1794380300389; 
 Tue, 10 Nov 2026 22:58:20 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e734698sm424919385a.13.2026.11.10.22.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 22:58:19 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 philmd@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v5 0/2] target/riscv: raise access fault for Zicbom MMIO-like
 accesses
Date: Wed, 11 Nov 2026 03:58:13 -0300
Message-ID: <20261111065815.167869-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1WRC3dZWMFOIAHKqQID8Ta9MoKSYwwU3
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af4120e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=76F0wDgyi296CdbU-VoA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 1WRC3dZWMFOIAHKqQID8Ta9MoKSYwwU3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyNyBTYWx0ZWRfXx4daMB+furTB
 N3F+8zcBs1IJwkEVymxyPArJJSNonkyk+UZhMyifHD6HaO+PAC5Z8+ymlXk2Dh5nl2lRYhpxdhX
 8hfayOjt0tlL64/4/BauoDqFe/BPKmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyNyBTYWx0ZWRfX/B6siTp2WIP3
 0oEyPfsSLP/HunIhg6tzh4NvaTzqSFMvNsvNjXZg0cuUq2av4AtqsX8GFFNvLlAv7oXI/CFWAaS
 ql+xiCX8ThPQnVy7bs7CpU/y4Z1d6SV1dxfbl8ldUhyJYUA0kHBFzBjPp0eal00+7yDH82KCyYp
 fSFZpfNE2X9iJJgFDNjUpBGOTjqqkAFyddRGSObh6z9TE5mZcC9x7VKqilgTTpnIQYmYrj8ADau
 jJewWvjYHVBqljw2fxGsf93q0JzjQGBY7FT4y+4R/4J4O6KVZ8mBsntb/TJaqEcKot58q8AgoeR
 g5ah9aqTUwm9AZKu910Kyp8mic2FeSp92+0FXUwGFMNj3oQctLYjZD09xuL0dwIZ4vSNRk8ifaf
 nORUu9D1Rpq1G1zAuylskUUS6Cfg35MIvgFSkxvutmE9nYN2BekUMnd8dud53rWCnP+kJIezncl
 24CFPTlThthPsUO+adQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110027
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

In this v5 a 'Fixes' tag in the commit msg of patch 2 was added.  This
was detected by Sashiko.

No other changes made.

Changes in v5:
- patch 2:
  - added "Fixes" tag in commit msg
- v4 link: https://lore.kernel.org/qemu-devel/20261110212312.56809-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (1):
  target/riscv/tcg/op_helper: avoid env_archcpu() to access
    cbom_blocksize

ZhengXiang Qin (1):
  target/riscv: raise access fault for Zicbom MMIO-like accesses

 target/riscv/tcg/op_helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.43.0



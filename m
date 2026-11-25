Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49665606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfKivzVm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnlPehHy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xW9SY-0002yw-Nb; Wed, 25 Nov 2026 04:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xW9SV-0002xu-Dn
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 04:38:35 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xW9SP-0005Jz-Rr
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 04:38:32 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP68SHf3534084
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=aP2WhLKUTUQM2WIjGhOOjXahzbHH4gFYsFi
 NDi0WfVw=; b=cfKivzVm3kaLqcSQQsWlq865Y3ZvviVcjzVOlLSnwbXy0FJUus8
 7WYFHDEYAE5LQiH81ZmPeq/mBKVgmSgzFB23m97yAdCpsVeFVDWdD02ZnYVi4CoZ
 uepu5ZMyWGnAND7AbBpp6rwyjHzXsTRrAy9hqiFK1jYJSYaVd7FTok22AL9+ns+Y
 gQOuK/BEC8Z1pQ/vTbORBRGQ2YO1LcA4GcLepLTwC/PBuVNMnlmO6Rq5I1IU4wAV
 z2hDhCqaclBzuuggvn54Ubx9p9bOBJsn/YL56mA7bG3OcdFNOj4Ahw5o2E7+c3c2
 U3a44ZlHnCVr+9Zqvb/sZwKvGoXqAqLRKeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj2yw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 09:38:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-94960131b4eso145378085a.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 01:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795599507; x=1796204307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=aP2WhLKUTUQM2WIjGhOOjXahzbHH4gFYsFiNDi0WfVw=;
 b=OnlPehHyDe5QskooY6KPePx7ZNZgdiddJakeI50US6nY2bUqYWM+DoVbfQoBLR8XmL
 Uo5fU8/ElM9BK4MKvlnaZ68UsCLgPK0tki+AthtTcRCVcRhvgpwWgNbyDPsBlv3Bwaah
 tUx/y9lk1rt7cF/zADxZ38Sf/Mrt8HUvlJZZmS0i+dcuM2cB0h8pnKyrNgi9XkvNUahj
 yv8dRMypadernVTFyTF6LrES1wXxhNf3p0hUWF05mt1UUaVshtBMbWu8OExfKemqwdQb
 /87ztamD0uwl9Qnot4M8pymH4Snav4vgs2eFvckNewyupSk46XNQHtkia6Ex2OCHkZlW
 pCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795599507; x=1796204307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aP2WhLKUTUQM2WIjGhOOjXahzbHH4gFYsFiNDi0WfVw=;
 b=at4Ceowi5KK3JOcyFFLYRvMOguUl23+23uZ2oTq3wgYx14dIv+Dix6M9uuKBIHPHHi
 NJnObHR47aaIHFWjAr564PIB4avB5Vg0kw4E/tmCMTyVvrmTf6WYaNvD/F91mvJOn0JH
 4COLt49BOmK4/I7dIfbFFPZB58J095lBgEkk0zr+Z4fIQ6rfdqu/ky9sgqqcyVlmtXtm
 uCaiQGERar9eVg1JqVne5v6PU/mUn8fB6C3ge/HHRx5zhTLgAQV+hy965Xq4fQJ2EDVF
 kKfFq+SD5P3taIGEB4mKHG2MWn1VPnw83iOIVtN3p3gl/Pmf55bpagfHvY0hez340xM7
 VPbQ==
X-Gm-Message-State: APuU4Z/WvrlUU8XvQFQlMfANdeMsBGMUln5M1ktAEielE8CfaAxUntPX
 qCyknl+I/XfT40Iccnjg/71k08+yGQydH2cLTzc3FMVoYo/qjdeC6Mos4m8hDI2l97CNVEoOIOM
 JwDaxeoN7gNRArH7KrRzVj2R7ASy241mfDtSaLOPHpwp3whjANPUaFrs/mw==
X-Gm-Gg: AZFdTZfhNtD6Ba36ksMLjlyQ0cxnLLMAX5aTExYYqBRUT93MXDnZaPdJoSPA+kNDNEN
 N2quU0+rYvXuYYUXiRw+uTM/k92OAHJVmwl4rfnE+Pk27Wg5Hn6P2eWPuLxJKM/hWVIiBF4V+l4
 pffx/rxJUNXJQnRywImn/E/NY66tvZl8JAKFA+iXjxGHj+igdv+CokjN/xOKvyzKY+4j4ToCDcr
 ENWOyGK54W8fkN7frsOlTgA8ySPGyZQ/oN3JYeJ/gOIrL2MQGWcpNEeZZsB23ofHmI6nLGFjiCC
 9kjTyHrRMEmHQCigiCt5aq8c9pymvak5BuRUY/KQcQzewy1lJjas8lJpEoz08SprBIzeC2iGLwx
 YHU89CyvLtH5EwK9N9GeOgXMriKFiMgHmDF6iob+XgJooy7/xMFewRNCEU1pUgvDbM9uMRKT6K2
 uZTvWEdKivxQ==
X-Received: by 2002:a05:620a:2906:b0:93e:5eaf:dd87 with SMTP id
 af79cd13be357-949bab54b88mr3068311385a.62.1795599507309; 
 Wed, 25 Nov 2026 01:38:27 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:93e:5eaf:dd87 with SMTP id
 af79cd13be357-949bab54b88mr3068307785a.62.1795599506832; 
 Wed, 25 Nov 2026 01:38:26 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb3f2de5sm1257212585a.29.2026.11.25.01.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 01:38:26 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v3 0/1] target/riscv: do not write SXL < UXL
Date: Wed, 25 Nov 2026 06:38:21 -0300
Message-ID: <20261125093822.228611-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX9l01MCJ0+YuE
 TfqYZ56FRLiawqu2TDNuOtPP7QajzHcy4tlaiK1i2/y4y+h57PS0M0HNO8eaTvYOgvh9oiENX9J
 pAtrDPrfWwYSj5oMtBqfTxShSsa3DtI=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06ac94 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mMd-UP4esFFwHtkMSWUA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX8AHlpUIz2+K7
 VUP9fyRi9J3fot0BclnTtqBrZVdIsWtc+6uOACUUW62s9W3H6DtWxq75IJlwAomhva3MfB1FhHQ
 BMmP59kEfp8l96Df1dNXzHet+9xtnw+i+SCdwQ6/GOeqqKDUPFPjqnrzhTaJZXSqEU90FwMyLTk
 c91nvvX/flbSe36ou7mD9wizsXo+a2svYoyZoFzVj+7Tn2LEC92stqEOJHEQh3rk0XXSCBEJb52
 f8wVZN7xLYTXSAdRhVzGq4A3Rr4B2C1dIISNLrImVe0lF0jfNg9OMOfDUx9qVtVM4YY063Ny8M5
 FfMJe2K5Y1/6uBk2/7LYJa+6gB7uu14Om3ax8uSW0cLzDbNiOQn7X5o1Pg4c1QpSkPeNfCPkESY
 HYAvo8h6Mdx41b9q8F4Tx+YTOJkku3aeY0KJmxIrJ3+E2XseGwYPtCIsBvpsvLWEPhOxuyV9RyT
 NkV0cJzufH7asaXFUag==
X-Proofpoint-ORIG-GUID: Uiy3BNIZ8MEGMzZi37tX4vzlAyYvDU-C
X-Proofpoint-GUID: Uiy3BNIZ8MEGMzZi37tX4vzlAyYvDU-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

In this version we're adding a comment in riscv_update_xl_field()
explaining the intended use of the 'min_field_val' argument.  We also
took the chance of fixing a conflict with the
alistair/riscv-to-apply.next branch.  

No other changes made.  Patch based on alistair/riscv-to-apply.next.

Changes in v3:
- added 'min_field_val' intended use comment in riscv_update_xl_field();
- rebased on top of alistair/riscv-to-apply.next.
- v2 link: https://lore.kernel.org/qemu-devel/20261119124141.1279663-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (1):
  target/riscv: do not write SXL < UXL

 target/riscv/tcg/csr.c               | 47 +++++++++++++++-------
 tests/tcg/riscv64/system/meson.build |  7 ++++
 tests/tcg/riscv64/test-uxl-sxl.S     | 59 ++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+), 14 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-uxl-sxl.S

-- 
2.43.0



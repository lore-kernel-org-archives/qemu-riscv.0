Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A6606A320
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 07:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lP7nKSMh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmTfkwPh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR2PQ-000628-NN; Wed, 11 Nov 2026 02:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2PL-0005zb-18
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 02:06:11 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2PJ-000290-2l
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 02:06:10 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5KB2V1408982
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 07:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=+ngUNJz1Af2o5DkRz/y7ogTZDMGnTrouMSY
 MwaAlZDU=; b=lP7nKSMhQDx+fMzncMdAKrSTZZnFHXJUWcOS6Hx3cuiHxRtV76e
 CHew2JWADOcVAyc8HKYBxCNrvLwQcQFObiJqLrgDp+SEG8UzVNVzK3M2DwZ6+wAd
 pBInLTvKlUBqFS6JICezu6oyaVpta1CS+foiSuq5k4bWLMFAy4quY/v2M4LtajeE
 pOgDsBCrBWRU9Jv9UNY9hl8Y0FtyWBSsqtnEtghTDJIf6q6x0BJjSdnPTjGPJ+4/
 L3cSgpcA9f5ZbC8oBvb1T+vSX1+qVm8uDo4Q50asRC2x7kmlrI7p/oN1Wfuhi8hJ
 2PiqoUI6QmelJSfNXfXSpO+twcl7hFiQirQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdgpf5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 07:06:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93e92aad34aso703088685a.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 23:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794380766; x=1794985566; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+ngUNJz1Af2o5DkRz/y7ogTZDMGnTrouMSYMwaAlZDU=;
 b=hmTfkwPhTVhDaeOuDVI5hvnYbi6k1AtrTagvZX2eMNbGhLC98VqFr6UN9PxLT5RhIO
 1y6eTnGplVdnfdlLVbnskN0GWRhg+jetgKA307MovQfDB/sGTJVHFqHB4CH5iLlSNmJ6
 TCWewFwJtlZl13BTnl2ddf89XRhUm1J9/Rdr8C82laVTMZw8ko43EEAAm+VERsfGInX6
 5uGE5TqcrOTFzz4dtlKAjXK2+8dVCrqJR2w+yDdh13II1YdJy17rnVTtWdCOD/vVSpTw
 /0RLFjzKANHX25q7ok3FFvFu7ZCDgiipX1OU6tGrZHdTOl2iUeW8SzUUR3v7BIKb5LVi
 lxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794380766; x=1794985566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+ngUNJz1Af2o5DkRz/y7ogTZDMGnTrouMSYMwaAlZDU=;
 b=NNidu8moOlli9Be7bLtKX08eDiDK37ZQ6WZCESfg3mMLWrODa+/YU/eUXg6qk2BSpv
 o58ZGIkqXlBSrHF+hRO/LnsHu0tjWo5nS7IywiQLxefu7z3pSwEtZB6mldAGGUsve+R6
 wcJgGbyhp6Z5/nkEwnHxMm3NhSq4tp8NgOJgPYAZH3E+mcJRD9tr3Qz/x8MCW0VJsJHV
 BVSKU17qFniakRwle5BLcVjlXxjtaKlvRQjv197KE00Z5DF5MsgeTUpIDartZ3UzJvqU
 dw7ULyVly3H55+Ry/8sVNGBiP6SZsVjfRkUqlZ47/aceRxMc61gGGAf7PmP2RtsCcqKd
 ySwA==
X-Gm-Message-State: APuU4Z+ljH6WvrQCoUrpdrdl2TAJO7VZ4Vip7XvtmW2hN3yf6j+sEvHr
 bLfcG1CZ/w/J/LksAq72nchGqENTK/S2Q+tdyFZHBRrUE9cLwT5k9+VC5FSGX6euvd7ZwjA6BpF
 s/Td0+G6Bq/zSXOeUN1VDP6tzeafOanKRHwqin6o/jRGiwXQxVnkKwIGmhw==
X-Gm-Gg: AYBFou2SvnstqD7Jk9Bj4hM9aneNkIXBKgbeExyP48Y8xCMF1XRW/vgqAuvJXOSisFk
 j6amOfCBfdg922z8w//6mK/1SEA/ammXUJj0NygYG8n/lNTrjbmCHH9zX4lyuAGW6G3rFdqfrjB
 3PqSMzQXszt2QgAeJtYMcFYBx5CWlNqgMOKAXuX1NJZEtYDLxDf2Efhd/EUgnclOrjjtjxPcIP5
 OU3qJvQaYzWNxzk1NtzLkg2xf1ghz5uRp3yLwDEOcZ+xjSkNfuuxurlPPOlEJJVzS9h+N6lYe1w
 3wfLkE+e19THJ+qPs08b0pMoq1pGO13QO9EDCGQrah2iJBzjId1Cpowi28SxIe1cDRGAKZK57/d
 dpv0z6BXHo4rc+a2Q7Dptxxw/SXOfhreaYS7k3y7rbrQd1m1vwNiWU4A43Wr7yyoPQtI7+G4ToH
 Uqjt994QfssYs=
X-Received: by 2002:a05:620a:258b:b0:947:8f05:39fe with SMTP id
 af79cd13be357-947b00a92fcmr203720985a.77.1794380766106; 
 Tue, 10 Nov 2026 23:06:06 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:947:8f05:39fe with SMTP id
 af79cd13be357-947b00a92fcmr203717885a.77.1794380765555; 
 Tue, 10 Nov 2026 23:06:05 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e4fa312sm419911385a.0.2026.11.10.23.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 23:06:03 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 0/1] target/riscv/tcg: clear itrigger_enabled during
 trigger_reset_hold()
Date: Wed, 11 Nov 2026 04:05:59 -0300
Message-ID: <20261111070600.169519-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af413df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Yr0rI23_fJXgV-w7aHEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: EdO4I_tkqQiGCYNgwhhVv1kPs1miM20d
X-Proofpoint-GUID: EdO4I_tkqQiGCYNgwhhVv1kPs1miM20d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfXyR37yyJepTzx
 ysKQhnUMrAajJzRYMxAJ6oe3AXE/OjJCdIz8WVDkoqV6gLfzH78HFKVVqbfVVH9jgFHg2FNw1al
 6q55/xmAA5W+2XNDvEERJiOFAAgcBXapO732uQ8pJlNS536BhWXajGJRriMmnJqoMtebbjw2BGy
 rZs9ZaZIxd+YIzHEMBOgcSRzeWG6zY9i8QHLEKMDiLwnv5FJXW39pk18w74w9y/afj6+DfS/lLA
 U6q5+3JewYy1KGwdlP3OFh/mhhYDQZOooXkdWWv5BWIWgOzRqaHl0Ugw16FzvW7hD61z5XQS5h8
 U8AhiHvZOpXDTu/ecH+I4Ff2rK2Dp4dDnCnXRGvxjNUm8OYOoFXexQiUotfUKwHqfs4eT/F1AKX
 1mpqqgDUkCj3xjlqApkAkojr53Ioyv+iZKdXbPwfGURW06zoO5DCW18dCFHkVUxSo2RyOHYel0R
 vbkFjV6R/LBe6A3SokA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX7lTA50AiSnan
 VTknLLznAmEERmsheRDvnZKBc7RqGgDWq5+FZoP8S+gb/t/uqG14TZVx028SNKmRdP7bsSChfc4
 5HZk7V29ZYFGGZsaVZuinvktTHW9euw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110028
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

This version just changes the "Fixes" tag in the commit msg.  Sashiko pointed out
that it pointed out the wrong commit in v1.

No other changes made.

Changes in v2:
- changed "Fixes" tag in commit msg
- v1 link: https://lore.kernel.org/qemu-devel/20261110195023.20927-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (1):
  target/riscv/tcg: clear itrigger_enabled during trigger_reset_hold()

 target/riscv/tcg/debug.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.43.0



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32BA606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a/Q6304F;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=axzO6KU9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTd0v-0008Tt-FY; Wed, 18 Nov 2026 05:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTd0p-0008SX-M1
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 05:35:36 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTd0o-0006fE-6E
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 05:35:35 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AI9k8NO2398689
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 10:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ypdhkdwKC8DgCDS/9fQOGZHJu/+mCUBCspr
 hI3cFoO0=; b=a/Q6304FrWoijfLAIRH1JwRPo3FUxFghwRiBI5KYKYeBcxcCD+u
 mi+RQrNpzUr9M8z9TNUA8+UtV0ofXqQx1KW5viZUpmLs7AybUVWF4NW6nRVRfk+7
 jQG1cToBH73rRNFnnHWr4N0pKz4ETfkaeKT5mZAjaN/2Ta0Nv807dA3qfHgzTgM4
 y5wayb2P7cBXTpZt7Rj5l7nwXAh659yOv4aTd/KfJfSA8x3ZfGyMHYtrN328NrKD
 FTlRIyGT8GWK7N5eyV71iTtA/3ZZPH1O/1OgHgehfTzlVRe/BkAVZCrmR2mTGyNB
 CGpgu5aCVZsEGqTlBLcYT97YASwZngowoAQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92kdp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 10:35:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-55bc8181defso16477861cf.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 02:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794998131; x=1795602931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ypdhkdwKC8DgCDS/9fQOGZHJu/+mCUBCsprhI3cFoO0=;
 b=axzO6KU9T7AvExS9/XqWcu5vyg3hz6wYJzni0RBIoh5e5OoBVvOiAD+cCgM+WzkrYS
 zUeZeO8l1yH6qGT3JpKBn4Dqoty19ElBtF6kNRX1m8V8fiIFYofcH6xxMG4l+H2SxXC9
 Ff5wd9XY7c9fFRn/WZi1r1cCzVtBOZnB3olFxOqSHaDRB5wxcqjURguia4zQ5cDow78V
 Asnoey4hsuZlvlcMGR31m0relwuKE7UXJl/iYbGwjN3HvKLnYJlBWOLRJdL9pNYhGTq/
 9FU+RtM+/z0eFEFtWHhJTsvgGammr5+CKdnYMfgzNofbMG9eFweKePgcvjngZpKvPxOa
 wwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794998131; x=1795602931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ypdhkdwKC8DgCDS/9fQOGZHJu/+mCUBCsprhI3cFoO0=;
 b=QWu27lYPne6ZjGET55DKo+JGj+e+ydQs6IJKYAdRlp6ZXOFltxmR5jkqkhcy/S0wOO
 h+kqCVHGMD+zENnXlSVtcoXY0m5yuUOTL6o39c57JwxZnkgoFtKFiEXNwzeFsQUvNNj/
 7JDy9QH0DTWeqKSOsrSCkeDDECpatTkirJBbN1opV1OSL3fe0ybi9459bR9a3CWmEuD5
 NJkYEcYp3/CcQC38oI5dHIkABoz0Ne6YczDgkr+B487U8cBclJ5RZm0cNM2Cy4kPUpQG
 mZ/v3x473Yv4Uu1Zdt2QIqdqE39ZvVgLp3tse8agcWIiW8rd4TyG/fUcNmD5bH95JFaP
 IPjA==
X-Gm-Message-State: APuU4Z/svk9Y/bz0dz7yvA/8AU+nnHFgJLrMxb3fo+h4bnQUArFHqemL
 Ehrpqr28DPpMg+FgKscupnb8J4e7A0tm+/IwDav5KyOWYdSqVGZVvttQt2bWGKseLqTuYy0v2xy
 YcA1D8gv3eRVZIt98SQZWkYnH3HUiYhKjlIIpg1mOCmLKCJ32ZLMa+1yh+w==
X-Gm-Gg: AYBFou3JolonIsh3YuThqF/rfmWcFv2+Ojc0WEcwmfhN8NGH2jjbNpWW+2/f50J8YFg
 hOjKXTjjPLQPFp0baa8dgkwgAMhXREIS/H2eOuL4SpuV4LIGDdhMySZCYHItCFfuCcLPRyHc/MW
 GW27wVaKL0cC7ai2fdONOm1XCKutm4bRS0KXiqTwlUToH4t27apqS7UkOh37Y7ULTQl7s2CwUEt
 V6nxDF0dagPSey+sCtm07RxW+47d7XlaX9LbPYr+HwDieIcf9nXVPSx/HbkfONq2rBhYAhnWA0F
 2SWuXje5QM/LbLZLPw5xwj4RG4ZZ1NAVXmH1bPF1//RS3MTnjIZRCMKvFDshBWdzqg5itS4ctmk
 /upomAWpVHR4dIg7EPkkb+zJjSiqblYFanwSoFqUaoy/2os6hyHjmiSMW2DmCDOXbm9CqxhaaLB
 +SN1jMFx75700=
X-Received: by 2002:ac8:5d8a:0:b0:537:af9b:c73 with SMTP id
 d75a77b69052e-55d5a77052cmr30190461cf.55.1794998130704; 
 Wed, 18 Nov 2026 02:35:30 -0800 (PST)
X-Received: by 2002:ac8:5d8a:0:b0:537:af9b:c73 with SMTP id
 d75a77b69052e-55d5a77052cmr30190181cf.55.1794998130094; 
 Wed, 18 Nov 2026 02:35:30 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d59102ed1sm18927991cf.28.2026.11.18.02.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 02:35:29 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 0/2] target/riscv: rv32/mstatush related fixes [GL4488, GL4827]
Date: Wed, 18 Nov 2026 07:35:23 -0300
Message-ID: <20261118103525.1192249-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfXwj76AiUCoxKS
 5wCsOXtsUMi0j8GF7FvxNsI1pjwRsQ9UVhyP0V4jmQh8eLJTjaQxg49SBI8zCa7Y8oFgF7Jciva
 h4IXl40KGFZxyxzyVKncLUVyle5oqRu58fIFHPbsIM3Oh+Xa0eEx5eLnmWxsF/IRyYuClZuAvIJ
 2M+tRn6QpLfnfM2pEKo6Y5O5dqRXcF4iAUygEypG9f7ebnA7iu0ublZBwzuj8ZECGrJ7B2UbbKg
 74I+9D5Tdk+9vqL+UX1laFiZ/D8CwuCa/L5aFFnZJNx45exrz79XNfxJdUPCHerT1yC17vaG9kj
 gapNht6SUhyZQfG0ENOPj3Y+6qHbcqva4pzrt4/PYHi0rnN8FXkJ95YjhvvjjYWgg7sQ7QuRB/d
 HX7g4zdfEvknH0U3pngcivV/zwW9+IXO39g95hbBJoR2WrbrRSwkfpZgqW95+gx8xbaNGtZDZ+9
 WwmbXR80ftUe2vbkdjQ==
X-Proofpoint-GUID: Te0193EsftaWcn8vTemeAPuJ2G5usXet
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX1DuXRO4fANVe
 VhRQkmDaSFoAghzM9cZ+Pom2YySe9z/RHmmfyuBpMWW/AP6y1ZOxxl2WnMvuj2NN08K+oT3omvb
 S+bjmx6X+oSVYmdnXEx8PRfiqUlW8hY=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd7f73 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WERq1Tg1Nl5IKGfG0e6imA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=cMPHqgs9ch93h2pu8XgA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Te0193EsftaWcn8vTemeAPuJ2G5usXet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180041
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

While looking at Gitlab 4827 I noticed that part of the fix was being
done by the Gitlab 4488 patch.  Instead of marking one patch as
dependent of the other I decided to wrap them up in a patch series for
easier review/merge.

Patches based on master.

Daniel Henrique Barboza (2):
  target/riscv: do not clear mstatush after mstatus write [GL4488]
  target/riscv: clear mstatus.MIE if mstatush.MDT is set [GL4827]

 target/riscv/tcg/csr.c                    | 31 +++++++++++-
 tests/tcg/riscv32/system/meson.build      | 14 ++++++
 tests/tcg/riscv32/test-mstatush-clear.S   | 57 +++++++++++++++++++++++
 tests/tcg/riscv32/test-mstatush-mdt-mie.S | 55 ++++++++++++++++++++++
 4 files changed, 155 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv32/test-mstatush-clear.S
 create mode 100644 tests/tcg/riscv32/test-mstatush-mdt-mie.S

-- 
2.43.0



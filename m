Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADE5C43327
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 20:37:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfO98-0003ey-3H; Thu, 02 Jul 2026 16:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfO96-0003df-2Q
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 16:36:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfO94-0006i1-B7
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 16:36:27 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662IutQg1397045
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 20:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=B+dqtRSj2X+Zvm9EUvR7J+Z7icE4L3mxio1
 ULCnQGk8=; b=CV3hDM0TloMM/116tVIQGHyI3S8pJUD5sYBVC0LyQOJhOB3Wp4e
 KhXqRjYN8vVxab7cZ9u1/kN5qkrfA7D6MXgtCUfaLpTlKkzk1QD6a7sYEmQ1nphA
 /WgVelvq8wYEZMvPaoOWFlp+YpRMW0Xxs+o2tMbE5Q9BUMKc7eiVWrh1qGAtTY+V
 m+MtWigncrzm508VMGiS2Py/maqHlHqdURz6JJUYEqr+c5FA326MB15P0bcOtReg
 CzQpyKshMNlOoCL5yLQPPv14MmHWWPuAL8UT/6ynxP2BmQvSeFKLaBKaHgRy4UMi
 Kmgknnru2dYpFFu/OxrZwDi+Zj2+wziZzpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwtvn7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 20:36:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-915c364ae3bso239182585a.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783024583; x=1783629383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B+dqtRSj2X+Zvm9EUvR7J+Z7icE4L3mxio1ULCnQGk8=;
 b=GN05UmZ1/qkCS1jrGqhQclSU3PGic2XJB5Sz2poqQbquzuDV4hhdhYwd03chsPQlT1
 oG0SDKISaN+qf991nV/Jrzo+rxcpeEktImN+mOdd7w7ldPlCjLa5/V3PBOTwW5XRTFSQ
 2TeBj2ublwst66+Cs3sm07tkQevh+6GWnMfMj5U5GpTFK9x638niNBpXn2OA5DRB+cYt
 wmRVMXq8v6ClJqj/lLDFv7y3KAZza6EOvk5Sq8Q//XRMypkbNlolhjw6Mez79szIQz2Y
 VsmVO5ceoTvwo5L7uzhu9ju5JeJ8gW9jBCII7BZTlwvtg7re3+Bz2Rz8EX5jEgtJ1xgF
 No+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783024583; x=1783629383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+dqtRSj2X+Zvm9EUvR7J+Z7icE4L3mxio1ULCnQGk8=;
 b=i4LDvNKUR4hThkZas9pGBk0TPWD+Ik3DMsYmaJyld4hSV6bLicz1rLmSRErgnC/3pC
 lKblXTnE+OHSFGcXJA0bqDaAbJCGjEqWLY9+qWfDPm1dZx+B9Bms/D47R4RYXaC6EjSB
 vIrAAT/EjBYYeJO0pGwASLBkKItcCqT+xR02rUtvpf34enTruQIBBEUiK+B0dkl87fzj
 +80smTbhYLNU7i8HCW6mSC34jiVKHS1ImudKv5G1HZW659ORNoJ6wWfsm5DFDLLiVvNt
 zdSs4Cnfx6aSWoJXAq2IH7qqpNu1tO3EPgpU1VbnArQj3Ff9wehZ3QsX6y6grtm0jyTz
 wxNQ==
X-Gm-Message-State: AOJu0YxufHVl2nNjeRKldumNYmCj6et/QyjH5Dqfioj0db6Eadnru+Jc
 F8O48wtU2Bn/BHsrjg7BqEbLIIzZMtQlCNaeFvGXgxhKrL99yX9DhGZ54voGsW6OdABEyTDw95u
 f3ATT+CHLlRh5Lx7Mau3foVMSMVvB+Ky8IMhyuMJ48Jzj6P7Ue9s5pQrx2g==
X-Gm-Gg: AfdE7cktAXB+zU1pB73yX6FbnvYidc90a1btP8ltOfkQbox4iegfE99JtMTRmqi1oJb
 YORje38U0EJO8kwTzi0o4vIEmSVdZLojRRW7Pd3wTxFiLyWnA8Eh1OXomz9OKSsWQfXdtF5svGR
 3YpJqtFCZ7LDl00O3VoAOhc3o4D2buOpp2LVzBvtTCsMK6eIy2AGAyq6+pMilQLocAhJbkL4x/l
 7C0rfl6Nc2FmOnrAYy3iDZDXp4ZGdh027FxE4mFSPwdzJ/+/BkiZ08gMIq3Y/udjNw2zdP3GibP
 wBycQxC58lQgXnYvsY+AXPmJEak53ZvqPQbwVfzVMQeJ5iOALOFFp8Oh0otME8L4A3BYJut9egv
 2eYTdP1ZkO201sQWbWIanRkQsqn6LJH28KUxyglM7pc+duQ==
X-Received: by 2002:a05:620a:410a:b0:92e:76cd:9594 with SMTP id
 af79cd13be357-92e78233960mr1023096085a.19.1783024582803; 
 Thu, 02 Jul 2026 13:36:22 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:92e:76cd:9594 with SMTP id
 af79cd13be357-92e78233960mr1023093185a.19.1783024582346; 
 Thu, 02 Jul 2026 13:36:22 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92e801bbd5bsm309347085a.44.2026.07.02.13.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 13:36:21 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 nutty.liu@hotmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 0/1] hw/riscv/riscv-iommu.c: check for misaligned
 IOHGATP_PPN
Date: Thu,  2 Jul 2026 17:36:15 -0300
Message-ID: <20260702203616.1795588-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hHR49E8UAwflSqMvcvaIgxkfhgpW56R4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDIxNSBTYWx0ZWRfX9r7qPOdaebLK
 ukTP17KYyJk2gG0zlMlgL9zUb3C/TGFHSPdOOWR9j5i2HNGVCCd9O2RpaCE4Sl3383nKp6X/awB
 PHbTK5XLqcv9IFS2fab6Eyw6srdDgWGwC0E/9oTI84jM/0XTGd/qjQWWKVZvRogIsUngEuT2n6L
 YTb9/Wp1OWqUjhmVRMWh7HMdsttF/EqRjIzAI7KgxSpU1/LWsOt/Nh80gY0pzf+OMCBqauFMPg7
 9iYZvkcbs5Q2VNXfnWe0RpAn9fMdKXIuF/WzA7idrzduOi+k3qYQKjBN6+iCMf6KCsDar8uLNN+
 3IFZ7jzbVTr1eDqlzhotegVBvx1AoHT/ka3Cq4uTo4rXZ82unCJNNkU/dWVwSSdekeAoVQ+YO0W
 W3naxo3Kj+e5y6YTWFJAefru8RmZXPUSYodS24kKtgNeo6ywpG7eZPL8/k2Lh9KSEopCRLs189L
 qrk+gJ3grdKISt1NkyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDIxNSBTYWx0ZWRfXwuJD/dNOE8/5
 WGdZYiDMQ71V4N09nTNOk0zvc0pSgIMIBc/o1PNLB5lb0f8xuPsNZ48NMTucgyucRDcUm92ZaJ+
 LVOttSlqrjiLgR2Vex6eGkmZJHNd7AE=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a46cbc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ez8M8yltyU10Gaq5cLUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hHR49E8UAwflSqMvcvaIgxkfhgpW56R4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020215
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

This new version fixes a blunder I made in v1 pointed by Chao and
Nutty - I was using the PPN value, instead of the page table base
address, to check for the 16kb alignment. 

We no longer need to change qos-riscv-iommu.h because now we're doing
the right thing.

Changes from v1:
- use PPN_PHYS(iohgatp_ppn), i.e. the page table base address, to 
  check for the 16kb alignment
- v1 link: https://lore.kernel.org/qemu-devel/20260630203155.2103084-1-daniel.barboza@oss.qualcomm.com/


Daniel Henrique Barboza (1):
  hw/riscv/riscv-iommu.c: check for misaligned IOHGATP_PPN

 hw/riscv/riscv-iommu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.43.0



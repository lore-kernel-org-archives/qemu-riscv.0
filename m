Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2D2606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQ+Q0nQ9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BH2bGic4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKHpz-0000cA-GR; Fri, 23 Oct 2026 12:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHpn-0000ai-LO
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHpf-0001UA-UZ
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:31 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NE60Ed2109421
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=S8cjDPsH4rq
 o57RKzD8Jt0nRW6vxtfzZu90DOJ58YCA=; b=DQ+Q0nQ9wZhVotZcRf0vGBeqljD
 iZT2yaSmfbxpNmURoZ21CqKQT2KTQ0faZtDiO9ucHa9gq9X8C+VNKjQfM5wVwdXN
 BmAUuccJ0lIE+R07MY8RN3DOsjosKQqgiVCbPusDOypCopdss0sCrxaszO+TWA1j
 8f/vISVE1kzwOvDzBG1SuEVOZN7o01zFx2RoIo0DqYnkrig8cSJHfEahwSe2Rs1P
 RHEcvcL8AxPg93yT/gUW/2nzMOsyqk56H5weaZi9oPQ2Z7db+Hr7QQMHc3Ff/+2+
 gvzryqOAkXoY5YlISZDGf1ZYxxN5f2IdOISYxHrsqqM+ecn83DVtfJP7kAw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4fge-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91b92acedd9so33174286d6.2
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792771765; x=1793376565; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S8cjDPsH4rqo57RKzD8Jt0nRW6vxtfzZu90DOJ58YCA=;
 b=BH2bGic4yxUWgZJTs9s4JPFf+Xnu+LMBl31AS2/58ffYfHySNI+mGxuAry/DftR4V+
 UvpX7XvajoSQ58HkjkD18BK+Q/xCxCIjmrnNP/8tbj6k2VFuZac0IpB3OsOGZg8IAdvg
 M2hGQFd1Hza5yBxdA3E395/qaZeDM5UcG+QYyMt2GjPsH15655j8K6sXdEhoBiY3C1wp
 oxUoS1H02h4BudwMtf3kaNf0DI3xUL38NLNy7t8ywGPyXmBa3aqw3POde5Odc/XRHKJ6
 uDt+GHTPIfRi5gjuHCbT5BuQEzu8wlUryq3BT808uRvefcKG5OBMjjLT2D264k/iHIjF
 tJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792771765; x=1793376565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=S8cjDPsH4rqo57RKzD8Jt0nRW6vxtfzZu90DOJ58YCA=;
 b=XMqGqbxXz62Lj49F52xpo95Lrw59YUPxniA9hcfEfQbgXKn6bS4Xnl24VAA+LLS4NJ
 9EyRH3Ncn8qwvBImOgroTUEQfVbl6hfct4uzLaotspZqsV8aHwRu1Fg27FLCBQ7VpiZ6
 Azx2thupt4WoKRi/uFxPMpkeXkcNIczeSIIODc4Zc1ASOTL27tFrQqZXHv6g5lPZyagy
 CYAwqDin7FJmHxLvf9arMobQFgmg4C9z67f7RlcIDuRNw252xccvUo+qcTf6NC8Oozd5
 CJmZsSp5fbYHlFE9B6xeQRfMeQUGtianxjFkZI/7+oO28igZEdFontvuqC7hY6lwLA66
 UviQ==
X-Gm-Message-State: AFq9FYIi1v/Zf5kbK8mu4wXo5d4JNjvFjYHNmtUQ9YqISJeDSgyZEDwR
 lmwe6mNwi71ea8cyrKRhS/VSaob+9/f8Wh4lSihheaJPMzWRZTxSy97g0OUq0kjGZaiW459mp42
 wUOuqDw/wh5TCGHDgeTUhRhTHwp+JWe+52ezKXcTx8Mus9bMD2jQFTCUg0g==
X-Gm-Gg: AYBFou0PZ7npXK8iOqZR34QE+ZWBdtU7kHBCy2jYgdV2mdMLuWwIoNiCXXMx4hwOQ4E
 iEiEPpMA4sQ7jPjsVwCNOTmgdaYkdALMnWWBF6FwN2zeya9FyyirKeL58QwNPDoJcF6ZAdJ8jyu
 5fVB4plqzbLnDbrXNRTFACwUrdW+XwLIiA/mfH1W0Fzi/VK0XUWN3zlZb+Y0xO0xNSC4+qVTw80
 c7RDe0PCZ57I4GGCq8HiHo3MSGmP0/Quu096ynRFE9rJMyZ/ZbTXhtxxahuc24r39Oj8X31gKr+
 ksJJc/vy0bKjSwmBGsMi6hTSVdhrnCaojQCQfekoRwj5FetAvqOyQBjbi1CL4AkCFiT07xde2PH
 5CG7V9B+gLcsit7GjhNOUzuRTajXwAgsCxfLutw==
X-Received: by 2002:a05:6214:5986:b0:919:8a63:22f with SMTP id
 6a1803df08f44-91c3a9e1fa9mr39205266d6.15.1792771764989; 
 Fri, 23 Oct 2026 09:09:24 -0700 (PDT)
X-Received: by 2002:a05:6214:5986:b0:919:8a63:22f with SMTP id
 6a1803df08f44-91c3a9e1fa9mr39204686d6.15.1792771764511; 
 Fri, 23 Oct 2026 09:09:24 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c4524f226sm5063406d6.27.2026.10.23.09.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 09:09:23 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 2/6] hw/riscv/server_platform_ref: set iommu hpm counters to 4
Date: Fri, 23 Oct 2026 13:09:09 -0300
Message-ID: <20261023160913.24992-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
References: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfX+be3IxNgijY0
 IwwtiHxZhLuEOH6Uc4NLxNF5DL78Pql/jwOR47B6kxB/5YhadLuirawz9KsQX0l9VNmGBpb81jl
 ym3gWQLT39ni+gAeI4rS/EwHTio44vFyHSt6ful7G7zpdMguaV2W+kAQKOTG/slgQA+4lpAvUBT
 kuivUmWcMHo10sVhP4P8Q6vtuAzVOXsom+tTFDiYi2AVjRbx1AsVxan8snbGHgkqC0+8hngIejl
 PO5qiOSPZSUItSvEwWHyEWn9gQIHnbTqAVAOoCOnXbKuI4eCHN1Ybs3xEgV17gg56IxRYxz5dFo
 nMoE540B/go5LEXDp26/ADCZ8OJkGJnD81WwE9f2NuL0aLPktHe7nYHj4gmlCDvdaWR1d+GfYj8
 z/IECRE7aN5ya5NIquztsf/xsm/Oq/vjoVViqEKtKZOJk1x3ZmYyc0cKMg0vx22HrqzzVTko04w
 HLszsqMxDS4q8VSsJvw==
X-Proofpoint-GUID: WqhMzIDnwZeOBuSI_H-pTNv7qKsI2fUi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfX1zPGN5ewhFTB
 btJl0XtD51HriaO9Hvimo1kl8U2hHwXEkBRu2zzRlSscOH/33BH0AGhK4jXHZdjd6Ar5CoM+9dO
 exYfq+csBKVqzYZFfIoPWOqQMx+KAB0=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb86b6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=HwFc7jivAAAA:8
 a=EUspDBNiAAAA:8 a=YHBa8Q_7aVoFoIsRzr8A:9 a=iYH6xdkBrDN1Jqds4HTS:22
 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-ORIG-GUID: WqhMzIDnwZeOBuSI_H-pTNv7qKsI2fUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230063
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The riscv server soc requirements [1] dictates in rule "IOM_200" that
the IOMMU must have at least 4 event counters.  As it stands today we're
creating an iommu-sys device with RISCV_IOMMU_IOCOUNT_NUM (31) counters.

Following the design of setting just the minimal spec requirements, set
hpm-counters to 4.

[1] https://docs.riscv.org/reference/server-soc/v1.0/server_soc_requirements.html

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/server_platform_ref.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/server_platform_ref.c b/hw/riscv/server_platform_ref.c
index e9536515da..ea24720a08 100644
--- a/hw/riscv/server_platform_ref.c
+++ b/hw/riscv/server_platform_ref.c
@@ -67,6 +67,7 @@
 #define SYSCON_POWEROFF                        0x2
 
 #define RVSERVER_PLATFORM_BUS_NUM_IRQS         8
+#define RVSERVER_IOMMU_HPM_COUNTERS            4
 
 #define TYPE_RISCV_SERVER_REF_MACHINE MACHINE_TYPE_NAME("riscv-server-ref")
 OBJECT_DECLARE_SIMPLE_TYPE(RISCVServerRefMachineState, RISCV_SERVER_REF_MACHINE)
@@ -639,6 +640,9 @@ static void rvserver_ref_machine_init(MachineState *machine)
     iommu_sys = riscv_create_iommu_sys(mmio_irqchip,
                                        s->memmap[RVSERVER_IOMMU_SYS].base,
                                        IOMMU_SYS_IRQ, false);
+
+    object_property_set_int(OBJECT(iommu_sys), "hpm-counters",
+                            RVSERVER_IOMMU_HPM_COUNTERS, &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys), &error_fatal);
 
     s->machine_done.notify = rvserver_ref_machine_done;
-- 
2.43.0



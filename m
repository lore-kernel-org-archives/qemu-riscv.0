Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAA9C61DD3
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 18:32:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2CDt-00017L-6D; Thu, 03 Sep 2026 14:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2CDp-00015w-AP
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 14:31:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2CDn-0001aG-I1
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 14:31:37 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 683G3BuI346168
 for <qemu-riscv@nongnu.org>; Thu, 3 Sep 2026 18:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=+f49h1tJYraMoXjtRTeg18HHfqujCMQEdXK
 SplLEisU=; b=OhzZdNLfNeSGz2tcCvFACpA3YBup5g2XM5XX83RIEYF8rVCWfNM
 nS3J7AkM3pGZcy9h5u4Ol3s/MQ50nnXuI5s8f20dVOBn4yagQPmMlkzNhOyNCIoM
 KGXlRtPmpvkD5LBBQ8JbqbzyhsAbvO4NJj5Lw0mwB3ifYbbHPuFpEpXjTbeONtQD
 0AbFwFO+j4r9obI1Ew2rTjNTnkLf/aWtZpxbWjFIbxzlsCDxgs+FdH1LVE5ZIFkD
 tkB13Jzooq3dtlqEBCDw9tBHqsnl9C5gTzt2fmee8iOjX7tEw93+lfokIVhk80fL
 ts7+tODK10srN4IeUiRsnz/xamiGjoR8GFw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdtm2a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 18:31:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-90cddf4f59eso2961446d6.3
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788460292; x=1789065092; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+f49h1tJYraMoXjtRTeg18HHfqujCMQEdXKSplLEisU=;
 b=XCvYJ7HUm+XghKhmF8bSBxxNhMJU0ZxtOgWSQJUgrjEipKaXldRj6U03lD1ZGhZc+m
 mvNm2hx7vqCXlgrMiWs/QeSO5l/a82qd+BKrU7tkqEW32AUHq90H7+h6y0FvWkN95SYQ
 cVotePvkZTvDgba7U/5w39k/1kGRcX4ul7SZSKYEDo962k/5kc+hJV4Ss6Fk4HpNg6dT
 9SvnUdW+GcZ9Ei59fEk2iGrjoXoUMVh7hz/SY/7lE4k83b+22heCzl1eVA/EVdFRnFpU
 01IpknTzOTAFYT4lvYI+0tRVfrQRnuCiMxncVmggiGHn9mhyk17JScs/IqbGmFLLbG4G
 jhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788460292; x=1789065092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+f49h1tJYraMoXjtRTeg18HHfqujCMQEdXKSplLEisU=;
 b=MNGraQw3HyuVk5aPd0HtYJ41pusdi/011ZYiccS5OvKVCMQ+SHaPNoJX1F9DtfFYuj
 YiWSQhTPwPMzan1ZbytDTlLoutytk81IvRRS3xaiWrX8f0bLM74Bo4XqjWfKPrzY9Ea0
 1Ma/pbqd32Yq/syvwT3xHqw2o/w1pb7Nbfc6vXOX2v/ZbRGPfA3xqwb13VvpP+sm1QbM
 Yj3/orCb0tuMrRwrYT1j7Br7On7azunIsZzXqma7jbrPWYGwNyM+32EZhIs3qPiZzSE6
 PPzuqauDHHnMfO+Jj3qMBIyS0+vuq3XzCg+dJLTDZEzedcRokRg7HZrNRXiAAy7HA94M
 YTJw==
X-Gm-Message-State: AFuF++mcUM3UKlc59x1uEk/N/btwt4vn8J2DpBlZuRQKWwlBiUBlGLXL
 JJbbBQfGUZgZ8VEWzGxiFFYmIv435YByqjjg1BH62UaEh65YGR/ecuDGgxMJ1wHHOEDE6qM6FZ7
 w/AB0gajEJCjz8/woZGPw5jm3AfxY1OfWiJH+T8wR8pRqnJrcATXdX2aZNYHn53LPOA==
X-Gm-Gg: AYBFou1ZH2XpB+eCjHlmqJ6Z1/MDnTfLwECmTjH1oMpq8TmAbMRYdJxERkoDEM3HNLa
 taCbwHOBkZ+S7kxrOy1ixpAycCQg3AEUk9/vqGvFWCXj23MhQoYD9aOVk6ynFjQJ1au1LzEtZqK
 p3Be3ghft9lMPSOOI/0u2ICftSYIlWocuWQN97/t+i/t1j7o19j6d3n+A8LdErHWaq2zVsIVNx1
 ZCEq06yi1SUPS/MszAGhLMRDjIrIBug2k/9AjtLWLSI2QnGtoAFrByPPjBywgV4oFG6YeeR/rBT
 vZdiCcv/2ptcIYbqvlVz6/moqesGF/CNqNDHdBO5FsJWdJlm2qvwURFag1vmP8EJ0z8K04TJrV+
 pgvtXo+W08RKLmnXcf/EDo+8KesLSAYI+tg/h
X-Received: by 2002:a05:6214:5543:b0:90c:e762:1f86 with SMTP id
 6a1803df08f44-9103f0d3e3dmr12562196d6.30.1788460291406; 
 Thu, 03 Sep 2026 11:31:31 -0700 (PDT)
X-Received: by 2002:a05:6214:5543:b0:90c:e762:1f86 with SMTP id
 6a1803df08f44-9103f0d3e3dmr12561196d6.30.1788460290572; 
 Thu, 03 Sep 2026 11:31:30 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91040693aaasm603596d6.34.2026.09.03.11.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 11:31:30 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v9 0/5] hw/riscv: Server Platform Reference Board
Date: Thu,  3 Sep 2026 15:31:20 -0300
Message-ID: <20260903183125.682865-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2MSBTYWx0ZWRfX2S96bGQOt3QG
 O705ZbOkSQNPafPkVFsjXsiiqODNKf6llrnSZq7OMGNgeD8JB5hg+cFaYJnqXjovlha0YuU4kYc
 zgfSQDl08vxtxNsS9SqPfvp1ftsfllg=
X-Proofpoint-ORIG-GUID: ZJPi1rS1h-r7BpNlVlYCo-umcWl6N5CH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2MSBTYWx0ZWRfX46uQQhzSEqbD
 bYTAJveTSuT6YSw1uaoLUKq5EIZ+6KKp9MpaeYw1VXxAASTAcjRRkEGX0p6ZvRt7dbidabrMahv
 if3KMkFCxI/L//sC23Mac+ZOoVE67Y9D24g1sTKk+TRwCF4VyXV7+Hmoz2pYJ7jPHxGkp+8pTRE
 L5uy98rRIzoYw9X0JFMZCk5kzn9zzVek6AiKjkDca+INwz329vXPgRYDLkhTxUrAbgDwOq3Lhue
 hYPFKgnugkXohiWRvilhIA9vd0YCkjiAPgKxNkvpju6zz596JzGb5n/LZafCvGr8ByB9uYesDS2
 RXsPJypvbFGwDULgeCfkfOt81CLkvUy9U856777nHdvClErIXsVQQZ2o8ZufPJgmC1Q8jwpK93f
 lSHs2xZ05ACMBrcmYJoChspKlkueN1M6oXjKUkfEiC4tvbw40EdZ0uKdES59jA5T1WMSDpJ69lV
 140BJ9vr61U1E70zhRw==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99bd04 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fa7AMr4v2K1-DDA7kUMA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ZJPi1rS1h-r7BpNlVlYCo-umcWl6N5CH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030161
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi everyone,

In theory we should wait for sdext ("[PATCH v7 0/7] riscv: add initial
sdext support") to land before pushing this board again, but there seems
to be a demand for checking the current state of this work.  So here it
is.

The changes from v8 are mostly based on previous work done in the RISC-V
tree in the form of FDT/device helpers, reducing the amount of code
repetition between this board and 'virt'.  In v8 this board had 1477
lines and now we're down to 771 lines.

I also squashed the 2 TPM related patches, that were already acked and
reviewed, into the base code.  We're now carrying 5 patches instead of
7.

Other minor changes were made based on v8 feedback.  They were minor to
a point where I kept the ack from Nutty Liu in patch 3.  This means that
we have all patches acked.

Patches based on alistair/riscv-to-apply.next.  The series is also
available here:

https://gitlab.com/danielhb/qemu/-/tree/riscv-server-ref_v9


Changes from v8:
- former patch 5 ("hw/riscv/server_platform_ref.c: add platform bus and TPM support"):
  - squashed into patch 3
- former patch 6 ("tests/functional/riscv64: add riscv-server-ref TPM selftest"):
  - squashed into patch 4
- patch 3:
  - using decimal instead of hex for RVSERVER_PCIE_IRQ and IOMMU_SYS_IRQ
  - updated mc->desc to "RISC-V Server Platform Reference Board v1.0"
  - use MachineClass->desc as '/model' in the DT
- v8 link: https://lore.kernel.org/qemu-devel/20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com/

Based-on: <20260831141007.353854-1-daniel.barboza@oss.qualcomm.com> 
([PATCH v7 0/7] riscv: add initial sdext support)


Daniel Henrique Barboza (5):
  target/riscv/cpu.c: remove 'bare' condition for .profile
  target/riscv: add riscv-server-ref CPU
  hw/riscv: server platform reference machine
  tests/functional/riscv64: add riscv-server-ref tests
  docs: add riscv-server-ref.rst

 configs/devices/riscv64-softmmu/default.mak |   1 +
 docs/system/riscv/riscv-server-ref.rst      |  62 ++
 docs/system/target-riscv.rst                |   1 +
 hw/riscv/Kconfig                            |  16 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/server_platform_ref.c              | 771 ++++++++++++++++++++
 target/riscv/cpu-qom.h                      |   1 +
 target/riscv/cpu.c                          |  32 +-
 tests/functional/riscv64/meson.build        |   2 +
 tests/functional/riscv64/test_opensbi.py    |   4 +
 tests/functional/riscv64/test_server_ref.py |  88 +++
 11 files changed, 978 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst
 create mode 100644 hw/riscv/server_platform_ref.c
 create mode 100755 tests/functional/riscv64/test_server_ref.py

-- 
2.43.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6D2C982D2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:44:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7G9v-0002Wv-Oz; Thu, 17 Sep 2026 13:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x7G9p-0002T2-Nw
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 13:44:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x7G9g-0001aa-3f
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 13:44:20 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HH5T3l1765952
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=PA+pyKUKmRRRuQbzqiu/nMXMQb6umpeCVcM
 e+qD/HOw=; b=i2b7BlUml6EXKz8MStRMJE7bkvQNtQiZamlixGuGmSUXvNJNKmO
 3vnL8PBcSBxxbHPQWM3Aiaj6hME7zIloZRBb3Go/Anwa001XYK9yV5jq+PXA9Cye
 Ghd3ygQ8RrwNPIO9QPGTSp2gx91WIMPjSnL4CNnuDXr+xesCiwAJt0YyvPOTSFBz
 uw05xz40oT/y3jiW5CgQ49DU/B5NEn1/tRug2TgAo0m5lRo75lQPkVZZI8qhwkRi
 Jnf2UxXdVzuLPPHJpUwYLVpKBzqZzGW7w9upvKbJnn+rKRkNfSfan4HqaAilTf1I
 a5d5SZnLIh+9M1kOoy0ALXli5+I7Y/eLxPA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcraajsf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:44:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-90e8135d7eeso19009126d6.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 10:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789667050; x=1790271850; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PA+pyKUKmRRRuQbzqiu/nMXMQb6umpeCVcMe+qD/HOw=;
 b=GRwk6OKcFefRlVtUk8lec1W8WFMXcJAqmepRCdyqSQ+EQwqgl5nm0UWeXa+h+bJRSM
 3GPljINqi4zPSOsFpD04zaSur0r8A7bRYNj36wjIpFAPw1+ZCYX6wipZxiYyncBboOL2
 Ouwrk+VaL90fDguOb2iNp3lLfAuafj+mD/V6zPevCJ7TAW/jplyLw3/QJ1jTaMt+Y1MR
 omEFzHISP5xqG+i95UEEodzHQalOEno45v1ykeEOCm7iaX/ILV7f5325kLDeYRiNsSDG
 jyV7dyFYaMRurvj0BT6gRx8nwnCherqyAI/zT10XRC7sLc/mJzbh7Pw7V9M45IQPUoGs
 i0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789667050; x=1790271850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PA+pyKUKmRRRuQbzqiu/nMXMQb6umpeCVcMe+qD/HOw=;
 b=Uca78tkc03i5iW95PR+F7EAt/vZeC+EZA8kPuh8Fqv98w9AkmZ/onTvhZP15H1Ol7+
 8mycwkKKjbBJsQ7hW9eeAuy0GWdwPFZFb+iG2Z6DfUkooTLxt+dUt7+Ga7ZHRkQDncL2
 H4JuAdgiYrGk3uH6mAMyhiW+9t8kNFKIDDTVz8TLDw1VzjMH0uRSxMF2CytafV7d7XP8
 oGWEOz+xOxOu1/O+MFuzqUtEsY4X5XqPvFxG3Y581LcTmEUnw3NBFO6ODHshbkNu+0Zi
 ZpO4UjEpesq9urrvPpolbvVWPcGW32FCb2k1eX9mR1erLt6vGeOfe9JEcaoamokVhvFn
 kqww==
X-Gm-Message-State: AFuF++m77X5QGnik2hPMeOrQR+80JhzzHSv9wAGiy/I6uX+bvKWrMOjz
 y9p9sPHsadvaIDxmQcXNeQjg74Ecgrrs0LysJDBb6+fPQeNkkVSOptQFdXeFfuuOdmQ0Bgsapia
 5m3pGIQ3+/tX/+taOPaVzctYpKtODm4/WzThWMg4+JZiqHkdFZEzaG29daA==
X-Gm-Gg: AYBFou04BY8duqtYioelfndz5Hiqs2GPLDiFHePfNvVWFCV807A9x/+VrR7Otkl7sxR
 g0F+3NAgL574Uph4ftx0BWCgoTblVd6jTv3MDwcb4uFczBcGECGxJIQG4uzPkWaaeG23exUBnSJ
 PAWEr7ElqRxl4hQnwdziEcdPQbWr7DHZQpg27U978RdXg50Ks6jhSptQbgtzfIy927yYtHUHpBz
 bW7Vg8J3Ig6/V4T5N/OIDjrmDiuLDrZWds34BhrY0vYFhDrq5iD/6NxicIeoJ//YZd0RPXKhjQ2
 LBG3CrzhHnZjUPjRTe8pjvwrRkzRFnSOzHHaKsTyf7egZxNkakj/RQlpdmjxdgN0nfbiUo5fmq9
 poR6I0DKTA6Zp5OADJ1moSoSUQO1SGPOMQG2+a4Y=
X-Received: by 2002:a05:6214:634b:b0:912:40b6:d591 with SMTP id
 6a1803df08f44-91240b6d75fmr84321856d6.34.1789667049922; 
 Thu, 17 Sep 2026 10:44:09 -0700 (PDT)
X-Received: by 2002:a05:6214:634b:b0:912:40b6:d591 with SMTP id
 6a1803df08f44-91240b6d75fmr84321426d6.34.1789667049526; 
 Thu, 17 Sep 2026 10:44:09 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.170])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91252c56d73sm3118136d6.13.2026.09.17.10.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 10:44:08 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v12 0/5] hw/riscv: Server Platform Reference Board
Date: Thu, 17 Sep 2026 14:43:59 -0300
Message-ID: <20260917174405.3471736-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI1MyBTYWx0ZWRfX6pBqVmqe9sKL
 J4f8hZrRcpmnvwMvj2xwJ+ZidnpvoXm2jEFtGH6fzsb+9P35GEdPW1IwqrAagt9tyhoFp8s37kX
 XbOSOTacIZh1dopU8Tihuqyx0cCZmb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI1MyBTYWx0ZWRfX8xenKEEJD8m2
 laVhQ7tn0dcKPUbVnsWLey4owZULmYhrBu38eQEVxW48UsZjrlQtcgp+ZhySeHcyFcpF8xBC4vP
 HARcdkYLlSgip/AlrvgARbs1fYRXD0os6xK3DmKN8n3FR6+2EvkVqzgXycHDlUneYjXxIP9p3Eu
 FQSqRUifGXOyQjHG1lGe7/FMTjJqob2DDeR1IDnCT6kGmxIEEIDBMusCDfxLS4l0q7YX+/vftly
 cx8C0/ifbeRFnzbiRHXLrMXvhRZZVS5q1rPeXOcN1ym6O7WAh7I6zwSYG6BUunhzhvKneNOlahJ
 geczn9N//l34kOi5woh+9Y2MPHhmdutBOK58AeLW7mqxKaidGutuKf1xwfYLq5B8DHqP+OMNt0v
 g5AL40tdD5t4Ng5sC0HPdYJcC8J+VZM0vlQAQCgT6U0sPr5wJJHaNAMDS0W0xzJiqgZx6h4xlje
 ooCgN8woy4G2jmLv14g==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac26ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=arNgJ3JLhM/z8Vk/iMOFgQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=k5snQTODxFSaQZLrqV8A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: RW8oIs-T6m1Dtz2ct-PiZdW6TiVDSfNP
X-Proofpoint-ORIG-GUID: RW8oIs-T6m1Dtz2ct-PiZdW6TiVDSfNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170253
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

In this new version we have lots of changes suggested by Drew on v11.

The most notable change is the removal of default e1000e NIC and default
AHCI ich9 bus, following the idea where the board should be as minimalist
as possible w.r.t default features.  Note that both can be added again
with:

-device ich9-ahci,id=ahci0 -device ide-hd,drive=hd0,bus=ahci0.0
-netdev user,id=net0 -device e1000e,netdev=net0

So I feel comfortable removing them from the default design since it's
just a matter of adding them in the command line.

Patches are based on top of sdext-v9 patches:

"[PATCH v9 0/7] riscv: add initial sdext support"


Changes from v11:
- patch 2:
  - commit msg: s/trigger-count/num-triggers
  - removed the "N < 128" num-trigger bit from commit msg
  - added an explicit "PRIV_VERSION_1_13_0" val in RVServerRef1_0 description
  - default pmu_mask is now set to MAKE_64BIT_MASK(3, 6) (i.e. 6 counters)
- patch 3:
  - Kconfig changes:
    - changed PCI_DEVICES to PCIE_DEVICES
    - changed SERIAL to SERIAL_MM
    - added PLATFORM_BUS
  - removed duplicated "system/qtest.h" header
  - aligned macros names and values
  - fixed "accommodate" typo
  - removed default NIC and AHCI bus by removing rvserver_init_pci_devices()
  - removed RVSERVER_DEBUG memmap
  - added RVSERVER_ACLINT_TIMEBASE_FREQ 1Ghz macro
  - added .instance_finalize() to clean up the s->flash[] objects
  - added NULL at the end of valid_cpu_types[] declaration
- patch 4:
  - added ahci bus and e1000e command line in do_test_boot_linux_test()
- patch 5:
  - fixed nvme disk command line example
- v11 link: https://lore.kernel.org/qemu-devel/20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com/  

Daniel Henrique Barboza (5):
  target/riscv/cpu.c: remove 'bare' condition for .profile
  target/riscv: add riscv-server-ref CPU
  hw/riscv: server platform reference machine
  tests/functional/riscv64: add riscv-server-ref tests
  docs: add riscv-server-ref.rst

 configs/devices/riscv64-softmmu/default.mak |   1 +
 docs/system/riscv/riscv-server-ref.rst      |  64 ++
 docs/system/target-riscv.rst                |   1 +
 hw/riscv/Kconfig                            |  17 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/server_platform_ref.c              | 776 ++++++++++++++++++++
 target/riscv/cpu-qom.h                      |   1 +
 target/riscv/cpu.c                          |  35 +-
 tests/functional/riscv64/meson.build        |   2 +
 tests/functional/riscv64/test_opensbi.py    |   4 +
 tests/functional/riscv64/test_server_ref.py |  90 +++
 11 files changed, 991 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst
 create mode 100644 hw/riscv/server_platform_ref.c
 create mode 100755 tests/functional/riscv64/test_server_ref.py

-- 
2.43.0



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA8ECA9ECF
	for <qemu-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 18:26:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFyFP-0002xM-9X; Sun, 11 Oct 2026 14:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFL-0002wL-MU
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xFyFJ-0008S4-IX
 for qemu-riscv@nongnu.org; Sun, 11 Oct 2026 14:26:07 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69BIKlKW419166
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :sender:subject:to; s=qcppdkim1; bh=TWLdTDhS4JmE3pn6SzqwIOCVIgBL
 tj3sk0QeOp6wC2Y=; b=eTBkGfzAYNnzYSYqQFMpA4SR1skG5vhVzEBqZ3uzvgy8
 vpwtTicJClshU4ZEo45Mu8XXA5Lex0R8DkF41V4wB1yRpJHlUUyBvTsP9SeAyg/C
 eOU52jTpYyzrqQOs1q1BMl6O8WMDvv0+3frzDAEAVAUmWd5ckFWRXa7wVmb359I8
 3itisDS2VZSRNn8ydC9jwf82Is9xlFCH3HpAV5iSikIzNVpHVF0h/2XI16ee+lJc
 ZZWuc81YMr0b3c6kKFGj2hE9HgobESdqpWF6z4AI7Qws91dEAQcq7u4LioutUbFP
 M09JZ2qd7xmvyMrgc9zlhFICZBv+l/LhsOEGW4RSfg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc6bpxk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 18:26:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-35a4d2e39acso1232325eec.1
 for <qemu-riscv@nongnu.org>; Sun, 11 Oct 2026 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791743161; x=1792347961; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TWLdTDhS4JmE3pn6SzqwIOCVIgBLtj3sk0QeOp6wC2Y=;
 b=a9spGxUMG0u38f6cCc5/MsAMBni0wjOM+D7pf6WmtN8T2q3/Nbq1khhKxjoXZG8HYZ
 TvGGXVZh2lYfn4XDxMp+9XoEM1hBeDAmgKoFRfLrC0WKnnA3rJzYv7ehA6RHHdzpLEFO
 A7qZUs3Q1eTkWk3IRM86P33BwmKaBeoL96dIF3lP+zDF4UTnZX2T9M1Bs4hGapO9qUxL
 XOT/Uqu7pxDI2jIFr7em7WzcZXQXOAojCwV/dOpagoEI85reYd3xHofdVyobFGW1fy1I
 LRTpM3opV+HFwCN2oXQSR+kBkcmTVvzMnVP7Ze7sEyQgGv0Hnl3DKJOjJl9b+nohu6f+
 Pnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791743161; x=1792347961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TWLdTDhS4JmE3pn6SzqwIOCVIgBLtj3sk0QeOp6wC2Y=;
 b=LhpxdOcb1snB2WI/kjqsJFBqU32yZ3udR+W3JAt1z6JfMQeRfGYDqKeaRcnek3QF+V
 80b/9XQVhGTsGjDqvNStb25nUKxY1qaaKQ+DU//H3V/TZYfNB/QFpEYBW+NYCHtY24nx
 4T0dcTu9cUJ7NrKd90c19BySdgpFVlvpGS1Ida5c9HR8IwxbSerQE6BE/Ww+NbFJzTSL
 FLBREn3K4bxdFmVpVkdObF0SQK7nsmebprW2lvPkU4AfY0z6rYLysND+wZ/fmbuvQObC
 YdptqEGfPSwU1ZEGcBkKcV+5GsJuhoc1V+bOD6r9s8NKTKn7/I6KND/MwFBPUCAJSe9b
 o/pQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByELDjN3yooB8trvSFzG1R9vni/ly/NA4LQ5Ne1+ATY9r1qGQqsV3qTvOqC03ol5M73Nxy40gYpgX3L@nongnu.org
X-Gm-Message-State: AFq9FYKRbSF39hPjs5kf7gBaztFnGilUW94JPxveuf+cp1+WcXvZhD8U
 LTQkDPSY9nElBSJv8xi5WLAZWDZB/U0+ri+YOdEnVJOB+C1twHBrOR/ZgjAxyAalQwooH11EWFu
 snJACUcpai+SdKX55oYhSsgE/0mI5U9EIZ3cvcby1vbUw1jzRW4Sa5PVCig==
X-Gm-Gg: AYBFou0wKBSIPCtLtPjW6syA3ZuQ6MSQVTy06pQwqHSu7SJ7qIF9iHOMLx9A+Zo1/fQ
 q8P8V2qEjpZ4WimqaJgMpiN43Aaqf/GrA4tNMx9ljFVgo1QjcOfTFG5z138pclT/fDwNz3XgYkR
 1vS/NLyxd0cyTIUT/FEL9ZBdas1fHEr5E0Gs8Js5r8lq2OAYErEVb8Y9XicfCqrZBNVcqWcpy2C
 m7nMk0NRzy5wtfcyR7dNPAmb2M1B9G9SUrqG0V7mwgNxCTPESvU6Uq9T7iDGGod4Pn7upCTzAmB
 ywaNMrXayg8ktIr9Fsqu2S3QDaSJ4Bw5GIUWD5NzO3kVqTY7J953ks4TZLeZLEvwM83X2RMQanu
 VNctKknJYmF42cJcqOEjdo9F7cxkk+YRw4F7TU/1zL8JzLQaEXGsXqRc=
X-Received: by 2002:a05:7022:422:b0:168:3243:c911 with SMTP id
 a92af1059eb24-16a60ced242mr15662085c88.37.1791743160999; 
 Sun, 11 Oct 2026 11:26:00 -0700 (PDT)
X-Received: by 2002:a05:7022:422:b0:168:3243:c911 with SMTP id
 a92af1059eb24-16a60ced242mr15662034c88.37.1791743160377; 
 Sun, 11 Oct 2026 11:26:00 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a5866477sm22505284c88.22.2026.10.11.11.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 11:26:00 -0700 (PDT)
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>,
 Drew Fustini <fustini@kernel.org>, Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH 0/4] RISC-V: ACPI: Add PPTT support
Date: Sun, 11 Oct 2026 23:55:48 +0530
Message-ID: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JDhtqh181eMdp-opW-bNxYK9pBKo6XqY
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6acbd4ba cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=mDV3o1hIAAAA:8
 a=EUspDBNiAAAA:8 a=Lpe6bjFTOsfE0dEvvBYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX17pwsLFdC5dI
 4ylj8ilNWtcu0o8wcu5yRRKFvS/1T2svL6eBhed1U4iyfitHM5ha7YyQaw8+tzgbVyLMtoxRvtj
 D0/aRM9qwPIt5zBjx9FJk4zdW0S5L24wZWAGMZNtNHfNIU3Kx+PJ1dVRL2vYfqeMtlr39xRoh0q
 FJKK6NJiObEI4EC7bI6lYO1oiR8RBeg9IPBB3IcwEClhYaoLoc8onG5HrpTJ47ThNq2ZoYBsDJ3
 aeXUWldxhQaK3cMn7VPsJokTjr9o8YM1nc+OzixMKzNSfADPo0+VfbtLC2nl7F2S26vPZCByDqB
 u3SPz1s+ezKtwS5ArtBKs6kb8YvA9b20qOyQUTQFQ3g/Fxt/PLkziu/CLC97e6JFnIIaYDQvyoR
 brDNOuvVg4veqKBBIIjiYprtf6qtTu/7Evbs1QY1KiDCmPyYYOdyGS2VWqusxldP5dE0www2UWr
 JReZZ7UW7ibemiLWXkw==
X-Proofpoint-ORIG-GUID: JDhtqh181eMdp-opW-bNxYK9pBKo6XqY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3MyBTYWx0ZWRfX5PeDYhXSSsjt
 XiMTdVDPi+DYcAQmU2UOx22crmfPJ8IQQsj0OryUmwSs19g8um0MDoR8NLdgCaOs8M0nBIRSuqA
 IWVeMCgh61NYL88JhchCoZkkt8Hdp1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110073
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-to:  Sunil V L <sunilvl@oss.qualcomm.com>
From:  Sunil V L via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Sunil V L <sunilvl@oss.qualcomm.com>

Hi all,

This series adds ACPI Processor Properties Topology Table (PPTT) support to
the RISC-V virt machine. PPTT allows the guest to discover the processor and
cache topology exposed by the machine, which is useful for making better
scheduling and cache-management decisions.

The implementation describes the RISC-V virt cache hierarchy with separate
L1 instruction and data caches, followed by unified L2 and L3 caches. It also
enables the corresponding cache and cluster properties in the machine SMP
description and wires the generated PPTT into the existing ACPI table
build.

Unlike ARM, RISC-V doesn't have a way to discover the Cache
topology from registers. Hence, I am hardcoding default values for the
cache topology structures. These cache topology structures are added in
virt.c itself so that a future series can add support for DT as well.

The series also updates the bios-tables-test data and removes the temporary
PPTT entry from the allowed-diff list. The generated table is 96 bytes and
describes the package, cluster, and processor hierarchy for the virt machine.

This work follows the discussion and earlier work shared here:
https://lists.gnu.org/archive/html/qemu-riscv/2024-01/msg00928.html

I have retained the contribution from Sia Jee Heng and added his
Signed-off-by tag to the relevant patch.

To enable cache structures in the PPTT, one should use similar to below
command line option.

-M virt,smp-cache.0.cache=l1d,smp-cache.0.topology=core,smp-cache.1.cache=l1i,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluster,smp-cache.3.cache=l3,smp-cache.3.topology=socket

lscpu -C in linux can be used to display these cache structures.

Sunil V L (4):
  tests/qtest/bios-tables-test: Allow PPTT for RISC-V
  hw/riscv/virt: Add ACPI PPTT table
  tests/qtest/bios-tables-test: Update riscv64 virt PPTT golden
    reference
  MAINTAINERS: Update Sunil's email id

 MAINTAINERS                       |   2 +-
 hw/riscv/virt-acpi-build.c        |   7 ++++
 hw/riscv/virt.c                   |  54 ++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h           |   4 +++
 tests/data/acpi/riscv64/virt/PPTT | Bin 0 -> 96 bytes
 5 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 tests/data/acpi/riscv64/virt/PPTT

-- 
2.43.0



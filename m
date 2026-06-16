Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1EDCD98EC
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 00:01:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZdhA-000205-Vc; Tue, 16 Jun 2026 19:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdh8-0001z3-IJ
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:59:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdh6-00081u-Ri
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:59:50 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GLTM0q248955
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=cLaTi2EGw43VQDgmKYWuiKPQ3z4n8xDyrig
 7q6nz+pU=; b=d0z5JdHDAHF2nptxlvrqxX5LWEqvbD16kphca7FCQitYAyf/QG7
 wsHIwkL8DHR04xYWGJdLMAgbzNNYTnrU0JxzQHoOrNROkTzTVsTuHgB33exb4fEq
 6D6VV02MU0O/XZGQsWQE4NG9HJuWdT8BnLcvv1yLh0tUTa+BLfbjZ2JUeYXpu8LR
 hdovQjHOvXF3pIgMXvml1oP07D2x00AqUqDcmYBsGwlUaWKme6s0Il0GtF0e+35B
 XmNgVo9OA2NzlSmqJv93vl0Q8JZyriJY7PX0OUzKHiDG9O+6yijPdvFpfAcaWOA1
 O+uxnuCwBDBvHQ0eSCcVUN/HnHCIuRIYKQg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet0dxm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8cceb5a9686so141825506d6.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 16:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781654385; x=1782259185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cLaTi2EGw43VQDgmKYWuiKPQ3z4n8xDyrig7q6nz+pU=;
 b=iSEqbsB76rMnnH4WJTcC1S1P9STLWasrh2diwJ6DNoN8jx++0Z8ZBPqR8d7VS6DThz
 d9KeKa82DJDUKs8GKWKjk/Al4pX8YDFw/br15//3qApqg6pR1u3Bis2ytsNbbB2PSnYk
 FeioEW9Uu3dOYQ2Gn+SHBZ6/n5l2e+0S3h0Csxw3g5zfdFG9axTsmXrfZXNj+YKZQL+C
 SnS6P0kA0L6TAkF6kyQaoYia60WJYiZNBKXJ0AW3VulN6LAWuFfz+UvYSGrPLJrrX/Io
 Ojm+QOmQFi9tE0cWtqddrVmxig0VmOhp3jGM61/nekkn7z4EEHTPMUDE3aV1W6REzvFq
 7S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781654385; x=1782259185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cLaTi2EGw43VQDgmKYWuiKPQ3z4n8xDyrig7q6nz+pU=;
 b=JhH5XueP8I7nNilPcSkaNXdFK2lN1TcwrPoSK2xXci4EeafZwfj8HzNIOR+US8nuIs
 +8AjyV+Y69mFL+msLbnbURBbu6JdO/7gvraU7p8lJNcClyFSSdq/mDJq9JyORoc8RJtX
 pwo8XvvpH9YngUjhmxfPbuG3xXMouZK5/7raR/xXQCkQc7POCmkII8qUP3uM0kYwIKNn
 OpWTQy6YCIEk+IcZMCjpFg44+i/f8KLiSkPUsTRItaWO9kBBh0bajNVqVNOhkeGg++jL
 uZdayGWmuI8T00UumS3Fo8ufjckpppxUqPbMtrMuUGeVAkbZlwOCPpKdUPHloD6/vZhw
 /D8w==
X-Gm-Message-State: AOJu0YwjbBtCgbibqNxKwoMCVSOZ/MUope517jis4EOekqt8WrsCjcKS
 eFNMbVuubMap+nQLZLl/CpoGn3wxD6JTkdelp63EFb2HmGeGwoBTOgiG8Z1LsScjEKvmUhQix8B
 RP1ULeFqWNfWg3kD/3j9tYYmPyRhgmJ84wOVhHz5IuezeWBjCgD8ORRRWxA==
X-Gm-Gg: AfdE7cmYH5Vtwp6SMuqA/PK/tBsTtdBuvukbqH+PQAoyoT8LV+ilbK0wxmv50A51iyX
 xuLKcRX5oMk+4acfVK7/J0APGd44JNjpx+EEAulKEGCzZ8vMTmdFfGEVVa2bIAhV9A0ZAnXIQH9
 nyLwVaqXfLNcBDkXw6gaPluuA37tjtv2HNS7fZG3zl86WqbE6H5S1NphKlVJ9D8KMPWrse2L91r
 zTG5MyY/LoTTBuwyoSdjuHdlO3v0f7o93pfbUTb0yvn+cS5Si3KSEJRZ3qAsXfzy5dn5DPh1CuU
 TD2jp/9d0miqGe7RH/NroTDzbEYaAeO/zKTnPb3pY2VCAUOJf7pWdfX3QkCHy/NuUg7Mvv9VYZj
 m5lu3gZFZJMckfy/iMjOn1lHYHRVOgjSuCo2uGKatIK5ocHwXWwtuZ1qskt4=
X-Received: by 2002:a05:6214:519c:b0:8cc:dddb:eeaf with SMTP id
 6a1803df08f44-8db5e05541cmr28832086d6.40.1781654385164; 
 Tue, 16 Jun 2026 16:59:45 -0700 (PDT)
X-Received: by 2002:a05:6214:519c:b0:8cc:dddb:eeaf with SMTP id
 6a1803df08f44-8db5e05541cmr28831736d6.40.1781654384717; 
 Tue, 16 Jun 2026 16:59:44 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f132178csm50191986d6.7.2026.06.16.16.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 16:59:44 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 0/5] hw/riscv: more FDT cleanups (PLIC)
Date: Tue, 16 Jun 2026 20:59:34 -0300
Message-ID: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xo3SrszDKExiBUfokUQUIAf5h_Qk_KG_
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a31e372 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cNeE1kvHBGX1SwQoTBgA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Xo3SrszDKExiBUfokUQUIAf5h_Qk_KG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfXyPVRdGb+4gYC
 yzRkRf3X+ozE4/h1Y1+Tw6SC0ZOl57z0EyIhR92P3WTT4D/guOIAHsrMthfgoCwy3wbNoqq3Sfi
 v1zK37ffhN9XzzCAeF/Sx/4U+x0Vj08KLuVwlZMjv00Ulr9GuCJu/FRALXbctrgbESbY6eBMVr6
 NSUsIA3q46UvxeSSXx3Hya3pc0yHi1EX2jFOTptcdBg8OLIoayZtFvZPeaB3tEY4g3MYlC+dPZe
 VO4wDvcTK8Pg2Z8xSYJol46r7ABHCl88mr0w/7wAxz+DzIeQc8/5NZYkRzZdjyxxhj6V/QwR/92
 IosNItGB4TLRKZJPwExI36HyDQYQpNfg6G0EZDJ4pqOHp3Kjy0ss7dqbPSOhAqxia8D8+wUk8e6
 jLTTY5dSFC/+zv2vGrBDM0C+MietkAtRRG67AahzdPH7MX89t/tWTnzEkVdA1v8SME9783uTRme
 wPgTbobr6qoZHW49zMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfX4bgN7h+I0RIm
 qBFo33OAkd/v+tEPlo7svP463CK6CaqdxcGIsipRsrQAnEo0wqm2ysd9BQWGE/YsKobCX7Iqd1z
 lW1k7zgoq3ykZIpOQAsNYPO+o3qdXec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160242
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

Hello,

Here is the follow-up I talked about in the first FDT series that was
just merged [1].  This short series handles just the PLIC controller
FDT.  This time there are 2 FDT bug fixes in the mix (patches 3 and 4)
that we were lucky to find.

Expected changes after this series are related to patches 3 and 4 only:

 $ diff virt.dts virt_patch.dts
 189c189
 <               rng-seed = (...) 
 ---
 >               rng-seed = (...) 
 285c285
 <               plic@c000000 {
 ---
 >               interrupt-controller@c000000 {
 297c297
 <               plic@c600000 {
 ---
 >               interrupt-controller@c600000 {

$ diff sifive.dts sifive_patch.dts
 >                       #address-cells = <0x00>;


Patches based on master.

[1] https://lore.kernel.org/qemu-devel/20260615203734.954428-1-daniel.barboza@oss.qualcomm.com/


Daniel Henrique Barboza (5):
  hw/riscv/sifive_u.c: remove unneeded qemu_fdt_get_phandle() call
  hw/riscv/sifive_u.c: use intc_phandle in plic creation
  hw/riscv/sifive_u: add #address-cells in PLIC FDT
  hw/riscv/virt.c: change 'plic' nodename to 'interrupt-controller'
  hw/riscv: add create_fdt_plic() helper

 hw/riscv/fdt-common.c         | 30 +++++++++++++++++++++
 hw/riscv/sifive_u.c           | 42 +++++++++--------------------
 hw/riscv/virt.c               | 51 ++++++++++++-----------------------
 include/hw/riscv/fdt-common.h |  5 ++++
 include/hw/riscv/sifive_u.h   |  2 ++
 5 files changed, 67 insertions(+), 63 deletions(-)

-- 
2.43.0



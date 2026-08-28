Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FACC61DBD
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:41:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03MM-0007Fg-77; Fri, 28 Aug 2026 16:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03MK-0007F4-QQ
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03MJ-0006S0-25
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:32 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SJdWM0125950
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Ik9fkOrzmK2aemc5wgARTv
 Xw3fod7CcqPAPzf7N2Xq0=; b=Z3r2VN2qFJ+OHlC3ate7L3ZY6w364rFC5tgoR9
 gYLYlv5CxepzcR1Dilz0J/PRLkaV8meiiVK+/LQc5iVQGFrtU+JK+nnPFP3m4eLA
 SQl3UXbth8uX5Xfm4AA267zoR57F8LnNtoyxJZk29J2E7NhEt7JGQjpBYqnDKQUg
 sFklS7vAquttxRjgUkSyQLV45GVRCbPR4DBZmpBVt5r//Fyq7IGeBQSVfs0ioj6d
 eOE4sPg500CtVt9Bgc0q8OV2PRk4NdMRmcC6Y+Vuv6Zbd5iHemuiIK055gy1qCi5
 QqqeAx8G6Moonaj9WCUrAQgWcu0Kf63+CeeZH4VYW/KaDPtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbgpc058x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9390126581fso127620185a.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949568; x=1788554368; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ik9fkOrzmK2aemc5wgARTvXw3fod7CcqPAPzf7N2Xq0=;
 b=kP7CVN1vKO3q2dny+XSpNqwID1t1Qy58TkrU6tRJ2sElTkReczTe+AxOM+y/E8e87K
 PtoA+8dyoxMHKcfW+QhLewUR6qEQzO/CvF3oLPOfNbR2NiHxpb2YKF7deDu7AOLb3NtK
 rV+HOGtMCeYnolCVmzkOkiryKnqoVCKk5RfK3C7/S+PfpVUwdZ2bHFJcBTr8PTfRcpEn
 2I2Dve6mhGW9wpuXt5WtVz7rRx96nzVQ/8LglQcD6rE/R/gdVbtyD6VmOJXOwVbkDQIk
 BD2gOSfKkIyfiDz9KFR1MTPEkWH741CBs9oqk2tRf6lnJVPQGp6YYuIyaFJXQLFSuJnk
 Jtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949568; x=1788554368;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ik9fkOrzmK2aemc5wgARTvXw3fod7CcqPAPzf7N2Xq0=;
 b=luJzp6jlT67hYNA79XJu9049PlEKZJLDn5pdQgq97NkORaHwehXqRmAcyGTJpW0fc6
 QiYt79ns4uf3Ji125UyOmPHLsYgtoDbnbSsuQKsjFAqSRw3vUC7yp09YVjSqYm0Czrsv
 Pk/2+KRjMKfKPiW5taKUB70xPCdzdk+M/KKHV4z6mAgt3avsjQ21OWD3NSwKvihNP9D3
 2lRgx9ioTsIzo+fhM7EidsT/wO2azfvdAyY/UlJKet4KnS9hyjZuXxZyl5V/K/YRHvog
 dg4EiK8mb4lbJwy08hSz6/wzXchI0fSI11svfqchgfMGeit6r+eB3qYVU9ZdBd2ppvn5
 KqIw==
X-Gm-Message-State: AFuF++m6TtkS2OFw0YFxlBhHgGYCAjFDg6aywqbFCcBhnuSn+F03afxb
 DWY4X1dCBOJWG70dawWQ3t31g+Q+GYkXcU+LCIZQi9CtELc8JFWqiqyS6VJmE5n+7pg3bRAKh7t
 3H/9xzVaPWkmoIPmviQ07FYat+AVFYA83NJ1bHsAhKiuZprF0KiIp3WGU3w==
X-Gm-Gg: AR+sD1332D8h+1QkXNPpNApTGj7Gfu/o7HE3hSs6WKRYROwqyKcaHEzaYnDmYtyrj45
 2FOnBD3g9/DXYaymgTrJioroI0RP6dwXrMepQfdspvGJWfj0OGyK8NzeC59wuvVnnwwG3OwQd92
 ClREVPcsCvSgOE/ovo4mJuP0FROCJiYvk1Wx64Hon8tJQjzN7v6JIps6RB0LUsnCwuY2o/cu39A
 U3CYAv6VkQ3dc/1ucS3qGlCzFIS1sELIkELvHh22JEFDbj1DTtY1Kit9uKMH873F5tpuxxpXAya
 kzVTLJxEKzyURrK6tPCxQsQa72twqJQFvk+c8unDNgGQBfk7SBEvqhTGsg6pyQo12WfSUzu4ZLh
 g5TFBcNhQMyhdFEfqyn3Q8ImdAbnTN+UNNJbTMw==
X-Received: by 2002:a05:620a:8003:b0:936:cd74:4f45 with SMTP id
 af79cd13be357-9391391b3f0mr1108052385a.37.1787949568156; 
 Fri, 28 Aug 2026 13:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:8003:b0:936:cd74:4f45 with SMTP id
 af79cd13be357-9391391b3f0mr1108047085a.37.1787949567604; 
 Fri, 28 Aug 2026 13:39:27 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:39:26 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org (open list:Trivial patches)
Subject: [PATCH v5 00/15] hw/riscv: trivial code dup work (riscv-server-ref
 prep)
Date: Fri, 28 Aug 2026 17:39:02 -0300
Message-ID: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t2n7j-cwXJGQuIK7tUD8quDb08IDUNa9
X-Proofpoint-GUID: t2n7j-cwXJGQuIK7tUD8quDb08IDUNa9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX47FpL6uewCFs
 8VPyLt0XIn8oyL4VGrtYzm/zjZoCe/vPyvCeTsXHBrJUoQk7rUzdCB5pQiL7xM5mcU2sdwdoU6y
 3qs+H+yIPdgZ/It8asYbK/Mvb9Z+ECk=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a91f200 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JHoZMSoDeIQRRqepsAEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX5pIFBONOswzM
 FM07368wi66fhA3men9JkEPN5Mk0dVrU8W9HNTgWc6K6+YKmaEIBxgCVivXGS24uBN2QOgYMIZL
 GsIQ6m28OdqsEJSCCDrHbGkruP4gZ6zCPnbgAAu/Tilf6+o7gSuw8j4TnvXO6A3NDVcZUb7UIBf
 6tDen4fWL1C6Nfd4Hv3nKLxTt4GzmdTZg6TrVMd5W2N5Kq5bEkKlGDjZzsHoYc9gdfL3UzXrkk6
 kE+vk2FkblZBtmjBUPoGGwCODVykLCFZpMn+zST8ArXkeILqye4dBXo8ZEoelLgrthi9kuYBPgr
 H0vn4zCRUcgoT2h+sTEU8dcrxD5u1aI4IaE2K2kYIDjdGCe4cY8VzO5oO1Ow+Q5pbU3jBOhK9We
 SyMn65Fa6Ov3/3jG28xxLRH9LoV/845uM2Eat6gt9vx34lsvqo1gXiVxb5QAM+JxTpTietevG3U
 YGD850l5dLTDIEd4wpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280179
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

In this new version a new patch was added.  It is a fix for the aclint
FDT, suggested by Chao in the v4 review.  We're fixing the FDT before
moving the aclint FDT to the helper in the patch that follows.

No other changes made.  Patches based on alistair/riscv-to-apply.next.

Changes from v4:
- patch 8 (new): fix aclint soc/mtimer node
- patch 9:
  - move the aclint FDT to the helper without any changes, as stated in
    the commit msg.
- v4 link: https://lore.kernel.org/qemu-devel/20260827222608.329788-1-daniel.barboza@oss.qualcomm.com/


Daniel Henrique Barboza (15):
  hw/riscv/fdt-common: prepend helpers with "riscv_"
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_flash()
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_syscon()
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_riscv_iommu_sys()
  hw/riscv/fdt_common, virt.c: add riscv_create_fdt_pcie()
  hw/riscv/fdt_common, virt.c: add riscv_create_fdt_imsic()
  hw/riscv/fdt_common, virt.c: add riscv_create_fdt_socket_aplic()
  hw/riscv/virt.c: fix aclint soc/mtimer nodename
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_socket_aclint()
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_uart()
  hw/riscv/fdt-common, virt.c: add riscv_create_fdt_rtc()
  hw/riscv/device-common, virt.c: add riscv_create_platform_bus()
  hw/riscv/device-common, virt.c: add flash helpers
  hw/riscv/device-common, virt.c: add riscv_gpex_pcie_init()
  hw/riscv/riscv-iommu-sys.c, virt.c: add riscv_create_iommu_sys()

 hw/riscv/device-common.c         | 168 ++++++
 hw/riscv/fdt-common.c            | 613 +++++++++++++++++++++-
 hw/riscv/meson.build             |   1 +
 hw/riscv/riscv-iommu-sys.c       |  25 +
 hw/riscv/riscv-iommu.h           |   3 +
 hw/riscv/sifive_u.c              |  34 +-
 hw/riscv/spike.c                 |  30 +-
 hw/riscv/tt_atlantis.c           |  22 +-
 hw/riscv/virt.c                  | 861 +++++--------------------------
 include/hw/riscv/device-common.h |  32 ++
 include/hw/riscv/fdt-common.h    | 146 +++++-
 include/hw/riscv/virt.h          |  15 -
 12 files changed, 1112 insertions(+), 838 deletions(-)
 create mode 100644 hw/riscv/device-common.c
 create mode 100644 include/hw/riscv/device-common.h

-- 
2.43.0



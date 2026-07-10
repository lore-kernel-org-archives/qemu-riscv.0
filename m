Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B77C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 13:01:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiAqx-00064e-1D; Fri, 10 Jul 2026 09:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wiAqm-00063n-Vf
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 09:01:06 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wiAqk-0005zL-88
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 09:01:04 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AAmi6K393304
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=wAkmYPr0MnelD8xW3IvffI9h7BZbNMFvI2i
 1piqFbrc=; b=YzvdB0FXgpK0AhUKWRl/PKRkMzah7Jc9W2TWD8j/FVUwq+PXeQe
 k4/gt76UfdHG0vJVcQZ7Zka8LgCoYkTWXX2AvGDdjMmrl95rtMYj3ZBCFCdnvb/f
 lz4zGxE6TGFyxEJpWvORTBRDll4ybYo/AlvR7cLjTjTcrZ+nhscebIdUNJwPz8xZ
 9OvMCvbf3Waw3GGA8eTNlr2cdCLC94B1arGARKDwaSBJczI7pJVcVT3aPALWsAPX
 wRiUqlltpv8h8BedgVuTNh73iTZx9IgR2d8pEgodlVRBLbYWmwdyDEySBkJJjtnP
 Krxb58CBlK5/oOKqqWLVdOsmIb14ibLtCbA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8kcpa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:00:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-387087245e4so339280a91.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783688458; x=1784293258; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wAkmYPr0MnelD8xW3IvffI9h7BZbNMFvI2i1piqFbrc=;
 b=LqMyNn2x9UL0UP6gteM2Z32SjeyLwl3dPI4k91fZwmNoHTHCoYodepuw70hL5j9a0W
 SPU5259wVqyWF0s/MMFzOfymelbJnpvb39nz7kjfLg4gbNSorLpalYvm4CYlPxghblrq
 fq75+uF9wieDFdzeJHanxeRVc3XlXzZAYukyyZakqg75DxYcfPuKvd3iMPRronaySgZ1
 35JYLekpac96t+U2bo/jSnJ31HV+6BoT72pXrv4rhpDlTjLDn8jlSGJmU1mXXjsnFKs6
 k9jdX1ZNvHqUutKRNlNq2h0d66uuPkAelECT/zt89pI+X5hQ/sEOTnHo08NOke4tvEYX
 FDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783688458; x=1784293258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wAkmYPr0MnelD8xW3IvffI9h7BZbNMFvI2i1piqFbrc=;
 b=pqlJVuydyzuaLtlCbebARMv76rQrYwpxZkJFePrqS5JZKGP2D/OoPNm+7YE3bXnR5v
 MpIBSn63i2idVX6PTjpJSTSXlfutQMbUaOva7EsMT/zm33dvBQ5enp37xluGGis6x2//
 ak8Fuqt9WhmZKwGpoK8L3jjh0r8OukVMldM9NMeemiyjnVBugL0OHn1ld7BSouw6TKaP
 /liEK6wDvX0vDkG4GJIgw+McAjY1RSGsd1cybCmjLzXH4T+wFktTpGemwqnMqT7tuy3O
 mj0vU9Njv/CBqnGdnnnWKrZtzYnYTiaOzS3ezbb0JpG5V5sa9GvupXTieGeJ+oMkak/h
 Oz0Q==
X-Gm-Message-State: AOJu0YzfosF4bIP4uLPJ3ybgjnfQWqnjFMX/teUW1Xt8posF+RcMzMAV
 WctqcfFZhB08E1YsLaElmR6Hf9FNY4BzAx/69MolK6vUXfFp1kl8UlnQZrvWsQ5OLDxfy1F60o9
 R7sKyBxlSq+HR8Rw8HqyghHarh7H4JZFzuP4nebcXKFvzegT5YGgeIiZuNkkTNRntFw==
X-Gm-Gg: AfdE7cn3337ll8BuJtNSH5x8sxpcdQWKpKs7EGwjQRXZhrZ6O60Pu0tLHOAm6/YEa6j
 ul+2B6Ckpj7z/OuUl1V+JcVbcO9wvX923sooWESuKT1Qum7u8D6HXjNS88gICvE0KByLh/YXqAf
 rC3uAhwBq7knUxB7XJBTaytsYbUhNFlgEYwI8lhAmxyw3QMRgZ7wH1ZNCUJGcoWzTXWox3g8OYP
 eEPgbARsFHJF/b5aFpxiySezU4IevMYECVtQPhZa1oCee9KdA+eZt+EXHD+upEV4FtxOnQz/r/x
 apH+43OvTeuJrfFLXGZ2sojNHFbsNdaRvnqEJcS+xCkiBXfowCsch9lZGImKZIFyEsLrSD+Ke/U
 uiTjCyXjJouyYte77yQUp2lSvxBxUUu7ncrknN6WqEKv7poNMFj8BhS2wMRqYopR2D0KeHOKsIc
 AVLrTjC1dnJDqNw1TQIo9PUDL5IvR7m80wcDekI+XD2A==
X-Received: by 2002:a17:90b:3941:b0:37f:f00b:bda6 with SMTP id
 98e67ed59e1d1-38a1c2a5389mr6478921a91.0.1783688458248; 
 Fri, 10 Jul 2026 06:00:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3941:b0:37f:f00b:bda6 with SMTP id
 98e67ed59e1d1-38a1c2a5389mr6478889a91.0.1783688457659; 
 Fri, 10 Jul 2026 06:00:57 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-313b4cbafa1sm9611839eec.6.2026.07.10.06.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:00:57 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH 00/10] riscv: add initial RPMI virt support
Date: Fri, 10 Jul 2026 18:30:34 +0530
Message-ID: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Sinu6Y8Nlm3-dDfmt-MKtPmF6-WXQeFP
X-Proofpoint-ORIG-GUID: Sinu6Y8Nlm3-dDfmt-MKtPmF6-WXQeFP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX7sVOyozCgBVW
 yeO54v9WdZqhQ+juk2xZHz36H/2rx/8fCVtdDQRDW5+f4EpedKZjlaWHNeQDiH/33bfKNUG15iy
 OKrAhU3ZgbJnaSrGcqfSaZFRv8LCpoA=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50ed0b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ifwrZjGQlPW6EF0WfpIA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfXzV+uHlX33fSV
 IW1xtXXL9mPmZvlvb1Osw/5rwNtqmDDA/e5XiQzc3IMCBX1WWTSJopZ+R+LZSZtrnatycTNyr4k
 s7LQDBQ9SoduM9JoQsuOlF4uv7ltSMSXxYba9ZQEMw/vpycjX2FH5Lj3HspskcMBui6neoAgs4A
 BqeWncmguky1uSVxPQr5nJe80Ixxch4mbH4vJtSF7VVM6ADbt/KRacQmRKXGYSWt1yA5ZEoDKVg
 F1bjhtKt14IQwfj4avgn02FRT9Vx0/ZTLAEyZYU0M6hhanrl42SMtPwZjSQe1wPKI2Ne99JE/sA
 dko96n62Ii1jLoI7hnN1BVSCGxfCAGYNcK1kFvauZn9XXEd1mQIw8fF0jcmN1bZxhqISTfFOae5
 8Ws+VuytK8kB3fI8IYO9U7e8wabGZSdpvCtSQhRa4YYUJlu8tObu4PtqAnZDwwhPpY7L/GXowhG
 JU+8ieowHtWJk14KSkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100129
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
Message-ID: <20260710130034.-uBBuByqqjYDZzZXvzXigH5424nMim3E6NDOxioLeUw@z>

Add optional librpmi support and the initial RISC-V virt RPMI
implementation. This series introduces the shared-memory transport, FDT
helpers, opt-in virt wiring, and the Base, System Reset, HSM, and System
Suspend service groups with qtest and functional coverage.

The implementation targets the RISC-V Platform Management Interface
(RPMI) Specification v1.0 Ratified and uses librpmi as the backend.

Subrahmanya Lingappa (10):
  build: add optional librpmi dependency
  hw/misc: add RISC-V RPMI transport and Base support
  hw/riscv: add RPMI FDT helpers
  hw/riscv/virt: add opt-in RPMI base support
  riscv: add RPMI system reset service
  riscv: add RPMI HSM service
  riscv: add RPMI system suspend service
  docs/system/riscv: document initial virt RPMI support
  tests/qtest: cover initial RISC-V RPMI services
  tests/functional: add initial RPMI virt guest smoke

 Kconfig.host                               |   3 +
 MAINTAINERS                                |   3 +
 docs/system/riscv/virt.rst                 |  50 ++
 hw/misc/Kconfig                            |   4 +
 hw/misc/meson.build                        |   6 +
 hw/misc/riscv_rpmi.c                       | 558 +++++++++++++++++
 hw/misc/riscv_rpmi_hsm.c                   | 287 +++++++++
 hw/misc/riscv_rpmi_internal.h              |  42 ++
 hw/misc/riscv_rpmi_sysreset.c              | 206 +++++++
 hw/misc/riscv_rpmi_syssusp.c               | 191 ++++++
 hw/riscv/Kconfig                           |   1 +
 hw/riscv/meson.build                       |   1 +
 hw/riscv/rpmi-fdt.c                        | 103 ++++
 hw/riscv/virt.c                            | 167 +++++
 include/hw/misc/riscv_rpmi.h               | 126 ++++
 include/hw/riscv/rpmi-fdt.h                |  41 ++
 include/hw/riscv/virt.h                    |   3 +
 meson.build                                |  14 +
 meson_options.txt                          |   2 +
 scripts/meson-buildoptions.sh              |   3 +
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 172 ++++++
 tests/qtest/meson.build                    |   2 +
 tests/qtest/riscv-rpmi-test.c              | 684 +++++++++++++++++++++
 24 files changed, 2671 insertions(+)
 create mode 100644 hw/misc/riscv_rpmi.c
 create mode 100644 hw/misc/riscv_rpmi_hsm.c
 create mode 100644 hw/misc/riscv_rpmi_internal.h
 create mode 100644 hw/misc/riscv_rpmi_sysreset.c
 create mode 100644 hw/misc/riscv_rpmi_syssusp.c
 create mode 100644 hw/riscv/rpmi-fdt.c
 create mode 100644 include/hw/misc/riscv_rpmi.h
 create mode 100644 include/hw/riscv/rpmi-fdt.h
 create mode 100644 tests/functional/riscv64/test_rpmi_virt.py
 create mode 100644 tests/qtest/riscv-rpmi-test.c

-- 
2.43.0



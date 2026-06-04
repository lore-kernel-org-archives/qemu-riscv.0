Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5344CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 09:54:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV4lT-0005Xg-CV; Thu, 04 Jun 2026 05:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4lP-0005WH-Bb
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:53:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4lM-0003lU-QH
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:53:23 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6548UXDs1132197
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 09:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=kdUL16Bl9Es
 rcnZahIysFeQV2Fl79lBtFPC2hJwXPYY=; b=GqT2+SEu8949aFQCgzzahdn/WsB
 ehWGYGk3Tq6Usvhgb4WERRjEF2Aoe3s8GVNKPPtjnkzf516AxTYC67unPar8Ujmr
 9Zm14Igj3iERXnr8vcZU5f2Oz3z69uDY3bcIhqBWLRyWd5lG7DJf5KbnQcDaG/oC
 VKpPFxkxQAyMIXD9NDoscspCmguQHjZCr/hqlIC1ISUYDnLIxmE9qVkC0FLOYYP5
 bRAOu7cQ4hPpuH6pvO+LBApUPAhhqEfGnWFC7U0DwK/ADlvyU1HGu1Kua8+omkFi
 hRzmMG7IuExWBYKTAbl+z5sitsca0Ae06dzr0QCGEjkwUAICa5WB9E2WEuw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsga9n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 09:53:17 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-66053e40709so509796d50.0
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780566797; x=1781171597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdUL16Bl9EsrcnZahIysFeQV2Fl79lBtFPC2hJwXPYY=;
 b=jIXTzwwyzSpjkSwak2f4Wfjn6aKBh+8/b/mqjPwWjUT3U+/kEGiginjwnFyQJvWufB
 MQoSE2/buu6hAO9YWyS/n5ZVnOQ7DjghZfkz6HFphf9m96oxmVd8G6mIBj1OD4EwI4Hu
 qgHqU2yJ51vGP8Fc6LhYq3v7WBIH9+DHMDs/xhSraWIjAlJfMk1mxos7K48ncsOotNai
 XnTOEdYpitgDbTM2Sy8M9kiP/JXXJnxkCIIDeB6zAyArXJ6p7zahN2bS9fyKI9t4G+Hu
 bySEfeh3fWH13vaH0Yiy5Qhdb+1xL1h3gI35q7pGoc12nhLPDQnvCdhUj1p3ZohAgf4r
 77QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780566797; x=1781171597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kdUL16Bl9EsrcnZahIysFeQV2Fl79lBtFPC2hJwXPYY=;
 b=oCyyet4h3+FmWXLWUDjmEigdcQzKoHcDJPSEjJnBgYu92Jt0fv6hPVlgw2pFIbKVTi
 3dVtCDa10/vcQGqTovjolzKftEfPGnZHytVmJn/xetfpwHZObCvkXb7dj6CI/gqTB5dK
 cRxhd/DlErCbV54J/qGnkYi/Cb15yuzvcjTd4sKiVDu32r2pia8QsbrStdgFM+81gFbC
 9tADS1FPVyufvo5MPPC4Te315bfTj9XVG8wzhzKlrsMPWwsXPF97v9wNJxj1r1D1KROz
 GmiHtQfVAXExDPVG+IDslusRyBYcgEQ0cpbhvIU1mr3TNzjW5zhegPm1NAR/K/S1fwce
 C5Rw==
X-Gm-Message-State: AOJu0YzS40aFsupJy1675sHcW1dTF0GD0BluiptHER9gDuStt6KYptgu
 YQM0zlWZdtHmVALOg/m1kDu8hJKU9IJYz6juiwwfsWUD5QiEw+6HTNb9EXFWBrU90KGbcwSDCdh
 znYsFSfkmIMtOTTo7WaVBU0ZWwKi4YmP6t2bDTbszTFP9d88VMgzAnDgNObOIEZFCew==
X-Gm-Gg: Acq92OFdI/qZqH3UY+zp/sUv9Gsao5ozyqQLATEUFHXhz0TaMztQO/DndnEJmTL0FDK
 nCqxlaiPa7lH8KYPPy8dj6T5b47TKjiUU/L7zSkMxwgjJXetSRQ1ySOZnRxVI2vlBqN1WVBxqeU
 +ZoOMOGXusIcJDkz/YX4/Z7DASTVEAzVNko81kBBqw0Cpw6wuYeX/TomFVw3iQrDBYiZeCtsVC2
 Cdl6bSJvpnw8UrnUD4o6xrWxv0t9PcUCeLGd1cP1t96mGQ8iMUjFIz9J58lONFS2YnwpIF8TYwm
 Unkd0ToFXOwOevZzMYLBmTrgsiZKouxVcb8k8IoLzUVUaavu9Jn+VZXabVWBwgiXilZy7s54pxK
 VxM1385oJ9pMHjhWmRuxa103e3Gl8uHOw10EnMuoSPUImzRW0Qjn2+YbpqzdzJ2jAjHU/Gw==
X-Received: by 2002:a05:690e:1286:b0:660:7bcb:7aae with SMTP id
 956f58d0204a3-660f125eaf7mr2342243d50.44.1780566797299; 
 Thu, 04 Jun 2026 02:53:17 -0700 (PDT)
X-Received: by 2002:a05:690e:1286:b0:660:7bcb:7aae with SMTP id
 956f58d0204a3-660f125eaf7mr2342223d50.44.1780566796885; 
 Thu, 04 Jun 2026 02:53:16 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-660d64ba680sm3522830d50.21.2026.06.04.02.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 02:53:16 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v7 5/5] docs: add riscv-server-ref.rst
Date: Thu,  4 Jun 2026 06:52:44 -0300
Message-ID: <20260604095244.3313259-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6xTAlTD5xQPR5DR0iY9m2wWV6BazARjT
X-Proofpoint-ORIG-GUID: 6xTAlTD5xQPR5DR0iY9m2wWV6BazARjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5NSBTYWx0ZWRfX0bOVX61KmE39
 LBMEgktQPXQzRDRO/wk3cTLOlH6N9QRaYSOZEKgyLlBINPnnir9r1z88GCyI10ZYRLIWMFtTn1h
 e/NgabD69mfI81zsDDARVAM9C0zw7xWT0FbPTedQs7jszzpaLxo7DsXS0JbYC9YwT0+F/F6P53K
 TCdJXA3tomy80V4c8hd2Lsp4kZDUgS0QZ/MGnAOgnEQyggMLYMpTTmf4IdCV8wsf37tT6hHyHpU
 Jr2kuoJJ+iyFnM1GntreHrvDsCRqzaQ9faDmYLeHdFEb+2AZNzq80O3gv6t8NEfyj2lPVhJNpMH
 vNjYFyT147UlBp0AIe9e/9vx2sd5PRfP7r8TmibcyOeF7OmNu74DqCXMZZFFtt5ZDyw54P9LtCF
 QdZDT/YJs+AQUdGNkFVZe9j2pu1dnHj8ovvLtvtGIlYsbTewXvaKCX+POxtrpBFcMtJq06laHmk
 /V+2RGPf61Vp5DegcjQ==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a214b0d cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=6mToRrmzC69ltaW8jJwA:9 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040095
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add documentation for the new riscv-server-ref board.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 docs/system/riscv/riscv-server-ref.rst | 52 ++++++++++++++++++++++++++
 docs/system/target-riscv.rst           |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst

diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/riscv-server-ref.rst
new file mode 100644
index 0000000000..379b7ef76e
--- /dev/null
+++ b/docs/system/riscv/riscv-server-ref.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+RISC-V Server Platform Reference board (``riscv-server-ref``)
+=============================================================
+
+The RISC-V Server Platform specification `spec`_ defines a standardized
+set of hardware and software capabilities that portable system software,
+such as OS and hypervisors, can rely on being present in a RISC-V server
+platform.  This machine aims to emulate this specification, providing
+an environment for firmware/OS development and testing.
+
+`spec`_ is version 1.0 at the introduction of this board.  New spec versions
+might trigger a revision of the emulation itself, which will strive to always
+match the latest version available.  In case the emulation changes aren't
+backwards compatible we'll introduce a versioning scheme, probably via
+a machine property, to allow older SW to run with older spec versions.
+
+The main features included in the riscv-server-ref board are:
+
+* IOMMU platform device (riscv-iommu-sys)
+* AIA
+* PCIe AHCI
+* PCIe NIC
+* No virtio mmio bus
+* No fw_cfg device
+* No ACPI table
+* Minimal device tree nodes
+
+There are multiple ways of using this reference board, some of them being:
+
+* BIOS: u-boot-spl.bin; SD-CARD: <disk_containing_FIT>; NVME: <distro_disk>
+* BIOS: fw_dynamic.bin; KERNEL: u-boot.bin; NVME: <distro_disk>
+* BIOS: fw_dynamic.bin; KERNEL: EDK2.fd; NVME: <distro_disk>
+* BIOS: fw_dynamic.bin; KERNEL: <linux_image>; INITRD: <busybox_initrd>
+
+Here's an usage example with a recent (June 2026) ``Image`` and ``rootfs.ext2``
+files from buildroot:
+
+.. code-block:: bash
+
+ qemu-system-riscv64 -M riscv-server-ref \
+     -kernel ./buildroot/Image -append "rw rootwait root=/dev/vda" \
+     -drive file=./buildroot/rootfs.ext2,format=raw,id=hd0,if=virtio \
+     -nographic
+
+The images QEMU is using for selftests of the riscv-server-ref machine can
+be found below:
+
+https://github.com/danielhb/qemu-machine-boot/tree/master/riscv/images/virt64/buildroot
+
+
+.. _spec: https://github.com/riscv-non-isa/riscv-server-platform
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index afd86ca2ba..b2aeb39a8e 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -73,6 +73,7 @@ undocumented; you can get a complete list by running
    riscv/sifive_u
    riscv/virt
    riscv/xiangshan-kunminghu
+   riscv/riscv-server-ref
 
 RISC-V CPU firmware
 -------------------
-- 
2.43.0



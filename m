Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC1BC624DA
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 18:32:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2CE3-0001B4-45; Thu, 03 Sep 2026 14:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2CE2-0001AF-3Q
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 14:31:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2CE0-0001cl-9w
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 14:31:49 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 683IDItK1257096
 for <qemu-riscv@nongnu.org>; Thu, 3 Sep 2026 18:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=SMd74W35Owx
 lEVCWTBA0XddWMjlMOj1/Eg7By52iCgc=; b=fWZA3SImZo7IvCJKpfJR8m3hvh7
 umWfxuFUaEDDdeQMLkcwb9EI21BAJhbxfiNV4JnJ+rCm/UeqAngomQQSvc6A8kwQ
 ix1TG/sSzsRKxkBqGjLPIddeR5pk3gPFcb9c9UJOglwr6LKSAuPAc98Kv5zaz4fy
 A2PSGEvzaOtVr0bLs7n3sCHhQKrSvPSclsoXJH2N6OK9d4mh2eDkue0JsXjR6axd
 nBVP1sxTepUvjIezVCUdyuMCrZFQ0wwMWPWdxEwn7pGll+V0yXx+LSUvXQF5N4IT
 KndCnzWGkOPnzxDG4vALXfuFj++eDxLhQYJuvBG8FwpxrvFCdi977YwjJCg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxg34j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 18:31:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-90ceabcd64aso3448846d6.3
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 11:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788460306; x=1789065106; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SMd74W35OwxlEVCWTBA0XddWMjlMOj1/Eg7By52iCgc=;
 b=RAEzA1ggoGPIvIVIUVdYRe8fR//letBSrFj1LRWDhvWazB1s+l5pvkNxBp2IicR2rI
 GZLADMmcXQjU3aA+A70LZKymI+Qrtd3vInLBkfbWAvWXZwVW9yFDDaiVfdcD5RxspNJb
 IN8aaqAY2vXe4O08rY5n1A3CBgzyasKEqk6mACGv9/L3VBfXZ1JfAXrGgxBlGJ4/YsRx
 UE2b0/NRnpdkRQSIEvuTI1JoYTXozFHJ9S0kmMpXHtF/NXh2MVje/Pyyl6RfpNOfQYbM
 w55BwWpOUAQ9lS6EBiD9kiXeK2IYjvAC8ohhwRPoblgJ8y3KykbaXtavFzgLqhesjf2h
 7cBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788460306; x=1789065106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SMd74W35OwxlEVCWTBA0XddWMjlMOj1/Eg7By52iCgc=;
 b=jvROwRwfsvTKcktXQuBOCBgqB6D3mw5l1GiT7Z+1UXmQtJU7POe+D1GeYAKKbT2IUB
 kuy6vZG+Lj/qFxbx9L3ZCCHhC9DFk56ET2QiUFbHXcekH6GyYPj7CdzLBRZmh+2Kg2xE
 evy7osY7n7frZTdOT4SFf28zXQdoR+IKhfnwUFfbCkVmXH4sKvF9CtV2zGYwpSGdxnrv
 0j2ueEwpq+stvnSgr4M1PkG0SRDLTTvfvlbsbVntEFqY9+GW8EGZfKYjE4qgy4jGcRhf
 efShFpJN42MlB/GqfcskM3hC6gLhsJmsm3SzSM3YBH19DRkN3lboWwaJO5/0KZQDh4p3
 8gnA==
X-Gm-Message-State: AFuF++m1aToJlwC/kcCDW/IFBmXFr/Z4eZnWkxbCWNbrV83t+b9kQfQD
 E6FvfEAOCgCcJ6vgDHxPgGZvcz9zUKhq95Ey5YP/O3BmCiLyXSH0ehiGl5rTDXoTT7l8wnRsFgR
 ZtEE1rZpQtWTBEOJrlYkSuHQ0g8YNnsm5y2XdKui/WhMBI/Jhwq1x6ooizw==
X-Gm-Gg: AYBFou2MYON547eCYrWsjEupgDiIBo9e4WFAOHW2BX/R5KreJNN9jeQlHGc+udEbKnu
 X/ozctt/vq4tND1sl1eiBfISFuyP22rWDUUelfYB/BxRMDSbjbp0lQQH2IyDY0ylk/69kA+/d3w
 zXJChi2Uoh9FP9PhtmHnjaBXrj0r1knChtHTE335wsZlB/SpvUwwuC/vFfiWOwaACH08vmCL0Pc
 dEB2TuBnimsVh0KhowKMLqtUcCqwezPHYUTQftP6RWoropCUhRWo3MdjIdEeVMiSPuvUpc6Y0gn
 OnWJUGq8Q12GI8kiH5VQvINgabx/u0i7Yg0RlreC7jGUP4QiDN2SBwvgfpu2PgKZrEXn6vZegOb
 W8g/uWNY4gj38RISkj+bt9OR7sTfZryWecgQV
X-Received: by 2002:a05:6214:4e82:b0:90c:4422:84d1 with SMTP id
 6a1803df08f44-9103f043439mr13041086d6.30.1788460305810; 
 Thu, 03 Sep 2026 11:31:45 -0700 (PDT)
X-Received: by 2002:a05:6214:4e82:b0:90c:4422:84d1 with SMTP id
 6a1803df08f44-9103f043439mr13040296d6.30.1788460305114; 
 Thu, 03 Sep 2026 11:31:45 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91040693aaasm603596d6.34.2026.09.03.11.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 11:31:44 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v9 5/5] docs: add riscv-server-ref.rst
Date: Thu,  3 Sep 2026 15:31:25 -0300
Message-ID: <20260903183125.682865-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903183125.682865-1-daniel.barboza@oss.qualcomm.com>
References: <20260903183125.682865-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rNy783_tZrK_gdULn58336BAlCtI0NfK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2MiBTYWx0ZWRfX7lZFxBN+j3T2
 ntUoU2C4feCq/hEUzx2LRvRNmJWj1qBCtVGb88Cy0IfVrJRw1bXJQ4RA5DA+u+Ts+4kojnhPESG
 XeRs7SM3o5XT/H3xVzX4w9iqTik1B7Q=
X-Proofpoint-GUID: rNy783_tZrK_gdULn58336BAlCtI0NfK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2MiBTYWx0ZWRfX+ifp5tVdyqOZ
 qqBV1y47LPPS1P3YdX5FdIaWgL9FvhoWZPXTHG47jK8dUOgk57FSavE7U3wiWolroieBze05odF
 xrQ0puSQaqGAhQD32ydQdu7upMDU3coQ+OAwVHgnFUQcY+lAcjSaqVfcUvQ4I2/r8cB26Dt1CK1
 0TLV0LpbzOLaDb9jAuMNnEAhaVsxh11sIay/hA0yMXVM40cxUGYQHF8R9WLowMlOK+rTaMXhTRK
 LoccIT0YKPAn/wG7p61Be/e9ki1P19YVcSkL2aEg6K7t80yMxIM3GV9NIBjDCuXG777JT5ezlUR
 USl4g1FT2V9rsDdvIUIkxrqoxnA4Fwrz5BAgKrbqKkpgPM6G4ifZS6vr523AJk5yslhcn88rUcZ
 97/7flzxKy0kEugXG0+MzMs8+DUYaFToJKLkCHvxJFCtX6iKwJSDUQZpjP1HErQLK7WkYJ4R2yu
 VWTTakUMlIURrL3sznw==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a99bd12 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=NLiCwHATAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=vlmih187C6Ts2ntwv5oA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=F9tHCgz3TLBaZgltkx5D:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030162
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/riscv-server-ref.rst | 62 ++++++++++++++++++++++++++
 docs/system/target-riscv.rst           |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst

diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/riscv-server-ref.rst
new file mode 100644
index 0000000000..0573b4e07c
--- /dev/null
+++ b/docs/system/riscv/riscv-server-ref.rst
@@ -0,0 +1,62 @@
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
+There are multiple ways of using this reference board.  The spec compliant way
+is using an EDK2 image and a TPM device.  The board was tested with the TPM
+device ``tpm-tis`` that uses the external ``swtpm`` emulator.  More info on how
+to use this device can be found in `tpm`_.
+
+To use this board coupled with the tpm-tis device, first start the ``swtpm``
+process in a shell (the ``log`` parameter is optional):
+
+.. code-block:: bash
+
+    $ mkdir /tmp/mytpm1
+    $ swtpm socket --tpmstate dir=/tmp/mytpm1 \
+            --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
+            --tpm2 \
+            --log level=20
+
+And then start QEMU with:
+
+.. code-block:: bash
+
+ qemu-system-riscv64 -M riscv-server-ref \
+     -bios fw_dynamic.bin \
+     -kernel EDK2.fd \
+     -drive file=nvme_disk.ext2,format=raw,id=hd0,if=none \
+     -device ahci,id=ahci \
+     -device ide-hd,drive=hd0,bus=ahci.0 \
+     -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
+     -tpmdev emulator,id=tpm0,chardev=chrtpm \
+     -device tpm-tis-device,tpmdev=tpm0 \
+     -nographic
+
+
+.. _spec: https://github.com/riscv-non-isa/riscv-server-platform
+.. _tpm: https://qemu-project.gitlab.io/qemu/specs/tpm.html
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 2639866a3e..74e23fa64c 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -70,6 +70,7 @@ undocumented; you can get a complete list by running
    riscv/microblaze-v-generic
    riscv/microchip-icicle-kit
    riscv/mips
+   riscv/riscv-server-ref
    riscv/shakti-c
    riscv/sifive_u
    riscv/tt_atlantis
-- 
2.43.0



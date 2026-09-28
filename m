Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9B2CA5FA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:12:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBHhV-000150-13; Mon, 28 Sep 2026 16:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHhM-00010R-IH
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 16:11:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHhC-0008Fz-Eb
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 16:11:34 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SHwNlO2585813
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=qmlLFvHOl+Q
 WVPTAXMSb3zMQ2F+f3XHtHDzZfbQR0z0=; b=ec2SUidu0iV+DKFMzrZb6EVACEP
 Ox4P1srCKsLY0pGhL5Z36qll0nw+CblVS/CHT0KRtx7zJUUPp57lf7QffUhcJDpr
 SbIn2PIXomNVvC1geHRonAh6KTErgyUFmfzV3HvlH7fgVFflnQ6kj8R8/Lak7Xcu
 KDsulJdBkT+Bws+CI228HwmvHkH8yg7AOo7/nm9Nj0GxWwzRUCJZ+UK2ItfrHR11
 zsNSf+8C/l8oDwFCMI+LvoDPyMFyNBv8FN5lD2Xu7tZULKmkHZg6x8AaCHY+sUtS
 HeiA/C289IZrIghi6KWMkatlvl8/Sp6GtITZIZgrhGrZo2nwtwn2RsWAMkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfktmef-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:11:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-532c2cac078so56982591cf.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790626285; x=1791231085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qmlLFvHOl+QWVPTAXMSb3zMQ2F+f3XHtHDzZfbQR0z0=;
 b=DpqOKO2g5gAlW5ZEoMGL6YDgM2nQxYJUSHSGTjmge4mxsaWlg8HoxI78JcGTpK2enF
 jGPuc0W4o1iGI1GBqQdZiM28aj4kFKfMuM6/VdJS24UAgX3r+C6TPLb6nL8KIjG2KFOc
 Rw+06Dk2Pisjq7G+VZTYAXGoXWn3PVM18gcvsWmsfPI3Hj071LBBKYI7gLAaMmecxWf0
 DJV2i7Z5QFzGUKcf/Hz8djKORGqirJM/v3h7XNNpvOlpEQfIQxX7qrMmBSUmV+UUPXN3
 VZN0lU4iZ0U5wavYVnZLlvv6A9e/7oA0Q1C5pfo80rQAXSb0Qvv+X1H+XRasfM7OL+Ky
 DWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790626285; x=1791231085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qmlLFvHOl+QWVPTAXMSb3zMQ2F+f3XHtHDzZfbQR0z0=;
 b=2rXKxRO0/9JqSm6SYRJ0faDzqN22CPCYxLHErpytb9rqFWIYoT+8rsSO5ET3NrwUi0
 hZE4ws+UST5leADU+98OqtjnYSnng+N7x3/vTaaDPZ4ZuNTVxEM8gK39c16oGG4iNwpR
 t81ntkZJYP3GePv3HKzXbaaO+7z4XyKr45FMBkX3w2LBDCcU5wVw14lV61QZ7LM/wypb
 2q++EJgDUPkdXSHjhiMh0FAxILC2ZiYXWVXoGTauc8N/FFfR8t5S/6ZXO/IVn3keGNMC
 2AwqZBtwDwVMhewWpHjfeZ8uBd5IzldDorI3F89vw3moQLAxFQfF/qX9Y+8gQIG7TT6J
 kXhw==
X-Gm-Message-State: AFuF++mkpPjlqtmQs4sj1VX7qjYu9xTHEZI6XLrwFhIEcrzgVspPnchL
 gGzHYBm1izbhLKFduLqXC1E4m3pofto1R0UlmcN5+WTwC1bD44wlW+PD5lkka4/ga6/P7I8ovR2
 1jhHS027ydM4b8Wd5ovEDoZdhMKegTqhtjz7prrhGlBNRenvEXPc7vv7r1IloyTkxzg==
X-Gm-Gg: AYBFou2OPMbgfDg5F13rUgnd3sPzEmGLc42zzpwhIbhd3y3Hfg5XJDXl83Ouy0Rti4f
 AaDjr11OdI9PaQhc1MV0pDw2ie5LnzFjyUIJlqKVSfjk/kUXpR5Zl8ttwCZLxKMu2x91NHxsT5M
 0eUH5TvwJpDGPwIzZKTESMemeNMmEMh8QyrcBW9k56zerXMqfX//4WH0H1514xPToW5ltP6pDuw
 iflUBvF0o7+zG0UhJAMH+AZ45u7j7ATR/fIozd2zKrIN8PIXFyxHgLVyZxvbFyuA4oEAwNwfG1q
 ONbQjQrUpXcbjviKhXHEPKK5KhnQd+NVorP/SE4VSrkLkJgsHUh+61Y2fzUuRa/7h8sCarNNMW0
 81pUtokZSOG+6drkLgW5Pm3538JKIkDRLZqU=
X-Received: by 2002:ac8:5994:0:b0:533:35c8:6996 with SMTP id
 d75a77b69052e-53335c86ddcmr120239341cf.21.1790626285420; 
 Mon, 28 Sep 2026 13:11:25 -0700 (PDT)
X-Received: by 2002:ac8:5994:0:b0:533:35c8:6996 with SMTP id
 d75a77b69052e-53335c86ddcmr120238821cf.21.1790626284776; 
 Mon, 28 Sep 2026 13:11:24 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-914399d5002sm79815646d6.48.2026.09.28.13.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 13:11:24 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v13 5/5] docs: add riscv-server-ref.rst
Date: Mon, 28 Sep 2026 17:11:06 -0300
Message-ID: <20260928201107.2049458-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928201107.2049458-1-daniel.barboza@oss.qualcomm.com>
References: <20260928201107.2049458-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4MCBTYWx0ZWRfX4R4/q7rwE/1o
 VOrGr3zH5jRJCTbjlmS8gtkX9DA6TmovZneelp2NBX2a9gfQ7MpLtJonFmVIfcJN81Bzl8IthXT
 lVF9r2zJD8RY+YsrE+J2SSvxgjzR/ZSL1UgT8UyFLf1eLoJ5axVTEnm7iM3g9/ZbYQGmQkP7yA8
 hqaoCof48y0kwE5wTLDRfrWLklgc8kflv9RBz32YJDy+b4AFGABdMkmcTskMKkAnRbLKC0XWHvI
 al6h57Wjw9JnR5BLEVvqSUa1AyMkmL1KbBNhtzKUZSCkK3SXxU6dls2khFA/3UC3jS7VfiyFR0z
 7H4iUO1H7yAjYZfcmufegm2FqB5novTub4tySVjJFuVUkCtaMtRDJ2KgRg+akCC5F4B2/wGqfbi
 YfBby7+KeFMTiHA9J9ZmCxAY26fB3gEkutIz9MNVP8QHKhR5rXLPvHFFJbDhz8zYOPVkjNk3IzA
 RK5TAlgyO6PlJczlU5w==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abac9ee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=NLiCwHATAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8
 a=vlmih187C6Ts2ntwv5oA:9 a=dawVfQjAaf238kedN5IG:22 a=F9tHCgz3TLBaZgltkx5D:22
 a=xVlTc564ipvMDusKsbsT:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: o39gDy6q9hXb6SgaWFDv36b1Bvv7NKmF
X-Proofpoint-ORIG-GUID: o39gDy6q9hXb6SgaWFDv36b1Bvv7NKmF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4MCBTYWx0ZWRfX+gZm2SUUck86
 Iv4nqQ39S+HRRi1NLgh1Zr3L5G9Sm5tO5uAVOe+/kMsV1+FJfchJqqksUl/LQeKLQ191c9kXjyv
 9aHmOm/PHUkm6JI+9iDeAmNM0uwAUgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280080
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

Add documentation for the new riscv-server-ref board.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 docs/system/riscv/riscv-server-ref.rst | 65 ++++++++++++++++++++++++++
 docs/system/target-riscv.rst           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst

diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/riscv-server-ref.rst
new file mode 100644
index 0000000000..da043ed096
--- /dev/null
+++ b/docs/system/riscv/riscv-server-ref.rst
@@ -0,0 +1,65 @@
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
+`spec`_ is version 1.0 at the introduction of this board.  For each new
+supported spec version a new versioned board will be added, keeping
+"riscv-server-ref" as an alias for the newest version supported.  E.g.
+for spec version 2.0:
+
+* riscv-server-ref-1.0 - board that complies with spec version 1.0
+* riscv-server-ref-2.0 - board that complies with spec version 2.0
+* riscv-server-ref - alias for riscv-server-ref-2.0
+
+The main features included in the riscv-server-ref board are:
+
+* IOMMU platform device (riscv-iommu-sys)
+* AIA
+* No AHCI (can be added via command line)
+* No NIC (can be added via command line)
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
+     -device nvme,drive=hd0,serial=ddaaddaa \
+     -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
+     -tpmdev emulator,id=tpm0,chardev=chrtpm \
+     -device tpm-tis-device,tpmdev=tpm0 \
+     -netdev user,id=net0 -device e1000e,netdev=net0 \
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



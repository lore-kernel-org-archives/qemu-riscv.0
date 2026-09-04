Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF8FC79F82
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:57:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2a1f-000319-73; Fri, 04 Sep 2026 15:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2a1d-0002zm-Bs
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 15:56:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2a1b-0007ki-IK
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 15:56:37 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684HIcuN3586353
 for <qemu-riscv@nongnu.org>; Fri, 4 Sep 2026 19:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=7j25nlXJ4K8
 6TmSfrmSHsNxcRMwAXuunMLYHGnJWTpM=; b=dkxxrjQ1/0VM9FB6ecZPlXms/iD
 sNJQB9HGP3zEaBBxAmFJm5OF5u7kgbdQuaLBYHZ5RJqhXzVsf+YZ5wyRf14mue8c
 bzqNQx9nkd80tNq8+zp+Z024YsocnMcerykHU48R5xNn89W7PLByDsesxT+mCG+0
 f7l138yKJzQvhvZzAaLlmwJ+0zEoJ3K8oPDQi/u1QMfGlAYT8a/gHiqQiq1NJ9k1
 JR+qyF1oE8H1JE/tdEgRoIQfKQRXJ+cl6wjwFJeZJzaCM7qLnXkyQhk/zkNfM1x1
 3jPii3HmDhrridop3/z7eSjYauw3fWFQe9luaXaa69nRgmUEXpie7lnIqUA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fkxhm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 19:56:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-9103f4ddce5so15867096d6.3
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 12:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788551794; x=1789156594; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7j25nlXJ4K86TmSfrmSHsNxcRMwAXuunMLYHGnJWTpM=;
 b=g920UasOilEB29/6/wK3U5+FvG5mezQ0PLVa52Wqq0wlFpUJpaxSCFhu7cCeS6viNd
 0lbvp9DKOpgHUqVtAyQxZz/hb1tkvo+SnOsZN/6bfVc0GQpBYX/0kazv86C3c9YxrvOV
 zhF9ci5/+9EBVLlPiRVi+4uabOtkU5wr1W29AUrTBboWRiqznz/vDo4EkJFtVYurJuhj
 mwtQIJ0L+m6qpyw1eOXRaWEly91IFCq2loUFzxzjX15KIIvKxlkeKwYrkIAQNM/4DjHR
 yNfxcnd+mmlRuTWwGgZv9T8kuRHiCkhR9x2iHc3qjqOEwNlFg8JFdO78qwrsToJeAFXz
 5awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788551794; x=1789156594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7j25nlXJ4K86TmSfrmSHsNxcRMwAXuunMLYHGnJWTpM=;
 b=W4wOSGK8ilT4alX1VJLUUDw1dr9IXw/0jTD6LPWqW+63MxzxG2VhXdNxIpGpyo5MWb
 trJ4Kii/gA/1oGWqkBjLevcJOadhEh/r1n7K9W9zRuKPB3Ge5fgqEzCwUEhRbvJi/3J4
 Cm7pv4Zlu4t6uyHAh4wZ9qI/YIdSty9qKDtozgdm/3PSz3iX++wvSX+P+ZEMa98TLAXU
 i9Lm+c6bLjTCp7U7qGKkCO5Al3ELGdiq85EWsL3qkvmbA41J7Sj3g9meGU7Vw9GKsuPC
 bT6NsXCiDK/nbQuiu1r1+juIyFxXdT/Y6tJT6oE83iXpxHgrdumfXK+cXbiLOU9klZ92
 ANIQ==
X-Gm-Message-State: AFuF++liFr3QVfV+sQ7PNyIBYS22d5EwtNbH2yi5vcmwFrE1vSCfacKo
 jZ5GifCwI5OepvAHEn+dqhupvmUYEzdLL/wjXLveLBOSLaqarpeG562B3ADvyp+2Tydk5RZN+cH
 irHLlKUboT+MiBQ67k5fbrh77ufU9WCr7bNurYkCI3/+Nd3ez4h/6ulr7vg==
X-Gm-Gg: AYBFou0LhahHb9OxIG/uxcflJqubNIAMhyPyveBJlg+soj7G4MFnj99PX0HSFdHioG1
 s4FOo4nQNlUi8kT+HNZDLtUMOHsJWj3bN3FJ6mCF20Nona58sbqBoylGTNBKGqKQ8cTy+MmCQXs
 ixjmKWC7i4R2eAu5/02iOVM+TBx1U5kCIZPjECyoMRA7e/GCZFLXIwVhyb24qv+U6ai/nBfBhTi
 2ZBozPJwxozDHE2qC/DjYckn+dnqAat7NglmNOLWSNQ1rOR2d7m/wXoesbVGNJaeNVHqgRPjGYe
 vZDyGrrJKQd5LrnW/kBjIF8BNCa7JpLW03kNaQmAb/3BWA7J+GChpG4eNdAS460nqleS9lPmmIP
 JroOBAY8W0bUJLW7pidAbIUwp5MQJvfg6XPx2
X-Received: by 2002:a05:6214:8095:b0:910:33ac:a39b with SMTP id
 6a1803df08f44-9103efb9295mr88676606d6.26.1788551793716; 
 Fri, 04 Sep 2026 12:56:33 -0700 (PDT)
X-Received: by 2002:a05:6214:8095:b0:910:33ac:a39b with SMTP id
 6a1803df08f44-9103efb9295mr88675836d6.26.1788551792920; 
 Fri, 04 Sep 2026 12:56:32 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910406871b6sm29117736d6.32.2026.09.04.12.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 12:56:32 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v10 5/5] docs: add riscv-server-ref.rst
Date: Fri,  4 Sep 2026 16:56:10 -0300
Message-ID: <20260904195610.964829-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9b2272 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=NLiCwHATAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8
 a=vlmih187C6Ts2ntwv5oA:9 a=OIgjcC2v60KrkQgK7BGD:22 a=F9tHCgz3TLBaZgltkx5D:22
 a=xVlTc564ipvMDusKsbsT:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: Fbn0BSVjWUI1RCULiBDXnnUxYQ3oLvi5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX5TQ93LGsOgQI
 lEzYnfQOoyXYEVKRTvupZap1qsZbT17I2EOHIje21jpzNATEdjbxXSWZzLaFhGOHBgn20FMFvrQ
 4eZ0bE6Xlab/R1CxhljR6Z3lAEBOngc=
X-Proofpoint-GUID: Fbn0BSVjWUI1RCULiBDXnnUxYQ3oLvi5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX6hrOATrEBQpL
 3Ao1mgKWFhvXv9xjN57FHWoWmbuLGp42Vgf5m6L4MRTCgZV+7gy3fMcroXf5d9w8sSNusR2CzGg
 Yn40TkJM0/ZL4d5fZGZzMhSgUfhyoeR5Pzgb/OT3e8Ij07A9lM9FIEs6lWoE+MQkWyUr5fKIu38
 NAayLlY0aBzxVvSCq5fn5Je9ky/oD737XJE8JNavnlKS4VEKRL37SOqH89WUvngr46QfCJ6bcAH
 LUUAE0tAfZuNrTdRIVJbxbIbb4I2fcNBKpfI6eRuX17j1TPiDD8yeFuEMVDNrL0q/VVCSwFRl8e
 gNt67BfZtFiWPE+TWA95VFnrgveEOzPkZ/Bq/+uciTEgxNM0VGxwsMdGijJxcIQCmGa8xpIvNuE
 49qjGR2ep1HePhcmSRB/eyKf3hE6G9AXBk6sNH8t2RguoXmvHl3tjfvNNsZxNT499AqLrZ/mznP
 Smq1MwjuVFRYiUavSRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040182
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

Add documentation for the new riscv-server-ref board.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
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



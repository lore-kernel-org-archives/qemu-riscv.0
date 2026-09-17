Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922B2C982D0
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 05:25:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x74bL-0007r6-7D; Thu, 17 Sep 2026 01:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1x74b9-0007lO-AD
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 01:23:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1x74b7-000494-IJ
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 01:23:51 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68H24Dg73237861
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 05:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=3N5DIquAJDq
 0p8J7L7bi5CfdFUY/7YEWgOuGF2NIAds=; b=FnZA4/abInizZg9SV9AHVzkmTY9
 DaAQeTZBTMk5wzjKl0SbI0VfEz8BP2NVsuJpBjTZ/2NebFK5vt6U71W9EL9obVT4
 vwlb2m2YBiMuTj1If+99GrGN6Xojq6pI05dAQx/wmmsdSCn4bdO65y8Wi103QGhW
 A+Xbp3T9/mm/5/15vdeklG7UxuTihrjyIpsNWOV3yA59G8FSsWIQ0m8kXjVqU5aj
 pelvhF14nHpH8kPtdQEcRgnKkp9pedcn44jmxdVRV8TZV/UhJyf7uzT/sqE77rdB
 ACr25+wSKF3WLft9j68Qwkxlm0s31ZiFcKBk93RPdrlsDIfhEjuPu9rCd8w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqyga2d0d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 05:23:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-384d033f7f5so104428a91.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 22:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789622628; x=1790227428; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3N5DIquAJDq0p8J7L7bi5CfdFUY/7YEWgOuGF2NIAds=;
 b=AoanIbzDg/ATJuFej3wIpUDAlXK694Ch+GhknTpsdwdAjgdqUGvF2EBqJEHOkRydGC
 LBbuQrQyPcytkfTuPBIG0G1xz8LJ7tRRkevRSGpVrHaA3i/tJ2WaVbGY0mN9BQ5dzYPy
 Wr6FceayJ60ETAghvXlqP8v4kqknf4zP1nX4bzP9odGzYt3GKSoITjmVB1uh/VS13lQR
 h8QC6sI08Lvsdbn7DH3m85x0A75kIGHos1NxcytANqR9M4eqf7r437XjfCqALhS0/KPy
 Y879m1TZxVTNtNvieYM/6lIP5glYf5Lhe4jdV17ZNU2bK6Ru7FPQTEX64KI/6YOd/nvA
 36tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789622628; x=1790227428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3N5DIquAJDq0p8J7L7bi5CfdFUY/7YEWgOuGF2NIAds=;
 b=dGYxMAC0R0eFA0roVXcVGXnYBj5ZojQO+Tu1tC0LyTk2t5gGqGOfYAEvWb6eJ5COev
 rrWuPHkUVoUQ/SN407guf/EIUHcBV7K+91cff7U7H0vi8YEx9MVHFKcuySQFCPBgqKZR
 0vKGzcmldVtUJlWfFKs3em/KsEis89xafbEjJXsVJTXVPbMQESw+au1djeH7CADYrlLt
 MGG4TPOoHbPmoHxgK16vtLsheRYvScIHKLgvpmYNBccF8C5X60O9rVp7nit4F5rOy+uM
 jk/xU8HVzGr+Qc32cVIQLOXxitl14iJNryZ/r2kEDtnqwbdXmGD5A7pF/fXENHeUyAGt
 ee5g==
X-Gm-Message-State: AFuF++lQm6DCynNX9wzFl+RZxfBBRPFdeWdtGRr3kpR5PdOfmV+HO2lB
 zsDuIGVoCJzY3dGYu93dB2pzv0ok9+k6B9oGKCFvwX5H8CsISetkCzOyZHReV14VxOzH4JDcbHw
 1eJM9rUeVjS8SXwfZ4G3lnWHam5L3qMRrExJ5HGPf02bgQqeRH4DFu8TqOw==
X-Gm-Gg: AYBFou0lxeYc897PHoZatzlwgWcnDFuQXPMFXPWjeUh59qd6fuT9cNA92Sa3Avu8+UL
 FKy3ubTn1vYJWfkJsP1Uj+Zpd4o29UuGp03Rm0B7Tnnbb6odEQPZpyuUDPS6qWnWZgpuqpKoj+F
 JxvrKSqZzWNvTpsBxePksSYGZtlIOVyWZ6YxtyvlAKjRtcKkhhpuRPKu8tYb1qOJXzu8/X/F/wg
 v9ynUQy3OVMt+Ypoo/g6JldVZ38uApJRYNWf0wCoKomJkSa4YndsA0z24kopKXxXA4j+/fBL/H3
 +OipJVR3SbLtNdLGVnUzFDWU+UsNdjdWw0W51ebV1lBB9U/rPMfRd/AE5mpIqL4Sb5YBQ7o5rC2
 Fq+Jg6E457ZvOIkzwIQszVDFtcH7+JMhl6p4ksYLfRrnEljXmtLj7GNzw4RgJoUnWlGtHVuZ07+
 BTucKEWLlvBNUxLi7dmINgWnXTsuFLUCA=
X-Received: by 2002:a17:90b:3c08:b0:39d:eda6:89fa with SMTP id
 98e67ed59e1d1-39e2232435dmr8140877a91.1.1789622627554; 
 Wed, 16 Sep 2026 22:23:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3c08:b0:39d:eda6:89fa with SMTP id
 98e67ed59e1d1-39e2232435dmr8140838a91.1.1789622627147; 
 Wed, 16 Sep 2026 22:23:47 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5af4f0bsm14256187eec.24.2026.09.16.22.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 22:23:46 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v11 08/10] docs/system/riscv: document initial virt RPMI
 support
Date: Thu, 17 Sep 2026 10:52:47 +0530
Message-ID: <20260917052250.1041262-9-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917052250.1041262-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260917052250.1041262-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bY51-htjV9VWa1zJMPKkl-uOs_ZGmp0U
X-Proofpoint-GUID: bY51-htjV9VWa1zJMPKkl-uOs_ZGmp0U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2OCBTYWx0ZWRfX3LU3qE2X3HPc
 7w/bkfDdL3Ldt8nMJjJ3n6q3QUVvMnk/VmEJYh+h+ZOyzBdF0P5nP+T2dpVafKb8uqRUZtxmmbx
 2ix19KNUu/9riz2Sh7p/K4AoD10+dVw=
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6aab7964 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=bNRx8rSjxjkR0t5bZ0UA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2OCBTYWx0ZWRfX2dkKlSxABBBT
 YjTe1e7IOqB+29qwCrMKosgiDCDmfC0+OpvQ64QBnigXCyL7bo2UDiJb/ar82eH5z7YNAma1vdg
 FrnxuJQiO0ZumZcYIM4apqCRUbkJ59EE8kaupComT0obrWjKxc044XEZ/dmq6oVtTWTZ1SfI6E0
 bbqPsakuOxCWVbHammHuAynRYevnNH8a62YwGrbI+FIS2H7am8m9vNTjhRUdqwdRi3pUqNjOnxo
 iKsmGcJhdbQkZzvAY6UvTyP0zHgKQQDAyj+VEPCqYv9ogoB4/1L3rBRw/6LFbaSAm62audhTaAP
 L6pQCv98x3zYLqJUb8kXh0aw6l+Q2X8GRuNPuPR/+HVbUMsW2fPCDGrLH9NgB87/qVefZxB0Egq
 QUVFxiGT5dWqTnqFjA2pUFP66Q3+gSPKXFh11slzFv51L9umW3U6PZRYRPFlOoj3i++gEvVLnzm
 bD9RiHxlZkcuDXu4X6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

Document the opt-in virt RPMI transport and the initial HSM, system
reset, and system suspend service groups.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 docs/system/riscv/virt.rst | 80 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 3c87246891..0d719c4c0d 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -149,6 +149,86 @@ The following machine-specific options are supported:
 
   Enables the riscv-iommu-sys platform device. Defaults to 'off'.
 
+- rpmi=[on|off]
+
+  Enables the RISC-V RPMI shared-memory transport. This option defaults to
+  "off", is TCG-only, and is available only when QEMU is built with librpmi
+  support. This support targets the RISC-V Platform Management Interface
+  (RPMI) Specification v1.0 Ratified (`RPMI v1.0 specification`_). The initial
+  ``virt`` implementation exposes RPMI system reset, system suspend, and HSM
+  service groups. System reset can request shutdown or cold reboot through
+  RPMI. HSM uses the ``virt`` hart IDs and supports hart discovery, status,
+  start, stop, and suspend commands. System suspend uses QEMU's suspend and
+  wakeup path. Migration is currently blocked while RPMI transport and service
+  VMState support is being designed.
+
+  The build dependency is provided by `librpmi`_. QEMU requires librpmi 1.0.0
+  or newer. If the host distribution does not provide a librpmi development
+  package, build and install it from the upstream source tree so that
+  ``pkg-config`` can find ``librpmi.pc``:
+
+  .. code-block:: bash
+
+    $ git clone https://github.com/riscv-software-src/librpmi.git
+    $ cd librpmi
+    $ make
+    $ make install I=/usr/local
+    $ export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
+    $ pkg-config --modversion librpmi
+
+  The librpmi repository can also generate installable ``librpmi-dev`` Debian
+  packages with ``make deb-pkg`` and ``librpmi-devel`` RPM packages with
+  ``make rpm-pkg``. After installing librpmi, configure QEMU with
+  ``--enable-librpmi`` or ``-Dlibrpmi=enabled``.
+
+.. _RPMI v1.0 specification: https://github.com/riscv-non-isa/riscv-rpmi/releases/download/v1.0/riscv-rpmi.pdf
+.. _librpmi: https://github.com/riscv-software-src/librpmi
+
+RPMI qtest coverage
+-------------------
+
+QEMU includes qtest coverage for the RPMI transport and the initial service
+groups in ``tests/qtest/riscv-rpmi-test.c``. To run the qtest from a build
+configured with librpmi support and the ``riscv64-softmmu`` target:
+
+.. code-block:: bash
+
+  $ meson test -C build qemu:qtest-riscv64/riscv-rpmi-test
+
+The qtest covers Base service discovery, System Reset, HSM, System Suspend,
+negative transport cases, reset behavior, and migration blocking while RPMI
+VMState support is being designed.
+
+RPMI firmware and guest smoke
+-----------------------------
+
+A firmware-level RPMI smoke test can be run with OpenSBI, a Linux kernel, and a
+RISC-V disk image:
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 \
+      -machine virt,rpmi=on \
+      -cpu rv64 -smp 4 -m 4G -nographic \
+      -bios /path/to/fw_jump.bin \
+      -kernel /path/to/Image \
+      -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
+      -drive file=/path/to/rootfs.img,format=raw,if=virtio,snapshot=on
+
+The OpenSBI banner should report RPMI-backed HSM and system suspend support.
+After the guest reaches a shell, normal guest reboot/poweroff commands exercise
+the RPMI system reset path.
+
+RPMI device tree policy
+-----------------------
+
+RPMI is currently described through FDT only; no ACPI representation is emitted
+for the RPMI transport or service groups. The ``virt`` machine uses the
+``riscv,rpmi-shmem-mbox`` shared-memory mailbox node plus child service nodes
+with ``riscv,rpmi-*`` compatible strings. These binding names are part of the
+RPMI RFC surface and may be revised if the RISC-V RPMI bindings change during
+review.
+
 Running Linux kernel
 --------------------
 


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC56C5B56A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 07:04:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wu2zW-0008CU-4U; Wed, 12 Aug 2026 03:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wu2zS-0008BF-5I
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 03:03:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wu2zQ-000158-DG
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 03:03:05 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67C629vc4090916
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 07:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vNILrqZOki4
 ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=; b=MHEFydadkc2YxCsk0OivPGW+k7N
 febsxu5yePto+utOZiZ8WPQ44TGSJLyZD9ZqgqVgdx338wrvbKrKMs0swycKpqXP
 7yTOAoxrpN7Uas809dXD9w6x6NzpdUUHqLA25jJ2QZ0cg0etknmXvp90qcEfr3Go
 7uK2+tFoDrvkBYYCB2ju+eHzTa+cE8BTGyzUOK1E6LMFryknPOdptUxlUmOl/h0Z
 ii2OSN5oRB+pia2gx3rfPBDjsWrmRwL7FmS54f2kKJRy1myRsX/DAnpqdKl0+E1n
 v2qbHmBBB6JoD15bsX0vvUBkl++8aPQIrmU6k8sise42H1rncufAw2n7+Qg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049buy9s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 07:02:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3809cc5dcccso249856a91.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 00:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786518172; x=1787122972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vNILrqZOki4ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=;
 b=D+dqhdycnT7TxuwImeKf6PA3UGA7QvVuJ+m3gGPHxOAHz0X2N8TOpTl+vJYFtPDOHw
 KzgdjSKM9DmaYxHTn1IF31G3h5ZlyHNYojwyVHR3FyyQgpR65w/bsfV5m8V0Hm1Zcn3i
 xKdGHLAOjblw4A7QNivWkviU/Xf9maGnqSNdmaDj0FsBtnuAddRmFT2VRt6uSzBQjolF
 mmXuZi/4c5ik5PQheXRNnTeRiq25jnpExZiT8lE51px7YVmSvA+Uut78QUPUETEFoxOS
 uUpyipwvlik3DGqflGTlArKHO9nXf6BHhVfXozf3ehdTjwtkoa82yPvWIWIw+RP8r5yo
 V+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786518172; x=1787122972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vNILrqZOki4ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=;
 b=rj8hIgFie02eVGrqo6mELVbP4ldLVu7XV3xdPPxhSXBKoieN2B9cUvkne4r9Hwph6l
 1frG/UgQMBZ09BvBKP6BC7+LUZoHJCgAHcdENZjiFmvCxeyOToMZfnrj9hr+V11slgA1
 F/nKBtw+xmC4pq1wWtvC8aLj9LHWP91AglYMAg3T2bl5UZqbuKHofqncEr2gLMWlTK53
 C1M/Ng+qWfJ1YIkMq2kBWZIsq7CI8J/X9zii/X/9TVrwfhDXLgNugFrB486B4PPNPQ2i
 YdhAjHxDml4FgK9cr+O9GBvxMmWfpMptDX7t5eG5la1/Ie1ffn86ntM/SSL23X24M+26
 8GFw==
X-Gm-Message-State: AOJu0YxzF/3r2nMul5AHGk+OMWwUWkukO5cJqZ3V17pSVpS+Gjca1WqG
 J8IY8N/NR2/RjvsfYW/U/PDaADvuoSWhgLlga8zcVduIHQiWlki7bd09t/gZtYKyGV1eof+2qVq
 klzsIsvXL2V8gjuxwux4uRFyXmlz0hlpqqb1MdOe3cIMQn1hd1igNA6zQf159V43Odg==
X-Gm-Gg: AR+sD11ki36JGkRK4321lPbmoUWtUwMP0tm8rrN7920q39sQf3WkxaSK0nu+JVedjh0
 9NUGNA8phaTGFapksWMmtgKFY15ok1Yd8fLBWCl24X2dUlYn43Wc/b/3U0V2CLBZyT5aEFN7aVk
 Q6iVtjHLpBbP5pJHk+l+kmnZyOEPRXeLn1XPDz9gcgUpFSideLeSfOHCGiemFnHjmwMikwVz3wo
 fzWTNdCjepcp5RjkJutV3KmTSPqpHY8M1KR9wVnJG/HcvpHHhGw03iXxBFPSPomhsSc9HOliZdT
 Ttjm5Nkph3n0f3tIsr41IpJqYei+UlZjvCmQkToPB5bRxrMbauWl73zxyGF6mNKWckjl+YA3dWe
 cfJYrCKk/isy8LtsH54TQhFn3Ihb/T4Nh3UBX3uq9uN6BiRb65ui0SVPEUR+Zweq0WJ7lXIYety
 r758AflnfdS3UGmOlzGZiLWT4lOR31+1Y=
X-Received: by 2002:a17:90b:580f:b0:38e:6d4c:14df with SMTP id
 98e67ed59e1d1-3930121d20bmr2144234a91.1.1786518172173; 
 Wed, 12 Aug 2026 00:02:52 -0700 (PDT)
X-Received: by 2002:a17:90b:580f:b0:38e:6d4c:14df with SMTP id
 98e67ed59e1d1-3930121d20bmr2144190a91.1.1786518171675; 
 Wed, 12 Aug 2026 00:02:51 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31cf3c08163sm6796627eec.7.2026.08.12.00.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 00:02:51 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v6 08/10] docs/system/riscv: document initial virt RPMI support
Date: Wed, 12 Aug 2026 12:31:30 +0530
Message-ID: <20260812070133.3059679-9-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812070133.3059679-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260812070133.3059679-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6GHnL1cYGjiuG7bJ17i0EL6IQzFZWf2V
X-Authority-Analysis: v=2.4 cv=ENg2FVZC c=1 sm=1 tr=0 ts=6a7c1a9c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=RyhCfiGMEKD-kOZgqhYA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 6GHnL1cYGjiuG7bJ17i0EL6IQzFZWf2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfX5sOQg85RZ+wX
 /vA7tSGVormHF7NoMoq4Y6qBeofzFXKH+FppYeIZixpuOIB7P9PfPuubX2GN/9mN/SDsOOkp8cx
 5x0Tr5mMj6Em/dUUWhFT3ZjuJ4NHFgt9X8RgDzowRquSMKsqFNf0RggkDjJuupQsBd9Tg0kNK8P
 MnzyQJcZ3kZGS0VL/QJjd8hwTyObf5sJNFnPzc+8lGn6njJWwweE9bDlvEzq2PSIO+f2nM5Bg1O
 9O04mNLPx3kyXrH13G3eU+rkT4lfBpCWWOKy67QQqRktT56VchxRSu+YGlqJnCajYrTALkd+Lck
 hS2MFT8w5tDQVmM1oxnXKX3m5OvvCot/oIoTwsR6pRiU4DPHAmxe1Ldch0nPBZhY3sBHQjLTmBu
 cy/pG5rRIp5svrNqq+Yl0LKTNKSHMpCVLqnH4OM8YWVYz/vJ1/wL8AsKtubcIOH4Sb6lfZDst+a
 W8oWrOprGLV3yOJVktw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfXy9AsRftMi3ZI
 noJ2vV92bipTqP+x6KWI6pRjl+AnfkufhqVGcGE/OJvKFTJmGMQ8lU3TjgiqAtVHCoMqu/bR5UQ
 +N87hySomeY3KC8Ok77hBmHZuetK/ro=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120054
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

Document the opt-in virt RPMI transport and the initial HSM, system
reset, and system suspend service groups.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 docs/system/riscv/virt.rst | 65 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 60850970ce..31cd945a3b 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -146,6 +146,71 @@ The following machine-specific options are supported:
 
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
 
-- 
2.43.0



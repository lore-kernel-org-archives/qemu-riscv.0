Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073E7606A329
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBPxHrwe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkiCYTMC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNnTX-0002ve-1B; Mon, 02 Nov 2026 03:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnTA-0002r1-CH
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:32:49 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xNnT6-0004qN-VO
 for qemu-riscv@nongnu.org; Mon, 02 Nov 2026 03:32:42 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A27qopA3863142
 for <qemu-riscv@nongnu.org>; Mon, 2 Nov 2026 08:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=TWBnGbwuz+q
 DPVFESpXXqRRCe0rhy78MEhLbH1dXTfI=; b=XBPxHrwey+cdapik/ZE4JDX4WyT
 +pExIWAFjdA7qN9R4y5qTmTSK8HKJQMasv3fBulTT8tVQ3EhRqiDx5GQ+LWU+O6q
 05giUGcYJhkO/OBcbus5vWXoAjrOEpLiquBrpkHW5qRVd39XpynA/PP6N8e3cqdi
 dXsO6tCFObKSrVopAFK6V3EqoLPlKF0VFsY03YPnPjnf8v2mIaKwhlgGklClW6cE
 nM3QB4czKR47KmJaj5lHgrUJ4s28wVhSFOfnG/EQNohlcnt+G9DaOm1aak71gg6O
 SmMh4j9eAAVusdLKpAQ3TFfgaeN1dDKrc7CXdROF5V08pQQf6946NGg2Q/Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph185ba-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 08:32:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-33bf1d17dfeso393931eec.2
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 00:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793608359; x=1794213159; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TWBnGbwuz+qDPVFESpXXqRRCe0rhy78MEhLbH1dXTfI=;
 b=HkiCYTMCN97Jfzjx8wgeQ+urhfNp6ckRtcOLWQolIi3BMPvnaCBm0LY1CgPcaF+iAJ
 NB2aum3abbAEye3gDGvRijWbll91IsRixNV95WIFb486kM/WYbYL4OI0OnonWLig/Hy5
 NVEfAWlfAj/FH80bCOzrstXdBhkfWDzGSWCnYlQrHhTUWoIgqeYZXM/9y7T2Bv9TBPLW
 NzcRXYa/VAu16cCczMLqbZNSQ13GaMFvQsx10Uw28Vm7FLWi+pMWC5SUR3UHBmIIJI3M
 ib+M0VRMdNNXPU7TmB93cLuM2fi1OBEXELPRKd3P9TV1jsWrZHv9T0CS0larelhq34PO
 EoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793608359; x=1794213159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TWBnGbwuz+qDPVFESpXXqRRCe0rhy78MEhLbH1dXTfI=;
 b=GWNPiNzKD3GqQsktqYm2SMpa3+wZb+m+u25IylFTPxwZPno9TXkt+2/nRcnUtgauVV
 vFIXdaPkEmy7cYgFpLyjX8/ksYrYyN7Y36MpgGyb6LMmlnIL7OHDwAv5LvPMAAcDyujT
 uLZFWnIb3y+5f2GdGvIGpJwWpoxzYJ0pq8C9zytwfjFNdj8gGoDl9Ebtd02YcmMrOBD2
 kUpdsivZn+SCzhtgP7eckiAs0T2xRdv7XHNtvtkQoXeUHGEIVfQU6WEcuhZw9+0/PlRe
 5xurKVuROcEL6fMXLrt3XzvmDm8X8Pxucf7aBR6bcY09St/0IgnZr2XeZ71HlDSOJFQy
 k6Sg==
X-Gm-Message-State: AFq9FYKbnFRxrFjR6jhY4/iHgaXzstCd3iaIOLxjHAd0OcWN5ooTl1bL
 3ZmRZ0jihEmYWvHXyf1nqx8G0/QfIdtldngMXr3i+Z/GKlbOaj5NQyFRjXCJEzKtCIiovGC7cfE
 csiXA34sXvZeufRK39ZUqZNQWq9phbPP+Z4u3KaxkhPkOR4cFq/0RrCNnU96bYf6vig==
X-Gm-Gg: AYBFou2X5SjjFwHijEUZmH/12s3/kqjt6vOa3X1wCHg6Mn7U2iZ/VBueUbubsYXSLdR
 Zyc02BNhNK9fJlLzEoDk5zioxlhraKVEw8WazMBcttcDpFISKlZCEG2Z3y3tVmZKxnlHPZlLfxj
 gtJjo931yHt2Ae+yokmzlO92NAare0m7AP0jRkeN2Amz32mAD5jaMUIQ809LhQ6EzACTAVEFJt3
 w9L4LuJD2tSjSG5ZZ23tGLTAWosfRhtjSC7xJtCAbcQUoa/Jl+HKRV2rTGUDYv1Legw7QKTU4ab
 L3f9SexX0ut7cImEA8iUdIldOz3FT1eX5K202b9j1Pjzur6OK9ko2eu7Uf8/860q6AtV2CWxhfM
 lrZJDeALdDuBEVey2DkQO903yiJeh0vmAYvClN5wGE7bntyIl29lfT4z8DTdPmWrQB32f8Y+iHQ
 O6h68NkNgJXoNRamoHTPbBOsF8AoCuVBSjBGNJPZfW2esSOD2HlziGAtgCPek43HFoqM32H77Op
 FQLB2xk
X-Received: by 2002:a05:7022:b053:20b0:144:fd17:3b21 with SMTP id
 a92af1059eb24-1ac500d67e6mr24101790c88.0.1793608358753; 
 Mon, 02 Nov 2026 00:32:38 -0800 (PST)
X-Received: by 2002:a05:7022:b053:20b0:144:fd17:3b21 with SMTP id
 a92af1059eb24-1ac500d67e6mr24101720c88.0.1793608357888; 
 Mon, 02 Nov 2026 00:32:37 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b106edc7f8sm15083213c88.9.2026.11.02.00.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 00:32:37 -0800 (PST)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v13 08/10] docs/system/riscv: document initial virt RPMI
 support
Date: Mon,  2 Nov 2026 14:01:56 +0530
Message-ID: <20261102083159.3383468-9-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102083159.3383468-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261102083159.3383468-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tg9Tk9dBCvRNiZWdVUSUMsLCm6IccWS8
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae84aa7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=bNRx8rSjxjkR0t5bZ0UA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: tg9Tk9dBCvRNiZWdVUSUMsLCm6IccWS8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX3s3JRyCKoyS2
 ZVbpZGQ+WxVi1pjGNbsC+oF+oZVH13YephPLgsV0UGd7Jm6QXeij2ob6weHS5djzGo8RTGxgSac
 Rbx0Ivs8dqtR20QO08Lz340iiWqtctxhrbDhbnoFyaoKfj91W7lc3AfTke8PJW/c/COAth9wxea
 5cu+lDbPLcuu677Zh9OI5nBosNY5RJLFvqzscZcgsDzXJ5GGpu7gXDHAsCJOLHK5Hzs6spGbV7Y
 OV2rfhm0/8Usg/w1SiovIKmdVfRInHn/cAR70VLx6Y85SlTtCR5euVDGUv+ecWMPNQ9a1umwtL2
 1uqr/KGVc/QG56u77JyVxYgHEBRIoKaZ3jt1MByxUU1UJRBSoinYqNRGtDkbXrpTYku0xM7hpxM
 UZBt8h8GvB+6VZSdh30Re4RODTfXxrQUxXJvxH5u4pnupU6L+HlgIDIKgxXiDXX7ur0+UlJlKTs
 0YcqfGz4qNmSn7BHJxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX98lDCditq5c8
 mQInf5hzSrlNqTCcuDKx9eeYb5SRA4gcof6iSbZBWlzLWg1q1+iDSvFJ+Qe4Z+CYR/WYVoH24IE
 JZEu412zU3gLF/P4Kr7zkcXi+2+lcwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020033
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the opt-in virt RPMI transport and the initial HSM, system
reset, and system suspend service groups.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 docs/system/riscv/virt.rst | 79 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 3c87246891..7835913e16 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -149,6 +149,85 @@ The following machine-specific options are supported:
 
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
+``riscv,rpmi-shmem-mbox`` shared-memory mailbox node plus sibling service nodes
+with ``riscv,rpmi-*`` compatible strings. Each service node references the
+mailbox with an ``mboxes`` property containing the RPMI service-group ID.
+
 Running Linux kernel
 --------------------
 
-- 
2.43.0



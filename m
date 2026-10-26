Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD3E606A31A
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jIGGtng/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFHZY6Ny
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLKgw-00021t-Uz; Mon, 26 Oct 2026 09:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKgD-0001Z1-AL
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:24:01 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKgB-0005HL-52
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:24:01 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69QAt7UT4126429
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NJrJBfSD91d
 LhA24xgIqTZOoBu7hAZgyfhwlbuYfSZI=; b=jIGGtng/1Oj+ar8ePNRk1JYp1S7
 ejBYDmnaohUVMs/EuR8P1mFKCLkLkdJythw234Jnf5a0bo3R8Py54n9SegVM0kYt
 alswbkDasxO9+xleWz/pSvlavMAmmDnN8d2vIcvFBztA6+FBu9vO5rNdA1R3YVPd
 uXoxjCbrSGzs4k5skK6KUAagOw/wg1JYwRWaRAC/s9Vd9Dat8fsW9yLkFPrE7Mph
 nDwFr49gtgxLH6WKD47Arbscg83q7GzO/FNYbGtX7LyM4F/C1gByr5gaE6DEapRG
 WsvN+ncvjkfF5JipdGOIfzNTYixO5VCXUvWBG05+ALkY4HDDycb/TK7fPTw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshptjc2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:23:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-361c38aa269so457032eec.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793021036; x=1793625836; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NJrJBfSD91dLhA24xgIqTZOoBu7hAZgyfhwlbuYfSZI=;
 b=CFHZY6NyyiIu9eQF8l0qJD6FzCw5f4GVwDQCCxikKB5HUi6RjkIUS5fx1O+djVYS0e
 xuxmMwImA6NOyMFMpbRIVtlfeiNcvhERlkMQ43Ywhp4qq2l+PHJFqU/ASayHHwwf+1pz
 nI0g/g/YtdwYgmpoxeQg0BDCH0sPcCBGcL0BgoUzcxuIYW0ZEh3T5fh+K6UHeb6DYMYC
 LRSuoQ+mPQfoMyUzebRNlk3T3ahAUyZR3KAK5LMNA8KzNGdTEu17tYUlgqzq8ztNlUD3
 8nUx3A+iRa4mbM+z8z0cdXUrQr2CGzkShIsZ0o/CCJ8cPO45upt1/AvK0d7QuXEaFuJq
 dxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793021036; x=1793625836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NJrJBfSD91dLhA24xgIqTZOoBu7hAZgyfhwlbuYfSZI=;
 b=DCVRZKFvDHWTFM8SGI55NEE+/8HnarVK0ATr8ysq6Ejgoy/Nan0mQiiIBrYEntDUrY
 DrZhNO/QIUhO44793zt4+TLPhbY/RZHvgvTvtbzyU1bvCJ81YlVRKFXHEsl96h0EWqiN
 jMJtzuznYDNtw5BwXT8EQNyRoXnrD5MrfPh4Ipid5Kz5mkow0Yup3+RAMOyXYT6TtxZK
 w++2Qlb7fOjv+tdam9krizt6CQjHhLhzvmKhYTXNWrolH4uMNq+yGEpZoXaZyPeBlHJs
 BFK16HI147alfSIOEIzZMVPQ/YFDo3AFNqFM+Dc38DeJuVsoAsNvVN1cLAbSMx5nOJn5
 IK5g==
X-Gm-Message-State: AFq9FYK3/qZw9NynWTCD+tm4rB7kqjWHXNAk8qxiYKY3XHU5HpVAoYAO
 praszLrEUeqKUa19m2me+xLpuHHtlABJ7WCVO3CuECTfrDeVR4hlanMRDeCmntMFuCUR/TabV78
 Hzk0xrqU7YVj+35ewCGwjAZ+ccTBCoWHBGJSQuQ+X0MiBKMNm7Va1AC7Asw==
X-Gm-Gg: AYBFou2kxw+uW2/O1pvgg/LprnjbZ6xz2/Sg/J1NQyzE44LZoAC5fYmcvjfdBMbYVN0
 dMUg8cSTYiTNlzvHN0cFi+gCjUpZpWOtdh1cml3oK5d0Y4jO4pi4UxFSRAFwzTruRb8UpINVzMT
 m0KYmus54OcGfHKLjBDAtSnJz1mBR3yVqtrLJANkgrlt2Sq0nFJWWBCtKRJFHZuAAjvmdDy2zrO
 Q439bQ6JQh9tXkoLkyr+N1MNCt05iYj6HvtIUitB8goi8pwEQ6ulMfYFQmdtkrrpgwJGNeFCQEu
 tqY4H/qXxl85+Tbx5R8oXtNmmRcQa8slYrohw4uz59F51CVo99Ij0zzht9Q/yw+7GC6c4HwLlZZ
 kVgMajWAFsMQLoiR+5R8krKp/H8JrpoDwhkJ5XxlrY17xQ8QDkQAiaMO1miFoGDAdTwd4l3lgrp
 /csfq+MLXn5NgFf9eJDkk9kYmuRkkLFpg=
X-Received: by 2002:a05:7022:7e0e:b0:183:d275:cf76 with SMTP id
 a92af1059eb24-19934a9266cmr17467295c88.2.1793021035994; 
 Mon, 26 Oct 2026 06:23:55 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0e:b0:183:d275:cf76 with SMTP id
 a92af1059eb24-19934a9266cmr17467222c88.2.1793021035212; 
 Mon, 26 Oct 2026 06:23:55 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-198a21bc6cbsm24360931c88.16.2026.10.26.06.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 06:23:54 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v12 08/10] docs/system/riscv: document initial virt RPMI
 support
Date: Mon, 26 Oct 2026 18:52:51 +0530
Message-ID: <20261026132254.2652399-9-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026132254.2652399-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261026132254.2652399-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfXyVZxvt9Un0NZ
 AWEdvBTO4G5XFcc3DWdx7e6rEE6ao5Trbl5PPJIeaoP/OyAje2gqgE9sW7/6Tmzsf/kGohthpDi
 qY+NgzJXH6P/2pnFCAPwjTUeje0UaXk=
X-Proofpoint-GUID: prv2Y8ZKrEn8UHWYTrBbC5Mou7OhQokE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX9aQ/fM2C9vFe
 mJHqO91BcYjSnisavOW+mpLNMYDPCHUkQnQU6yRL5zbBvfzOB2k9sbdd5iOZ2joPDRuIZ4rltAC
 NZbliZ1XfK0hYek65DPcQ3FGwGi8BRyyDrw0txUeIcXNhNhZs37mteSqpfE4I79grakXLJPkHUV
 NLUXDBGsizfA9iY7KpCtDXCFmoRi7GC89ytoUBjSocAtwzXRSQigpH9GNduax9au+6PClSvutgm
 x8z1OOMU0uXHpDxaBsaQMr1ewb4VE2EdFrPUgRrj5PkXeyR24qcHxAFr88cAD1x+8wpbUkoR1Sd
 n89TYIcgddR3VmiQ1FfvkK28VZL1tp+FRfisnoJ9Nh6awvMnGaIbGhGSdupvTJjh08SsnPw9dp2
 XfiRNcFZFUfyZNTpEBXjTsDmOa2YfwOvTZfPhu0awZ4m2IxOGz+VYSLTcQVaoFoDHyKKfWFX2Hr
 iC1yQnZoPk1Hm6EBoTg==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf546c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=bNRx8rSjxjkR0t5bZ0UA:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: prv2Y8ZKrEn8UHWYTrBbC5Mou7OhQokE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260053
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
 docs/system/riscv/virt.rst | 81 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 3c87246891..a3647efe1b 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -149,6 +149,87 @@ The following machine-specific options are supported:
 
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
+These binding names are part of the RPMI RFC surface and may be revised if the
+RISC-V RPMI bindings change during review.
+
 Running Linux kernel
 --------------------
 
-- 
2.43.0



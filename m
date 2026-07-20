Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B6BC44515
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:04:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wllmg-0003Hp-Ep; Mon, 20 Jul 2026 07:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllme-0003DD-KI
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllmc-0002wS-4f
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:40 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAvSIc2421638
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vNILrqZOki4
 ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=; b=BAipLbWzDSBHITC6dQvTuT1BQ8U
 2rXcQH0UW+WDOnHan9gKgYnqP9hPXUIJ0WWYXtCHzNiDQ8sFLUvLfUdob1jCjnxb
 6PDOQUQoerRwnDJzWXaJywsaOBQKBbJbL4yxkvoYpYYvd2eawz7hAYKr45/ymSWP
 +2zEhck2zZ6vsTpr3aKR54I1XUxRqSvOpmiKNDdIq4x4Z3ZFm+6vfYlZbJ/o+8mw
 Q2zVL4gs1lgSsVZtnue94hw9MVxWZCsSJLwmnOICb305FDc++8FPZ2O2wOLa+XQk
 or5qhmdSBxywLuyrQ7KCZwXkFfBxeAwb4Y/D56yzqqOoVyNI+yFsa6z0IVw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxgt1j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:03:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cca0ed258cso40191995ad.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 04:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784545402; x=1785150202; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vNILrqZOki4ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=;
 b=FOUdkUn5hw5GdLIjvj5fRnEGOrssbwwVXIhyeuxsstP9dCV+lurM1RDKppbsw7wdPU
 9sNSeNH2QSfaEe/vOfPSAJ3f4RSYbSVnmSHRGTA3x7L7HjUOAxGPipd+0vOrQEIbgzWQ
 Un2/4wIIPUy8mVv+zaCBJ65cwXO+x2Tyyu9LOPJaREtc0fFElxvdg0oojPgZ2A4Qst+8
 7SrXlnxdv4svkyIQafHtaS/ztqcrkFDJ8vTEqoP9VtN77tHTwcv3nrYN0e1myetPzVPq
 wM+RuOM+XXpuoXlB3LT0BB3l7wGld+XlSODCkLTnxe6WvAFpJxObthNGDY1at3aPHVEB
 Alpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784545402; x=1785150202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vNILrqZOki4ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=;
 b=oh3tPr9aqBRA8RNCiDhIhJlpJA0uNMVS2w5Qoc56OlDGe6+V5f/2lzOUXmrcCWnSSa
 JLheVh+ZQtvjbKu1a2ZagK4TtyhULEStxd8kYecauC57K/ICrslf22H3QmE5p01FnJmX
 sOtpJjk3HBkpsKtOzCr4RroyWuQIo1bORxV3EsJXLTeH8/0Ht0zEMQXcEhUGZQO/f6nv
 WAOJWmBidvAXfPSu1fPMn+fFFPBTQLcjpiGiT7m7Kv+bEmCneVe/6y6FcjxsTBmlbHB2
 j/wlpxdS5Hes3jyxnv3pYPRH2YUgVb837VAEKlF7wV4HPANiXoPksZnyBrex3wNgqi80
 gN5g==
X-Gm-Message-State: AOJu0YxVWfGXMLOozlKLt2zRiNcQAutxUBSi090VxWoDJs1S7H0bYvKX
 JX9lVS28qSIZbOlm7lUWtlu3hglGjekoLHhniS9AgDFSvxXal2J5hGHlm1KErMIskMKn0vB58z+
 TgTATFgbBoElmfwjXx7HjK7KGyr4pKHguZ7lEA6OAR5y8xW2WEfb/wCMoJHehI/Oimg==
X-Gm-Gg: AR+sD132JDoRWNIeE0RClJBDz5ZSCSAG+5JOq7PgG9vkIlNE+ID7eWS7kMc1AUGf/cT
 HHtolLwafBZmlS3o33Lo1a3xT/93TvWyl6C84Ba4f3CkHMxibsFCthagDscxfZCaIX+gQ30koqd
 uzJ/M7OzN5/46OHLQ7GCrO4c5yDSM12GmfLKXY4YOMXH1YI5pw+hifpcUudh3bBCNsvW+k5yfvp
 RwcnZcF78NxjBwNfTxlFt0k9b+nolQCiQtgznXDAYTxgNrTNv+01EeyWn2rHC02rT8KGBnpnWSA
 s41lw21Jz5tgFKn6wIjGPpQl8iAHyadCWQJXUzgGeBzg0LifKxKvfUIF4y83nRUpd99df5z85Sj
 PJvq4v6/PGWfccRPWKkNuW7DIGK6Z1JFIq2pac7l01KYAfOED9489WT9Lb+h4ZqkbpmZQqXMP0L
 0k954fqCZp4i14/OxhMuAPo4ISNB5FhqM=
X-Received: by 2002:a17:902:ef48:b0:2ce:aea4:5e80 with SMTP id
 d9443c01a7336-2cf7bf7814bmr123555ad.6.1784545402509; 
 Mon, 20 Jul 2026 04:03:22 -0700 (PDT)
X-Received: by 2002:a17:902:ef48:b0:2ce:aea4:5e80 with SMTP id
 d9443c01a7336-2cf7bf7814bmr123175ad.6.1784545401877; 
 Mon, 20 Jul 2026 04:03:21 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a20b1f3sm34698566eec.26.2026.07.20.04.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 04:03:21 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v4 08/10] docs/system/riscv: document initial virt RPMI support
Date: Mon, 20 Jul 2026 16:32:31 +0530
Message-ID: <acdf9355b118fe7ff37abfb7f0b5f2463cd879d6.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e007b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=RyhCfiGMEKD-kOZgqhYA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfX3yaNBey5GO8/
 TTb99ARTdzRWbB2A/RicWO8RqcUHct3GTHLeCSgonE7nc7ZFyPun/aSmctxqWExX9F6p1yFslJP
 LlO1f0bKsfZk232VCcYUR4naW7EZUus=
X-Proofpoint-GUID: SR8Hkdon1_kyLZzVE8A5yzwVhPcLiT11
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfX1VvCxQqAqVL4
 B/x3c18Rwb2CpJER2/cKEgs07ZinkzlgCUubpHimV6vhpfeFPYOjIrTt20Y9oIjsnqrsKaI0LGW
 GyxmdDR4zNpfnVYDH2DInk0tW7J/7hXcZENphC3QN8qxQ4zwuIenlw4Z84DMrcoyFm8th4c+IrB
 gOZS26eBlVwDitv+/uM1dsYwWGgfY33JFHm9wmkW1kggI+5QFk477MjVVOYXh7RX4bPe93CHaI4
 j4Lup8tHneqggDqfvLTL9lUeSjjZzVJI+Cp4xC6Bz7fOX1D+a01qGl+iXIaDnZd2GiZmQZ8tgEm
 c0At3TbcxvF8YNWAd1udwWYY87Jw8hwGBhw/Ri3Gmq2gAH/rWc/MoxJ5TWPkNwuZfySetn9qM8X
 FkjA3B16QIZfxo7uHBzZgyXqPZplvAn193EMRoT/1kFIjeRuUoQ3Vv43093jEyiaiWI3npdU+Ez
 rPn+/lXTsLV9wkCb8hA==
X-Proofpoint-ORIG-GUID: SR8Hkdon1_kyLZzVE8A5yzwVhPcLiT11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200123
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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



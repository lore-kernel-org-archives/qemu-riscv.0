Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50E9C4452B
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 06:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wm48A-0004M3-Nb; Tue, 21 Jul 2026 02:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wm46d-0002gh-MC
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:37:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wm46b-0004TY-UG
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:37:31 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66L44Ef2534739
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 06:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vNILrqZOki4
 ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=; b=SQRau4pAbe0Eb1I8SCtEre18F8L
 4ss/Vez+T1dG5nxAZ+WznR92tZcQS/cw0f1khxC6G2KqGcaNj0Q3J6VZiDrGzZBT
 Xf2+5mf5AlIwlEmVKdPqs4CjRU6ROBSpvCSKkY+oij181o2H5iq+C1H1srhZ7T1t
 KuB419DSablmI1hKUH4e/Fb8A61TA02Ee7A0Xv1vHKWOT/KFUjQCF0dgVsMBGJJi
 PEF9d4ckA22Nm8zNheXebtUul/CEOkk7sgHfcKE+2zf34mH6ZxKN2EqGUd3re0bI
 rnjp0HV1yZDcgDOBN5dJmbpdMxp2O5OKSoCalEgDYuctTpKK0XsXnCFVn7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dughj2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 06:37:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cc7ea29141so49315685ad.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 23:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784615836; x=1785220636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vNILrqZOki4ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=;
 b=OnwiNdTgKiVED6NvLb+5iDRgRSuZzhXBWShntA7gnAlzE60qdfvU4eydxB+vvae5gO
 l13H1s2Vd6f+U+uFgSOcUrBooa3co/r8SgfD49MmL3ahCMVD9GLoBfxjbByft8GGrLpj
 tT97zcz6VmCr+u7RaScqYtk7KRtuyP/Bp2fHsEX58oPpsbmtCnMpOgnCSQDAie5LvQPF
 Co9LIvmmaTDFCva+0JTR7P6uQoocKcGWntpheM9ZgmNQP2GiYWwWMKai3sgEkwDEGHlw
 XVBm0aKdHGPB/NIIWup4NbSTPQWtyCoqaKUFl2/JBEnc79uiRJ6fS6zYf9LMHvRYalCZ
 DjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784615836; x=1785220636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vNILrqZOki4ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=;
 b=sxtyFy5h8mF59uE84lNlAF4DBZ5rywLfkl/L8dR/773VVbBm+AFVQC4D2Mz1OSamG6
 RG8ZXxGePRh5DVl8VVWl1JK87DZ1uxuIhHbREuQ1zSnP1y9K4MIiOQoNW42RragnUBFu
 tWmMP/TzepiBCgRFUsEcd5PaP8BkN1kTsZNynIZWnGU7SaEBzGbpxf7u0mc2QzarWClh
 9tgl5rM5nNy/oo4FSc33qr/W6EpHVlaI/NUYeDeKAqOFndYJsQ5tKZO4JRBBRUdZtyeZ
 GsGQUSkAUUvwDgQw7mGWAGpDtN/CrWUM1MwGqQ/6jFmKruFK0fJcqUbGmGnpLWhmWxn0
 lPqA==
X-Gm-Message-State: AOJu0YxF9NbiVBmiR25ki5t08hFyHLXNghZxS3S6H451bt68byanI4oe
 zjSaVDH0KDH6zipLD0s5UyQrYxZ38f+A0WZM66lJ3+mySBviT5dipGqEMw0MFZzu1VDiJuyN76k
 xfo7X0Oz8WKrO+ciLQCwcP33zsjvjeqi3DwnfAVfeB2GNZB0WPniuojTKBKjGnVnh7A==
X-Gm-Gg: AfdE7cmTzBGtXQVtVgpRP+0GgbNOTXRKJMhBFB+22he4xMYmNGy7AA2/WaHJdQqN0Ds
 hEiviFwm2RF2QVxE2nn9+WF6T6jSOe0AoJcfU7bTaIp4cL2Ck/UBlEogsbpkhOWSnGh7QNX4B8b
 VKon36wqx2TUAkEc+8PTNmh45OmIHfgiIUE9JEQHeB0snOuY+d7V4JBVFHGp+kFZSJ8qqYFEYUq
 PWCowaRsTxDzEOnKmdgvji8OnMGe66O8OjvxZPopfqpo9H4HRMSSMFvzJk6ex9+bhSIf/XF0TY1
 4v18rpMiQmecJBoSbheQKVsrNpmNdDwDSF245/FKLAsPL1h7u2FIUgfPV/kSVYJihIaw2COc1m8
 pfeAryL/MA33WkF384YsjgOEpiYpWsN2Qo+sBtaJTEnJUc8jlwC7jcDz4iyT6C2uc94mxFViJKy
 4zIwO6L1zCdy1a+4fX6oOyFS+DmBG776E=
X-Received: by 2002:a17:903:b88:b0:2cc:e3b6:f305 with SMTP id
 d9443c01a7336-2cf349ba609mr138979255ad.4.1784615835966; 
 Mon, 20 Jul 2026 23:37:15 -0700 (PDT)
X-Received: by 2002:a17:903:b88:b0:2cc:e3b6:f305 with SMTP id
 d9443c01a7336-2cf349ba609mr138979075ad.4.1784615835518; 
 Mon, 20 Jul 2026 23:37:15 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a1bb8a4sm47161380eec.14.2026.07.20.23.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 23:37:15 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v5 08/10] docs/system/riscv: document initial virt RPMI support
Date: Tue, 21 Jul 2026 12:06:34 +0530
Message-ID: <3a8f2d3fdff3bbd3760d0a5ae75bcaffbda1c47b.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4S1yXQvibFV0L6TuJFF8VKcmH_NqQb3w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NyBTYWx0ZWRfX/IkQ75kQIIMr
 Vt3d/T01O3I36qSoRsoxLDKOnuySTl0KSSMBBHCRU0RdpRstO5fafIcbKKpVnX3U8kRdcUrHvsc
 h1Aza0Jm/gNpE2+sQVy1aG1rR6gEMJtd8DasooUBg7LXyX3GFwmit9kmZdl6tDOPCHuofgL8rEH
 hZNZtN/sLxW0vF6tpd0v+2Z1683qKeNl4WAoXzMGHzC0TU00VlPnuIPhjD5f9c3o5bm064QQAdN
 LTgkAGF+xRam4LSL4623rFa+QkURw+VZQQVnRR62M+yl6DeyQaog9qvjmD6E9XWJuUCil5Z3uR9
 azk051fwUb9FW7ran1Sa6HZcIOcc0RqKWlz4ZWnrmHhvSg/ladN0jOLKCRgau7XoOQVhK3OFWz8
 ZUJfhDj/lfP3+fskSxWjtbkAjotedp7fadUivR0d643/SZIHk0DmlQZPh0w2gJePnsnyOJ6AdtX
 5Sk7qRDhrSE8EUxclGA==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f139c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=RyhCfiGMEKD-kOZgqhYA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 4S1yXQvibFV0L6TuJFF8VKcmH_NqQb3w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NyBTYWx0ZWRfX9pIVFvq5N8z0
 etXrjz2m+NEHS5BQFajrJG3T+opp08EIWWFC2dTQ7tyaq91OqHxu6elpoYJ6tSjPeEKecgeGa2N
 gZbMqXqFk7p6anZfRClBn692Y++zsLs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210067
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



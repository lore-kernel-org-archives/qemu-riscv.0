Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7E6C5CFCF
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 04:55:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wujvs-00008n-DC; Fri, 14 Aug 2026 00:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvq-00007w-9x
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:54:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvo-0005N3-MW
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:54:14 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E4QYE6282906
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vNILrqZOki4
 ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=; b=B1cEmVUD/mQpjE/RxIkyYXgehSC
 z5md/wREdml2qmnLS2upsz7QfH0qipufTWHQdtecbBKQhdp7gashTTElsqkAHPNm
 +PWaCh32uAHZNgqlrXmc1G47rOmvw3yFoBe/0eSiQFR6KeEoQNrJRTnw1l2xGrCb
 WQmyddJfNkGZXSTEavacWPugSG3QYe2/oTum6GvxfbVdaNF/ivBRQGwrTTDLmZIs
 p9Yk9jYQVxv1Py22auIUlIeTePTwA+psr3orgUendmf77XDL2WxZ2HhOz7e8JXSh
 pGCrI7WZuBdSAvyHD+XgoTobL5ONwBedOB/CYRPLRJjHa+ebhbPLFWe6oHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90tjw2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:54:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ceb3d20b7cso1300665ad.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 21:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786683241; x=1787288041; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vNILrqZOki4ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=;
 b=PNtUdG1lvIMEmGmZ59w6nUXzhfHA4yeIhsr2E/pYxEcGG5brZe5vq3grUWtVwDnIn4
 3M2iuEviAQdZKH0f7qiq73T6eELbpfRCUfeWIxvqwqgi9m0NMmHw4rtPmjWjNax9MhGM
 aiX69QS4a9248qSGIMwkFxhZPpJph4O76bNNUzmKj8vBrBjrSzJeDkDn1gHyxs9SEdk0
 at6GpaRKy/G04XnIqrWR1hOvNvkeM813vhKNZB5J18ERPI8zIeehto6sjspqbHJXXACa
 CZ4OjeikAlJApkviyUNF6epGj6HrGmU8jE+Xmf6S+DE2Vls31nb9F8yVEqn6dj7GBURO
 tFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786683241; x=1787288041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vNILrqZOki4ga/4fJZJkmvVhO0/4YSMRXaOl2EAjZlM=;
 b=NGIzYnFDVGVUUYR0gwqT0HH6Yr042JNKq7sDQsCzjhZJZJfNACMpMK3EgL3CWdmiNb
 cIpNv4bR52TsRHGGLMMVBRDQb9xXF1nCHxYAZ3GWYD/VyHI7l5scC81lBj1yD145uJtt
 Inv9tS5fcocZx/m3goDN8GQkQTrTGnnfK4TeCMumXqgZOqn4C8jQjk7tAxyPkBZCO1U3
 Ma4VxtJu5Oo8RWGXDQ1Dz/lQgp3RAqp86LAWXLgsoa2bIbrN2MQOHvGlKwMkJ1jmeBJx
 DAFdzKnl/ckdt9f1FXIkyRETlGG3+qRq5+X7C3o8Uwh6U2llY+XianpOe3cVof7UgSjl
 yMHw==
X-Gm-Message-State: AOJu0Yxd/XOE80J6AjloZi9QyB3Z8tW7a0XXq922tk6fgFRua5ycX1mA
 5ABK8sbIXcI/Xitkgr9+9GNsQ975KDF12EO989SfqxASB2+VspOAZaoEdaZO8O+4x77TWfTahQh
 KAuukwp9TaEr8b8aB/PEQEj7iUbB4GrvUT9t7FY8r73FxfR6PihFIqndWQTsxZFT3vw==
X-Gm-Gg: AR+sD13du37yQDElRLi/nSi5Kl0OT+GKzO3QqD0ABNsJCJm/CdMtXhr66HSAV3ngiLx
 PVVeQgDa3/WwUC58p9zQ9mjx3Af0vfzuaL2tfkY/nlC1RUj/5NwYtuI6M5CBuwP6WxqRyLpd7YA
 cF9kgG1eLOib1JEHguL1tOvyzSb4QqFsToIgZaj1vGbYOZpWW3zXtjIwzKfGWAfjQBvX5t2SK/2
 WKVJX89sYht+pQXSATdwiIjsJ3yPgjo52DdXRk1iMsmlUs8r4sIM49aP6x6NmHexgJFyi9/VB8i
 0gBQrkvh/AfLiIcfDXyxk4SCt5MlIb7RUc49Sxk1OM/lUlXB6SOcgE6bzAAR8AvZuPOZ2R57Dpn
 wWqlTCauQXcD8IzBYzQnnBTPT3SznrGsJQW7Pv1t9myQO5URX+kjgky6vFi9Qd25KbEEQUPcGRq
 ZhdOcl/RTVs4G0wHM7URAw9qgElOj1Aw0=
X-Received: by 2002:a17:903:1b2b:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d3b0739429mr25659355ad.0.1786683240591; 
 Thu, 13 Aug 2026 21:54:00 -0700 (PDT)
X-Received: by 2002:a17:903:1b2b:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d3b0739429mr25659115ad.0.1786683240100; 
 Thu, 13 Aug 2026 21:54:00 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31f15063cd8sm10625665eec.9.2026.08.13.21.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 21:53:59 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v8 08/10] docs/system/riscv: document initial virt RPMI support
Date: Fri, 14 Aug 2026 10:23:12 +0530
Message-ID: <20260814045315.3416169-9-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7e9f69 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=RyhCfiGMEKD-kOZgqhYA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfX6P3mFw7I85Ea
 syxJIcxHEKZPp8YfPXbENybuyI9NMFSbRDG49NMiVhMoDBzXnL2qg568831/xPsRUlBM9sMLAsd
 AE7SkLB0yqp3uARtdAPB4/qYdROjYVw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfXxHdvcsaEXlqK
 mLMOcVW0D+YIkrC6RmPq5EhD3E/ppehIPuYRTAKKjiGjYrT2+pRaa5MG3gqmMXU+YPoVgdTryGW
 vS6eQTzluTuviTsNEsl9xG7EjISjNCWHccUZ9NeQXqzzB/WN1iz28a64K9UWyUxt7qJMMDrsVZb
 LrIowkAQcTQPs8Q1a9LG0Bp+eDS1RpkRZdZMXS/tXOtaRifISQgdnU5sY1errdnI16L0flRDY5y
 lKfe5e3Z7j5k1VifLXQeLeN6fiwe0OaWci2/Vqf/uVpFRFXmqJfd3d3/rsRal7ay32Db7snD/uX
 Q/NCow75HPhbQ/t6mR1VTFmGptrEEsnrTBvrfcvbj3iwEjE22e7pxKTuNILy3nY+EovoRSt8Qu5
 R3jjWZj5TwS9Wue4HRi5SZVWua8QL6QjhiBDcItDfWYWmXHxCkd3efjGdwfiSyN1fKOf84XYKM9
 q0CJZsK00VHlv5cjjQA==
X-Proofpoint-ORIG-GUID: D5haRcvm1RjUAZ6MkkzX5ytu-yg2zVrd
X-Proofpoint-GUID: D5haRcvm1RjUAZ6MkkzX5ytu-yg2zVrd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140036
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



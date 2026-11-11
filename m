Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEABE606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZVsClSg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2j+uSX9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR1Si-0000SR-4m; Wed, 11 Nov 2026 01:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1SQ-0008Vj-Ua
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:05:19 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1SO-0000nF-9f
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:05:18 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5KJiX2350824
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=a0vBc4PLM8J
 tpS9+9S5hjW80mO0/TB0W4hbgh1tAwX0=; b=aZVsClSgf1E68zlNW9uZyxe3yLR
 H0CC7BOvj5pbnEHk189tqoFtG+bE3q3nBjX9Af3TDconVT5jqFCUTp0ebipjJl7W
 QA3zkO0/40aGcq1LAgWXUlH7534GA6JfzkfRociFsrQsFjvMxeslrG1msX2vgG5u
 1AhFTlW+QeVVKlz3sjKtZotCsqmiXP8EfX5BFV47/1mpxXsO6zb8S+uaxPLcSeyW
 XjYSpmsWETWUSmp8C5acgJaX4OLg2nkK1vMG4xESkjqfZ7sx19Db2SbM4GDozzuU
 IaxF/DzinVbiqfCDDqBktxJL1ymNQpB8lw/+Odt5ZjQzfnPYbnBEXU+dLEA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp13fb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:05:14 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7cc2c798d76so12001137.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 22:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794377114; x=1794981914; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a0vBc4PLM8JtpS9+9S5hjW80mO0/TB0W4hbgh1tAwX0=;
 b=K2j+uSX93ALxHnk4lv1hhM4sqta8J642Q6DqJubhVgaKK35Ztz8Sb3A8Dhuq9WbbhR
 gslaYGeW/5OO0OXE5OADDF731ESRvtsteohc1FnEPYSTfg/Yfsl6WGZvOXP3/7ds3ZO3
 9IsdgBgT9H8AOsgTTv99AVIbTcJJF9pFbw2W1haLM/ZtmH+0+RgdecJ8SSiihY1fVWTd
 sMnpqd5yEseuaC+KOa2ILxaEDYXCRa9GPqrCXWcAlWVZtu3o2Pqj+eEUE7Ey3lrijBOd
 iPcfk2dbzxk2EdUvTjLZ1aTR06OWep/jjZ54XgmxKd1lUmwCbWfqddPcQ0uscpp1iU4P
 597g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794377114; x=1794981914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=a0vBc4PLM8JtpS9+9S5hjW80mO0/TB0W4hbgh1tAwX0=;
 b=zEwUz/Ba+sWIUkDgP5bQFUsYkyYqvPDux0hhysfDKazWr/wpRC7Mt927g/+G9lX8a+
 jpGlUOgFYFyVL4cMZ/XWKQ2HnCHP9WpCj9RdqmlPe9YhjnEZt9wLjdWoMUG1KSuVYDVJ
 N4CYn/mctnXItIHqsBwEfsLuTVFyt94t8ahZGE9jJ4eK7UzA4/YBfkuRBmRqYf6N3GhR
 1HhrBLyuJOUaewyXxobVKdwF+eGpfjo1+SG2O8Eay+ucz29DdthuXtNGcJSlw5tDzlIf
 +tKEO2s6mz0sm2N+TxL1NugPtkEMVz2WPEQmkjCnx9v7+n9TydnYFHS9GFZfk1lGBEVp
 c8WA==
X-Gm-Message-State: APuU4Z/vsH1jT3PvY4KsQJTeki30pQbf9UCs7dtpu5NvlR89m6mTggC9
 WFLtxEKIK9ritloKt6b++7FwwkFuBjYbbaB+Aurag/CucHYh+pZ7PhXVVbYebOzQTn5NMTsQRk0
 xWyP+2wj7GpcJh399DmMt8GR2NZ6HCCDcz9JcZw05Do2ptalnLnXMYbE99MmQ6yP2lQ==
X-Gm-Gg: AYBFou116r8cusd1rvftybD81ofxZyUj2v9DHBn7ZSOMIDUzB0GG1W1deYJVH0WZass
 9eFq8JDVosWf8N9GYQp0+Q3wsK95AWWH/YTCQi8OJ2Mv1lg5xqJVZjfwiCVSZAUDiMgunx4cmGX
 19ALVQ8tMMhzlmd4J/z+KG52p9ntpMjA8K6cAiHVjTNBHsGr/n5QGX7tq5I4M8Kn5j2wF3luQ4j
 Ov/heSmQePzFY6kRpI5tvo18RoSCx/R7Pob0FJpbNdO34jsT94xDOtrsl0sUcdwHI8AIDPC+EPI
 oOt7qoKw/YLDKLXkezxaN4hBfIX/E1xY1b7z+5EEGx7O1T152pdCdjXuAz5wmG5DwcxgfAF1En5
 lNAvLoktHcwoThRKJECmsO8wYWPUUMp8jZTrrrQwunqoslB/LqH5gnKbhrSQ1Ht359UxXNxAoBy
 gJSbkf8op2bRpVnNuULXr+g68Y22CIkLZ4f6PZQnO2kyQahEoAiKjdig9aFfxoPr6eO2/iemStV
 7F1OeA=
X-Received: by 2002:a05:6102:1a02:10b0:7c3:99a3:314e with SMTP id
 ada2fe7eead31-7d4ed9d385fmr448059137.0.1794377113696; 
 Tue, 10 Nov 2026 22:05:13 -0800 (PST)
X-Received: by 2002:a05:6102:1a02:10b0:7c3:99a3:314e with SMTP id
 ada2fe7eead31-7d4ed9d385fmr447780137.0.1794377104270; 
 Tue, 10 Nov 2026 22:05:04 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3b5b2ff3bsm15067990c88.11.2026.11.10.22.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 22:05:03 -0800 (PST)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v15 08/10] docs/system/riscv: document initial virt RPMI
 support
Date: Wed, 11 Nov 2026 11:34:00 +0530
Message-ID: <20261111060403.3777501-9-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyNCBTYWx0ZWRfX2Zm+8q0gLFT+
 D7fJxNn0vOGN0nblJbONd7tPRRwpDJnb6GM3/du081Oe8Z+JgdhGx+uepWlkdUgx+odZY4vSrHV
 pdYcu3iHgDMz/SivrtOpwmWROHxfXWHuZpiMDLpjoINO5065OOSxo404GWVotpthiv9j+EjExwe
 zwO6FEhqYzUfIbIWtl+gGwKTeH+NaxafE+DMZdtts5C4etjb5LkyBlZOIRSAom4mXS1b/6TNNPf
 Nd5SilF9y4hZ8k8wNdmoLgaAxCYaMirhVvONqnj0jx3+4XNlqWvsVBJBNPewEYv7F+OFy/DqKt7
 SWHqgxSNaDML3Km3kbL+O19JN5j/BoY0dbMD0JYQTiNAkmZpLJegGj8JmZstcxeBARp5248o27B
 Q+U8kOGEwXuK1/VdSTJBV06DAcPusA9IQ24V/6E0VsCbZsK1Ex2ND0NuILMnswEDj7KNYd+ishQ
 BJCYV7WjEuFDaAkraIw==
X-Proofpoint-GUID: 5Ft4uIuj8DWwW5vsSrz7o4p90PDZrLc6
X-Proofpoint-ORIG-GUID: 5Ft4uIuj8DWwW5vsSrz7o4p90PDZrLc6
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af4059a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=bNRx8rSjxjkR0t5bZ0UA:9
 a=-aSRE8QhW-JAV6biHavz:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyNCBTYWx0ZWRfXxIlQzqUBeiHV
 Zaekzcsq38zg060FKDNWjggR1b6QqCzt9bxkq+3AbpT2YxwlNdOzcPIKft0Qw+6qEQYkJYU8aRI
 F+OAT1grqxnTG4Og2mC0P2JysPf8fzE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110024
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
	autolearn=ham autolearn_force=no version=4.0.1
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
 


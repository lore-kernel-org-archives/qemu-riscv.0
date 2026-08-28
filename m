Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B816AC61DCB
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 11:30:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzum2-000222-Q0; Fri, 28 Aug 2026 07:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wzum2-00021Q-2p
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 07:29:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wzulz-0007pL-5O
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 07:29:29 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SA7r5x2152727
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 11:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=OZctd9OHman
 fQvx7UyW/l8Abrqo79MF42S54z4koBmY=; b=m7rl9MbfkHebsG8ohRQZ3ijS5vc
 uq+iiMyPWCQBnp8IcEMyuq3SgEIh0QQDLSvAofYv8WkG32JhwZgzXpbUbh2P5OBP
 Pl8+vxmrdDs8q28Gsk/67vsAth6MuoPzKp2cY/vEByuR7iOWvtCulJ1xMMi/rMhZ
 ZOVDz+9cQ3/XcKkw4/MAsngncUlLKuwgGTDVT1DYYP7M8lxruX2YGs1+Cg7h5+1j
 WOLn50XXdpgc3hr7IP/hZLzguCtdC4VJxmU5ivT1igRiprGicKvsjX10Or46RS2Z
 Zk61Qal9D1FikJ3X1TJxkqNuqABKOE8gC/sA1KeU57dMuE8KkHlf/LByNWQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r9ew6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 11:29:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38105cc58e1so237751a91.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787916565; x=1788521365; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OZctd9OHmanfQvx7UyW/l8Abrqo79MF42S54z4koBmY=;
 b=cIBvWKVM09xX8EpkDYR/w2avBVvoRY2VZKjDa9ISSiU4Ii1aQAr14V6oGCG4W7y+lF
 Y3RGJ8ZVF6X9cvUWFUZb9Yq7B+4uRSiTGTH3s27JwJD/A1idvqtR3zseElo0+u64nYbK
 w/WH4voJyJgIVTkNRPazLlgXExPVG6cqGQQ3yUtD+6ThNM1RKkfmUugfnQpEC0P64Iim
 s+H6+x0vyfumkaTIaaaZvJpD0OfTrLEdlzEnAKDvk8eSbjp7YwS7qHA3F4/tdOU7K7eY
 MUAMK0Ws4s+9ct1A86tKGCRIyQarWPIwo8w6qwLxI1WwQx3xELPnwy2zWyHEvIKMaxs9
 rBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787916565; x=1788521365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OZctd9OHmanfQvx7UyW/l8Abrqo79MF42S54z4koBmY=;
 b=lkv7uWUC2GiJ872gMM/qa6oR0zA7ljNqCN1j9ngX9EO6xo6BDLn/BuvpfYwWmufqmw
 Ulfw2OPgjoswQSlcPsrUpKK+eJQlFEO2zkc/0HV243q2tD+ChCXGve5nvOG6RKcJjEao
 sfrwAwko1G7SYxWETV9gK4W5zuAH84ekfNYFqEJhreVfKWv4CJqDdeu7QkA3A3WpEmHM
 xAbt7taU7l/Pv7oMTyjAT9A8VZu4CfbZ9bcTJndskBSReO9Iy+C11Q240Bj5JOArHJLd
 fN3EPomjLGvisd3hmmHSB7hjGqs6XQdanXuuJdXKIboPfE1fqcmtRYDFRD+nZoHDu/EX
 mJIQ==
X-Gm-Message-State: AFuF++kdIyjvurQNq6OQ28K+wiRG8cnc8QPA5zqlzBVR8WhxoAhJmpwB
 ZoRXwrHOk1o91t85V1Yax7g67LjZHbVEzwFfd35oMMvFEJ36Wu9X/U2hTwUD7nXDoWHL3rXuchu
 fKlcaDAmFWY4POB/Rnz3oGge5yEqMwUZ38fxmsjNkW42JzX+O+LVyjxsi8w==
X-Gm-Gg: AR+sD10zPGav0AGfmwUepJpy+/mI6uOp0+MEjq6fbsjkCsLCgtCqnldvJ+JPwEPAHR1
 q9Trt3eu1jOLAH1DQuNpjgsuf5D3dUMrdxWb8nf5qAka76V9noq/nuzHxOpyTsa6dwZcS/gJxKu
 wZRD3Eup5RTOgYrJMkadSeELu+yQSJKMN3dOJaeRB/Wn695VP4L9Ht5G0hEybgZfSh/ZGSUoA6a
 qHLu7SiAwb0E38+IatN9JernBn7D54Z3u5Uff28v8FTTDUqOgciXt6ZcGPfuHPwRoP8KqODfNUR
 VvnAW4fJ0aC0B67GVvIXo2e7FRhz0DIA6Hrk3wNDXnZUf9XIBWw9QgMpn+oLd6Qq3htbU5CFFsh
 F00a6OYiLl7lcvuOD4v7P+++x6p63W+BVwUP+BjI01/qJhUnIvsgYaLqZTpZdqSKbSzSy8+SvDq
 rdwK+sJ8wv8n2qklLgj+zkQOyiX4LxSGc=
X-Received: by 2002:a17:90b:3c47:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-396d0ee934emr6313670a91.2.1787916564759; 
 Fri, 28 Aug 2026 04:29:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3c47:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-396d0ee934emr6313598a91.2.1787916564166; 
 Fri, 28 Aug 2026 04:29:24 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-142e0de4d92sm4997320c88.13.2026.08.28.04.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 04:29:23 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v10 08/10] docs/system/riscv: document initial virt RPMI
 support
Date: Fri, 28 Aug 2026 16:58:00 +0530
Message-ID: <20260828112803.86636-9-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828112803.86636-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260828112803.86636-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wWLEMZJAijCca_FSciy5d5EUqzRpZhHW
X-Proofpoint-ORIG-GUID: wWLEMZJAijCca_FSciy5d5EUqzRpZhHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA5OCBTYWx0ZWRfX4pFIGxl+ncCj
 bpsLhdW8yFNVu7jVhVU0qfKx+pKJDE4iSst9/s6Fy1lb95+f59C3PKbfIFFNZxOyzYdjPXLFYCx
 CTx0zz1DBGIWgGzNVkrsRE1b7tvgHRRDJhpdjA4ILAcjP1HnE8kXNrzObUB5FJbUS4cLxCE3wMj
 9ej42mYurSfj+VxJa06W8yNlE30Q/TXVXxnmw9f8GlIIBNdzYROkIftuZiHKNfyH/zmfckY0OEj
 ZcPrPPbEPq+IwR8/Ju4hutC3Dfv6EOiHxuAzaibEKBc4e+8dOqnGqXxHTGOx13V9ikV8fXm0B3y
 YaPI0ZSI6EAbbjLPBW4ZTE4XehlfU8dhG6+N5aow88Uf98WY262vcZLv6/YtCt75Xyk6N7Z+GZC
 I2DpMbZE2J6HGTDr04EDzMqfWFIj3+xqnNvZTT4+Wa8YRDKYMR8yXlmk2LQ/Vs4IRYG2m2Pjojv
 1k8TKnxNbuPeEqN9YhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA5OCBTYWx0ZWRfX5Xkc59lwtTtQ
 kTH53B5md+3tQndu7n6NLASu3mp9EH3NL+35xvaJ3virbTbkquie4qBEECBM2JZv44FKdB7hV4+
 SESmTxUhQHeIggWi365jqUNiL4aVBhk=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a917116 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=bNRx8rSjxjkR0t5bZ0UA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280098
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
 
-- 
2.43.0



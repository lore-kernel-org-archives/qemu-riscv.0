Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31E7C44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 12:23:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiAEz-000735-KU; Fri, 10 Jul 2026 08:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6mp-0000a0-Qt
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6mn-0001ue-TX
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:43 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66A7dWks4194177
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xfihhQahT18
 tqw16GN07qOdNHK6O56x78Dza3ykZ+F8=; b=Ya1RxJbZ8MyyijZ9iQFoLTLvITC
 BHcVOdfXty+zXhYg42kGARuOIIa5MaEPEVg9ywE3RTwwLI8HCOyhTXOVHbuZvErG
 vtKu45aro3pJlCnir2dr/y7tk8MmCaYWCk/SxiOjzxTv4ZEwNN6qEa6wrdbPnIwA
 04hVghp076UiRq6s9DevuAFLjQAiTbYp5tv0CJ3Apm1tIrfwtCirLeSbBxdGVQvr
 ln2w+tyKMy9Tt66OGwYqEyz3GEG5jiH7Im5O47k5XT0s/oF8BtW9Llga895xPOA+
 hTvzIn8HbGAGsksCFpYaXJFU5jNw5BwewAI6HT+WnV8HRiglnwZepwvIppw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24uday-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-382befb9555so203411a91.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 01:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783672840; x=1784277640; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xfihhQahT18tqw16GN07qOdNHK6O56x78Dza3ykZ+F8=;
 b=h9sIJq+eEYEVl6oUeGWaYasRcTZ/9KcUMCGpb6s9lf/qqqYpNFhMcwO8AwPNYxuMzB
 VY5KwgBCPLelC2FpQwGaiV+Uci7jLdMeajujUqopdmY/QJ4TF4PetIXNkngVuWYOF1kU
 nrsyFjahP5oE2CBRdcsuQ7O1bAs/a1UJCjHeTbE1FpTAByYzZhcVJegts23oY79hDESu
 WOVWpNUn+Es3VYlOcbZUty8OCLiCagkbtcZfC78pT2mK61Tgf1MNtAivNlZ5VreI89ho
 tKnWCDa/FTFQEzZflDXHRZKNFyz5p7ricFU3xCqUBVObyI0653BzG48afJHr5t28NMik
 yfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783672840; x=1784277640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xfihhQahT18tqw16GN07qOdNHK6O56x78Dza3ykZ+F8=;
 b=nfl7/pDXNiYp0GOsK4+K2rdiSIN18L1/E9p5pZiPEfb6ytLMaH35I8i6Tm1QL7VGAA
 IRmLXL5NShsMV+Je8gAB0S3roEFJsGKwgQdw9SEJbDVIlJ6mPXtCCeZJEfQkhxkvalcR
 i8qLoy9jq5aEHjFPNZ099ie8YKkrGCPyaVy1EbHln8tNbnpqIWcLWYMKcWiyuiJJ5oTG
 thuN+/N20L1IukI4U8n56JU3XphzdOBwYUx6GSrfBIG+g0AoTRLwpQpwMls6Ogq+rvlV
 s9ndSx3Mn0aefDWfyhRe8cRn4YgFOo7aU5v81n282F6cN25WJ+R1HYicgqhQkvxUFFUc
 M7Pg==
X-Gm-Message-State: AOJu0YzG797MaO/dHpu/5m2uRkCCfhZcOI0t73yB86EeWbslCkiRrH4i
 anCo1fBcITWj2/S8zxsDIFHsJUKWQcIlmYtsoMFpSWP/wHjgp+fjsiFHr1Y4Ig3Sst91BwtalQ0
 jzCUWgajIws9QJgDthFlfBSDysUa6qLHt7NQZ9BPCV7eBl4q3mbt81k+YwQzGK8jktQ==
X-Gm-Gg: AfdE7cnOed9P6UyNAJo5HLVhSE0cth3x/I08I46rtVMhD3tIhtrXhY5E8iW+J3weoSP
 Zh25uKj8V16BkR7pqd2pHQK607LxGSSKiBQKDfYk6GofvblMC/DyJxiK4RDZiDfR7/I3MiT9p87
 3AitJTDwB7uCkeYoNxy5rM3wxocM4jzn58H4/FJqyAjF7BSPXO4nWz7/tj6tGnRJXCCsPqLKHw+
 i2K1dK2Eh1OyQs6EcibSCEvNfCrxzPuJe/lJjEn05Qd/ALMsZhABmW2iyKtLJdW/vMVbl+jFY0n
 cscRsfwdE2aFDYbFfTISv6NxM62ewBY5NhC9nsfL5qGztEJOo/AtPIqWXOZEl0BEdx7RvI9QwxS
 cOxmipslJvRWNmJNbeDfYMCIPZzicfI4tjS+yzltlA7Eu9aSDmGvRJYZ/6IIjqPMOUxea7/2UsO
 YdYQYuLEe5CGR9jEU/k9LiTVEQOPfs6zaDwcLtHQgJAg==
X-Received: by 2002:a17:90b:5287:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-38a1f1dbefamr5607852a91.1.1783672839923; 
 Fri, 10 Jul 2026 01:40:39 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-38a1f1dbefamr5607827a91.1.1783672839430; 
 Fri, 10 Jul 2026 01:40:39 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3118389d9bcsm29164925eec.20.2026.07.10.01.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 01:40:38 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, daniel.barboza@oss.qualcomm.com,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v2 08/10] docs/system/riscv: document initial virt RPMI support
Date: Fri, 10 Jul 2026 14:09:50 +0530
Message-ID: <10f13dfad6528556a3bb4aa077aca8c38e34bc24.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0UajfxtuDdtmHvShAdobI6uyKfjnWWYz
X-Proofpoint-ORIG-GUID: 0UajfxtuDdtmHvShAdobI6uyKfjnWWYz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfXzXrH4jKL9LWs
 HDs6XYRUZKN416WQxIjhAETJI4PoGi1iIPcYLom79gXYMf7lRg8vGu2+q+xrzEaVIH0b3RENWei
 fT2z8Fq5JCPi25sXidRltYkdXPLzuOc=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50b008 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=RyhCfiGMEKD-kOZgqhYA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfX3wgzdkm5xTUS
 Z13ir+yHmYDzmHjhJh/gZLo+0h+ghSU/V82JMPIWxf6sfcnTZLFjaFPg3MQm19lE6muvV9HLY6h
 PR6I1iepwfTI0kHMvkSeeDjYyKWvNqKUbZ3kOt63VrU8kQufRPbKj7QxRblx6OsZXv9MdjhOYw6
 eJE9oQBgAUZyfDCfABUFJRbxWZVPvkYi+wiDEpd1S3gzfYz+4Kz0/loQI6iQXaQBo7IyDpCF5+5
 JwuLMTv0DvSrX+6/STc2kvJfEkOdrk8sjLSdPVN7veYwwpvJ5dJPAOoePWcYgacXYwkkKJa8GpX
 KzBPDxz0LNHX9SJVM+94Vyc05O9nbGAu1rHNywkhU3y71+au06od62GYSbMB+LXDxESi71qE5Mz
 MYmw+liy/ebBKrDPGd8XV1+B63GEHz4Is4oW8pJq5dCaxFw1kmKuJ5IV6hXweJAeMYxPzbPcrfx
 zZOA3kQnQYbWfpcdmsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100083
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
X-Mailman-Approved-At: Fri, 10 Jul 2026 08:21:47 -0400
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

From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>

Document the opt-in virt RPMI transport and the initial HSM, system
reset, and system suspend service groups.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 docs/system/riscv/virt.rst | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 60850970ce..8e88f780e1 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -146,6 +146,56 @@ The following machine-specific options are supported:
 
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
+  The build dependency is provided by `librpmi`_. Install librpmi so that
+  ``pkg-config`` can find ``librpmi.pc``, then configure QEMU with
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



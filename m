Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EBEC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 13:04:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiAsA-0006cV-LI; Fri, 10 Jul 2026 09:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wiArI-00068c-Tk
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 09:01:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wiArG-00062V-W2
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 09:01:36 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AAnCtp570608
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xfihhQahT18
 tqw16GN07qOdNHK6O56x78Dza3ykZ+F8=; b=ejIOubgOS7KC76YvktDYMvNKmfc
 Quv4GzlDqTypLd2RFlX0Aw4i5aRfoBhLC3sBDic+8kkyfnFTAoinHmz/PjvWQsME
 20zYtemE1TbwYXFaRX0BDhr8OD/CBGbCb/i/Bpjm31sBWkgHiKRWYUvt9qNvVxW/
 6t8Hl+bAz5iv6UqCx3sQS9KMzSTWrugif0Pcgn5Q0E08naAywW+zmR8dlBuEhFyO
 I1Llxs43HyVj4GVAd8Nnoj4N9LwftGm8TW1XqCTVGbul8QEJQz7ZXhp/Nr9su/eR
 ukLarz+mTW/w/XXu+FloytFHTOWfF6amfdTaJyx4tD9CNmEY+ERFgenQ+WA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8qpu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:01:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38105cc58e1so254701a91.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783688492; x=1784293292; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xfihhQahT18tqw16GN07qOdNHK6O56x78Dza3ykZ+F8=;
 b=AljFfuInOtl6uMmm7fUqLrc7wajkFkOa03Vw5BCdV0BoO3b9AQAXGPr/z5Dk056h3q
 cs8uFKImLc96EcE9Wr1OpPN4S0hDjW/kNPTeSyjq89tq+voJcPvMd66PKHF3GI7IlNy4
 uXrvOrrJ6S7b1CAGjCfsd0otwHLoaK23Pmal2xWXT272VK9YxUSMwY/2DA+bZTBwJ6kO
 r8IUCcZYADcCPJf3IJK3RihrIABFkNnS0PPjsUzhWGHXuGx7x4eMCU7izKeHCXNZkjst
 WiIXCWiQgf4gbJvaOmOPSVb6SD+7ie3Yk3dRJ8yXg3Z8Ri8RLUMSjv+1qy9gRd+oMmVH
 vB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783688492; x=1784293292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xfihhQahT18tqw16GN07qOdNHK6O56x78Dza3ykZ+F8=;
 b=ljdDWcDmYs6JcRRMaNl95PYrQBYqHdgJ5RxLqsHVgiFo4w2A3K9QaJCRgTDAf6Y/bw
 CKr22ecZC2OQ3P14qgj+eO3zsJCdARfQm2Z4j1+kPfTPd+k0YkyWmTn2g8sFnxgG0LWD
 C0csLPGbE2DH9iBdfYMhyF2/BDOMi/U4HQdlmmMR7PljQJ2UrB2zFMWj6rzX6laSbThH
 s8R7hiJCj9HWq08uC1zPvPB2nRAy8dvwoVB8DUg4bdeGLD326AaLfCVZ+1yI6Z4s6tdB
 gepnywA4y9+Sf8zbBsRayf2Fm/V0bjqnB5GRburxmf4NzjWm8BBCV3HGYKrxOe2riOtB
 17xQ==
X-Gm-Message-State: AOJu0YwHJxH+TZKKJ7zof+kfix0KR5TRbxm6UvilXDO2m8WmCu/M+jxD
 GqUXrgA07bzvs+VMvCabBc2NFvQaXoFeHes5PDwRmyeNeGMsv89aW8g9UAA0TWn/ha+qWFBMIj2
 aM/ovtfLelBDCWBCPjwsGZFUdhY/qW2p515pM1Z6NwiZ4NlilxbxPkyiQtvUXMkqxKw==
X-Gm-Gg: AfdE7cl2Nk6B0HMw2RZo1sbNNyf1z3Yf1UNryAaTL3WSENRc+u15KXvGx7baTcDrncK
 A59VbI53VmNc326CvArhch15oi2ErDHZjDlZqD/av7zr7scmWA8G8kEYQe1226h5Lpu/yw1tW+l
 6hGe5J/x4+rmKM52v95Gvv78ICj3uQPK7/oKuyu11W5IYj81u54aHDO7JE2qeOGTHIQx3sJzFU2
 oH57BJbc3rrZHUK6TBuXIYwhht7hk5/LASlF5mCNt/t/oFB9Hq12PC7uH1xT2qpTOJbVTlvf2ZN
 XZHedPjLpVg18QVO2/NPG3edTY0J7c49qRLMmC/DcRuhBx+1xjZxx4k2zHGzr5uuNuh7fHJA6sp
 c3A2w5gVsZznjl2mcRiL77+awovogfTnjaK+06Qky5+ZdJ8thNq2hDG2a9WDH0wOmQO+EvBoul6
 U3vc+My+H5OHXhhUwQJmG5RD5m8E40ARfiSOzwQgnFmg==
X-Received: by 2002:a17:90a:e70e:b0:37f:e7e7:ad1 with SMTP id
 98e67ed59e1d1-38a2103a8a8mr7065530a91.5.1783688491947; 
 Fri, 10 Jul 2026 06:01:31 -0700 (PDT)
X-Received: by 2002:a17:90a:e70e:b0:37f:e7e7:ad1 with SMTP id
 98e67ed59e1d1-38a2103a8a8mr7065493a91.5.1783688491335; 
 Fri, 10 Jul 2026 06:01:31 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-313b4cbafa1sm9611839eec.6.2026.07.10.06.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:01:30 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH 08/10] docs/system/riscv: document initial virt RPMI support
Date: Fri, 10 Jul 2026 18:30:42 +0530
Message-ID: <10f13dfad6528556a3bb4aa077aca8c38e34bc24.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50ed2d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=RyhCfiGMEKD-kOZgqhYA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 07YhKYMX8e-tw5mHS8ejXKqlwOi5-pb8
X-Proofpoint-GUID: 07YhKYMX8e-tw5mHS8ejXKqlwOi5-pb8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX/shR+nc4CaaU
 j89SK3qrLFE7OXC7te81qORk/FIZ1qU8sg3oBVUAQaz6zJ+cWsISytAMmQSmOEJZXzQ7+q7o6C3
 sMop5VXMqEM2rISXC9EgWaqXF4+tHLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX/BNVa6nEkQae
 ZaT299N6su8+DPt3IY2HrIt4YeGOyu90XqbCdAQ6fk5biCmAqKnDoTFvE9r9/HWyZppn9IQfJmP
 T/I45eX+9QtopRAL4NDNDdzUHXzfSMX3/J0wU+UewbpuCxk8tFcOjunXSBEQHDB05vVvHDHDNzn
 xX6HRClyM55U0HkeQxNy2nPMb+NER6M2GVwB3ZgM+l2RsW56g0oAhnAeKfXI9HuYFeA44yUtIpl
 6JtScHh3ApkRM/lWfhqp1fWdkkmx+3afsLtLmoDVTXaAxPBAO9L0Iq9wO3SmpLVrPFAzjxwuFGn
 5Uvor9EAxofvhWpJiPJUJPN97Y8rtnuycv5eDEJd4gTQrztneAcARCNEuIvxCR2fBHKhv51hJXj
 ZxTomfCF+nEw86bbjD2lKvh2W9ucd8SVUxowMA9YXS6eWWKRv9zOFaN8sxiuEENY0/GeMAtGORi
 dLA+TmvGd5WKtYvWg5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100129
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
Message-ID: <20260710130042.KwT4tXe_xmEW7SdGbYa5P1LSbBGn2U0KtUnSpFz-4pU@z>

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



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2181C982D2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:45:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7GA3-0002iW-8c; Thu, 17 Sep 2026 13:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x7G9x-0002aS-4v
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 13:44:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x7G9v-0001db-6p
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 13:44:32 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68HH5dpt2170828
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=5eqYTfBKOir
 TS9eXS4TiUYrdpCM/GvUswkHwyrvqV4k=; b=B9KJMARl6igARaBlYVLdMoXhr6W
 2mNKzYmiH4GAuOc+yDx2usJh2EhTb2+yn7LxBOkWRzPpekSWhE8gWNqUHZMVAjk/
 zULZOcXZpASL14jdDocVdsuTUn9Q25BzEGx6MWr6CfJ21qCWUMLd3lR4TYm/qg90
 9HYttGlghRnSXiUx88DYJSGbG6XIATO7zU0leXVNBRd6K1nVe9Ry2vu+knIibJ5A
 JiRPUSw2lP49vlp/6+1sEGzknMATJmoEtQ0WvT7tsI8/1K745dmanqyBSTf+Atnt
 2R18tYgnKn8ainZAuq6CQtixBBRXbHkJBjPUid8w4UtmFWdCmM6a0HjwShw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grk97rj9e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:44:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9106fce784dso20340206d6.2
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789667066; x=1790271866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5eqYTfBKOirTS9eXS4TiUYrdpCM/GvUswkHwyrvqV4k=;
 b=b9hzT0GMvtjL1PQSD8uWRCTdf90l94GvjUptL4SzQtL990uUuo4vwzH4dq1G2+8y9X
 iY76CSAFJST+oy9Oo0cWg4F1RlonDGDpC8eMFpCw5PU7f6tiosJKUOzWztFzxDmhLDzR
 Js1jf9LtOwFhXQoSiH4CxKruy3Gxe9bifr+PGNbJZQCloBe48dyGsyQUu/KoLYEYgevS
 1wR2hy6kBQvqI02HVIvWly2KpL7H/i+vCgJxPATIqoTa//nD4lDi31sODmzE3CPQi+ma
 qW8LHRFaleaFP7it+UepX56IYBH+Kah7Os2YNMpopN3dbO5yWjgHIyvs5EXLzRjntmpH
 YHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789667066; x=1790271866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5eqYTfBKOirTS9eXS4TiUYrdpCM/GvUswkHwyrvqV4k=;
 b=DdRWcWOF1w7y/xh4v/vLfEcFzyTSZnOl9BnEw47Elwh4PMxUYKoEYhpDuAMFdrQFvq
 w5LaPCs0wbSe+ZKxsyoE/bId3HPaDj9l//XBSO/PE+eCQ3hgqwDHAoUoa7nA99rsJX/0
 GATA50A7kqWwsBbuivvnTKUcUde1euCUbcm0sDNvZuouVkWy1NYOoRlQ1/UKTwKpt/co
 BS2ufPT4iDQF1gb0M4ESJ6VITCRCaLKSDlnFHJagikyv2uOj0Mf8+97MGvINIrxokcGS
 0EKw7wvzgvMsUgtwevbHqcGthtxFW7K+hJUIXDrs8YgWub4cRb/04ESRglvRQ9vI6als
 664g==
X-Gm-Message-State: AFuF++kaS8y3ndrv5UPq1GR97Ajhc4vfWH2hhsX7jvPCKOId0IpEnHqd
 BTLwkzVtXhyXI1T3yi3LnmEUjJDvb25e2bmCt4enQJQY57WmZipETauUnNLNSwU5szvrMVkNY34
 4HCi8keNEH4mzV2k0XC5F03KgQ3dP/DwWsOAzkzRnnXQz2xe3WtbodQ2K5A==
X-Gm-Gg: AYBFou39KwOguR+DIMuVYXEPB+9lwT39Ye8gWuWWdrKzaGWt7TG/zIpy1VuKX6elh0/
 meKrGoQk2o9AvWmS9biKi4qhtrmDxKX7c0ef/x7S8x3tTo/9pwU4QdnSYw20JafAVAyFqCkbwod
 uyCSyA2YE3y4iL4gyWLLAkXFywruMokzgVTBOB0UyWjLDXqxWyeKgO+k/FX3ad+v4eBq/d3dKYE
 UxEdurRT2XFyyKenO+XmYEVmu6za1Du+JFh5HzdMZsT2vty8wf49ZotoP7/E67CY76dtqtvuV5w
 b0/bWVZTt3HS34i4iAZSrxL9Nx1DDWp8G41dXmsmYkC6Hc+DjPCiyNiXEFcWJhNi7a0YNMS25lF
 Vv+WQbyiN5moe3BEr7fdzQKkf59YRiyfnOtmGBDE=
X-Received: by 2002:a05:6214:1249:b0:912:517b:847 with SMTP id
 6a1803df08f44-912517b0b18mr27603286d6.43.1789667066030; 
 Thu, 17 Sep 2026 10:44:26 -0700 (PDT)
X-Received: by 2002:a05:6214:1249:b0:912:517b:847 with SMTP id
 6a1803df08f44-912517b0b18mr27602696d6.43.1789667065497; 
 Thu, 17 Sep 2026 10:44:25 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.170])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91252c56d73sm3118136d6.13.2026.09.17.10.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 10:44:24 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v12 5/5] docs: add riscv-server-ref.rst
Date: Thu, 17 Sep 2026 14:44:04 -0300
Message-ID: <20260917174405.3471736-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917174405.3471736-1-daniel.barboza@oss.qualcomm.com>
References: <20260917174405.3471736-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LOzz05W9 c=1 sm=1 tr=0 ts=6aac26fd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=arNgJ3JLhM/z8Vk/iMOFgQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=NLiCwHATAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8
 a=vlmih187C6Ts2ntwv5oA:9 a=iYH6xdkBrDN1Jqds4HTS:22 a=F9tHCgz3TLBaZgltkx5D:22
 a=xVlTc564ipvMDusKsbsT:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI1MyBTYWx0ZWRfX8wIYN+LOGBMT
 zmZEs7vPgrF8qG6DS4UGI0vXf6xb3JI+3oDRyO9yRqcwXpoIISABHMMUrhjKM7PsOUBphXC4ZCR
 6/FxAKllIGcPIuKGFK7P+SNMjM4lTc63oC3BkpneEmjiNLDq/9KOoCBbO8onHjNs3lOD2tZo/zH
 0yekA5lDod/pA+c38O4KtIISuKax5+jNUeDKJal+z8HYyl/NPAInsQ8NFwZTMXabrNCFljwH4qk
 MnN4C4KPdxFktcFhQADotp+h4wiKNr+cpbATiLLMRnLJjz/3Ne/FKeHICpzVaSu2vsNBkQqqPnb
 GpE9JhRQlhUwJdycTcnwc4wSZMTUJd4u+k7snKrkxe5YADcLtzWmO+PDWq5CeaQYJjPmioc1hJC
 92arHAhc0Zf2e9vM/w39h44uk1ls2UOzK2rBSXPYUugR14SpR6CXyT2MgcQdFrgxbt/Jqbsoy94
 PqzF7vx0sfF1DdNCLKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI1MyBTYWx0ZWRfXzj2v+aFrMJHf
 T7Dg4mHtivNw4RDlhLejNUD/yavAixkFqLRwWnVphrSrEcxWE4Y7KhP9trGmucuzi22MFyVnjR9
 6Bk7xEvIpF9nGAmMTV2PSkdpuTYs+4A=
X-Proofpoint-ORIG-GUID: ZXil3dSFkUMsXtfBtr9PzQV2J6QQshIV
X-Proofpoint-GUID: ZXil3dSFkUMsXtfBtr9PzQV2J6QQshIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170253
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Add documentation for the new riscv-server-ref board.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 docs/system/riscv/riscv-server-ref.rst | 64 ++++++++++++++++++++++++++
 docs/system/target-riscv.rst           |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst

diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/riscv-server-ref.rst
new file mode 100644
index 0000000000..5b23122f19
--- /dev/null
+++ b/docs/system/riscv/riscv-server-ref.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+RISC-V Server Platform Reference board (``riscv-server-ref``)
+=============================================================
+
+The RISC-V Server Platform specification `spec`_ defines a standardized
+set of hardware and software capabilities that portable system software,
+such as OS and hypervisors, can rely on being present in a RISC-V server
+platform.  This machine aims to emulate this specification, providing
+an environment for firmware/OS development and testing.
+
+`spec`_ is version 1.0 at the introduction of this board.  For each new
+supported spec version a new versioned board will be added, keeping
+"riscv-server-ref" as an alias for the newest version supported.  E.g.
+for spec version 2.0:
+
+* riscv-server-ref-1.0 - board that complies with spec version 1.0
+* riscv-server-ref-2.0 - board that complies with spec version 2.0
+* riscv-server-ref - alias for riscv-server-ref-2.0
+
+The main features included in the riscv-server-ref board are:
+
+* IOMMU platform device (riscv-iommu-sys)
+* AIA
+* No AHCI (can be added via command line)
+* No NIC (can be added via command line)
+* No virtio mmio bus
+* No fw_cfg device
+* No ACPI table
+* Minimal device tree nodes
+
+There are multiple ways of using this reference board.  The spec compliant way
+is using an EDK2 image and a TPM device.  The board was tested with the TPM
+device ``tpm-tis`` that uses the external ``swtpm`` emulator.  More info on how
+to use this device can be found in `tpm`_.
+
+To use this board coupled with the tpm-tis device, first start the ``swtpm``
+process in a shell (the ``log`` parameter is optional):
+
+.. code-block:: bash
+
+    $ mkdir /tmp/mytpm1
+    $ swtpm socket --tpmstate dir=/tmp/mytpm1 \
+            --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
+            --tpm2 \
+            --log level=20
+
+And then start QEMU with:
+
+.. code-block:: bash
+
+ qemu-system-riscv64 -M riscv-server-ref \
+     -bios fw_dynamic.bin \
+     -kernel EDK2.fd \
+     -drive file=nvme_disk.ext2,format=raw,id=hd0,if=none \
+     -device nvme,drive=hd0,serial=ddaaddaa \
+     -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
+     -tpmdev emulator,id=tpm0,chardev=chrtpm \
+     -device tpm-tis-device,tpmdev=tpm0 \
+     -nographic
+
+
+.. _spec: https://github.com/riscv-non-isa/riscv-server-platform
+.. _tpm: https://qemu-project.gitlab.io/qemu/specs/tpm.html
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 2639866a3e..74e23fa64c 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -70,6 +70,7 @@ undocumented; you can get a complete list by running
    riscv/microblaze-v-generic
    riscv/microchip-icicle-kit
    riscv/mips
+   riscv/riscv-server-ref
    riscv/shakti-c
    riscv/sifive_u
    riscv/tt_atlantis
-- 
2.43.0



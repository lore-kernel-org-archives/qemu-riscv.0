Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D34C79FB7
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 21:09:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4PX4-000138-B5; Wed, 09 Sep 2026 17:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4PWq-0000z5-40
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 17:08:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4PWn-0000Y0-VE
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 17:08:23 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689JHx0v2896050
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 21:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=SWCz14HQJsI
 qff4DEAUggFZfm8sDK/aoUCeI73tDq1k=; b=nHCU8l4U/TBmDXosKW9gvduqbev
 6iyyJDxmQO4V4baKHehllebHPIAoI7SScVnV5QLivOsPR36uarmlK5D2x1HTDtEx
 uQkAHzjzPvRUQlnljsqoQZR/H8RpWU6KCcNl0+d8Ur3yn1vtsFU8nFij1RiaqjIm
 HObqTgiiIeH0Nb4sbpwShOcwVkNCBO0Ykjc4Es0guJ40E+f5Wm4W7yLSRRxgMXtm
 JN/Dn77rlcm+ickj3TB7mZf2UA+rmMqvSRbry23eWmExC/+H99KetNow2t48OC+e
 cLJA7caIWUVNkRU+kzw/lUMCZ9mV8g14w4WIT02dsvx1LySblJtyMahEgPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygrjvq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 21:08:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5308a3825deso61730611cf.2
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788988099; x=1789592899; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SWCz14HQJsIqff4DEAUggFZfm8sDK/aoUCeI73tDq1k=;
 b=UqA9YQsYlyU20H6JehZyHBNiVUs3xgDD63vbWyCEiyFr01kLwEUdQXTdA9BPn3cFxn
 sf7Yh/2A0Cx5Kh+xrzs5qardZzEm3blPkgb2QFIKTV8bdnymJg3N7nxFmvcD+2XECW9Y
 xk27s2aq42vPKydNX3tDk4JNmifYPoKzJqVZwTY/HZfWVHueSPhmhzVWyVmKj7PUIK4Y
 TIE+v9Hnjt5vGxugeyjxdsMjVduSA10qjrYiim0d49VwLtqySxewx0DHTVGX/m7MEuIw
 IH53z5PitRGwIMOUP/EW8oGDPXX3h962hc/VdVlcRJWSoCgMZ31c5cLiIGurVIeenhpZ
 ydVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788988099; x=1789592899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SWCz14HQJsIqff4DEAUggFZfm8sDK/aoUCeI73tDq1k=;
 b=Twgwg63Z98CLYkXZJ8Gmb7g4l7M/c/egL0KQwCQs0CY6LNYUD06ZZtR31WbSLuWv7H
 kOgVpyGDOioq862eHvC3YGcOOcU7+5gekKNhA8TP1ZEyXYs8v/PSNnd42lbatxyO6RMH
 DFV0WISDGlvHE7z/cTaXXfoNE5vTCdLoyZfcPjmOSLpcTXlrchmng0m4/b5splTjXt2o
 UA4prO6FWcAiXratHHCCPPDjhq1OU1B9FMJZ0Dds++0a6Yu+VIxM3hgR4m2CE4Ob4q+M
 64XiVMZd4QXJPdBTMWIrDsZjp5uJfYS8/+EZO7lcpf6FLti4I28LFN/c4JnalNg7JLHE
 kEjA==
X-Gm-Message-State: AFuF++kDuqmqXaAMy8oH8WNSxiJIQHmihrwyLp6uzhWl0C+gGI22asTW
 sVb10OVgocwKnQhRSyntAuovbfm2D3SrTMVexeaJz9jwcpH+XaAUMaZpK4CKReuBToL+G6U9yQ+
 Mqlh/1MSQNqn1PxIhvHilte6ObU4xfVtA9Vp6HnPFjp/OoSpKJXpoLVFD2A==
X-Gm-Gg: AYBFou1znAA1Tyrkz3Gyw/yycApoSKulJgKcFcgfmvwoU8EaIxA7yFC03X/B3IpKFvd
 f5+gRxDSvZufMXL13DeuPfmQlEZZgZ6Xx7lENZNJ4xW9ntOXP4NXiSFETHzUjfKH9I1fmh5VyBU
 eg/zkJiUHzt+A/gpsk9Ap0exGOCQwIUZSGZBvkv8t0QwPMdiOfCmkm3RHOAyoW+frUySDjjvAso
 bTPNpx8137n45ar4GHUpfNWbl1dyMnWurY3+QVVL8bim9Io6JSByRmbw4gg82fn82t2MGafgDv0
 wo1TMkCMlog4rkM0EsVZIW5ddKIlcHIlm6H+1+/AXuI71ABJ8gT6TgBG0W1rB4ZyfDLPHdUJ/Rd
 +vY5nsWyKG1VvbAyuUeKdyue9xT5WSS8GBpP7
X-Received: by 2002:a05:622a:110c:b0:52d:28f8:578c with SMTP id
 d75a77b69052e-530a2d12553mr122186021cf.31.1788988099488; 
 Wed, 09 Sep 2026 14:08:19 -0700 (PDT)
X-Received: by 2002:a05:622a:110c:b0:52d:28f8:578c with SMTP id
 d75a77b69052e-530a2d12553mr122185371cf.31.1788988098987; 
 Wed, 09 Sep 2026 14:08:18 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91040646d59sm151811336d6.8.2026.09.09.14.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 14:08:17 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v11 5/5] docs: add riscv-server-ref.rst
Date: Wed,  9 Sep 2026 18:07:55 -0300
Message-ID: <20260909210756.1767711-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
References: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfX+eNZifDkqXts
 PIhxHUohpAQs9mFbIdD8q63fMYIHXazjrbAbJbsddamb48dhKoqn4Vpy3h33W5oSkHFHBVwIz0C
 JTLr7ru0xdBMgJdb74ekWpfYH5DBaAHrhxyr6JO6nQipxOwtyaAjHHs3ety75pELPmm70dq8K9H
 Mh5V2gGQiSYNzRnr1eJNzediCCWkaX9AqQFD587ms+Iz3CvfiyxpC5d4IlVKrU+SCUiRkaYkVcO
 eFaS4Arg9xw7FfcoucRAqU/9qcxFHYavUxf6WBW6Cqn3w4ilJ9Wra7INBlojWAy3NMN0aVxByp8
 gTqELYbQzP2UXAFg54lwoe1k+Jfp+rI7UQ6xGCfyjkc7zegD3KMWwrDq/bMxrOkTRCZixyDmbC4
 R61c08uUFgRMN5X9F7lKXf8qRD+Gflc45VCm78SJP0TYuj4+0ymi/x0J2mF2cKP30MU/8Ce7o7a
 J/Udq5HDc8hKee1TiBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfX7kByoFLXur3b
 wYUfvE394SdxLuCPtg7tWgkpmC0p3HAHV93wT/sXXlHiL0pMkcIcwf/j/ayeqr+wDmDu4FEcVPE
 lfyiJMt6hBI/tEOveDf30ZlkGqxaerY=
X-Proofpoint-ORIG-GUID: b5VJP2P3HhMAt0Mhyf3KMii_wDsPWtuz
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa1cac4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=NLiCwHATAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8
 a=vlmih187C6Ts2ntwv5oA:9 a=dawVfQjAaf238kedN5IG:22 a=F9tHCgz3TLBaZgltkx5D:22
 a=xVlTc564ipvMDusKsbsT:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: b5VJP2P3HhMAt0Mhyf3KMii_wDsPWtuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090236
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Add documentation for the new riscv-server-ref board.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 docs/system/riscv/riscv-server-ref.rst | 65 ++++++++++++++++++++++++++
 docs/system/target-riscv.rst           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 docs/system/riscv/riscv-server-ref.rst

diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/riscv-server-ref.rst
new file mode 100644
index 0000000000..5e9d237b14
--- /dev/null
+++ b/docs/system/riscv/riscv-server-ref.rst
@@ -0,0 +1,65 @@
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
+* PCIe AHCI
+* PCIe NIC
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
+     -device ahci,id=ahci \
+     -device ide-hd,drive=hd0,bus=ahci.0 \
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



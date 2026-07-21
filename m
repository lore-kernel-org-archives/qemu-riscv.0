Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754D9C44529
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 06:36:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wm461-00023R-SV; Tue, 21 Jul 2026 02:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wm460-00022E-1n
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:36:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wm45x-0004QZ-Mt
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:36:51 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66L6Iftx934742
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 06:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=SNHFs5pTY/utScJpIuIEs6
 7PZOSSFjUFqAkmgcHcHss=; b=Fr6vClE/Tcc7c0QWbK/shOaos2dsXfHgRNUzxe
 AzKh23bbpON89oZJpUuvXBu/HNGlrxrveyEQ4Dme1bjkrcynIarBkboxpIHJbx1l
 jHmPTlJpUvOl03oTdepBVD5UaOoDOx09eDktZoUMwn0BmkkwlrsrAIyXFpN7Yt9B
 B4OIfUUfo5kB7ymTcZYahIJSu1fw4r1QIlzWDanTIzIfp3tbQgdshMylqCyDMwAv
 G+CJUgf1J7GVuZ7UyxzuVwBUboHX6X4nmZ3jMmzRiFEPVVWCdD3KCQTbyyncxjYg
 3Tx9OHIICq/qPF2nj8sbqFDmspuRLIchHfnhaHU9J2BzapbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5tqun-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 06:36:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cc98d6a88bso36794385ad.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784615807; x=1785220607; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SNHFs5pTY/utScJpIuIEs67PZOSSFjUFqAkmgcHcHss=;
 b=Tyc19HwqrCuLn9hIMpj/JbNpXW4ChqQqybDHj6lRp2NaWqxk0TKfT8ZTT4Wp7L5G12
 zJoILHLd81tIhgyOXX/VpgB11K3/t21XBZRso5xmKr00OlFOwVfxq/auGmqHJZYv55WY
 fdLhIRh5ORdLq2YIdKkzWeLt1qYso9yE3Xj87fMC7M9XkNwc4segK/VCkCxUCX++SMVP
 t5R3wkFDVmB0o6SPVAsP0hX6fRGRlPR0JksuYBE9a2G5IOZGXz3Tkks/9KBAcxCMGP6z
 kZFZZ23eZtSU8bgOXXa8ZUVCVbCyNgw09kLDgEUwPuV0D6iXEBxetGmHq1mS8Nv/25U+
 XGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784615807; x=1785220607;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SNHFs5pTY/utScJpIuIEs67PZOSSFjUFqAkmgcHcHss=;
 b=C54DbYJrns38AvUYQbstrXvgOfHu9IljJcgbj4EFXzHxqqlDWrEBHRxMoj9gXfVR1s
 lB7Rhs24LnF31T+bj+pmIdWQSo8EcHxJVELtZ1wWapOTqmecqoohnEwhqAzw4rmJgxwA
 lyF6VJJFMNXGcjNWQwrzNHS8XN3BHjP4x8uk0iaYIfASrqULII088s+tduL6pdGAp5xe
 hal9VB3CtMPtfjUOIRSfD6HLJ96d8BTqChS21ZmPOls1RJW4gUJ+fa7PtnGU8/uRKq2F
 cdNmcqziou3XeLq2LrxWUdg6iLDFlincZ2VvbLWTWTwMgEM/3jTvy6/D+gpdXt/t2kbw
 txqA==
X-Gm-Message-State: AOJu0Yyy6HFS8UKwHOvPW2qL+eIU1ZQa8VGra/eJkrIQ/g4UlRzooKV+
 36y3AfXAP86B5ibBUjf3Zj0und/AugRYVlBaIa6BXgLIN5zlt9iGO3tX7kpIQY7ULv2e4RoGpVd
 /vUXAv6mQRRDlc28biBFyJ65gQYX2JGiFq7hNpncQuIKTya6B/o1M2XmitG8fY6znxw==
X-Gm-Gg: AfdE7cmyFNtIqSVm9Bn4wzaOQ+19w4MsKS/i5vZeeNzI1qPqlnDAB4Tz4YIcAJt27u3
 Bv5s5GW1YDHJsppnzKbdfqEL6WWertT7um+FqashTTRNrh/JLcAnq3XhLU/VHq9ZHTDH0vPUfRq
 kq3bhuGPEmQUgsYwkGyA+kupxqahqnB5VQ5HhUggJh1ftZjBUycw96feZqoPMBvlMcSG4x5aAk8
 qQWmrnmDAVl0l7QZtHHlqCIo15y1qp8lrNZUET6ETBm0QiBdRFs07TAQTmKm5Tx3do6PPhl/iwJ
 PtDEoBxGJdv/N+NHWvOqkf10vH1FioeSkKFnpzVDAAAXLESb64osvgHzvDqConWnog1NLTAh91e
 GgYU9mL8sUhJLt95i7OqkCUs0bUSp8anZWF7GejElujb3YAEHsR8IPz2LA2CrYf81Wd7ulNcFYN
 H5mKIDCElqVVAjH/Dh4BZ4rJeiJsCtzEM=
X-Received: by 2002:a05:6300:6713:b0:3bf:a638:4384 with SMTP id
 adf61e73a8af0-3c40f91c82emr1689667637.2.1784615806788; 
 Mon, 20 Jul 2026 23:36:46 -0700 (PDT)
X-Received: by 2002:a05:6300:6713:b0:3bf:a638:4384 with SMTP id
 adf61e73a8af0-3c40f91c82emr1689653637.2.1784615806358; 
 Mon, 20 Jul 2026 23:36:46 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a1bb8a4sm47161380eec.14.2026.07.20.23.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 23:36:46 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v5 00/10] riscv: add initial RPMI virt support
Date: Tue, 21 Jul 2026 12:06:26 +0530
Message-ID: <cover.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6975Pwn2ZtSbXafMD0OuuThbpqe8Kvh_
X-Proofpoint-ORIG-GUID: 6975Pwn2ZtSbXafMD0OuuThbpqe8Kvh_
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5f137f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=f7Jd4U-9Vqhou6__D7kA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NyBTYWx0ZWRfX5NT/nR5cBcbQ
 2dSIs+RJ109MFNsxSTB3+l3PRzowsAJNXOdDpB3jBtaN0aj2fojYb8poYFFWD9IUI5XJFInJR5s
 YXy3mj/rKhTA5O7R4TIlrRX5bqpEGsw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NyBTYWx0ZWRfXwK4bBP9/bdFo
 zgh6NshCOq+19a51PV9g90xw/SW67IMxaWqMYR7sQ+qqM+XWUwDIdGws5IkARhD0IexyY+ZziaG
 cSlQvOYb9kInBeEp86JwPVxW/Wo3K8B9wVcNLOfsjkCuyGnSstJa+NSBPucdYPZG+0Wi35xg3YL
 SZ7jJijFcSjzxOQXegNUq/CLIt3qE7RaWnYkxPC152Y0Rzns2j8L9irLgRCX69dX0nhSIc48IbH
 RHaFsh8panoSUedQ/i64AO5o1s+UPwP8uAWi4pCzDkK1j0cO0F3Z3AFRpBY9Icw6/pdYHekJpBS
 wPYYyIPpcXZU/kbYFgUJoELU6lEOiUFO2VEqNa4USulPuO8005D7/07tDIfDa20vTFsnmPf9zfr
 YtwLnT2Kh1ul5QvLwppW6zb3FVc2mJAamIvaXnBTUBsl0IHZtq2XeWJ9agze4UXAlffWRPDuXGS
 xFa4pLvkEOqYAWsalpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210067
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add optional librpmi support and the initial RISC-V virt RPMI
implementation. This series introduces the shared-memory transport, FDT
helpers, opt-in virt wiring, and the Base, System Reset, HSM, and System
Suspend service groups with qtest and functional coverage.

The implementation targets the RISC-V Platform Management Interface
(RPMI) Specification v1.0 Ratified and uses librpmi as the backend.

Changes since v4:
- Drop the unused machine-opaque argument from the RPMI machine callback
  API.
- Move the no-librpmi riscv_rpmi_create() fallback out of the public
  header into a dedicated hw/misc/riscv_rpmi-stub.c file.
- Add a matching RPMI FDT helper stub file for no-librpmi builds, while
  keeping the real rpmi-fdt.c source gated on CONFIG_RISCV_RPMI.
- Revalidate librpmi and no-librpmi builds, qtest, and the real OpenSBI
  RPMI guest flow.

Subrahmanya Lingappa (10):
  build: add optional librpmi dependency
  hw/misc: add RISC-V RPMI transport and Base support
  hw/riscv: add RPMI FDT helpers
  hw/riscv/virt: add opt-in RPMI base support
  riscv: add RPMI system reset service
  riscv: add RPMI HSM service
  riscv: add RPMI system suspend service
  docs/system/riscv: document initial virt RPMI support
  tests/qtest: cover initial RISC-V RPMI services
  tests/functional: add initial RPMI virt guest smoke

 Kconfig.host                               |   3 +
 MAINTAINERS                                |   3 +
 docs/system/riscv/virt.rst                 |  65 ++
 hw/misc/Kconfig                            |   4 +
 hw/misc/meson.build                        |   6 +
 hw/misc/riscv_rpmi-stub.c                  |  16 +
 hw/misc/riscv_rpmi.c                       | 558 +++++++++++++++++
 hw/misc/riscv_rpmi_hsm.c                   | 287 +++++++++
 hw/misc/riscv_rpmi_internal.h              |  42 ++
 hw/misc/riscv_rpmi_sysreset.c              | 206 +++++++
 hw/misc/riscv_rpmi_syssusp.c               | 191 ++++++
 hw/riscv/Kconfig                           |   1 +
 hw/riscv/meson.build                       |   3 +
 hw/riscv/rpmi-fdt-stub.c                   |  63 ++
 hw/riscv/rpmi-fdt.c                        | 103 ++++
 hw/riscv/virt.c                            | 166 +++++
 include/hw/misc/riscv_rpmi.h               | 114 ++++
 include/hw/riscv/rpmi-fdt.h                |  41 ++
 include/hw/riscv/virt.h                    |   3 +
 meson.build                                |  14 +
 meson_options.txt                          |   2 +
 scripts/meson-buildoptions.sh              |   3 +
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 171 ++++++
 tests/qtest/meson.build                    |   2 +
 tests/qtest/riscv-rpmi-test.c              | 684 +++++++++++++++++++++
 26 files changed, 2753 insertions(+)
 create mode 100644 hw/misc/riscv_rpmi-stub.c
 create mode 100644 hw/misc/riscv_rpmi.c
 create mode 100644 hw/misc/riscv_rpmi_hsm.c
 create mode 100644 hw/misc/riscv_rpmi_internal.h
 create mode 100644 hw/misc/riscv_rpmi_sysreset.c
 create mode 100644 hw/misc/riscv_rpmi_syssusp.c
 create mode 100644 hw/riscv/rpmi-fdt-stub.c
 create mode 100644 hw/riscv/rpmi-fdt.c
 create mode 100644 include/hw/misc/riscv_rpmi.h
 create mode 100644 include/hw/riscv/rpmi-fdt.h
 create mode 100644 tests/functional/riscv64/test_rpmi_virt.py
 create mode 100644 tests/qtest/riscv-rpmi-test.c


base-commit: 9eb08992b1df4a3dfcf442b1239678095e50471b
-- 
2.43.0


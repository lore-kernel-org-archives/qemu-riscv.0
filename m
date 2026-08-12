Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78972C5B56A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 07:02:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wu2z2-0007xl-UK; Wed, 12 Aug 2026 03:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wu2ym-0007ug-4Z
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 03:02:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wu2yW-0000wv-5F
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 03:02:10 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67C62Ali4090977
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 07:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=v5hHJqctDwnFMQXMBJrY7C
 kjFV55sJsjVlfjdnMZbh8=; b=Gi/oF4boEChoYCxfxYna+P0/GfvaV21FYcQmbA
 HPcDN3M/fzwy8s3eUCSfi3vwRsguZCtnw3nvkcG7PT5ACqWr2evBdBqlfHxC46rZ
 KfNXI9MHqekPOmO0g92QpPCfBm0Qn2ZmryARJ1Q0dxzPAnSWXtqNKL81zO44+qBx
 0ibKJ8mbJWkHxi1U7Oq3MufMaTBXjIOuSMJktA+UikRMvK/h1tZAgQeAkBYwSIl1
 po80mz2bIPGGad5BueJS7EcM2YOYtW6O5u8beivCSeReDTD4XKpjMejKv9asISl5
 2KvOnkjuOsdQ892nW0zN3RzC3Ol+w0d2P98Ay5obTpsT8kuA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049buy6b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 07:02:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c888c687c21so19571a12.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786518124; x=1787122924; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=v5hHJqctDwnFMQXMBJrY7CkjFV55sJsjVlfjdnMZbh8=;
 b=gtDZ12Xp0WG/cXJzUZXsNUvjYk6TZiOiRA0J8sUR9Gndnkmhup0wfZ8p0bMIJEe5PK
 3+2lIRW/6RRNIxP+pIg8FCtLJrUc1au+SW6IG5YLzEwkTkZ3aPDJ2q++2aOUAh2/W+xt
 rTS7Jabnh2N0IHxQv6K1lnN6/UYSXbFu4AkwG7Nz5QWgrhp0b2uRU0SzQk6liQUtHXmz
 an15Jsvz5n8nBy+PsV7I6JTjsrm7PEVAuHIY2WItp8F5Gz46yLLsw+LlH3cKK4ygSLqp
 AfdI3hX5wyNCh4KT4FibYysK9C5ltI/R7PDPKJX7XGdlJUsZJBlko8JHNfz6SYX+CogD
 Po6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786518124; x=1787122924;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=v5hHJqctDwnFMQXMBJrY7CkjFV55sJsjVlfjdnMZbh8=;
 b=pLSZ8mkh7uiyTwwaqNmogUwnWqzx61Vb3SaaWrTJB3GAHubu934rzGuWFkFIGSv7ji
 o+kIWuytLjiQPPkih+svR45dgAVlN6mRLNJDZOhMoRnEtwf1cYHSQqZ5a8XksJxGdGhA
 /XXP2JC75pOYCOXMKawDa2cpcWPLougicuGEkjmCQH+nrq1MTChDVBnMUjU668/eL4Vl
 jC5Ho9YGDiu63lIcXKGiYDsSrVdtS24TnGZqI33JgUkaPhw9BDwakuhvFrQ1FcRoQxgG
 ZQs3f8gAbMXsD01h0bG9jJx51AQk7KrwyUt+td1abpjiroU1ErWNlHIDUH4uxj1ABNtW
 Kllw==
X-Gm-Message-State: AOJu0Yxw3DEXPzpkSj6ckhKGE2239pr4W3XDjAdgcwcBG6pyOyLGYuMO
 f5HV9t/Ednis6y9RqDt2Hth8SIX1BUuwp+OEn/I1+ZySXKLamL9GSuMEaeIULoJyDWlL/cvGJbx
 pnOZoU8R8dCE3s5dDOSbchvtlfCasEI7TK6oMK2QmnLZE6Jx5w3M78+OMIkkireO7Lw==
X-Gm-Gg: AR+sD10ClIrNu1FbG3kVVNFTMlCz22P9o0dtVx+RNpGZZAnyOrfe3cfYpYzY3ewQQ4k
 cMOi2ns3Q2LSPkCRkkNstaWuyqN1iyZJT6qBqsPpmhKiZpwRT5c0P5Fuh8HEW+g7mk+RxpmQfRM
 JXzJ9110k1Xp6sDpg8cvkFxwnM14PIA9+WGJwJ1f9rB+TTdas129KyilJpGLelPie15ziKu9JpG
 95zNViGUE4p8vTvvAPFH9hAu4KYjgHl6XG2Yv0SR8q/CD+XSBcHRd93sdGbAkOOXScE4puVSK15
 lPnMYBbUeDRn8bdVX+n/PXF7iBmCnQnCw+g45aK/pzdC0PyoBW3CE6mFHx/USXPS3V8M3SmiDce
 rtHQyJtCqu8YGgPLeriam9S17OBk3qucELMUSkZWCtTiRvat9JUOAqTy7YcYHdKL9l94WkhcYJZ
 cOjcp6jNkSqciSpjMlBc/m5fpcEZcf2fw=
X-Received: by 2002:a17:903:1104:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2d345754553mr23642325ad.3.1786518124101; 
 Wed, 12 Aug 2026 00:02:04 -0700 (PDT)
X-Received: by 2002:a17:903:1104:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2d345754553mr23641905ad.3.1786518123493; 
 Wed, 12 Aug 2026 00:02:03 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31cf3c08163sm6796627eec.7.2026.08.12.00.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 00:02:03 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v6 00/10] riscv: add initial RPMI virt support
Date: Wed, 12 Aug 2026 12:31:22 +0530
Message-ID: <20260812070133.3059679-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E49cbGgNhxoBGuEIvDEG8c0DU8RT3BGw
X-Authority-Analysis: v=2.4 cv=ENg2FVZC c=1 sm=1 tr=0 ts=6a7c1a6c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=9ONo2BjGoRSARuvHahcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: E49cbGgNhxoBGuEIvDEG8c0DU8RT3BGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfXwYSF12o8xobJ
 yRDjEfEQf27O6g7ZMtW4wqVrlVhnevEkbxMWsaqFuoW/FTqx39WZIAD+LRR/E8iyRbRnD1DAj+K
 lRbAC4Us1CyStRk8u/hJuNMa1zWcMNRr7DQ3FnpqRXI36ai2MvlAQGuPPfSg8oEdLsjfZcGU1VG
 SocVSHGhSouaMSZKtb1+UinpGQPZa7vuONpibij5P4Sg72pBtNaDucIZ5RdblxddeT066RKQNCw
 iqk8qQRA/veuqyY/tsGzydSr1IcTf8zVm4HXr/Ty4W505UPJE/AGuWvi5bk+My1+zm1FW7Q8BGh
 BA0PpT5xWUBE5rsuSIPXSCdwY1t7jw054kptsNr6a6NieRrd7jcsADRytx3cXj4j0FwJ7sgKBvG
 qJLr7l7IefkHuFDn17DqHdT/iSg6v0urLFsbQD8d8+gAoBnjac6i/SivFIwTDM9mB1cjkDb/Acz
 /XLCBScrrWSoBWPBMqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfX8wL0OYMqN6EL
 Kk1RMpyIPvcn8FdH0G6ewlsFLg/zE3D353bDxPscM3+5mzEAyHHYoKnMwVHvtVqzkLlOrreCZZ1
 l5gKVo0b6VTbx9hx/3+W2a0avWxWN0A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120054
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

This series adds initial librpmi-backed RPMI support for the RISC-V virt
machine. It covers the optional librpmi build dependency, the RPMI
transport and Base service, virt FDT wiring, opt-in machine support,
System Reset, HSM, System Suspend, documentation, qtests and a Linux
guest smoke test.

Changes since v5:
- Fix the librpmi configure probe to check the system suspend service
  group API used by this initial series instead of the later logging API.
- Keep later SBI MPXY/FDT stubs out of the initial no-librpmi stub file;
  those stubs now live in the later stack layer where the prototypes are
  introduced.
- Revalidated the librpmi build, no-librpmi build, RPMI qtest and RPMI
  guest smoke test.

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
 hw/riscv/rpmi-fdt-stub.c                   |  37 ++
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
 26 files changed, 2727 insertions(+)
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


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F223C4452B
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:03:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wllm3-0002nK-T8; Mon, 20 Jul 2026 07:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllm2-0002mD-3d
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllly-0002pv-Lw
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:01 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAvVu42542247
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=7SbKiWP5cRU157rDA+kC7b
 c/sw0TDWiNeQ2qpt0ksTo=; b=nNT8Yd5li9UemDBInpuJgtkDP6Vo252w+miTeY
 xzqfQTQTNjAJguZ1s19uHrd+yqBycE6sRPilb+opYj2/HfDYjZqOk4ojHX8NXVa5
 yDp+BfrpPuEPKAd/1jTXobP00pv23eyMYQ8bVaIdokrsw3m8PzopcdIaEADWluXm
 cWwt4Ma7U9qQJUrHN6+zn4mvQ43jTsbIYtCX8Zv2QddpP5Bi3u4ZYSrv817YGXyX
 N+PzW7ApHyVi99M8ZeXvr0YqMLga687SmdBevRi3713DlGz3fSISHXmTeTB+Y0ZK
 4dEs6eGDMtibQWo36/VquVd5vEY12CfjyCEPAMs5UEero5Lw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcgw0r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:02:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cc7ea29141so46235985ad.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 04:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784545370; x=1785150170; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7SbKiWP5cRU157rDA+kC7bc/sw0TDWiNeQ2qpt0ksTo=;
 b=CqOsRSJ7Uqwu1WqhytXDF6vRpk6Qn2PmmCHnzOBi742bF7LS8yX+axmPbNDnyjzJpp
 bsGnUf1R58Nq/TH8L/LFVHTvvcZlQiRC7HLHF6b5F3PtuuVfC/KdwFgkVTYReZx9JzSx
 F4rhCLBB9t3WjSZqu34eBck0L8okEntM2F/WQyr/GFqygDb+NONReMF6ke8zjH+VpBqM
 jmrV4WEU6uVAFu6g/VE4+m8PPueo2TSbnu++yPbXkIoUmk0cFVcAYELetyilEDHwy/ZZ
 deBarzCKcG37SJ3nU0SFaxuecPE1ilYj4EYARpLOnApu2TPD2Y6Ks9ehJ44YzCX3XDZX
 RdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784545370; x=1785150170;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7SbKiWP5cRU157rDA+kC7bc/sw0TDWiNeQ2qpt0ksTo=;
 b=K+fSVyxFVycJ1SvFz4Q81zYEN6BqYqy9KrzLta0662Q0ZqE+RAQsSHR1ZBHuGIY960
 Bm5b123gBhevrqOcv/XY4axoTOQbfbK+U+86rEDLXbj01f1ov5BHS4y9bF/0ONV9dQyF
 AATYLXYqbEuZ0N8A8rPFypAAkzoBcKi+PNgzHBsdqz9+a2Na7znNqIOtM69SGexaxbEJ
 k5Qxm+0NDF8eSiRLarb9D1V6g4FUJJwSrkBBV1iA7By+dZubHVwoVZOs3vemE8gQE44F
 /2MiD1RwJ/J8VKBKb5NbAezLB7ss2m6mgUhvDgGP1ufPp/D4gvQMM4B3XBH7OpYWZOF9
 XA0g==
X-Gm-Message-State: AOJu0Yz3RR9SHg/UlJu9SvnmWtNT/CNm6BBzvlvBFAC3T3eenznYqAE4
 eWlwL+OPtpHRn1x/MlHxHlONwUux6Ijfv1MrzNEk1DvzAOWBlhPl1PDjm6dKgCKQwncJH4EW7AL
 0nXSdKRF7a3d7vzxYnko/1LqNCGAvzGjH4mpTu7TzxsxpW0lPIU+JwEIncngwjD3SHA==
X-Gm-Gg: AR+sD111TthEn0kV3lJ8hMREz/b7e74fQ/8mUF8KBP7Pd9qbaEmJ2QASBbZ6evQdThl
 3BoRbjoKgf5r3/rrd5oxMX5fw34hkscdWgN7XCCrIRdZR3gFH9OKILPSas4iLXDNASzywRoow14
 g1JvHLmFjBI+ewt0fEksvfvjkSdI7fdKYhbaKwrCsrHl+w+3tpPUxBM7n4GHrdzoNATboPGmI5t
 XqeICkNZK8q+bVKQHot68IsnOKV1JQIpsDMLqI3NM7gHxf6c5Gl2tMGl4v43SR4irW+Oo/Sxddu
 vzIDrlWe6pSylCBcziFO1dEkC2YAJDyiWCswknvJ1y6rzll+p5OxZN6I9Ov5lU6PFtESuQ/3pCk
 zNhctAKBl2opHCk/rE79DTvJnHXRgW7tZrWIc0JOE4XoAIeUU+Yss0T+2Xcjgo9SgWWWERR06Lk
 4sN5oknOGq6kCtwx7u8eMqMQmj5JdCJzc=
X-Received: by 2002:a17:902:e541:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2cf349ba5f2mr107074505ad.3.1784545370213; 
 Mon, 20 Jul 2026 04:02:50 -0700 (PDT)
X-Received: by 2002:a17:902:e541:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2cf349ba5f2mr107074255ad.3.1784545369666; 
 Mon, 20 Jul 2026 04:02:49 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a20b1f3sm34698566eec.26.2026.07.20.04.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 04:02:48 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v4 00/10] riscv: add initial RPMI virt support
Date: Mon, 20 Jul 2026 16:32:23 +0530
Message-ID: <cover.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fx0nM1r_I_cgpompaFfqB3lKdZyc5Ivt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfX5gmjzSCJ/uYX
 F1YoV8E7uFSfhvhy/glvYv1P5GaHmZu3xl3ffChQDKipb/zbl2L3vT+jrB8+i8M42WgfnogbAp1
 Hr3P/PEYxqwFlBokZmp/cwJzceNSi4Tl4qVIxdp8kYSBzhvF1fs1nPJlCRbIs434/mtGeyerwH4
 UBhG4ckA7EW8LV/eIU2FrnEvpTCrYLiLiEtEGovcKifDkldJ6lnvVT6tathQynDvV+S5VYwUbXY
 2AMuF3Ugb4hJfIzb2z2mLjPlacaoaSbzBhEJzpMoXA7jr6FzCcHxIWMCJhsGSXgeXySdopTiBeI
 ho71TQ148Sk7HjBfBPla0sNIxY74lfjX6E7cAat4OL1efekmMtZQO/p01kCShegeKhjBFalvGuK
 SKj5We2OuIeS5SiydAeguLeqIXJrwMMEujUWPQt+Z2X99rtURs8iLI37B/9ZcyJ8O6EHO/JbrPi
 gbGkg4XWJ3Nn8gxmBPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfX0F2ahB1MCOVR
 lCllU751m8PgdMowbRjKbHhMZKvWKD/ezlbaTL+J52/dSnAkiEjokFAiZ/TfTm9kuE1isTs1puh
 UNcBMR+g+pejbYQl3+Xb+6ogD6dawsE=
X-Proofpoint-GUID: Fx0nM1r_I_cgpompaFfqB3lKdZyc5Ivt
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5e005b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=f7Jd4U-9Vqhou6__D7kA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200123
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

Changes since v3:
- Use the Resettable API instead of device_class_set_legacy_reset().
- Gate the RPMI FDT helper source on CONFIG_RISCV_RPMI.
- Use "RPMI support" for librpmi-related Meson option and summary text.
- Mark the no-librpmi inline stub parameters with G_GNUC_UNUSED.
- Drop the stale Ventana copyright line from the functional test.
- Pick up explicit Reviewed-by tags from Daniel Henrique Barboza and
  Philippe Mathieu-Daude.

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
 hw/misc/riscv_rpmi.c                       | 559 +++++++++++++++++
 hw/misc/riscv_rpmi_hsm.c                   | 287 +++++++++
 hw/misc/riscv_rpmi_internal.h              |  42 ++
 hw/misc/riscv_rpmi_sysreset.c              | 206 +++++++
 hw/misc/riscv_rpmi_syssusp.c               | 191 ++++++
 hw/riscv/Kconfig                           |   1 +
 hw/riscv/meson.build                       |   1 +
 hw/riscv/rpmi-fdt.c                        | 103 ++++
 hw/riscv/virt.c                            | 167 +++++
 include/hw/misc/riscv_rpmi.h               | 125 ++++
 include/hw/riscv/rpmi-fdt.h                |  41 ++
 include/hw/riscv/virt.h                    |   3 +
 meson.build                                |  14 +
 meson_options.txt                          |   2 +
 scripts/meson-buildoptions.sh              |   3 +
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 171 ++++++
 tests/qtest/meson.build                    |   2 +
 tests/qtest/riscv-rpmi-test.c              | 684 +++++++++++++++++++++
 24 files changed, 2685 insertions(+)
 create mode 100644 hw/misc/riscv_rpmi.c
 create mode 100644 hw/misc/riscv_rpmi_hsm.c
 create mode 100644 hw/misc/riscv_rpmi_internal.h
 create mode 100644 hw/misc/riscv_rpmi_sysreset.c
 create mode 100644 hw/misc/riscv_rpmi_syssusp.c
 create mode 100644 hw/riscv/rpmi-fdt.c
 create mode 100644 include/hw/misc/riscv_rpmi.h
 create mode 100644 include/hw/riscv/rpmi-fdt.h
 create mode 100644 tests/functional/riscv64/test_rpmi_virt.py
 create mode 100644 tests/qtest/riscv-rpmi-test.c

-- 
2.43.0


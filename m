Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D2DC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 10:36:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wu6Ie-0008Ig-Sn; Wed, 12 Aug 2026 06:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wu6Id-0008G7-16
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 06:35:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wu6Ia-0003L1-RA
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 06:35:06 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67C9ftra3436403
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 10:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ByghFd610DNkMeXBzOqs4T
 qZpw1jlEBOonSgJoZMS/s=; b=hBUoqo9kbOSu0MHjKw66tzJ50/Vkts91fW5kJA
 niaiOPnD0EwI/36Q9AptHc62mCbYrLgk46sCVZ6S4DX0yH9eEi9GAyKAPw7IWwXO
 GX3l9hztH9gdCFn9zrbrLyabJOSDs4Fl7b2712h6us9mozVEkWvmRUwtN5kBKTBD
 iasfeDb6aCrhKcaIQORv2gIp+Qs6M2unS76CbL5ABf7fqW6D3bcDUEugMfr7NJjf
 /mN1yMvyPMnPx4NqI3bh7jLt5phTNbMYuWrLRUd48jpV69OgRts8MyD35uwHCwRs
 xTyU84wPEh7kDM5PYsm4azaVFf+2TqOdXZqPoPWX/YOpqGzQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2sdgt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 10:35:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-38e8d1600b3so235605a91.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786530901; x=1787135701; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ByghFd610DNkMeXBzOqs4TqZpw1jlEBOonSgJoZMS/s=;
 b=QoBAFvFABQGqPETu6MKoBegLZtCBRFqMk96qKwvolVWqseO6X1iGk7dqGdy0LwG4Kc
 iG4+krk/tJl3PGY0As+5fd57ycWRyjGB5uI5SNJuPlWFU1PDNNk/dConTL8XYq+I4JhL
 5XSO1bAJlJBU8R7+/Z8AoWzs8YWC/CCBnGjJFqtbUmHMTw2+pM/Jwn73/JHIlIdAtVFZ
 A21MZllGW2KvGoIcvcUF2rVUI+kW8x/LyIO5XV4uY6G3pBlgmaoQUfHpr6oNQjuvrK2Z
 /XTriJAD/hKamzZ8/u3YP/T8T8zRPBuwixcbH+t+PGVWGjBhh8f7P5I3BMXkp5e2wHvn
 cV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786530901; x=1787135701;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ByghFd610DNkMeXBzOqs4TqZpw1jlEBOonSgJoZMS/s=;
 b=bCQpCE5RjE07kXdujVI6JWvX3pSqMCXBl+s2GbsYYy8lAYGbdDnHqmIA0lCAotoPHG
 6owRZBIySVGbQvDDxT6uT+8rGY5JsS9uprnykBR/sUO3tt7zd2Q2EuJWt8s5rTADJ6tS
 2sF5Yxi66smc0dSwdjG2gasexGp0GGbRzcPjWhzkAWPizSxgdVWxBKLgqLfbrc7Llf+b
 KGB9QKfHlrYUr7WZpAHGKcj8WnGcv1bpLMEedeK/wDa3eQANMDczG9XaDa68xPnKeFQ2
 apTc0QD8MzYsyP8xJEvbJTUpD3YF1lL6Zc6g0Bwlfx4X+w7sZZM7jmi5sSq0hFGeOd33
 G6mg==
X-Gm-Message-State: AOJu0YxBkiRQcXv51sD8yCwnzPWeipH1wwBx10gqZNdaKCVQC2VypqHR
 G241gG8hAf643+Zka1GHY9JljXz85Way1LLIioSA4ASsyyRa5Jogf8nbUagmpZW0ADyPhr76gtV
 6t/ZNHajgHAzLeGrfnaGjHYLzDk7GX2pQXnT4bPmXCw1Dlm/c8oPkFIcn8CaKGaTJ8w==
X-Gm-Gg: AR+sD13UBAGokaf38o4eYykhGCTiycJz5DcUBTxR/oGLoCF7NAZYCkSQUzIp8Eevkxg
 osp7798c4H4jlaw2RWNtemMc/4elFaRRNWW9KxBTzuwqz75NnZLHZp21lPf7YQSKFzOmuC1Y4PF
 G3ExlbMvJ1Xr1XaawqCWWDY8Ic6YqKE84thIIumGj545cqM6fDv6445R18akH/qysTj0pNVRTDD
 Bu46IRdN/lTnLC+aeeW097dLjEFtcUuiueoZzxYn7xI3MM2M5k63bWBlsOab2TUtJsj31bj1tTf
 3CitSrBxUtAQ62karN3FRJXIL38Sl+HE66ofV2eY0uJ5s3RA/yS5ZQcDXL0IePkODJQroZDYTth
 fe1IWGvXAUzsXD9MkVouAWeBk5JctheRimwm9+TjokKiGj01EbdfxrFdjiF89H+p3WsoZTzXk0t
 qvhhgyE4oUY1xPVhcbsDRarnh7jvZWOd0=
X-Received: by 2002:a17:90b:4d87:b0:36d:b30b:14ed with SMTP id
 98e67ed59e1d1-393013da3c4mr2792147a91.2.1786530901174; 
 Wed, 12 Aug 2026 03:35:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4d87:b0:36d:b30b:14ed with SMTP id
 98e67ed59e1d1-393013da3c4mr2792119a91.2.1786530900548; 
 Wed, 12 Aug 2026 03:35:00 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31d6aec3947sm6910326eec.17.2026.08.12.03.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 03:35:00 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v7 00/10] riscv: add initial RPMI virt support
Date: Wed, 12 Aug 2026 16:04:34 +0530
Message-ID: <20260812103445.3451960-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c4c56 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=9ONo2BjGoRSARuvHahcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: R8en1mC5BrS4nw1ezJ6rgZsf4nvevh1m
X-Proofpoint-GUID: R8en1mC5BrS4nw1ezJ6rgZsf4nvevh1m
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX/DJEJ/L75OzC
 Syzz0E5PC88gz8thHW6g8CbyxrPyNriD2h9JJa0doq8ESfgXQJthXjHAy5EP3XE8ZanLpXEpmZ/
 USTJA+nnsySGMSVHCOswqzzoBSekxvE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfXwp2e+yC90rrw
 KfgrLlXA9eIpHT75zAWzVP2RQrqrEE8uyy+Ro/dIUY+jJHpJVTVfbqKdER+pdN9f9r9MjzCTp1y
 ghdk54CG5wkJmIDWrmymxJ4JWti2pe4pkS1O9MiDjrGGGfXsMIjn45WOSjuddAx/KLcaetARKGr
 WVb/Wn0jDNjENfY1fGmdfj8qADJv3Pe5sdCN4vsYdWSzyjLeM7KsRNN8mv+BN9Hx4HWEGZ+s/da
 IYqzgOE2cyd9sBUvpYJOTnl7TA4jNo9yR30IKvawQPP0pVJtHgmkHNl3r6jpuXbqBZdqvBFBBPp
 QMAvGz5xkGvBeJt0lXC04mxjT1iZ2Ab+avuUzaY/BFZ/P2vsddgWbATtaHZ5lUjKiEOAbLIquT2
 Y7cdZO+Jed0KLALDWWCNQlBm47x5zOCB1FinWlXWc2yJ4NddZBRu6qXdutbYJGu+o9cht5f9t2j
 waHdlPO5GNVLy5/tHdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120084
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

This series adds initial librpmi-backed RPMI support for the RISC-V virt
machine. It covers the optional librpmi build dependency, the RPMI
transport and Base service, virt FDT wiring, opt-in machine support,
System Reset, HSM, System Suspend, documentation, qtests and a Linux
guest smoke test.

Changes since v6:
- When RPMI is enabled, advertise reboot and shutdown through the RPMI
  system reset service instead of the syscon reset nodes.
- Extend the functional guest smoke test to check the RPMI reboot and
  shutdown devices reported by firmware and exercise the reboot path.

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
 hw/riscv/virt.c                            | 179 +++++-
 include/hw/misc/riscv_rpmi.h               | 114 ++++
 include/hw/riscv/rpmi-fdt.h                |  41 ++
 include/hw/riscv/virt.h                    |   3 +
 meson.build                                |  14 +
 meson_options.txt                          |   2 +
 scripts/meson-buildoptions.sh              |   3 +
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 184 ++++++
 tests/qtest/meson.build                    |   2 +
 tests/qtest/riscv-rpmi-test.c              | 684 +++++++++++++++++++++
 26 files changed, 2751 insertions(+), 2 deletions(-)
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


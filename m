Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75094C5B572
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 16:03:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvzoS-0001v1-9G; Mon, 17 Aug 2026 12:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1wvzoH-0001q1-4n
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 12:03:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1wvzoF-0006ur-5g
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 12:03:36 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67HFYshx3082335
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 16:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=iUpfIZkbkjQh1GSKm3Neq9+gpYS9Taf5qFg
 uVKBvvF8=; b=fqFBN15jzkvtGQH5/4FhHu/UJMJYtin5bZxFRt2ktkj4yhylY6K
 530QdN85uZWQUSC23nQSSHkT3V+H4YQh/UeVhgV7dt5GY1Z+vw0p2CUAjRKXn8uo
 Nc4cr9WRIQK91P/9WWrS1zd/zl2BjuwmvLy/RXhfU0J7ntN9NBiaYh636BwXk5xX
 z4gayHwkGEzdWceKZgIScPwjY4YGIWjO+J9oN7CWaFV3edGaRLZA2u5NN8K0z+89
 nf09hz0r9lbPIj7qU5KosOr6rK8qa1eTy25BUcVjpu6gFHNeAwtbk35g5HfmHYNo
 71TXMH6Aafa3BMmQ3w/qorkrdBy+ZjT276A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y779py9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 16:03:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-848474825ffso42948b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 09:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786982611; x=1787587411; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iUpfIZkbkjQh1GSKm3Neq9+gpYS9Taf5qFguVKBvvF8=;
 b=hDauSGU+ywfX2zJXugjRJmf55S9nA5kmtda5Wa6r9+L5q1i6ib1MwTbH2E1N2g2fGv
 EIxQhKRiH+7Y7T662aZlK0k3UoOLX/DP1OB/6wz7D/tGBJcgrc5Iw9zID4sF/tC7Gtp+
 Jo8e00r+d64FBzSWbw62dpFBT2ADIyu1cyXL4mXwiNI7iHdQQvWFzhhpoX2i22tZ+mNx
 ImbYSax06R3oXhNtSauynOH6M5K2/lHN7HpMt7UEB7cswOJryw/z+GLCTSHcnbkrpua+
 fEGSatBegTs6oex11TPIc4c6abTa5hGb4waVevIa8YsxFhdACdMAewMRrkTo5SwDr1pP
 qZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786982611; x=1787587411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iUpfIZkbkjQh1GSKm3Neq9+gpYS9Taf5qFguVKBvvF8=;
 b=jbw0qVVUUGvyWjQYIuytDhhDr+Fm5sGElx24XJfZsJXP9sByLYDY7yDTcBI1HBMtKc
 uLOLjVwbF+oJU9DhI3EHp0wzeTQ5kJUwV4TddMboqIN/hJlpclfrW2BCq/bhIei9PZ34
 FozMPahWB6rmvylLBDOMJKtgxMotQLGY54Pu6v2bFpUhfKhC844YCJ0keAlYDH3d/Cwh
 ppaf5mk2K8wW4hXF6at8tXF8RtfJj6H7UOnDuKQBKy/lp9vICMKjoyzLCHaQHULNIsmB
 tLb74YYJLa3J4wP9MnPSvvvqtAK8mhn7cG8sP8EH+nmErYY38PMujBdNiGmFKpPj3bMH
 eqEw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rre1QoySy9dBuWfUQyX1Kr+uVcQ+FI/TW2LkWcHFwHd/Z0dO6amtg04jE/OMco97l0tBFRr1zehn4kM@nongnu.org
X-Gm-Message-State: AOJu0YwzG4bB1CdYTsMotL9nngpW78hwGsuHPLHzNZWkdnJuEqnK5/93
 AYm90ahVFnZDBfmER8juQYVQLNgfTZzSqFyr8MTse7ROqfgIBEKqEb08vKYz29DAPFnhsPaGhiw
 JfiQ3JDK7riFQzMFcbhMF/nyYpYzijG/8SVOUL9pq49OpH36+LfXU4dJQpkYh6vOJCA==
X-Gm-Gg: AR+sD117Pjuk1kBzo84pfh2TO5AVcodkQ4yoroV7oo3srYkiCHBKxz+sFpk28V+4H8J
 SZiC+urTvg1u6lEn0Pv77lWMv7+8LU/0OWYrBfl+oe2uVP/GXXuJwQzmHHHBZq6evVAXsb2hf6u
 Cr4Y+LNw3rmclAtFRoBBvRVXJakWUh/qpUfUfbI3+J+91lwxSduuum+VttOtgvuyjs+UsVGCVTj
 3smEF/kPODXsLv3F+k01tf7Ev59lf8Z+jrMWvHmx5cvzt1ir5YU4d8NXMU6xJT3y6Z0AOaXIIo4
 TkpLriZbzLg+V2uh5/q7kcaIBUL7SQkgiYdKy29DKOGpOOaN07gdCM8PqUVQq9fz40Cy3uw4ZZT
 R8tuKJSbstTZq59ngwc30e5On6xJQJLNiH+yzCx9Hx3xrQPOt5JB3SpLsdn7lz9V2XOxZ8Pd9at
 rKb/OhYGjMm+6L8djhBZOgy7t+vQ==
X-Received: by 2002:a05:6a00:2314:b0:84f:df11:b78e with SMTP id
 d2e1a72fcca58-851bc2351d9mr141443b3a.2.1786982610924; 
 Mon, 17 Aug 2026 09:03:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2314:b0:84f:df11:b78e with SMTP id
 d2e1a72fcca58-851bc2351d9mr141397b3a.2.1786982610415; 
 Mon, 17 Aug 2026 09:03:30 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-851b6f8c0f6sm545923b3a.39.2026.08.17.09.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 09:03:29 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Chao Liu <chao.liu@processmission.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH 0/2] RISC-V Sspesa: QEMU model support
Date: Mon, 17 Aug 2026 21:33:15 +0530
Message-ID: <20260817160321.3313698-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX5DSNYKGiUTSL
 4mFUdtuawy8zlH09IlvcZC7m6dxO36yWY/NYlGwEc0Qj7yKFCDyukmzM0dFnbCUkapt21jy9/Md
 sS7EXOjXfpFh2HCYyQ+/dBll8PonqPL4PUvau4/SOU9M2eWurZaqxI4t7LC2TqyMDcxAggu1d1N
 WMPss5P1+YyEEVU71zsxo00dudjbUrfALIkSj8wzhItHLMGljb2K1x7UJMJ2031n7RVOo/FQ/LN
 Gv/nhduOP2iHZrU6o+YkME2L13N15/kdrf6kCoqdJycz9+/I8l3aUErbJxYdKf5utqcRLnFAY90
 iYjFJpK0sGBeJ9IxXa/plWxMUD8KGoGBPTgaqELNu80fSDPc7vMwIzKWs02yFbHE09321tn3rF/
 G4IrziCgWGD6RtRSFJFOF4Thg23g0B3Um2Z5a7UW4fHyQxMaUPMRdS0mvIkJg4eTWUrRwh6imge
 7vwsoNVMrmz0+n3wpOg==
X-Proofpoint-ORIG-GUID: kE3TXniRE_RQS_xSbLXw6AcEFRQR1w9Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX4cnr7f4YZGn1
 RVlfr+zi+R9CemVXX4Gds6lwveMUVucRxm/hJns7dXfThtk5MY5tlf1kY7iTYh6bsi03wrMi/ud
 4qqxCNt2eRdc0kVi/EApaUhyKBw5haI=
X-Proofpoint-GUID: kE3TXniRE_RQS_xSbLXw6AcEFRQR1w9Y
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a8330d4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=OJFGyuVhfV-0zpwyQK8A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
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

This QEMU series adds support for the Sspesa (Precise Event
Sample Attribution) extension.

The first patch adds the 'sspesa' CPU property, the ISA string/DT entry,
and the shpmspc/shpmsdata CSRs. It also allows menvcfg.CDE to be set
when Sspesa is enabled, and adds 'ssplcofi' which is implied by Sspesa
so that it is advertised automatically. The second patch captures the
overflowing counter ID in shpmsdata at overflow time and latches shpmspc
with the interrupted instruction address at LCOFI delivery

Note: this series applies on top of the previously posted fix
"target/riscv: Fix LCOFI masking in sie/sip/mvip", which is required for
counter-overflow interrupts to be delivered and cleared correctly.

Reproducing the full setup:

Sspesa support requires three projects: OpenSBI, Linux and QEMU. The
matching branches are:

  OpenSBI: https://github.com/mdchitale/opensbi/tree/riscv_sspesa_rfc_v1
  Linux:   https://github.com/mdchitale/linux/tree/riscv_sspesa_rfc_v1
  QEMU:    https://github.com/mdchitale/qemu/tree/riscv_sspesa_rfc_v1

To test Sspesa, build OpenSBI, Linux and QEMU from the branches above,
then boot Linux with:

  qemu-system-riscv64 -nographic -machine virt -smp 2 -m 2G \
    -cpu rv64,sscofpmf=on,sspesa=on \
    -bios /path/to/fw_dynamic.bin -kernel /path/to/Image \
    -drive file=/path/to/rootfs.img,id=hd0,format=raw,if=none \
    -device virtio-blk-device,drive=hd0 \
    -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

With all three in place, a counter overflow (e.g. 'perf record -e
cycles -c 1000000 -- <workload>') is attributed using the
hardware-provided sample PC (shpmspc) and counter ID (shpmsdata)
instead of falling back to epc.

Mayuresh Chitale (2):
  target/riscv: Add Sspesa extension and sample CSRs
  target/riscv: Capture Sspesa sample PC and counter ID on overflow

 target/riscv/cpu.c                | 13 ++++-
 target/riscv/cpu.h                |  6 +++
 target/riscv/cpu_bits.h           |  7 +++
 target/riscv/cpu_cfg_fields.h.inc |  2 +
 target/riscv/tcg/cpu_helper.c     |  6 +++
 target/riscv/tcg/csr.c            | 84 ++++++++++++++++++++++++++++++-
 target/riscv/tcg/pmu.c            | 27 ++++++++++
 7 files changed, 142 insertions(+), 3 deletions(-)

-- 
2.43.0



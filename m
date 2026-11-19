Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E1606A32F
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bpKxCekP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlohFGBL
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTxRB-00048g-Td; Thu, 19 Nov 2026 03:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTxR7-00047M-Tn
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:24:05 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTxR5-00010b-Ps
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:24:05 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJ7ja8r1673427
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 08:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=FnJ+JZsFhykrorpwa13XKbEEAkC8/mcKS+0
 PDwCjQTQ=; b=bpKxCekPXDfTY7Q/HXWNwDthVJ1yvDaZZYrLlKtiy4XyNVBHAw0
 YG1dFyeFtkseo+v1hY0vdL2kuRZVk7CRSyb6/yDpG+8TKmmgegztypmVX5jofnP3
 z34LnpCefA2voNDdGS9+CgIJId/UkFdci3flO5rYfUSdkipiCVGF/k7LvpnvH+Ki
 XzvIrIvV8c/ZnBEv12hlk5qZaEQ9HT/IHrjej+0s6cu7Qn3RKqjjpF8itpshbhto
 Vv9/GYhHMUfAxojGmU8L801MrIjOj0xgEI7ntLJAk1ZmkJfbY40f4cXUTuesqYqn
 8uIhuQ8muVV6sGWdQWbefciKrP43aU/PRiw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux8gat-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 08:24:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-92106c98714so34370356d6.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 00:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795076641; x=1795681441; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FnJ+JZsFhykrorpwa13XKbEEAkC8/mcKS+0PDwCjQTQ=;
 b=IlohFGBLoB+XcLaELb1RpQYbMdCbU1rLbooaxtANXGf8BeJR89oIe8qjl0KITBSuYf
 EFdjOlCAQJ2W5/EVZ4ClLsxmZeBqeTwZsTc1j+CKd8V32UMJ+Ox59Y5dabKNVbH1YlRV
 4sU1z8RJ9GCPvzC2phgmv7FPZjJhvojTwI6dEWG5TnIqVARB5mIYq/giq490tN3FISgg
 5TKM50fsB2fRS7L8sWezyk7MS9jO7lfawkZJV486Bo2lHpbHMYylMxmV8PPI2PLb2h0U
 iPnkB8SE6zIKoDtIAx7XERNI/dOuOIIiVdm3TjtKqf1JPQfJJwWh5MrcVG5DZrr03Y3V
 pONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795076641; x=1795681441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FnJ+JZsFhykrorpwa13XKbEEAkC8/mcKS+0PDwCjQTQ=;
 b=t4Jv5Yg4R0mVnvmZ+V4ejjHVnKYxoCG/dZEuEJ5N1RebsUYEpHz+v9CrFG8WjcppBN
 fOJBmapAxroAGl9kyfwBTClv4FkV9rMsBFDGaaqsWIgYY8Lv1QVxYBeBPQCXvqBga79y
 Ff0Qvxq1s8Tr1rRziM7Y1Ne71UIb32Gz5OmWKdH8pSs4kxd2x+U2PTJjB7D5oWgAx46s
 V6vuOr2Mc+MNVDh2U62t6S2RvEx4WzMzcdVSuAtsaoVL55ZAHGQxQJKfS1tqw7cZ7IZE
 qXTemQ9VdDu3RSVi+Hr5DE2NhagGDcuP0jz8tjvMgOCpouf0tl7+NgU2uFHVMkbgdQ97
 wbAw==
X-Gm-Message-State: APuU4Z/Rbc+T7hZkN/N21hOdJiuU8OTTwrOFu99jOoj0I/NPapblB1Uf
 dhE+bTFVIdI/R4f4tL3n614dU8GbPPa658o5EvDj4+fGfz5iOkilx+S/dhSMWkQDLOt3u+Y/LvD
 BJTVygzid+OvFx8cwm88Hkg/EG4c0F7QCn4Q6X5UnOx+j4x3a+BZFu4axpA==
X-Gm-Gg: AZFdTZeXB+YgmSCSucbtpNmuB1w1Xmx/xZVX8cooqct2jUU9CdnUp/7NEs9lixU9Gf3
 wooaoaLLw6b/tFz1h5SR4vY+huhy194c/uHuJ8suFqfEyeE0thS+nW8RHPpplyr7rXTJC3FS/pq
 p7R8RfMA578aQYxdVi3WwauLNb4Qifz9vdaZF1TaWRr9plRtX2vNylj+1DUmd4p5m6MUy+iRCmt
 SUMamlWVuD1p2bj/zHddFbwzMft6ptX1bibsqxgg4whb9AyC6jWCeZiEFm2juWtJboAqrkASMCh
 QdG7VzSSQuHkF7X5Ny+FUiw8umNY8bjI/TSWnuMb2grkFU32TFhtgxIle4mxNWIrT/nPn6Uc33Z
 Xu38LXbQGReR2huGue27gv4TqzfOsJUOmWc0mGHUUGQm2fNEACiHaVNsfenErsckTM13uxZQhKQ
 0FlvyzFBOZ
X-Received: by 2002:a05:6214:3304:b0:921:15d6:2acf with SMTP id
 6a1803df08f44-92115d62e61mr64659326d6.12.1795076641156; 
 Thu, 19 Nov 2026 00:24:01 -0800 (PST)
X-Received: by 2002:a05:6214:3304:b0:921:15d6:2acf with SMTP id
 6a1803df08f44-92115d62e61mr64659046d6.12.1795076640441; 
 Thu, 19 Nov 2026 00:24:00 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([179.193.8.137])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9211a6318aesm34524136d6.39.2026.11.19.00.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 00:23:59 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v3 0/5] hw/riscv: riscv-server-ref refinements
Date: Thu, 19 Nov 2026 05:23:50 -0300
Message-ID: <20261119082356.1264726-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zZO894i5kFyQPfJGKt7vLcL3sMChw_wP
X-Proofpoint-GUID: zZO894i5kFyQPfJGKt7vLcL3sMChw_wP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX4yaWyzjgwjZh
 fEQnrS01OjuKr1d0I+uYaD9I4TIoi46ihkxE9GyX46Jebe/O0jUJzwxv/V2PUmZVsBSbPHU6tuN
 fpWSBOsbIab4K2CqV9Jefql9oWkVzhM=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afeb221 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=a6tGUzlCxnQfwxx7nGpYxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dzwUP4JNUFgM7hWAQ70A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX/4jnecfKTYxU
 1neuEbAbbdDR3Ow5zEsiVwCeYac+d9LeTs/uXAvrII0ovTX9srJVuP9NKyVLOZ+m1qDGHCEuBPE
 KrZEL+0tWzgxZ4Nk442XAKTGeZs1/SGJuWVhFAQrK/INTNr/8Gf1N25dh4tgHMc9UEsN/iLcLty
 ty54mogKOHobqCDvC8pCV7pON5nOMuBoCFGigutVZpnSTMkntFhLGb19jeNRSThvYCkmvj8XcVE
 UuiqqoLi7nw/QZ5j9DQSt1MNgzDD+onzMG2ZPlptshamRO/Z4cEyFhoBkqZNso/nf4u1184Rwiv
 T0wmmiskqVo3XE30EJLU5A1+eBxYrX3u4jiLj0nr2Up7uTzyaP13c5Cu9fbxK8B5J04B05QPyEe
 kxcD4onKpl+f2fYLu9XPKVOjHonv89fIDo+nfUJX2MnpRzohY4A2v0kkbLx66X9o4hPv7FSzFdF
 6kC1Fvd6/qcl3lWzO7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Sashiko pointed out that patch 1 was missing a Fixes tag.  We're adding
it in this version.

However, Sashiko wants the tag to point to a commit that introduced the
riscv_create_iommu_sys() helper.  This isn't accurate: that commit added
the helper support and use in the 'virt' machine, an use that doesn't
care about hpm counters, so I don't see that commit as being faulty.  I
pointed to the commit that introduced the riscv-server-ref emulation
instead since this hpm counter setting should've been there from the
start.

No other changes made.  Patches based on master.

Changes in v3:
- patch 1: added "Fixes" tag.
- v2 link:  https://lore.kernel.org/qemu-devel/20261112121553.485439-1-daniel.barboza@oss.qualcomm.com/

Daniel Henrique Barboza (5):
  hw/riscv: allow machines to set 'hpm-counters' for riscv-iommu-sys
  hw/riscv: make UART FDT helper consider baud rate
  hw/riscv/server_platform_ref: fix UART baud rate
  hw/riscv/virt.c: fix base baud in serial_mm_init()
  MAINTAINERS: add contact for the RISC-V server-ref machine

 MAINTAINERS                                 |  8 ++++++++
 hw/riscv/fdt-common.c                       | 19 +++++++++++++++++--
 hw/riscv/riscv-iommu-sys.c                  |  4 ++++
 hw/riscv/riscv-iommu.h                      |  1 +
 hw/riscv/server_platform_ref.c              |  9 +++++++--
 hw/riscv/virt.c                             | 17 ++++++++++-------
 include/hw/riscv/fdt-common.h               |  1 +
 include/hw/riscv/virt.h                     |  2 ++
 tests/functional/riscv64/test_server_ref.py |  3 +++
 9 files changed, 53 insertions(+), 11 deletions(-)

-- 
2.43.0



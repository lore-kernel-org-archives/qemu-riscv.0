Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76128C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 12:23:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiAFJ-0007wD-OC; Fri, 10 Jul 2026 08:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6mi-0000Wx-Dj
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6mc-0001qt-Au
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:31 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66A7dSli4156461
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=zspPc59cvvc/pEEc2ld7E1FQ8dOziLtNn8i
 kItMelo4=; b=YjfhlssUYQFV/xAp/Y4ds/qwSO8uE34MdinBn1ZrwljVull9Uj2
 l8Twl3hqKlX2D28EGmvN7cX7X56sNX6ZBe2zWK60DJGljFgcu4YOE3buXyWTS1bI
 M7TJKEgxeM/ECMDqJhi46Ifv9PIdHwIKKRK1depW64B/pIJrTXRd7fYQ/JsX7eep
 ODQNMIdCtRB+2m3HCEIhRsadxW01k061m+yEKEe/mWrj9EJlQjPGJ5SKgx37w95N
 ub4c/gQ/2ziQPk+3+96ZNwVfh2tgoPlXHjkPMtIYohb/2Sd4OsPC1ILd2U+Wrasj
 6w1urPNEdCG62eYX29np5YTjYMvSQN/uLsQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8jefy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-37dedbd1cf1so382790a91.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783672809; x=1784277609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zspPc59cvvc/pEEc2ld7E1FQ8dOziLtNn8ikItMelo4=;
 b=VwEOjcL4hGfeXwv9B5zaQ+vO3l/H0ZAl+ou4ADn6ejUJeGJ0GWS7Sp0NQYtEVN3iZx
 rnQhieHItZrrtcnT1Y1o5///yo5k0JgaIa0V7qdV209sCFr0d0I4+oXo9Ep++1WoSiKg
 5tQeFHeysMSu5LcBEJmJkZCNJkKQDWhQJ/cYSBlaCoefFjBRNpidR1xZ/yO6DqYZJC4G
 PleVEOXt5+Xt1W8otPsg+XB7wwlZ9T00wJiGxPMua7vqZe14B+QylJTzDN1QFnRbiVjG
 IsZQJbM3gYjjT5pyIo/mxTmXsmwxM+yi+Rnl16ugt4T5zTp5rt26k+ZvPPBCzxNi1T3C
 bIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783672809; x=1784277609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zspPc59cvvc/pEEc2ld7E1FQ8dOziLtNn8ikItMelo4=;
 b=XEmxAC650r0bK4FWPcwIofkmfsFH+IBELza7fWsORLE2dhmOK/vZJ/pqud4rsoJ6bQ
 6JEE5OBJB+JDkqiW30SNdwtvReXAlD3Xu8hqGEDyp95Ly3TaRzsh3Dn0F8/XF54JrpsO
 g0gr1lZro6V31QvT2rdNZLIgU1eyfk5+zFADReb9RuQ/2AxsBvZH6FKANC2FNJDqpCAP
 rd0/YXXePZnaxAKXkxSjY+qe2wXisdZvgXxU5VUndQh7wuE75AyPO4kfX3eAVKGTvzdE
 N4dyxiXNWbSm+Q5Qnew+/XSMVLG9/TD0bj66l/yV4QuhYfNxg4QljwrWLdabrFPL2jpm
 Dfjg==
X-Gm-Message-State: AOJu0Yx++qsU88sEdRKWd6RE9c4kp3shHp1PC9JVSJQ8iljJ+2Qss+bn
 QQYch0tugju+X3XRh+cMZA78BAXkbff9iNYtUijCrSaDaxKmE6wRk0YCTNCU56tdBoLn/gaSwP9
 xlVoVBGK5GlRnAUg7LA8SOHh2eRvDDzvyXk3UoNbAk2207oK9dShpvkwT94qhK99z7w==
X-Gm-Gg: AfdE7ck6pabmGS3Vp53LmZnzzEyO0E2BbecwYxwbtc9WzfIlebX3L89VQ7Jtr45Vz9c
 33gvpsw6BzOlObJnxVOl+jECk//M687UxBiGeKRXwjmxFy3H0u/G5kvtMfPeZLovbbXN4ECSoTw
 TguX2rKGkQxILcZoomZGYs5xbbBQm/alVJJ4ZHlykxcVn5jy0Xffg6TKHP59iJS/kGBPbnNAnP3
 9EC9R+cRiM/jyJ9lz1xgzBg67J4dSnUqxecdT1BX3XyKmYg1VlRysqHwY4adxic3VfNCFrkRwuL
 xaCAFg4JSZkRdHHSCWmNRyOHYPPC1jqv90sWt5prd0wdevnRYkwZ8CKeiljpY7q5QJeWuZRlvR6
 TvWsppTyiDMA3bn+8/xJl1e4bG+dpuuhowSKfwAckrP8fdUQnjlKj1BVxElz+WUDYp4FzDh9mw8
 U3wj+8JYNdMW97JwNMbDv6ZZgENLG97qEdYib9LLnInw==
X-Received: by 2002:a17:90b:2f0c:b0:381:abcc:c8d8 with SMTP id
 98e67ed59e1d1-38a1f1de21emr6431288a91.1.1783672809377; 
 Fri, 10 Jul 2026 01:40:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0c:b0:381:abcc:c8d8 with SMTP id
 98e67ed59e1d1-38a1f1de21emr6431242a91.1.1783672808739; 
 Fri, 10 Jul 2026 01:40:08 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3118389d9bcsm29164925eec.20.2026.07.10.01.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 01:40:08 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, daniel.barboza@oss.qualcomm.com,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v2 00/10] riscv: add initial RPMI virt support
Date: Fri, 10 Jul 2026 14:09:42 +0530
Message-ID: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KgpiCxVGu00X8gOhq7An8W83UpfaP132
X-Proofpoint-ORIG-GUID: KgpiCxVGu00X8gOhq7An8W83UpfaP132
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfX1uhfTnYBkN4j
 zPCZaQYor/g97vU2CBmBrE22n3ae9EgkyyHrLUksx8KDeJenMZ2LcLjxw1MRiAxpNFxqpdflnY5
 ZgR7nkiREEnars3UKIHU0viekjA/7m4=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50afea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ifwrZjGQlPW6EF0WfpIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MyBTYWx0ZWRfXzwh9Y25I2TXF
 a262fXK+XVZkJWeOwdyhPYRz0oTXi/6k/JEvjEVMhlOibk/2RV0dr5k6vIle0dzBA2U72OCUd70
 0b+WYq9HIaXQBeFDrwJLhb/6T9J2v2bI/DwPZZNRW8OH2Uy0M/0/rezHx2tcZV5wxaxrAHwKYr4
 U/UwX72Rpd+QAUtNYLBMqG2Po5zuWITO1AdkC2WDqG2MbX4/FiPeE9VydFEwK5E2o4V3FNb+hlJ
 YHRnGwjPlgWWidaeHgVuc7kQUvM6U7dKYxN6WkW46Y431ImrgzQrowBfEd+7Onc0ay66WoojM50
 YXEFG08xFUEE2HvA7MQIAlhqfn9nQFIJisUFiznZXXQJ18GUuDXwz1QClcdFaUfLWZyNrcVYyZ9
 cu94SSpH4+laFOeXnX0d6L8x1h5+gJZhM/+/IBLXXgR4tuR0AXaRhI2HQPSkekUiqfor9w3Prhy
 qaOtYSzQHDtlUgDj2aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100083
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
X-Mailman-Approved-At: Fri, 10 Jul 2026 08:21:44 -0400
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

Changes since v1:
- Resend with the oss.qualcomm.com author, signoff, and mail metadata.

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
 docs/system/riscv/virt.rst                 |  50 ++
 hw/misc/Kconfig                            |   4 +
 hw/misc/meson.build                        |   6 +
 hw/misc/riscv_rpmi.c                       | 558 +++++++++++++++++
 hw/misc/riscv_rpmi_hsm.c                   | 287 +++++++++
 hw/misc/riscv_rpmi_internal.h              |  42 ++
 hw/misc/riscv_rpmi_sysreset.c              | 206 +++++++
 hw/misc/riscv_rpmi_syssusp.c               | 191 ++++++
 hw/riscv/Kconfig                           |   1 +
 hw/riscv/meson.build                       |   1 +
 hw/riscv/rpmi-fdt.c                        | 103 ++++
 hw/riscv/virt.c                            | 167 +++++
 include/hw/misc/riscv_rpmi.h               | 126 ++++
 include/hw/riscv/rpmi-fdt.h                |  41 ++
 include/hw/riscv/virt.h                    |   3 +
 meson.build                                |  14 +
 meson_options.txt                          |   2 +
 scripts/meson-buildoptions.sh              |   3 +
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 172 ++++++
 tests/qtest/meson.build                    |   2 +
 tests/qtest/riscv-rpmi-test.c              | 684 +++++++++++++++++++++
 24 files changed, 2671 insertions(+)
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



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B52BCC6B39
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:52:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHFJl-0003qv-Fg; Thu, 15 Oct 2026 02:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@oss.qualcomm.com>)
 id 1xHFJk-0003qe-CP
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 02:51:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@oss.qualcomm.com>)
 id 1xHFJi-0007ll-Q9
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 02:51:55 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69F2MkHg841950
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 06:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=rvy71e22tGz
 BxKF9WgLL0P4TR+iP6f2ZIx2WjS90w2Q=; b=EKl24zTNCr3MdSVtCI/eO1WV9B7
 M25PTjImDR/XY39G8IkQFPUqIm6e2xydrcLgI0FYPkL/RzqsdCfEWXGgpMHIWuSU
 u4HgCck4xZYzGoFFy97c2efWI/ZNIE67xdyCVnEu32yIPWQcwZOWEJjWSFhcxDci
 jUMx2DgAgnBnPqCx4nu+oE5hO0+dRfdP2ycpwK4CC6mpKYr1HZh/uPTURThrIeKd
 JKqs4NjBTagCAHuehxU+Hdu8DLYbO4t0YxM4yaCKzQBJm49R2DdT8phaC2IimR0a
 e1mRR4g2dYazEHVHlAHNCZsvjVYDKkMiM/pEAUOgRMPZ3yFVYPuC7X6fJvw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wtka7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 06:51:53 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-147be78cd56so19586722c88.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 23:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792047113; x=1792651913; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rvy71e22tGzBxKF9WgLL0P4TR+iP6f2ZIx2WjS90w2Q=;
 b=Rv1BZJBdShdW2M3l7jTgM62yOBdTv7fhWFeRuCdz8Nu8bZy+ORr5RJpRM1SGKjrLFf
 /SHmypFSiRxarXbd9A5v3NoS9wtfJabpNajn3Jf71tYUZdKfonFU2siEu5zlTxMAHsDu
 8OjC0dhc1RTT7FjAJVQPKDCULDzlvLxXb+Zofw0DsRG0whTPA8hqTTfX44BmqvAkFv8c
 oczfX/ntnIkuZ8vzc7Zx8Mf8IFHYsHxLHQ/0PLpRPrzrMcpOqnQDHT6qKAEfMXkmaNGf
 DsjxneUCIdSgYrtBd5ygX0Ox7d+xYwTBvxHH+ATWgHBhXMEfILhGtHcoX/ytFWfT8+DH
 N6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792047113; x=1792651913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rvy71e22tGzBxKF9WgLL0P4TR+iP6f2ZIx2WjS90w2Q=;
 b=IiIfgAMJHEXRocp+EcdD9XjUugNFThc1jIAxH+5WjAEZeoIMwvCaJ6ZLMBEbyHMJxJ
 eLwaOZpaOf9n7ueX2KPD02toXm9AYaze9+0SliUGyZlmzO4kH5XGypJHcS8jSH+eaJeF
 BLvkI5UFc0AdYY3xT8AwDYYwncGQ6qHmMuqnYEapybMx7hwKPV6h5hnSI2lbEcfIyvnm
 Syy1YNxVfzBhog4kLiojwXo0eBbyrUcpvLmF9X/11TLvpWWtypkRTaDbRWPFMd4liVih
 5F44orrrZZBUHnOXUIr4GMPrzL8Xwsw/vDDWE/2SJv1czXP8F6xouxxdgY8VlsUpjXM0
 TEjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzTfU+gzGwD/FZvCTKHgY+7F582CwO3sj/S1sfeTAtUfKDqgjUw0IwVlOrg5kC3lfO/PjVWnSI3lCrI@nongnu.org
X-Gm-Message-State: AFq9FYJxmqWqlizpcTKaqGserts+Jy/zrYWWPq/6n47R7etS5irMioAr
 9SGLTvzYLYXaup3vIYHtVOU8tvLJLHT3e70b06uP3PjENofA7fKZuU8FHGAZnOo/p6SsgIyhJGZ
 gHdXV2KywUk05Q3BLUMimGjYvk7MDjtxMFBNzXvHrEMJLef5j333BZCdXtQ==
X-Gm-Gg: AYBFou29cZTIxUMhqrgN3Mp5J78JtkF7DmCuOqnm199TySZZMN0dUeiq72CNcWlioOE
 NChLP8YeFe4C4RzBVC/O5bDKMJmSdtp7oFXtsvwl8HHhI223a+KL+zm3/GI7rbFq8DRJbiFrupe
 9o53Z7/bTfB80Qm3O7rAxXrM3uaqhQk3aSAvQiP8gbIP4O+OIHgsjNgGH8VmYa5rJRbp9OvJgaF
 CxlOx2kM/JfpVbDJN5/D6S0uKMVbrfYl3eht/+HJ3MdyctUx8amQkYYyqa7njenf1Tq+RM/hXqd
 GbmCmKvM5MO9nal8hrFcqYR2KbWVOE2LsLQ93Jy0NC3AUOd2u2T4gM2hEezRwb/vbJUR1vaKD4O
 5WgnfMCPn/+bKDzHavr5qevi244zj5MexkYu19E0DXo1EPh++XpeMEhoBLk/aw5b0Zj/Cz9KtVI
 Q5/bho9dR+e4c=
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id
 a92af1059eb24-16a6187f08amr29131215c88.16.1792047112802; 
 Wed, 14 Oct 2026 23:51:52 -0700 (PDT)
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id
 a92af1059eb24-16a6187f08amr29131168c88.16.1792047112138; 
 Wed, 14 Oct 2026 23:51:52 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-169a442956asm67451789c88.16.2026.10.14.23.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 23:51:51 -0700 (PDT)
From: Sunil V L <sunilvl@oss.qualcomm.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>,
 Drew Fustini <fustini@kernel.org>, Prajwal N <prajwal.n@oss.qualcomm.com>,
 Shankar C <shankar.c@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH v2 4/4] MAINTAINERS: Update Sunil's email id
Date: Thu, 15 Oct 2026 12:19:57 +0530
Message-ID: <20261015064957.4076464-5-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015064957.4076464-1-sunilvl@oss.qualcomm.com>
References: <20261015064957.4076464-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyNyBTYWx0ZWRfXwr05vSM0R3NB
 d901hea65teDEjS1eiBPci0BWvS8AaOrsovCGoNRj3C0yLY984OSh8VxrzYx+MigocnEaaMcCfb
 J9xIoHnLWldPjtEhH3nWAiuKDw0df0o=
X-Proofpoint-ORIG-GUID: eAP9k6W6uzY-Q9abjh4kPQxdc9Vgl7ax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyNyBTYWx0ZWRfXz8nWspdvEX0v
 1Xl1fOz9S6NY7N3uxK3OQBFcSxhzYdZoag2Wo2YdkVVkLZ+T7BqAmfCxii2sMmGu0HBcSBfidaz
 I4lATFxUUcG5vBhzkyz0K6hisjmgYBGyPNiJdhXEPYHVS51xtvq+UGpqKIFqtT3rHYu1OkrJbxs
 nh/xHN5S4S33LMj1luQUAbSirnb7Wq0QnH50G2+FcfyWCnvuKgt7UDCt11jLxUXSe9PRFvCxEhK
 gwTT3KmFGgSM0uOwR3qjqg3j5+32g3FHzU4sBWIFo1W5KX/98Tg2YtM+Ghg7tRdvBqNwcLgPO/E
 GyrqCLru06p1KymEfVU4YiggWf4iNqz3bDaFnaWa+J9t4QzThguFdpAtAYAwoHHxDDpO/rB5PCo
 dEQTnSw4jb+stG7OhcNDe5ciVtmI/RWBSdeXybCpzFhcpVf7vNzRFUKZ78R9Dst0KOPlwGR7rpf
 AQiRayvmlXWKrBvDtUw==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad07809 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=bDdBU3oEAAAA:8 a=69wJf7TsAAAA:8 a=9gDgMEpirKkMJTtyBl8A:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=DN7SgORnOiO7RqxRx1GC:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-GUID: eAP9k6W6uzY-Q9abjh4kPQxdc9Vgl7ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150027
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=sunilvl@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Update my email ID to qualcomm.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cc426451c2f..5c2282088610 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2335,7 +2335,7 @@ S: Orphan
 F: hw/arm/virt-acpi-build.c
 
 RISC-V ACPI Subsystem
-M: Sunil V L <sunilvl@ventanamicro.com>
+M: Sunil V L <sunilvl@oss.qualcomm.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
 F: hw/riscv/virt-acpi-build.c
-- 
2.43.0



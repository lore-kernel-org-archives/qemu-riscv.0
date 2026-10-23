Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BEF606A31E
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3nZ+3ws;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ym5ohlTh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKHrA-0001Zm-Us; Fri, 23 Oct 2026 12:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHqB-0000fs-Fg
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:10:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHq2-0001VT-1H
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:56 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NE660C3018953
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=A89pYnehqG9
 Oa0zr2K6Nlg1zPjOZrHj4TGrxRdiRMKc=; b=e3nZ+3wsUPbBP+JHCPFp6it1/WG
 rfHuqWOxLe3Pa+EaUSts6OTngv+GQ4gRT89ZljbIZkmzmWuYFNy3TIvcq19JS+dK
 F274zU+fE2porLY+Bpma+8ZM87sOjnNii4fhi9wYKmE9jlhOyI2rlNfcZifsIOme
 YTg4GIS629IL3Sc1eSEM+X+72OLSURwLQaZhr5+O7eK/oJjUOcjSHxuzI9PFoQrT
 T213gAyeZ8bclshxclAeueOv6kTBzNpjdOzIrdb4weyecX82UPdB84ec137kaMF1
 GZgKK0If24q/q/WPf4LOzqwUiAdmOGB3WkmbhKmvNGzo9c2i/ab+5lxonzg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbwfj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-917b7dd3f1dso17631826d6.3
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 09:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792771777; x=1793376577; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A89pYnehqG9Oa0zr2K6Nlg1zPjOZrHj4TGrxRdiRMKc=;
 b=Ym5ohlTh17VUi0BcOE3eefvNV8mln1X4E5Yr4oK9iflc5/kPGCvPkmHcZfotnrTtIB
 Fk7AtJehyESCR5eJZr9Cw4fTwaof9iQCtM7m+BUOISoRH+3yVWddTJYgUyng0vKb9UHh
 0VaopVwLozpZn92lknqb5tigIYkpwBDC1O5MO96YcQZZ3TjtDx5SodiVU8G99+MYJbxh
 d92gUqEnGWZgDgtypDgfOdcAC8ISDu3TrZ1T9t9CxmvTBnDwRFR/8p/LjRbqtfr1fKDq
 Sp53rARQwMaiJwV1Wf8i1DXYNbFKIv2CcNNuqeyDp069+VQv9AIcV9fvjDrWjJy0K1We
 Y2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792771777; x=1793376577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=A89pYnehqG9Oa0zr2K6Nlg1zPjOZrHj4TGrxRdiRMKc=;
 b=wJJndkmMmrtpSFNuW6BXuw0JOpE7y0ucYNHWwNQ4hoKewosUGh0NhtHoVsyRiVovy1
 Oe1glWY0fJKCFCcdHb/3yuTDwxq0zTTiwkjm4TWp4xCXE4tEZWv0xbKFk9MjHHCI8d1U
 tfJNyZcFrVV0aAn0e/06d2fuX7nSPPIzl5PIjJanzoZElMrjAmsDNK9UaeqUBBJ+rnSl
 5W4BkQ8GbQ1jiYpvBQewjqhssJaoboAqHTLPocgZP5v8anh9gcgrR2igpKb8JV5seZBG
 i3VQi+dSV3b2EG2Se1wdJl5Z8SntxMmIFucg2m1NoBFC2ESZQ0r8VhfUiLi6RQiFySZA
 sWnQ==
X-Gm-Message-State: AFq9FYJMuVGLbiXAgIeCa3oigIuqLBYO7kV1coOMzaWMDqYo4gcYUP4W
 u6LqjNxiKLqnSaB6oKS0bhMItaOY5GqJtZ2+mCln6Nu9EITclxG3wvVwzEg5ry1bpslE3z+HQ6F
 G8qUPrru12wb2+e1D5upK3HZhNJ5SB83L9PBuIUeZqhOYAPJdfbatuT/r6w==
X-Gm-Gg: AYBFou1ox4baAEFeY10n6uAmJivUqvOblhTgAQtfbSwHRoXXCvzA78yeHoqehzc9lP+
 u6x96cRLwSqm9ks/p3iNRziu+XOX04Zl4JkEs6+Gu9liONsrGG7iDJ+vF7/P3Bz6/xm1gWi3CEF
 WOTUco88TWEe3IgueLyCC1AKPx1X/CzwGB7QW5UTRKxgWfEc2r6e/i0XpGYLn23YMdxaXufWMWd
 EHhUv6+XkF+01cQ8AivA4pJo9MkOOXx4AvNxylPcm40Tf018FlXhVT9KD+RzkGNiL4JulB9R1ki
 qSlwrAGbY3/5UXaKiEqTL2KxNk+y5V7f/ILxanIXfdZOBbMxEzs1/cu8wOhv7jA6ShNYAuRL1Ge
 DjATntKKCieNYyJVsjGxMDZbFXwsV2EQ/qHjpuw==
X-Received: by 2002:ad4:5aa9:0:b0:91b:9694:d6b7 with SMTP id
 6a1803df08f44-91c3a870eaemr40014566d6.30.1792771776722; 
 Fri, 23 Oct 2026 09:09:36 -0700 (PDT)
X-Received: by 2002:ad4:5aa9:0:b0:91b:9694:d6b7 with SMTP id
 6a1803df08f44-91c3a870eaemr40014026d6.30.1792771776207; 
 Fri, 23 Oct 2026 09:09:36 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c4524f226sm5063406d6.27.2026.10.23.09.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 09:09:35 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 6/6] MAINTAINERS: add contact for the RISC-V server-ref machine
Date: Fri, 23 Oct 2026 13:09:13 -0300
Message-ID: <20261023160913.24992-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
References: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfX8QoF1pguhKN3
 EGsmCRsKqJVWL+bceWVG0cWuuuAr2Q9gMAvo7vhTNqHi7qMgZWIJ9r1uaqIpVH0c+vkFUueBjik
 hT6XufLqxgBB+sTjEHeRqLOh2G7S2p7TeRcgoKuG8nEQERvH76xFiLRtXIRE1bvIQM6zIGyRSOb
 UdlbMz6Qvy+cEB5mq+WFY5eKytAIwD7FgOv46ZwxPrtVNaCJiMYsxcLx2FhMRlvm9p+l/hPbwQ8
 t9/QYlxa67EpruxUniVdM6eHwoRVMPq1ttRjnfSsqDkTCO7GJ4ul8Yxu0s4/P3++96IxjmNg1sR
 YmxgPy1aFP8ukx34UtR5DuU+etK21+gdJtyo3BhDqceu/bV+k6jDDnJkkDwyisHDgYU4hEr6QHH
 d9QDI5kdMtDHgveWVdY4p6xfP4kz8R/MulQXSlehlR7yzH2TtXdApgoxKVDeIc8xpFEfJTHbBwk
 onOM1LS1qL+fMu09mgA==
X-Proofpoint-ORIG-GUID: Lob21_D3tFSXXn8nZ6lW-ylgtE7ca2Xn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfXy0tbI67FmIP1
 mmzeJgg9qmsYsw9ZbfLGiEI4pgt5CHV5jQ9q2iy5Po95SZaTPzJ7zmBSDHi/ZspgLgzdU32k9kX
 dAz9ghSkI87YT5DHzwHJDApHQmz9EBY=
X-Proofpoint-GUID: Lob21_D3tFSXXn8nZ6lW-ylgtE7ca2Xn
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb86c1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=69wJf7TsAAAA:8 a=MOatoMk4zhW8oBTF--8A:9 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230063
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Make it clearer that this is a board that is actively maintained.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d9209f043f..146bdb587b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1897,6 +1897,14 @@ F: include/hw/riscv/cv1800b.h
 F: tests/functional/riscv64/test_milkv_duo.py
 F: tests/qtest/milkv-duo-test.c
 
+RISC-V Server Reference Platform (riscv-server-ref) machines
+M: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
+L: qemu-riscv@nongnu.org
+S: Maintained
+F: docs/system/riscv/riscv-server-ref.rst
+F: hw/riscv/server_platform_ref.c
+F: tests/functional/riscv64/test_server_ref.py
+
 RX Machines
 -----------
 rx-gdbsim
-- 
2.43.0



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C95606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aNppQp43;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HR2neHyM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRTjW-0000eq-E3; Thu, 12 Nov 2026 07:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTj1-00082v-V9
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:22 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTj0-0002WJ-FW
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:19 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACAUWoR1629193
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=V1v4b/976D2
 ImNBHl+96m2amRGObR4ZYuZXr8rKD0lM=; b=aNppQp43FDUYFXHYZDYDpJwSAvM
 2N/CtpzuOkT3t5a8SoKH9IwWNVGdQT32mYn1IPKBEMkk/YFvCdjutrUR6hiRR9Vr
 e7DsQQ8tChTBOmUBYiXr6GJJVg2Jv1qkd2/OIAJBOEWs5k6gn4FqMIivFdkY+Ncp
 DIDpv8a50G4X7OkKKxyn764Cd11ik6qpTBqDpCyce0gPrIhXVS+PKCjBcr8EuTOD
 2dxTI5FKLdmxsI1iuP98zQ7L/aJWjnnaKeyJtVynSQ/ZCuxDIqRl38U6uz/3JRpn
 SoJZqw8/ExXGphYmAFeKpeiUgIMANOaR/PjYU8HUTzTV2GtTO4iqo4oM0sw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs00axd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-542fc619afaso55976641cf.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 04:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794485776; x=1795090576; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V1v4b/976D2ImNBHl+96m2amRGObR4ZYuZXr8rKD0lM=;
 b=HR2neHyMjREZOraGI9waD7Rk2K5SwC3vzibhM+SkNfzaISM/s3/EQ8ccYiQdABBJYC
 B57/RwVW1SIdA15QSg1+ADPulghFyDD5Tc/yrJVFe5wr21lJ7wAmMWju6a156yBOvujq
 lBdozlW3LSiqXxjd3cqHmMj8tAf9iRLc3+QBjZjxrr7YND3+ttwPCg2KD2tAfkeSb2Z+
 2EdAYYcmRtTqDYYjjKYTl/zyCWdKquLPZWeBR6553Rc8fprGRE0hJhoJx6c1/oPc4EHA
 C+MVBKmOARm+aB0dysXEXqazYxBq4thCNYAtNXNv57QBtodXYVfxcLaPpBIfrJGRTVEw
 79Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794485776; x=1795090576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=V1v4b/976D2ImNBHl+96m2amRGObR4ZYuZXr8rKD0lM=;
 b=Bqdq9f3oJ3hxAiK2LH2cLzxYVLXPhNHThNbDt5I5bg1krxKD08g0ZCQcGEfqLZwWvK
 j5YW+FESb06DMKVsx443zz5AqvAWV1V64z6EPr+QfIXiFZjQtDETm4oBVYRkXhXEmNoq
 30J4L54tZcHFx3XN8yDmOlLgqHWphIHmofbE8zDOYWx+SqIcXrtMOrvGR5B7v7IoOr02
 TAL49XHadFFDmDDsf6CSp2aFWtAexwdqbA4+GcyK03+EYIhzPUkSGw11bMj/CHYehpyF
 pEThdLIc+qqvo0YWvyXYR1tFTDPKB7wJonskqz9/IpIGQxevy/D4OdypGzj7uEyzdUhB
 VmXQ==
X-Gm-Message-State: APuU4Z8prbQ/Hw7phxyGqHQ8o/I1p9/J2wd1384e+YrORh4Sq6ncrarM
 AHhZoeYsUFnR6XcZNa7la8XUiVgCWBkOANZPEfpIPBxDxAl9ps1vdy0ml3kh3bknfFfOYwxKUEu
 a6mZimFsKFGA7kUVM4DnRbauGIAlbmSd8+7C0TgSlbhXjjLblGnqipOXWig==
X-Gm-Gg: AYBFou0vd7PF7bjt/Zhi8H+oyWlhAdOHj+gE1YdOrzt7HFYGbeSd5EO+VbzbEiWfRPc
 a/2W9RJHl4HQb2ry+jPpNSk8AeWtqZ0BNM5hSy/wH57ObqkFYvfoEwjVqYDxtkksNFcqHWdaaTQ
 xTQT68C9RmMWPFFIm+QeRMtiS0uleWXhJdRYaRCPXYM4AFSNEyuBGcNK6UoC0iYTgH6prZc4zvn
 adqTOifBFgh7jMHbBd762fxV0waJPIhtFqrVnhDHo+G9OuRW9ZIlI5mjCTmZu9yh9OXIRAEiekq
 Eo0eqex7ze/C5ThJh9ZpJN+kRJCvh7dH4Q87z+i5hN6JU/W8GQfkYICXqKnkReezu15MZGP4Y+r
 eK9+OhFjXEdgUdSqqiK5hLosziH0w7dHAEcofvhe5ELVeFa73pbWQ6i3Tw8Bk0f0JtqsrzAjf5+
 GfODOH36D6lYyV6p+gh2RvveNFC4s8Q2uFKH0r+68Fj4z7
X-Received: by 2002:a05:622a:a13:b0:533:8bf0:e6 with SMTP id
 d75a77b69052e-556c06e354amr83624871cf.35.1794485776449; 
 Thu, 12 Nov 2026 04:16:16 -0800 (PST)
X-Received: by 2002:a05:622a:a13:b0:533:8bf0:e6 with SMTP id
 d75a77b69052e-556c06e354amr83624471cf.35.1794485775904; 
 Thu, 12 Nov 2026 04:16:15 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550af6096asm73538651cf.5.2026.11.12.04.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 04:16:14 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 5/5] MAINTAINERS: add contact for the RISC-V server-ref
 machine
Date: Thu, 12 Nov 2026 09:15:53 -0300
Message-ID: <20261112121553.485439-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112121553.485439-1-daniel.barboza@oss.qualcomm.com>
References: <20261112121553.485439-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX1gqL+b8kf2T2
 BKRm5GQ4uaq33LFltLbpN/v4aM71kDfenNQlFddO3k172iWZUg4aOIIYkGgKKPId5Z7FK99L5Wi
 Sy1UGB/3R+w1nDEVg7r0dVF5h6Bb0Jcc3UeSQ7om/vFfOaf+AZ1vcf2FEjaGBTWsDr5ImueTv1X
 LtzClj5slL78lwl4QpB0y3GkmxVXDFc9Q/w4RpcVQPvB0Uq7BpF0RtjoqvkoWidQ6SrzAWr/e6/
 B3qqEZDqlq86L8DAH8CecQ9I9mgvDi9QymOqixQhtWRAju1lDdckFdTB36saEsFyoZVcyq3oqb9
 i2Do72CQNFLjs52D3Sk5czko/7bD2bbgX1MGizIzqW8+H8XRcKQOIDQCNzMGfh+Zj/ugN1AX2dz
 9i0BmSMO5IiD03/gXYt+w4Wd84B4pSVVm5xLUd9C9ZCoTxl7wZ2kWx4gKZwVkyB9W0CqJ2aW6oA
 ximAn/HAawp7ND5ahHw==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5ae11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FRSEYCzRAAAA:8 a=JF9118EUAAAA:8 a=69wJf7TsAAAA:8 a=MOatoMk4zhW8oBTF--8A:9
 a=dawVfQjAaf238kedN5IG:22 a=H4N_Y-AU75W7NKDNhZlT:22 a=xVlTc564ipvMDusKsbsT:22
 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX4Y5N81/Fe3hf
 Xy0JrYvvQ/ntltK4gL2CNqLUtBma7W1jwuZTvEZ/jnoehxnzlqSjZeFDr5mgUbB07b4DmeAoKGp
 udB6Xu3EP4xpsGgU4e5286PiNCUjd5A=
X-Proofpoint-GUID: H9zVwRo2tfA615DQYxiDpuwXOxEP1guD
X-Proofpoint-ORIG-GUID: H9zVwRo2tfA615DQYxiDpuwXOxEP1guD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120048
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa0c6d0c9b..9a3f8eb8a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1913,6 +1913,14 @@ F: include/hw/riscv/cv1800b.h
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



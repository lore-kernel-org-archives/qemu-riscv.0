Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8AC60A2607
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlq1FFQz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tlah6DjO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTxRO-0004Dw-0c; Thu, 19 Nov 2026 03:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTxRJ-0004CR-DL
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:24:17 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTxRH-0001u3-KW
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:24:16 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJ6vEGt2935539
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 08:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hv0gCW5owmh
 PA76Wzy1UA8RIz97Ep0lDMq0mGjAflXA=; b=nlq1FFQzTLlT4uXPrSdLPD2H8Xx
 /HLNBtFmKZiMuY6+ve4/D71R4UNUe+MGjGNFX2iIMkelysqdO6ZNletgapMTAADf
 YlBvJp+g0yH0HYt2r5BwFD4ru5I4X2bP5sJuPdj8yIQhYcGXDXdtTbRUORxw+fNP
 fQCsG8z+3YIK37PsIJqiMUQb34YMtpNWFtDzJHZVwqkepywZs6QnLiBUmUcYmF9P
 wkJful7YpD9P6heqr1JJv+jkpScXi3nvYETVaUSgX0pJICv68mWOLdxDGAMhnB1H
 +ZJXQFbLvkm5yxqUd9JoS8oJSLUqS4Wobtfs2DZ8jEQ33mPGO8SNx2k1QrQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekc85-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 08:24:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-92111028a03so36918016d6.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 00:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795076653; x=1795681453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hv0gCW5owmhPA76Wzy1UA8RIz97Ep0lDMq0mGjAflXA=;
 b=Tlah6DjOyGYffLw8TRW2zRm1pDzUs1C/9WNCY6ExpCalHF7ZvJ+jZQO2qexDjnqEp+
 q3+mG4J/XCsvFZGmeKfigyLdNDBoLO/g8znF9HXF9mKwne395siQN2GceuSmDoDFngk5
 9jmFQ2er4HfuuU0tZ4RjXnxYVyNt/LmtL+vPJvPMdmpeWFYEJf5GmdnwZqtSzY1qkWqZ
 +vlfcRPnk/amc7WD4pvynk0oGYsn20/gy9bIGaq3EM4gbP5CluCNvtNbK296ZxIgxAS1
 nX8ldQeUVZP1w9hUmsmXfo4/DO77ic0Qjia/fHoH65boIvMyxooaaxj1/h8F+gOnLAid
 3WZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795076653; x=1795681453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hv0gCW5owmhPA76Wzy1UA8RIz97Ep0lDMq0mGjAflXA=;
 b=vZ0FlGyo6IXwypexGYHDHj9zqLqnuKbn4W9pVS7GBlUPPS/R/r5Q/kwGDZgBRsc46n
 eB76730KCbIAXLMpZ9FkE5vZEjiFvXO2pmN8+J8voSiOh50FKsbW4ciyxLAtVZoyfXNw
 3aTlQgaq75yEJ9yKCtNjEfF9Rfx25COdBYJto4yTd36W0fAcKompDHdBdNPrh1X+ChdA
 zQdJX3/b/wiXa9JHK1pad3KeVERlJr9bEXNVap2+zY+Dkwxon3qQirSkL1qJDx2mpeQ5
 RsB2f0lsTFMCUJq7MXcCCGwqrWh9DCaUr9xtF45m3LlAQp01sHpVQjzbf4HsJ+iUmNqS
 AbTA==
X-Gm-Message-State: APuU4Z/U1f/6nykjDbfT7CjbQfcA//JToaCduD5cJozUBbfA0FdSN7y3
 PbCbliB8erVN07L6OSogshfl/dUjqqhX/yqRPSTC2u2eP+pfAn2QAjlwKN/K5fMO6IQmUbvxpVP
 8n/kGQJl+/75GS9OYEUTRGps4FTDD5nEbKemLrCP0pNdVVXi7MWLnCIq11A==
X-Gm-Gg: AZFdTZdxZTbfhiO22JNL+F43gWn3XgqN7DS7iCTUK/v4JdEFqWx75C+8a32AyoM8M28
 dNNM0NiMI5T+oXzAIQrJHCJlJUclEPfgIfDTv8fsJXdr+a8pgQdO1NM90J1cFMA/Qo/adJK9VXh
 5/1hLbG+BmFwOZ6Kl1ktO2zavnDEC5Rs6WNySYrHkZm6s1qhPWkNWNcT4A5dH3uN616212NvY8X
 9YVNFI8eHTwPrMargQAjuUkQ1lHGhOUeZODKkK3rf+z1Nl29lziJtT8dvEPgtYc9fw+jmK7NxoZ
 AauW9UJiXxMTqMXuJFl6hypNfefVNANbNKqG782QmPzAw6Pahj/esKLEdpiCYKzV7yEsMP37r0X
 IYGC52ZdKXVGwKrtF0Om4+OJYKmRLa5JzqTNocG4YVrmmoh4kwgattOdIXC6+C5NA+mRco/cCts
 8exD2kJX1V
X-Received: by 2002:a05:6214:4016:b0:91e:ef31:77c3 with SMTP id
 6a1803df08f44-92114f18bf8mr79922226d6.31.1795076652949; 
 Thu, 19 Nov 2026 00:24:12 -0800 (PST)
X-Received: by 2002:a05:6214:4016:b0:91e:ef31:77c3 with SMTP id
 6a1803df08f44-92114f18bf8mr79921936d6.31.1795076652442; 
 Thu, 19 Nov 2026 00:24:12 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([179.193.8.137])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9211a6318aesm34524136d6.39.2026.11.19.00.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 00:24:11 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v3 5/5] MAINTAINERS: add contact for the RISC-V server-ref
 machine
Date: Thu, 19 Nov 2026 05:23:55 -0300
Message-ID: <20261119082356.1264726-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119082356.1264726-1-daniel.barboza@oss.qualcomm.com>
References: <20261119082356.1264726-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX+6hKwQDvuXRL
 WPSpFfHwIRiut0RQwr7i6x/WYB4ma3j/ny2bDp2EfaoSYYkyfGMuxl/zlmvcGA8pngowioYMBxj
 xzKMQqxbWz8gfcuehX5D/5eJFEGQpDLpkAaYGvjCPiT8OfEaDtOCX+iMdsG3yJ1F//H7C/aarCW
 V3XAOSkzOje1wE9xecmGSLHqmfOYkjw5sPjWqzOH+Rwljwz8rfio3DBYz8cF6yizgT+JQoNFR69
 IvqhZr619fm/UXC+M4yis59859gZPIHUaorwWpsIxziM7/RM6CcUsjr0vM+SbmFy/887adhdZq8
 GkhI6KWtnQpppCbk4bezU9nxi9BbvOoznEP3DTaIOsNwF10FPPca73g1miNbHFs33ZkQQ6kQbJP
 4NXbGrE4bpgtx87d66sM4YM0TLepPCuIF+l4TPEnFEB7DOw3DX/Qe5FMCUoLj2JzrazQo442Y/O
 wpHYV8+lqK8QVEebD7g==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afeb22e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=a6tGUzlCxnQfwxx7nGpYxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FRSEYCzRAAAA:8 a=JF9118EUAAAA:8 a=69wJf7TsAAAA:8 a=MOatoMk4zhW8oBTF--8A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=H4N_Y-AU75W7NKDNhZlT:22 a=xVlTc564ipvMDusKsbsT:22
 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: 6SZQkDhvR4xIyb7RjfEjudcBDdYgKpN2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3Y2KxXNiU/Sa
 CNGk7Ikrc4dE67pI98RbgwW93acaCLAgXDAst9syMcxkEatADGSgHfmYPTsZHDcHQUr69jAa8CX
 odm3g5KfaN9ADUAuPUzZaWui7zxR5U0=
X-Proofpoint-GUID: 6SZQkDhvR4xIyb7RjfEjudcBDdYgKpN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033
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
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15942aaba3..ba026ded6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1914,6 +1914,14 @@ F: include/hw/riscv/cv1800b.h
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



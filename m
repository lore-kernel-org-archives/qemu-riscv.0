Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3096B606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dUiDkfUD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6Y50l0H
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOx1s-0007on-4X; Thu, 05 Nov 2026 07:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwzP-0004mM-29
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:54:48 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwzM-0005w3-89
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:54:46 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tehv1028357
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q1+PZ9TlhscobZjeFY3tiHwZEPcW3uLOVSsV7DZ4XJw=; b=dUiDkfUD4c2ZxmgK
 GZ4m150wadnsTEPZXOQh0XGW+nxDNwPWpaQlsBsfNNILyzfZEWBvHoH064ggUyie
 o5tMncjrFPc7/cFL0iW7KeFAzJUiOj3SVuQw878bWCFqvIb2p8jK/bGevQWo41b6
 f66XITEtga2XBT46AJ1agQh7u+/sX+GFP/qeqhuHDFq7Qzi+YCS0c2kJ8qT32kI+
 3g+lVRRHIAMtGfoQ78/sZ7yPjqLTgLmuQrNwvxsEs7Tweu83KwtzbbJfKmBDoRYD
 XpzTpwxCxEWVBMonDvLrfMpKQYPSTYiDX/yvYwjDmTVghEb3LUnwQxCvAl/nRy01
 DKAaAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9uta-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:54:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-944101e6367so123828485a.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883272; x=1794488072; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=q1+PZ9TlhscobZjeFY3tiHwZEPcW3uLOVSsV7DZ4XJw=;
 b=A6Y50l0HIg6l9ORe0aZ0hCOLGb+kg/jfOVOXwg8JxrEree+XqnAoziLkX58L3I/cwk
 oLc3G+5F7Q6afpfZ5JieL7xuyLACAc7jY49VoI2rZXwi87KE/WoJGsd2yWRWlp139QrD
 lZ1kc2FbTec4Seu9qnHPbg8AMBnuk8HWVKna7RW8EvbBEtgkuP8sShGzYjDPU594Fn/m
 3B4hWR7WtzYLEUFI49Klm4ZVbiGX+sZv9eIeAbMyCFq/+LVmuNd3kCUyuoGC+hIYBeWa
 aIxanjaNiBZUQUe5noWMRKgFVvceKZUmAIGJeB6XOOQW83lTJBMEFYnHGSef283SS4Hi
 PJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883272; x=1794488072;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=q1+PZ9TlhscobZjeFY3tiHwZEPcW3uLOVSsV7DZ4XJw=;
 b=sHlmXA07aUS3iW8fxsbCWCmquz9gTlN1Wo6yVItOBauE8V5BXqa+TDKPomki2LXFiU
 h+eV/jKP1U4G4xcoDR25S7uOUkAJZ1wm4L8GhXcCm95pOatA7Beck0K/roC56TanCX6c
 iFW/9DPY9eCyVtZmgaqzoqOPCk4HoubkwIt3i7Ovqwl6QrVV9iWoSZ/8xg+I7XZaOtOm
 wFkhpTvYpnEvya9yLxGDmGgGCqO/H/AYm1cQXs2BBZfXUR54zq7wWueg1AYMaJHCatoY
 vo88MMrortEbqboSsRyB3xvg0ulDp9qzVjkKZWTyP+qAXRTUj49pVw3nuipHJOI86jle
 zV9g==
X-Gm-Message-State: APuU4Z/jRmXU5igKWoaGIGuIheQvo6oMLP94xSA2OUr6bXb7caOa5DEN
 XiD5XpPfFVxWSzmO0AvC8xNH98fQgARZgDJdLMJ361necFAoFwXUbLXPdTDd30C/aVdgV5g2pz9
 O7bOz9bx+s3c9Ojvj2IX0v2h7ghMsy1J5ocC3DjowbCn+qggQ03qymr9ZDA==
X-Gm-Gg: AYBFou0mQeBqAFW7Dz0rNuSYOQfPLD+VW/KkF5AcH3g44DW39sZEbYcVqcmp6TkMqUi
 WvEbrtHPct7nIkKCpgY0uNZt1xOK5zgskLcKOnioUHzxssS+w3iponhi8xoUp5wlaFQl70yOh/V
 faSfQ0buMd5uYbtm1Ywk3WZ/JguaccfSgPxMVv6X0KdtdrzeeCVeaPMTf9B4+l7E03AVyaYGqgM
 kaqC6lGVhrUziQQ7cdRrNrrk86ccu43LJqCBItxJ6pZoKEaME8AgUOScof/kajskgOz6+jZJ65m
 4yBMuLywkHu8angQFoLPdjR9cTKInsVm82CpkoP6fpxF6OmJCBeKyBcLiqD5pvLNfottyJqYl/o
 6EYG/ajCT/7EYgymCL84FpdzIZrxZIdVkL4rwRyrlhmMh6F4cyxdNQ5CVHXpX8rQU95PLRycciC
 orP7lNQFtBRQY102WqvrTOqFKinGFklw==
X-Received: by 2002:a05:620a:6085:b0:93f:22af:ccdc with SMTP id
 af79cd13be357-945e159682fmr374300785a.4.1793883272148; 
 Thu, 05 Nov 2026 04:54:32 -0800 (PST)
X-Received: by 2002:a05:620a:6085:b0:93f:22af:ccdc with SMTP id
 af79cd13be357-945e159682fmr374297985a.4.1793883271704; 
 Thu, 05 Nov 2026 04:54:31 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b577ed823asm754033a12.21.2026.11.05.04.54.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:54:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Subject: [PATCH v2 15/17] target/rx: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:52:00 +0100
Message-ID: <20261105125203.40320-16-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WNPcIGexA6Zmst0aA3PdEb9ep176bMdd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX7rsr6ItBovau
 DpDhN3xBTIgYKYAkb3T52d/OmXc0n3Gxv4R2XCN1E987oxuIupTBVm9qV7d57zZkH7FrwkNV4b9
 rXC1Lx/22FO0DUC8xlC5ayAtTTZ0OPA=
X-Proofpoint-ORIG-GUID: WNPcIGexA6Zmst0aA3PdEb9ep176bMdd
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec7c88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=emZr8bwPc9v7Of-wci8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXyZy+7ExtMPpK
 5JqLfpeclyskbR7vaGraS4/Sil9CDg/4l6oXpzTmSXDW7nrb39E9aHTOe5XaAwP82c3FTWYuxsx
 4vEoHSYuHvti1xKzymMtAiuv0oHOONfqaV0/nC8CKtmnsrcNrOLW0T/ifnDsxcPSo5HoNysDSaT
 SzVHCyCK1S1MePGm7K2HR4TXdhLG4sWSpD3G7hL9NVpZMO4V7W0CeZvKW9IGbT6Bl2axNC+goPl
 Q0riromquZhw+h8Y/wVxtXk0GhtS5gI8ReeKvekHoIpuq6uCUpOJhdjfUfRsl2Gtvpp7E394Jx/
 8t5Sz/Esv5q/nFsRkl84YumKjX0zBMoGjQ2Uw0e/qENoqx8rBZPZQ0369MYwGWlRvlOnc2vSe2r
 V/7APf7ScgKydr/37Rx0PXUm3XszTK4Z577YmWsicBvsKGUAi0pzVqTfWnIGbE4Rt/HKy/IPuEz
 S2x4Zdfed2/vDfDQ1Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to format dissassembly
index, silencing -Wdeprecated-declarations produced by Apple
clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/rx/disas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/rx/disas.c b/target/rx/disas.c
index 0eb2ee6f4507..2a67ecfd2fa3 100644
--- a/target/rx/disas.c
+++ b/target/rx/disas.c
@@ -167,7 +167,7 @@ static void rx_index_addr(DisasContext *ctx, char out[8], int ld, int mi)
         g_assert_not_reached();
     }
 
-    sprintf(out, "%u", dsp << (mi < 3 ? mi : 4 - mi));
+    snprintf(out, 8, "%u", dsp << (mi < 3 ? mi : 4 - mi));
 }
 
 static void prt_ldmi(DisasContext *ctx, const char *insn,
-- 
2.55.0



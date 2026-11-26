Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4749606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WjI9q8s+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H6/3+bys
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj31-00005Z-6i; Thu, 26 Nov 2026 18:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2a-0006QI-2A
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:38:13 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj2Y-0000xr-HK
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:38:11 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJw8rX3990015
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7kt79fvDhIa2kukOary4enRgWJaprasUUJIC1+U8yBE=; b=WjI9q8s+dCV3GpmR
 3r8yNAnUL2GajNE4XwQFsQ/TGHlw0pGhrypxmMm+fpNTQBFX3M124l/T+uGRDTCn
 TZzzLQOc5Gu3pTuejeObYKnGAndlofVV5b91KUN6xYiNlp940isTmH8TQtEtdTqv
 RUqHhL1mrZFMFzgHJL3eCv6pSrW1hDP5OPwXWD0HSsfqt8Sw9Q+94YArMi38g0IE
 I0xv4F+k5vkOVYPJpPV9r75qwuj9uZduUEpTyrgjFg2L6p1KiUEJxR6cEdW+f/EO
 KXe29jsZrcgb+X2jXb18jByqEWftIjUE7sAVXPrzm1tQOGcBEXuNTHWVTnkVkR9R
 z1495g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak042sv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9495dd0f07eso1291909585a.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736279; x=1796341079; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7kt79fvDhIa2kukOary4enRgWJaprasUUJIC1+U8yBE=;
 b=H6/3+bysyNMySqVEHGrX1AnciBVip/bwTtV0EqnP5SkY+wNNfJ3xUIjlI+pZ0Cxhuw
 VF9p8SBgae+n6p9GzhDxlQ9ZoZ8rhsbjmXA3OQ1uuHh36lLJSub/P/aw504BX8uNGCLW
 T6gSZl0R55dNM/OWKIfmspS9XdEcGAPt4haG9SunDNLDxIh7kiMPG+YMvrMqbz8I+EvS
 FcAtdX1W3LZqASNyX8Uf/rNnZwcLF6V7bI2d7mOoO+GpaHKOyGZ1MSaXZLp7CMaT8UAC
 l5AZJzAJFzDWz28Smz0BkNvnoD3e8zbgk51b2cEe2U4CeDZDnWx3/xeXZhe+a0N/xSYt
 ebMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736279; x=1796341079;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7kt79fvDhIa2kukOary4enRgWJaprasUUJIC1+U8yBE=;
 b=DrlRA35uECZfxLff1EEM7j57LslZQPZkIMaGro6at4IrHFhAvI3TzUdRazURBppELb
 QwZAKbEDVjp6av9vT74YjjKu5KBSMrCQ9YZxn/2i2ktAOgOnZWCPH8Ae4hRkIvPvhIt9
 9t8MRRURxqZmEbSB7yL1SgQLS0JJDDi3bNeGwEr2Bqa9NhX2MU4L1BH9pqAdKV0kThKK
 hpgjgXrz+yRqiKuoeWVyG5gJrtncRXMnZsBPHalbCRnzd2jjsfjsrTLV+cs7HMNekFK7
 EVMR1zZYRuvtuTvrMJWEJu9VIA6C1khuxnnCBhXUwhTcWjK9T+ZmaQGq9l2I/WO5a3RN
 XNoQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHvHOjF3iU2F74c0nodxX2CQFfFyn8ZzAuDRcfR1b05IlCygFD6oWxn02twGwXWnzBSSWQvz344FuzX@nongnu.org
X-Gm-Message-State: APuU4Z9RxvugRFYmhXQG9cDUss3N4OKzW3mphG5vXf2uJA+fV2HizPNt
 +Y97fHUiAJhkvSkor66LM3lLMriCZgL8rzTzEt8g0nF3UV6W54folY4NIr13heOmj1kZ/x4yFSQ
 HFBremwB+OafFdkGck3Pn1aMoVP6VfTXyeNiefvGLuhIOy0TA3OiRUSsxmvYJVHjvvQ==
X-Gm-Gg: AZFdTZerE8BfV69xXpy+iLX2YE9JJ89xp3vVsvkZBev8f7cl4BSHrXw3CR8fsjqpD9F
 xbk9qjznXLZE3ftG7OIXsikCOr4KNr0Hmr0TGD3JMempH4WwtnvQnpOT5ttn/8Xxx8UFcjoZ8XQ
 dLkm5/W9yM1/1TZ5B3LiGQ2haglMzAUpKc+PYMdRQEE5HGn/4Yd0Edqax011aNwwjo+CInTVL5H
 wcr5CC2PVY5qiYfk/+COL1xDy0VGFWmnLLEeIByGG5R7HGE7exY30lWGPCGrbDW1sGm87w8w6BK
 2+sbAw+TlMSNGFV/bzvUrD9wGCMN/5sojUyDtgScZT6YHD31u81GY6Db+ijdUkKalcm0s/R1tza
 HUe2xpTxbkvHAohPrkQJ9lluFPQ/v4uaUvKEpJh3aCkNawOyIgTHSCbXl/haCNSod9KtKJBUzVt
 5+FBpVZKQ/9aq4aw==
X-Received: by 2002:a05:620a:6f02:b0:93b:bc51:b40 with SMTP id
 af79cd13be357-949ba84ac50mr3784226285a.2.1795736278985; 
 Thu, 26 Nov 2026 15:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:6f02:b0:93b:bc51:b40 with SMTP id
 af79cd13be357-949ba84ac50mr3784223885a.2.1795736278558; 
 Thu, 26 Nov 2026 15:37:58 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b9add26sm43951183f8f.44.2026.11.26.15.37.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:37:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 14/24] target/or1k: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:52 +0100
Message-ID: <20261126233604.67722-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b08c2d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=M-hA8jIEZbjr0ZWk8n8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: aGklB0DTspL6nEU7fSh-y-ERJ3ufsplJ
X-Proofpoint-GUID: aGklB0DTspL6nEU7fSh-y-ERJ3ufsplJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX686BJpt5h22D
 Z3LBQAiqvnFnzuSO2KauH2/zgSccxMvTzlHla87l/hHAcB0pL82wqLqQKU9BahHXTKwqKZnwAD2
 9QQj3tnzjJSEOZayoJV8bpbJS/8Xg6Rjf00nsoV1Ou4fqpOwbZAKn6GrRzXZugYmiSLohyxOlJP
 hybRr0ZdbkUaUtRsDnAoTOF1fa+Dii4JtfpWbFh6f+NbLl1XD3wifxJvfDSSzJWsAyV0cNQ5jub
 VBS1kuJEPfZaWeGLi/KFIJJlvsTajBTUckzUh2/4NVWkMPkx4rFPV1dvY/vY5v8aITCREGZjTkb
 9vFe09VIIMcw11QBvk2+a0IoQ5tIiASTlTF3I4LhgcB8lwXg23bGn+G4ev13P6x+aWyRxIeomIE
 hyhHhALzYjwkp4G4Si9GtsDRYWS8WRwHumLqiQYsO4gd92gkqOHtSwqMT9wrTUQAwhsiVh/KIUn
 JPMJPh1c2rIO2AbLXYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX7/7jZhQB0ajf
 cu/3gkRltg7LNYIC4GJzp3tS4wXt/zROh3uMmlLXhck+MCTjXgdV1QAbQIdK2ijuG1zVB3q2B3c
 javIYWfu/d9Yp0kGX+qcYRMtF9//z4g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/or1k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/or1k/translate.c b/target/or1k/translate.c
index e00ef45b9b76..e656301642d8 100644
--- a/target/or1k/translate.c
+++ b/target/or1k/translate.c
@@ -45,7 +45,7 @@
 typedef struct DisasContext {
     DisasContextBase base;
     uint32_t mem_idx;
-    uint32_t tb_flags;
+    uint64_t tb_flags;
     uint32_t delayed_branch;
     uint32_t cpucfgr;
     uint32_t avr;
-- 
2.55.0



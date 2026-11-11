Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612C606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cWyzuiZK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yvqdmep4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR2Pe-0006CA-Fu; Wed, 11 Nov 2026 02:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2PN-00062E-Dp
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 02:06:14 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2PL-00029P-Tv
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 02:06:13 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5K9nB1408976
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 07:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=79HMMearkZU
 SoJ9WoAI6N2QEB6zq6p8A7J7HDAqWuTw=; b=cWyzuiZKbezV99U56mgATvvNynx
 Z+lAcHCDEMIjch9iijWsUaalYXRqaqvgjx2C6zZVvYrOUlwtrDt1or5rkwBgMpqO
 J81lznBwt6qh0oJhVU7eTaZ9rQeNVuGlVSzTTLpxWe4S7JqJpKMMcpSq8ZpZwxc2
 pNia2gvKcoO2Pv8TvPTeZqv7DN00QslI4FSogzNE3eTU6kCWyEKe9foTvgucex3r
 cpgGJjULmidHz3wnYhVspR95AkdLGI3DcqusdkCJjAwE0PZTVkkeo6woB4PD2Xjz
 VAkvfsrsy4hF53QO4DWUzwEhJiSPqAPlQRxmhibyoNdnJAXnLZQUC7PFDcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdgpfb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 07:06:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-945b0154705so439463985a.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 23:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794380769; x=1794985569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=79HMMearkZUSoJ9WoAI6N2QEB6zq6p8A7J7HDAqWuTw=;
 b=Yvqdmep4iO2luoDORUxMgpasqjohdp4X1kUp4xsX0nKop3mGlCEXBPhZRRgumXgpS6
 htIOSNxLhjPD5hxQ6goIWP+iCs4R4A5whzjJN/eRgVKXx4poycMSplYLuEXRUgaWe20k
 vM2a3trbev7K9UyA5RoW6CGTE2J/rx+hDmLWGyNNQRp6vjxKKhYZ8YsAR+c7LtBCa4C9
 +cNhhx6WUK5/5l/7SU88V2kIWgAuhH4sUOEu04yCiIrQsuKqd36IIBYPB0aVegyv6b1x
 tWCoJwY5KryVmyfFJ7mDKfpjykY9oRxil2IZuGboKPYZyEM8imxSuj86GTfvld5J06Mz
 2bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794380769; x=1794985569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=79HMMearkZUSoJ9WoAI6N2QEB6zq6p8A7J7HDAqWuTw=;
 b=Gv3NPVJTshgFIHgvb35cwjce5BMm47GY+UbaeFY/rgb178MHO4SA1azP43UhM7FfG0
 F+ceGn5EQ850I6IdG9Ot1xpMixN4k0Bi9tsnUaR9pP0wnWfNjtUBBeGa7+dRUApIMkzr
 G0Zcqwc7BOdVLoYV6iopoAhKusKwuKkjUwnuDqkiuR1EAPFCj+oEgUvx3DrXH0P2t8+w
 YzyQcnmHhD1cHjFa0rPfm1DnwFZPDHleodS3Xc3fk91axLRsZLgi3JB69nurKnRomCLN
 e7KMX6pWl0NG9PzGS+J6jv6jlHnYPVSLe3RFby4hsbp3C+D96AfwZGC5LdI5lwSU5+iV
 qvOA==
X-Gm-Message-State: APuU4Z+9NO9BgLOsQEaNOuh4eUFRCl7e4gLnnHNpR6fNqwQrAVSHaQG9
 aNB38xs2kfdvOfbzW7krvGVCccOHgiq0r8nCQd6ejfGd681mWxfgBnXYVDDChsaoVHzT+/0Lpwj
 1KWW9WosDfuQ2UFcoDnKz2sxD24ZiE5Yn7cfAu0bBW020bWsiIibwbhyrlg==
X-Gm-Gg: AYBFou0N66+/TzgOPq5cEWBC2EtyHx0i3Yr3Bx0lZnkqwd5L2s+MBPh36QKgcitjuPY
 zH0yHXB3xzt1rEBmWy4tj4/gJO9pnQioiyrx2JUGqPSbnT1NPOii6PDh93+nz2DdVLVOII4y/P3
 5FF5Niuc6RmrqCtN+BRVAFIyhVN9kxZg6lAR0Q3XtNsc6HVvDmKWWMIr0kyc3VLr+OTxHbU0N1H
 Gd40Jo+IcreW6LVkkNbkfl8NftaK7Q9OexkvO7U6WKe0cUtJkCtkSGUFl23oYGwgh4mbze4RF1P
 ZvvVHEXp7Em7uqOd9YGNEqCX5C8LztatlbpQ+1P3DeY4bdOkXGHBqBZglbYQSdgH9pWMLoDXR3m
 PYTwNJxnhgQfV2MBnCtCwNoj2ya7oQWEjavORQBM0f5/8+R6Fl9ZUID8sfFlDvyAkCZoP/hTUGr
 ynYcUzX2lli48=
X-Received: by 2002:a05:620a:2628:b0:944:192:85ef with SMTP id
 af79cd13be357-947afff4786mr239273385a.22.1794380769428; 
 Tue, 10 Nov 2026 23:06:09 -0800 (PST)
X-Received: by 2002:a05:620a:2628:b0:944:192:85ef with SMTP id
 af79cd13be357-947afff4786mr239268385a.22.1794380768831; 
 Tue, 10 Nov 2026 23:06:08 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e4fa312sm419911385a.0.2026.11.10.23.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 23:06:07 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 1/1] target/riscv/tcg: clear itrigger_enabled during
 trigger_reset_hold()
Date: Wed, 11 Nov 2026 04:06:00 -0300
Message-ID: <20261111070600.169519-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111070600.169519-1-daniel.barboza@oss.qualcomm.com>
References: <20261111070600.169519-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af413e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zcreZ36wYqc89bCkXXAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: SS9zP-xi9v81h_UzA2YdtYV9QzEp8pHO
X-Proofpoint-GUID: SS9zP-xi9v81h_UzA2YdtYV9QzEp8pHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX9USWYNar5ZbD
 f1r9GXZkyJN/yBO3UWnPZH0j69J1Jy9jzjqOG/Br33N3xIQlqY5GJjJvckyC6WtZuzA0shoM9r/
 Lpm2xYyA2Ph1pMJsw32G+3kKjNmYSFtgDNUSgnKdOP4tbuQZ6x/JUaHYSVDTp1OKvi2TnW5Zefy
 9i2wjPjUV5R4aTB7jTAI8zAelNNfAJzG3mpn/+7XS18OQ3D6HjjuXH76Kwsb69Pdnc/xIXegNUy
 OwKQH7I5Sdvldm1rE15QgZ81km/KgwCY0X0g6h5UQqClbKpM1pfCl648ym1MwS8/eXo07xHTcTh
 SkKrEt4Cf591+mqIcCbVd4NijUPupdXy0S19jsBPtsDGtJSASCgJDtY5qsDUQbbh72EY3tGnuMz
 m6mMvnOT73+HBI/OLKYV0x9kcCsmzBMzUz/++13GOU/ikPzcsS58pC/YN/fEBnlwyOaFtqXlGmI
 //YlGIhnuS1wNMUXsFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX0+iyiYHEvjCK
 Sg1RmMSKGUlobuuakiejcVetGuEu4s0nUQ2wVelQMPoJ1CHpjo3iM4s1mkfoJ5/J3JmddR9dmcL
 zTIr1sehJjXZP9XEZmPrcY3JWl9x/Uw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110028
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

We're leaving env->itrigger_enabled untouched during reset() while at
the same time resetting triggers to AD_MATCH (type 2).

So, in case we reset the CPU during an itrigger session, translation
code will enter itrigger_match helper every time (via ctx->itrigger),
and the helper will do nothing since there's no type 3 triggers set.
And we'll keep doing that until something else clears
env->itrigger_enabled.  This is a niche case that it's a bit hard to hit
but it will cost a bit of performance for no good reason.

Found while reviewing an itrigger related patch.

Fixes: 577f02869488 ("target/riscv: Add itrigger_enabled field to CPURISCVState").
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 8b58cbd07a..988bc815d7 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -1213,4 +1213,5 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
     }
 
     env->mcontext = 0;
+    env->itrigger_enabled = false;
 }
-- 
2.43.0



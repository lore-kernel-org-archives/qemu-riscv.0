Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494DBC5DF70
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 05:43:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwCbs-0004lv-JD; Tue, 18 Aug 2026 01:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwCbq-0004lF-QY
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 01:43:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwCbp-0002r1-8P
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 01:43:38 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67I28XXV2884818
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 05:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TttcRSLZk+O3OIsj9rr4FBxM32n0SMvVk+0cYAoJbNk=; b=YfWxjHURQ7mXZRyl
 vdTS/kSqjVzl0BXZKitHOzHJVcSGeKYxniZMuF4W3SfVhLNKieyfiXiTM5f1D/WS
 PGsb2Id5M9RyIZnehJ4+9NLmaY3BWfZdcDIVnOh2zC1y4g40SCMr/YRIoHt/ceTM
 thMl6lYWY6/sTFazOzJQcdKhb3AM9Ab3y6KyMgDrgzMVapchh91bNqbHNj9Svjwf
 GvGgHr8e2qtPo06mhFo+631OHheO4af/8DHVc5osktQqk5Q6leGaDIQcSE/zLjAM
 hfqK0ynBV8mcCQhkM+wEltaga6vqpARv0BliVswVK6LRVGhfQDTmtOxJcXSXLLha
 l6DNcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebprta8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 05:43:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-930dda91cbdso804348085a.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 22:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787031815; x=1787636615; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TttcRSLZk+O3OIsj9rr4FBxM32n0SMvVk+0cYAoJbNk=;
 b=auxVYlaBVaFnFWHjcG1DcG1x2GhEsn7RTqXtXSp1IHlizEBEdsW2VAB+Tps2ZNiqGV
 8g6v7iOR6Ar3xiiICzWKon5o8uz0dSkVV4sVXk6LAFouIUsUBRGlklypaiPB+ODLeYCu
 MBpZQ79Qp17LWvhWbIOPxkquPbDZaAB6H4oVvc61gLfgCN9bsjLwhS7bAu+lCYnMRhVl
 NENm8LdhHQSiYEn0gqUtC2PIhQ7DYD1QU4WLQD/rSCLyeD9d7ZhneF2hNX5pp52ddiwr
 o5mCwiAg4SaaxRnty9d2rQeUeqPANrJfQLZVHd/IwR4yNPXrAa6kV2khQmGQJzfbzXkx
 uIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787031815; x=1787636615;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TttcRSLZk+O3OIsj9rr4FBxM32n0SMvVk+0cYAoJbNk=;
 b=RuCIKqhPzYn4LGYKp51H88dEJay5Zhlwa3/OrerwF7LreN4Nynsu+RfalSgEkxvQFj
 9Mia7wRweSddF4Aeq/vLszR3W7jTMVtOL+4ICvY7tsaUVSIAGlRI3gWawJHWzEr35I3C
 fubUDEL6yPzIDLNlkwA5gsMymMs2GwGpRWs5qWfr7/zi/0DTFy2ANmVdS+R/0ME3owGA
 bD6eE89qADXTshLAqu2XH/HQ7IRYfjUWDJ6yveq6OR8DloCYvwAvASp3hw2qt0P/BeCj
 71LClyBoYSnzWMjUk5uK+Ib7eI/TVcII1zvh+bNclUEXmb2O04CWQ6QjL/8vy26QvPBK
 +mIA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoF2QEuj7NkqoXolyoWmUjgXYt5Dg2r0ETrS919SLmndQK75jG0ojb4Xory1ge2cliVZsQhz0HQnyCB@nongnu.org
X-Gm-Message-State: AOJu0YxDZmHK+tZapyI7Mp5TM6C+ez6YNwg5v4iL3QPAyQEQN9B/98bf
 j1gchyjcOp9hgW3PVP/u20jLX0x7eiuPOaZ06PQJaBNl8LBsmocf4yekF09NuLf46XoECHvPYpd
 5wqyKsn11M7xvvmpi61C1o08DuUO8H0vPA/cOy3HAk+7oGn1AYv6n52/R/g==
X-Gm-Gg: AR+sD125IpoM1sVh/C7cbXSf/4jotptxcjKhCTQaAZ8L3OAcwzHUG+srtT6G1IqlSEC
 3fC7LqvrdPh3zDCdveL38sIWfM3gF8qb7c/l4JD4wiEzdJoklLDz2xmwEgqqVUFiMV8cMNnUxiZ
 25PvbTqnqbltrtq9ZNUAizMkyJ0MT1FwiWTlupaSOIZK1U6UPZGMX5Ep7M1/tmTrjtEByd6vGHX
 fGl1b2TZyh16glFq3L+S3h3nkypj6pUwpRIW/NM9y6dNG3cWK9ZDUWYl1A+wFkgnj/7tHfh9KqZ
 u7ZBsIkNk2BftPic2ystfTBMriI+PiY8Am63h0jHrazdpp/wIIakIE0QMHxAno0qK+a7bkUg4jG
 HI1iCbKO6+a0TBfQu01HZ42szh/aJVXr6Isg=
X-Received: by 2002:a05:620a:2b85:b0:936:e80c:e0ba with SMTP id
 af79cd13be357-936e80ce8dcmr2276556585a.0.1787031814998; 
 Mon, 17 Aug 2026 22:43:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b85:b0:936:e80c:e0ba with SMTP id
 af79cd13be357-936e80ce8dcmr2276554485a.0.1787031814582; 
 Mon, 17 Aug 2026 22:43:34 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b783d1sm9394214f8f.25.2026.08.17.22.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 22:43:33 -0700 (PDT)
Message-ID: <c25aa359-4519-483e-aa7e-2ba69daa18c2@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 07:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/18] target/riscv: Recognize watchpoints with
 first/last
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wS8MiSSJrQVFLPPvSHJ5hLNAiXq_oJzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfX5XWFXsRvVN7j
 40i7nc5pQ/8dMB9hDoWweWHzRFVNj1XRkYGbsepJb7Ee8X9Kj2+JfMNTbJSLJyCDpBxVBbTrt3H
 2Zr9AU6Y4ILe38hlaTISpqT7h1d8dr1DvhJwLpTu6wutP7y60GR2aILkASsG5h2gIgg++zn55Es
 ouqjPlUt0/YfPW8VTud9El/FXfza0JcHlyG1zrdU1Ib6ZxuwRxacF/ztHVEuy9CCU3kKgX1RRie
 ICA9Dp8u3LEUYE5/1uo/Jwyvzt5M4g2bKs9oTGYaR870UiKDf+1IFk3tsBrelYMLDMkhoqfcVbA
 dXDaJN/T66RhO2IpPCvt4B2RLDABXCHTHEjqawMr5HHFachD1qeqQF6vE2VtTub+4ExLiExRiU2
 iiH+2dUbtyZBT3V1rBrZTOhXgeGqt0BH82Sl9/hZwzgp2LlAYPisuO3sV5Cis6ywCsziX1Yw02i
 RFR8Dc3psTZUKlAvimw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfX/4hs6SL5XKw+
 DyukCZZ2detg+NiKq1TADw4Nquu9CK9DWmeGrns+vHMSlTnEq2pU000KxtIBgc+WGyn7cgEImQV
 xbzFmTQsFO+YrA9BOq7XQpyRASJBagw=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a83f107 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hMiBfUBk8g7yshXQi1QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wS8MiSSJrQVFLPPvSHJ5hLNAiXq_oJzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180041
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 15/8/26 22:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/tcg/cpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 11f2654da1..3318e82ea7 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -1784,8 +1784,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, vaddr first, vaddr last,
>            * Otherwise we'll throw a debug exception and execution
>            * will continue elsewhere.
>            */
> -        cpu_check_watchpoint(cs, address, size, MEMTXATTRS_UNSPECIFIED,
> -                             wp_access, retaddr);
> +        cpu_check_watchpoint(cs, first, last - first + 1,
> +                             MEMTXATTRS_UNSPECIFIED, wp_access, retaddr);

Maybe squash in "accel/tcg: Replace size with first/last in 
TCGCPUOps.tlb_fill" or re-order just after?
I'm confused by this single WP change in midle of PMP API ones.
Anyway,
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>



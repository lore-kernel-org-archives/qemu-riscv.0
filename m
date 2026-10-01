Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785B8CA5FCE
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 21:33:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCOOe-000423-63; Thu, 01 Oct 2026 17:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOOX-000413-1x
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:32:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOOU-0007Sk-Mc
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 17:32:48 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691Fsck32686757
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 21:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fNPrxVA6jdhqHWg6tJd7V9jh5hOThu/3jnHjQK5rqAM=; b=Lcm5YBXKlZvWm/Xt
 hAJsxGlm8kza+qKfZe0TGGGv3CiXrIBLxEs3hk392UBjkM6bqa0+09j4PlAIozdI
 dZNIL0U73dRNFAIdlfEKpQ5LI1L5PRF33M4hM5MMb9W1MBuBEz9unOWu42Cly8a9
 zuHTs3GYMpYCY3q+yHQMTUyZ4aHlabadmLPerKyoVr2xi9if/Ms9Lak6xskM/t3P
 bMvaWWAKX2tTZp2mDArZLKUjuzv9NP5Oze1XCkmbsvzBT992gui3LcueeOC3CCH6
 FKB23WV9b9nXrNAH097whj6WWSgenCR3bNAWvcrDMjgcYw3pLazq8pNl9soNfN00
 aTvVCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9a9ggf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 21:32:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-34ef0362d95so707999eec.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790890364; x=1791495164; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fNPrxVA6jdhqHWg6tJd7V9jh5hOThu/3jnHjQK5rqAM=;
 b=ORGLmFqtJrKVoImRsxU9mfxY8tBtwtiM0OqRamY5ulqSJrgd0bsu9aTPdo6OXnFs0l
 Tum5kqmVAhh7yYwEvKi2xecCv9X3dpXOncFRPGIBo1OO7w33I19M+lpmDAfyOap0tToJ
 lTXaHLTlhdRr3qVtx7dLMkLmPcV5lbHuHZb7qE6qNz6e2XP+dbPi1wanTRxutHW9nZ+z
 rbUiCYdjUBsA+E7028wEcm7c24ePHBKcTkBMBHENdxKEWKSuxUv8RcR8/hQpfq+jHbf7
 DCYvHrB/Fk+j3MpZCtqNh0Wi+7EsX4yRMsRIcOmlcj2HBMjoEB6KIpuw+HFn6rBAk1+F
 A7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790890364; x=1791495164;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fNPrxVA6jdhqHWg6tJd7V9jh5hOThu/3jnHjQK5rqAM=;
 b=xElw9yc+D9ihk74/jxoX93JJwZdBd3yk6heWOcDEloGlF25Goe6TWWMq+pey1RhrWN
 79NzQWpTQWAze52FTkCJ+nKDMySxjccsIqR4iswuip9ghdEXBtVt8oGJLSrQ84Ta2Qpc
 IBytJG37+pjB1gxK1IS2nxImGk/K+pi2Kw2UNH9/xKSP4FUdF20QcbX6K3EsTAjawirs
 WT+JesSw9WWiYGTIeeAa5gLNP4NRUk7qoFILNSPEcLc1ZIleyuQdyOnQYK0HQzv5ThL8
 tSP7SzlqItMxj5XiTY4bHDz1+/BK96AcwHGwpyFPaDVFl3t0iHii/mLk2ZmvaGLDe6+c
 eQQA==
X-Gm-Message-State: AFq9FYJ6wpQcj0L69Fmg3UryiUIuMeTl5ShySfQtD3RQEl1+UvxaHY9F
 VZypPmfWDiORQ3jsBzCqagBIdDshOmXDUHwCa6sH+xbWAFtBILHg4LOMWPzeYoNFfdRwrQQlTu5
 ooKGuoqlq9z0i7KOW+J3RvbL4cL/d/oDdGP+nxZaNeO/APaocnnmv2JToCw==
X-Gm-Gg: AYBFou2NWXVBwiCYtQK/DDoT1kVRY/4H4HHzkxf7Ct4qHUayC/oO9dmqEjHcZPUpiAX
 kcxO2r9M/QeluqQhwVU3XGoTVh0o1jy8YvjXlCzmdFfukgdbDS5lml0NIdm/Ziu8fmcnGaO+Fcm
 eAYjfkryQxF5Qjr5xqy0RbMDoZi6X3RhMgyKgOEINWT1JwLDK92udGBDOEhWA9Nst8Co8JNG7s2
 g1o7594o3NYk3A6WGT6K7zHg2BjnooRtE0XxNaZV/Ks3lPiI/4xtdWopJc+FUVr+7Dj1tGNUmzg
 K1DcCvnxFs3nQUzcZcB+ChilcfbMNSxXtFa4YxlsMCvFduQwpviuNej9jeaGx7nWA+5BE/qiKbi
 tqg0XYfiQtViGSXoTzpad5AUtlSq8OgBXbwjuSdcqDgsiEZIxUj5yHvF2c0FLbMSA8V+K6Q==
X-Received: by 2002:a05:693c:65d3:b0:328:3944:ee53 with SMTP id
 5a478bee46e88-34f14f2df27mr667941eec.2.1790890364110; 
 Thu, 01 Oct 2026 14:32:44 -0700 (PDT)
X-Received: by 2002:a05:693c:65d3:b0:328:3944:ee53 with SMTP id
 5a478bee46e88-34f14f2df27mr667848eec.2.1790890363389; 
 Thu, 01 Oct 2026 14:32:43 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14f8e9c7sm1032835eec.14.2026.10.01.14.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 14:32:42 -0700 (PDT)
Message-ID: <26e1cfba-3b26-4ade-8d19-70a17437b7e0@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:32:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/18] target/riscv: Make debug.c target agnostic
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-4-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-4-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfX3+wc42YNXlgU
 6DVjx6FlbbLrqYcTado5StrlQZXv4C6hj6f+4TpYLRKdu+bh1nNZiDP4n3+iiUC4UI9yIfNxZ4Y
 uF7BnWsbNZHgwLlGMJ2bz5lypmZAqvU=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abed17d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=K91iV5zTcVX8rV-a5GgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: X0TJ093zAWNlg6BO1Vtw4NEaxyh0_PfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4NSBTYWx0ZWRfXzzLCliTDxHJQ
 Y2bjY+Wo3osRdQ74mr6vMxDeCwqi8/oas1aSNTx3hzScVkaBG/EN8JXpcd4jO7m6ZN9uF7W9Aj9
 ggXDFE5IWKilYnmRxhdKK+UM7Xz/ke/Py+ZDFk+mqN9l0wl5geELtaaCC2rM8AzOEAJMRbsQkKN
 YWJQ3ndhj3ZUTIvGUbqQWt7X9fCFUTJ/3KxgpKGcSImp76Q0JooXiYWYDMOZxwseQQ34UaOi3br
 VyzL+DLB6T4rwBdwSjBSJBJB1mcjt9oZFxe3EaClvA5Vp7DwVGHaQxGLggsYLkP6MZJELwP2JzT
 aHX4mdI2MG4Lit1ZDXCUUSZE2PtNfdhej8oJAONQY7v2mbJYdbojWpmuMgbvloVGiBQqftxqpqy
 Qw0HLXLNWQK/BLBYACtrevVppKAKX4ADJ9d3TjHTiovV+0apAteszvuPLm83LGAg7/5N0KWbHKK
 YH8+jEpyEiR8MOOFqjA==
X-Proofpoint-GUID: X0TJ093zAWNlg6BO1Vtw4NEaxyh0_PfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010085
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/1/2026 8:59 AM, Anton Johansson wrote:
> This is not enough to compile debug.c once for system-mode, since it
> pulls in helper function prototypes which depend on target_long.
> Inclusion of "exec/target_long.h" from debug.h is removed in a follow up
> commit once the CSR functions have been made agnostic.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/tcg/debug.c | 140 +++++++++++++++++++++++------------------------
>  1 file changed, 70 insertions(+), 70 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


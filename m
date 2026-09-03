Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03641C624D4
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 00:16:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1v7O-0002aQ-7m; Wed, 02 Sep 2026 20:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x1v7N-0002Zb-83
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 20:15:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1x1v7K-00083X-L8
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 20:15:48 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682NHcf62805840
 for <qemu-riscv@nongnu.org>; Thu, 3 Sep 2026 00:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ihIYbwk9MLemaviwg136qnzZ070iXCIt5GZ5ewBPZjE=; b=GFvFdtFFFAR4uVf2
 y27ZvO2p0YmUzxn48yav1mf0g1kdb7HOQiy1BY+eMQ7gfKMgBags2q7zpTbEhmpo
 gJBA1FKaXuSqgml26auhG5O1nw2BxSgfxwUGO3Us1mn8M+XmzBk2vPXjDpjJyjgV
 ZE6lNr3SToQkbBa/CAVKVpeMwiGHyEwCDTSP7ybdICUX4wv6Mf2owwEmVs+hGjNU
 Dyxk9uTYfA6UqCWeJRWSABdxnxpXvLlnTrgBrELi+zD6sD1usZ3pFEP7Mywr9XfH
 byYD14hLpSyxLDxF6oBjaDHU7igp/v+PvvC/TJgwMdkd2OG5/U2j5mC7E2jZT0eV
 KGHf4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdtc4u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 00:15:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-53033887f50so40715251cf.2
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 17:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788394543; x=1788999343; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ihIYbwk9MLemaviwg136qnzZ070iXCIt5GZ5ewBPZjE=;
 b=GD5RbwdFa+GgpC1ZAuAM/NH9eQo48B3SJEFI/ZGxGiC8alrWkb0RQrizD4Oah1NXoe
 nSCdjWy++xKYjwWt3Jwj143+/QeqDcvW08exw1GjwEPgl+8owCfpP35SckfPMuw/jnVn
 MmxA/PxjOYuHWZ6RmGQ6vLPrudy0iFypYreJMg2t9M70Q7xPvbDu+P1zft7V8jINRIVn
 lNhnSJ03vdjENbuK5wHmtN/C4I2W1uxNoeOa1Tu4oGtLWGc0XfTAI7vAl6peBxFpTbWj
 +TGFr5gcrDUV2IGzpD5LnlwtYzpr02lHwxJW67yuUb5Mwb8eYcF3/arr7xjsL6zeKeV5
 f5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788394543; x=1788999343;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ihIYbwk9MLemaviwg136qnzZ070iXCIt5GZ5ewBPZjE=;
 b=GT7nlg8Z4RKjOTcWNXvk9sgL4Uq2/BnxEKt8hby8mMhcaxwmT6T/HahirBwKMyd9rD
 VirF8W2H+WGLU0syKCAP1IlfOaIb1roFgO2IcISSHu7RdXBls5lJRAcx0sZtJLd0dP5a
 NRrcgcMMvk4R3Lv3MOhln0gpVR4f7mfHdke8/5saovJJrTu9/Y9bcklzJf0bcAGqGLQm
 H3g7TSyStsB/r0amm2B+J/yQSjQwEC830wPmF+lUIeajDGseSjbv7cuyK9WepZL6BlPo
 gx5kxlQMMqAzZa/pQlv/vg6hqrEC7oKJVI7dTioBrihkB3bXZlrV+MfPPWsFuqokzgrH
 uLgQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxyKNA26kOXZumZD9TvLuSsyx0/hBAGtNyJLx6k1eLKTpHfE1zwxp7YMuL2GQtGcu0fblDhnNe5FjIv@nongnu.org
X-Gm-Message-State: AFuF++mNAK1pMB3E6+Y90aj2Aq3p4Hi7/F/CxviOkNmSTD8XYIwc/0We
 voc0/aLQ2FDMop73diAuiMjRn7yYZaMSFsyOL+wtHBI+fPK8hSGuF9flTo1kHrf7yOPqT3lNcTZ
 x6up2E2/cNdpcTiUNwO7/8q1vB9bjkiENHz+iC17pIkeDHUrd4vye5xeibw==
X-Gm-Gg: AYBFou12HI6X+mIWqE7OK0rLsrJ9TYMLENFdYmdTi44az/i52D3JSaefKcwSsNvJNOe
 fglYEgTC//7hdqIX60iqcqrPbLR1KMifvklNGzi93Oji1xc+ClvaxJFi6Iu2VYE7aRJzoq1PiE9
 MeoWhlYgNtwJBBbvSESVGIv4is9G3w1YW50D1/VPv4BE0SKY6Xop7t0pE3tKqwMkmQkLyIf2aVs
 5lggWgZ3b32bL3XOBBb1f0lWLhYo/34Us0NZ+90ajK8kZ4H2A8xX+wtg9R/X0ODv6F811tKuCrc
 UWLkP145djkHKXAzYseZNtRXAGgOyvoBw7jVypFAew8+9OW3l66x3Nf+k53TOfa9TaxJn++MN4z
 Jrz9WcCcN2OPYHTOfwz2ZX6L/tSDpYac76W0lvUIOopjZL35aDp/3P7P8TycyYdROsDJfEsnZV0
 q3CJmq
X-Received: by 2002:a05:622a:4014:b0:530:3387:8cf4 with SMTP id
 d75a77b69052e-53036d17a25mr116478831cf.31.1788394542627; 
 Wed, 02 Sep 2026 17:15:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4014:b0:530:3387:8cf4 with SMTP id
 d75a77b69052e-53036d17a25mr116478051cf.31.1788394542019; 
 Wed, 02 Sep 2026 17:15:42 -0700 (PDT)
Received: from [192.168.1.199] (104-54-226-75.lightspeed.austtx.sbcglobal.net.
 [104.54.226.75]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90e9ef0e9b1sm30747006d6.43.2026.09.02.17.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 17:15:40 -0700 (PDT)
Message-ID: <64ef65dc-fae0-44e5-ad96-c806e0a6d8d5@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 19:15:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] target/hexagon: Move to do_interrupt() (BQL
 acquired internally)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-9-philmd@oss.qualcomm.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20260902152044.31291-9-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a98bc2f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=x6rl1zRT+JsLSO7OGbGBKQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GUtW-XfJRLY4ZrtkAG8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ncatdl60KwJAuPRcXH1qKhsiXUrPwMuB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAwMCBTYWx0ZWRfXxKPC7Q5JcaR3
 MGaNn0PiBm8Z9k+nzG8HJFErb9+8DMvCgppsWcoAEMm3EQFofynMMSzhlV2Mx7BuNKrAdY/YTS2
 Zncs2WK4NjpEqu9xvnKvVa7Zowi9n8eGCXCqYm5yFkuLGqu5ZZWXJkL4rJOXwB6Tn65MvZ8dQna
 8EfV1zKg/fFhtF5tq3pPwR7gbMUk6Y26WcO7NVnoqW/nuezknVcm25tvysFmzmNvS+A7qEu79XZ
 N2LOIOHnvpiQGalYKlY46G2cMea25gRnNzNtaJqO2iC/ISFe5iZY6Z+U/NUAxk8VzibTVuz7JfO
 o3zZ1UNn2QqhEkDu6EHA8PCzFw3yI3vExFXy6js1GvHD3bf1f2RCfttp005CJ6nks6ZU0S9hkr7
 oEsM1Y0qteWzim80MQecVTcTweQ3VAu2ZUT++/eIgyEBNU55dBwipMnihSH35yNsYnrh6dO5r1f
 MY42ZOdQ3TqKi/uVWbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAwMCBTYWx0ZWRfX5DFX8ByCA+zm
 iv0kVjQuBGWtoXIuq6OtnaWE01dndm1HMQaLujpcu7l57w9nOyo7inmbp/f/BWhWF9ee1+9E0/1
 /XNBXAL9cGlrwpUMB2HmwuGHInwhb5s=
X-Proofpoint-ORIG-GUID: Ncatdl60KwJAuPRcXH1qKhsiXUrPwMuB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030000
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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


On 9/2/2026 10:20 AM, Philippe Mathieu-Daudé wrote:
> hexagon_cpu_do_interrupt() already acquires the BQL internally,
> so register it as do_interrupt() instead of do_interrupt_locked().
> This reflects the actual locking model used by the target.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


> ---
>   target/hexagon/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index b5dcbfc99db..7067e5b70f7 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -769,7 +769,7 @@ static const TCGCPUOps hexagon_tcg_ops = {
>       .tlb_fill = hexagon_tlb_fill,
>       .do_unaligned_access = hexagon_cpu_do_unaligned_access,
>       .cpu_exec_halt = hexagon_cpu_has_work,
> -    .do_interrupt_locked = hexagon_cpu_do_interrupt,
> +    .do_interrupt = hexagon_cpu_do_interrupt,
>   #endif /* !CONFIG_USER_ONLY */
>   };
>   


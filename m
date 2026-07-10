Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DF4C44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:48:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJ5N-0001kb-L2; Fri, 10 Jul 2026 17:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ58-0001Jn-LA
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:48:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ56-0004iS-OV
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:48:26 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3gDd1846455
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AuU1AxNQdEe12mck+iDZMnewEFFAahJNOb3wRaAvWmQ=; b=f5C7Vopu/p5cbCUb
 wnlSdnXgwUL0QIbfBAmwsCsLbmySsZWzyZJNysHdDRWET/p4a9tJUp1dRWPG+3mS
 NZkuXVIJ9IYIHlAwCmkmepmUFSAg0oVetsv9uMpkACuIvaVx4djIkI2XQEpDH/Pi
 dzS3dClzTnGR1DSZ1Z9bjuU3Y1vLXzVkE2IktOrTACMWDFkrCPJYiTg90W8Y2wT9
 SBx10s55xLxBE9tobssYPOrLphm87nHIos25pnaE+jVzatuOwVq4ZxHXvsIdYVWs
 iyE2u4bogNITS4I8zn10wypUms6CVJDDbLDeacYODRZHbEDdvhEZvDYzHJei83VD
 kH9GwA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb649rjp1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:48:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c07f25de2so11258081cf.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 14:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720102; x=1784324902; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AuU1AxNQdEe12mck+iDZMnewEFFAahJNOb3wRaAvWmQ=;
 b=B2sEaln1mjdOX2qrdnOVBUhhTRN2XLgpEK5Je3faKC/vqxQ9kI7se0mzJcsZ7mB0Jw
 F3M586WG7o2SY8+Ee+uAn/i3KUm93e+ikgFOCzsHrtbCsaAgUA65tTxRLm1dT5878xcv
 +c4vcfiACICRrYTpXPfIi//LbWwtJ1kixtxSs8I+mKOSLJOR2Xx2QU7XPhd8TireyGWq
 SYJGeEQ+bWhLnxdCtAukZ78uZBQewruNlCzn06sAmjtzNQznDgfNr9YAvAazSqIE8urP
 BSiqUCqgzaZuTfL5+5935Qc87d3so7AS6xpFPGmxCbZCDQEgeDVIQgpbJeI505s8s12E
 EytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720102; x=1784324902;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AuU1AxNQdEe12mck+iDZMnewEFFAahJNOb3wRaAvWmQ=;
 b=OguRBxLQgv3yFYMFruxt2KFrZWWA8LVJ+F0fTU5aII6BkOanuiPyY0TaFBi8zlDEPM
 mESRYhZ9dhx19JI8cK81KZfjGG1VM/CHZYMeK2Voj9G0IpPCWeT0x8qyM+31+9eV5CNf
 lrQbMIKaIE7LXlqSx3kNh/AWC5bf+PZPUWy7JyhttzwMiPd7CRmaNzfyFRqLSvMMjuH4
 gdDu/dnSbR7myOhlmdXHm3fJB2fqPbNHpNagxm4tQS2qPEYcSPmzIUdD3NdhmOnCpfmy
 bIC1IcgbbgbigJNL9CkibLlYAflg+drqQXqHhPtS1bLzp8vPhQE9WM7bue8ij29jl49b
 vzTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RroEGeoope5P/9N7D9ANU+cHeaPhmhiV7esuha2Ij0p/UR4DyRH502BcdYPZyfb6Ya8B3C/saxkORnK@nongnu.org
X-Gm-Message-State: AOJu0Yw2VQlGDXdU1ZYT2Gwa7nhoO5H5sLwJOZq6vHK/QxsyFQWYaLsg
 GtYrrUB2Z9KSuqviwI1U7vYyAJjiO6z24q99YMNZqD5KAKZYfF+DUUeYBS/KBwn2UMUHDbsadEG
 YVUN6GokpoSvG7vGdV7gJmuJNp8TmhjjwVb1+Ku13O3Kh8NDf52t0Qgc7Bw==
X-Gm-Gg: AfdE7ck/Qa/353OLYtdRz9gf13l2EU/kNS635juh3tE11lwTkCU1XsflJGmfPZW3vem
 lrIt/vESLhK3vFdc5liDkaAwMhTrFUNG4P5D3PzZB2ZRyhB9K5cAS52/4rVJqhQWyan7709fAe3
 z6yfuGgXVNWyVUeV4+5G+4Gg+ym05lsYS/Z60KJCFH6/tKnbzR0pVTqFzk6iHe06inviTG0xbjO
 TswSp6Ro/xKGpDw5MbZ0z9cNgPDDQmkIsFw4SW6K7xcLpnZq+DplE91zDUteKk3mG3L+BhKIjkF
 4mKXaBhE4JvakAdDgWAX5QcWjbmmku7gT1mgWKRry6+MB8285r1t6pkm9T+70lcqC69DQ3Vxw8h
 XMsdeGC0Gu8XfmLXgdKS0NzLgpk0hPgg0pofsj3uiiOJ5iVq8baD1jFl5rtzVww==
X-Received: by 2002:a05:622a:1e0c:b0:517:8711:d466 with SMTP id
 d75a77b69052e-51cbf324541mr7304871cf.56.1783720102563; 
 Fri, 10 Jul 2026 14:48:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0c:b0:517:8711:d466 with SMTP id
 d75a77b69052e-51cbf324541mr7304691cf.56.1783720102154; 
 Fri, 10 Jul 2026 14:48:22 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f21328sm64505445f8f.32.2026.07.10.14.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:48:21 -0700 (PDT)
Message-ID: <04ff0b28-bde6-40a4-8e9b-33227f18f5c0@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/51] target/arm: Use bp argument in
 arm_debug_check_breakpoint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jLOk_ILtNk3Ucpb5qBs2LX0rOULZ6Kmx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX8opMRCG1AcKz
 PR7NCrOT9KkLeq1CGOCo0jUzcKCY2H19VNeTdmgFyc6CXvsIcVbqtt/E9m9aAPuujL/GBzykBMa
 n9hXhEOpera7h0nqfuWQN8pleZ5ymm3W4rd6QL1yED1a3vkh6fa5FeSunrbdyBMitWRQr/IX9V3
 KGnHlJOzUHaUXfT37HlefgZNbhqQOZ5ld88Rx+vSnKuRhiM4FqwM+EZOawi3ExQqaMBTRMRQBVT
 6vjyycciR/A10lIZTI1t24PwmBuwWFTIuwNE4tUgjbyreU0Y6ZUBG3s8cv9wvxDCAkWW6CUoxdl
 BjYF7VYOA7AI3K5TPdu6H4/iOjURnMVueviwPZMvz0MygCcYUG4OvUFWQnCaDaVqyXM3W9zqYiL
 xtJpgXu4yGYTvH0aBd7Ii397EjgekLyGxKDZvFIMu5lCjiXfOq+bw1Hhp7iBFhWXSgylZnDY1KS
 Z/VCPng+O1DudPI0syg==
X-Proofpoint-GUID: jLOk_ILtNk3Ucpb5qBs2LX0rOULZ6Kmx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX5++NGPWqn2HI
 ddhbn+6hxlSfEdL3dEBuDaT0YHPLygCWO4zu8u/GTD8BgPJQK7gDThtR8nsaxYNacn1Ik790IpV
 AZYq4Y424GE9JGi10nAi3OhZV5FBIe8=
X-Authority-Analysis: v=2.4 cv=VZfH+lp9 c=1 sm=1 tr=0 ts=6a5168a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100219
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/7/26 22:53, Richard Henderson wrote:
> Use the matched breakpoint instead of looping over all.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/debug.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


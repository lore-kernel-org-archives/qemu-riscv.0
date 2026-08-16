Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DCAC5DF66
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 09:20:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvX2q-0008T7-F6; Sun, 16 Aug 2026 05:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX2d-0008K0-QH
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:20:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX2b-0002ok-4D
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:20:31 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G72Naw2630383
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l3QyAF09ZXfHYyKDxPZWl4pmBZgtnF4lqdnSxlFCmtc=; b=BdWoMFeuwmAp+Chf
 nYURZAWIX5WXoqH903KKj3Z4pncBre5m2yq7joskybN3FC3TdpwmmjguoXNkDjV7
 cXSQ5kSSORCxrMNofM3IeGSbe2VpmMaaPl3oewgvOwt0jhWyNjsAiHRx77fy0NNv
 fo/3N/32KYdtKcHzcpwquuCywj+Rn2ZpdEf3GgzkdC8Wo3UjP/oD9XEtQwV7ixKJ
 iCn4HdGhqX6ulMvE7krJFdKg+nMKB6c3DdpNktiYyTOCYosTHSomFmZTmqA97F6x
 1Is6Q/1/y+KzCEswfixs8Dz26thKWRrQ1NzFWM3uugXTA2HHwSZ+jWuO2rsl1maA
 +UiwTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk35q8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:20:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-529ae8e96e8so31817741cf.3
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786872027; x=1787476827; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=l3QyAF09ZXfHYyKDxPZWl4pmBZgtnF4lqdnSxlFCmtc=;
 b=A56F2Tc++ta8YJquoxgGVdUDwzq5/FJfvoutNEKscYW61qtImenLcTSL3A20sZG6oR
 q2fkWoiCsZ/zByrd7KXPOXD8comGXD58pHYZqsT44fPQmC/eERvOBMHKYnxp83RxrW0H
 KkAvyaxdC1kEOAw5zC7s5IedBqDzYLDVN3g0g0ypAx5k9FnPi/MGQHfvLNHb1g9D2lV/
 lJVg8rVncHX5RI2lyDQV9PyAcjrZqk/shER9hhKNEXHQACpP3B241nGxXAmgJKPEzQfp
 xZ9QDwotLQf5hCRt9HXp3j5cTdmxPhPUHkM/4TRjOjFXHf9IGkCDjqTz9gALFqu2EYGv
 z3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786872027; x=1787476827;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l3QyAF09ZXfHYyKDxPZWl4pmBZgtnF4lqdnSxlFCmtc=;
 b=Ti34/RUNDyNUxk9K/LLnMPytmaFRhs9r+lje/TPsxVJqjbU2HPfELbXS0iSNhjtAJL
 cwxHX+r9lNhCnVk3Q+QXryAsE7KKkZ99ifiIUWs7IGxxya8j4FhCzZ8SZq85ys7LTMfX
 Y7wJB3ozQu0lcXVoQSCL05H2Z2FsV9Zws2m0nr92IYJ7+ex3zMtNDaXi6OFtM/jSHFTV
 6vDX0eFiXIUYfIRtD6Qhng4sfMhy/zZ7yJfPHanykkeqywJnz5bHw1iBgyQW3gLqiAOY
 5QHaZ7//CR7RrwljCDn4X5yNnvT4xeFgv3g+R8nP1ngB9DyrJlhLde6nT1tCVI3yB86j
 mEfg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp1eNkn+gbf01q6VjGM5Clh0xddZzF/5QEpNI2urZU3gol5ZYJ2luQXsRDk9TQ2YRAs+VCfQM5yTrfD@nongnu.org
X-Gm-Message-State: AOJu0YzSjYP241R6kM6GaiPP5E4odFR3HP2eTuqRaHqRbc8LPnVBoxEB
 mCDy5uQFNiGwuH/0e5vlAceMUwPzSYhbFUKSIs07PJbQ7xasWqxy3U1OZKXEJtOjC1g1Wcup6CK
 OVHr7u/06dBUrc8lqeALHrdJj/AFg5jptqSUUI4DAtOkYlARDmGt0QrXeBQ==
X-Gm-Gg: AR+sD10TJP38yI2LJxM+S+a8iN4sp4FWgbvQ/O8y2M7+0HjSE0Wx6KXwZ7LLpzWNJlz
 xqEzXV7o2mIXssNLVNhJogE+f01ZesYvBYNscY9kP5il9jtJWLxA49gXyKcU33nsR8lOvQ3jaYA
 37H7L2J/yxt7w2oSlzjX8yv0Ub/R7WILgZhoG7EYNgSrC1V4mKWIoboc3+8P+38RD58TeMYStYp
 Q5gcQV0gmS2pvY8hpuo8rbbu4nqd6s5XIHg7n8VJvWzoLiG/CyHnzOM2Q9sRNqCmRpOuR/WgXaE
 tUSSw9hjVSihgmU7vj/jIMcyJ0GGK3vqIX63a2AW8sTbMAb9/NQMCCv1yKmVRrmN+sdgTBd1ov4
 iFhZn+ASZG5f2H4DaRe6unV6g43DVB7H3uUc=
X-Received: by 2002:a05:622a:8cd:b0:527:631:8d6 with SMTP id
 d75a77b69052e-52d854c66ffmr216300371cf.25.1786872026811; 
 Sun, 16 Aug 2026 02:20:26 -0700 (PDT)
X-Received: by 2002:a05:622a:8cd:b0:527:631:8d6 with SMTP id
 d75a77b69052e-52d854c66ffmr216300051cf.25.1786872026422; 
 Sun, 16 Aug 2026 02:20:26 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499960fef95sm38486475e9.1.2026.08.16.02.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:20:25 -0700 (PDT)
Message-ID: <296d23a0-3157-468b-8c4f-e04bd2bec201@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/18] accel/tcg: Replace size with first/last in
 tlb_fill_align
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfXzOkydVpM/2zT
 ZEag4Uz/6tk57RVIJHiLT2ERmjg+HukbQ7g/4Q6/jRv8k9hcw+i/BMDMNtwIR6ohTdhj63eZVmw
 JanBbCcet7emeZa8dkcsx7FFchlCmp8=
X-Proofpoint-GUID: Km1SbMTJdjtPpVNHEp_HaSpczbzwrgt7
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a8180db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfX3hNh1QlVylDC
 HPXvQ/N38OnOhaKevypM7uqR45nJNnZEmzEjPPHLnOgUIAXalz0ppM6IOQbhoSFvC7X+A2v44kW
 z9fsdnhuXtX5dP6c1QLQM/SqWtbG1woTpi7AQB7yEpuvrxzgMxKlNuWHpMPYUBHrH6FHex+5Wxw
 V3lCY8nnfoPF7wrto2QHrvE+42RX5/YCjQkVxePS2nPzXKu5RGMuESCwz+NExd1a2sMf6W3MavD
 x3BLfuBwaLfv8TrBskhu7oaAjS1pFrea5E+Z/iFpvqZrdCHpue5PBVyzuZ7lfa9XaL0BIas73uF
 AxsqPeUvZtUIk2j+g2+qfknd9j03E97iojReTDSIrVVyAGInGi7vTYBJTfZI2WP6S1yCzoBQVMc
 2r2CviUUl1hN3GVilKWMG5P0egI+WS6puK6KD38td84pMv9b1j5JtrtMyAVYqvhncDxmOS63UvZ
 G1hjyZVac70UFIj0Hvg==
X-Proofpoint-ORIG-GUID: Km1SbMTJdjtPpVNHEp_HaSpczbzwrgt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160069
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

On 15/8/26 22:37, Richard Henderson wrote:
> Propagate the API change down one step further within cputlb.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


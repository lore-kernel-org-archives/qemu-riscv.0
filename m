Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0407E606A320
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfikUuwB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R6qtWJGo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQq9k-0005HS-6X; Tue, 10 Nov 2026 13:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQq9e-0005Dq-U3
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 13:01:11 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQq9d-0007ud-A6
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 13:01:10 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAF01pE484407
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 18:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D4Wn973MFNtv8wjhtI2WktaDZA/JVu9qQI6wMbpa9sI=; b=LfikUuwBP5PrHUrz
 fb5V+aVmOVopNi0WlNY1LiN3x36Jva08kkxpBWuYc5N8amVdQaJ9iD4IBwLG3iWq
 n8zl309nNJzBL0En9jmxdhP8JdJT/pV/fs+rY6nP6Ym2Jzckositl5iio2dBZDOM
 Bxy3a1skLLFdkowMgmknEDcxhP9ZyZcsm84ZUiBPE3u7aKlzWwzVPsNeVoyW5Als
 JRwj1gqBN+dW7akCHjpbIVEL4phaxe71dIuMxpbGc3HJG1wFTW6V7Efgha4pYIlQ
 ILPEaTZjdkipSyRux7Q8+ymLe2VlXCkf/NS4tc0HxYYJymFwTMe6LNlWR4xNLNM9
 4kolBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwj403-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 18:01:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-94607500fb0so385847485a.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 10:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794333667; x=1794938467; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=D4Wn973MFNtv8wjhtI2WktaDZA/JVu9qQI6wMbpa9sI=;
 b=R6qtWJGoQVGfKnAIH8UtaXecjGsyEqLw4HRIS32K4UyK3h92WHJetkuTYRtRJXa6h2
 cbn5XnEGXTlGCJuEMNKfR7s3qcbxOJp/38DrtB/iWS0rBWoxmx5WIAgUEm9T/dqUwvvL
 PjKz6S2PLADOrtxRfMaYlmHywFVeBLHnNZGd26PHqsSf+wO/8NDQK0J+GLK43ac1wud/
 jOHHUgDfjq12eFQEIBrK/MTvf9UiaF+Q2cRxNIrquYazbGk7matmxYI6ZHRudG976mct
 iJeDJXwH7hMevS5rcLdXr3p8DvKTlmt4EsbHCiowaMcObPLl0+RFCiIxGKW0m2/DkV4I
 1KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794333667; x=1794938467;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D4Wn973MFNtv8wjhtI2WktaDZA/JVu9qQI6wMbpa9sI=;
 b=PMvVwu/K3lPhCaho+W+KbktlGlkl35qKdC67RG5eHwPL41OnOe1ntxQ7iiIayElPun
 L3XU9q1dAvuOwyH0wOokGkCZ96TsE0yfpF/3qu8MWBTxdCRMwJYHkxFmqN6amv43RrOJ
 vwoaEbIeqvUm38JHFFjKNAJ5raAAa+mm5knxcLjAGvE3TiEVnqZuISZaoFGNwo2A6EJ6
 XItVcoqduFe75gda7WIs7Jz9EBT1azRmALH7OGSLPXMBsaON2cZlYKBMW1LbdD8mP0Q3
 WKgCLKeOvvyYyN4AxaCjLq2hOneMojnoYuFNM5Z706y3p2ENq2uWN0Lcjmf6hp6Xw4c3
 gKyQ==
X-Gm-Message-State: APuU4Z+cRB9cuZcXvXuNf9Nu3oq2X7pMMdN2ee9qICLbGYYYQlhUhEfj
 oH5VG9IWFi8kCWhqWDfw+cPL5o9XnD/BNuYKTPb0vA2nSqzLMngBH8qY3Gk8QFBbofVYc5LfQbe
 dd8J/nMLoh3MEBjlZEKQlfLCnCIIj8C9BuPEpXEOANB/PEc3BrNw+NeBp6w==
X-Gm-Gg: AYBFou23Id6a4iBX8FTwz9YxDtLNihVFl8OllNd2Hj+JDRztZeAaVQZuHDwM1TGdFaO
 WZsfPea/bYvcHiBIP9jrbObzwq7vxJT5Ol/XpCdnehlL8x5MCbI8bExXcoh/o7zRrvlitysEw7J
 68CZ/HKZkxQupALMRngUF8VVjcHqTqV0Vzz99PIM9BWpMw1X8T6B9COuBaggR6JuoeTHzVpGS39
 gq8vNQGSGTQ2BSr4zVQd8yKv1FdFTfHD7M8Vqg/M6pdiOatmiMFigqKQAlmJTSnfoROM1ULZlue
 D646PLScZFJn2HU65sCayWHbnqaQBSXm9u+K5SuZNw1v1qEQcI+zV6foEPxoOqMcaOIBrXmPy+r
 TN+9amPAbkyx2dBye37lJaWkzp+bfebXP10IMkyKIntzQVPikryioNQ3LfL4Zz6p1CdbbHcMVSm
 0v6VCptCzFRA==
X-Received: by 2002:a05:620a:370b:b0:93f:18ba:bf78 with SMTP id
 af79cd13be357-9479f34cc68mr591243685a.69.1794333665213; 
 Tue, 10 Nov 2026 10:01:05 -0800 (PST)
X-Received: by 2002:a05:620a:370b:b0:93f:18ba:bf78 with SMTP id
 af79cd13be357-9479f34cc68mr591223385a.69.1794333663830; 
 Tue, 10 Nov 2026 10:01:03 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e7ffa11sm277212685a.43.2026.11.10.10.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 10:01:03 -0800 (PST)
Message-ID: <b2c5d338-780a-498a-9ac2-2b4c972847eb@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:01:00 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/riscv: iommu: Check permissions on IOATC hits
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
References: <20261108143934.129923-1-tanchi25@mails.ucas.ac.cn>
 <20261108143934.129923-3-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261108143934.129923-3-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6jkhx1ttoXkddSiGve6rbwBwMPw1EuzN
X-Proofpoint-ORIG-GUID: 6jkhx1ttoXkddSiGve6rbwBwMPw1EuzN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX07JwRnlm7jKZ
 aGRL9OXY2dxrbCBwJDSagVwG6ZbK8OW5NlruK2LpLm1Oow4hEiJkDbFywe6ntgkS1oovqcjUuhl
 PL12dXzkBQWaxNkjo2AzawBuFMrJSc0=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af35be3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dA0nmnVxKb9tw0mG97EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX7o3F5rXFB/LT
 yZn1HPVFm0c3XhIdekgjZ93WYhsz7ltU7ynkNgc3I0j0Np9M3/FiARG6g6wlxwTHejP+qFtCkBn
 tKwWeppyEF4twFKZvQCvGIbkENBaAshTWetyCkGY5fe1j7Lc5ED4Y+PHRF0Q1ZgFTTVsdwJbLc4
 RP/1GAJL8oKkvzMIxLGn+1sdd6EfI2yEyIUrSXwBqaK4Dy9PkamNFqD8tbtphqYke4dycmYGj0r
 LvoDcAt6Vz3znopWWP7j5h/C/tMhrZJ0vjKerjX2yUBJZ65AdgpDCWeP6IsDVjqWy3IsXt/0B10
 h4N0HN/yPxPGFBZpM1+wMMUZWsvsJ300CxId6gZTqDms/hpp9CO+fLZHJ7r7knPl8zOjaceHEeK
 rYIJDAjqe6YI1cowB4oGjP2p19KRUibM3jErScjuiN/QAHEnRwsx1ZNmKJ5j3/lr4csyZ73TyQE
 0X4JFWkgU/aMLM9lDdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/8/2026 11:39 AM, Tan Chi wrote:
> The current implementation reuses cached translations without checking
> whether their permissions satisfy the requested access.
> 
> Only reuse an IOATC entry when its permissions cover the current
> request. Otherwise, perform a page-table walk to check the requested
> access. Preserve the existing behavior for requests with IOMMU_NONE.
> 
> This is also needed for hardware A/D updates, where mappings with a
> clear D bit must not cache write permission until the bit has been set.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/riscv-iommu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 2dcc528599..6760699eb8 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1781,7 +1781,9 @@ static int riscv_iommu_translate(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>           phys = iot->phys;
>       }
>       qemu_mutex_unlock(&s->iot_lock);
> -    if (perm != IOMMU_NONE) {
> +    if (perm != IOMMU_NONE &&
> +        (iotlb->perm == IOMMU_NONE ||
> +         (perm & iotlb->perm) == iotlb->perm)) {
>           iotlb->translated_addr = PPN_PHYS(phys);
>           iotlb->addr_mask = ~TARGET_PAGE_MASK;
>           iotlb->perm = perm;



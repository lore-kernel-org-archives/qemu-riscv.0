Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E706CC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 10:47:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfbR6-00082b-Bd; Fri, 03 Jul 2026 06:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbR4-00082M-KZ
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:47:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbR3-0007mW-AE
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:47:54 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6635rfdP2994888
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 10:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 443cSqWdloM7YApDaIzfPGqcK3NtaDlVCay66unU1FI=; b=p68bqKnTahOnq+MM
 jFcG6FaSHfM0g2DJtZHATKQqUU7bNciOwe8AIEdqfwrAg+091wakVwaNQXofAo2y
 FZge4fM8x6mZokTbyorHHIFNB9LazQUUM/J7i4hl9T5tT98Tpx596p/zA7FjrxbB
 KZtddxLMKnfNhhyvpWt55JkcWyV2y5AI2unhqNp0Aw0YyUsykbSn2qni74i3+yJs
 Ha9HNGKItbQAqDr8lj8ULI3JM7EgN2oFIltI2J1Eglz2wXcSTym/WyfGkOXoxHk3
 bW2ROjDfMfU8O90h+bn5jomTDZgj0jAdd+enPOlAXwo2uvyssiRXgqAJVFKT9TKy
 6P/UVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1xrn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 10:47:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92ac0a54110so48502485a.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 03:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783075671; x=1783680471; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=443cSqWdloM7YApDaIzfPGqcK3NtaDlVCay66unU1FI=;
 b=DzTmaJOK9PW9PIAkJCQvWdef5NQyMIohXqd5Cy0SoILnqezhzHvkkkej3j52BoKMje
 cWzvgbDRgw/ctHT98PJNtutI0THi5NeLR+/DoWh9LgChF5VC+Hoa1pZBSy5U0w0wegsR
 5yxnn3sJVx3my09ELC0AQ50HuDDAhnLjmayiLfbKz5RCHwGKbQKZjljqfGtYTU9W9yg3
 cmQ4CJHbTMJqCxP2sLLVQUWMVdW7YZT7pm3wYBEg0PIHy8ZftyaALsANMmsqFO1vaS47
 ua2STrYrLLRd45ywADlEtz9kbPu7o1eHDljRBknxn0LjcJcWh34Qd/gZOuGiToNC/JCn
 7Fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783075671; x=1783680471;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=443cSqWdloM7YApDaIzfPGqcK3NtaDlVCay66unU1FI=;
 b=fl9IZlV98iT5eHo6Yj43bXUIoQ0GfdGPJ/ZFiXF9RGCqygNMH89j4WfDmwfuJLBY59
 r+6i5qomkVi3/eJduKp+yhsaUcdC9edmQY/vqf7ipHDsr+XtHs8VaAkHtoX3Gv8w6peE
 hENGy75oYl6ZRSHDoJZHjbZfX+VU0RwEZoH1/qh6HFCG0Gbq2Df7OxJJoUIqdR4s6Oh4
 Ihs2RApcdSYoOUPYnx51DyqkKsNmaSBvfgvF0qfZeDbee8jZM1xi421pVeTjgTw8yn5h
 qBr9r39OUFiU7ARwYjMQDd9KKRDmvABesySy+zjgMD0nno81jyumRP+q0O7ZbZ6MuYit
 cBGA==
X-Gm-Message-State: AOJu0Yyt9SpSOwP8lfjo7d4+cTzKpG+jZsT7KP798lIRB4NRJ91cewpC
 bvLL7dp1teIZ6FoWr+A3oXRlFrzP5kNB7hXStXCe3H/3L3xLD9HI8XJBsJWxvdOs+1hWXds6MRt
 D2DsWx2JVfXB4gdSOAsqYY7mpgv3lrgJQxfo5dmBNXn8icd/jirj8WbD29g==
X-Gm-Gg: AfdE7clej6FEm0ZoO8PfCCyzqQ7gcTVmHSNBjg+Shu6OHtIIWgYXRvzilWkB5NsRf8y
 3qBgEosLaPeOTpESAW+KmRDySGq7WRSgt9xg9+zSVLJG4+jydyS+A0mux/1Ng8z6P+h29QivV09
 gskxKRQCzNPNd/cWDFD5TS+6W8RLxZd+AWALSvw085Ib+juLQhmuz0TAOSttFo7Ri7XSXg1p8Aw
 Si1w155AiY59mrBXr5ktTHHX/DwJjEmA1GmNsBt3678nszwtv1R37WXfuL0hJ35qvQl/jwJFdHG
 0B6oDorhyMTh7HlNLW4mj0EGgoec0POW9Xh9UdSX5+PworlCGwhj7OZqhPbCyCtwZl1CnyygFWy
 gHeDf1F2xmn4pSBX3w+H21Hla39c0dR1AylHQwbTU2EtyFsEDhsDvOwK3wREo/g==
X-Received: by 2002:a05:620a:4612:b0:915:cda5:27fa with SMTP id
 af79cd13be357-92e784e7e5emr1395745285a.58.1783075671488; 
 Fri, 03 Jul 2026 03:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4612:b0:915:cda5:27fa with SMTP id
 af79cd13be357-92e784e7e5emr1395742085a.58.1783075671017; 
 Fri, 03 Jul 2026 03:47:51 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce12c40sm65180855e9.13.2026.07.03.03.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 03:47:50 -0700 (PDT)
Message-ID: <0e75de7b-8b61-4a99-8fbf-006c5df49457@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/24] hw/riscv/riscv_hart.c isolate tcg only bits
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-19-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-19-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfXykMoCqYsEIyK
 MDU+fRFkh8I5/Q933lqMa673eKeTQ34h5MlAmvNV8uF/X2tZtDWzr9DH6sOJUJJJpJfGnst0xi+
 Wp023uU9jFV1ZnHXiUkfP+5vvGOM0hI=
X-Proofpoint-ORIG-GUID: vULaLL4Ov4z-75GhMCm4ajsEfXk5TCve
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a479358 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: vULaLL4Ov4z-75GhMCm4ajsEfXk5TCve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfX343phcw7qvqQ
 GZJS7CDdNh+OBHG2JBBHfzT0wDX1DCaBMzzG05Bo13mSQWbzAtorIircgDJE579YcvTEOUQ+jyk
 5lqaak+GJTIO3VIxgP0vpUm4MtZGtBAVvBJii8SkkLxlzgMFfNdOBbcAOSKye1hF4UQMHeohkFX
 R1nG6FSwmy5StdWhDLNm2oBudQGeXiwsTAXfqTTFZ/ya2KhKaWmKFlqbJwQwKOMJ81AtJgFqeoY
 IeiT7EG3OcdnZ/gyfoijTj/qVEkisWQvaWtmZjjiHepPwgvw/rEo+KChJzYDj2+t99XohW+SfT5
 KWatOn8OSVfpf3/tvfhywXaoOhoGpDJexaZvCYsuWHn8kS3c5GoSjmrrI8wOXgyrv+DLd9tCNje
 p7oNMl2R89CvXRUwsGWLHNbVvX/sl4UPoysA4mGhv2GxQ+m/+GjNGr2MszMcAV0dsUrmOElou0w
 kC8vxiUYuxWnfmHoEOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030104
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2/7/26 15:51, Daniel Henrique Barboza wrote:
> riscv_cpu_register_csr_qtest_callback(), vcsr_call() and
> csr_qtest_callback() are all TCG only and are not available in
> --disable-tcg builds.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/riscv/riscv_hart.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


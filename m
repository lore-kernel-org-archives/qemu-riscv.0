Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49ECC43211
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 20:05:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdCnc-0000Hc-Qg; Fri, 26 Jun 2026 16:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wdCnH-0000AY-AX
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 16:04:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wdCnF-0001I9-MS
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 16:04:55 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QJ8Wui1616948
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 20:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A2/FU1xLbkYV+voT8ssCBTyWdlAce5DEF6tSBKrrm58=; b=LGRZruV9yePqZDOs
 ZF6ReJFumsKC3VP7OkcxcZhkCaTu313AMvP10SBkN40/k3b/dWS+0NSFlBRhsGdb
 J2973F/vPHrzcAoDx9VImWyFpBaeCLkRmqay7fazprlmwNsVbmehZTQbgf7/5+b3
 O0C28rVJ8TkREvTbbe83E+dt1TCnkkbXtpnqQ4EKx2FKyYuJktwLFXMPz8naplUe
 J+4a2PLwJWkEe+bXgSJabnVfu7NKf8HCuwn/rFDi0lwssuC3kVu4aveHsXUnE5IA
 hSHenjHJzjjdFvFmbOGYpE6Z2ZZhvCrSMubLq3oEFMfTrK2ywrqlwbyIw+ZSrZz7
 RBVdaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1xxvg872-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 20:04:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51a08feb103so23389281cf.2
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782504290; x=1783109090; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A2/FU1xLbkYV+voT8ssCBTyWdlAce5DEF6tSBKrrm58=;
 b=SvdJacSWirwmn1LIIbOJPznco5AW7qCEvZrRLL5uaJMZtBQPuJUt/8ZlsMAsq4UJ4u
 dtqD7zpVwYp7K+lt0GaZ62O+nQHs3HyiYsmjBTGTdi2YB58cYdWMFt8fURtL07Hwd+DY
 YNbeX5d7Zm3VXHcfctQpO7V8ceNFjZDobw8BeLAtHXlgmBXxBdjlGH1jTo8UGwt1Kz77
 rYf7KIojBFn+8LAkI7VQbr5xc6+DvF/L9h23cGMmU6W6OMBU9M30sbpsjVb3lUfjPBSo
 lsEi7W2a8HMy2DCv6Fs6P4joBs0c2+WINmc2I5J9ccMgH3ad1sKFxCV3aj5kBuYzXEs9
 p7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782504290; x=1783109090;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A2/FU1xLbkYV+voT8ssCBTyWdlAce5DEF6tSBKrrm58=;
 b=BJ5fRm2OPhfX0j0Y1AxvAOvdVZ7+0h/ucl7s77FufSvedYx7YXtz/lbYFwf/G5YwK8
 iKitsuaeozFS57VR5SY/gV7Mo4RO7fz0RdrKKXdnE20gpJV6zUGtCgvA/ZRmPczjpffw
 KRbGEJBW3AP+MZ8lZE+vbRlXWlcAj2Lhxdo3jgU1BeWs/kP+qg2LHWa99aPYE1Y/YKne
 YjSfv1pwRx8jCO43htiJNltM5J+/UJ7ho9FZ7E5iWreE+u5NH5RAoAMa9yUFaHk6RNAv
 n37AxOjGjumvJTFRd+AGNg0KonD8tY1EZoiMIfZajrQKUEO2gG4LC2VDgucFfyR/ouDi
 RqPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jJzksCOwcCdzN1eGAfo/jhX0rF+iaVQ6lOTfyAca2rjRrEGGolnt5ks1Qqw2ptg6io1XE5IMyAdpz@nongnu.org
X-Gm-Message-State: AOJu0YxkRzelubBHeJbm6ER5uaUzZdsVmYpeqcvJ46lJ7CkY5J40MnPU
 jmDY6pYVVm9V+XqmrWyLjf1Br+VIWkzTSLVvQBnl6oOF3hHsgKd9BImBOFGaX0Xkxc0YnHAlVxB
 Ke7KaaNFZNz0x2wuKIUReL+CRrIgp9pauZ/tY3WK8ChS/6dB+SFt1psQ8Ww==
X-Gm-Gg: AfdE7cnv82IsMUYA2YI3T3p0Aqm2inlD0qOVYkmqBZfr+Jd/jhA3SPGxwEDepKBgp70
 juOTWgQDMKd0roytOT+IlzSRgTbX2emKTBjScNhdujCo6WVr/13Y4SdwkxswIzha5HADPWPmCvX
 7iWKWO7Zj7iDsvkmZ0iMaBGNr0FOM1wp+oYYu3JLpuJOIq1MVDx1ESS3/Xd1PR1xXfuo2lYWpMz
 E+gI2HnG53ywctF6Dbb1R4lVWEu/nbyU/TKtix2zMNGnrlNIY50EAGkahRTDOTp7j44ousepplF
 2tsDcoyLwynL5+7jIWKMGSCUUhKQq1t7Y8U4+zxOD1KMTzAHJJu69zW2UkX6Y+VTh8e2MF1jK0w
 4TrDc2u56r3Rehq9mPkZ/Efqhaek8CiQ3BeL0sPs+Uahf
X-Received: by 2002:ac8:7f8c:0:b0:517:5b22:f4ac with SMTP id
 d75a77b69052e-51a72758a91mr114057281cf.5.1782504290342; 
 Fri, 26 Jun 2026 13:04:50 -0700 (PDT)
X-Received: by 2002:ac8:7f8c:0:b0:517:5b22:f4ac with SMTP id
 d75a77b69052e-51a72758a91mr114056561cf.5.1782504289763; 
 Fri, 26 Jun 2026 13:04:49 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51a51b0cc9csm102941891cf.31.2026.06.26.13.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 13:04:49 -0700 (PDT)
Message-ID: <1d9f53ca-4dbc-4d64-9811-17bf0328cb3a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:04:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] disas/riscv: Fix 6-bit immediate extraction
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
References: <20260626-b4-disas-xthead-fix-riscv-next-v1-0-74228a3c1b21@linux.alibaba.com>
 <20260626-b4-disas-xthead-fix-riscv-next-v1-2-74228a3c1b21@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260626-b4-disas-xthead-fix-riscv-next-v1-2-74228a3c1b21@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jpC5kP6LtsfekhulGcNtayWjQfo1nDIT
X-Proofpoint-GUID: jpC5kP6LtsfekhulGcNtayWjQfo1nDIT
X-Authority-Analysis: v=2.4 cv=BLyDalQG c=1 sm=1 tr=0 ts=6a3edb63 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=7u43oJkrPVBKl2x3A14A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE2NiBTYWx0ZWRfX5f5hzO213uqp
 AqLv1qyw+Lb8XH8Zjeu9rBJRZtYTBYYsWME9kOlS0hCFa+EtUSTNkrIDkmvJbm+4WyAX/K0d7Ng
 0VfMypIZkzcmJpOlDPutNmXyV0+V3dI+xMgmAv5Zj3JHSgFC/W4EX5SjNDXrkJfSTimMl0xNa6F
 hJdsEhylE9utenRj6JP9f7zr3OhEH9lXIrfy7svkYxRZcBFkHklwVf+0nRtsb54sytQyBiAwnkt
 36GVTKcUcZsBRpgEmBInmQOXgPry8dPrTxa2L/1371zN7NznAwBrbEyQDeipcj7qfZdjA5hkZew
 icE3r7qvPMXoo7BcJVirqCTDT5RzqLHPopZ0ISz4jkZn2yEh04HuMJSArSm7rolXbhTbHlVqZ0J
 GLxIqk137+d/KCCuroiDpaY610zjX/WXGXutr/cVU5LC153zGd9ZgQ3RDT1ci1DZBviBkG69t5K
 ljc323UwtccQdz1r74w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE2NiBTYWx0ZWRfX+QKO45+NFsAV
 9Ov+B+1nDtezYjBtVC+Z5ESI5efaj/WKYv+cbX9h587y6MVZ/u2gLZeUdnSEViYeXg3Hkg7wOCx
 obHCPuiKC8ZkISrr90vQmrRISYLN/CE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260166
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 6/26/2026 12:13 AM, TANG Tiancheng wrote:
> rv_codec_r2_imm6 is used for XThead instructions whose 6-bit
> immediate field is encoded in bits 25:20. The old expression
> left-shifted by 38 and then right-shifted by 60, so it kept only
> bits 25:22.
> 
> Shift right by 58 instead, keeping the existing extraction style while
> retaining the full bits 25:20 field. This fixes the immediate printed
> for th.srri and th.tst.
> 
> Fixes: 318df7238b9f ("disas/riscv: Add support for XThead* instructions")
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 7f1b26277378c225c963d8f435cc7a2fc6e4a0b8..400a57083f90be18ccd12415797bce0df974784b 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -4546,7 +4546,7 @@ static uint32_t operand_zcmp_rlist(rv_inst inst)
>   
>   static uint32_t operand_imm6(rv_inst inst)
>   {
> -    return (inst << 38) >> 60;
> +    return (inst << 38) >> 58;
>   }
>   
>   static uint32_t operand_imm2(rv_inst inst)
> 



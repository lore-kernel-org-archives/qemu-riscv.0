Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ECBC982C1
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 17:00:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x6szA-0005LZ-N0; Wed, 16 Sep 2026 12:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6syp-0005K9-IJ
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 12:59:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6syn-0003s5-UI
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 12:59:31 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GFeNv63709116
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 16:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ax1se0gNN/3xADnjjnXr8VaFvJQk4FnZpZLtXPqOqRc=; b=ZVuqH+h6vEsFKFs1
 6vrK4hLCVW4SID4Ko8jqDUz7qtOPnxUWIcSJy7fVYVyhEc8lttmCcqGDD9OIbzod
 J9i57DIc17Mf3EPuMvEIKv5laygV06AzqSG7APoP7PFHr4wL0l/jiHxxWEEvJm/a
 xQUjG/xHXPYMnZ6VVqAT74P3+LKRC6LswQ1TArpbruq0+LSygMwzI4xyenBsEsiO
 H0Potsp/jku9sN6vimY0Z67k4erc6f0d6QEGUJEpGPQvagZuEFb2vMc/dOvG6Xqc
 hl6JUBgDVHFdF4Zz64MuUl3xQozd7+rgdjVPdE5JJPBagp5fhPc2Sr+/5Vr+UBZm
 wXZS9A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfm1f6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 16:59:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38e7ff7b375so7074484a91.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 09:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789577968; x=1790182768; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ax1se0gNN/3xADnjjnXr8VaFvJQk4FnZpZLtXPqOqRc=;
 b=VFLaa0WQ1XEsUpSwA389/S1kjTJUo7YDWPLpi2lzfK/LB7IOi5PyFl355oSc5/Qg34
 hsMduPM6vmErCHnhh2For3weCI0pQdGAstzKXCsHnPabujOD2cE0vYhvKkg/XhXYSZym
 tB0JBQDxOWMSIVlDswIcJw0BKd43180Qbx63lqyWCnc+r7LooVnezAnAg24pEc15Bhnm
 YaCt0Ioo+jUcg+XIetTGE3slbHyfF8qtySl4AeOHnkPwwOEnaApUSYiL/3b9rugyWRZp
 +dezx7TysvCr776QbbK1HC1eK/rppvt9p+TtZDyCQUXfL3thK25ez24qS7MBP+7vXldZ
 I3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789577968; x=1790182768;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ax1se0gNN/3xADnjjnXr8VaFvJQk4FnZpZLtXPqOqRc=;
 b=C2w825W8VRj9oPIUg2mb+nBm7TxN1Y3V5ASuhAm8uwpzkzc59fM+Dbzu0TLMbZoqsz
 dwvXSejP7CAml4TP/+LlB623sC74aPZUzY9b/uwAEOzJHWwLWRMrffLOSAeuRRsU33/u
 Nu2DKiuapsMHi5IcxleIJ7RqMW8KW9NTlS+1cia2ytye0zGa8KEMn13n8zz3g0WwCIea
 GM7Ux1PaELXEzdFnjHxifNNoff1/5vC08+RQs0uCa2ryI6pVufgB1wwAC8wcmsjzjMox
 7vVkMiIGtzu1XkMiEKxgtGWv3T0gSXzppAJ8XmCXC7QFnPHTTnved53ddvU6mzPb/IlV
 1IHw==
X-Gm-Message-State: AFuF++k6qqsiIY2QZY9Zms0i48SgyQeJECqll5P9FgJduaBgK36QTsrK
 FTIUJxYFyusbCHssDUKRdVFaWHjD5ee1AcfxVYXmfOl/Rfiv5EujYEjFZbIte/GAmijDvyKZ9iY
 DCVP+OI6PGYq7O8AxGBqdf+//c0yWQ5zr0e1wH1r4Osrs8xDnWt5tx2k/eQ==
X-Gm-Gg: AYBFou2lLrry6QXPJ7h7K4e43LWM5ECBGEtGLN2F3SbANt/v1Hrd600iPbDkVbjHzUW
 x9+4yDX+YdCCaZ6CvQx7ybEqW3ATv+VIylprYOvhWR2vA+/74izw9G5rd0/51v585Yysb7Pyjn0
 0trlktiGW2laemO9Hg+ZcI8zkPzN5xvg/R6/Dm+JFhsGSgdDjg2t0NF6yKSQMhblsqsKenC70KD
 IB3FLHUJ3LwvglKKgvuZn1wtqfMm3gxqCgERb6L4SVjn1/M24G3YL13qkmAm1cRAuUhwf17tvpo
 eljQnedcYS7mPd8KQjJji1Zyc6DoHyWvFa+FRbftllaZNMBLC+2/AdodigrRGBrfOGEVQfR3dz/
 FSbcElDt4mN2aSgiGjWaJI+UcRk7+yJla4iQSmxXN6IqudXfyx2As4s5XJnW6dXnehgry
X-Received: by 2002:a17:90b:280a:b0:39d:fcbe:fdcf with SMTP id
 98e67ed59e1d1-39e1e2659a8mr8229134a91.1.1789577967619; 
 Wed, 16 Sep 2026 09:59:27 -0700 (PDT)
X-Received: by 2002:a17:90b:280a:b0:39d:fcbe:fdcf with SMTP id
 98e67ed59e1d1-39e1e2659a8mr8229085a91.1.1789577967153; 
 Wed, 16 Sep 2026 09:59:27 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5af4f0bsm10051395eec.24.2026.09.16.09.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 09:59:26 -0700 (PDT)
Message-ID: <d2fe7c6b-6f63-4db1-be78-e529130710f4@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:59:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] target/riscv: Widen riscv_new_csr_seed()
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20260916-hw-riscv-cpu-int-v4-0-babc367b60f5@rev.ng>
 <20260916-hw-riscv-cpu-int-v4-4-babc367b60f5@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916-hw-riscv-cpu-int-v4-4-babc367b60f5@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaacaf0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SDCjXxXI95NSL3v6CPIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfX9nwDqvnIWyRi
 +rMWF87vwNI1U1Kz4CZIyFUQlEBVvkaGXnv/c+6S1Nd6V2DDiOISm/PRUT1ZAnJh1u+24I/Lb6r
 RHy4HU9agoCMBLzrG+SEyeFLe6bjM2v9nNKNVPsU2o4jbz2Cxdyq3A7NNkdjIZ0ToWywfpTK0Er
 fSbheZg4xQb+IJp4a3xHntDUi90/3F6TvAGn30D7/mJSUEZibRqztEd2a60Ns7U+rYN+CO/DFXu
 UhgedeiW9jE4+/aW865j80kOduK0jZkUqPtgofdW7d5mUMAAp+HX1Zd0/181jaK/xmhR25AwTAE
 31zKM6eVeROftHXZdWbJPgIeR2Xob/4gDzZi4N5/J5639ilHuR6zIn/ZeK0p+TcYIXdMMFc4A/i
 KNjRgslOeMfE0BfL7ZBp0D+KocACSxPeHIpXjC7eYBzd4q/CXotvW7qjm5uvOs1JgvOAjJAcBWk
 qbQh62LBrA0bUafvh0w==
X-Proofpoint-GUID: RfftdEx_tbHjXh6x5B0w4TQ0xYRkdm2G
X-Proofpoint-ORIG-GUID: RfftdEx_tbHjXh6x5B0w4TQ0xYRkdm2G
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfX5hzASUQOAaSq
 CyI3xbKbFLUzqVHWdK4yby0RSPkBq+omhljBE1fmlGMKoTIq2lpCfJpBdpgpAejFDkGoJz7CwYN
 6UkQjeR72LxkeBoOxcd/NcS2R6MEoWA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160233
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 9/16/2026 2:18 AM, Anton Johansson wrote:
> Since the function is exposed through the cpu.h header, make sure it's
> rv32/rv64 agnostic.  Note return type could be made uint32_t and arguments
> dropped, but I chose to follow the existing CSR OP style of functions,
> in case there are other plans for this one.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/cpu.h | 4 ++--
>  target/riscv/cpu.c | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


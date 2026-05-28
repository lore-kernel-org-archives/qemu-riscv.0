Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075BACD5BD5
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:40:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgb5-0003h7-Io; Thu, 28 May 2026 15:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgb4-0003gb-5P
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:40:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgb2-0006JT-GQ
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:40:49 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SJX3ur1960205
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j8ime1biZirUjyeyKkGw9Xx0PStXRebc7H93D37wgRc=; b=HlZ90Zb2GDJhmI10
 O1TTb+1qx7Bk/5a59Q0HfM/Y9wzxfpE2sJyzM3056dQog2mGjdqONHcigQDCXg6P
 /S6huCSgBC0GSVisz+0FgYjt6MVDxNcj33oH30CG4W5fpyFBBZbxAzz4yiZsqm+J
 jC1TT24MiqXkx3J1Qucfz+AdXvFHwD8L6gJmJuZ8EOhpbuRYoYm0rHBPCEyzu96c
 a2IOZdGocKgTlnsmSuoBhY+/JOXlJKMsLoBPP9QLDnEgtLCCSOySQ9kA+32mCWAn
 RQJlCJ5iNyUCN72V32IbgW4r87vp05HYtiD2FjPXntyNtzRNfUopnHAdY4MmK3WN
 IViM5w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5813e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:40:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304e7fbfaf5so697391eec.1
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779997246; x=1780602046; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j8ime1biZirUjyeyKkGw9Xx0PStXRebc7H93D37wgRc=;
 b=S9urOcCobiZ3GiB7EieHKBaY7B45GcvU59sfnwsBNOcrpzrtK8cEZgOL5an8ugNfC9
 G5iDqA/zjwtqGkUqX4PVhmXuVSxH8h8IkNTX8fBQvO4xhTlkHg5I7Wknuybw0jcqYBI2
 17PCYaVsoerWLKphLZvaPN1XQw/B50BxebrGKa4HT+k03g0VUvEJWvkCXcQksl4KJq6h
 ApJAC+1+XIXUpaocQo6Ta6XKcddTgg7vJYpCOG1LmnCqSlBtru8jpwOvC36vjjM9c/Iz
 tOhaqeU5omYpK5lMHKmNEwGPbY3LZvJjy8f6GK1ibmLreOGBCN4kn019PKRNEIctsOcP
 mLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779997246; x=1780602046;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j8ime1biZirUjyeyKkGw9Xx0PStXRebc7H93D37wgRc=;
 b=Tid1d0yq4szVIFrG49yEH9z2empzDhPCvnz7pYrsuYV0R35iZgsGf/xUCvfBE+MkO9
 /EsQBCSq73dlAxUV38DRgXdbTchwsRY8nSOrAmw/tce427e9K+PPu/imknkjSV5/yi3C
 PhXmROxjJdplw8hWD7pm15nAdQ48iRMhGrKjbiz/zB8CcNNN+969sx4nUfHXsQ8JTD8a
 +1g3UxD9ctaEcCg5S0jFDoBEWUfHArNrHH+FGvok7E4QoudSU/W88fdNsNwDEmVmSxSp
 2XW34nktYJiZ2j1uAgHBp0vxO12P5PZpJYU3mcQMqWKG7CLTXeN7bVLC2OX2Oyd37Hhn
 IMYQ==
X-Gm-Message-State: AOJu0YyQnTnqfIp0AOuEkN4mCyGEMtytn6ocy+4d4Az//A3I7pWEavWH
 0m5GVvI19DsU6btJWYbbdhy6h3+dP7mjMszk11/ZxRLn9dFZOr39vUV1l3R2uKamO6n2kSBJBhA
 higqoXm1D0tj44nMYSy4M08qTD5LQwUhr24R0kwflaPqru2VIW5XJw3hvFw==
X-Gm-Gg: Acq92OGtueu2PxiEoTLnFg3fa4AutRG3WVY1sz8j0htEf2+pIV805nkiYDa7LxQnTqM
 QELJ9aA0ptTEafwnYM+Sty+NwCPkmrbK5HaagEtAqXIhObrQayCdaO5yIvxo7IUQwfUt7yiC+NI
 TiR2fcCDQLfFFlwIZ6btQjS3n0ge32vVzh+N3upet27GNulefUv9ncZZJ6SqaRSkiZYwRD9Ykl1
 orqy9bjdXeTsOtCbJAGnmkV0e5sPQSwmEFsdzZNThpxKIPPaPEYMf7yUBs1psbr++PmrRCnTsZy
 sAwelkgIOHy0r3O7mrkB/tb/H8pd/54F7CZ33/fb1dv4fhV6Q88MBsDLVM6kFwiEYYb1Gy59BYB
 2njMSxvJ7UGcFmo97Rca4nHnHXqYgNJa/PoYzuzX2W9oM0ZIX5k3OWmLWYVJvqbxoYQ4k5vqaPe
 7fbKImGM8jCOJ0UoZUMQTHuktI
X-Received: by 2002:a05:7301:d19:b0:304:6782:d551 with SMTP id
 5a478bee46e88-304e8d8b277mr182651eec.32.1779997245879; 
 Thu, 28 May 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:7301:d19:b0:304:6782:d551 with SMTP id
 5a478bee46e88-304e8d8b277mr182632eec.32.1779997245360; 
 Thu, 28 May 2026 12:40:45 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304e990f413sm236094eec.20.2026.05.28.12.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:40:44 -0700 (PDT)
Message-ID: <9d0853dd-5c22-4c46-9c42-a76d18230271@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:40:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/12] hw/riscv/boot: Replace cpu_to_le32() ->
 const_le32()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-9-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a189a3e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YlDpDrQhXjdAcolmsdkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 53IT_OyBRBeEjbX_LSdfd6y0Jc6Gw51V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5OCBTYWx0ZWRfX3/84lIOU8fDH
 hHjCIS93F+qb1ORre40X38O1IByhRH00wg1BsCNLLICyFKFfKRB0oJv6bZX6Gi9xH1I2ojGLwel
 ZuuoH7MjwUCX/ErPelMJWjxV+0aM7ajYiMtJG9uSR+CLzlYKzNi0MMI4ibKXjsdxrwj91qeJVjw
 s9webnAxdnWICi4ZCCfVN3RjOwLzjgoGOueZzCCTt1T2Ho85pydybn+r+M1L1DIdY5duOCmcUJ2
 fM9oSB085cICyHywvlF5FWAEq3cD3gfy9Iilbf1Ft/L4uPXXeKDLEeTbRol3y4p+AfbciAI0K0z
 nOXGWtB7s68NE0K0DIRhipY03FtP0BdQS2D83WyjmeMqgKplXqrEJjbRX9MWhtPGvGbuxdKW4Lu
 SoIw7B7inVvCJv5Rj+SgF2apsnoVxqpEXUYK5lQ/4TOiur5/JtxgNxHadOSac+fuHnejofoCKcq
 g66U/cxv1gg+osGEXBA==
X-Proofpoint-ORIG-GUID: 53IT_OyBRBeEjbX_LSdfd6y0Jc6Gw51V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280198
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
> Rather than adapting the array endianness when it it
> filled, directly initialize the CODE words with the
> correct endianness.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/riscv/boot.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
> 

One could argue original version is more readable.
Any specific reason for rewriting things this way (performance, personal
preference, other)?
Not a blocker, just want to understand the original motivation.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58D4CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:39:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT26Z-0008Bt-Dj; Fri, 29 May 2026 14:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT26K-0007zB-IC
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:38:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT26I-0001dm-Dt
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:38:32 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2LBE030021
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3zZ7sVCQ0xTCWhIQM453AbNsQTss553nVYj4rAnmItA=; b=GW/xRJlM9ZRr/mju
 lIrg/Dv7QgHIWZRVIGCDNsKz7wIG3uAWMkTmjwuesRxWc2K9EvLJEBQ2ICvZlASR
 mTjkRJ5GqDrXLCl4ot+nckUQkLl2s2cH08e18id3kJ2D351iErlfkj16/P8oFXSQ
 U5CUqzAsMJ4OYQppgrygbjny33clo01K/JzsdDEAtvCNTRmZAiQxpS/ZrwQMTypM
 qyrZg19uiwhPt1EAUlAggmZQ1Z4QVgBQbwSkP0kT9MQx10pW+XGaII+4bAjdf7Lg
 kwZ/6mnT1ZejOpRmGhufS4FPspd4OWkrG2yVfGrdbJDwLViM5DKKyBhU+JX76ypK
 xvkl8Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumwejk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:38:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304ea1eea05so2865722eec.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079898; x=1780684698; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3zZ7sVCQ0xTCWhIQM453AbNsQTss553nVYj4rAnmItA=;
 b=CXx3okaO67QeNqmUuLS/GJwVmDJw2F7D2I19P982wYf9KJGWx3J8CkefEbOQRTJz1V
 wolCXGUM4SjeEXbOnOa6613UN0/jPvIQWW3Z4C5jwv6hvmaWrVlJtfMbpJHOQ3fbwYEQ
 IGDpK6v05bEUYNiUHCFTKN//NZuuAE6g7wQFFxE39Vpwr37GZhCXFj1PJ+Sl0dCZoro0
 p7eykv0Xl6HXfbMmmqH7duUl5aarE0s0uYY+zBxe5W9QLbmrmiRhHb17rvMGis/WXXN9
 nfOHBSKjFtkepVHsVqUO1devwZzWUmc1Unjj52BCpPlWqvUpwkrYx7wYTnaZtx4jZ/J3
 JpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079898; x=1780684698;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3zZ7sVCQ0xTCWhIQM453AbNsQTss553nVYj4rAnmItA=;
 b=E0waf6cE6yvL6Fsa5mrNaG0tyuW8G5785cf0nxAeCPG0Vj0UGIQx+RApQsyHbr1dN8
 hZJKIDkposxH8ab71FYddabReRX66t34C/yYM6iQG1UNuARiIrmX3+8lmOrl/4Bf7RlV
 8UIbl7uiauE+60lGogC006QVEbL0NNU+WdTZRCxmSoBYn6OcKQo0nadjgbnj1VonbA0f
 uA7fjWGCSqvVB2BNG69Ov880rb88B9lKpQc+bE2dWZW/4AJ10iodJ/qygtukRkxna9kW
 GF/i76nvjngCBZi+cwzHl0xnE+zD5IHtksnENF9MvU8zsowUO1wU/kUn6i5lzD/iaDbX
 BSfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FMGuGvSyN7AUTfGlYr66uTF4y87shJ2gaKbeMzaT/bOzI+FKO1iXOIscgHv6wpwVLgblAvTLUjU8z@nongnu.org
X-Gm-Message-State: AOJu0Yypq7SnfhazaZeMKeH/N+/zuhWY8yircxlaKES3Yk+xqCX+9ASy
 QRUX6X/oJj2+6zuR+a+tXzUGQ+wQZajziB9yz3WVyE5t4WNOcw6ZX4HLPTP0aqhItF8z+zsfmYT
 c4ea50rPJyOhGZ6/isKMSjO0VeFno+j7KSbSxaORFAg10d9Q4tLB5D6fpzg==
X-Gm-Gg: Acq92OFOqSoAisAaAEXvehrgcQT7sGPc+ftycshQjKGqW3gmDhyPF06Ue+/ItTa1KBN
 /n+8Dj7vJgj70g3BhA/yytVc/9ibg9tU53f8lDlqTeaC1UBw56bBGWxjr/vMdkXL8K4nu0Ty2BO
 K5Fegd9KjQaQit+guVoJh976ZBVQc0p2dPj/d3qgXumYUySrC4F1pIReQ50r1wxs0wikZy8nux2
 Uwj/CWofTqlTHaH9BbW2R9BRnTwJKJmxEO0i6+/0qbROQSgWrXYY3oy4QxZLR286DQLGy7gomsn
 o2Y6gEk6NtOn2ojcOT/8nXvC35OaXLo6O4YYj9NNdYAdxHN6VEdbagBogwRz3XY8w+KM79LAbs4
 CDFJ4jbcZ0ftXQYDWCDcxcKSvt1s68K4sGhHUmTbxH8EcpOEOH7n4L8AMFned3GM4YB0J3H4+Ae
 QbKhVOaKt8PRxbZOSUsEw1GiHL
X-Received: by 2002:a05:7300:e58b:b0:304:d32e:65f9 with SMTP id
 5a478bee46e88-304fa5295f3mr502782eec.6.1780079898255; 
 Fri, 29 May 2026 11:38:18 -0700 (PDT)
X-Received: by 2002:a05:7300:e58b:b0:304:d32e:65f9 with SMTP id
 5a478bee46e88-304fa5295f3mr502763eec.6.1780079897797; 
 Fri, 29 May 2026 11:38:17 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed30a012sm2190193eec.10.2026.05.29.11.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:38:17 -0700 (PDT)
Message-ID: <80e2736d-f1cb-4249-b80a-89856ee17661@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:38:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/17] accel/tcg: Convert X86 AccelCPUClass ->
 TCGCPUOps::cpu_realize
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-15-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VXuc-QCcrL1IuMthQ3tk-0151BPb5bZz
X-Proofpoint-ORIG-GUID: VXuc-QCcrL1IuMthQ3tk-0151BPb5bZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX3WvyDy+HfESU
 0mC0mkIYdKFYTNILkCm3N3zhLiNiuA3U+EvVwzifb2gN9uidcqmEYHOQjFdpvWAL2BHUewjrzSa
 cYkbKdmLfd9Tkc67Zv1Ya9OvdDi5nZTuIwEuy6K2PwEF0Xvv0zb+/kfIE0SU4SWjjZDdklFE0mr
 33Jb3OwWhHC1FP+bLMRK1+T367jmT18lJHEs2Zb2063QIyLbwtC6Z9IFqA+a2NCgejgiBLhAkt4
 Sr50W3FJguW86uNTA+xARoGhVzQTX/wJeq/FvYGbe073DEW5xYvEvRvfuEf6TMyhUEnV086xQ4V
 q6ZBI+smgrVMBK3DmW9nFJ87Pc7TfKA/ZnwVQMGPW+LWDF5mW88PKudvM2vKbg8J/iLEvVj47Ra
 +KooQUsUBCU7INupfbh3mI/7C8WFK6ZYkvt2ZdituHIF4jpnX1qN9zdJvGveA4HmCZwhrpIPd+j
 gWfJw6AzDWKxadhL34w==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a19dd1b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_zWEW-5a1clIKPNZquMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> Register AccelCPUClass::cpu_target_realize as x86_tcg_ops::cpu_realize.
> X86's ACCEL_CPU_NAME("tcg") TypeInfo is now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/tcg/tcg-cpu.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


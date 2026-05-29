Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54651CD6E49
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 19:57:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT3KF-0004sb-IF; Fri, 29 May 2026 15:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT3KC-0004pi-Rr
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:56:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT3K9-0006iP-4s
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:56:56 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TIsq7X3526533
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 19:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L1FH1W5U1Zo+xcXwsO7uD2MIuU02K6pwTbQnTJHDcOU=; b=QZSH5gu2JZQUQ1o7
 m01rOZSkv3wqp3Z2WuW9qTn68Ihvqp9Tl+rZk2cS460yxXAnIaS6dhW4GupV1gcn
 fT3+rUdSn8eDCrUhN45CAo7LPMezrZCVp2zx0uSqIB0EbI5BFppWVHxObLy+Y93i
 IOnmZcyqOUzTuv5VYxKh6w7c1sPrdPspYid4GZYr/+Apvxu03Ce8iklEDI4S735D
 d6vMkCllrqT0AwIUgoLDcppJvPVuXTtMNrEIaWmrhRmk13U6o7VsjhXMfNLM86X5
 iqfyzJNsyiAeiBN3c3+ci6mux+fWyQdW1qQL1i2dxflKPhSHZYogyd87vjyU4EoZ
 4cT8FA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efgge88uw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 19:56:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304ea42b025so351420eec.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780084610; x=1780689410; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L1FH1W5U1Zo+xcXwsO7uD2MIuU02K6pwTbQnTJHDcOU=;
 b=MbVWp2vy7kBmEvdk5qTDE2oHg7IsEXrPdyOKE4Bq4RJdLzTRn+lLnhCjTuwAEKJKoU
 r9FnzgFWBKBTpaQR8T+8MUfDYBe14TNeIplB2h6AuqMSdpjiPPo2aNrw48rQYVGX1obW
 7igq+jU9i0AwX++dQQtrIt+QsNfrig5I/bpjhlicCops4O/rMcB31271ZdAjGFlid4lZ
 UkTSKfOWCjxugfBg+6tSlwr07DQ9+x802gRkgVwBpB+6ghMAEfOTID/TVDEI9Vi8SO1i
 vRkWNkRcxYcAisUesFJjjw1GMKkQQJ3yu2qHqoUqsxDIak+T8hYS7zivu0IbnLGs9lK8
 nhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084610; x=1780689410;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L1FH1W5U1Zo+xcXwsO7uD2MIuU02K6pwTbQnTJHDcOU=;
 b=Yrojw5AwYClF7tsveVP2Yw+IrqX/Ha6R3ytRrEZESsJYJJ4pxBzbZwXBY8NzdYix6d
 Y2gh+AwgbeLMcpCLjxFGiAbNI94EXO4zvTxKCeQlKl+aI9NppSQBZGN8pm97ijdVDvIo
 hFQRuz/r6K0PhGFv+1d4WW7i44BXzBSIjnNbKnot8des8g8iYTsbyTuRInmN00FyzVjG
 Aa9GvfSamSg1cErQWNFmQTeH3e4am1d4PXsItMbE13RFjVGJBrrpzYqyeyKunS2mqsE0
 4jb/p3riifRTLVnL30vvFUVlNv4bgHJ9ARlCN/wMUisDvKCIv0FZP/IcQqQBgDVB1Nme
 CHVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XMFeI+EHAg21cO1MdOgSWsxtvBdMCqjy7X+f4Zs5w243U04vfb3X/lH0qvJmiOWv1VDO+GLctJ3nj@nongnu.org
X-Gm-Message-State: AOJu0Yx33ZRx6DMJU/NIoVptbcFeKie0GFgsCCpRxtHBqFuK1HX5UEs5
 /PK7Nh3aHZPlWHma696wJlHb/8l20+VR96VzrWtYpMbIIO/zD5GT5F7ClWqBHpO2Fj2+sIHeIOf
 NBf1P6Df0mbH8JFOl05qnsyeF0X6cXT8UXaXTulWwQnFC1dotNLUc4k9tJA==
X-Gm-Gg: Acq92OE9V6BF/0Yxb0nQ9nK9Dw1W2RT7KLs+bFXnt7/xGr7/xpgM7HMmrJsSpWwaV1W
 KdH3E0WPttJ7lSj9sxqiNC3fzPPLtC3VsMRS4qolsIv8NYRuMwiA1jbu+vXHo2n4dDWQH5JSVxl
 31dEbikWqtvhmvMlUWbIAS2P6G8Fd+vN6VJsciu91dIdfMZI/Xp7L7LHIZRAwwXaatbehsSrZPK
 qhao8xW+Ueyfg/ZfD79Zk0EfQ3QKZbg3EstHl2b6zUEhxh9GcaG6VzG37LHgjEMWWDHxQvwM2dP
 vQ4d4tFZVKt+V2+qwTdxj1cKxVe+zsyMCN4sBTF5OmPdMYWSLpZcPEPyREOUJtoOoS9phzqWhTS
 0Z885Yj1hlSK5EyWUKnF19nq6ABs7a8Bv3N8afcQOTMc+9Lzcpu6lE8I3xFNsc8FFYEndY00+x5
 6YE/VIi1DhAR/pvgtV8rVJCSrZ
X-Received: by 2002:a05:693c:620f:b0:2c1:82c2:bc31 with SMTP id
 5a478bee46e88-304eb182e11mr1526487eec.10.1780084609593; 
 Fri, 29 May 2026 12:56:49 -0700 (PDT)
X-Received: by 2002:a05:693c:620f:b0:2c1:82c2:bc31 with SMTP id
 5a478bee46e88-304eb182e11mr1526455eec.10.1780084609020; 
 Fri, 29 May 2026 12:56:49 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c3121sm2253871eec.5.2026.05.29.12.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 12:56:48 -0700 (PDT)
Message-ID: <748cc9e7-072a-45db-ba42-372669858f60@oss.qualcomm.com>
Date: Fri, 29 May 2026 12:56:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/17] accel: Remove need for AccelCPUClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anton Johansson <anjo@rev.ng>,
 Claudio Fontana <cfontana@suse.de>, Eric Farman <farman@linux.ibm.com>,
 Alexander Graf <agraf@csgraf.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Reinoud Zandijk
 <reinoud@netbsd.org>, Halil Pasic <pasic@linux.ibm.com>
References: <20260529194940.97143-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9tgfaPD1XL5TBPZL3sPVctfL3Z-o0jMD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE5OSBTYWx0ZWRfX6dWWDpNAGfCh
 Y9iduCxd2lSrgSl+CgFYY1H504b/bH6RrMypKr3Vfz14q7Vw4aewa/lnonxWcz8ndRQyENtK+8G
 iaYcegcd76FWwAvIXXMRkF+mn3TvWJums5hSFXGQoHmctLZHLcvCKVGkh8Ivx9H1+VKUx1pUkfF
 kMgQn2zXoPBLI/XvVlzQJIjlqsarKLGuSUJnjvHY4MBLIsNu8fPiLll75VFnwDl1gass5lxq6VX
 8PSCc37KNBr5ByYaQGs7XHyvqZXMT60iMXlUFadPhy3r47w5PZaU/wv/HYJ5XPJbg/W2XAcdKkM
 50njBKQL96juvipBkBzGbsm/lSnY3JYoBkzbcCpLC1MK5295/9h2e4OAOv8G1XoZWnBHmLJabxE
 xaJXLR1EPXaO7BnkstwjP6tZrWv5+Cus67iB9BvQvKiyP3FTNYqNYv2YYyWMH9WXAyuZXoeoHfo
 288PMTZf7WBAde4PKDg==
X-Proofpoint-GUID: 9tgfaPD1XL5TBPZL3sPVctfL3Z-o0jMD
X-Authority-Analysis: v=2.4 cv=Z4zc2nRA c=1 sm=1 tr=0 ts=6a19ef82 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Zsuq9JpdEuuag0fFG78A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290199
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/29/2026 12:49 PM, Philippe Mathieu-Daudé wrote:
> Could get re-review: 4 & 5
>

Looks good, thanks.

> Move cpu_init/realize hooks from AccelCPUClass to
> AccelOpsClass. Specialize them for TCG in TCGCPUOps.
> 
> This drastically simplifies the need of per-binary QOM
> types per accelerator per target (see also the nice
> diff-stat).
> 
> Based-on: tag single-binary-20260528
> 
> Ignoring checkpatch.pl:
> 
>   WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>     accel/accel-target.c
>     include/accel/accel-cpu-target.h
>     include/accel/accel-cpu.h
> 
> $ git backport-diff since v1:
> 
>   [----] : patches are identical
>   [####] : number of functional differences between upstream/downstream patch
>   [down] : patch is downstream-only
>   The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
> 
>   001/      17:[----] [--] 'target/loongarch: Remove unused 'accel/accel-cpu-target.h' header'
>   002/      17:[----] [--] 'accel: Remove AccelCPUClass::cpu_class_init()'
>   003/      17:[----] [--] 'accel: Rename AccelOpsClass::cpu_target_realize() -> cpu_realize()'
>   004/      17:[----] [--] 'accel/hvf: Remove need for AccelCPUClass::cpu_realize'
>   005/      17:[----] [--] 'accel/kvm: Remove need for AccelCPUClass::cpu_realize'
>   006/      17:[----] [--] 'accel: Introduce AccelOpsClass::cpu_instance_init handler'
>   007/      17:[----] [--] 'accel/whpx: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init'
>   008/      17:[0002] [FC] 'accel/nvmm: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init'
>   009/      17:[0002] [FC] 'accel/hvf: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init'
>   010/      17:[0016] [FC] 'accel/kvm: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init'
>   011/      17:[----] [--] 'accel/tcg: Convert AccelCPUClass -> new TCGCPUOps::cpu_instance_init'
>   012/      17:[----] [--] 'accel: Remove AccelCPUClass::cpu_instance_init()'
>   013/      17:[----] [--] 'accel/tcg: Convert AccelCPUClass -> new TCGCPUOps::cpu_realize'
>   014/      17:[----] [--] 'accel/tcg: Convert X86 AccelCPUClass -> TCGCPUOps::cpu_realize'
>   015/      17:[----] [--] 'accel/tcg: Convert RISCV AccelCPUClass -> TCGCPUOps::cpu_realize'
>   016/      17:[----] [--] 'accel: Remove AccelCPUClass::cpu_target_realize()'
>   017/      17:[----] [--] 'accel: Remove AccelCPUClass and 'accel/accel-cpu-target.h''
> 
>   diff --git a/include/system/kvm.h b/include/system/kvm.h
>   index 2c31fa6019e..a249f076763 100644
>   --- a/include/system/kvm.h
>   +++ b/include/system/kvm.h
>   @@ -225,0 +226,3 @@ void kvm_irqchip_change_notify(void);
>   +void kvm_arch_cpu_instance_init(CPUState *cpu);
>   +bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp);
>   +
>   @@ -367,3 +369,0 @@ int kvm_arch_destroy_vcpu(CPUState *cpu);
>   -void kvm_arch_cpu_instance_init(CPUState *cpu);
>   -bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp);
>   -
>   diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
>   index 113a23f2384..edad3c1acea 100644
>   --- a/accel/kvm/kvm-accel-ops.c
>   +++ b/accel/kvm/kvm-accel-ops.c
>   @@ -101 +101 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
>   -    ops->cpu_target_realize = kvm_arch_cpu_realize;
>   +    ops->cpu_realize = kvm_arch_cpu_realize;
>   diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>   index 7d194ea112b..0f1a98b430f 100644
>   --- a/target/arm/kvm.c
>   +++ b/target/arm/kvm.c
>   @@ -1785,0 +1786,9 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
>   +void kvm_arch_cpu_instance_init(CPUState *cpu)
>   +{
>   +}
>   +
>   +bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp)
>   +{
>   +    return true;
>   +}
>   +
>   diff --git a/target/i386/hvf/hvf-cpu.c b/target/i386/hvf/hvf-cpu.c
>   index 5d74ca6fd56..536bcecd7d2 100644
>   --- a/target/i386/hvf/hvf-cpu.c
>   +++ b/target/i386/hvf/hvf-cpu.c
>   @@ -58 +58 @@ static void hvf_cpu_xsave_init(void)
>   -void hvf_arch_cpu_instance_init(CPUState *cpu)
>   +void hvf_arch_cpu_instance_init(CPUState *cs)
>   diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
>   index 10ab7b2a4dc..2973e28122a 100644
>   --- a/target/i386/nvmm/nvmm-all.c
>   +++ b/target/i386/nvmm/nvmm-all.c
>   @@ -1214 +1214 @@ static const TypeInfo nvmm_accel_type = {
>   -void nvmm_arch_cpu_instance_init(CPUState *cpu)
>   +void nvmm_arch_cpu_instance_init(CPUState *cs)
>   diff --git a/target/loongarch/kvm/kvm.c b/target/loongarch/kvm/kvm.c
>   index 9d844c4905a..167fdd515be 100644
>   --- a/target/loongarch/kvm/kvm.c
>   +++ b/target/loongarch/kvm/kvm.c
>   @@ -1497,0 +1498,9 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
>   +
>   +void kvm_arch_cpu_instance_init(CPUState *cpu)
>   +{
>   +}
>   +
>   +bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp)
>   +{
>   +    return true;
>   +}
>   diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>   index 013f5e852e1..894962d509f 100644
>   --- a/target/ppc/kvm.c
>   +++ b/target/ppc/kvm.c
>   @@ -2354,0 +2355,4 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
>   +void kvm_arch_cpu_instance_init(CPUState *cpu)
>   +{
>   +}
>   +
>   diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>   index 2e4f435c537..46730e72a92 100644
>   --- a/target/s390x/kvm/kvm.c
>   +++ b/target/s390x/kvm/kvm.c
>   @@ -2613,0 +2614,9 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
>   +
>   +void kvm_arch_cpu_instance_init(CPUState *cpu)
>   +{
>   +}
>   +
>   +bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp)
>   +{
>   +    return true;
>   +}
> 
> Philippe Mathieu-Daudé (17):
>   target/loongarch: Remove unused 'accel/accel-cpu-target.h' header
>   accel: Remove AccelCPUClass::cpu_class_init()
>   accel: Rename AccelOpsClass::cpu_target_realize() -> cpu_realize()
>   accel/hvf: Remove need for AccelCPUClass::cpu_realize
>   accel/kvm: Remove need for AccelCPUClass::cpu_realize
>   accel: Introduce AccelOpsClass::cpu_instance_init handler
>   accel/whpx: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init
>   accel/nvmm: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init
>   accel/hvf: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init
>   accel/kvm: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init
>   accel/tcg: Convert AccelCPUClass -> new TCGCPUOps::cpu_instance_init
>   accel: Remove AccelCPUClass::cpu_instance_init()
>   accel/tcg: Convert AccelCPUClass -> new TCGCPUOps::cpu_realize
>   accel/tcg: Convert X86 AccelCPUClass -> TCGCPUOps::cpu_realize
>   accel/tcg: Convert RISCV AccelCPUClass -> TCGCPUOps::cpu_realize
>   accel: Remove AccelCPUClass::cpu_target_realize()
>   accel: Remove AccelCPUClass and 'accel/accel-cpu-target.h'
> 
>  accel/tcg/tcg-accel-ops.h         |  1 +
>  include/accel/accel-cpu-ops.h     |  3 +-
>  include/accel/accel-cpu-target.h  | 31 --------------
>  include/accel/accel-cpu.h         | 23 -----------
>  include/accel/tcg/cpu-ops.h       |  2 +
>  include/system/hvf_int.h          |  1 +
>  include/system/kvm.h              |  3 ++
>  target/i386/nvmm/nvmm-accel-ops.h |  2 +
>  accel/accel-common.c              | 68 ++++---------------------------
>  accel/hvf/hvf-accel-ops.c         |  3 +-
>  accel/kvm/kvm-accel-ops.c         |  2 +
>  accel/tcg/cpu-exec.c              | 15 ++++++-
>  accel/tcg/tcg-accel-ops.c         |  1 +
>  accel/whpx/whpx-accel-ops.c       |  2 +
>  accel/whpx/whpx-common.c          | 17 --------
>  target/arm/hvf/hvf.c              |  4 ++
>  target/arm/kvm.c                  |  9 ++++
>  target/arm/whpx/whpx-all.c        |  1 -
>  target/i386/hvf/hvf-cpu.c         | 25 ++----------
>  target/i386/hvf/hvf.c             |  5 ---
>  target/i386/kvm/kvm-cpu.c         | 25 +-----------
>  target/i386/nvmm/nvmm-accel-ops.c |  2 +
>  target/i386/nvmm/nvmm-all.c       | 19 +--------
>  target/i386/tcg/tcg-cpu.c         | 28 ++-----------
>  target/i386/whpx/whpx-all.c       |  1 -
>  target/loongarch/kvm/kvm.c        |  9 ++++
>  target/loongarch/tcg/tcg_cpu.c    |  1 -
>  target/ppc/kvm.c                  | 27 +++---------
>  target/riscv/kvm/kvm-cpu.c        | 33 +--------------
>  target/riscv/tcg/tcg-cpu.c        | 28 +++----------
>  target/s390x/kvm/kvm.c            |  9 ++++
>  31 files changed, 95 insertions(+), 305 deletions(-)
>  delete mode 100644 include/accel/accel-cpu-target.h
>  delete mode 100644 include/accel/accel-cpu.h
> 



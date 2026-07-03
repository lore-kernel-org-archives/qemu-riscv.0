Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E568C43602
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:49:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfaWi-00041l-14; Fri, 03 Jul 2026 05:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfaWg-00040Y-Nq
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 05:49:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfaWf-0002Hm-0p
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 05:49:38 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66368IYv3054318
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 09:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LGN3HMB39YqYi6H7y+f8l31qIF4MTB4SKVc9Ex8b5Ks=; b=EkXzLtBgX6hRE3Da
 sHTtoxx1EKgA+Ose5EF7Urhr3+d1OSnvBJKiN3OXmxxUWC1T2x9ue0A2ZBpKWljt
 NkPEMI0IxATTMeog2g6OvqYduU5uNvvawVwHH1La04CzPJaGYS5qBKJHK7Zlg9Ej
 uL3WmcPlTUzvcNlZsH2iPM7orETxOK1XztEaxehNevgnfa6UQNYQ7xzp7eTQrGzJ
 rgDOS57zbIhUTcd1wsSOKhA7Pgh3LNugkth0UjR12FVarUxkQnzMsCvg42Z419gp
 zlSmlKv+VP7kh9KIPWBRrPJ0gcIFLLxV8achxt6JuwvVL8rVmbDqPYuXXD7/sgfk
 FX/5Nw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00tqs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 09:49:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c0d6a2f4cso4413351cf.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783072174; x=1783676974; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LGN3HMB39YqYi6H7y+f8l31qIF4MTB4SKVc9Ex8b5Ks=;
 b=FWBIRmrjQU0e0CFJHLqAHlOaKnSX9Jg/qy6tJHTcl7lB8x5Lfo+8bfl176ABNL4JNb
 vnQaQ68cSwbkOhGiddeoJliIdTD3vVeZf61uHLuqfNwx/fdZ/ofsMtlLiu+dkQcu7v27
 voYC8AEI3Mb/StYq8Ex9xPbsQCpZEc4N0AXKVmJpQqVAze1QtirGd9XsYW+nQh59WU9Q
 CZNOvna+Qqyu9+0M3FPhbcDPI5jWHaD1IY9+FQ0oWebdNaGGhONsy8Y2wGIlqxi1jBVq
 teT4xQ1EuOf5CWefoyiE5hcRwGP5+vA2sdoUyxGkiLLVif6tG95ZbO46qkTuZJo0hBpg
 uu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783072174; x=1783676974;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LGN3HMB39YqYi6H7y+f8l31qIF4MTB4SKVc9Ex8b5Ks=;
 b=LmUebRppIYhVMf7eeU11yg5XrAOboiUQwztvSK6bASfCo93rOA7iP+4WGOGHjtGm5B
 p2lanaIKeaOBsOmvOBH2tVBrc7zvjcLBcCDkvwYIm5Tiv0dWhFS9M2tVHeUs4OJs2w0o
 O/6u2IOf4pB4FVPHJp56hUl/dILVBOYIuyCVgQDoITVZnD0tZdFOehZUV6rI71JhLXqv
 FTqqStWkm6ILOu2pvqhB3rU1X2NByS3HDxjwUrf8uDo9N7e4LJvsQJSrEiG6RQN/cLiR
 /gh198igl2FzqScq8Uh31UvCvn9IVYWwfa453d+xQltWyRGyvdPjEkb+687olo6maxzu
 0xnw==
X-Gm-Message-State: AOJu0YwUFMJ1Fy7HeXPk9Amac95xK8Bx9GGfUqrrxQP4mJ/4e7M+gZ4F
 AEg50pNn0G4ma095sePxaEk/7ggVk9Z7X+jcRQln0miwDsYHockFN35uG6cHpqDXgUdSqElV0r+
 TN6t8PqPXlqsiA0XZ0nAGnObDqzNjZCibZCFB5lF6SmF0AEYdYliIY9U7aw==
X-Gm-Gg: AfdE7cnWXMlHpXBwFOgcjuqGjvOUmEbZYQ4fg/Zq1viNc8KEi9lCaFCYK+E3zIYN9Xm
 iFeq45pWLHqy5TeAU1SJ/EbH2wpiqCo72jSLnmD7k/8Mnjtojj11exQTo2tZa/PPpaSgMbqAPzy
 nLbK0rRrTTi6nZFFpfm7YMH/quMFc3yi4BGEXR0+378XpDVxOuwuLPFhs4Ekc7Xynn0T+w9p5+v
 RyrfJdb6sIqtBcOXIGMTAnP+gZVM8SFbYNMhh9Ixu2jQQhr+HwFPbI30Xu08cpr4Sbim6Nbcs8J
 jULDgi+GmzD9ywaBVfOMm6aVMR8f02Z6NjyTPUZ4x3uMWRKk1Ia4dxw9EfWl8SaEgQgrCjj1EAP
 nIZ+bklZKNPiVz/lzIXZcav38Cef2q9SkVC+ak9Hpqna1
X-Received: by 2002:ac8:5707:0:b0:519:fca2:346a with SMTP id
 d75a77b69052e-51c26a61506mr115838221cf.23.1783072174234; 
 Fri, 03 Jul 2026 02:49:34 -0700 (PDT)
X-Received: by 2002:ac8:5707:0:b0:519:fca2:346a with SMTP id
 d75a77b69052e-51c26a61506mr115838071cf.23.1783072173854; 
 Fri, 03 Jul 2026 02:49:33 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f46aecc908sm52985116d6.0.2026.07.03.02.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 02:49:33 -0700 (PDT)
Message-ID: <7cdefb21-7cd7-47a9-b242-de39f3b024c7@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 06:49:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/24] target/riscv: move valid_vm_* satp arrays to
 cpu.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-13-daniel.barboza@oss.qualcomm.com>
 <d4a4c873-0c7f-4de3-98f7-882f74bfe151@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d4a4c873-0c7f-4de3-98f7-882f74bfe151@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Tm2iPVblb52klc_gAGRzDWbfD5SL1-pU
X-Proofpoint-ORIG-GUID: Tm2iPVblb52klc_gAGRzDWbfD5SL1-pU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NCBTYWx0ZWRfX6gy6vnYzDKCl
 wg/J/DVNQNiocRyQshw+uRLHdPyMGf1cAlqlCEHmdVg0fEnZ6wbmFtbT7hjgsaoP6ICzXhlKrp/
 BdT/LKpxGbMmk4gPZnl9C5Xde4S2XyU=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a4785af cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=h4OL2NWzkvS0Eyh6BHUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NCBTYWx0ZWRfX6Hh/BP0vnvCw
 k0YavP1i7P6jTy3uR2rM0A5DpASLr7hfrP6UjCeptJZJB37onRuoz2xBoZGlrwImgI29r0oN8s9
 Yf/PE1NZikfoUWcL0n2y1Y6oPhj4ELQq7oL24w6NmnUTjkhWgSsGvc0vJFAo9JWFMvRq+lRueGK
 ejpzqaYCgsXALg76NQGzdvjv3yFlZiELNaZ19hMSskLa08wDjPfGD38kPKZ8F0aXSNrbr9XdCA3
 dAh1wMusl8sXy2HWZBMEeTUitry21NPjfMelYFKDFq1kUIKMN0ibd/nIoLW3j3NA/NWuFb+pQ80
 //dKqJL2I+C3T9LyrtL1/sg2iJ46mBXW0KHZs/5vLmcQx3FJeZwd0V9v7zG329AdTH9m8rLX/R4
 0tFm6KNn7DeAcnU5Em89Ss9Bm9iSUQZ4aHUof9IlfUpCFWH7BGWBBT4gcof0prXOWqeCdDy7bIz
 eXEewBfVR81ERTq4VnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030094
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/3/2026 12:10 AM, Philippe Mathieu-Daudé wrote:
> On 2/7/26 15:51, Daniel Henrique Barboza wrote:
>> These arrays are used internally in tcg/csr.c and in cpu.c in the satp
>> options logic, which is common for both KVM and TCG.
>>
>> Move it to cpu.c to allow KVM to keep using it in --disable-tcg builds.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   target/riscv/cpu.c     | 13 +++++++++++++
>>   target/riscv/cpu.h     |  2 --
>>   target/riscv/tcg/csr.c | 12 ------------
>>   target/riscv/tcg/csr.h |  3 +++
>>   4 files changed, 16 insertions(+), 14 deletions(-)
> 
> Preferrably before patch #2 "target/riscv: move TCG only files to tcg
> subdir" if not too much trouble:

Done.  I'll send a v4 with the change.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Thx!

> 



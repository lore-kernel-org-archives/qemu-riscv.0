Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67321C5DF87
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 11:06:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx0aa-00005X-LH; Thu, 20 Aug 2026 07:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0aZ-0008WL-KO
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 07:05:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0aX-0001Cy-CB
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 07:05:39 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KAOpEv2214531
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 11:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uT1ndCgiqc6w8zosFh64mo5qwnmEsbAaXbzgizwzutQ=; b=bUOTjGdyhoaI/hxS
 R2rOBSbXg2psd5czTLGzYJTFQ67WsAKxCRYNYAjhEGyEq3s8LrVG4D7kottpzvJp
 J0yWbYfCMGtFpVdakmlNTdT/qnJ8QtcIr8XO0QOtvQC5DkQsowAXFs2BScvdy+8U
 2K/ApcDokOGmenyJGrSrPmBci9+C0Lr1d5CclhR0h0p9EWVd9pFqeIPxx3fH43an
 BtMmtWItqncDtc0VobPuMmQQpeiWUtEPYMho9BmQD2l4bqIUmulw4lto+p9ct9cA
 Su8pVtH5DKag6CQnNfHWYQ1IAwoSA41Bj5gzpepoauEOt+7nFlY/8x2TI+jCUNdL
 N863TQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytc84jk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 11:05:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so269297885a.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787223935; x=1787828735; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uT1ndCgiqc6w8zosFh64mo5qwnmEsbAaXbzgizwzutQ=;
 b=CCt4CEbxjICWeSPW8isOJELVimodmt9bI+gqo/as5MvF2U5iDDzH286SVKvZuvOyRl
 tnoH8zO29L4XA/6PDiKwDKY1qu8S2mapX2rI2y3bWJ3AMl0NUEC+aiUlRRXwhyo9BrQf
 jmOPKLX2VCdvl+wDrCh3Ld4HwXvzxmHk5RWB4TWacmsZa3sfuk/pep/94z63i+Sh3ccR
 gT1zQ/2ahzo2HbyQsti2TT4WHzfer9oVBRLApwWnviwkGTf2dJrknkz62UKkhJ5pE304
 u+x3dqyaoXPDI4XsNQozb+Z4vyKzt7bNpnM73zrDr23+NVMkwKYoVQhkbEkQbieJCbq5
 df0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787223935; x=1787828735;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uT1ndCgiqc6w8zosFh64mo5qwnmEsbAaXbzgizwzutQ=;
 b=h575IWiq/wPD3fC8T0ZVLFmiPOnLmBRE5jzrBngW6ut080WWJ8W11rk75zIFL2KzuO
 ZR/Cu7K2K/XE52ugw5pSKt4g2DMrINLQCnHYyqA0vU2M4IL6VEOaQPP8ORVpfAIvGhgI
 ko+R4Bkoxl/ih30fmDrIj0fG3DITE+IzBRFWT5iPC2F2SVCNXquXam5qDe8mmJnysNK2
 v+PxnCE/RyduxN8mS/l0cTuUOYhUJmGQC3lxDfAQZVX1uCOSC/fHFMLPBKptxnXfAMbr
 pqQebkfaIm8ym1DVmXEP5osnJEtINUV9/6iFO2OpYjtFVnTtUm1anSIcEYXWHyByDrr3
 4LjQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpQ3mqiGSioQ2GTNcKrgI3MFp4u4djuIL3bTxKn/wlk64KB6YSIlaAbSUuR1ZR3N0rsTqtdYzQVNAPm@nongnu.org
X-Gm-Message-State: AOJu0Yx1uyYkjOfSlnQBcaeiEbcwUypSqeJlrxL8ABYyxf+ni+XCsBKl
 /YT0u1nCSYACC2kh018oGHkXZlXvfsJAjP3sr0XsOB5lC8tXU1LBC7UCXPVVa1SNOcXM2JNMfhq
 LxcVUFlq6oJWjY6aVxFjCXQi3fdMB3eFJmxe1XEuX39fA5UD2GVTFaVd4rQ==
X-Gm-Gg: AR+sD119Q9hhZcgAtIuTTo+S8C34GfzOOAwiYhyoFBJRq7RhF1Enej11bBqcUAa7mwa
 kIfIIngR9lGtdIlzNZMiI7f2+693qCP6bNWU6AkwcOMW/PF/U5wgo387xbwEVJHDvaJbcUlWWJU
 P/UsPtds7QoMzhf4JMjyIJ/Q4WpphVeeBqXa4v9sWMFlWAAwnWYF187X2q2SChkYIrCstFRceLh
 AmhG5ufitWy0LOqPDd182GL4flmx0u+ljd6PW1pMQStzeVp9mXi2XxCTJq7i+SsBBFih8mP0Eoy
 SiD855aN55F/Vddjlohxctp0ROLL0L5TMPbqfUknGuU1jCuonb8iwTBc9SXlWgWkSj4NqPIEUcd
 zS6VlkMRiCjQMzXn8X+pK/8yWoSk2dctjqrM=
X-Received: by 2002:a05:620a:269b:b0:92e:61f1:6b72 with SMTP id
 af79cd13be357-9371e242d62mr970922485a.13.1787223934689; 
 Thu, 20 Aug 2026 04:05:34 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:92e:61f1:6b72 with SMTP id
 af79cd13be357-9371e242d62mr970913585a.13.1787223934206; 
 Thu, 20 Aug 2026 04:05:34 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b144173csm12207822f8f.6.2026.08.20.04.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 04:05:33 -0700 (PDT)
Message-ID: <3cb51542-4479-4d6e-94d8-4d0136eb6986@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/13] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Helge Deller <deller@gmx.de>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Cornelia Huck
 <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-14-philmd@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260820104730.25462-14-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a86df7f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fYOGHEPvyCozy6Fkd0AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfX39J6VzcoQIjS
 jTaReDn9lyU04dKKwJqijjADRJyIM0XRJnP+zCVtf8b94Nq8ic6ChFkmDhLi0lnYO0Wsuyfsqni
 I+R3xCeGDjaQiH4TnD3DUSu2hKIlicA99s5GKKNAFF710cVh1eUsA6cP6xZHlwAIEPHnCXDFCg0
 wRuDqkqFmqznXaY+qxkI1+dM1Ng3+aD3l2IIA63+rdk5LZPixLWfJnv29C3UINVMDKLVsKKWZd7
 PMQzBrLyTo4y93FsaFuNyy3A1CMSh27vcNzGyvkUqSs/2DhFn6Lu/ZpUiliijHPv6YM+DR6JX1t
 lVJb4kxoRi3cYzzsHb9RtCPg0K7aLvHA1Dz49pXtPthlN0lWLLA9nDeHvesi8svxLDN1GptfMBv
 mjmz/rCxzYVOQlHF0EwRpW745DMXVcDsYmAq6CN+NRvuYlOfoBQpPekIirpysO2g3YlCkJ/FqhH
 xq45XYk3q7aeKJut9WQ==
X-Proofpoint-ORIG-GUID: 9NeDXPMTYXoCGfXNNO7K0F44ruZ2s9G_
X-Proofpoint-GUID: 9NeDXPMTYXoCGfXNNO7K0F44ruZ2s9G_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfX6He4xP53epav
 P1lNHhERErdUdK5s2a5bKwh9iy+7yLgoy6d4zs+mNKtMz9pneT+Kg3nJ4mIl7b/oMU3Pbk6j8qH
 iyoYctw9am5G4PIIH0PAYNdTVzpQ75k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200081
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 20/8/26 12:47, Philippe Mathieu-DaudÃ© wrote:
> All functions called by target has_work() handler take a const @cpu
> argument. We can now fulfill the comment added in commit c2804566f6
> ("target/arm: do not clear halting reason in has_work helper"),
> qualifying the handler const to denote its idempotency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   include/hw/core/sysemu-cpu-ops.h | 4 ++--
>   target/loongarch/internals.h     | 2 +-
>   target/riscv/internals.h         | 2 +-
>   target/s390x/s390x-internal.h    | 2 +-
>   target/alpha/cpu.c               | 2 +-
>   target/arm/cpu.c                 | 4 ++--
>   target/avr/cpu.c                 | 5 +++--
>   target/hexagon/cpu.c             | 4 ++--
>   target/hppa/cpu.c                | 2 +-
>   target/i386/cpu.c                | 2 +-
>   target/loongarch/cpu.c           | 4 ++--
>   target/m68k/cpu.c                | 2 +-
>   target/microblaze/cpu.c          | 2 +-
>   target/mips/cpu.c                | 4 ++--
>   target/or1k/cpu.c                | 2 +-
>   target/ppc/cpu_init.c            | 2 +-
>   target/riscv/cpu.c               | 2 +-
>   target/rx/cpu.c                  | 2 +-
>   target/s390x/cpu-system.c        | 2 +-
>   target/sh4/cpu.c                 | 2 +-
>   target/sparc/cpu.c               | 4 ++--
>   target/tricore/cpu.c             | 4 ++--
>   target/xtensa/cpu.c              | 4 ++--
>   23 files changed, 33 insertions(+), 32 deletions(-)


> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9761bb173c1..ba66359d410 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -141,9 +141,9 @@ int arm_cpu_mmu_index(CPUState *cs, bool ifetch)
>    * CPU_INTERRUPT_*NMI anyway. So we might as well accept NMI here
>    * unconditionally.
>    */
> -static bool arm_cpu_has_work(CPUState *cs)
> +static bool arm_cpu_has_work(const CPUState *cs)
>   {
> -    ARMCPU *cpu = ARM_CPU(cs);
> +    const ARMCPU *cpu = ARM_CPU(cs);
BTW this is why I said "Not sure if this is a good idea so marked as
RFC" in the cover letter. While the left assignment is correct, the
right QOM-generated macros happily cast without checking const-ness.
We can see that as a pre-existing risk.

Still overall enforcing const-ness on has_work() is a long-term win.
Maybe a simple comment here is sufficient to warn.


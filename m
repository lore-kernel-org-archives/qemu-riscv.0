Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F342CDB479
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 15:11:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcljF-0000F4-6F; Thu, 25 Jun 2026 11:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wclj2-0000D1-Si
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 11:10:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wcliv-0005hL-1T
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 11:10:40 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65P9jwYX1455396
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 15:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BV/w+KGz0z1vXHNt6pcfQ3rP2b+SHTrCcMA3gtoyJYw=; b=aIynxXb4ZOrydVP7
 MIulFcDF9WcT21VERlIv/cX9Z2wszOkc6UcNUn1eNbCuC4SbM69CvvOSps3rGdSR
 x4MP1wgmLN67JIWdhWuqfPTy+ZkvmBISpMSIqsAxgOcpRQexZRw1RXyCUdXe35eL
 o+MGUR74GCMA0MS7xfu9JGJrRDrJUQOKQfRKGG2GaLodhm9UiBVNuEfFCWUiqsCy
 dqx8OFBIVfmh3eNr9tjOMqTKvffiLVMjUuiMYP/RwHxPxWio45zbBkUbTVvUtHZa
 XBItYTBQfhUjDBslqtAGyLmieryU9H5Dj6+fEqojM9NVNBlSMN8LcEPrwRPNywcP
 CxBHEQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbv9f7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 15:10:33 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-7e93d7611beso3046530a34.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 08:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782400232; x=1783005032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BV/w+KGz0z1vXHNt6pcfQ3rP2b+SHTrCcMA3gtoyJYw=;
 b=VlPlko6SZHjj/I5HAiZWEMerzfDYX7SBOoOuEpFlLgpHO9QEnTgeAQD3/bpuOeYfy9
 DJCF1tOSUhBYijJC5hoSkXjP5xzVQY91OmEJ7ZsJ9T5xohKM9hJrrbpsGmzyWynWyD3j
 X3tudM5fd643c0utIUtwo3ApJVtWdyr09FwCKvtMwYsd3hTp+t87lkZseLZKmwea3a5n
 oE0TiGVGZAORUhC3PuuQYYMLWzgN8OLt4xpTRdqROoFR7dFnL2wigvmnUpxPINWvCJQn
 guD0OJRRXt7BkgSPLQaAkms1D3BuCDCaswb6MSNICcLu4SCB8AyrFypE4yDolS4eIsC9
 z+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782400232; x=1783005032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BV/w+KGz0z1vXHNt6pcfQ3rP2b+SHTrCcMA3gtoyJYw=;
 b=nssPpV/l1RBdgxniSDlvXAhR6pqaL49ZHix4hO0Fn/JBWIUmwL/atteXLTSvwxti2q
 8q5YRXh7CZjW2KCErqAIxYM5NXFiiAbl21hd9V81VqtLu2fw3y8DEdD6kPA3O3dXMGe0
 B2kWtwysJ/eLNgSq3y14DC0oGbE2xaBt3SRtvfxcO9Q3rwRdOKONqeFGeWpdVasqFsSm
 Jdvna5ITDGAFSBFRoHLAcrLI3HnUYFJgYsCWz/UfFwp0MRt4M6S1XGxciiYQFsXqmA4G
 K0GVWgHRBqDGGL8tbxfCet226cJHKafhsZFi8VavW+/2/gxacrrkw8lpXjUtF6Qc25AG
 /sBg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ubQUCSEhvbVUdfvUzVYtHV7/OkcJeVfWF4Bb59j3KMAXwya4gQh+IkPh5ff5NG0QJzgLFiKfbeBkq@nongnu.org
X-Gm-Message-State: AOJu0Yy5Q1ZuXm7w/Gwm28fyNg0ehFrmzMMr28PLlYCZAF1rVlP/dMJY
 oR8zDUKNdVbL693oOey44FZACLCENTxbQYwhh6E2zWGjcCh8MQaA5GT9ijU23l3mkeA+0MSdAUi
 JaMKspUJ2H9sf05g2gdENxYKAuO0sO1hvr/e4Hb76PSpeKsYAt0L3KIbD2A==
X-Gm-Gg: AfdE7clLbDNY6cHXinoA5Q4bRfXyx3s6jM7F7pg0pO9RoBZGK1Z9cUEN4FvcIKwP5sk
 0MMTmkrZgRI6Pi/fhSrhxseXfd1NtSMoTN/1B5ZadmUtnqCzNkEEdLRji+2AxQfvvJBsNaeeNJl
 dyXEo6deIDVJ7yaLjN80G5x4EkL73yy8/+RsdpWTC/OsWefInm4vn4elfsBYglg/ogOWA0vGPoE
 Mr/BzHW1iL0p/jgQ1u2V/1u9dig5a8y9eWdBG3nrnfx2LskZfC8FaJ3aOydZvjSVptT7BQC1bvi
 EXK4RjxIf1VX6C1Bf/FKwIaZQ7CumZrW+dmp6j+yXoQDxTGMxYc8xfLi70AYQEkTDtCo5HAG4LI
 lcvyHhUUYpKFEELTUOVSvh/Pb72tPlp5rqISVjTytRZ/nNYawLjahw1kXBDdijA==
X-Received: by 2002:a05:6820:215:b0:6a1:11b8:3b4 with SMTP id
 006d021491bc7-6a135229415mr2443824eaf.51.1782400232190; 
 Thu, 25 Jun 2026 08:10:32 -0700 (PDT)
X-Received: by 2002:a05:6820:215:b0:6a1:11b8:3b4 with SMTP id
 006d021491bc7-6a135229415mr2443791eaf.51.1782400231757; 
 Thu, 25 Jun 2026 08:10:31 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c11fbbaa5desm224311166b.2.2026.06.25.08.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 08:10:30 -0700 (PDT)
Message-ID: <88192e79-65af-4c91-9824-99dc810c7cd0@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 17:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Report QEMU CPU archid as 42
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Atish Patra <atish.patra@linux.dev>, qemu-riscv@nongnu.org
References: <20260624-marchid-v1-1-a0af7997071f@gmail.com>
 <15e2ffbd-cb14-4767-ab56-e647fdc38b15@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <15e2ffbd-cb14-4767-ab56-e647fdc38b15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzMCBTYWx0ZWRfXy4mc6CSSaU7r
 gUXZVBZ7ULY5YncDp4sX9OC4dpcur2qZb5YKTkTH35REyVWcVs5+utwhfjGOLPAfNDHrjVisRr3
 6BO+esTY72h6TVEPLTDOXaZieXWs8kA=
X-Proofpoint-ORIG-GUID: NbcE5EGNi_AgQrdOqHLDDbx83cM85A47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzMCBTYWx0ZWRfX9ZbVUKuvmpvI
 xmsEYCpLQVF/MtcM/rfy2tRacPVvy5b6lLtXrwMKpSMIfFkNR609CxgT6Ye/qC81cLFCSOep1+u
 bDv7w4CLOO8NermXCuBGY08+Yhw/TEQjEGZvbrJjo1gd6qjJZewgCppCtPsvvS7IpW2B1MQul3E
 2i0d9U6rAztkyuc8iXS43Q5+w0duOFMsvDDWixNM9Nm5zeOkDzfrkyZU/HIlf0sb7277ZFJt0Y0
 77Zo+nZWesGVWRJuJ3hzlQeQ4HmXwBksT3WQJI2ZVnD0sUBAjhdJeVeviSNw6TNyeH7tCWHO0Bq
 t0/Qd+lLKakN0wrz1kJDI57/Um3DvCVhpLVlucg6A9dLP1VT1oh8ldK7apTtKkOiFbXqS97Eib8
 8w1iibXJnY/K1eJnXTcuSuJaT4zBtfUwC0Tztge48B6VVbthhKrNbPGT56kwoa6YQq689SFVLsS
 LrwOzyY8Xd3YohIE3Nw==
X-Proofpoint-GUID: NbcE5EGNi_AgQrdOqHLDDbx83cM85A47
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3d44e9 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=xvfqbYfxAAAA:20 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=h0uksLzaAAAA:8
 a=jnyj_WUHXOFShEhyy0IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=MSi_79tMYmZZG2gvAgS0:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250130
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Hi,

On 25/6/26 14:13, Daniel Henrique Barboza wrote:
> Hi,
> 
> On 6/25/2026 3:26 AM, Charlie Jenkins wrote:
>> When a non-vendor CPU is used, report the archid as 42 which has been
>> allocated for QEMU in the riscv isa manual [1]. This can help software
>> check if it is running in QEMU.
>>
>> [1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
>>
>> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
>> ---
>> This series was original proposed by Palmer Dabbelt [1] with a follow up
>> by Daniel Henrique Barboza. This patch implement's Daniel's suggestion.
>>
>> When booting with a non-vendor CPU such as with the qemu arg "-cpu rv64"
>> marchid will now be reported as 42.
>>
>>> qemu-system-riscv64 ... -cpu rv64
>>
>> processor       : 0
>> hart            : 0
>> isa             : 
>> rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc
>> mmu             : sv57
>> mvendorid       : 0x0
>> marchid         : 0x2a
>> mimpid          : 0x0
>> hart isa        : 
>> rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc
>>
>> When booting with a vendor CPU like veyron-v1, the proper marchid will
>> still appear.
>>
>>> qemu-system-riscv64 ... -cpu veyron-v1
>>
>> processor       : 0
>> hart            : 0
>> isa             : 
>> rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt
>> mmu             : sv48
>> mvendorid       : 0x61f
>> marchid         : 0x8000000000010000
>> mimpid          : 0x111
>> hart isa        : 
>> rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt
>>
>> [1] https://lore.kernel.org/all/20240131182430.20174-1- 
>> palmer@rivosinc.com/
> 
> Thanks for linking the discussion.  I have but a vague memory of it and 
> the link
> helped.
> 
> 
>> ---
>>   target/riscv/cpu.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index fa497e5e8a..59d63f82c2 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -44,6 +44,9 @@
>>   #endif
>>   /* RISC-V CPU definitions */
>> +#define RISCV_CPU_MVENDORID 0
>> +#define RISCV_CPU_MARCHID 42

Worth adding a comment (possibly linking to the previous URL)
making explicit this is an assigned number and not the answer
for the ultimate question of life, the universe, and everything.

>> +#define RISCV_CPU_MIMPID 0
>>   static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
>>   const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>>                                 RVC, RVS, RVU, RVH, RVG, RVB, 0};
>> @@ -1198,6 +1201,12 @@ static void riscv_cpu_init(Object *obj)
>>       }
>>   #endif
>> +    if (!riscv_cpu_is_vendor(obj)) {
>> +        RISCV_CPU(obj)->cfg.mvendorid = RISCV_CPU_MVENDORID;
>> +        RISCV_CPU(obj)->cfg.marchid = RISCV_CPU_MARCHID;
>> +        RISCV_CPU(obj)->cfg.mimpid = RISCV_CPU_MIMPID;
>> +    }
>> +
> 
> Two things:
> 
> - we have a 'cpu' pointer at the start so you can use cpu->cfg... instead;

Yep, cleaner.

> 
> - the "cpu_is_vendor" check shouldn't be needed.  Whatever is set as 
> default during
> cpu_init() must be overwritten by CPUDef settings done in each 
> DEFINE_RISCV_CPU()
> macro.
> 
> This happens at this point:
> 
> 
>      env->misa_ext_mask = env->misa_ext = mcc->def->misa_ext;
>      riscv_cpu_cfg_merge(&cpu->cfg, &mcc->def->cfg);  <================
> 
> Therefore we can remove the "cpu_is_vendor" check and just assign the 
> default QEMU IDs
> as long as we do it before cpu_cfg_merge(e.g. right after "cpu- 
>  >cfg.max_satp_mode = -1;").
> If we do that we'll ensure that all CPUs will carry the RVI archid 42 
> unless told otherwise
> by the CPU definition.
> 
> Yes, this will end up changing the IDs for vendor CPUs that don't set 
> their own IDs.  This is
> fine - if the CPU doesn't bother setting its own ID this means that the 
> CPU is perfectly
> fine with whatever default ID QEMU will provide.

Should we check for unset marchid and warn or even not accept config
with this field unset?

> 
> 
> Thanks,
> Daniel
> 
> 
>>       accel_cpu_instance_init(CPU(obj));
>>   }
>>
>> ---
>> base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
>> change-id: 20260624-marchid-80d176b873d8
>>
>> Best regards,
>> -- 
>> - Charlie
>>
> 
> 



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91290CDE001
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 12:14:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wciyD-0001iK-Eu; Thu, 25 Jun 2026 08:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wciyB-0001hu-BT
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 08:14:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wciy9-0003CI-1N
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 08:14:11 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65P9jvFc025792
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 12:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e6wIekjmXUC4mYjEPxFY4sNl/54KNlgu1Hw6ZfYR2bE=; b=XHdx2uabViw78Qiy
 tgB88hbG2WMqhW6RbbrqLzEImjFEghwMXYkJlNRmVyEkBzca0eBBKILscUB3nOLd
 GaYd22InhFmkzo12KMwVNGFZ2KaSgDCHJbq0Sc8+aVeZQ+QuLmtWxYqXJDJiLQD0
 U6/93lt+BAe64lFXjyd1v2hk95mtrGTu8F40UZiIt3d4x/1ViRqi1p6b/LLAhe7/
 QP+3HnSvykMkkOLHFHuudreuaIZtMqBffmdweM9HU3i6QlX2tPER7lhEYIsQ1yJb
 PRY2P8L3FUFlrUyj/kUJB1zWXBBMFwJGp+IbyJ2EMlSkDI/Vg2HJbZoGI/oRT7rJ
 jZWyUg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0tspt9h8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 12:14:06 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7e6d78299e9so2945721a34.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782389646; x=1782994446; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e6wIekjmXUC4mYjEPxFY4sNl/54KNlgu1Hw6ZfYR2bE=;
 b=PFua5cEHw2xi8X8MuIoyjW79XMPN5F0upHBCczuMMLrr9Pi7hSQ7+T578KEcre513n
 q1Obcr8KF2SKtiU3ztDauVVU7NctH6GrVvkJskvl9/pN7meNyEPN+4hvSSiXfEmRJfLT
 3w4iUftvKXW7jScllLSqCa1/Ko/pZXGLL19xfbvswuROswPlriQnT5dgR+bdb/ksKkoB
 cO0sAoTYz8bL2BZCafvAbOGvatSBldzIX6aCHuxlGmx8sOWKY3ovkiUivOhD2qTUSnKi
 CsT242RfrHdPPs7JcmEp5VDyy65CDQZ0YfYlvCP8DtX3VFlj7tsvs0KFl5J5oa4mivUL
 PPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782389646; x=1782994446;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e6wIekjmXUC4mYjEPxFY4sNl/54KNlgu1Hw6ZfYR2bE=;
 b=JJyHu7enWXHjfaXa8uOybs5RRM+47i7OJHxq+T9o0bULA6BqqTUJtiaHXNSq5M0XVd
 qT7GhLQG6CI5pacNT3X7oUwOe7mDFpC0aKONFm4jTj/hsAJfmKBfjF6H1G5jlmrMq7U4
 InbkwF0DLAps0KLCBAPrQanzVcuov0j4pKk7dLCYp4Z0PQxRSzB6fpffzEN/PERJc0aD
 QCw9aN2SUl1DH4Eh/UReM3YNf5UmhthGYe+eReTtokM0WQQrT33GsrjZS7sNGVD3iLH4
 OFxtjLRXcbE4tsgzRCkvaZH5UJEt3cfqG66R8mJLQEt0zQhHYOVG6TNGTdZ4FD8Mz4uf
 qBoA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HZw12Saolf+fr9JHaXWnSCMEjj6MTNhnSCko7u8UXf4mrhC8pZwrkBfGy0LX/K7S3wTV75YpnMW2A@nongnu.org
X-Gm-Message-State: AOJu0Ywucng9DksibXnw7vGpEMNjMEs2ZS53avhg1AuwNhXM1+JxOg0w
 cmOL0j96hHTYQ1/2BWtdBcWLJKwXcJ0Xmf7sYk3oJ3drFmVLZ8Xzr6mdPrDi5odHWcerYjoM3ef
 D9Dh1K6N/1qJeQchj8bEmY3RgmyzNeXRiWb0kAW7HPKgsrKmj9BDpbmFoPw==
X-Gm-Gg: AfdE7cl0DrBhh8mRocgj/mTNPMujA12DGmE9Ol+JQpVPYlQrLptmjAvdZ0Dagzlrbg/
 kFPNOy9YDJZYmZokxaagtQLgQHPeR13xkYo81Z5OOBJJKAn0miqw2urODVa686C1ocIYmRNjdfw
 4pFrsF6FIbQSyccRgeY1DluGZzGmGUnXKrkzf8ce0qJxpQYs4A4OL+1xMSccHR0lYvBC7zXSczD
 xiRDjKyYjYbZ5yvg3F1xl8D1mPdqr3SjQHoHZoVXEzymEJKV2Flk/uOy7IhVU4HOYKafk2NxaZ2
 WaK8FgtM/kE7K4Gu63tS4kqfOJomWKVKFlXQbIIwlDFwinUX+B+nZ0H4fLV6YdvMUKsmRtvMm3T
 l15TWPfPGN6ltij1jyqnLMyW27zTm3iSdq8nR2ciAno/eM6fA/ZX4JfwJ3YwLs9bHe9durp8UnV
 VbrkU=
X-Received: by 2002:a05:6830:6a8a:b0:7e9:419:acd with SMTP id
 46e09a7af769-7e99c25bb4fmr2315680a34.17.1782389645971; 
 Thu, 25 Jun 2026 05:14:05 -0700 (PDT)
X-Received: by 2002:a05:6830:6a8a:b0:7e9:419:acd with SMTP id
 46e09a7af769-7e99c25bb4fmr2315661a34.17.1782389645542; 
 Thu, 25 Jun 2026 05:14:05 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc2:6962:5520:30ca:9e66:df39?
 ([2804:7f0:bcc2:6962:5520:30ca:9e66:df39])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e94424c93fsm15123632a34.14.2026.06.25.05.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 05:14:04 -0700 (PDT)
Message-ID: <15e2ffbd-cb14-4767-ab56-e647fdc38b15@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:13:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Report QEMU CPU archid as 42
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Atish Patra <atish.patra@linux.dev>, qemu-riscv@nongnu.org
References: <20260624-marchid-v1-1-a0af7997071f@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260624-marchid-v1-1-a0af7997071f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OL8XGyaB c=1 sm=1 tr=0 ts=6a3d1b8e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=xvfqbYfxAAAA:20
 a=VwQbUJbxAAAA:8 a=h0uksLzaAAAA:8 a=pGLkceISAAAA:8 a=-mnagkuO7avN7E2oGvQA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=MSi_79tMYmZZG2gvAgS0:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfXwTSXlitPFQ+6
 1g+1EOTZBJm6RzubY10twfnQZtV5PXs4TQMqUMld817YkLOlOeX91LWTebYdG1PtmkgTYxQagTK
 +4bUMV1Ewd7VnT1CuCDtOUqn+p0s+YLg67V661KAqKmOJES/5QrSGcyFggF9ElST42if0I1//9D
 BWf0R0iMuvH+jK+s4NjtGWmz/9YVAWcN6xBiTtQ+wUH8XmqeOr+f1dkaxUDshIDgRlf2W5YmHBY
 YDT2n2bMBJh6N36zUnr/9rD1RNfZa/c2BJqt6+eAC4goMkVVwr7Tc6p+NkdQIhMeJ/DB1aMLJKS
 DxOPtLATVqP/ukkgyl8wVfZgoQ/Td7wtVtlAQ/EdEd0C70Jdq/BMK4134RurCej9BgaCkBSWbWO
 jFFicxTGkaRVLVXlhPHqho+MmEo86x2NZgCJ8ompXKQa9N4X5UfDQRYeejxj7ykWbb38u7PAdFn
 Lf+878fsrPaykqfeXzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfXyng8J+H/QVdZ
 s7d9mXIG6igbbcUOwZz4+kWZXORwRJn0+6v48U7tjx+wSNjKRJlrcmDEcmGsPJ2k66Jm5Uw9Mwl
 gj5KhJMgrEdMpQmhMm5ksmpFx+TtPIM=
X-Proofpoint-ORIG-GUID: ROOr40_nYijBdlp1wsBsjE2OiaHu2ERX
X-Proofpoint-GUID: ROOr40_nYijBdlp1wsBsjE2OiaHu2ERX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250105
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 6/25/2026 3:26 AM, Charlie Jenkins wrote:
> When a non-vendor CPU is used, report the archid as 42 which has been
> allocated for QEMU in the riscv isa manual [1]. This can help software
> check if it is running in QEMU.
> 
> [1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
> This series was original proposed by Palmer Dabbelt [1] with a follow up
> by Daniel Henrique Barboza. This patch implement's Daniel's suggestion.
> 
> When booting with a non-vendor CPU such as with the qemu arg "-cpu rv64"
> marchid will now be reported as 42.
> 
>> qemu-system-riscv64 ... -cpu rv64
> 
> processor       : 0
> hart            : 0
> isa             : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc
> mmu             : sv57
> mvendorid       : 0x0
> marchid         : 0x2a
> mimpid          : 0x0
> hart isa        : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc
> 
> When booting with a vendor CPU like veyron-v1, the proper marchid will
> still appear.
> 
>> qemu-system-riscv64 ... -cpu veyron-v1
> 
> processor       : 0
> hart            : 0
> isa             : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt
> mmu             : sv48
> mvendorid       : 0x61f
> marchid         : 0x8000000000010000
> mimpid          : 0x111
> hart isa        : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt
> 
> [1] https://lore.kernel.org/all/20240131182430.20174-1-palmer@rivosinc.com/

Thanks for linking the discussion.  I have but a vague memory of it and the link
helped.


> ---
>   target/riscv/cpu.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fa497e5e8a..59d63f82c2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -44,6 +44,9 @@
>   #endif
>   
>   /* RISC-V CPU definitions */
> +#define RISCV_CPU_MVENDORID 0
> +#define RISCV_CPU_MARCHID 42
> +#define RISCV_CPU_MIMPID 0
>   static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
>   const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>                                 RVC, RVS, RVU, RVH, RVG, RVB, 0};
> @@ -1198,6 +1201,12 @@ static void riscv_cpu_init(Object *obj)
>       }
>   #endif
>   
> +    if (!riscv_cpu_is_vendor(obj)) {
> +        RISCV_CPU(obj)->cfg.mvendorid = RISCV_CPU_MVENDORID;
> +        RISCV_CPU(obj)->cfg.marchid = RISCV_CPU_MARCHID;
> +        RISCV_CPU(obj)->cfg.mimpid = RISCV_CPU_MIMPID;
> +    }
> +

Two things:

- we have a 'cpu' pointer at the start so you can use cpu->cfg... instead;

- the "cpu_is_vendor" check shouldn't be needed.  Whatever is set as default during
cpu_init() must be overwritten by CPUDef settings done in each DEFINE_RISCV_CPU()
macro.

This happens at this point:


     env->misa_ext_mask = env->misa_ext = mcc->def->misa_ext;
     riscv_cpu_cfg_merge(&cpu->cfg, &mcc->def->cfg);  <================

Therefore we can remove the "cpu_is_vendor" check and just assign the default QEMU IDs
as long as we do it before cpu_cfg_merge(e.g. right after "cpu->cfg.max_satp_mode = -1;").
If we do that we'll ensure that all CPUs will carry the RVI archid 42 unless told otherwise
by the CPU definition.

Yes, this will end up changing the IDs for vendor CPUs that don't set their own IDs.  This is
fine - if the CPU doesn't bother setting its own ID this means that the CPU is perfectly
fine with whatever default ID QEMU will provide.


Thanks,
Daniel


>       accel_cpu_instance_init(CPU(obj));
>   }
>   
> 
> ---
> base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
> change-id: 20260624-marchid-80d176b873d8
> 
> Best regards,
> --
> - Charlie
> 



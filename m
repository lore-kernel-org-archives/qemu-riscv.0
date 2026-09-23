Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A395BC9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 14:45:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9ODj-0004E2-5g; Wed, 23 Sep 2026 10:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9ODf-0004D6-EL
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 10:45:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9ODd-0000sY-Qz
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 10:45:11 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NBbgNo3772294
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 14:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZoSkz7NbOCdwTIo/YUHO8vlqoq6+6FsxxGnJIVi1Fps=; b=pIgTxcXAC3GCER61
 UNCqPFwTHYCHIwdD3oCz8eiKh/pAQROQdoKqwvxiFmApoIt3gEC6ltgsiNs5JPVE
 yEh5oNYYyQkEDj+Zs2sAYFoXLuAGZzeKcCIBPhH8oTOT2snx5hk50/MMkCj4f+K9
 SaXT4qM5GmxRec6ImJMOOxlUoIh4Y/5kMRkg+1pWMrBmyXbNA4VArahAnv7fZIvk
 PHgvDUXuPKIBeEUC8n4WYloDYxlTs6ejiYSATqXO4rue7vByJzeWfyVdcJPDQ4U8
 nzhXShFxWZ2yldo1eMdBUXp4X+QQJm3EZhwIttlzCcFxMpj37GaOpN0r+5suml6e
 SnQYtw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb60xnu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 14:45:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-78fb21aaad9so887414137.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 07:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790174708; x=1790779508; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZoSkz7NbOCdwTIo/YUHO8vlqoq6+6FsxxGnJIVi1Fps=;
 b=NRWDpuD9HLg5WU/nNh+LDd0JTboxb4lbJ+B1gxrff2i6E3ZBPh9u5nQft/1FHwkday
 DdUem5RzsXMqtgDbfewTnkvXjKtHvpEWE2vms/kInXNUuuTwOAD4JVMXgY2Afq3qp+mK
 GPHmtDbDFStUyDVqKNtkqwwVMXf55fIqTzMNQs51BhFv6Kdg4DIqxO9WCkH38CFSM0GJ
 GuM0f+rgS7k/Gzn8oI0Y88mQAxaw7frOLGWoz/DW1Db3XrLHWOMDbcqT8uiVGmeArGq5
 pVLRAr0iiHjlVBaHhmdAL5yOQnAFIHZdlOfde66NjDy7YxCpjxtdwMwOO+wGkhns03MW
 jBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790174708; x=1790779508;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZoSkz7NbOCdwTIo/YUHO8vlqoq6+6FsxxGnJIVi1Fps=;
 b=T4laFKCvKGYydJFOOSjSViFTPrXj4fv8BDe5HtaGOslnw4sQRCLUHib9HR4ZIZlg5d
 viEPlAtTjNDIopY9dOuP2NNC4DE19y1gvLwH7DGqaGt/L3U6E9AWUAsW3domDAG1Zk+R
 79XD+pBvnykQJ8KMdg3RAztxpnJ3ioyYIk7v9LL0NKuPNnbw8Jzyf2lirTOKaPiUuzZe
 f/s6T6g4LuWqQJ/PxAHb2NzVVuBy7gwUaQ24RxjQ+/+CF42LsdOYMLIHXkm3lQ5vFdEn
 gWxHa7gwUcWlC5I4We0oXIdfeeCix0YzXt4GTXbbNCVov0vB0JhN3VfY3+hBE1EQbFZk
 nevQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByHWyEfv2jcTEabWKv6lox6Qb0Qpor83EVs9At8u/BniUzjQlKhBeEYbBWPxfIiVcYHU8Y3w7xGgoNn@nongnu.org
X-Gm-Message-State: AFuF++kLcuTHwMnnZis3ox8pCXv2gbTt7uHZ3+quFrJ4ShOKq1sEvVCf
 quF5QAEL0OLn134iYUWlXTQAvbuMwfhdQE9BYa75r5g0mgaC1UC/UX7ofjAW5FWxCt/JeEC8fB7
 13sBMsQm7evT/ehUV3mIiJ5sPUs76EK5THiMsSN1Igpux+1fKVA0G+fDweQ==
X-Gm-Gg: AYBFou3juXS0wqqUl32Fm+NRn5065Qpt1q/whBQ2dmhkwPhqyIvKQWz589t0vIobe2B
 A5N4lO/bMz4ygdAoi0bKZDu3+RbyXDzvAddJxdPtDbYmXRcoQm2oXXZrMpD2ixo99FK5xqQpl4p
 lSqFhboh92vrC0NvU7ssJSSKLxtn83jM9ZUQ1R2Dz/rt3FvRfm9i+02XhRgIdhQhtj99DAObgFa
 3ner7f9lRdW46Jb9nqOY59ekhU8ruoEHZjfBNwutSFc6SbB2iSvFunOtXFpcmg+txTnCVQky4NM
 /K/U17z4A0fq+ob3NrKCDaIlfH+T87Tql80hT9hZB1CVPowXd/NtCGJK3kOxZhTMUM5el/UIOqO
 JuHJtb2JsNxuWPDCIlbH9A8erQkw8upOKcIFOV+PrI7P+oHw=
X-Received: by 2002:a05:6102:8192:10b0:785:6b42:b7b0 with SMTP id
 ada2fe7eead31-7aa9df8e032mr5120189137.4.1790174707651; 
 Wed, 23 Sep 2026 07:45:07 -0700 (PDT)
X-Received: by 2002:a05:6102:8192:10b0:785:6b42:b7b0 with SMTP id
 ada2fe7eead31-7aa9df8e032mr5120171137.4.1790174707146; 
 Wed, 23 Sep 2026 07:45:07 -0700 (PDT)
Received: from [10.21.17.122] (161.170.88.92.rev.sfr.net. [92.88.170.161])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1e2b82sm75602835e9.12.2026.09.23.07.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 07:45:06 -0700 (PDT)
Message-ID: <2a44f44e-b07a-42b9-aed2-f2c609d78353@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] target/riscv: Split interrupt logic from
 riscv_cpu_update_mip.
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bin Meng <bin.meng@processmission.com>
References: <20231016111736.28721-1-rkanwal@rivosinc.com>
 <20231016111736.28721-5-rkanwal@rivosinc.com>
 <3ae1ecd6-e4ee-4e4a-a341-925fd14dc2b8@oss.qualcomm.com>
In-Reply-To: <3ae1ecd6-e4ee-4e4a-a341-925fd14dc2b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q5jfBcSWxc3yCVHyiiGDNYrgYRwxO_M3
X-Proofpoint-ORIG-GUID: Q5jfBcSWxc3yCVHyiiGDNYrgYRwxO_M3
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3e5f4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=XFFLIW5kwC1urAZS/mNkYQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=h0uksLzaAAAA:8 a=JF9118EUAAAA:8 a=EKYOHlaN6AYWZJuNelgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=MSi_79tMYmZZG2gvAgS0:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXxy0Tt26aGY77
 2WPcxl2Ns8vZaxeHsxRoLkX53WPcSomzIdabZUF/daO+uJgA/XAueUYZaZc6CxWVvgzOaiGIyqe
 PWFM03cAb1HcfjwhdoOYcejBPFb/D6U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX2fu2YRO0LetQ
 iDhtjd2uSgZKNQtCC+Py4zWSZZ+2g1bRn7ZK7ngjQditigMUjGOFV5xkeGq+lN9TWL9pu1w957M
 GPvbxvF5/V6dZbjMM/eUwPz3GEj9F1ZoW024AQMm9phiHbTxLf4L28Jm46unM3HvOg7XCA8X0k0
 nm6fAwEUPTem+Z90pIhAGwrXPUI4UzusuKNsnVyyHanFzkVz09NqOvFAzKrj8yXsXqSIW/d7/qB
 VPTnU9+GUlp4qR3QNy7fy1cj9OqntWrnYgWeXv8aTGbn1MIC/cBf3AphcU4wYuYvbwhhECxiqMY
 2DXqsrYTKlx1/4XnYCNYDLWHDngk+g5sQFXNOggPNYz46c0NKo5gamfw8GwbAK//KkuUgKqObyC
 6ZWIme4PXjXVEgfmrctl4qMedEemEoUCBlLAzDxUqvZGjbZKbd7I4zkYwt2CgwzJT3lUqqW/LcE
 iHTzfyVD70VfQfrTQGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058
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

On 23/9/26 11:23, Philippe Mathieu-DaudÃ© wrote:
> Hi,
> 
> (now committed as 1ebad505f3d5108513bf150b901344caceb3a7c1)
> 
> On 16/10/23 13:17, Rajnesh Kanwal wrote:
>> This is to allow virtual interrupts to be inserted into S and VS
>> modes. Given virtual interrupts will be maintained in separate
>> mvip and hvip CSRs, riscv_cpu_update_mip will no longer be in the
>> path and interrupts need to be triggered for these cases from
>> rmw_hvip64 and rmw_mvip64 functions.
>>
>> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   target/riscv/cpu.h        |  1 +
>>   target/riscv/cpu_helper.c | 25 ++++++++++++++++++-------
>>   2 files changed, 19 insertions(+), 7 deletions(-)


>> +uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, 
>> uint64_t value)
>> +{
>> +    uint64_t old = env->mip;
>> +
>> +    /* No need to update mip for VSTIP */
>> +    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> 
> If mask == 0 do we still want to call the riscv_cpu_interrupt() logic?
> 
> IIUC this is the point of masking, if no change no need to update MIP
> and evaluate other fields.
> 
>> +
>> +    QEMU_IOTHREAD_LOCK_GUARD();
>> +
>> +    env->mip = (env->mip & ~mask) | (value & mask);
>> +
>> +    riscv_cpu_interrupt(env);
>>       return old;
>>   }
> 
> IOW as of commit 7074591d795:
> 
> -- >8 --
> @@ -580,6 +581,9 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, 
> uint64_t mask, uint64_t value)
> 
>       /* No need to update mip for VSTIP */
>       mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> +    if (!mask) {
> +        return old;
> +    }
> 
>       BQL_LOCK_GUARD();
> 
> ---

I'll post as proper patch.


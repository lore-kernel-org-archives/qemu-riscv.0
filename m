Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311E2C79F99
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 18:41:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x40kW-0007HX-M2; Tue, 08 Sep 2026 14:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x40kU-0007HA-IW
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 14:40:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x40kS-0003Kf-Ge
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 14:40:50 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 688GLnsG3502009
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 18:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rOFeW8sZrlHkgD0kRE0EvFxGh0kAAQhw1GwD4MKuFx8=; b=lLt9hpKQWTXwDU5v
 ExcTwboKMC7Mhh4GEyYsrD84VEalHKYMsBxVIeKv5JJT+x7ixMdLYJoZY9i9UqDJ
 FvrhhQIif/GQeAQzvoQWfLgCZ6ZnnZ16o4aa2TUA/5QaRcfREBVCXRv41K+jjwll
 ZBjpr4LB0eznSLUAMIFUi/r/g0NS9gLIcTwwfAEgaMUKOrqzVb7JppNW0HFndmdx
 tU1EAjgZQz67abGv1hF/fp85L4BNnqsPfjHnjO1/fg1JrAoyfQp3G/kd8osFof1P
 +qyBS8T41X22x0zqSXf2WzHZ6KH1ECOCz1M4eCUoAKMCbvHIyMjHp6SEgiavC4/v
 BKoJ9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpgn57-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 18:40:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-90e98e74535so84789506d6.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 11:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788892846; x=1789497646; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rOFeW8sZrlHkgD0kRE0EvFxGh0kAAQhw1GwD4MKuFx8=;
 b=jVGwRNfUemN2uSTy/SivU9T4yMILtfZszt4RdAvrEN1kpZye0OP3G3gUS4WsIh9tHa
 caprUIIeDNXAHZs1clL560w5szt+CLQMm5V7h1QhCWzL+3DQyO1/kvFX85v82+oIDFd3
 fWpkUkDLFTEPJW6FaXCu+DIt6Hfa/kV6i/pWER+b4U+HzcnGeK1fDuEMNV7fZI0Lo8/K
 5JALH8wsaPQCxI91my/vbeeVI0pcgKmJxNSdJagTn70L22QRyceyApXStXGhYlgSZlgM
 rkm87kR5gt+mYn3TIy0aCjmzCt5TVNT+nOcybXGoCBwACXoI60km435hnPj3LkkTaMCj
 abdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788892846; x=1789497646;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rOFeW8sZrlHkgD0kRE0EvFxGh0kAAQhw1GwD4MKuFx8=;
 b=EyYrM8DKhav4HcUCPbGs0B+D0WAA9QJJdezuPT4syCyEyp1YUUQZJ+ocNHIgcCdP3w
 X/cj76hh/kbnVjXD63cEMRQm+BUclHO04KtSRct5tkCdsrce/iIiMUdFaXgYWmztFhxC
 KaTMzGL9w0WxFmRr2x4NXaKgGScMhjDE9elIqyw92Nz5dYnTMng1C/kiUzYZWp0D8Nry
 UFP4GWOKHox0umwvL3BBRQJJBS4xdZH0meFQTxv/S+NgVsPkp3y1qpfM8EGoBSfB+i3X
 Ltz+ch7YNKFcF7TOnXFUwu6U3MjJbBKeMG2PmGfMz1zbZodJiUHW80dySRf/ndWzQrzv
 MAmA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSFe+ZYebkh+O6XHJ/tynU/53cS19ZyhWiY9DyzPkrWocguuf2faLBlQzxklVYfNbTI3u9pdtKkxm0@nongnu.org
X-Gm-Message-State: AFuF++mvG2+KJnV54kpPWdTY1dYT93DXVQYxVVn3vdkE6aMf1RgmuCpm
 PJmvYiZk0D5RTmxEt+7+gpT+yf0hivwiRgjQjnYn8mMZtk42cBQQi2yUCgSNQYVCVXXW/3H9zL4
 1nGq6bfz9MAABmAVK6Iewwz/bzUbmaRoqHlNAMUZhzfVCBSU7rZXjEPh8Lg==
X-Gm-Gg: AYBFou0wmgg/LKW4Pz28K5lRjRCyNkQeOBiJrrB5uDqPc81Cbd2zqiXkAQttZmOrOXi
 PUVWTKol0O8txa5OYLa8I2gNkC2ghZp1ulUY5Cm09NOkBwwG0vi6llnQfL3dHbp9yQQyI2a6UU3
 XuaC7UBL3LzDcn1/iB2u/kTNAy784sfRUcVZMDi5exqPqpW0xjQq0KKXrnb9cQaf719yPVIkBWy
 s2AHSaNphw/VVbaJuczoHA+FR4uRQ6tU8Jz+Iws8tTNs7nmBiCPG3Nh1i3Y8jIa0Bo/4BGTIEKa
 xJULaEnszH0+0p0bZHd9LiA6j2rnSAA3maBZ2pyMZFArPg1N7ngCM5qgB4kNW56zvD3c6nrry7w
 OECFpetHZEZIlIn115jxTd0QOJSz/lwAqwwo=
X-Received: by 2002:a05:6214:1313:b0:90e:e1c6:7542 with SMTP id
 6a1803df08f44-9106b40754dmr24365056d6.22.1788892845763; 
 Tue, 08 Sep 2026 11:40:45 -0700 (PDT)
X-Received: by 2002:a05:6214:1313:b0:90e:e1c6:7542 with SMTP id
 6a1803df08f44-9106b40754dmr24364046d6.22.1788892845250; 
 Tue, 08 Sep 2026 11:40:45 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9104067b099sm124099476d6.28.2026.09.08.11.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 11:40:44 -0700 (PDT)
Message-ID: <8b5b9cc2-fa84-4237-b24e-cdd327cda2e0@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 15:40:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/5] target/riscv: add riscv-server-ref CPU
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, leif.lindholm@oss.qualcomm.com,
 Icenowy Zheng <uwu@icenowy.me>, Matheus Ferst
 <matheus.ferst@eldorado.org.br>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
 <20260904195610.964829-3-daniel.barboza@oss.qualcomm.com>
 <qe5iku7uldi7ok4tnfmph64mns62uz26vgbokn657rajjblfzr@k4tyenhmhuwb>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <qe5iku7uldi7ok4tnfmph64mns62uz26vgbokn657rajjblfzr@k4tyenhmhuwb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIwMSBTYWx0ZWRfX/8YrSOUw9wyA
 RN1++N7t3wMXCobW2at4dyk0BscW6BA8h70g51PPI2dDVgbQrS+e4700ADewQJn9h4ZkC1MOZfi
 I5vFrJF5gpmOl0JYBos8/ayVcyNQcGAy32spJR0cuZCORCIkxLoCr3ns0zA9q3dze/zFagC6mMz
 P1ChalAeQSSGTFzVqpIi251Iq3qv0eQaxvmp+x+1BTfeabfWqIreFVf3DtV1BsJJA/1pslb+ZVA
 hui5rI0YF/nKg4xuhErd9AvZtWtfzKzKPSiUgArhcT2OofpOtviVbKfiJ69f8X0A9iKOm3Wvtyi
 1kOUq64dSex1aHR2AUD72JSx2u4kk79xE/5R1CfrSSdcFJZOGqXF5cRcYVKfpG0C40MoiLuEfAc
 /Avt+Yd4OxYzq61Ckto2DlDwVvDBB/D+TZyezPhRSy7nyGCVH9WXG+HKuW/h7bOVVfF+y4bmyaP
 bT7A39zIJ8e6pa4aQoQ==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa056ae cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=PXcuKL70AAAA:8
 a=FRSEYCzRAAAA:8 a=pTs-M1waXw2_HFRbnroA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=xVlTc564ipvMDusKsbsT:22 a=1qLaeP4TCVy2vqIEy19U:22
 a=H4N_Y-AU75W7NKDNhZlT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: cUW5m2cnaUBGErjoX6b6jhLD4jyoD8Lr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIwMSBTYWx0ZWRfX06EhZlTecziT
 UxRIfNJ0BYd/kJQJxjAID1+yzzaDK3ZRN8wCO7laS0CvCGeG4TGfXG0MXtR/8beUJHava3LUgYi
 VWZc6b1hMz0LYrl6q7873ue96cv3mJw=
X-Proofpoint-GUID: cUW5m2cnaUBGErjoX6b6jhLD4jyoD8Lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080201
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 9/8/2026 6:08 AM, Andrew Jones wrote:
> On Fri, Sep 04, 2026 at 04:56:07PM -0300, Daniel Henrique Barboza wrote:
>> The harts requirements of RISC-V server platform [1] require RVA23 ISA
>> profile support and others.
>>
>> We're going for a profile-based implementation, instead of a regular CPU
>> that can inherit RVA23, to allow future CPUs to use it internally as a
>> starting base for their own extension sets.  There's also a new
>> 'rvserver-ref-1.0' flag that can be used to set the extensions in the
>> command line for other CPUs, which can be used for testing/debugging
>> purposes.
>>
>> Note that for all intents and purposes "riscv-server-ref" is a regular
>> CPU and no, we're not trying to set a precedent of calling the riscv
>> server platform spec a profile.
>>
>> [1] defines in rule SEE_020 that we must support at least 11 debug
>> triggers (4 for insn address, 4 for insn load/store, 1 for icount,
>> one for int, one for excp).  We're going for the minimum.  If more
>> triggers are needed users can set any trigger amount with:
>>
>> -cpu riscv-server-ref,trigger-count=N
>>
>> Note that N must be <= 128.
>>
>> [1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc
>>
>> Suggested-by: Icenowy Zheng <uwu@icenowy.me>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> Reviewed-by: Chao Liu <chao.liu@processmission.com>
>> ---
>>   target/riscv/cpu-qom.h |  1 +
>>   target/riscv/cpu.c     | 31 +++++++++++++++++++++++++++++++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>> index 1a28f1369c..61234842e3 100644
>> --- a/target/riscv/cpu-qom.h
>> +++ b/target/riscv/cpu-qom.h
>> @@ -42,6 +42,7 @@
>>   #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>>   #define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
>>   #define TYPE_RISCV_CPU_RVA23S64         RISCV_CPU_TYPE_NAME("rva23s64")
>> +#define TYPE_RISCV_CPU_RVSERVER_REF     RISCV_CPU_TYPE_NAME("riscv-server-ref")
>>   #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>>   #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>>   #define TYPE_RISCV_CPU_SIFIVE_E         RISCV_CPU_TYPE_NAME("sifive-e")
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 185474a8cf..b5a75fbc1c 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -2417,11 +2417,35 @@ static RISCVCPUProfile RVA23S64 = {
>>       }
>>   };
>>   
>> +/*
>> + * The riscv-server-ref spec isn't a profile per se but its
> 
> spec?

I'll replace this comment with:

"This riscv-server-ref entry isn't a profile per se but ..."

> 
>> + * CPU definition can be modelled as a profile that extends
>> + * RVA23, with additional things on top of it, and allowing
>> + * future CPUs to derive from it via
>> + * ".profile = &RVServerRef1_0;".
>> + */
>> +static RISCVCPUProfile RVServerRef1_0 = {
>> +    .s_parent = &RVA23S64,
>> +    .name = "rvserver-ref-1.0",
> 
> The commit message and comment call this "riscv-server-ref"

The CPU is called riscv-server-ref:

#define TYPE_RISCV_CPU_RVSERVER_REF     RISCV_CPU_TYPE_NAME("riscv-server-ref")


"rvserver-ref-1.0" is the CPU profile name I came up with as a placeholder.  I
believe we can rename it to  "riscv-server-ref-1.0" to avoid confusion.


> 
>> +    .satp_mode = VM_1_10_SV48,
>> +    .ext_offsets = {
>> +        CPU_CFG_OFFSET(ext_zkr),
>> +        CPU_CFG_OFFSET(ext_sdtrig),
>> +        CPU_CFG_OFFSET(ext_ssaia),
>> +        CPU_CFG_OFFSET(ext_ssccfg),
> 
> The cover letter says that the sdext patches need to be merged first.
> Don't we need to configure it here?

Yeah ... we had a very earlier version where enabling sdtrig implied enabling sdext.
That's not the case for some time now and forgot to manually add 'sdext' here.

I'll do that.  Thanks,
Daniel

> 
>> +        /* ssstrict is always enabled for PRIV_VER_1_12 */
>> +
>> +        RISCV_PROFILE_EXT_LIST_END
>> +    }
>> +};
>> +
>> +
>>   RISCVCPUProfile *riscv_profiles[] = {
>>       &RVA22U64,
>>       &RVA22S64,
>>       &RVA23U64,
>>       &RVA23S64,
>> +    &RVServerRef1_0,
>>       NULL,
>>   };
>>   
>> @@ -3759,6 +3783,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>   #endif
>>       ),
>>   
>> +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSERVER_REF, TYPE_RISCV_BARE_CPU,
>> +        .profile = &RVServerRef1_0,
>> +        .misa_mxl_max = MXL_RV64,
>> +        .cfg.max_satp_mode = VM_1_10_SV57,
>> +        .num_triggers = 11,
>> +    ),
>> +
>>   #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>       DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
>>           .cfg.max_satp_mode = VM_1_10_SV57,
>> -- 
>> 2.43.0
>>
> 
> Thanks,
> drew



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC6BCD98E1
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 18:05:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZY9n-0002wz-Qw; Tue, 16 Jun 2026 14:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZY9m-0002wa-8J
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 14:05:02 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZY9k-0006Yb-6C
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 14:05:01 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GH9FST006306
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 18:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UL5mhEPD3YA44YAlvCn907khtWrS45vl5LdOiDWFwfA=; b=Y43jleiI7VoObe9n
 vlTVDBGt9Rh1V+FHARPW0EMultEDkNOKF+MtZkJUDMwLVT9CJzQV8jIf7CXut8VL
 tqZDEGX2QvzHvGd5zmtfAlwHJY0Cpu0cWK5inVmhNZX+IrkQPWnFkNokhZM+WPkb
 tlM+PnkD5lBGlPn+pF89SmsJgzfrEO8TsC1CuP0l4KarUV9t8Tq4dPfDw3WkGn8b
 YnfbPPwIxdMNVMClt+YnTwSNQc7QnyS74KheO2X91Hzv6DRdxMcbLIOMKmgLwWCV
 h0x8iAd++rBHDW5cneGz8By4tKABEd9z4uogTLTbXx46T3vgF57O3qRzR9XR559M
 pwfDew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09kbc8y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 18:04:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-91931144870so626300985a.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 11:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781633096; x=1782237896; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UL5mhEPD3YA44YAlvCn907khtWrS45vl5LdOiDWFwfA=;
 b=F0SfxVSn4dGNPtmPIRcLIwJXS1wyDnL9kDEqJb6Y/whGw8QDs4sBOHpJatOp12yZ5S
 6saLTBZPBtwhM4TQlXFTQWcVxaOR+cm2aH2FAoigKn76nNl0tuTMfzbyUZvswdFRgQqC
 diDB5rq1oub8rt/zlFu69s2jThQMhAQRF6MUmKqCzNKxcK9cEk/1W5F0rPGYquo5fVou
 JpbBV+Pn2u1m42g909yKy8EvSNVkQpw/F0tp8Qq2CvRFUVS72cc4Dgyqsczgfdu40KIf
 gvGKeXCDQ0ewrUUIQbljolwC+BQTmBxLb25+/BwmpiqNO1sq9WQgXdLFDZR8h5TYpjFg
 uXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781633096; x=1782237896;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UL5mhEPD3YA44YAlvCn907khtWrS45vl5LdOiDWFwfA=;
 b=GZVKgAKcJj+yNwYo6Djb3fJ6dk5nCmX+tO3akyA9VpYC63IL/Wu/ZmBqJE+xwE3oLr
 II6SlgJemRr01VZYJxWGGT9t2KoKzvnrszUpam0nwUZKm3klb+12LrcCGiHJfVGsnwEe
 A7CyygMTGpY37JAspLZD+o6jPSIqZXY5wxK+QayTzAraSCUGFBWMhnwPz78kkflFfZ2F
 sRi6PGYs+DVSEUr/WiavGKGRVojOfkrz6WDx4x+JXp9FwJE7maH+cDYQqXlueZE7rhDn
 LfpTrAXdnbJKqBCoOPnEZSD98MQZFFd8lm94UojzhkcpWEGy1vA9lJAFMh+8QYWUo93G
 a1pw==
X-Gm-Message-State: AOJu0Yy2ntd3T7zR3pqVcmuqSc/unPceCmNrv0U6ONE544zRcLklwNZz
 BP4CY+gOzWJPuiGtjmyYf34v41xeIZ6C6nN9WqY6umFelGmjuQZ9rIHpFdtdHEghiAxp5m6rOlr
 5sO+yAAHSiT2vLDYaT5aJNNTS2VxIOgFkALesKmbgwiQHJne41/EqlT9yfw==
X-Gm-Gg: Acq92OG8wDUHzXuLBIHVa1+PuHvpD0PxSufIfP7rUVRQcPTiX1tDsHWAFBoIClRJiVj
 B4vO1UV9W/jkB/Bmu1R+xrjOlk0DBtxOk1EXAZ3LWt4DRoJjCQbMSnq7NtceRxWe6bjG73oud1a
 UBgYhyVThNQYhgSuCB+3S/1rrdH/QL9jwf6u+aDWwv0dpSCJ6e7o7gjYAOddFU02PU5uUrXsXaJ
 gzjtxTHNxrrTmfZvl22p9ABtwefcbgMELY0m3Fz/Fxe1LtYRwjZabTq2ExcULwGRcAdC35XbcDa
 j0mOhoBOlxSANRFrz6Hr4gPNvJ8tEiSOYsuyvEt0BnC1LvW6vlBRDEAT6Qd+0tbv6Yn9SwJ7REc
 fXXZfwmlIcgGH+xMnvJWpTBpCi/+tRzathOnmgc+WvnIvBkO/BwFVWEKRFw==
X-Received: by 2002:a05:620a:371a:b0:914:7e9a:2716 with SMTP id
 af79cd13be357-91d8d3a9a27mr131470385a.38.1781633096387; 
 Tue, 16 Jun 2026 11:04:56 -0700 (PDT)
X-Received: by 2002:a05:620a:371a:b0:914:7e9a:2716 with SMTP id
 af79cd13be357-91d8d3a9a27mr131464485a.38.1781633095770; 
 Tue, 16 Jun 2026 11:04:55 -0700 (PDT)
Received: from [192.168.68.103] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9161a04f5b7sm1533213585a.38.2026.06.16.11.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 11:04:54 -0700 (PDT)
Message-ID: <9c47ffd1-e90b-41a1-903f-019d0c78e4c1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:04:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] target/riscv: add riscv-server-ref CPU
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 uwu@icenowy.me, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
 <20260610214133.1882563-3-daniel.barboza@oss.qualcomm.com>
 <fae30540-54df-42c1-bd2e-1c832f69f75b@eldorado.org.br>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fae30540-54df-42c1-bd2e-1c832f69f75b@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4NSBTYWx0ZWRfX9pYAq/YD+6/7
 DLb/kKVwm+x3M4XZy3ndRiqTCaTjyJKQMMUH9aMsy+VKzVSWXihoZFK+83BAqAaHRdp7KTOS1u7
 D7m9Nvjv2ZC5HpaMeJTKhUwKx+F1zpw=
X-Proofpoint-GUID: RdWqJJDOsq9ucHEDLQwv3GKrxgc_3upn
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a319049 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=PXcuKL70AAAA:8 a=RceVjk-67B5CBUFRr-MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=1qLaeP4TCVy2vqIEy19U:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: RdWqJJDOsq9ucHEDLQwv3GKrxgc_3upn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4NSBTYWx0ZWRfX/7zUydDnIRj9
 B4Ka0lLGBsL3UoXGGu0JdM7gnYKPJqNLjdefIIMXfqUm51uR89Es04VjT/TAQwr7ifvOpGWuynz
 Wj0wVGf+X9XiltSZRuHnFWOVGp2J9XoA80O9VJxYDeCkOoDF/GPCnMaflK10VAjZHlOpt+lNjBQ
 zkwXhQ+TkHddYzBNg14BhQp1kowgaA0wiMUj0+AZ6iceIWi/43lNNW+0QWBYczkBzyN2/vR+BEw
 Sf0WaymQZ5vt7r05tC+U8PWC/euCb7iiN33kS+x4Z6l/GWGIldML+cMe1iR7VQ7QqV9v7SkkIZ8
 7NhMUO9GDqwDBCE4T417LfY+QGbBqK2xkUIdthJkXfq3cWdBlEhV7v469Uf5utUHVz4oCd+QNMh
 CIUn9qVVNkZ/SU5ihZkR99npf6HADyjGpchxG+Nx2QeV7wnkjnr6oXh96MPgSAr1Gx2tBI0qJ+C
 8tEbIqYrJWCORt36QlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160185
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 6/16/2026 2:51 PM, Matheus Ferst wrote:
> Hi Daniel,
> 
> On 6/10/26 18:41, Daniel Henrique Barboza wrote:
>> The harts requirements of RISC-V server platform [1] require RVA23 ISA
>> profile support and others.
>>
>> We're going for a profile-based implementation, instead of a regular CPU
>> that can inherit RVA23, to allow future CPUs to use it internally as a
>> starting base for their own extension sets.  There's also a new
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
>> one for int, one for excp).  We're going for the minimum.  If more
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
>> ---
>>   target/riscv/cpu-qom.h |  1 +
>>   target/riscv/cpu.c     | 31 +++++++++++++++++++++++++++++++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>> index 30dcdcfaae..a150acd151 100644
>> --- a/target/riscv/cpu-qom.h
>> +++ b/target/riscv/cpu-qom.h
>> @@ -42,6 +42,7 @@
>>   #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>>   #define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
>>   #define TYPE_RISCV_CPU_RVA23S64         RISCV_CPU_TYPE_NAME("rva23s64")
>> +#define TYPE_RISCV_CPU_RVSERVER_REF     RISCV_CPU_TYPE_NAME("riscv-server-ref")
>>   #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>>   #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>>   #define TYPE_RISCV_CPU_SIFIVE_E         RISCV_CPU_TYPE_NAME("sifive-e")
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index e02d53cbba..63fbc4b98e 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -2063,11 +2063,35 @@ static RISCVCPUProfile RVA23S64 = {
>>       }
>>   };
>> +/*
>> + * The riscv-server-ref spec isn't a profile per se but its
>> + * CPU definition can be modelled as a profile that extends
>> + * RVA23, with additional things on top of it, and allowing
>> + * future CPUs to derive from it via
>> + * ".profile = &RVServerRef1_0;".
>> + */
>> +static RISCVCPUProfile RVServerRef1_0 = {
>> +    .s_parent = &RVA22S64,
> 
> I guess it should be &RVA23S64 instead of &RVA22S64.
> 
> Other than that,
> 
> Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Good catch!  This was weird ... my lame excuse here is that I got this
fixed in my branch before sending and forgot to re-generate the patches :D


It's fixed in v9 now.  Thanks!


Daniel

> 
>> +    .name = "rvserver-ref-1.0",
>> +    .satp_mode = VM_1_10_SV48,
>> +    .ext_offsets = {
>> +        CPU_CFG_OFFSET(ext_zkr),
>> +        CPU_CFG_OFFSET(ext_sdtrig),
>> +        CPU_CFG_OFFSET(ext_ssaia),
>> +        CPU_CFG_OFFSET(ext_ssccfg),
>> +        /* ssstrict is always enabled for PRIV_VER_1_12 */
>> +
>> +        RISCV_PROFILE_EXT_LIST_END
>> +    }
>> +};
>> +
>> +
>>   RISCVCPUProfile *riscv_profiles[] = {
>>       &RVA22U64,
>>       &RVA22S64,
>>       &RVA23U64,
>>       &RVA23S64,
>> +    &RVServerRef1_0,
>>       NULL,
>>   };
>> @@ -3326,6 +3350,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>>   #endif
>>       ),
>> +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSERVER_REF, TYPE_RISCV_BARE_CPU,
>> +        .profile = &RVServerRef1_0,
>> +        .misa_mxl_max = MXL_RV64,
>> +        .cfg.max_satp_mode = VM_1_10_SV57,
>> +        .num_triggers = 11,
>> +    ),
>> +
>>   #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>       DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
>>           .cfg.max_satp_mode = VM_1_10_SV57,
> 



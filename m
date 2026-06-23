Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC38CDB470
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 21:15:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wc8Sj-0000xo-Gh; Tue, 23 Jun 2026 17:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wc8Sh-0000tn-Dr
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 17:15:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wc8Sf-0002ZG-Gw
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 17:15:15 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK0wC21177616
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 21:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 magXe6KtTlLD03dhum2nDQzDN1jU9apHm5SsCHwrUvs=; b=OPWG6xVHB2rEjAJR
 1wsZ/8SvF2340D7s60Wg6e9y7Hp57niszl8C4wTGOMbL/x7zdYSTH8iUp31Xdt08
 TJeIagBbgxIn61hlJ0ZoMFyf7YqfU3V65u0535xVB3iEReo7giPYqpnG8amSA099
 6XrcsDp1tGO2uZ5vUAmDDRkxxRtCTy2iHOsxGvQMZeaBCTYNVT5miKLBRoZr5NIZ
 NgPMtgHGIyHBoltJo+fyTGppmFjOxUtJrnvM9ADzEhn9bWKSupbn/LUqlMsHct/D
 FnF0h2RJAl9KHe9KCbeigs4hOsGTIsVvKMVc3lTLwAXAYx03g4qtRVVyHvo2he9n
 ZM0VqA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe6b03v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 21:15:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8dbdf24d47bso7454706d6.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 14:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782249310; x=1782854110; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=magXe6KtTlLD03dhum2nDQzDN1jU9apHm5SsCHwrUvs=;
 b=GmHJM6EMb1+7C2tKZdAOrGOJlnwdz0KKfftx6iwDF1b62db7iuehbxwnBqr14SYfLL
 ycKWZt5hT4aLKngJI0uYkfy4T8YQEgcoTgCNwzohHg2gWnNxDxj40bh7NBmWFx9gFPgz
 /VKGxkk+Ea5cZ09uxrzXQvJMVmRPDWVCIgC34nS+2RzXVyN1z1tMAoQ+ktT3+lCWxZhp
 l0ttHIdyW/Z5I32R6t6i/M9/j5PuoNhBydPln9RQGAgJ+1bL6/BXcdqOEA9J+SQNHWTM
 gJgIDKQALwW49ZWs4Mi7UQyE43qcYcVh3F+sWV0MSSTvtmo6tnOf6ymG+R7Q8DTsvfdO
 PltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782249310; x=1782854110;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=magXe6KtTlLD03dhum2nDQzDN1jU9apHm5SsCHwrUvs=;
 b=Zp2ZC2ZWCYNr9HnA5iOnKDIwFS7i0Q2GzagmdNlR053jwTghrXjFyN3EBwloHutUt3
 MpHbtnUakBxrrC4GEBRa9XoNzCc7w5JnLVgYap1bzxcseJtqDszk5weMJyBJRcFsE2iP
 AitqpQgDzEVPp86mReOUfXj5wRJGUUjqJNpRNLmL46VKfLODEOKq70h6kfdXL4jiifqG
 uCKN449/6Zt73lnvED2xgcc0sOCKLF+mfEpQgNlLnoHEb2IedEw/CLl1DPluFAAF76jR
 e/hPUnEPPQVzlNMMCBO5lguLfbYJ/DcxIN0fDmM6nQd+GeL/v11XRvQuLZ1KelgVTd1j
 v7YA==
X-Gm-Message-State: AOJu0Yw3/RvBZcai1Zwi2GvioT6tii+ifBQpb/AqN5AD5zeaj1qEz5k/
 6dS4Un0mbDKxD6KOqJoA1d2Km7eZFB6DV7AOhZOz4Ku2e6BM11jU++HljpDMkZ/612w6jZoPa+P
 0XmwMoMDlK8dEMaTH9Uv1wLZ9KAKTXIy9paMO+Z/e3EEsknmwcqELKjteGA==
X-Gm-Gg: AfdE7cmMMTrWunME37aJeD8/rB6hykkMBHb2vpOIaAuuOWUumZtt10t0i76p6xvIll5
 gHH0h9EZ/mkb3/8x+3A/csWdLQeMoBKCby/1PYOUe+DVyAx41TF4HEU8PJDphuesfPHFsk96HW8
 UHFdOaXK//HdccMNE++3yTR7eCZJxUvfdNOxaGlyEKZX5+s+4Nv5IklLNizCO8T4DZtlvwpZf6w
 OMX4U1FiNnMADGC+rD0LodpkODIwXQ2pbHPgJaCPIa1ObC3pfG1UT9pRBPc6rICtchFu3c2BLId
 +fAFnPrOZCwIgqKzwzjlnI/BVK2qMqbncVLcubh1sHzZSSOuEFvJbYqCfZ4sXIlXdtw2ZBwdrUx
 Sm+cPg6uk/8bIAeKYHP3ZOgdftPhEOOCUrnjlsIJTeyHv
X-Received: by 2002:a05:620a:170f:b0:915:9e84:85d1 with SMTP id
 af79cd13be357-92645da2097mr754205585a.23.1782249309975; 
 Tue, 23 Jun 2026 14:15:09 -0700 (PDT)
X-Received: by 2002:a05:620a:170f:b0:915:9e84:85d1 with SMTP id
 af79cd13be357-92645da2097mr754196485a.23.1782249309418; 
 Tue, 23 Jun 2026 14:15:09 -0700 (PDT)
Received: from [192.168.68.103] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926000c0c0csm371464085a.25.2026.06.23.14.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 14:15:08 -0700 (PDT)
Message-ID: <daa5f524-1b44-457f-bc23-b93a281cf4f6@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:15:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] target/riscv: make some riscv_sysemu_ops TCG only
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-6-daniel.barboza@oss.qualcomm.com>
 <5bbeb7ee-2826-453d-b50c-60240df47954@oss.qualcomm.com>
 <3b91c2ad-479a-4d08-ada4-b9af24ebf697@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3b91c2ad-479a-4d08-ada4-b9af24ebf697@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _ahH7ks-1vMCDZIr4H_j4W3ziMDbyUeC
X-Proofpoint-ORIG-GUID: _ahH7ks-1vMCDZIr4H_j4W3ziMDbyUeC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE3NSBTYWx0ZWRfXzdvQbKp0dK86
 ei3ZZ5KpylMq7bTMTfI1yyPhxwuiPp9E8wLiisSaiX1Pk2iOyanD665kAgmW93I680Z64wJSMXb
 F/AXLcuO95Q0h6eSqki9u8Kude6icr8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE3NSBTYWx0ZWRfX8R+JxRb4EL/N
 cCW8UllnwnTgoEaIPIkEFbsT3xP9RWXiY7o1hjUik/EUFrcBvX/oczxHIkEHSHX/PvmDyrqAEoF
 rFq+lY+yERWUA/lLMB/6cAzTfOs2UgagSbofbofZzXUvoSWGlfj0qlTieqnk6LFSrqOixalC/1v
 N8dB/xkXvuD8IEXbIfsf4Xg2p5vMW0Y8+ML2gVwFV9YSTzffmKwujpnYXvw3QhR/Y5j3czPfnpV
 P79QMGbuLgRbwW2dYnoOcx8KfZrECStPYezlFJA3m31EjGWhL9Z1Gstv0Xb71GK9fDAvwidqpiW
 OxFd1gLPHy4/8rB77kduvccsxjayvIG19DrSdkcpJYEYad2XDcJgqOP0ceClTwvMctjwQ2nfRxd
 lc1ohNiIATDLqcunqOlSzCFonIJT3tCRDZIFyAsfQsIA9iG2FbDLtLmVzWUNibS+l2Ym0DwVlbu
 wfGMryobLg+qlAVSMzw==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3af75e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GlbM3WHAALaB_hmt5SQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230175
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



On 6/23/2026 2:25 PM, Daniel Henrique Barboza wrote:
> 
> 
> On 6/22/2026 6:30 PM, Philippe Mathieu-Daudé wrote:
>> On 22/6/26 21:31, Daniel Henrique Barboza wrote:
>>> monitor_get_register and phys_add_debug are TCG only.
>>
>> They aren't... And get_phys_addr_debug() seems mandatory.
>>
>> Maybe it happens the RISCV implementation only considers TCG?
> 
> Yeah, the wording I used is bad.  What I wanted to say is that the RISC-V
> impls of these 2 interfaces are TCG only.
> 
>>
>> If so, maybe this patch is heading in the right direction,
>> but its description has to be reworded IMHO.
>>
>> (while here, maybe we can convert to SysemuCPUOps::translate_for_debug?)
> 
> Do you have an example? maybe we could squash it in this patch or, if needed,
> we can add a prep patch.

Just found an easy example in the microblaze code.  I'll make the conversion
in this same patch.


Thanks,
Daniel

> 
> 
> Daniel
> 
>>
>>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>>> ---
>>>   target/riscv/cpu.c     | 6 ++++--
>>>   target/riscv/monitor.c | 2 ++
>>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 4e96bbeb60..0a7e6f6ed0 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -2669,11 +2669,13 @@ static int64_t riscv_get_arch_id(CPUState *cs)
>>>   static const struct SysemuCPUOps riscv_sysemu_ops = {
>>>       .has_work = riscv_cpu_has_work,
>>> -    .get_phys_addr_debug = riscv_cpu_get_phys_addr_debug,
>>>       .write_elf64_note = riscv_cpu_write_elf64_note,
>>>       .write_elf32_note = riscv_cpu_write_elf32_note,
>>> -    .monitor_get_register = riscv_monitor_get_register_legacy,
>>>       .legacy_vmsd = &vmstate_riscv_cpu,
>>> +#ifdef CONFIG_TCG
>>> +    .get_phys_addr_debug = riscv_cpu_get_phys_addr_debug,
>>> +    .monitor_get_register = riscv_monitor_get_register_legacy,
>>> +#endif
>>>   };
>>>   #endif
>>> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
>>> index 3e89dcaf7c..7aacd1d89c 100644
>>> --- a/target/riscv/monitor.c
>>> +++ b/target/riscv/monitor.c
>>> @@ -245,6 +245,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
>>>       mem_info_svxx(mon, env);
>>>   }
>>> +#ifdef CONFIG_TCG
>>>   static bool reg_is_ulong_integer(CPURISCVState *env, const char *name,
>>>                                    target_ulong *val, bool is_gprh)
>>>   {
>>> @@ -379,3 +380,4 @@ int riscv_monitor_get_register_legacy(CPUState *cs, const char *name,
>>>       return -EINVAL;
>>>   }
>>> +#endif
>>
> 



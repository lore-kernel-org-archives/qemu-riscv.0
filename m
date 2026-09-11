Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD97CC88E4D
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 20:04:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x57Ts-0005QS-En; Fri, 11 Sep 2026 16:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x57Tb-0005PZ-3s
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 16:04:01 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x57TX-0007K0-PQ
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 16:03:58 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68BHWm1N1462171
 for <qemu-riscv@nongnu.org>; Fri, 11 Sep 2026 20:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lixvGqGqFYKVgMjCrScOa/elj3rCbCbFZwYjb7P8YqE=; b=QydX0zQkwmnO3tbu
 y5Dc6ey9xp9JFPYkK8iEmzyoE2GjGVXQ3L+wvi5tRykdZAyKPAoySgdYEJzOaggS
 xkKkmKca9uOfdGuQXSNPp5G/KfVyUivYpcbXRAQPny0VomSKGWK7qIEmWbCISO04
 hcm5lcPss8FlMZ9OIGmAa7mrbJzda6mmWLU8ROkJlAgOhs/0NYMY6lQNAFnFQE1L
 1Uh6/APpvLyFRsd2/VC7jRQMMCJ3AZjZvq7ZgdX5DX8AX4pNLZz8X9VYsRsXC1la
 YrIpcpeW9b2CKs/886wYOnIOWt/X11AK9G5e+IQj8H+508KZmrNAar/Tc64sc1R4
 ArffXA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmp0dgjkx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 11 Sep 2026 20:03:51 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-5c79915791eso499904e0c.0
 for <qemu-riscv@nongnu.org>; Fri, 11 Sep 2026 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789157030; x=1789761830; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lixvGqGqFYKVgMjCrScOa/elj3rCbCbFZwYjb7P8YqE=;
 b=PJO2iDPDoZyZqpl9t8HLUWhsUQ/yULpl/LV0PMDkgst0TZyTvrE9QgHVibaoJzXe6B
 EhSNGZTlJ7P7u17+FuLLTeKnc3hszjsBUzicr76g1qu0duGmMBu5gDw3jInCieQV7qmd
 KRRucgtT3Mj3GG+le5hcd45V7ccOL5XiEOpnl3UMn3FOIDY7FhhN2n6zUdD9VRi4nUHB
 jo8Be0WpjF9ZGcDUC1NO1tE3TXttSZasJlmAIpbieFcN1xNe4CyIf3E3KJRxWEWUs+QH
 da08+sQQuB2PeRcilULyAd0xMj/aF94+1HuPq1euz64vcTlXaAT8/qgOfn0xhm0JuPrT
 Fehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789157030; x=1789761830;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=lixvGqGqFYKVgMjCrScOa/elj3rCbCbFZwYjb7P8YqE=;
 b=q9lV1Er/PIBkHSvI2MJ9nYmYZluIWuQ1JjbbAOPsWq73v07R7ocoYiH80VLP3BpBAg
 cvRAUuAt8F8CCPcdqS4xFEhTX7kzm1SLc54CX4ra9SWdcTCsyyK4ZgUnN645hx5uRCdZ
 CaAcJIykAwBws27YNBYco+gLAYKXOoHZcu5RCp9Ru2RYpARXzl0obhpzTJzo57Jca701
 w7UgTFoql3KAvahFtavQtY13+6LdND20Mx9/x4rc8rskxGx4R4TzD1RwjzCR4nsvQHUD
 KHfvE6hEdQxgT4jy3AcTtK91X1kUW/OqyPbX5FN9LslZEpIROsylHItKRmIpiiE1e9/5
 j++w==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5YfbE8edBnNjzdQMDJDZUAShcyi3p6Q0mskKY58plqB8EW20JsYIhkKG/8M3jZBCt5WNp1OvGUZpx@nongnu.org
X-Gm-Message-State: AFuF++k1OOXruNHFu+0YseiceMg2DPM+/BD43jQXL8BtHVIXQ91gvotq
 6r1gOMHbfXItBp6CQwaoWRNx2Kf6i1AE57IVSCdmL77rb8cOofaZQFIBsZwAiRAiZUK46Bp1iKd
 NOZj1qKW58qTZ/5ji/+cJ1df1hR3CbvHh7eWV02PbK1Z3G1FnzLWgRF5Zlg==
X-Gm-Gg: AYBFou1DzDpn0zl+lqbHbzM+xYc0rje/jB38p2ejCEHh3FRnaTMxi1k8MYSztuYjdKU
 RjEPO+nPcROnTXnGbr6+m0rd5d14PkaqVln+NEgx8Vp56+j0HZqfpHw7srtrrf+0HnA/RRK7hKU
 91ibtRFcjKgf7qu7br0+qTEAtzBbQv4heYVioaolM1RnLF62hq6lrO+59UROY6rPnrr1wPJ8gZA
 iOroubV6XpMMRndnzzPSZdeNwcU9XtftLJpiJahpAceAQtq1pE2Bxy+aj2+/8U+rp/xK5A2S3Ff
 iGN2nQYw0CPd3uT8py2XuLh3kHd2pX16JSgBOO2UREeviUAYvaYYJx1YDId9yEjIsBagcf4N8R8
 jiDhkdFl8y174AYXHjklx+lEbvq/lqtX0H/Paxg==
X-Received: by 2002:a05:6122:21ab:b0:5c8:3697:9289 with SMTP id
 71dfb90a1353d-5c8462f4ed9mr7483222e0c.8.1789157030206; 
 Fri, 11 Sep 2026 13:03:50 -0700 (PDT)
X-Received: by 2002:a05:6122:21ab:b0:5c8:3697:9289 with SMTP id
 71dfb90a1353d-5c8462f4ed9mr7483180e0c.8.1789157029752; 
 Fri, 11 Sep 2026 13:03:49 -0700 (PDT)
Received: from [192.168.68.102] ([189.110.107.170])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-982b9f4239esm3831319241.7.2026.09.11.13.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 13:03:49 -0700 (PDT)
Message-ID: <7ba0c51f-e68b-4ea9-8df7-275aa2ccadea@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:03:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv/tcg: svinval instructions raise virtual
 instruction
To: Christian <christianslima@proton.me>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260911191436.23402-1-christianslima@proton.me>
 <UsHsyQAUZK5YOC-OaXZqSE8qAXWXiU7Vyc04UDwogGZTOENNyPKxg8yrg5xHGbHelQh2VV709xWz_gGU5WGBhYc7FcMthw4Od7m8oAhu3nE=@proton.me>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <UsHsyQAUZK5YOC-OaXZqSE8qAXWXiU7Vyc04UDwogGZTOENNyPKxg8yrg5xHGbHelQh2VV709xWz_gGU5WGBhYc7FcMthw4Od7m8oAhu3nE=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U7EHnuru c=1 sm=1 tr=0 ts=6aa45ea7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=arNgJ3JLhM/z8Vk/iMOFgQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=p0WdMEafAAAA:8 a=fE6XfcSEiRJYAPU6J0EA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: t7ftsmB9G9DgKyYyNV8D-Wu_4z_1MX-3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI4MiBTYWx0ZWRfX1+hzOjZoDgkp
 vbX9hjz9fwbl/5+vrg3lvLlxP4H8rNsVQC7bPbd942yg8m9wkNRC8cFFQIfKmJIYOeSXX7zF9s2
 I1xeJxTElh/L48Bhw+mWCLmP5Go5DhA=
X-Proofpoint-GUID: t7ftsmB9G9DgKyYyNV8D-Wu_4z_1MX-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI4MiBTYWx0ZWRfXx0k8uUEoUTWc
 4ascCcQa+oRqzIMAbDHxjI6EE3lSp3qktVva1sExXYOswLmuvXrMaT0OODNPF2TSw2QjvomF65c
 rx8xDhSQFuPbwEy2mNMVpr0LlTuom6AMKsGPTyWnzMDA253nnm+yGxSuOt4b18EGYQmZOqArB/T
 XpFh91sl0h1u42ePBdxETdOc8x2gHWg+m+u/AIFRO2PVadIUZx2dH2fwpsAWkyxahpIPQJ5FUV1
 8TBJUI5AGR19CNdyldtphBEdoWQbe/JrsYLiUblvYV7EALNdIfgIN6i6h9P8XBlt/kUB4pk2rmm
 O45tZHeWywZ17kuvCCoCcI6zfs57DY3BSDTEa/mPuiJbUIok2ZCBbjJ2ViMSHf9JklQOApWMPnb
 kworaFRmWnObY6Artp6zfFh/XJPs5psTfkA+TNDDs1Jioh0Xf35FpQhN7AZOdQM1j6ApFutUBlB
 B7R4KW+j2xExs5qscFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110282
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

Hey,

On 9/11/2026 4:22 PM, Christian wrote:
> 
> Hi,
> 
>> The risc v privileged specification requires hinval.vvma, hinval.gvma,
>> sfence.w.inval and sfence.inval.ir should raise a virtual instruction
>> exception when executed in the vu-mode. This patch add the check to
>> raise the virtual instruction exception when is in the vu-mode.
>>
>> changes in v2:
>> - Remove the wrong `return true;` from macro
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3621
>>
>> Signed-off-by: Christian S. Lima <christianslima@proton.me>
>> ---
>>   target/riscv/tcg/insn_trans/trans_svinval.c.inc |  3 +++
>>   target/riscv/tcg/insn_trans/trans_xthead.c.inc  | 12 +++++++-----
>>   2 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/riscv/tcg/insn_trans/trans_svinval.c.inc b/target/riscv/tcg/insn_trans/trans_svinval.c.inc
>> index 4614c1489c..5b1172672e 100644
>> --- a/target/riscv/tcg/insn_trans/trans_svinval.c.inc
>> +++ b/target/riscv/tcg/insn_trans/trans_svinval.c.inc
>> @@ -25,6 +25,9 @@
>>   /* Test if priv level is M or S. */
>>   #define REQUIRE_PRIV_MS(ctx) do {          \
>>       if (ctx->priv == PRV_U) {              \
>> +        if (ctx->virt_enabled) {           \
>> +            ctx->virt_inst_excp = true     \
> 
> I missed a `;` here and below, should I resend a v3?

Yes, please send a v3.  I believe the patch as is will not compile.


Thanks,
Daniel



>> +        }                                  \
>>           return false;                      \
>>       }                                      \
>>   } while (0)
>> diff --git a/target/riscv/tcg/insn_trans/trans_xthead.c.inc b/target/riscv/tcg/insn_trans/trans_xthead.c.inc
>> index f4e3051000..4bf6594747 100644
>> --- a/target/riscv/tcg/insn_trans/trans_xthead.c.inc
>> +++ b/target/riscv/tcg/insn_trans/trans_xthead.c.inc
>> @@ -267,11 +267,13 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
>>   #define REQUIRE_PRIV_MSU(ctx)
>>   
>>   /* Test if priv level is M or S. */
>> -#define REQUIRE_PRIV_MS(ctx)                                    \
>> -do {                                                            \
>> -    if (ctx->priv == PRV_U) {                                   \
>> -        return false;                                           \
>> -    }                                                           \
>> +#define REQUIRE_PRIV_MS(ctx) do {          \
>> +    if (ctx->priv == PRV_U) {              \
>> +        if (ctx->virt_enabled) {           \
>> +            ctx->virt_inst_excp = true     \
>> +        }                                  \
>> +        return false;                      \
>> +    }                                      \
>>   } while (0)
>>   
>>   #define NOP_PRIVCHECK(insn, extcheck, privcheck)                \
>> -- 
>> 2.55.0
>>
>>
> 
> Thanks,
> Christian



Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB49CDB46F
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 10:25:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbyJq-0006ln-Vv; Tue, 23 Jun 2026 06:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbyJe-0006hJ-Fu
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 06:25:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbyJc-0002I9-E7
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 06:25:14 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65N6ca8M2992137
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 10:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y7CJuPjqNfT31lkMAVQfj7NtVWQLceYnNCOXwjO6FNs=; b=KXJciRqn4cl0Ch63
 zaiYcPDSLFSQVCXRi+2YHafvH5alNIinGPUI/p+f6R/LCKbBZZn2ma3CFseutjrC
 Pe5W5W8sbqdVp7qvhbGhSRso2ajlUvM8ilASKSZcVxd7m9KmlXqq/vmgFqNsnOxA
 1FIN9nKbS03YOQB5/w4uVj81swkQbFbeHZo7u03MfmacUNvjqciwCJtXoq51jya7
 nLuh8RSwm/7Aq4ZKVoGMy5lzpBJI95fS4+BmX3qMEIT4b5hj3NetQTd+deUAXIrC
 pzQrTmox1JHOWkdYfsaLEoQ8pSlLTEPAwLLpHRoaN6tGDANKoMo25p9lajB3l3eQ
 ZgwgiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729uyaf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 10:25:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92158791d14so443393185a.2
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782210308; x=1782815108; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y7CJuPjqNfT31lkMAVQfj7NtVWQLceYnNCOXwjO6FNs=;
 b=iJrH2s6YE77184X4zxT9BuKPoXXB7UL9Jh0vBEnNUAku7lD0YpKOG2SyMYGlRGBouh
 ut/LGp0S/0k5omWOZSChIHFExwIg62F0wWIi+AbDphuKEl8rMjMUn7xoa/f+ysGlKbOi
 7CLXXBaFbXa2Ez6gI6B5CsiOkDP1w/Lw7R60oIdtVnn266GKzpSL976NyDcHjmbX+hyd
 eG9dvCZTODf4MowkAQthjVAcXu/z5y1QVtPfm5SZHem9ZFiXnvTesezEmj2+Zu/DBgsQ
 0iBuI9NY12vzkvZZ++M9r45lHPvROsV4iP5y1DAkX8+d7RH5N9bn9qemvIv+iNk2a3Hw
 lcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782210308; x=1782815108;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y7CJuPjqNfT31lkMAVQfj7NtVWQLceYnNCOXwjO6FNs=;
 b=W8ChYfCCRJfqkwF1SoDI7rxM+IT652Bo/0wsCNZ5KvJoFXIGXSXWQQHdhkZYcWFpNx
 Q9mBpMTFGnluTzWCWq4ogU3eJnoq4icp8XE4lDONqbBRi0IBY/CdLXVsanJfUJMskiAp
 d+4rpDBuenfYMqCMESj/xxTF00a96oLhrJuBo7ptdCmjQGO6Hc6Z9I29eBn++XfcqfUZ
 txccop7tdBKnZjaiSsQTunzX3/02mQtT9fR47EU+LvL3zCltRzRtSIKxqXKP+BfEcYJ5
 CdOzgLI1tPLudMLB5cZRcLM/FkqiQx773BYFZstbxrncBRom3se4CI5TRwnH+KxLG5/O
 fMiA==
X-Gm-Message-State: AOJu0YyAOQ/2NUbeEytapOMXWcIQAsGIab4veyDtFwpZKFV0WaxP5nH/
 AshMYMcpN5p6oG8ESrX5x1XRE9RHihd1IKMFx5rEa5ZCrAd9WOTSPYASMZrziJABQe5PZCmdDiE
 NlMS5cJWh4iPnkCJw/yO4QrrVS47mtWSBNzo3sOghPs7tGU/G1118HxzS0A==
X-Gm-Gg: AfdE7ck84hZt9kM1FGgzFU3TUpEe9OQnJdM7MxnzfbgaRYfqPgXPf5616GiE/czNsvN
 S3YvdX39OhON6FzneEnYth3sgjwlndDcaAHZuyLMhDE7fSQPBsQj8VkLaqvgPnm8pxkagKTcpxh
 qIS3HI2fg24StpJW+9ko57E7IWWcjtPdXifbGOIeEEIm/4drnKG8kAVti8i6q/VvY6FpwY5Mk0e
 mULfQjZ+PiTrpdl19Z++x4ZUJEM2y6zLIBPdExfNLiA8sppYNcpAg8ZvIRFxY2cxftkixJYqsOG
 xo3hay67Xux+EUURReVkDLaiSLAxeSevXglFopohAuHkm7onImtiWd1pZswGs1N9wj7k41KBluu
 510oDlFoDfapOMwZw3yJ64tbuI+JXej3xUmKFbLrOoLp7PgYCH+0Ga7ovFWDjiw==
X-Received: by 2002:a05:620a:6cc6:b0:915:d322:c482 with SMTP id
 af79cd13be357-9208aab206amr2986816585a.2.1782210308387; 
 Tue, 23 Jun 2026 03:25:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc6:b0:915:d322:c482 with SMTP id
 af79cd13be357-9208aab206amr2986812285a.2.1782210307829; 
 Tue, 23 Jun 2026 03:25:07 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924923c862sm269310865e9.7.2026.06.23.03.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 03:25:06 -0700 (PDT)
Message-ID: <53df1b7e-44e5-4d87-8878-8b3fb97cb5a1@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] target/riscv/machine.c: do not migrate pmp state
 with kvm
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-4-daniel.barboza@oss.qualcomm.com>
 <e3c93122-d0e5-4868-bf83-d757c0d1e0d4@oss.qualcomm.com>
In-Reply-To: <e3c93122-d0e5-4868-bf83-d757c0d1e0d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NCBTYWx0ZWRfX6M3gTjaA10hI
 1FAUQ166JBdRKnYC7JiehCTDEAGA37r6z/FCu9OaFiy0uC3eI4Ynb2GgavnX6L/E9poG2v1JMKD
 Bz9X06/il99mySUixmHmFRYgDsNdmv0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NCBTYWx0ZWRfXzPgBWqGBNNuL
 o8IWLpNaUQ1Por+GMTuW6jo2ULszOS2Bp5WRe/pRyWie/XT9FHRTtwqyuPAP2MLmFUS2saVErMa
 7t56LWc+L1T/iSTNDca76pSmgAQWKKM0zGI5J2EVjtXuijuVd4TAJMbyuo5+QQWMNZzPUDG+CV4
 fN6BjOMr/jBbsLiJyJ7tlu5Etu8cl1B4GNFcyjVSAFOX+dzyM8XdzrD08XX69/szZyGNnl/F7+l
 I8eQrX5mrMx7YTtLKSdh4odui2Dt/jNT+hZyt8PiXkgaVjSWd+9gTcoIOpRLjnVbwL8/O/7jb6f
 BB0GTPO8Pm69jW2UVCorWOFnG2zUXrnhlUyWyyjvO7HLI2/GN+ruPibNKlhTnmAPOxQTzh68mac
 GnUKMfI8Do0n3if/oQk6UNwnwuFLIZVDQTYpLmCvLSjcp3tn9GGD9LNWTKdi0GX7fR97DmPQtiF
 n3ZB8yCELbm4SF8v2lQ==
X-Proofpoint-ORIG-GUID: dK5Ekztf4Qdk5DlkK0isYG0Degew2c9_
X-Proofpoint-GUID: dK5Ekztf4Qdk5DlkK0isYG0Degew2c9_
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a5f05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KoNX9JoVznXDVZnRfakA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230084
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

On 22/6/26 23:25, Philippe Mathieu-DaudÃ© wrote:
> On 22/6/26 21:31, Daniel Henrique Barboza wrote:
>> The PMP emulation isn't present in the KVM driver.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   target/riscv/machine.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index ba96ceceef..bd93d6f3a8 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -20,6 +20,7 @@
>>   #include "cpu.h"
>>   #include "qemu/error-report.h"
>>   #include "system/kvm.h"
>> +#include "system/tcg.h"
>>   #include "migration/cpu.h"
>>   #include "exec/icount.h"
>>   #include "target/riscv/debug.h"
>> @@ -29,6 +30,10 @@ static bool pmp_needed(void *opaque)
>>   {
>>       RISCVCPU *cpu = opaque;
>> +    if (kvm_enabled()) {
>> +        return false;
>> +    }
>> +
>>       return cpu->cfg.pmp;
> 
> Here we want to keep logic parity, in case another RISCV
> accelerator is added:
> 
>          return tcg_enabled() ? cpu->cfg.pmp : false;

FYI there is also the hwaccel_enabled() helper, but I don't think
it applies here.

> 
>>   }
>> @@ -39,10 +44,12 @@ static int pmp_post_load(void *opaque, int 
>> version_id)
>>       int i;
>>       uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
>> -    for (i = 0; i < pmp_regions; i++) {
>> -        pmp_update_rule_addr(env, i);
>> +    if (tcg_enabled()) {
>> +        for (i = 0; i < pmp_regions; i++) {
>> +            pmp_update_rule_addr(env, i);
>> +        }
>> +        pmp_update_rule_nums(env);
>>       }
>> -    pmp_update_rule_nums(env);
>>       return 0;
>>   }
> 
> 



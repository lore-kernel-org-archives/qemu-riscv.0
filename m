Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD51EC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 10:59:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfbbo-0002bB-Ry; Fri, 03 Jul 2026 06:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbbn-0002aS-0K
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:58:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbbl-0004Vy-7X
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:58:58 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6635sBR03127063
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 10:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 25iw7/vphmbGjgh9hxFPZwPmHseqKUpwGcFUkBHbkX4=; b=Mx3gvYzRa4ljMN3N
 Q6by7ubanz8tFsBx2cz7tpGG/GS1mRtQilCTeFsyyMNYSDG7UqUXjXLDRnUu/GmO
 oNCR2viJ/sr2ZKPhsuC9soNefQVMqqX0bCnQ9wu9I0EvfJ+m+19oGth45z4nROR2
 90yx6h3yRmbIdgg2JElJK4x2/GvpePmQmu/mBWThA1o40sPZMMs51MdIJ3GDb4Mx
 y6sbrL3BDnyjiycrBKhyBhnTesNpy52hHAgUl1n1H4PBItayeWeW2kgVEXk/d48s
 5a1I7pypJG0IP3qpp1an998ZMmVyPIFm2Qi/zfTvjWK0vxR+G/5H2WctSve8uKF2
 LG7MJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnm2wx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 10:58:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e55721a8cso40864885a.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 03:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783076334; x=1783681134; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=25iw7/vphmbGjgh9hxFPZwPmHseqKUpwGcFUkBHbkX4=;
 b=CpCTzbk89ykKouLX4O9VzJbC43Svdze1ev99AdABY3foJ673UcCZ1Uxv8Q/E5f9KaZ
 6CpoR2ISZkuP/978M1jvojW97qZDSl2ZB5LKGuc6UFYY1VZDkj4Vkw8HVuOR+a/na7ii
 Yh4z4E7MO7tsby46n1cl0iiBy+civkiS1A7CZ8IJ6tQ2s+y5mFB++defCKXEL9tPuwov
 +ero3xyYNpoaCQo5u7/J7nmB2PFr6hhDGo8WGu/ocqROUKI5Ix0o1Ynaypa/i648PyCZ
 BuUQpHSLvOFf8dCkk/S7lFuzN0pXsRK6kKpDnFY56qM9ioy8N6Vc/x+OZQPPAFNcXVuS
 y6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783076334; x=1783681134;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=25iw7/vphmbGjgh9hxFPZwPmHseqKUpwGcFUkBHbkX4=;
 b=oXxuwOdHxjkBp0uIzEv602HY9nD5WVlWlxfrmu5xL5LnSkts1ZnTzEpE84d72UA9bm
 REP1aebGDtkTUle16KteQBjHhlscfe5mHEjRChtSpI9WbzlssMT8qicNEIeMGnW/3ENh
 VTspacYAv86+JeGaLM0yfXFYHqape3QfOs+CejKwmO6k4J8Do9tljed0gyuH2UK20Xy7
 OLuxk2bndAHC+eGmKehodX5NMfjDXwfJpi8oDInwFhiQT3WSOphFeqM4JioRumRGs01M
 icd2Q7Whs5NoxdJN0Lz3RsLmUpOj3n45xq0dLI4I14fXl7w2QzOkEkArNRolQ766i9hM
 VHfA==
X-Gm-Message-State: AOJu0Yy7KiOR39eCh+hJ3ZUH6D7LJucxoXquyO43dUyewf9SArv6dE0H
 LUWEulUosYNhlFYcDGGuytrgWfqD/vDmOCiuELXCAgLLV3sdjngW+uS5P+DnbM8+j52q8Hw6EeH
 U1VO5FPbTnJfucpS7nHzr7a+95F4zjqclh4fIsxk3WHRRS1Ek+8RhqAqM3g==
X-Gm-Gg: AfdE7cmp9pWoPZNIbKlRbyqeVPLb+hPZpeE1BxDhL41aAL0Q782aeskuYzh+8n32J1v
 VCIzjO0poCm0MVaDERqquWR8vI+zYlbeOpU6BKJWELKTLz+6qNbOivHfllNLsI8zwW4t4hN6P2d
 ekuFiP8xr0GFA6mb9sU16duv9gF6EfrULcX00HV6AbHTYU/lmj7d9h2hVo8rOq4+d3nAMEfpa+g
 jlVXWput96iGYHc6z1s5WKg1hHBUwWtNhSGARKhC+KnQ213VzCOoOwzIYF3/POdNQq2UYrI3YwK
 QuLVrJiARyDb1TsmHt3emi+oQmbjGV+Naz2cItWCw/D/ApLCqr90AGwgLVb6X0j7DS45JE9yjco
 F3dkHlhKo3g5LkZZDGYmhRV6/D/GqaO5OkkHA9V1t8xijCYqhOFTQ9rZ2BCKgoQ==
X-Received: by 2002:a05:620a:84c6:b0:921:9d7a:ea38 with SMTP id
 af79cd13be357-92e783cfae0mr1324429585a.45.1783076333986; 
 Fri, 03 Jul 2026 03:58:53 -0700 (PDT)
X-Received: by 2002:a05:620a:84c6:b0:921:9d7a:ea38 with SMTP id
 af79cd13be357-92e783cfae0mr1324427285a.45.1783076333534; 
 Fri, 03 Jul 2026 03:58:53 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63b6f8csm111846595e9.11.2026.07.03.03.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 03:58:52 -0700 (PDT)
Message-ID: <18ce4e8c-bb35-49c2-abee-9145a33d95ec@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:58:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/24] target/riscv/machine.c: do not migrate pmp state
 with kvm
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-4-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-4-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Er-CKGj-518U1opkWlpq7u5zIrLNNRNV
X-Proofpoint-ORIG-GUID: Er-CKGj-518U1opkWlpq7u5zIrLNNRNV
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a4795ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=7wlyiYytwB__mmaxUj0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNiBTYWx0ZWRfX9V99GiHx6xDy
 CMOIXlrRPAzPtcartthVACIYRUeAzPVVahDWBWGVZn3acKqU02WgWOJvvWn7JnFM1QBsYH8ZQ4d
 tdzOZCJVC+ylyfo9X+oif+h1f5T53TU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNiBTYWx0ZWRfXw8Wa6ZQgYnY2
 HfbxkVw6NQC7VwLg66RO2IdaW0TxCdF1mn39Zu0uTGBMiH26HqywN58QfuF3aoa6h3cSMkPy7NH
 hJPgU1SBuVnhUGuixQH1+yi5NDBxIe5DgIUcgfxl5UytQeHBIFE0IKqkDVD0AIwyTsUTS0WvruO
 q2DbD4QuzMP0kBjWGMLsFX6XCKswWwiLAVZxGBnYbZCkBIfJlRJmqvOuyCpP9btfUJn8M4PaRcF
 i7+LTYZ+hOykRs/PeFfwtcKvyVZCNbfs+W9JR2USctu6LvoD9YF99RPkJINcaYyKCuiDcXCOb8U
 cbN/YJ1nPVziwk34lDg+uXQth209ZMYmRxrjByy+fA1+/loDb17f3eQbE1uAtFZ53jzM/DsuYGh
 jGGmrwSoqOPYEj5Wz7cL41Wq78VhtyWv7BhtZFiFIym+fjgTbBErBhyWF8O+y9t/xkJV35D4Iyd
 pXuUKrNM5slDtTFIyGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030106
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 2/7/26 15:51, Daniel Henrique Barboza wrote:
> The PMP emulation isn't present in the KVM driver.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
> ---
>   target/riscv/machine.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ba96ceceef..e1cbcaa349 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -20,6 +20,7 @@
>   #include "cpu.h"
>   #include "qemu/error-report.h"
>   #include "system/kvm.h"
> +#include "system/tcg.h"
>   #include "migration/cpu.h"
>   #include "exec/icount.h"
>   #include "target/riscv/debug.h"
> @@ -29,7 +30,11 @@ static bool pmp_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
>   
> -    return cpu->cfg.pmp;
> +    if (kvm_enabled()) {
> +        return false;
> +    }
> +
> +    return tcg_enabled() && cpu->cfg.pmp;
>   }
>   
>   static int pmp_post_load(void *opaque, int version_id)
> @@ -39,10 +44,12 @@ static int pmp_post_load(void *opaque, int version_id)
>       int i;
>       uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;

Maybe we can use:

   if (!pmp_needed(opaque)) {
       return 0;
   }

>   
> -    for (i = 0; i < pmp_regions; i++) {
> -        pmp_update_rule_addr(env, i);
> +    if (tcg_enabled()) {

or use it here; also restrict pmp_regions variable scope?

Anyhow:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +        for (i = 0; i < pmp_regions; i++) {
> +            pmp_update_rule_addr(env, i);
> +        }
> +        pmp_update_rule_nums(env);
>       }
> -    pmp_update_rule_nums(env);
>   
>       return 0;
>   }

Since you are working in multi-accelerators frontier, keep in
mind in the future we might have some targets migrating between
different accelerators 🤯 :)


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E70C79FB6
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 20:03:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4OVp-0000E6-V8; Wed, 09 Sep 2026 16:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4OVo-0000Bp-Q7
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 16:03:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4OVm-0005IR-UV
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 16:03:16 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689JIa9N3067036
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 20:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2op8PIjEPqYtM3IFg6x1Vzw1//SQ13FJS4sDkTDMSJM=; b=GgMO67EGwueMV94e
 3m86qDDls+5INat1bCAhEh1hbnw4rq7ul2PCqDQtUQu8gsE3neVIRZLtoxJavZf0
 wWhSaguxG53HuBGIskanFoiGKliw3vxuAqXVtwZgg1JSHyl1pcwHv3wcxecSwP+j
 GIeeJtMXTqd2TSvLHStdkerAlS2OyYJkpX1eN5xPALoE0cVO7AvcEr5QExwHGkY5
 /QJL6i1QUFXmoTkL16PHG8WCHxYNbzM3I5dCqvjVj8ahARg/zRuul8YwNC79exLj
 GQ2Q7HwDrvRtvAx6axgMdGLoRyiAa6L64wlQVcQ3LAr01fnGkVf80b8sA1DktvRc
 PRxZsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg0dbf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 20:03:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93771aa0379so1250932685a.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 13:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788984193; x=1789588993; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2op8PIjEPqYtM3IFg6x1Vzw1//SQ13FJS4sDkTDMSJM=;
 b=GH+O6L2SkvZwkg9nBLvij2xBy0I8mkJXjogPmxkEXc1cS2AdRVjdmjIjAL1FD4xwxZ
 OJDDkloncWK8efgFFU3O9HuvlkzTKdRVDJeY1/WKZHpMWsNdKOKxYvzvbgSK0JUVaxTF
 rd4YYygOb/8xLcBlwr4AM1BVun5Vh65Co/bbNMoYSJy5J4Osmq31ONZUKs84WR4XmbcN
 To6anN0Vf41fu9AKNpAnqop61t9VwPgjhBpjwzx0uwchhQm4GEpuKhOl2/ySwreBOVLg
 5m5Fb5WvHtDqeJbs29QLilJMc9D3X9Ufl74fGb/vx7j9/TxGbH+OZ+IWxmPIBTCsKYzY
 tRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788984193; x=1789588993;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2op8PIjEPqYtM3IFg6x1Vzw1//SQ13FJS4sDkTDMSJM=;
 b=cEmNtGPl/PKgwH074nkzmUnkUv1eEoFVATunuFVEGFhQY1JoGooP0/dJT4Ld9Sdlna
 ajxAz/IbPe65QGduwcI/GtJMFKesGEnl+MvsK1ambmwH8zCU226sQXo2Lm02OHCIKVoK
 R/QRTMq4vbgX/WN26Kd5yPvnegL4Fq/s7N8qkuQLhPJBA6cqnJ5coLEJ8ndrktvwHR1y
 CL7mIpoDQt3IiDxgW3L3EEoXnk8jVJHE+ko3Ny5dP6S+CIA2uLucuInLRWwvTljQg/eq
 nFibPlrMDU8EOLhVhFpM0SAh6I7wl9xpFT27jtcIV9QL2Sz+DH9q26WIkrW7UGp+1kKa
 ZeJA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwcOSdibM9ba7OIpydOXKVKXaRwVDsWpFiL00NAELvkvnYiV8Qr/OY42jJKeHG//B0NjUxF/oSAYokz@nongnu.org
X-Gm-Message-State: AFuF++kxbQ9pnZ0gELiH7d3KNKDbFmlxQqodJ19S1qWD4icYSkeGGqn9
 /5cubvvOsXOEEWorYA8nmOQ571p6z0dK0yvaw01gid+CPjjbPxjd/2V4jw4HAb+PwgiOXKBEr3E
 Tn9FklCd1W1s8CEQRIeTdrhqFKtyS8nJgccKX4q62rZw1dM0ND+ZmH2rbUA==
X-Gm-Gg: AYBFou0GsM4MIpJt3vJZrtswmwuATezpg+lNYYpQlzI7VqDhDyBvGnfU855dAe1dDh6
 dmZaP0VyjRBkP59yFO5l/Eqa6iEDnhgIsVWyNryv5Ge2X0jmJPglKoYt0DnPA3RrCV/nFXus6ts
 reBCUqGpiXq23ufYjJ0vxf+nhDNE9lD9IiH02RtpzY6EkQVnpNIiKdIrI+z/b2F0GZVbhVHqDuS
 8ZcpPn8YaC0uVSof8dcMeSHSwunTf10xYanffhne5jRdiF/hLKVyBzTAcfGp1xyuIT6Hb9tfuDj
 gXkQW5bMuwAAQIq+PlMXq85x1edLrk+VxLXPFxwkrCHGOlSrDR8WBwx30hWLKwZNA3EQhjcc7U0
 WZarmyeOD5fqabT5Sfh5+CmatdMbuyCfkQgs=
X-Received: by 2002:a05:620a:4381:b0:939:926f:221e with SMTP id
 af79cd13be357-939d4a8e77emr581580285a.38.1788984193309; 
 Wed, 09 Sep 2026 13:03:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4381:b0:939:926f:221e with SMTP id
 af79cd13be357-939d4a8e77emr581500285a.38.1788984188876; 
 Wed, 09 Sep 2026 13:03:08 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397f9f4b3csm1489200885a.5.2026.09.09.13.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 13:03:08 -0700 (PDT)
Message-ID: <010e9bea-5ceb-4640-9817-2695dce10c0c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 17:03:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] target/riscv: canonicalize reserved CBIE encoding
To: wangyang <wangyang25@otcaix.iscas.ac.cn>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260908124755-v3-0-wangyang25@otcaix.iscas.ac.cn>
 <20260908124755-v3-5-wangyang25@otcaix.iscas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260908124755-v3-5-wangyang25@otcaix.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa1bb81 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=x-x9FmLcmKcBr6A0_pgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NmEdk8gc2LUUsAU6pt3J-UKiz-TxvvOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIyNCBTYWx0ZWRfX4FyMLlVslwov
 rvUqRyFVmwvHCNphF9DCIQqWFY67UpxR0hECI6IxZ5XENKCfqn/71cUL4gO9D2j6Rd0zUHL78RC
 2qKo7gG2vjkMIYcKshjRMRpNCCAgbBPzuW4lNXzbSJc0lZ4swOlM45dU4ZSCwKPsck7+frOhCv+
 YeMsQAwmXm6We2KIwjmloL7nNLwFAEue9Qdcm3NnEeopngf6pJcEoUWt9+QiiYdSv6nsJebcV++
 ZJtiFIsQTIKw1wsepmWXnedyvNQbt+/pQETrQOMM/VasPVfVx2/eNW0eHOxX2A/HNWvtP2GbSFN
 IyAaZZstx2C4MZZ/BAeLpFlZOd5t/vACgzIkQRKm2BEwiRaBzWvFYLbNKeeMD5BonAuxJAKAU2V
 S7CXgzJxv77veowTyRbR/cHGGcvp+v0gNVU77yOyj5yR3zABjatZJ5Po37Sphh4e46RkXc/ze+k
 CiK7ATNXLHzZAn8IBgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIyNCBTYWx0ZWRfXzQybz0upb/iM
 VRWThHdhQ4xtYOPWGXmVN8gVRXD/ObopVZTOCChXySCzXfJU96pFp22UdURZ8C24BZo5wWsVdvd
 t++NXNtmVLTRK/7cxCLeGNyDgiUYgoY=
X-Proofpoint-ORIG-GUID: NmEdk8gc2LUUsAU6pt3J-UKiz-TxvvOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090224
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



On 9/8/2026 1:47 AM, wangyang wrote:
> CBIE encoding 10 is reserved when Zicbom is implemented, while
> encoding 11 has defined behavior. Canonicalize only encoding 10 in the
> menvcfg, senvcfg, and henvcfg write paths so the reserved value is not
> retained and the defined encoding remains unchanged.
> 
> Tested: RV64 menvcfg, senvcfg, and henvcfg CBIE 10 and CBIE 11
> write/readback test cases.
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4416
> 
> Signed-off-by: wangyang <wangyang25@otcaix.iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/csr.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index bd4b6dc114..cf59f9ae54 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -3260,6 +3260,16 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>               stce_changed = true;
>           }
>       }
> +
> +    /*
> +     * CBIE is a WARL field: encoding 10 is reserved.  A software write of
> +     * this encoding must canonicalize to a supported value instead of being
> +     * retained in the readback.
> +     */
> +    if (cfg->ext_zicbom && get_field(val, MENVCFG_CBIE) == 2) {
> +        val &= ~MENVCFG_CBIE;
> +    }
> +
>       env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
>   
>       if (stce_changed) {
> @@ -3354,6 +3364,16 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
>           mask |= SENVCFG_UKTE;
>       }
>   
> +    /*
> +     * CBIE is a WARL field: encoding 10 is reserved.  A software write of
> +     * this encoding must canonicalize to a supported value instead of being
> +     * retained in the readback.
> +     */
> +    if (env_archcpu(env)->cfg.ext_zicbom &&
> +        get_field(val, SENVCFG_CBIE) == 2) {
> +        val &= ~SENVCFG_CBIE;
> +    }
> +
>       env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
>       return RISCV_EXCP_NONE;
>   }
> @@ -3422,6 +3442,15 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>           }
>       }
>   
> +    /*
> +     * CBIE is a WARL field: encoding 10 is reserved.  A software write of
> +     * this encoding must canonicalize to a supported value instead of being
> +     * retained in the readback.
> +     */
> +    if (cfg->ext_zicbom && get_field(val, HENVCFG_CBIE) == 2) {
> +        val &= ~HENVCFG_CBIE;
> +    }
> +
>       if (riscv_cpu_mxl(env) == MXL_RV32) {
>           /*
>            * RV32 stores STCE/ADUE/PBMTE/DTE in henvcfgh, so a low-half henvcfg



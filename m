Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE4DC79FB7
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 13:42:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4IZI-0007WR-3d; Wed, 09 Sep 2026 09:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4IZH-0007WD-8Q
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 09:42:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4IZF-0007Ix-A6
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 09:42:27 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689BoXrR2698591
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 13:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zGHYY1cLtxzUa1g9TN9Lq69vVvh4kJwNdcwvmNTqxQI=; b=fO5LwvXfxw9Obr/E
 GwtK3M84rg22XjkPbLT8juCm47H6X1rEU9WLkHLJSWXz1tgMDZ8gzD7BwtDRuLWL
 I+zM/L40SZYT5ru7/91Fbo63D+MzhVbEg3uSXyUvBoapnx9PkFu9euE0znx9oXUM
 aPsEPORHKzNQo8gTxcnjTWATDz0xtAqfWtPoxGPseOuczyO2sDE2LkGRAc3VUEEk
 SXJu0A54f7lT3NTO+VIUBWxeXsXoKECw/MtbvvwdBtFS7xQBLKBWc/QctCBJ8oXa
 0ROq13iEFPGGxW2pZ049rIuTSABUbmJ2Uu1nXh3q6Fa6Xnqoqr0k3hB7cAacwA44
 0jUrgg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0f2e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 13:42:23 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-872022ea47eso90349027b3.0
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788961342; x=1789566142; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zGHYY1cLtxzUa1g9TN9Lq69vVvh4kJwNdcwvmNTqxQI=;
 b=GgaQ7rH3Lg337WyV+tdhKQI9JFUJdEbQAja2eH2NYSjkHSYw49rw8QX5al+K0V+yTQ
 Bqn78S+f1+eDRXsu91rD3Quu5ivKQ0sMWHWhwgIzjuhcJWV8f/tASBI67SEuMuToZdZl
 KOAbzLtKOYEGe5fpCIo1+ENSPUU8e+a1+f9qwFD6MTK6ID8uzfIwdhu5NPvje7sslu6u
 Br14GU6Ym8OidqcwyH9x6p8/rmdOtlz7LIWEecFNHH5bNRJFpJHquCE0BvKzSawkc08d
 PZ+z19sQwZAgRXs3rpmZcOb4N6yYyNXgO3q45zWyFuMV5SzQ9TYVIzT7J7v/MACfHS3m
 yc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788961342; x=1789566142;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zGHYY1cLtxzUa1g9TN9Lq69vVvh4kJwNdcwvmNTqxQI=;
 b=e2ovr4ceNsrYlZPwJAuA2q3SMDJDyEzdmIZbkFTkJkBg4/NJ4oR3SyhiSLekDWdNZd
 2rAuJ9wyNW0XuZQQ/EUXB4Aq/TvhH5FfEyFip6C6ZSHIQ0+tiyNqjGUUpvX+aboKcRuk
 BEcOFU8qxCaDSvIBkeCDuZZlZ7SybZnVl4QQ5pPjKaLavjo+u7FhYMjhQH0oHFxJfnjz
 gVDwEwUhz8TRuRIF0ptlcXngl8jRk/+wP2QHGzTDEO+T6b6xiE+V2zmTXSes+IbsAlW4
 p3e6ifD+Rw/8tPDdF72yQaFJFzUjMH2koi29OBpoWWmfC0XkOOmW9fjtnEJ1cM3uBhIf
 YgAw==
X-Forwarded-Encrypted: i=1;
 AKwUvBznK2TgX6IzCDeScpKb4dxLkRXC7whEbCZLTP1yID4BZf1MtOHzOM2WyGHiiZaOnTCi7EhU+2hpbLVC@nongnu.org
X-Gm-Message-State: AFuF++lVb2StezGcZ3jmm+1zP00z4rVWwiB4Gb8mAKWyxn1XRdAOuSR4
 mgB/qEipm2gGi9ZBDOfuyvo43Bd7ujZx4ikoQk0xAjtldbeAtc8wqprR8zuBrViFlYBMzQQFU2X
 PQWsPH8xdJrGTjhHH7dq1wqJ64RSMuWuCcP0dDWrvekmjRbD3MuIZYfJ8Hg==
X-Gm-Gg: AYBFou2uxDLhFNBW8JKszR1zvSHOn6z5AmQcEY5+Dlf9occR69KTfXPUPFOtZ37VumP
 dsXbDsGm9Vu+7PcUU95JVfWz5u6Czc8pv3v0qH25f0i8Vb+ueNbo7f8zkbzoJAmRDPAK2VojKNM
 l9a845ITiifMqvKsu8St0jz260IqWJcmmmlLhmz5gfz2SmlnEeNlxVm57qRbIYHNyqX5DqfySBb
 pAIIheYHSu6kFRLcmyj89PBXIb2AbYjN8YTC06uruzlW7KDnAH3vX62uEBv+sINLna5J97AkjC4
 MDjU/Ie32r3HfCvVYYd9lO46IkQeoFCalNaDc2vVyPLZTQQUVlWVJef7RXkzNz3ray0MyBAanxi
 dBQwDc1pT/apLu6AxS3Add4YltKH8jrDa3Fs=
X-Received: by 2002:a05:690e:1596:20b0:66f:c1d8:19db with SMTP id
 956f58d0204a3-671101242cfmr324559d50.51.1788961342401; 
 Wed, 09 Sep 2026 06:42:22 -0700 (PDT)
X-Received: by 2002:a05:690e:1596:20b0:66f:c1d8:19db with SMTP id
 956f58d0204a3-671101242cfmr324410d50.51.1788961337211; 
 Wed, 09 Sep 2026 06:42:17 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-66fb48b374bsm12367579d50.3.2026.09.09.06.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 06:42:16 -0700 (PDT)
Message-ID: <57ee549f-9ffa-426a-abd8-95c9f8cbcc31@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 10:42:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Fix LCOFI interrupt masking in
 sie/sip/mvip
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Gong Shuai <gsh517025@gmail.com>,
 TianCheng TANG <lyndra@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20260907065112.2287127-1-mayuresh.chitale@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907065112.2287127-1-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfX8DOdNphHwnd/
 YiDXrOWC0o/x+7wEih7+uZlKCKBtRj+LLA+cFmkTtbFnHwTBvEaKOG6/sNBFRca6FQxya24uH2t
 HPWO29bQ4mlhAygBgPHz1Dddw4GlvNHVGqUALLq+MKIFe25+FUSi8KKYKoM5mGaWk+30f2GctEG
 QC8Vi5SIXQRQirKTC2X6EyAYghCQD5g6jFTlS7fiXq91ASImQzUywPRuoMBeT+++r05QiU4OkDS
 VgMnxDefU7ChEpTJFX9W0BjRQL7ZEStgH2CjwZGgO4i1a3O+YWHdFdDyFTEXGFCbRXgnER4eixc
 0Et06el7UJTOY7+3p7j69tjNdqhrpzBVyVChP/1DawO6an4jkfkqaNFw32bKJBp/UNraeqsDWb3
 KQzxYck9y5IPla8qvD2MeGVdseoiZCEf5Y7qoaiKPNBId97cmZpdOskwDRkrxnt2nuHnb0fCvtv
 nqUvJW4Ca8d0duWzWWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfX0FyXhVyHKm2M
 RB9+BvESXljXB8zVzjk+pJUTblDe1N5NqAdN77/2DMFjOMj1cssIzRoUNe0SrtVMqb2/0pVD2YI
 xRrsRO6PPnzCnobNR4ipDts+pId2H5s=
X-Proofpoint-GUID: gr-ORaebZ18c9eCcCEXPDC5yvR19TRU8
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa1623f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=sIDyt5ZV4yyprIpx9BAA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: gr-ORaebZ18c9eCcCEXPDC5yvR19TRU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090152
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 9/7/2026 3:51 AM, Mayuresh Chitale wrote:
> Commit 27f9566dcd98 dropped bit 13 (MIP_LCOFIP) from the LOCAL_INTERRUPTS
> macro and hence also from individual masks such as all_ints,
> sip_writable_mask etc.
> 
> As a result, with Sscofpmf enabled and LCOFIP delegated to S-mode, the
> overflow interrupt was raised in mip but was not visible in sip and it
> never got delivered to the PMU driver. For the same reason, sie.LCOFIE
> also became read-only 0.
> 
> Add back bit 13 in the affected masks, but gate it on Sscofpmf being
> implemented. In addition, for the virtual interrupt path, mvip/mvien
> LCOFI also requires Smcdeleg and Smaia to be implemented. Also make
> LCOFI delegable only if Sscofpmf is implemented.
> 
> Fixes: 27f9566dcd98 ("target/riscv: Update the local interrupt mask")
> Suggested-by: Gong Shuai <gsh517025@gmail.com>
> Suggested-by: TianCheng TANG <lyndra@linux.alibaba.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> v2:
> - Fix the sip.LCOFIP read-back mask in rmw_sip64() so that it matches
>    the write path.
> - Gate LCOFI on the Sscofpmf, Smcdeleg and Smaia extensions, depending
>    on the register being accessed and on whether it is the virtual
>    interrupt path.
> 
>   target/riscv/tcg/csr.c | 59 +++++++++++++++++++++++++++++++++++-------
>   1 file changed, 50 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 002f7e69c1..966a0897bb 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -1812,7 +1812,7 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>   #define LOCAL_INTERRUPTS   (~0xFFFFULL)
>   
>   static const uint64_t delegable_ints =
> -    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS | MIP_LCOFIP;
> +    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS;
>   static const uint64_t vs_delegable_ints =
>       (VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & ~MIP_LCOFIP;
>   static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
> @@ -1874,6 +1874,25 @@ static const uint64_t hvien_writable_mask = LOCAL_INTERRUPTS;
>   
>   static const uint64_t vsip_writable_mask = MIP_VSSIP | LOCAL_INTERRUPTS;
>   
> +static bool lcofi_present(CPURISCVState *env, bool virt_int)
> +{
> +    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
> +
> +    if (!cfg->ext_sscofpmf) {
> +        return false;
> +    }
> +
> +    /*
> +     * For the virtual interrupts path, we also need to check if smcdeleg and
> +     * smaia are both implemented.
> +     */
> +    if (virt_int && !(cfg->ext_smcdeleg && cfg->ext_smaia)) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>   /* Machine Information Registers */
>   static RISCVException read_zero(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
> @@ -2248,6 +2267,10 @@ static RISCVException rmw_mideleg64(CPURISCVState *env, int csrno,
>   {
>       uint64_t mask = wr_mask & delegable_ints;
>   
> +    if (lcofi_present(env, false)) {
> +        mask |= wr_mask & MIP_LCOFIP;
> +    }
> +
>       if (ret_val) {
>           *ret_val = env->mideleg;
>       }
> @@ -2299,6 +2322,10 @@ static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
>   {
>       uint64_t mask = wr_mask & all_ints;
>   
> +    if (lcofi_present(env, false)) {
> +        mask |= wr_mask & MIP_LCOFIP;
> +    }
> +
>       if (ret_val) {
>           *ret_val = env->mie;
>       }
> @@ -2349,6 +2376,10 @@ static RISCVException rmw_mvien64(CPURISCVState *env, int csrno,
>   {
>       uint64_t mask = wr_mask & mvien_writable_mask;
>   
> +    if (lcofi_present(env, true)) {
> +        mask |= wr_mask & MIP_LCOFIP;
> +    }
> +
>       if (ret_val) {
>           *ret_val = env->mvien;
>       }
> @@ -3784,6 +3815,10 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>       uint64_t old_mip, mask = wr_mask & delegable_ints;
>       uint32_t gin;
>   
> +    if (lcofi_present(env, false)) {
> +        mask |= wr_mask & MIP_LCOFIP;
> +    }
> +
>       /*
>        * When mvien[9]=1, mip.SEIP is read-only and reflects only
>        * the external interrupt signal from the interrupt controller.
> @@ -3897,9 +3932,11 @@ static RISCVException rmw_mvip64(CPURISCVState *env, int csrno,
>        *  alias_mask denotes the bits that come from mip nalias_mask denotes bits
>        *  that come from hvip.
>        */
> -    uint64_t alias_mask = ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> +    bool virt_int = (csrno == CSR_MVIP) || (csrno == CSR_MVIPH);
> +    uint64_t lcofi_mask = lcofi_present(env, virt_int) ? MIP_LCOFIP : 0;
> +    uint64_t alias_mask = ((S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS) &
>           (env->mideleg | ~env->mvien)) | MIP_STIP;
> -    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> +    uint64_t nalias_mask = (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS) &
>           (~env->mideleg & env->mvien);
>       uint64_t wr_mask_mvip;
>       uint64_t wr_mask_mip;
> @@ -3928,8 +3965,8 @@ static RISCVException rmw_mvip64(CPURISCVState *env, int csrno,
>           alias_mask &= ~MIP_STIP;
>       }
>   
> -    wr_mask_mip = wr_mask & alias_mask & mvip_writable_mask;
> -    wr_mask_mvip = wr_mask & nalias_mask & mvip_writable_mask;
> +    wr_mask_mip = wr_mask & alias_mask & (mvip_writable_mask | lcofi_mask);
> +    wr_mask_mvip = wr_mask & nalias_mask & (mvip_writable_mask | lcofi_mask);
>   
>       /*
>        * For bits set in alias_mask, mvip needs to be alias of mip, so forward
> @@ -4132,9 +4169,11 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
>                                   uint64_t *ret_val,
>                                   uint64_t new_val, uint64_t wr_mask)
>   {
> -    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
> +    uint64_t lcofi_mask = lcofi_present(env, false) ? MIP_LCOFIP : 0;
> +    uint64_t nalias_mask = (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS) &
>           (~env->mideleg & env->mvien);
> -    uint64_t alias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & env->mideleg;
> +    uint64_t alias_mask = (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS) &
> +        env->mideleg;
>       uint64_t sie_mask = wr_mask & nalias_mask;
>       RISCVException ret;
>   
> @@ -4379,7 +4418,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
>                                   uint64_t new_val, uint64_t wr_mask)
>   {
>       RISCVException ret;
> -    uint64_t mask = (env->mideleg | env->mvien) & sip_writable_mask;
> +    uint64_t lcofi_mask = lcofi_present(env, false) ? MIP_LCOFIP : 0;
> +    uint64_t mask = (env->mideleg | env->mvien) &
> +                    (sip_writable_mask | lcofi_mask);
>   
>       if (env->virt_enabled) {
>           if (env->hvictl & HVICTL_VTI) {
> @@ -4392,7 +4433,7 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
>   
>       if (ret_val) {
>           *ret_val &= (env->mideleg | env->mvien) &
> -            (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS);
> +            (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS);
>       }
>   
>       return ret;
> 
> base-commit: a925240509d1b4b656cc480f1cc79ba4d7c8bc08



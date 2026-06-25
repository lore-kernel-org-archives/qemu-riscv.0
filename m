Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29103CDE000
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 12:59:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcjfP-0007Qo-4i; Thu, 25 Jun 2026 08:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcjfJ-0007QN-Mz
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 08:58:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcjfH-0002eK-41
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 08:58:44 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65P9k1U2027092
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 12:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ikbKE+vlbbxpnCSIcd2Fa2ckqoLTv6S/5Hio0SFcqeo=; b=T//u/comf6dw3Gn1
 dzOwP+nSKrSq5onDFAiRFxZAdT+aY+Q7rR4ief8bCPlu2jpijUak3+eAeVn6m4t4
 lEb0TXS8YpAVYeID6ltosNhGuAHNLshmEbsPy8zyt0BhV/8AD5sgvfipnLpveyjR
 4Ov/7gwPq8KSnJKDH2GSK7oYnPGbbYTY+Q/dfkK/An2KuPUJcMkUQPWDEUwNq/1c
 yZDjOl7xnQ5vpo0UTxJXpWLP+Xkhd9j/fxKCxOYYsMznX4sqdeK4Om4yThJ+9bZv
 KQjdd/haeFEh/KfViVwsnAcM0IesDmuTY1shCqKgrumkJiaSpxjHwvHpMYEQion+
 mG8Czw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0tspte5m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 12:58:39 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-43cd2d12617so3661085fac.3
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 05:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782392319; x=1782997119; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ikbKE+vlbbxpnCSIcd2Fa2ckqoLTv6S/5Hio0SFcqeo=;
 b=EOYwDJyDgU0FytBnLEadAi0QT6jk+ZoQt25eSK0ZRUlT3arE6ekw1CsyfEVT4m5+eB
 zdGfJbcTsI2oEHv3B9/brujVaQtAvTaLKoJ+YP0vDTnq1kvj4EteNCHZHOxMICUzaAm7
 xPO5FVaBOx9/Uvjc0LNyMO/g7TxJnzS9Exk0vzcwikKXnZfIaG1GKRUbd0/xB/+fIWX0
 65ZM6vL3q81UCWF77v622WGXBWqt+uvQroIL/Ab1DWNeN5r76Zf2t+uHmR1Y6QxAhBRP
 Bgo6f0AoZFluYit8anYhiJibQkd8mVOQkEoAFhbNbwAZ35qErZZE9mf7oQsuAuBkTrQ9
 zAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782392319; x=1782997119;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ikbKE+vlbbxpnCSIcd2Fa2ckqoLTv6S/5Hio0SFcqeo=;
 b=oT+j/nlEvI68JUF4dd0vLC36Amt4/byDTzUYXyHvCJ5cYDYP5Pfh3Y3DMvizHWykur
 9EZvgAxoZxDJ+Z5FRmZVCXZ1Uln9wPhZlW4xE4K6XDdi96pe6rR5+a/8J0gYdCvDgR8U
 as8tIW9/AUFj51NTjflvMi6RINMSGLSbOrjp4YKQ+bfpB5kGGjovLlWxb/IA+7R0Ho6e
 LXsq6del5C45z7SvZ8hF6e0R4ribpO1CE1V/nnn7xeVCyfBU8he/6R3siJDL4sIu2DZF
 kKTWHC7aqf9EqSeTKu1v7R8JCs/FbYEz9QWXrM6IV7Y1KJWKr0eh58h86Ld7nc/62lWR
 Thzw==
X-Gm-Message-State: AOJu0YzaDtLVvkvvS2ZLQMhmoADxkUPgsSHD4+vTSNJBUzveyY12QgZJ
 iDk+RyaQ+yGTIilPOZ2Tgcq7iPfHurkFyWyPSqKvfQA6BXdXaxSNTYf0+LN6CBsGUoNgDukmlTO
 /zibIKoiVjlmHRfTxnMVg5xj/sQ4zgelUaWnj3pua0xU9FEYbYuT6RQrJuQ==
X-Gm-Gg: AfdE7cl6MkO3jVvpH5s83D6LBLRjIQGZLL3QATZy/x3tSJV+1SRpw3GUOX5DHEWqkyV
 VCqk0Ig/0a8gcjuNtyg7gF+spBX8cmFJvRomUk3JsFW6asHMdfmLxicFkPrSUblEttQtrmU+Kkb
 9SlN3W9Hkx2ITwPCkACItvM5vFcgJ2PUUiElP+r1NFGtqqvLNQAOhG58lmmS+2+7JUO1uhVS7R4
 VvnHs42JcJKJvrO8nRiVsMjOk8laAO87OLchMS4uqCZsUUNkrri1+umi2p7O1K8daU6fPXIl4L2
 GMcDf3t1MH68q5eaYqSwA2uvTH8MQbTdCvkoqP7d8P2buPq232Vt938Vgz/bBg6q8NFDaONkss/
 YU3drplRD17NMWo0Q8jTfBqblIf75KpiW3aU5gCezTR9836OtIkBR499Oa1nB4MUtFvqnKAycV9
 EKqWM=
X-Received: by 2002:a05:6870:d415:b0:423:9219:4c6 with SMTP id
 586e51a60fabf-448119ab40bmr2042212fac.13.1782392318956; 
 Thu, 25 Jun 2026 05:58:38 -0700 (PDT)
X-Received: by 2002:a05:6870:d415:b0:423:9219:4c6 with SMTP id
 586e51a60fabf-448119ab40bmr2042189fac.13.1782392318543; 
 Thu, 25 Jun 2026 05:58:38 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc2:6962:5520:30ca:9e66:df39?
 ([2804:7f0:bcc2:6962:5520:30ca:9e66:df39])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4472eccfa68sm11665147fac.5.2026.06.25.05.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 05:58:38 -0700 (PDT)
Message-ID: <644195e9-ad3e-4f68-af43-0fb98668ac59@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:58:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Apply UXL WARL handling to vsstatus
To: SeungJu Cheon <suunj1331@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <20260625081521.595683-1-suunj1331@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260625081521.595683-1-suunj1331@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OL8XGyaB c=1 sm=1 tr=0 ts=6a3d25ff cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=Eyf7DqpKdIDjvx2et8kA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMSBTYWx0ZWRfX94Fgrn+ro9Mz
 BJSgRGjuwr1TLapBGfWKgJiaSsasxNS0RwT9V4R5/iJb/vuUsfwSoFoUDUQEeRnudA8idpvrDZR
 RhqN88zLWUfr9UvWyGNR1YWgPzveHAkmzbez9dET9uFrItVjDm2tAzPYhWqH4DwbJRJN5fU+iv7
 7VIwdD1wNCJPy6+9G3mtQ2g6D2aTRGXvX/NinPu5PgbdaaXXo7ZT5NGsRp3mQPiFRBnvRgwpFo8
 Ac4+3K8Di6yj8KoIW7PQMgaDtIUG2cqhcmBYG1GIRkes5b8lcC1VIzDctfpzrbx8jXrOUnQIpge
 SUFcMr3B2prlzaX0izqpeglcBwBFlJY3LlU2cJx7+GWeCfeyHu6vFFYUGU4eZ3JbQkWDxA0W5st
 0J5UU/2wW++kgWY0ZjmlQRPIVZ2U/crvHlrjdsJJpdbFRda7dcrmPM2ZufBXyJW8qbNOeLdFfXi
 njiT7C9FgRvmJBLCZIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMSBTYWx0ZWRfX7auDQN87pybc
 uOiAAbyjYoU4B7CwbvtdmyZv5vBBC+GzfQ5tPJVqM6knAPszqBrjEl55jyeIBVF6YEdpnmyjaDR
 Bs66QdCO5vquWxGG7vy979ek/hX0Vdc=
X-Proofpoint-ORIG-GUID: bt57hXZJvWmRqJ_AQmJ2oc43FJ8276m-
X-Proofpoint-GUID: bt57hXZJvWmRqJ_AQmJ2oc43FJ8276m-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250111
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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



On 6/25/2026 5:15 AM, SeungJu Cheon wrote:
> write_mstatus() already handles the reserved UXL value by writing a
> legal value instead.
> 
> Apply the same handling when writing vsstatus so that reserved UXL
> values follow the same WARL behavior.
> 
> Factor the common logic into a local helper riscv_write_uxl() and use
> it for both mstatus and vsstatus.
> 
> Suggested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Fixes: f310df58bd2 ("target/riscv: Enable uxl field write")
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/csr.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index dd9726fcf4..12f1ce5180 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2012,6 +2012,20 @@ static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
>       return val;
>   }
>   
> +static uint64_t riscv_write_uxl(CPURISCVState *env, uint64_t val,
> +                                uint64_t field)
> +{
> +    RISCVMXL xl = riscv_cpu_mxl(env);
> +    uint64_t uxl = get_field(val, field);
> +
> +    if (uxl == MXL_RV128) {
> +        uxl = xl == MXL_RV128 ? MXL_RV64 : xl;
> +        val = set_field(val, field, uxl);
> +    }
> +
> +    return val;
> +}
> +
>   static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>                                       target_ulong val, uintptr_t ra)
>   {
> @@ -2058,17 +2072,8 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>   
>       if (xl != MXL_RV32 || env->debugger) {
>           if ((val & MSTATUS64_UXL) != 0) {
> -            uint64_t uxl = val & MSTATUS64_UXL >> 32;
>               mask |= MSTATUS64_UXL;
> -
> -            /*
> -             * uxl = 3 is reserved so write the current xl instead.
> -             * In case xl = MXL_RV128 (3) write MXL_RV64.
> -             */
> -            if (uxl == 3) {
> -                uxl = xl == MXL_RV128 ? MXL_RV64 : xl;
> -                val = deposit64(val, 32, 2, uxl);
> -            }
> +            val = riscv_write_uxl(env, val, MSTATUS64_UXL);
>           }
>       }
>   
> @@ -5226,6 +5231,8 @@ static RISCVException write_vsstatus(CPURISCVState *env, int csrno,
>       uint64_t mask = (target_ulong)-1;
>       if ((val & VSSTATUS64_UXL) == 0) {
>           mask &= ~VSSTATUS64_UXL;
> +    } else {
> +        val = riscv_write_uxl(env, val, VSSTATUS64_UXL);
>       }
>       if ((env->henvcfg & HENVCFG_DTE)) {
>           if ((val & SSTATUS_SDT) != 0) {



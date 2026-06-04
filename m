Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6F5CD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 09:55:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV4nT-0000Hj-P0; Thu, 04 Jun 2026 05:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4nS-0000HR-5n
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:55:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4nQ-0004uU-Cl
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:55:29 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6548UJZE313926
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 09:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oGvEKKVSZMS9ag6bcnCOx5vESoHgZ38/atzPHqdfYLY=; b=Oh3YJyj3PFEyzd5P
 qssDc0tAf68FSHHJjNvGWAZLRw4inu5iJ8cJjXQRc8NeX/+RKokBKe+15r9CR2cN
 3+V/FMgsvkfNnFDWOzzAtGQmQ7rjSltJbpF/VUtfYA7JD8wY0zplHEwIBMrQwa1C
 zCUshIfBAp8rc2NR7HldXBAp0ylpPjx4emoxXVmU1QJKNMRmsHIDxdRfmBZ3urYP
 6/T7EMuizAX7SpucEbSHczHv4/XcUQ9w+GcjTAomXMs3W8H7NY/71kGxR8wmRfHq
 /p6RNf/kd51Ovn2L3IekVx4XsyyAP+mwQ9An0Yq3i49rPxV2abRVpvsl9M29jaGd
 XuxGOw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v1s56-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 09:55:26 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-7ddd34a6336so6945747b3.2
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 02:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780566926; x=1781171726; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oGvEKKVSZMS9ag6bcnCOx5vESoHgZ38/atzPHqdfYLY=;
 b=T5320fhJf/Fp7VmUyDKcYGRERkvUzrFyuCbV1USfafe8GotNprBuEr79BO8/DKJmpK
 ABkN6yTal+hYbmr2aeRbmIoDSY0AIituPVzV1qpcXEiMEf6RQ5cdFnxAJruzPbOl+sKz
 0BsxM50TUTK4nhlK1fyL12rtErsKe+51Ioj8oD/ipsoBfpixA6JcR+LO2p3Kqqiij8Xt
 qjNup4VXPOj5OWNat+3krS+iVd8Hr8TvPFafL3wPaAM1QPi1cgNziQZAmYMlH9tgI8X/
 PWzVpfi71hmiC+Ak15zJBfMLIWfWXcMh++h6VcS6NHFoC2TKTBvcZM5AQmAQ/AXETunw
 T+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780566926; x=1781171726;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oGvEKKVSZMS9ag6bcnCOx5vESoHgZ38/atzPHqdfYLY=;
 b=SozQaOzrHKAH9kcnOuUpqvRuzXTbl7xZ2c4t6GrPa0ciTTNlKdQWuCgplCn0kAewZF
 kB54FsRO0AuOr0xA9ci/+ZnX5UCbsysADW2dvteMAheuBPVEUZQNFZzf9qZwC5pwHoH3
 Y0vZLG8x7Sw3bIwL3L6c5dflHvWeK4W4T3o6MqxFtxh2C829vE9wsEuEHg8CC3vb7Q87
 HOwwT0bdU2/jE4AUtEubNWHAvHPIPYG9fbz2scR+V75OM2y9WoxfkJ+EZkHvW5k/bONp
 aRPC2xWOwQgwL/RXHeaKdGNd4tbJsp3uGges7Ea9AyGuS41Cb5Y2CIb2fLTHMoWr0/Ge
 Czxg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8vJofQzXXoOYR7nUiHdPvOTM0qf1mwARpln/1VXrMEmGakMWNolUYHm10IBV3hNJuiPNbi24bPinvL@nongnu.org
X-Gm-Message-State: AOJu0Yw1wTmyb10hhzljf/kf26QjgxowYvrc9/+KhM4dL/qJkcIZrNXL
 fMsVVuxQAz+mEA5RWeJEfXOjlVE5atvrp8uXqvMmZGzbCTNCtZo4Uze0wg09TkPH3IazNK3paXR
 Zq5xeVsse829/qklGwb+ZyshSPlr3q602m2WxpVpwFzu2EimDNMgzSzisgw==
X-Gm-Gg: Acq92OGF7rcuS0u6mSR7yplJs0dW0SimW6WPyOacPWeFjqD3Ikzl22JZEarO8CBQKff
 XfSZlsScOFVNWT+CrPiC4xVxfKHVY8ZFGYoNik0zrfJW3lj0WrjuuGqJvshw3CkJJ+qwpeSEtcF
 txoUIRTvXhqFUMxltmkdMc7ZIqXgKmbTWqmiyAWoL7QFpNCmnE/abNLbRamOhos5c25HtPGJmhp
 pTD+FqoJOkk5Iq/IS4s5tB00wWmp3RL8WuTh++/OxFNZY6xOoh7eEaY/RwJyYe3cBsEh95QSV05
 Kw93pKz3X67taFpCcoIldtSNsrhB5NenKm1VBnlvKRY5jp3EYIBKDcr+VjOuAwYuor7YxS3OVB7
 hyyZF3f1DJobLBnlZyAo/AH4NV2FsgFPe0v6XCrW+JGFzERGFiAdnu3ZGx62HexBdGifu
X-Received: by 2002:a05:690c:6d10:b0:7bd:4cb2:4492 with SMTP id
 00721157ae682-7ea4d1791e6mr66363797b3.48.1780566926151; 
 Thu, 04 Jun 2026 02:55:26 -0700 (PDT)
X-Received: by 2002:a05:690c:6d10:b0:7bd:4cb2:4492 with SMTP id
 00721157ae682-7ea4d1791e6mr66363627b3.48.1780566925710; 
 Thu, 04 Jun 2026 02:55:25 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7ea20ea986bsm31427127b3.9.2026.06.04.02.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 02:55:25 -0700 (PDT)
Message-ID: <cd74cf9c-9d44-407e-aecf-0289448cf7c4@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 06:55:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/25] target/riscv/debug: Check only mcontrol
 triggers for break/watchpoint matching
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-2-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-2-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5NSBTYWx0ZWRfX8+iJnzuVygwP
 FeX80Ratrsd+Y0Tq+VDKC6ehXYqo/aABsCvR2J4hNasJdBF9KGQ1260Fo5A4Xis2VN02o2sBKla
 YQrWvisMAYXiSRpLFrKwdVtmLOcy9kSolsNDIAiewDmOn8EYBFCzFVY4+p5+5QEjf3CsMg3jfXh
 zAqm6az+iTi3BvvWpn6zwq7VpbvGoBs80C8X88a+de/+fzLlV7CXRX5xiVI7K8e3fW2bKaTVUt2
 MrvuK9iUW6DInQbaxf6M6zNQxHtVAK7ZBNl3eHJzti84dPJhg8XzEGsuaxtMfbpRQCd98pCHqhF
 d6IKX5GReD3YPUu+upKbC3lqrUka8dXWpc7HOrv3KoisK4EAJMBVNOhzEgFJdHyjpeIN1lfhyjm
 QzhWUBIzjq6ul7KpOc3mNmSkJgr4nZ44WiEFR7RGg4FJl3fBmPdT5OmAESQDH0b6CIcUGvtg2QL
 dK6ClJ8V898F9/MwdpQ==
X-Proofpoint-ORIG-GUID: xMeNR7l81iWwapi0qoiW4d-w2cdtfnLN
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a214b8e cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fmzM8DnDvQCh7DMs3M8A:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: xMeNR7l81iWwapi0qoiW4d-w2cdtfnLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040095
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



On 1/14/2026 1:46 AM, Nicholas Piggin wrote:
> trigger_common_match() has some warning log messages in it for
> unsupported triggers. Don't call it in BP/WP checking except for
> mcontrol/mcontrol6 triggers applicable to BP/WPs.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/debug.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 5664466749..4273ab7a8d 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -952,6 +952,14 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>           for (i = 0; i < RV_MAX_TRIGGERS; i++) {
>               trigger_type = get_trigger_type(env, i);
>   
> +            switch (trigger_type) {
> +            case TRIGGER_TYPE_AD_MATCH:
> +            case TRIGGER_TYPE_AD_MATCH6:
> +                break;
> +            default:
> +                continue; /* No other types match breakpoint */
> +            }
> +
>               if (!trigger_common_match(env, trigger_type, i)) {
>                   continue;
>               }
> @@ -976,8 +984,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>                   }
>                   break;
>               default:
> -                /* other trigger types are not supported or irrelevant */
> -                break;
> +                g_assert_not_reached();
>               }
>           }
>       }
> @@ -998,6 +1005,14 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>       for (i = 0; i < RV_MAX_TRIGGERS; i++) {
>           trigger_type = get_trigger_type(env, i);
>   
> +        switch (trigger_type) {
> +        case TRIGGER_TYPE_AD_MATCH:
> +        case TRIGGER_TYPE_AD_MATCH6:
> +            break;
> +        default:
> +            continue; /* No other types match watchpoint */
> +        }
> +
>           if (!trigger_common_match(env, trigger_type, i)) {
>               continue;
>           }
> @@ -1036,8 +1051,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>               }
>               break;
>           default:
> -            /* other trigger types are not supported */
> -            break;
> +            g_assert_not_reached();
>           }
>       }
>   



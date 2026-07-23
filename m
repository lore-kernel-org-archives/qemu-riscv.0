Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305ADC531F7
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 17:39:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wmxNl-0005rH-Vj; Thu, 23 Jul 2026 13:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wmxNd-0005mW-T0
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 13:38:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wmxNZ-000568-RV
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 13:38:45 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66NHXTSB405624
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 17:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ibk5HMSkBUrJkeQntdQVXOLFdNw2Xb3EfqWYU2N4qlA=; b=E0jTOhwIu8ufmp87
 7qOiSZ287YhnAaxcm6ny2YzKVuMuhBovVIegks4HmfSZzrLmtrPBlNYHwLWOCdxg
 g42Sx9X2DZiadW7Xxs6bcFy7evIAKF54xFaP8mPNQ8Lc/+q/AUjOth7bOMyGedP5
 sm/9fAdUMs1gyAH1A/If81is4e3/5ZJWUshw/oJwGDgg5TgV0Ce/eKv2oQTxVccZ
 KfruPsFm2T3YETe4OUBiKRz4T0cciEUOBSwcpN4GdId1DTgdnMtZtbOEAaJpGtz/
 zXBBvO8WMpHvz+uapo51ZUAoF6f9YVRxI2IbWAAV1msMBoEhs9lkX+QUwbzLJCQA
 jcLEIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0kttb5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 17:38:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c110a3b6aso13628641cf.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784828320; x=1785433120; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ibk5HMSkBUrJkeQntdQVXOLFdNw2Xb3EfqWYU2N4qlA=;
 b=j1gFqAXezMAlF1jwpXygwG1tWWkPkq5PayE9/Bb2Sllxlh4L7BPs2ZzKHT5zts1Feo
 5ME3yHcYjEdy6QfinR13UHb87IX3mMyjNDt42yoooeUO0pyOMQGujz8dKNKjT7GcIEIg
 +erAyhxc+rwcDMfI3dK3LFTK2ZcNYyDxBuIavpPQmZhe8WGF5OuaKe2HodD8pjGisI+0
 zPyjmNkrt3cCoccuo6QCPt4P9tR9+Rq2WvE9OQBm/AUszh9Z6GGZ3zXhNiDJyh2kjITA
 /uEf0e0jGtXDp2uv4mExi0C99B1Q3EYRL/m3rbB0jG8ZtlTfr8RGfNmsEbrdro2XritR
 MVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784828320; x=1785433120;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ibk5HMSkBUrJkeQntdQVXOLFdNw2Xb3EfqWYU2N4qlA=;
 b=UdurHb38jvvBDuvdpCpKMLON3bnjO+pRHqNEfh4fqIscqjHUHb9YhhjRym3z07YTIG
 oFPBaMX6k2nki+4w/o048baSglqQKIQ82HDYYx78IA0TXGt4dV6zzFZxdXOeryVgapED
 kEH/g13fy0Eemk/QEd6jdOOw9sQJX4lV7pJ9fT/4Xc51F+9Z/1KfBHTV2LYihhdQuGkh
 6Y0hfe0w4S4KZRF85S9+8q48Ntu5QW3Rd+7gqfH1IplhIWi37Q/0MgjOLoU1m9T6ReGP
 UwjgX9x1qjQnUB9CEwjncAgKyXeZZURKo8tme0b29nFmbhdLGn/LJ9yTi3zuGry8l+u8
 OmUA==
X-Gm-Message-State: AOJu0Yzu2/CoEuKkBbVHSiQEtJ0BBdKTGVmVZC4FNy5Gp2rm5SFuTTOd
 8s74gfkygWVj0HLAHw1G4rxQHFDYu0kObt0NcL24GJqQyuuDED8J/Rarf3DwLxLCjH/9S8cvanb
 BuvPl4ofTN1iNEabIbHUhO5wXly2WGtgRZDAjhVaCD3SMg+lwzBHJzZqYJg==
X-Gm-Gg: AR+sD13jqY0KUfe4rCYGY7Ss++gGqq3KdgyOLvxeq4yvo3mnFCbgSNE9iQLgtHe6MEt
 bx7hL/Sz9RPsqfkmFfg97tes/9AMRs9cP6LNehLAVqRwuC6nhIg5CJsQ8BXtHSMh4DNh4hfhZL6
 4jnWAX6Nwqs0oiPH5eBsGabJPGaILME0t+/a6FPYgIo3XtGf8OgJ94138ZRrqocT2WBviYxNava
 +Pem2EpWlv7Wkk/9ZVWRmWrGXhw/Os92Bzdp8YdFFmqkCDVxgpFpBXEfwgNLS3IUnl8lnYyF02G
 j6dWH0L8iduZC+SNMPsz6tk5YYLzy4G1mbmVxX88zMTzNJBKhnq9/ACrHmWdaOhqwucGerf9V5l
 hcmLv6W/NiRomcu/f+hEL2OZ7MFgxnus+6cn/5A==
X-Received: by 2002:a05:622a:142:b0:51c:1fd1:e755 with SMTP id
 d75a77b69052e-5283de98bffmr35530951cf.36.1784828319602; 
 Thu, 23 Jul 2026 10:38:39 -0700 (PDT)
X-Received: by 2002:a05:622a:142:b0:51c:1fd1:e755 with SMTP id
 d75a77b69052e-5283de98bffmr35530791cf.36.1784828319196; 
 Thu, 23 Jul 2026 10:38:39 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.122.204])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-907ba8d585bsm51019666d6.15.2026.07.23.10.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 10:38:38 -0700 (PDT)
Message-ID: <8e12d0b0-f7dc-411f-a750-f638c5158cee@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:38:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: use SXL instead of MXL for read_sstatus
To: Abhigyan Kumar <314abh@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260723142254.1683113-1-314abh@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723142254.1683113-1-314abh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _EfRhaIOcbwXmBRdVAMgamUklotss6e8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX0cKicuvDcJW2
 S6wqrHUqW6SFkGoy0pVuecOpMQKZg+eyaR4NTMj1Qu4ePWb0QIim6HPQqxrPLgdWD82p/RBqMJq
 gv93usP4yQXdI38eiFKdbdiGpL9DBuY=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a6251a0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=J0RmenBMOwS19r/fhzI3tQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LOtmT-1FezyT_fMOqjwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _EfRhaIOcbwXmBRdVAMgamUklotss6e8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX4CerwdHrbpl/
 eMcshLZ7t7h7SWv05sDVhXwAyc7iPYQBS75QJkJ73MrGWVxz/yOk6GZUfbYchbT0EKWZ+lOJoxd
 Wti1cIZN73UTcFZIm/JHk4vj/sHjf+Xq6eWYhjM9AXRLCwwse8GKxIIS+q2qKZcZfeaGotdP5bK
 yN0sdl1cIqYC2a0srVscNQ56YLIwGOm5c/GyGipsLkhcwWI5O67++Gdqm8L9LgsCWfT9NURsP0s
 lwF7E00gHeIYzo4vCJN0Lt7t2o6Jex1tyO5iTkkylh7zFstKo+7PWUB8oS3d3rFoeJL3fdG5k9W
 CijzT991Nmvh3vhLsmbLdYBedYShYUEqusNzgxm5x1O+5QN5loCgDvaKjWDUOwPzrDPiioMnG/o
 Esj7Rj4hp1rIKMDhNGlJZ6WHQ4Kb/wm623fFKT2gC1+OSqrF0T6wR+WTM6ebSM6c7tNnh4FIquk
 xsjBk4Kupo20S5kXWKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230170
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



On 7/23/2026 11:22 AM, Abhigyan Kumar wrote:
> According to the RISC-V spec, a 64-bit system can have M-mode in 64-bit
> with S-mode being 32-bit (SXL bits or mstatus[35:34] being 1). In this
> case, read_sstatus should use SXL.
> 
> QEMU doesn't allow changing the SXL bits in mstatus in M-mode. This was
> because of the missing MSTATUS64_SXL mask in write_mstatus. Now, both
> the SXL field in mstatus can be safely modified in M-mode and
> read_sstatus correctly uses SXL not MXL.
> 
> Fixes: b550f89457 ("target/riscv: Compute mstatus.sd on demand")
> Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/csr.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 36f2004bc..a90449b87 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -2067,6 +2067,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>       }
>   
>       if (xl != MXL_RV32 || env->debugger) {
> +        if ((val & MSTATUS64_SXL) != 0) {
> +            mask |= MSTATUS64_SXL;
> +            val = riscv_write_uxl(env, val, MSTATUS64_SXL);
> +        }
> +
>           if ((val & MSTATUS64_UXL) != 0) {
>               mask |= MSTATUS64_UXL;
>               val = riscv_write_uxl(env, val, MSTATUS64_UXL);
> @@ -4014,8 +4019,8 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
>       if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
>           mask |= SSTATUS_SDT;
>       }
> -    /* TODO: Use SXL not MXL. */
> -    *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
> +
> +    *val = add_status_sd(riscv_cpu_sxl(env), env->mstatus & mask);
>       return RISCV_EXCP_NONE;
>   }
>   



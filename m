Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7496606A687
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UN5o7e2C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0CeBxAR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVUEJ-0001nV-Cd; Mon, 23 Nov 2026 08:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVUED-0001kb-Hs
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:37:06 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVUEB-0001KZ-M8
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:37:05 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANDL1rP3072383
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6AoQpW+ymI45nH3l0UGKC6lF6pJ+YGQ/TXcjiLHKz3Y=; b=UN5o7e2CdfObcLaX
 JHqyhDorXY9TR69JGvgfIM1y2r9DMfR4cEbhu5GSXVS8t7VdVXVtX4FPCCdBkTlA
 bWFUf4Sfye6m3bBy3Zgx4s96o/a12cFmWPN70YhOoAPtgOG+Wi2vDGJjguL7l8Uy
 u51eAQGgdfthv1idnRWi3RKzCF0fOMAhN3KSFN5/BxF9ouFOZjTqOgS0IC0HMG5U
 Qk3U/OMa9tUjO4w/HMVdfG/HUVImt6hc6q1pP0Cf2FDq8HtI9c1JD6a/rHv3XP+f
 Bffya2ghN6iC3BkvfRWWfUOQOkc1yqKt6F+332N2SJS4dShyKAFQT4z05f9We/I0
 wje+Ag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7s78f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:37:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f2373e9b4so357169485a.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 05:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795441022; x=1796045822; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6AoQpW+ymI45nH3l0UGKC6lF6pJ+YGQ/TXcjiLHKz3Y=;
 b=j0CeBxARFJk/SrvybH8NeQ2rOVJ7F9lAXK+I4wxTg01jZ+LvAjblKormux78F2Od+N
 UVYDz8qhbrQgnlYLZandIAGWYtCtuM2uDDthoHfD6tzqcObR/rVLNluIUHTGse/Tn0N3
 hsF/ks+koTHY7IRPj5oHSoTvaoUll1WPkJD2SCrUpPT8v+0f6H4OHxCIJxOQCT0hbrTY
 dxp2TKay5RFH8dG7BEmJr1c5KqXfVQEHj4r6AdpkyYJ3qrFIvbvYqOsC08lSEvQmzvYn
 0kUBdF27uDwGZRsvNkI76g9jDDhOE948YUsg9++A+QEESBYWz12Z3kUK6tu8BEzIzGQO
 BsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795441022; x=1796045822;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6AoQpW+ymI45nH3l0UGKC6lF6pJ+YGQ/TXcjiLHKz3Y=;
 b=r2uvKCiBxi8Zi6XM5JsB+KHA47JnPO9t5nN/hbrd1GJpD2Q58+X+SLL+yxZtbDqp0u
 bSThrfQ4IZ8LQ1oEyGyvKlVhfqH6Bg0EvBuECwAefccuSoBjNPoVlFNkJ+kCaX6GU+m9
 L0TS8e5i0b+pmtAY3xDKfifog3pH7KPj0TM0QDCkxYvM1mAECxsyJUvCMrMXAsgL7Qhy
 WdbpDw3BlWsRX5ele5PBo6Kk3gbO16mSFHu6UTMOlPh0DznORI9FAKWDs0oYKTjPNxJ2
 4v3CkxNeEa1kaD6dXs4bUuWSp2+suEK2c/KqJ67Hzh0XBVrEXvpQOmib5828XEff2yHm
 67Iw==
X-Forwarded-Encrypted: i=1;
 AL+hErFSJCYmfjNldOP5U72vkxodqrfBq66/MLUWAunN/TEC5msZ7pvJ6Odxb8ENxW7s41iVFYVthZZp7Kam@nongnu.org
X-Gm-Message-State: APuU4Z9no0Cij8bt6vNCBdLRjTVYMeWkwPsxyh5NRvNluThBEfKOWxeG
 Dqz4+a1usoHIC4OhLTYHoJTdW36SSlPpcvsoUuCC4taDezqF66aMmJxLrjUgJ10N3JajlpZcFq5
 ks3M+VIiXSNorD3W4ZzUChBLRdkfCNdsF/J/ca5Z9W2pXR/qIyAMf+OLPZQ==
X-Gm-Gg: AZFdTZchqs+KW40GnqiaL6Z9174kGVVso/GKTNlV3+dgNjUddu1ALuLJ7xeMuXjU2C2
 QRzIhrmS3ocfGehqEWM5nuemHhqawWkf5rIS8eH3T/YIzDuS6DuwuHUUdEoIK3N4uv9luT0zJQS
 iS8lv/LFNT1M5YuHubkOCywNSkPQpvFFpOi/Vm051CVxvwlplUtSqKtf5RZuAaW2FHkPj9352TN
 p6JJf2/PBciloJN4xt7+B/GGV42/jJHKIRKiSfQDK6l/Ib7JpUGbXtt/FdJX2neLRUzGpYbdRA2
 H1MsXyskUfmp6sxkZkzk9DKLJmkMniEIhwyuViqp4V5yejKpmPsdfKEgwdYY1tSIUmZLyvJtywR
 p2YkaVOphFVY47fz82KVO8zCPtyKA7hG7othVFea+W3hUWn21bomwI3eapFqT+ztvSa4IsG7G19
 6wcFFd6kGZ
X-Received: by 2002:a05:620a:2610:b0:947:920d:3408 with SMTP id
 af79cd13be357-949bab188famr2031573785a.46.1795441021592; 
 Mon, 23 Nov 2026 05:37:01 -0800 (PST)
X-Received: by 2002:a05:620a:2610:b0:947:920d:3408 with SMTP id
 af79cd13be357-949bab188famr2031566385a.46.1795441020994; 
 Mon, 23 Nov 2026 05:37:00 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949ca846322sm615464785a.34.2026.11.23.05.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 05:37:00 -0800 (PST)
Message-ID: <f2ff2235-807e-4292-a559-1f892c810805@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:36:57 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: fix WPRI handling in mhpmevent CSRs
To: Dmitry Kokorev <domestos48@mail.ru>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, chao.liu@processmission.com, liwei1518@gmail.com,
 palmer@dabbelt.com, qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com
References: <20261111200924.49157-1-domestos48@mail.ru>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111200924.49157-1-domestos48@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04417e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=p0WdMEafAAAA:8 a=JF9118EUAAAA:8 a=RgBw9RmQAAAA:8 a=EUspDBNiAAAA:8
 a=LDk848BDNixZ8QLvqFcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NCBTYWx0ZWRfXwBhq2Dk7Venq
 debsqljhCTpAZO4iekuD4k72VHP13FfzHM4TKL+wi79J5dj4YwNnikWcy58xkCF+tRKWgmos3Lk
 c0obAKdWqe6hNnr4frhn116KfX9TYIcVFGzQAIpeVxEvWSfrZsHsbHSqwY4GFjNUqDzN/BJTBxK
 gdHzlMxyhdgkiW0wAdj/xWuc4zW6Cw6Ox+MK3uADA8NaCc71I79xhJDHbBqkpY5q9G7wl72D2ka
 QogW234/3bIv2L8FtNuOScH26Smw0tzqSOJV/AzGZbYk6WOMfPyB0Eo4z0hge4jUBNIaCcUF5qh
 dlSlBJLJiE7Fyq2fEAv1k2q0qbnpkHKzLGgowBkNlSMfoFBZTyxcGLnRVwmllcZOn9uQXPVuJze
 HTzxAt/Hd/XJuVE6pF2fPwFqfWtNVhQak9PHXzWAZeA185hiJzSaqdmTtjzE5Z7sqXbHzpD7REn
 JC7utLCkOKNPNZklLlw==
X-Proofpoint-GUID: _3BI90sHichlndWUPr00BBJQ_qaDGZAo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NCBTYWx0ZWRfX/Ign4bacEBuN
 KGq2r+mqpfQi7q4vuowv09jPjpjRavvHulcTvJSOZFeYBf/nMHjQaB171YaPSBMn0ZvSIH2pwOb
 zi4L0VKrOVcV3o0DbGAZI4B/nl2YZDI=
X-Proofpoint-ORIG-GUID: _3BI90sHichlndWUPr00BBJQ_qaDGZAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230054
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/2026 5:09 PM, Dmitry Kokorev wrote:
> Writes to the mhpmevent CSRs can currently modify the
> reserved WPRI bits 57:56. Fix this by ignoring writes to
> these bits when writing to the mhpmevent CSRs through both
> direct and indirect CSR access paths.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4722
> Suggested-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Dmitry Kokorev <domestos48@mail.ru>
> 
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> v2:
> - Drop explicit preservation of mhpmevent WPRI bits.
> 
>   target/riscv/cpu_bits.h | 2 ++
>   target/riscv/tcg/csr.c  | 9 ++++++---
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 3579789a1f..3df9ea4ec3 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -1161,6 +1161,8 @@ typedef enum CTRType {
>   #define MHPMEVENTH_BIT_VSINH               BIT(27)
>   #define MHPMEVENT_BIT_VUINH                BIT_ULL(58)
>   #define MHPMEVENTH_BIT_VUINH               BIT(26)
> +#define MHPMEVENT_WPRI                     (BIT_ULL(57) | BIT_ULL(56))
> +#define MHPMEVENTH_WPRI                    (BIT(25) | BIT(24))
>   
>   #define MHPMEVENT_FILTER_MASK              (MHPMEVENT_BIT_MINH  | \
>                                               MHPMEVENT_BIT_SINH  | \
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index af444e3e6f..94a57a4553 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -1230,13 +1230,15 @@ static RISCVException write_mhpmevent(CPURISCVState *env, int csrno,
>       if (riscv_cpu_mxl(env) == MXL_RV32) {
>           mhpmevt_val = deposit64(env->mhpmevent_val[evt_index], 0, 32, val);
>       } else {
> -        inh_avail_mask = ~MHPMEVENT_FILTER_MASK | MHPMEVENT_BIT_MINH;
> +        inh_avail_mask = (~MHPMEVENT_FILTER_MASK | MHPMEVENT_BIT_MINH) &
> +                         ~MHPMEVENT_WPRI;
>           inh_avail_mask |= riscv_has_ext(env, RVU) ? MHPMEVENT_BIT_UINH : 0;
>           inh_avail_mask |= riscv_has_ext(env, RVS) ? MHPMEVENT_BIT_SINH : 0;
>           inh_avail_mask |= (riscv_has_ext(env, RVH) &&
>                              riscv_has_ext(env, RVU)) ? MHPMEVENT_BIT_VUINH : 0;
>           inh_avail_mask |= (riscv_has_ext(env, RVH) &&
>                              riscv_has_ext(env, RVS)) ? MHPMEVENT_BIT_VSINH : 0;
> +
>           mhpmevt_val = val & inh_avail_mask;
>       }
>   
> @@ -1263,6 +1265,7 @@ static RISCVException write_mhpmeventh(CPURISCVState *env, int csrno,
>       target_ulong inh_avail_mask = (target_ulong)(~MHPMEVENTH_FILTER_MASK |
>                                                     MHPMEVENTH_BIT_MINH);
>   
> +    inh_avail_mask &= ~MHPMEVENTH_WPRI;
>       inh_avail_mask |= riscv_has_ext(env, RVU) ? MHPMEVENTH_BIT_UINH : 0;
>       inh_avail_mask |= riscv_has_ext(env, RVS) ? MHPMEVENTH_BIT_SINH : 0;
>       inh_avail_mask |= (riscv_has_ext(env, RVH) &&
> @@ -1531,7 +1534,7 @@ static int rmw_cd_mhpmevent(CPURISCVState *env, int evt_index,
>               *val &= ~MHPMEVENT_BIT_MINH;
>           }
>       } else if (wr_mask) {
> -        wr_mask &= ~MHPMEVENT_BIT_MINH;
> +        wr_mask &= ~(MHPMEVENT_BIT_MINH | MHPMEVENT_WPRI);
>           /* wr_mask is 64-bit so upper 32 bits of mhpmevt_val are retained */
>           mhpmevt_val = (new_val & wr_mask) | (mhpmevt_val & ~wr_mask);
>           env->mhpmevent_val[evt_index] = mhpmevt_val;
> @@ -1560,7 +1563,7 @@ static int rmw_cd_mhpmeventh(CPURISCVState *env, int evt_index,
>               *val &= ~MHPMEVENTH_BIT_MINH;
>           }
>       } else if (wr_mask) {
> -        wr_mask &= ~MHPMEVENTH_BIT_MINH;
> +        wr_mask &= ~(MHPMEVENTH_BIT_MINH | MHPMEVENTH_WPRI);
>           mhpmevth_val = (new_val & wr_mask) | (mhpmevth_val & ~wr_mask);
>           mhpmevt_val = deposit64(mhpmevt_val, 32, 32, mhpmevth_val);
>           env->mhpmevent_val[evt_index] = mhpmevt_val;



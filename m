Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148DEC531CC
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 09:05:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnumc-0000k7-C8; Sun, 26 Jul 2026 05:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wnuma-0000jm-Hb
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 05:04:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wnumW-0003yM-6t
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 05:04:28 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66Q8GoUU1269255
 for <qemu-riscv@nongnu.org>; Sun, 26 Jul 2026 09:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7NvVxfP/bRFLs3O0RTeMPjC7MehX8Ssm82xo4wsPEzU=; b=mz3z0OmjXMD71QQB
 tY5L3LXASHNIN9Bfw1lbgPOboIRhNTVSBIoTmJBk4/T6ppP/lB3Da8zN3I2rjSBb
 rCC5oU3gRLMZWWIkWPHfRVRhVd6zQPRpY1jKaAqn01+tmv4uSQBYujo5KE+bgc+H
 ZFhyiYlQOnyGJXBQ0+re7Plkh8iEpWCosSEIkvN2DDFswgtuuaRrKLM3hxa6PwCk
 n8CxX6P9eULXrbAPZ3R3oAw0nZIvAGT7kJmE/6OnZX7bzuSs1BsqrcMAXEYOLZ4h
 DNoAhRLsxunWA2bp+sShRxsIEFILFPnqtLbsrNSOGuG2ZpX0rxWG2Z5qALI8of7W
 FKp58g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjuftuf5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 26 Jul 2026 09:04:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5c2e847a4c5so2141733e0c.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Jul 2026 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785056659; x=1785661459; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7NvVxfP/bRFLs3O0RTeMPjC7MehX8Ssm82xo4wsPEzU=;
 b=jpPVwj4oTzq4C4VKcgFpSC6Db+ox/pfmF6Gsg5VqeNOGd3F28DJGGJDuapeYQW4Ha6
 Mrtd2HvCxf1VZqpjlgFsy7v8amA9WT5TlGsJQ8ysavT2w5ELR+MwWZ2KHch/+Pr4kCy5
 Ky/MODiB1PX5jHdl/dBAohEcomfACnGo8MwhjIZbiCcTzbrF6tczsFNQPH+sgH7Vtt6J
 hBlS4vgfAPIhbcPYO31WtkYmo3AiWPp6/JmBY5sbuP+iYW1giQEjPFPwVlQ90xLgwHjx
 bAZ48X1bq8nMnHfjHv/7fCIzE6ZLxdOSw5EA3Si5Vl52x21AqnGKe2jkn9pcgYr5/F03
 u0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785056659; x=1785661459;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7NvVxfP/bRFLs3O0RTeMPjC7MehX8Ssm82xo4wsPEzU=;
 b=glF5VJzyo4MIv7fnuJuPLW0QPYUIaLvXKavrjVP2pUd6FF+H/OnmRuyruq8vb/wSry
 JSsHuq8DSxwEYo5sFH0tevnPzs7ils6TGoygkL/qUTmPRsh8u5FaPvK+A1NAit8CN9/r
 rX6pzK4xK+fAmB9JtZcQUjYPjcJUrn7ZaYSEj+sPOAD43bPU38rU7cCqZX+vrwkFpl18
 KuSyixPBZGgU23Qr9Hwb5FaBj+lV4yuJ6RveUhqN+vUIQ9R+3vQDwnXLEXM9zUwDA1qN
 qil2/vhuNksMQxpU3nQCDA/mMBZuJXjqOEOBA0cdhik34Qo4ChwshBHQ9duKpRA1PPam
 qbhA==
X-Gm-Message-State: AOJu0YwlkxYnOCbb8z9rZ+2uEk6/jiFCO5I8ZChghM4oaJUS3YveyG23
 T+QOGt845OUcO0oejZhz2HZVNaQm2HzLq73lPfxOQ34om9rNr5fLMqflYbwpLzDN0GwuEe2q5nj
 60EFKpcELADiW16/jPBT9N1nJp/s+5ajqUVaiWDV9j6nNXaIoWGL9jxJM9g==
X-Gm-Gg: AR+sD11C8OuVII24q6Qif5rUDJ/hQI+fWxjHHEG4ejWw1nfwUYcjSbeicPyaXiBVM/L
 /iahlrxPys1mHMiDEMj3c5BfsK27dgbtvBva4/FVivyK/Nlt2lhXGYzEws65d9/S504PJPDkKaa
 Wl+rDT/JHGDSp5ztQFRfGnj/nZWWaKQOGePGIvNGgYohlmXavwFZ5o8KuWpzAOik2ZEZ735ZTcj
 uDHWFYHWAC4YPieqCOcBMvNJVTXXcNbzj4XsjqVtk3aruUR6KQ92mzWFqrZp7Phd2PuyPJqL0W4
 jv7sJrkBwmhTaOgoI3BGy3qh+RIkm/lUJCxqCgpI0juVU0s3A0jhvS9XzQGHHouhNUY2UlajSoa
 M9gYSmrhaL0zRjFzzSnVDb3mSrvTYX5u7SHHSnA==
X-Received: by 2002:a05:6122:168c:b0:5bd:a5e1:c7c7 with SMTP id
 71dfb90a1353d-5c306bb8fe7mr2186539e0c.1.1785056659616; 
 Sun, 26 Jul 2026 02:04:19 -0700 (PDT)
X-Received: by 2002:a05:6122:168c:b0:5bd:a5e1:c7c7 with SMTP id
 71dfb90a1353d-5c306bb8fe7mr2186534e0c.1.1785056659178; 
 Sun, 26 Jul 2026 02:04:19 -0700 (PDT)
Received: from [192.168.68.104] ([191.202.238.134])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c3056c917esm3903887e0c.11.2026.07.26.02.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jul 2026 02:04:18 -0700 (PDT)
Message-ID: <c14dadb1-6f4c-425f-88b7-a6349a7d5814@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 06:04:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: allow menvcfg/henvcfg LPE and SSE bits
 on RV32
To: A-Shehab <ahshehab24@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, debug@rivosinc.com
References: <20260726080537.13913-1-ahshehab24@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726080537.13913-1-ahshehab24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8hIwYsUBk4BGAOFqftya1BtURbZCYn6x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA4OSBTYWx0ZWRfX+isvc2Rn+6uD
 UJPPTt6k0I0nIVFcANttVYrLVNu31SXW2uLVwhLz9GdwYSHXrRycHo74VaoTGk/4NysZ4XRf2Wf
 2PfCyPs4gZ26B04/Z2PneGh+yxz1qes=
X-Proofpoint-GUID: 8hIwYsUBk4BGAOFqftya1BtURbZCYn6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA4OSBTYWx0ZWRfX+fQG4ikKEj15
 +VjVWbn1gTUJFjBD7ZSCtBKyQ7PEcTU1LTTmo1ZbzNcbRf27O3VwnmwZJihP9HrSPH6QImzUy5+
 cxMauaHJ0MJ+UuAuEJmpR9pWgwSiY5aiRQOTcyl6E8Nk3w7CfgI+K+UuhuXa2EEmDYB3Os0O2oP
 ceh0cvWb13hl4DMw/yK3/NzIFzROoSJYwVyz2KHTRfPJ4of+ktwSXTBGKjQFCXduSy2OnHWpsYp
 B58w1MfqMPkJUmYKVGiH9+EObLhBDHUnJe20n08mXOiedNsC4NUp2iQO+YshpW/WyPUUQuxTVlr
 ee2r+kh9lVrKLcuZ4LofozyY297ZP3G5fJ2Z3AA1f9MZYST/w6S0JFMwVUXH4nxjwfnaHWxxC0d
 UI15mEN7v0ZR/CUcGFvAJl2iTXY8bH5GgeOuRlyngFdyvXDQf+1lip7DGlkRiFSzxzu2zKjzm17
 2ovl1c/9WvF9y7beNYg==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a65cd94 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=krItrnN2KmZux9Htc+7Wjw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=iEunc7SmayLcI2BJZTUA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260089
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



On 7/26/2026 5:05 AM, A-Shehab wrote:
> The Zicfilp landing-pad enable (LPE, bit 2) and Zicfiss shadow-stack
> enable (SSE, bit 3) controls live in the low 32 bits of menvcfg and
> henvcfg, and the CFI specification defines them for both RV32 and RV64.
> 
> QEMU only adds MENVCFG_LPE/MENVCFG_SSE (and the henvcfg equivalents) to
> the writable mask inside the "riscv_cpu_mxl(env) == MXL_RV64" block, so
> on RV32 these bits are silently dropped and the features cannot be
> enabled. This is inconsistent with write_senvcfg(), which already
> handles SENVCFG_LPE/SENVCFG_SSE regardless of MXLEN.
> 
> Hoist the LPE/SSE mask handling out of the RV64-only block in
> write_menvcfg() and write_henvcfg() so the bits become writable on RV32
> as well. The upper-half writers (write_menvcfgh/write_henvcfgh) are
> unaffected because these bits reside in the low 32 bits.
> 
> Reproducible on qemu-system-riscv32 -cpu rv32,zicfilp=true,zicfiss=true:
> an M-mode write of menvcfg.{LPE,SSE} reads back as zero, while the same
> program on rv64 keeps the bits set.
> 
> Fixes: 4923f672e3d7 ("target/riscv: Introduce elp state and enabling controls for zicfilp")
> Fixes: 8205bc127a83 ("target/riscv: introduce ssp and enabling controls for zicfiss")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4045
> Signed-off-by: A-Shehab <ahshehab24@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> v2: Rebase on current master; the file moved from target/riscv/csr.c to
>      target/riscv/tcg/csr.c (noted by Daniel Henrique Barboza). No
>      functional change.
> 
> v1: https://lore.kernel.org/qemu-devel/20260719111749.23777-1-ahshehab24@gmail.com/
> 
>   target/riscv/tcg/csr.c | 45 +++++++++++++++++++++++++-----------------
>   1 file changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 36f2004bc5..0182e4c408 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -3216,6 +3216,19 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>                       MENVCFG_CBZE;
>       bool stce_changed = false;
>   
> +    /*
> +     * menvcfg.LPE (Zicfilp) and menvcfg.SSE (Zicfiss) reside in the low
> +     * 32 bits and are defined for both RV32 and RV64, so they must be
> +     * writable regardless of MXLEN.
> +     */
> +    if (cfg->ext_zicfilp) {
> +        mask |= MENVCFG_LPE;
> +    }
> +
> +    if (cfg->ext_zicfiss) {
> +        mask |= MENVCFG_SSE;
> +    }
> +
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
>                   (cfg->ext_sstc ? MENVCFG_STCE : 0) |
> @@ -3223,14 +3236,6 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>                   (cfg->ext_svadu ? MENVCFG_ADUE : 0) |
>                   (cfg->ext_ssdbltrp ? MENVCFG_DTE : 0);
>   
> -        if (env_archcpu(env)->cfg.ext_zicfilp) {
> -            mask |= MENVCFG_LPE;
> -        }
> -
> -        if (env_archcpu(env)->cfg.ext_zicfiss) {
> -            mask |= MENVCFG_SSE;
> -        }
> -
>           /* Update PMM field only if the value is valid according to Zjpm v1.0 */
>           if (env_archcpu(env)->cfg.ext_smnpm &&
>               get_field(val, MENVCFG_PMM) != PMM_FIELD_RESERVED) {
> @@ -3378,20 +3383,24 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>           return ret;
>       }
>   
> +    /*
> +     * henvcfg.LPE (Zicfilp) and henvcfg.SSE (Zicfiss) reside in the low
> +     * 32 bits and are defined for both RV32 and RV64, so they must be
> +     * writable regardless of MXLEN.
> +     */
> +    if (cfg->ext_zicfilp) {
> +        mask |= HENVCFG_LPE;
> +    }
> +
> +    /* H can light up SSE for VS only if HS had it from menvcfg */
> +    if (cfg->ext_zicfiss && get_field(env->menvcfg, MENVCFG_SSE)) {
> +        mask |= HENVCFG_SSE;
> +    }
> +
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_ADUE |
>                                   HENVCFG_DTE);
>   
> -        if (env_archcpu(env)->cfg.ext_zicfilp) {
> -            mask |= HENVCFG_LPE;
> -        }
> -
> -        /* H can light up SSE for VS only if HS had it from menvcfg */
> -        if (env_archcpu(env)->cfg.ext_zicfiss &&
> -            get_field(env->menvcfg, MENVCFG_SSE)) {
> -            mask |= HENVCFG_SSE;
> -        }
> -
>           /* Update PMM field only if the value is valid according to Zjpm v1.0 */
>           if (env_archcpu(env)->cfg.ext_ssnpm &&
>               get_field(val, HENVCFG_PMM) != PMM_FIELD_RESERVED) {



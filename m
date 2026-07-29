Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5096FC54F51
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 20:15:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wpAgX-0001fh-La; Wed, 29 Jul 2026 16:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wpAfx-0001ad-Cb
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 16:14:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wpAfu-0005Os-Gr
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 16:14:49 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66TK8CWZ3099678
 for <qemu-riscv@nongnu.org>; Wed, 29 Jul 2026 20:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zAxDFwsg1NLs5qtOz6xvAhk5ZcRMVjG7vF7M9dhlU9Y=; b=iXrle4QL+XTFaHYa
 NaWRY72KmgnBp41tjXP/fxyp0Hwp6Sky2BX1S5cRrvEmJJFg1BUUX+6RHoUqSynJ
 X4cSMSCGIScGauXpI6LdJRz2+R7Zlmwxwhsn7Yh5Litmz87RdADRXQAFDpfrxtrG
 AMEwLxo3RPE0wXBnz2ctHFW0Sv6Bet9dmcanWAupEersS7YMT1GwYzo5rrsW+7pS
 LXlCrGFAeUfZjB728lbB4okltQjFTO74YLEftl08SrxOCRn8xUFO6f+6SoYRYT/C
 xHKGv4cXA1DZqu3gr/lUwWWxRJxZjZ5MNvgGcSeCaWn6s2TlPs6zt99ZjVnmUGEi
 LeYMVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqr9hr0v5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 29 Jul 2026 20:14:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e5fc4c7e9so161089885a.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Jul 2026 13:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785356074; x=1785960874; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zAxDFwsg1NLs5qtOz6xvAhk5ZcRMVjG7vF7M9dhlU9Y=;
 b=XoLFIIV8OAooJA/60AhXfhVvR9DNCPx+1NVN2u5+WTfCj8H8opEP3yPYNf/XD2szqH
 NCDTuBMkN0nxqUMOjFKabJaMIOgVTTd0daptZWexQL3iSiBl3q8dhd6COFqO4KxTybaJ
 RCLdAHCFwjihK6iR53OcvwphccwwNMwGaWhrtwoK96sYB7O7BRvWrGbU+7OkEzai9QdD
 bT7sdkFph1PlN6HRHXgC415pYHIoThqC5bGKeVmiAsnhnWeEw6J2dT+s7crYdrDuazyG
 zErbNmhIEpgwpKEe44Za77328M8UdfdNaJrYKLrRcRhO+mF9iWg0Xe6Y4zsDNUw2knU7
 AwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785356074; x=1785960874;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zAxDFwsg1NLs5qtOz6xvAhk5ZcRMVjG7vF7M9dhlU9Y=;
 b=pB5EoV9V3PQDcCZ+MplHtQP7XtT/zdfv3p3ejklfFgZ4mGC3XYRkgdmsgm5DkYvyB/
 1rAXRVY/43X7lkhqcYRoDU45rHTkclawkW4NY48JDFZtwo1mj6PIEeSLb+bmh4VI0WhM
 OfM1XwSpTCqiBqx/vSXsUl7JjBAXWA3M6XrvEabL9h1kzB2dnSy1y3XOJtZNr3vz4t24
 mul00DOf6NKtluchSBLGOjeopKznER3nqTGxsUT8mROVh+zO7QmbGhfqU8v6284cKOIW
 aBrncjtoJ35rWL1r5LmkLFcCfEGl+ZZWTkFTBzZNZIomWnYG9uHnAWLewUTIc0QHs1j8
 InWQ==
X-Gm-Message-State: AOJu0YyYmMxUQ0YkNNYgz8O2f8KCINZnkjDKov2QiW3veIV+l23jmhyc
 M/DLvsAnpcHFVaKHpgxGLxTS/bHamwW6dlPemld1nFdIKVUIwzPuZF1/vukYQ8dCe5nH2R6+u3V
 oDX+n8tQHu0Mg1+qFfwl4f87gUIRCOXfgNoA+S1M6G8+PHRknMk68EegXvNjsf1SaIw==
X-Gm-Gg: AR+sD10moQtg/vfwDPFFGjDlQ8jE3K7ph8xYmxVMPXNfg7gxC2S5BRKn7t6ysMoC+yk
 WqNK23gzmoxxxCtpBvhjbjYfzK4enxHmajmCBG6N6eEoo39mGIR1XnVDYlHHRzzKlNp10NX1+zk
 /A4PbDITU39UMnLz73A4EV06o09pVQKwHdDx0km1eKAoaLDt2taN3/7bRQq5CzaC7iao7tUpNzO
 aXQR7sQdyDeJUBbGH4F7s1hU0YA+ezk//bv0SfyDNc7lfdH8/kYQR46wJCcgl6nvODfqaaci+Kh
 fzsubd8a41WI+KwGOsT6bj2muFt2+JVmj3EfzOdlZHgGe4rx2mDUeJjadn0R9/2iGeWcQP3MVmo
 zah5BQNPVwuX9CcdkZA+iQR3fG8lNq8IP5xTMAA==
X-Received: by 2002:a05:620a:1a07:b0:92e:675e:8ef0 with SMTP id
 af79cd13be357-93483f05b66mr39313985a.68.1785356074142; 
 Wed, 29 Jul 2026 13:14:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:92e:675e:8ef0 with SMTP id
 af79cd13be357-93483f05b66mr39307185a.68.1785356073355; 
 Wed, 29 Jul 2026 13:14:33 -0700 (PDT)
Received: from [192.168.68.104] ([191.202.238.134])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-933d3264577sm245369985a.17.2026.07.29.13.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 13:14:32 -0700 (PDT)
Message-ID: <989b0d86-312c-4c81-94b3-5528a34af5b7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 17:14:29 -0300
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
X-Proofpoint-ORIG-GUID: CeJm-gdotVurkbafP242kmrimzy9G-2i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1NSBTYWx0ZWRfXz9CEJb2xs4H6
 ZhE9C1kdoeqSVdzeehg/y5Jjr8QFVWjXZmMqMeguFMPJBMgw+/zjkVu/xBHKRwTVnVg+Uxq2NVP
 XfojPu3OeJBmDKysanC6tV5I5TGXJr4=
X-Authority-Analysis: v=2.4 cv=GoByPE1C c=1 sm=1 tr=0 ts=6a6a5f2a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=krItrnN2KmZux9Htc+7Wjw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=iEunc7SmayLcI2BJZTUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1NSBTYWx0ZWRfX6HSo1wuqzSdX
 C5T4yjc/qtooxc2UehBH4zX4bPIjchqL4iSGw9LJPaAyqnHHTu6VEzqa6HSqUjD8uf5RGvyOxtc
 jB5S3DfkcDzfR1w+qhmgmM00DzyRCLUTsS0Lhu63kkjR2lPcfmm014ISuDR13B0zpPlXgbi4tnA
 9eLoyWFPTidQ//Lc7wxOX1IW0pNiNZrw8lGgPy/cojVeQ089QcivIpCIVdv0iI6CP+vI8aumUYB
 aesROBThh3kRXE+rQzDoxxgYOEcfzxHFWUIIwjdG4kd/8PyIGVfVBCDYAixyMjGzCEw0vqdtf56
 nxeVLLMuOfFTesLGk9i1M9r1bG4vipP+IrTDTFM900TcZy/mWoqys166TyF5S/zBgqwh0JGaRT3
 /boIlpeIvcPUpzdDm9d9lp2lgBgMfXEVnrhuwxRIYiOSczEvYOX4yaEbOsUY+dlYzoK576AUG14
 9xcwH/wGxAqMTh/SuoQ==
X-Proofpoint-GUID: CeJm-gdotVurkbafP242kmrimzy9G-2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290155
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



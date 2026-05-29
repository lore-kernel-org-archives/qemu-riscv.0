Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4D2CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 13:04:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSwt5-00070Q-HQ; Fri, 29 May 2026 09:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSwt2-0006yO-R3
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 09:04:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSwt1-0001Ti-3T
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 09:04:28 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64T7mcmW2263570
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 13:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3ZCuyqjHZ4AljPj6gys5a/m2iSkIvT73UXFw5Qdvu0M=; b=o1/dYuWL242O7yWO
 z2GhUCEmAH9NupXyDr8ydFAnyWppARKsvgS3+ZT77tvB1iZiiY3GyS4y5epuSOI0
 Z1OveqQAvKNKyDOVdsLa0Vh+QPZK7sWt5Mz1203jmmrm73TRZx7VHJOn+p1p71FE
 L3Yfll4MatA+pPWI8m/30x/O4f/76Kh4VYq1VrdyfbyXEVpLHE1ZxQvWfRUy8GkM
 HNDLCtGvB8jmLnz9UErc/L6x0OszJJct/yVvy0mijow3ftovtiVlY5t4hV1RM0GJ
 bJaVXZEswZGa3OkROWF2Sng2QKjaBNnc4J0Cfs8FEmtuS54YkU7JVpYOdsxODMeY
 A0oFjw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety545dg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 13:04:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304e3e3fba5so4461445eec.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 06:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780059865; x=1780664665; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ZCuyqjHZ4AljPj6gys5a/m2iSkIvT73UXFw5Qdvu0M=;
 b=e2gkgsDx3nkAL0Kkg1bAm3aPL+HrBCMh3qv/R5Wj4UplGaVCzqy0qkIaaOsNF/azN6
 kai0QNSnSG2vv8XbecykmfoIL03VwXWc9DkRzsPF2ov3aWsKlJ3mReZ1+ayTav/sIpW2
 1BWqJ4dWquPvbDOKK/lWwkwsJWgYpenzMhgUuguJ3abawwWC66gyBal+lAJfX9Rix5kp
 /D/TX1Wm2xIPrmsQPYZbmOxQ8jBjo+vYMJ4jCMfGvyOoBHKfwHRudPsVrG9EZLetWikU
 GOM+fZsNbkakmLOl3RKuozlwPDufIpIHdG6Xzt8AJVF86Z9VDyFev4Ip1/UKC2wtHYlc
 054A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780059865; x=1780664665;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ZCuyqjHZ4AljPj6gys5a/m2iSkIvT73UXFw5Qdvu0M=;
 b=NlY7s8CnhZckGZzDhEhnlhsnFPdM5GevdVN14+n6iaA06slkeldUnWporlQlchYoyj
 w5U7+1Sfw48npzvLOUZh+qfWhTi5gQf1Tyl/mfHNqi7PGp3D9eXX7saAEowYL0gHCdrB
 SM/9jmlcZCAWexws6rhagltpj2WDiXgRA8MHA7A9I5e+kBEDDGsH/padiDpGE5MdsbTm
 x2xspiqzJimbz3MskHmyPExrGMGn1iOuGA6tnDYnnxeIixC/jcVJ6+uwSehjLkX8Eqf6
 Hfm7WsfkfJzrGG2m7w1Q4iGkDsdZ3oMp0yCWvZt0Hq6Dwv4gk/R4gqPh3wJcM7a2+NF6
 I29A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ePewjGhHpcXHS3sfAWqGF2QNyp7wOvHwywQBsfbugkhXLZXK1TOxsqwYejIh5sDJziOkk5c/SVPNK@nongnu.org
X-Gm-Message-State: AOJu0YxGltq0jK+7CqfY+dzpjBOrZbgflLLB2VwT0NApkq7Sfg4Y58gi
 8gwPyJkAYwhx4Pskz8mX33CzFmFr4LRmYNJoxItNWf8fCId4JWM0NabHhAbtCEYc2LLwJbp25UD
 bjLPSDszMNHplUcWQ6vxWrIbUYdc7AafzVXM/T49STmGOA4YG8dZ+lzdB+Q==
X-Gm-Gg: Acq92OEwm6qXcEpLMMKWJJ0/5iQDOUa4Nm50qcjm9PxclsOxc7u5HcRUsuniRjcSt1C
 1y1qatvilr0PvwU0/s1PcwP38HsOoKYow9Tr8SVQk1UdQOgC4DQvgoY0RYXTi61JN1SPl0/WBf4
 XGVn2Cm4sxL/cy51ofD5e3nh+SVlNLfaclYOja1MpgTBFEZbAAqqeF7AjXDP6dAeUACbHP6VT09
 A2qN/rDe56oUMS/kOintoWkXsjm6X0evMPt8bz869OI2wfS9nUAgBnDv9xStLAjjlQafaJPMrDx
 xOpKD/A0cXf5HiTYYYZBH51YHo40SFAZE2mbvpYpeK9ppq/IaHPDTUqTC2B0P0gkUvC0uSID+WS
 QoN6P+S9mQJWp9G5a1mlQNBpPNIsSzkNKqMUn9C8OHI0teiKoW+AI9TKidJhEwJAyVcyN
X-Received: by 2002:a05:7301:4186:b0:304:9b48:5369 with SMTP id
 5a478bee46e88-304ead9dc14mr1208635eec.6.1780059865122; 
 Fri, 29 May 2026 06:04:25 -0700 (PDT)
X-Received: by 2002:a05:7301:4186:b0:304:9b48:5369 with SMTP id
 5a478bee46e88-304ead9dc14mr1208589eec.6.1780059864478; 
 Fri, 29 May 2026 06:04:24 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed5f6426sm1306978eec.31.2026.05.29.06.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 06:04:23 -0700 (PDT)
Message-ID: <7f0759c8-4c77-437e-a9c9-f7ba4ba13176@oss.qualcomm.com>
Date: Fri, 29 May 2026 10:04:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv: Improve alignment in
 riscv_cpu_dump_state
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
References: <20260529053519.1224019-1-antonb@tenstorrent.com>
 <20260529053519.1224019-2-antonb@tenstorrent.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529053519.1224019-2-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzMCBTYWx0ZWRfX0A0EdPGTU+Xe
 XWk2/XKXB2QlgIEoZmyxVBpbSW0j+GVKgD0HJEPiIIcWzoLW6ocX/dtOf1n/n4yfuVP9lYNf3AY
 iIoVXr9qCrtoKeQVmJ1JKshga8EVMEf6OfPBth6/Z5jlWMzEJJjG8ne14CvCa2mZGD23nFaBPAh
 bg58yn0a4y7bUkfJnLSdDQl3M2UwqKyDU6+MuecachppR+Us/zGyqKwINMWXNBrXCBWaf0z8AmH
 G5RVtLKVeu8bHql3H2ebT5211nWP3puzr3i7VYNUxfOlCCGGhQXsqUBbCgexWwvzSU14Q8YM7zh
 hKhQ3gTKEyGCjWmsmbst4oCdKP+ZNiuhzqsr+fwxs1AUYZQf952YIVo3nAZo0/q5p9UFKBS+vhs
 ZeFg9BtNPgkNqko9gRKKQGlNjlYBbX36M8BDV5X2G1wNbFXHeDtVKVh1QTLHmV8QeJT7kkGcxPz
 5hzuBum07B4K5InXZgg==
X-Proofpoint-GUID: A_-YKgujM1pV7n5FBOVW_iJ4O5IG1bOD
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a198eda cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=LzvVdo_MntQyg2bNVlMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-ORIG-GUID: A_-YKgujM1pV7n5FBOVW_iJ4O5IG1bOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290130
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



On 5/29/2026 2:35 AM, Anton Blanchard wrote:
> Align all the CSR values. mcountinhibit is the longest CSR name at
> 13 characters, so use that width for PC, implicit state, and CSR names.
> Also remove the redundant '=' from the implicit state lines.t
> 
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> This makes it easier to read the output in my eyes, but I wasn't sure if the
> format is set in stone. Feel free to drop it if so.
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b38ddc39ea..883aa906a1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -575,7 +575,7 @@ static void riscv_dump_csr(CPURISCVState *env, int csrno, FILE *f)
>        * to do the filtering of the registers that are present.
>        */
>       if (res == RISCV_EXCP_NONE) {
> -        qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
> +        qemu_fprintf(f, " %-13s " TARGET_FMT_lx "\n",
>                        csr_ops[csrno].name, val);
>       }
>   }
> @@ -604,17 +604,17 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>       uint8_t *p;
>   
>   #if !defined(CONFIG_USER_ONLY)
> -    qemu_fprintf(f, " %s %s\n", "priv   =  ", riscv_priv_str(env->priv));
> +    qemu_fprintf(f, " %-13s %s\n", "priv", riscv_priv_str(env->priv));
>   
>       if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s %d\n", "V      =  ", env->virt_enabled);
> +        qemu_fprintf(f, " %-13s %d\n", "V", env->virt_enabled);
>       }
>   
>       if (cpu->cfg.ext_zicfilp) {
> -        qemu_fprintf(f, " %s %d\n", "elp    =  ", env->elp);
> +        qemu_fprintf(f, " %-13s %d\n", "elp", env->elp);
>       }
>   #endif
> -    qemu_fprintf(f, " %s %" PRIx64 "\n", "pc      ", env->pc);
> +    qemu_fprintf(f, " %-13s %" PRIx64 "\n", "pc", env->pc);
>   #ifndef CONFIG_USER_ONLY
>       for (i = 0; i < ARRAY_SIZE(csr_ops); i++) {
>           int csrno = i;



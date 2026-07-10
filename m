Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691B9C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 22:18:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJYG-0004IS-4L; Fri, 10 Jul 2026 18:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJYE-0004HU-2B
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:18:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJYB-0004hI-8F
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 18:18:29 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3KEF1622744
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zqrpRIMQGVyr08KFahiw99zYaEHxTBaUO7oUtEVnDpw=; b=ioILwYHR1azIi6TD
 CdcJCNa1Le/FI68oe27iR7GvuasqmupgziFUTTr3F/LmnSHIp9Gq2cKcirlwRtNp
 VM6okYAsDJYYByOJ+yuRb+IYrvN8eUuc+yDILJddCk15Miyidu3eBR2yaP6SmUiH
 WZuD2bj38rixpFxK5qxK0NN5N1yNAiTqpFVwPyo0ufXj79hDFRVEYCKQ0vh5zsbD
 BG0ZXWPmXY3wAqDCA57zzfiT/DOWbQ0AQrZBrVUMCVmX/nyUn2PA9pn2aC2Rq0xD
 2dh33WwT9l7OR6wcNuEz11Bxa8p1yYyokmq9r56pfrJmpEuPCLhGHQaqk8f3he0F
 lU3qow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb4rm8xv6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 22:18:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8eec6acbe21so29871886d6.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 15:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783721904; x=1784326704; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zqrpRIMQGVyr08KFahiw99zYaEHxTBaUO7oUtEVnDpw=;
 b=dVJ/tYht/WZ2SXRC6QN5mgGNiBPznbKol43DJI1+ppcnkuilGxZIzALZhj/PzwiIoX
 SXGqfnZz3wyPfgv6UUMT7wWaOuFSHUxfgPTpdFvFZnugMUqzkOM5OuVTkbZh2DEqlLif
 NIU7qGlouHhby12KfO/VMHZsyetXU5HVPdIOZ4MEviiHv0aJus3VwMLBFYI0J301DNxv
 7zcqmFznmpjJomvK7GBzeGiGp+atZ0N92Pk12LqzSSugV7Lw0Gm6hhVrbNLMuEJlJ9Lb
 YCjshWvuVGtWS3T22F1SdUmOtITc5o7224ot5Y4eK1IAClGlbf4I0gAQZGxHD5hFlH6i
 PLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783721904; x=1784326704;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zqrpRIMQGVyr08KFahiw99zYaEHxTBaUO7oUtEVnDpw=;
 b=hfxpEJENQapEfbfKD0bjWnPPqd1bGQ45c+kG7UGwJ+xoSZYWxs+2t4GDKJ1UPLYl6g
 Jd4F6ViHbY0vh166Kv9J4gW0Ff1nbcXnnh7UWm+lybdT2j2Kry21qy6R4DFrNKkHNSEL
 zifBIrmNDaRpx1jPRLqE1gElSFLV9gY8RX5vh8YrIYdECbVUDuFsUjuA7jt6zYlm9qSP
 71ODylEnkk2t2rOSDCDDHJoAE1gjzL0atGvW1tNChs84AYtHoR4dKhHJukhPQlfOwJGs
 oTi9noik8Wc38UsAD0d59dZu7JgZuO1c2l7EA+gWAPoOmh0Vb6bIxgIcOVgYLyulcYlc
 T1UA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrcv8K/UUKuGBH+Cw2MifPG1V0cmP6paBqpod1KX2Uxjb+EgKkCEhoY2ykbZPYM9miY+dHqnE2witTk@nongnu.org
X-Gm-Message-State: AOJu0Yyi4rR9X8YILMA+KFYJcHN/tX/Y+5kdzJImp8Z5a5CwlUFbxAgh
 lwbNEs2p3bb+DJsC0TybzhzkOhDlhQWVSTzC+34GtPXlWzqx2WcJ3qYFjYXgV1Ub0jN37v6Qe1q
 r0kWZQ1ELf9Pziio4tw/rn5s0VHYaV6hBY/Y+yFBgEv1F11aXvtaC6oLrcVfoax49+g==
X-Gm-Gg: AfdE7clStzZC44cM6af/asBwUPwlVkv/jbLuewBqgOAhazw6Mj2TAkOnpBidOfQZiPr
 sHijDUxqiJDWzWo1ve8unyzowLfyO6sondMPDlAOuKvNaGmf1cNfdsFHOrQANzZEfYrfHHBZICI
 uZkw3N79wRKcYin50t8oZ6gYRX9ATnQyM8qs5WMoejJ7aoNVifl0Omeo3IXS0C6Ccwh0uaHswe2
 2tlzMxbS070VZsIbqpxr+aZIn5SfhGZ8Vd3pqIcfEhUGHgGjTq3JslMQR0Qz63UtAMYqUlvgi5d
 6k74fa2fAggEI3Uh5apzcTmB5G2COM9IQePhVBWDFtmfAxxgNLO9ryww9mI7r0kv0JNMVOtgMTN
 6obnslKpZwn2n2gSyeIE8mvTwh8mFjrlepVr+0LsLqEUKRzMMzbDDJNMsu0q56g==
X-Received: by 2002:a05:622a:2517:b0:50f:c1d4:d9e1 with SMTP id
 d75a77b69052e-51cbf1c358amr9080171cf.38.1783721904106; 
 Fri, 10 Jul 2026 15:18:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2517:b0:50f:c1d4:d9e1 with SMTP id
 d75a77b69052e-51cbf1c358amr9079911cf.38.1783721903594; 
 Fri, 10 Jul 2026 15:18:23 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f4cbc620sm66970205e9.13.2026.07.10.15.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 15:18:22 -0700 (PDT)
Message-ID: <65f5aa4d-f730-4b7b-ac70-871a3ab6c150@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 47/51] accel/tcg: Use addr/last in
 tlb_flush_range_locked
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-48-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-48-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0cppWzjHUtRyRcybDPauLYPMcwK9njIL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfXzekA5C4HA4jp
 jrWuoQSj/kyRIKlboH0d7qOHNlCwvUC8fQ5RF0+zpjmn82c3sVeCOi11kxqV5XnYj7QCccOunXd
 tnDzb52PlwRn4gK0ah3itafSg/M7YmQLNnSr8kXXyQKJ8hSAXQIro2I379ofFJ5QMgr4xAPeNJn
 Ny2l4qmkeQGgkPI7yarmOUFxkeEzn8+5rexSZG790ZTM4YMeu3+SVYhlmKRanmpPZV5Zej8Xeas
 PVnv4D5kxdFwZLeqEIw62QpwkZcFlT9Is+SMEVqJxSwrJTugb9JZpLjAjntGvWX8lBGBxYOApsi
 cTsiWNRe3ATZkXndZkQsESm4jq3XxyJACXVEoINrmrbrTPzOvBqiiMa+57B9HccC+mNorUTLyez
 UPgKJnPF5Bi02z0wtcHVzanPAJQXBAWcb0AonzUVX/IqqiVIU+Onnap3aUHIhBvx1sNxWF2gtLX
 pHRxW1HijeiwvjVw8Jw==
X-Authority-Analysis: v=2.4 cv=JIYLdcKb c=1 sm=1 tr=0 ts=6a516fb1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=tFyL1U_a-0HfV1VqAh8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0cppWzjHUtRyRcybDPauLYPMcwK9njIL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfX55e14dri5L7X
 JaKWP0gAeHr7u7tpMbb4kCU1JJQlgYEA//h/3Km8xty/NJCBpxFb/vNWrnLk3tuJw7o1F2Y6TZ7
 eZVplRo5a7V1CRcxgWTYG1Iq86xNmL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100224
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 10/7/26 22:53, Richard Henderson wrote:
> Change from addr/len to addr/last in the implementation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 71 +++++++++++++++++++++++++---------------------
>   1 file changed, 38 insertions(+), 33 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index c8ba727859..2c0f7bed52 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -655,7 +655,7 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, vaddr addr)
>   }
>   
>   static void tlb_flush_range_locked(CPUState *cpu, int midx,
> -                                   vaddr addr, vaddr len,
> +                                   vaddr addr, vaddr last,
>                                      unsigned bits)
>   {
>       CPUTLBDesc *d = &cpu->neg.tlb.d[midx];
> @@ -669,13 +669,13 @@ static void tlb_flush_range_locked(CPUState *cpu, int midx,
>        * TODO: Perhaps allow bits to be a few bits less than the size.
>        * For now, just flush the entire TLB.
>        *
> -     * If @len is larger than the tlb size, then it will take longer to
> +     * If [addr:last] is larger than the tlb size, then it will take longer to
>        * test all of the entries in the TLB than it will to flush it all.
>        */

[start:last] used in include/user/page-protection.h sounds clearer TBH.


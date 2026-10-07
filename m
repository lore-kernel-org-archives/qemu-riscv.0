Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4CECA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:35:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEOzl-000659-B1; Wed, 07 Oct 2026 06:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOzO-0005yR-VJ
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:35:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOzN-0007ke-1e
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:35:10 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jgMT2969756
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w7d61fYC3pQRRFHTc4FNB7F26lbaP9SUyqeSyI8Q6r8=; b=YJoccgwLOgVkcgtQ
 ey5BLhFhDONNimItNorcViZ1HT70YR46u/YOk9+fpDPstbBsDE8jRvXJ6jpBdh8P
 fYpHbnpCIn7YGw8X3sBeLb0AvsSXr/mrcdmbqz1wbvhPDA4LeD8TmVnZHKW6FZVp
 e61+jIC8XkbLWW9mH1Doy7++OIX0kX94+2U/THAJmh67ssRopmen00/D80gjb9Qf
 1ZOGpc22LoiYuWr0DH7Yn74LSB30xXKc0wsXiTzpBpFfQk2aGJDZcLy9Lki5mgwV
 hqYXSoCe6VhPSVfnZF1ElHywTvhhoRr1izihWPqyyD4IvbykhwrULoufYUjFCYNv
 SoVM3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679nfh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:35:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93be1861d2dso644245385a.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791369306; x=1791974106; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=w7d61fYC3pQRRFHTc4FNB7F26lbaP9SUyqeSyI8Q6r8=;
 b=EJgs6Xq4IYfiEEfudWU0L9BDkfNdMb9Woy/eE7XvUtVSFU8zs/jtoamGTrN5qItA5p
 iNK21qVVGJFTad0ZicrJj6TjXZuYoo3Qh7hf8+fdUMujtIwSF6JCniq8hW7SACk97Jtj
 BBZBzql4ZcTJn2irB8U+FS8VpuzS1KkhpUazqKN74Zkoh0Cm9OGy4P/EcwNxyuus4QhW
 Q54ody+ggktQzDc3pM9VzpzaBvLkpybcvHSs1gv2DRT6wozKIVv1OoJ+vgQgXQdfSMOj
 /hehh5yO8uNB5LbhKz/6P+ypeS1y2x8nPvJVqc6hoghj1aWtE3kaNJ6ZKkbST9UZazmc
 mUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791369306; x=1791974106;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w7d61fYC3pQRRFHTc4FNB7F26lbaP9SUyqeSyI8Q6r8=;
 b=ZUz3JMK3/Ya2NRGxUUnQnSsBXD3nAvilqhKwCApvIk5M0GeFT9XN65T4mTh7oBbbXn
 9YMnDoX+hQBqISe5EshCcAM9sdd8h8jTK07pGu45G/iWs66LB1sDqBgfiJHXLKizHSSn
 CLc3vaz6vPzrnNZ0yqXvHsbs2ZTcAH7C0hjW1aXS/CYP60lfO6HopDkFcIlZ0m1LrYhO
 GAubFqcOKcLWvXefUgUVx4jBvm7FomhJ05355zIoEj2zx9JBnELLyYQrqBAy++v4Hx3C
 MfUDHDrhqIMtZTLHR1uM+6IXjEwmGOwY9IZ1Te9EeqHLuaYUe4F4AQ0n93fUQXPmF86/
 z8lA==
X-Gm-Message-State: AFuF++lRHkhhccper4vkvAI4Jn644Jfn8L6uTa0+iYwBIwsRvYG1XfYu
 ocCzQNpKJesKA0hHxC0BoUSRp8AxZlgONh80HjFQlVFVfMPdv+tfX6BWObsCbHpo6WH9QRIV16Q
 dRfHxrIMh27UFLfDkKxpP929Pm3J8gIAS7uJhwaCnPKIXiDKjP8TtL7Qyaw==
X-Gm-Gg: AYBFou1HKR1aCTk8FN3L4vPFoSJRTcYXqnhNVck0EZkfrajUYntCL8/zPAPzf7vs03I
 JCBq4jUr1qRNfb0OxcbWuA6W8eNES/sOVP/+inYG7fkO/9SSbfRDTTki/mXI7gvwQqw7Lpz4VE1
 osgTHjWRekoBVz0p5K8E4BbWo7a8albRJWD0V26VFRClzd8FiuqWhtPqcGcZsJxhwElEmlWrmsF
 yma6+sOCVhxIJ1h6kA/N8NDQeMtRTGZSnYMyFvz3TaW3SBIFcmb9SvTSr6elMcPtvILFxrxP2OJ
 rFBBX1jLGcfaYG2rfyLp8gJMDk2f+VlgFI8GE/J/SxYetjL5GpjERJ2d16i2aUEEFVyTIqCtCMz
 zLNKzuOJLzDcIwT/HpM7BB8kFxFeTUWlMdg==
X-Received: by 2002:a05:620a:4407:b0:93e:980a:88bf with SMTP id
 af79cd13be357-93e9b8bb04emr299243785a.78.1791369306194; 
 Wed, 07 Oct 2026 03:35:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:93e:980a:88bf with SMTP id
 af79cd13be357-93e9b8bb04emr299239485a.78.1791369305759; 
 Wed, 07 Oct 2026 03:35:05 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f51ba67sm52734535e9.1.2026.10.07.03.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:34:58 -0700 (PDT)
Message-ID: <b41b3cd4-2f20-4c34-8b8d-da80c23a6990@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/18] target/riscv: Compile arch_dump.c once
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org,
 Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-15-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-15-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX/RFWBVXE0z0p
 qhOalk2R6sMKwOH1nbEgFxJngJFfV7fRLERNqBDMXZRulp1ze6PQAW+DXy/TWgeXXU3ZTcID1L0
 h/RPEPeheNV68sOZcHvOBMqbjoY4t2s=
X-Proofpoint-ORIG-GUID: nA0Bqazc1n7TR1uJlX7cjK16HB8lsr-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX8Ih3cjL7EpIa
 KfJeDcMGV3ghF0HSzgxKaNTq1qVRKSuYS1mNOIQRvWIRHKlYL8sy+j3ANo7gmgJRYrvsP3uHI61
 gUKG7Nyg7637bioFVbpSk+exNigYezCWqAQfO0JARpYmSMzgz3FqIcNPvoLVY6C/GMrAVn+kMWk
 nf3G7ELTKxvF8+0bb+1aKk2RXgRc9vrxf4TdrO4jUE7dswnJPLlzHGMsOjdWc9ahz7L0P/rSuPi
 oXzilOioX+0HHLQxirabdNo0LVzyKx9FEWxSuNxeXLNQIeWh/ps2P1VW48y63563FTiwu+yfd/O
 cBM2Z/Ng3keUVEhBF55BQqOgPLJ1Phwnx/NPz5b9rKz4Cv6PUxwMpJIKDEwtQbHbhEef/6hZXsF
 3PPAvr+gi9POCPiqorqUJ0hleL+azblXiR29CSXiYqzeVfkojz/i1kJnhfbcUypHCRPj6/OAROt
 9tY3MnD3z7yFPjf6Y/Q==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac6205a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Sk4yTQCLnYdFTujUnrsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nA0Bqazc1n7TR1uJlX7cjK16HB8lsr-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070042
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 7/10/26 10:43, Anton Johansson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/arch_dump.c | 13 +++++++------
>   target/riscv/meson.build |  2 +-
>   2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c


> @@ -175,11 +176,11 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>   
>       info->d_machine = EM_RISCV;
>   
> -#if defined(TARGET_RISCV64)
> -    info->d_class = ELFCLASS64;
> -#else
> -    info->d_class = ELFCLASS32;
> -#endif
> +    if (target_riscv64()) {
> +        info->d_class = ELFCLASS64;
> +    } else {
> +        info->d_class = ELFCLASS32;
> +    }
If this is good enough to link:
Acked-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

But FYI the whole "system/dump-arch.h" API is not ready for
heterogenous emulation. We discussed it once with Marc-André
and there is no good way to adapt it, since it was not designed
with that in mind, and is restricted to a single architecture
which doesn't change (word size, endianness) at runtime.
IIRC we ended agreeing dump can not be supported in Het.Emu.,
and the plan was to refactor get_dump_info() as a CPUClass
handler, if not heterogenous then dispatch if available
otherwise fallback to "not supported" stub.


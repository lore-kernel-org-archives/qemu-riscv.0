Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC32C624A4
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 17:32:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2BHq-0001nm-Ga; Thu, 03 Sep 2026 13:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2BHm-0001kh-Tr
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:31:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2BHi-0002qj-Ll
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:31:36 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 683G31dU280698
 for <qemu-riscv@nongnu.org>; Thu, 3 Sep 2026 17:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 enXjvhoL1e9uxEQsEJmOnz3h1ixWqJPPqkM163xNqHw=; b=KYjXo4swOau1N9YI
 f/AqgsAMEVlsiVVUwicAU9jh5iXg4a15vBG+gR6BAbKFmk01rSC3Hvq/txqB1uoI
 WkCg3H31Tk41d6kTHQjFLzKsIDP8DCAkGn5et1xuj0zh+GImm/ALZSVjxUKSXBfJ
 CetGMrx/JYMxsnWomIXPnzLtzxLmUB2PFLk0igEeNAJSHE58KXgUag2+e/RfE9rm
 U4z5MtfjSw0Oxhj6xVTnNEFkOdNnEr9OypXRGvQavXcoDxdInb1w3I1xzX048eke
 WcZ58M0VJYlsjtKMVh+ueD6ah1B/UXAWNR0KuRdqu4XvFzoc/fmBI61L8u0LlpFT
 e0Igag==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjuhq2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 17:31:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-75116a48926so56200137.3
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788456691; x=1789061491; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=enXjvhoL1e9uxEQsEJmOnz3h1ixWqJPPqkM163xNqHw=;
 b=QlAB8fRGwujeC5nzP81OiEtlbq10UWsuCLZu4p3zyiRDcgAl9qMteIhKldTw8LIh6y
 /nPlR8CETt2k7y16IaKv8VXgbXcs+1zz7Q/iz4GVe/nEWduaa45H+Zvu2F8E0eNw+B9k
 LadBlyBf5QOonTxlmCA70V7r4qBhqdbPARzCdwVdiEuhEZW5boirX3EJp7xDrNfkqv6z
 bh4+TBpj97ticnH7sP5QEhQa2jO01MmhVq6EdOqRaiLXCDTPBBOpNpTcOgxy4yjPlDjx
 73cx7Q+m8stsX64X8OWcMsnqvmRk0nAfPupyeiSVpcH7IVwPGuIcJjgdD+ONGqUXAeZu
 5e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788456691; x=1789061491;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=enXjvhoL1e9uxEQsEJmOnz3h1ixWqJPPqkM163xNqHw=;
 b=VR3uuW50Q/c5/YIwq2jY17Y4XQigodIOTzyWkJBhK20nNGeMn2i69UgBqz33ktgSUa
 eSpUIDZo4L/p5RVC2XKtYSFr0woAo0OJ3lFKE+kjXF8LUO8cOG7+lnfZcMzk4UOADz0j
 OQ0MLcoRyn/LawHN/06UWZKFFWxWqjK3N6SmwUgVJRBGH0yPWdCVUChgS6jMIdv2UxF8
 zIcaDWs3kXKmdhOeFjyc4DLPLJykVN8pvU8oyCZ2zsj1minWAf1AbzNKeX6ikqO7LXul
 Aad30keV6u1xPFmuCW5SZ3HC9DoqgvqqXq/qh61B2lZ2ENOEC46rk89LyaJzoDuBtbAX
 OWXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwo9C7QEOTZrnZDUD7I72mB4Nf4N/eKNG0tyw+v2kqERGXTfJmhf9Qy+i2kj8xmI06HClQc+YwcvPBE@nongnu.org
X-Gm-Message-State: AFuF++kw8qpq428Bkz0CwO47bxr89MFmO4/JH2q2gEliUo8cJA71pQ7r
 yRv6Mit5wdfQ2QTDp/t6pgveK1mK86+uMiV64j999vN/U2fdHQ192L62ccNNTr0l+G2wkYYk/oX
 YrFixhl8tfzNeYFroHHcU1/Ke/vMtqQaCpRvHLMASx1QOHuPY1Bkb0imfvQ==
X-Gm-Gg: AYBFou3lBIVOjVcMZ2cCfD8ZYO2aSGiYtuKvWT/0lt/Eme98Hg58/r6pAvzbMHkK520
 cwQ0B7qwGvSUEmCcd1HsKvIelBTYIEcpgJleWzoG60bQjyc2eO4urd/140QlXnjFGKMYDmQy3+S
 nCRiZ9+57EoGsakBZkpc5JHUCtz0/IwPX17sQs9mFBRCiPAmrNWgPwfCKca//Fx5usnROWSUvS2
 jVGOHkCAEFcotkrFTyHNRbDPbkmhAKpU4LkKtHmrPeYIrbelcC0yx53M639HlOf1MFf0fsfS2xK
 2Tb9S8slumu+efBdKwtJWHH9o8MpBiXTD6yINobBxG4GrdM18IFZMcydIvEpZaRF5eI7z0xJa0s
 Ndf2QMGegMwEUUMlxFnJk/JzhoiSU2ZQZwQ==
X-Received: by 2002:a05:6102:290a:b0:785:1d9c:633c with SMTP id
 ada2fe7eead31-78a1f2aeec4mr5519061137.7.1788456691054; 
 Thu, 03 Sep 2026 10:31:31 -0700 (PDT)
X-Received: by 2002:a05:6102:290a:b0:785:1d9c:633c with SMTP id
 ada2fe7eead31-78a1f2aeec4mr5519045137.7.1788456690516; 
 Thu, 03 Sep 2026 10:31:30 -0700 (PDT)
Received: from [192.168.69.200] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485881353e8sm145149f8f.1.2026.09.03.10.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 10:31:29 -0700 (PDT)
Message-ID: <8e3baf27-9e44-4481-b60a-06e33678d473@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 19:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tcg/riscv64: Validate AUIPC relocation range
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260903170405.3632015-1-max.chou@sifive.com>
 <20260903170405.3632015-2-max.chou@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260903170405.3632015-2-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE1MiBTYWx0ZWRfX8wXtxEe5h60X
 l+keuftN2/JYjBnRBc4BPdO7kMbONHFakcn313lVj/su6bppdRAaUo4L40jcygPpYFN5u3CogI0
 hQ+A9V/HPBZ4dS9C/8CjCbk5B0NA2jUjEwqa4s5d2Gn/oT59TNwarPP2AKMPCSIQBetn+g4nS2n
 1YYzdWGBXl/WA8sYWzTtpSkK2nfGXz685ZJhDpKfAwye+DdeT/mYSDUkDWRurFu/xyTZVALWu4T
 LFeWmMuunBigWQuxuxtlFNHP//8kBu5UB8bo3lzLiFcu0GsEweSkSQUn9abMYWU2o8ayw7nAkns
 fIGY9uOQvP/qob1e9TAeuW4W76cmq02ZxvRm4ILEag2gqFuFreUhInoqfSP6Caw9lhFoFs88w0/
 7FWeo7ovoweUDlYaM+YuVKexgJz47XGsmxFeHt8Rp0CqI/c1mtXa5FXHZSBmyqkp2iilWKpvu7Z
 Ka5g2cVTAfWbd+CHY/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE1MiBTYWx0ZWRfX67AkkTvlEQWD
 FXGvX9vOfwlqiD2rOteosQtORjrJ+ippUjNG84UhBDWApopw6jJcoy1q4CrY5qF4dLOyij+nO1k
 J8TcktESVZ+ojv3wy4f3OwrZ5BAxGww=
X-Proofpoint-GUID: 9hoR-vVInUVsrehC20l01d714jpbuHVy
X-Proofpoint-ORIG-GUID: 9hoR-vVInUVsrehC20l01d714jpbuHVy
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a99aef4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=kD1aHXNoiUmW-fgF_RsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030152
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 3/9/26 19:04, Max Chou wrote:
> reloc_call splits a PC-relative offset into a signed 12-bit low
> immediate and an AUIPC contribution. When the low immediate carries into
> bit 31, the existing 32-bit arithmetic can accept an unencodable
> positive 0x80000000 AUIPC contribution.
> 
> Keep the split in pointer-width arithmetic and reject it unless the
> rounded upper contribution is representable as signed 32-bit. Factor
> this validation into split_auipc_offset so reloc_call retains its
> existing failure contract.
> 
> Fixes: dfa8e74f9463 ("tcg/riscv: Add the relocation functions")
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   tcg/riscv64/tcg-target.c.inc | 25 +++++++++++++++++++++----
>   1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
> index a439ba5c20e..1c41f8ffade 100644
> --- a/tcg/riscv64/tcg-target.c.inc
> +++ b/tcg/riscv64/tcg-target.c.inc
> @@ -634,14 +634,31 @@ static bool reloc_jimm20(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
>       return false;
>   }
>   
> -static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
> +static bool split_auipc_offset(tcg_insn_unit *src_rw,
> +                               const tcg_insn_unit *target,
> +                               intptr_t *hi, intptr_t *lo)
>   {
>       const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
>       intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
> -    int32_t lo = sextreg(offset, 0, 12);
> -    int32_t hi = offset - lo;
> +    intptr_t low = sextreg(offset, 0, 12);
> +    intptr_t high = offset - low;
> +
> +    /* AUIPC sign-extends its 20-bit immediate after shifting by 12. */
> +    if (high != sextreg(high, 0, 32)) {
> +        return false;
> +    }
> +
> +    *hi = high;
> +    *lo = low;
> +
> +    return true;
> +}
> +
> +static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
> +{
> +    intptr_t hi, lo;
>   
> -    if (offset == hi + lo) {
> +    if (split_auipc_offset(src_rw, target, &hi, &lo)) {
>           src_rw[0] |= encode_uimm20(hi);
>           src_rw[1] |= encode_imm12(lo);

I'm a bit confused by these encode_*imm() taking uint32_t arguments,
otherwise your change LGTM:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>



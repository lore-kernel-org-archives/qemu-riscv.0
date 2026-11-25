Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2433606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSILsaoK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xW2b4-0003G7-2o; Tue, 24 Nov 2026 21:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xW2b2-0003Fq-DM
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:18:56 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xW2az-0004eH-3b
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 21:18:54 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2f0213202fdso27337375ad.3
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 18:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795573131; x=1796177931; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PixW8xr/EW/zxgBbSl3pwhIY2Z9o+E7akjOIfyYY7gI=;
 b=wSILsaoKTDzJSHeBcFYKalvMDpqB8oqdcXLXJ4+qJC1RsL3OG4kCqqJYTYu+blkTM9
 ylymoShuZuBCpNkI6pHTg+UuwJl46y2ayU5DKMMEPTKrGl30I0YYrfAwtkgvhebA5Sbh
 0qIh0NAQJ9RAXM0/3Qug6/Ez9f9GeiMPr24AWE6SdbUIgpYNqVMHLZD9RidQHheukDkB
 i3vXeAmQvq26UDcaBroWdXqS2f0OTQzSqmU5h4Fdqz8ECMUmdG17o1uwK1gpT3wuRyDu
 3fFT7S6PzuJzAnqOIopG9j4PWzZ5iJdbyjK4dZPu/WmPM0oD7okGQI1QYPdGOaNipl/M
 jOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795573131; x=1796177931;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PixW8xr/EW/zxgBbSl3pwhIY2Z9o+E7akjOIfyYY7gI=;
 b=xOCr+qfeGxl6RzCxo/LoKuQbnzL/lGItp0c60gb5ilsrYWOu5C3oDHxV6au2WA9PjI
 utW7TbdYPySEVHQiPq6F8O0smr+fFfnOQ7jU/m2HziJwlNngE/bwlX1UCEvmwDc50HEv
 qtZ2/ck1E7sO/big2LyLh6J0VBV1mapxwHOkkmNMHuNinhTubmZGp5fdDeOKrLv6N9H7
 RtGEjPImBDfVMeD5rQS36gC9yECq2uXc6dHlq+txJB68AeArvmCDgIuUWyzEVOshA4og
 5jT4qmMqgHuCLVnYbBmSkEds+dMmyfg1eQSGMobl/u2EJppP5OLfbokAAUwRvgsZ/Rb2
 H21A==
X-Forwarded-Encrypted: i=1;
 AL+hErGiaUDAhwCMQCS6QjrBznPcU9VQox5NiFEFC9WLiMxKUl+Xyot4+BQkHA1y0kBuxycsDdKVZFVOH6Up@nongnu.org
X-Gm-Message-State: APuU4Z9V4KCRkUFzLuPh/dMRBWgGsR7RIV8+xFy5ArezpnrCBC0J2+TJ
 jsRQ9b8ogLDG5o7y6QL1Q9gjYV/mIXNOSpX8OQ2XTf8d+VEkKoVUmv91
X-Gm-Gg: AZFdTZc2uVLtd2l2wk8hu5iRbaiR+2UzVP8aB5QubZko47vdH5Tdb/ULUF6Re51PnRA
 En6GVIuUa+HWMvArWLuGSsCYvlSXBOKLIVXjs1yx25iOOqmH0rGI8gtWk6BDUeRPQKSjTWudf9v
 fowX3lf0Jwa7XHbI+PzX9hmf6+YJEMDRPhZSvMf6wK9+s9e6DsSLKlkeiMUetStHYnnZMpb/DjC
 AqAh+x78FdrorDuJ0+FDegWAI1gUfi64x+gC/cQaW+EZDUmLXWQmhmUOXuDbb+G2P5AeEnw8+uU
 P46csYFiiLDTAvYV/sgBVOWH2pt2rXNxwgkkuYS691o+qgojHYC8YzE2Yf7l+EIlhVU5G5/amJ8
 hrahmyyJbuYU6zmPgvVouE6IxPZ/1172g1Ug/nPh6b8W+R8A6B9bt5gkVCiJ1pGmqmlEKL+gDSv
 ShfrUSErKsC+4lINU45kxUDaSoB+0hG6DohBTNoStjtcQ2SMQvxbkALawWlTuzTy3tEiTNAn/LT
 nCA5yrrKiyabjs2jjs2sDsKOMW/XYMPs4ig9ua1YwJh3MTOFw+gKVQJM7YhwCBg7giZ5l5j63zi
 yucvhckf/AhXPWJ9xIpFbPoivrFdeVAs
X-Received: by 2002:a17:903:32cf:b0:2f0:5e53:8db0 with SMTP id
 d9443c01a7336-2f05e53a72fmr114721725ad.25.1795573131270; 
 Tue, 24 Nov 2026 18:18:51 -0800 (PST)
Received: from [192.168.200.201] ([14.19.9.16])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2f03f108205sm75532405ad.44.2026.11.24.18.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 18:18:50 -0800 (PST)
Message-ID: <fc1987c8-33f4-4641-8473-955e63e491cc@gmail.com>
Date: Wed, 25 Nov 2026 10:18:47 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: add memory ordering required by RVTSO in
 ldst_stride_trans
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Tao Tang <tangtao1634@phytium.com.cn>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20261121-fix-rvtso-vector-stride-v1-1-1c451042b0b5@gmail.com>
 <77ad37e6-f068-4230-9cf2-9b8364fa7c49@oss.qualcomm.com>
Content-Language: en-US
From: WX Chen <wxchen0913@gmail.com>
In-Reply-To: <77ad37e6-f068-4230-9cf2-9b8364fa7c49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=wxchen0913@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Daniel,
     Thanks for the comment!

On 11/25/26 02:52, Daniel Henrique Barboza wrote:
> Any reason to not handle ldst_index_trans, ldff_trans and 
> ldst_whole_trans? They all
> fall into the same RVTSO work you're doing here. 
No technical reason, just not sure if they should be organized as a 
patch series :D
I'll include those paths in the v2 series.

> In ldst_us_trans() we have a Ztso comment explaining why we're 
> positioning the barriers
> around the loop.  We don't need to replicate it here but it would be 
> helpful if we
> could add a comment like:
>
> /*
>  *  See ztso comment in ldst_us_trans for more info on why
>  *  the barriers are put around the loop.
>  */
>
> In the helpers we ended up adding these Ztso related barriers.
>
Indeed. I'll add them in v2.

Thanks,
Chen

>
> Thanks,
> Daniel
>
>> +    if (is_store && s->ztso) {
>> +        tcg_gen_mb(TCG_MO_LD_ST | TCG_MO_ST_ST | TCG_BAR_STRL);
>> +    }
>> +
>>       mark_vs_dirty(s);
>>         fn(dest, mask, base, stride, tcg_env, desc);
>>   +    if (!is_store && s->ztso) {
>> +        tcg_gen_mb(TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_BAR_LDAQ);
>> +    }
>> +
>>       finalize_rvv_inst(s);
>>       return true;
>>   }
>> @@ -924,7 +932,7 @@ static bool ld_stride_op(DisasContext *s, 
>> arg_rnfvm *a, uint8_t eew)
>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
>>       data = FIELD_DP32(data, VDATA, VMA, s->vma);
>> -    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>> +    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, 
>> false);
>>   }
>>     static bool ld_stride_check(DisasContext *s, arg_rnfvm* a, 
>> uint8_t eew)
>> @@ -958,7 +966,7 @@ static bool st_stride_op(DisasContext *s, 
>> arg_rnfvm *a, uint8_t eew)
>>           return false;
>>       }
>>   -    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>> +    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>>   }
>>     static bool st_stride_check(DisasContext *s, arg_rnfvm* a, 
>> uint8_t eew)
>>
>> ---
>> base-commit: 08ed97c33c3818ef51a7c852347a28e9f66807b5
>> change-id: 20261121-fix-rvtso-vector-stride-39fd6f035f17
>>
>> Best regards,
>


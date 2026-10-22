Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58182606A31A
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NkYj1mhP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJqN9-0001cS-Fh; Thu, 22 Oct 2026 06:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJqN7-0001bS-Ec
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 06:50:09 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJqN3-0000dr-PI
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 06:50:08 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c45551fa84eso251474566b.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 03:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792666202; x=1793271002; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6dJgUIAr937ULoZCwHqanoDo4JFDo6siKBpOeUPBQEo=;
 b=NkYj1mhP7Xz9xZkQ99YSOCY6Q6p6CJsDt2/rwYnbvN9PrCQigCozMqGHDvj29iLKng
 WRQf90D1z/GRfBxx5/AMO5BeFWg+BSEu97HJlDIl/ePPmIbRk+spSCUUWvWkY+1lXOsc
 3APk12XJ3EbJEcHxoxD68jvmVMWp8L+Myr4qhQ9N/Snq12ZoWG5GeWGgvzYTT/31e7+I
 V3KLA8sbZvTOvJxkuA3cyfrHuIrIuWN+VwGZFuzhTCr4Cc3ViZo9t8jB4YxcNkOzONie
 QNUyyE5H3vf2DFxoXs2Zhx2Xl2JNJSI9SaTGuKbnJEkEx+wnzB+Ua9GCYIl4ZYIbCyfF
 NYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792666202; x=1793271002;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6dJgUIAr937ULoZCwHqanoDo4JFDo6siKBpOeUPBQEo=;
 b=SFlt24RAQqykC53ReSEYYCHfTScnlpTs9ST1fbUXW4O1Y1IV5WWHJuskxuusKXBKCZ
 42aKibjcE2ApHrljpZ+Ey1dWAyctdpyFP21VMpRo1jAt1Pp83RkIKHtCNmowOYjxklSA
 M/+9m1voFoK7teU0byrfxFxWq0jmCyZ8V4k/Trmj7RxHrFew2RSdJcTxXRDOJcCprLR4
 CVysjAuilRkGMsXjteaoIckOFkZ1jVrYQio3bu9ieLhNLOrlYavs4vsfHnMmOtDxCWnD
 ttOHICAcFlesjZqR/RRtjQCW1aU0dSSA+zri9f3QibJfnE2blJh3TWqfmO9+h5dWpDG+
 ExiQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxV2/Pm3pLjMkZZ7rM9uo7rCDiMsMifZxBWcuA19YsDcDW2B3pnoE8nBxy1oI+0DLOKO1ibeE4+gNhh@nongnu.org
X-Gm-Message-State: AFq9FYK3k88MWNaPo6xr2okjO48QltcptpHBP/E2ji7l0V9YfgYOwxdZ
 e1E1gxFEdjpfC37q8j8kUukQIrlhzHumYK4Us0P2lCCaT63iCBohgSRfC2Ocd9cpjFk=
X-Gm-Gg: AYBFou1wilTzp/FIu1n9I7H9xPBq9zJ7909p5GnJUozK/5oZIMi25jjTQvphv2GLeMo
 PblZIOf7l0YD9zHGFRpvrb9BqZJt010fnzv0Ueyt9OMJJ/0FFiVkd/EYfW7IWfe/h03L/k2oZiJ
 aE35cpY3v4UTAgpdHrh12fetywsmXpWsKbpHgIDYDS55rVpL/CAn3Sx7cOit9GurZ0rohV75M6J
 McEdxX6JzvnZEFY/fzOGtwQ9IDqt7oZ+inS2AKoY95sWN8/FxYQQsc/YDt43mhBkmhhPdgLDuSd
 VHSaH98K9wwul0iQXKfAtB2MQad+EtVe4noz9F3g5DSaGIJrmx/ot0lMsI8oL+20ISDyI/E+v1X
 xg27a1TDmuiVfl5wFaUTF6qZQKDEFoVR84i7TJEGH9D8jnmTePG23vGRoRPE0jqXkEyJDWe6erf
 oqw8YgLLL/c+FNaogEVLtoFzyAh3Jp/7E2ymS6MZf0A54+LYHOEd1Ihy+e9CSon8jYojApmELk2
 yOkWYDn3AlfYmx95sE919jVqeOw8OVEmInj5PVdNRAZWGdEqKDibMaUeNfIUaINyJM2OpZb4mVM
 mUfDrm9lpbV03ldPDk/gt9QlfHQwxXo+nHI7SBvxJ5V74OMulFAmxmaOd9jS
X-Received: by 2002:a17:907:7ba0:b0:c33:ae8b:817d with SMTP id
 a640c23a62f3a-c4679746245mr516041966b.46.1792666202425; 
 Thu, 22 Oct 2026 03:50:02 -0700 (PDT)
Received: from [10.25.47.227] (195-200-20-154.mclarenap.oninferno.net.
 [195.200.20.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c468a5102cbsm89608966b.13.2026.10.22.03.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 03:50:01 -0700 (PDT)
Message-ID: <236dd2b3-1d2e-4561-b3d1-cb4409f9dd9d@linaro.org>
Date: Thu, 22 Oct 2026 12:49:54 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: fix pmp sanitize error for x-rv128
To: Peter Maydell <peter.maydell@linaro.org>,
 frederic.petrot@univ-grenoble-alpes.fr
Cc: daniel.barboza@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20261022075219.312757-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20261022075219.312757-2-frederic.petrot@univ-grenoble-alpes.fr>
 <CAFEAcA-rw1_a5q7jB_Rx3KoH2_aPE48odM_99kx+Tz_J_LYw_Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-rw1_a5q7jB_Rx3KoH2_aPE48odM_99kx+Tz_J_LYw_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 11:16, Peter Maydell wrote:
> On Thu, 22 Oct 2026 at 08:52, <frederic.petrot@univ-grenoble-alpes.fr> wrote:
>>
>> From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>>
>> UndefinedBehaviorSanitizer reports an undefined behavior due to shifts
>> larger than type in the handling of the pmp configuration registers for the
>> x-rv128 cpu.
>> Adding an "i128" version for the functions accessing the pmpcfg registers
>> to properly handle the 128-bit case.
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> 
>> +Int128 pmpcfg_csr_read_i128(CPURISCVState *env, uint32_t reg_index)
>> +{
>> +    int i;
>> +    Int128 cfg_val = 0;
> 
> I think you need "= int128_zero();" here, to avoid a compile
> failure when Int128 is the struct type rather than the compiler's
> native int128 type.
Yep.  You can test this with --enable-tcg-interpreter.


r~


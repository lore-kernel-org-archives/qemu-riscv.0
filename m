Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poglG-000510-Te
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 04:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poglB-000501-LH
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:32:22 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogko-00083f-Q7
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:32:15 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2a8dd1489b0so2525761fa.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681806711; x=1684398711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=osj8/GPz/P9GU1ONg/ztykGOl9NLJe8v5vmhnnZb1nk=;
 b=oTmaI/mQYXoAlp3y7f/sWO/7SWWAzv9Wz/F03Qmqt4TWZOT9Le2PJcDZmhXpjgN9yE
 zfTbPkZOR5gySiBELs/mzoGhuGC2IVcnKMs1vi7qEiWTKAykXH1e05vbqAB8ZvifqUsg
 Ue6NasczaNDhVfSQsMjCw9y3gB6QmwgY1+dOZdyYHYcFANQJIyf/pd4JkJzR1jCuqaKf
 EVlOzU/ZFXtcTVJi3h2v3zdiNTD04Fy01D1dHAQZ/FhEGUzRUVYDs3qQUnSk7lkUbA2L
 MU9xW7In4IFcnvxI87uMg/OsaDdfB+6BJjGmYDe8GJ98qSuY3WVvNrx0GYB5SSCxOHyt
 NySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681806711; x=1684398711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=osj8/GPz/P9GU1ONg/ztykGOl9NLJe8v5vmhnnZb1nk=;
 b=PYKTtV/Jg4lbzDGBHnibPuFcMe5mD70kPQN37qu3D1iJfnjRGjYHIr8pM6g8oeSEDC
 G3zJbNSPCop6Q84jEmUg0kWmB96spq1jjKteFaZUtOHTZ/pyhmzQmoiYp2M3uNo0U8Zo
 hqRygevKz6+OKE1xUEyqZfAFJpID3X6K2wJYPquA3OiEuiXCJkKPRX4wRl447ZuwryoA
 ndZlRamEosAaiWkPyt/s17G/c4cRVl6BzqBMhUL6dKRfiKkAhihGJrRKpIcoF28wQ8Mj
 KbmF0juACoe/lOwbkv/D8A35TXh91OxDmKN7YoCybRg2U4+i1iSlXdUYvjyCL/+NzsyK
 34iQ==
X-Gm-Message-State: AAQBX9dCtR/AzS6uka3ni5wNdCJw2cGL/EP8qS3fLPvh516pEVNZccRe
 ZvQHvTnx33XfN8v1FrAQHkC3Sw==
X-Google-Smtp-Source: AKy350bMzuY/up46E82EOf26CcpHsmw5xMPslGXecWSv6Ds2+dxK10LIDkAVAZmgOgLbSohMtROYfA==
X-Received: by 2002:ac2:4908:0:b0:4eb:e7f:945 with SMTP id
 n8-20020ac24908000000b004eb0e7f0945mr2367311lfi.41.1681806711278; 
 Tue, 18 Apr 2023 01:31:51 -0700 (PDT)
Received: from [192.168.58.227] ([91.209.212.60])
 by smtp.gmail.com with ESMTPSA id
 q9-20020ac25109000000b004edb8fac1cesm1498986lfb.215.2023.04.18.01.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:31:50 -0700 (PDT)
Message-ID: <c9e06460-19ad-812c-cce0-b2a7a20e423c@linaro.org>
Date: Tue, 18 Apr 2023 10:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 14/17] crypto: Create sm4_subword
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 Max Chou <max.chou@sifive.com>
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
 <20230417135821.609964-15-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417135821.609964-15-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Apr 2023 08:32:22 -0000

On 4/17/23 15:58, Lawrence Hunter wrote:
> From: Max Chou<max.chou@sifive.com>
> 
>      - Share sm4_subword between different targets.
> 
> Signed-off-by: Max Chou<max.chou@sifive.com>
> Reviewed-by: Frank Chang<frank.chang@sifive.com>
> ---
>   include/crypto/sm4.h           |  8 ++++++++
>   target/arm/tcg/crypto_helper.c | 10 ++--------
>   2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


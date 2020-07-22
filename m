Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyHSf-0005XD-Nz
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 12:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHSe-0005Uz-Jt
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:19:16 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyHSd-0004Aj-4P
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:19:16 -0400
Received: by mail-pg1-x536.google.com with SMTP id w2so1522697pgg.10
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 09:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J1Vt0n3Xj7aKrd0m0W0pivNkeO1i6Pu+6tItym+hE28=;
 b=O8b0tiIgmyzrH40uU5m4gW8hWfvGr2gHWPmVaiwQM041CSnQ1I9Fabvvu7v9Zq9G2r
 cKzL7mMfbYBl5w7mt5zd/8jpJMcNx2y/lywOYDQuJTDo4Ssv2+9GIJT3BGLFVVmwIDEr
 6EEdN8HpK1d6Dc2oipC6CCKf6QTJYlV1ViAKSEbIp5wbz7chpdteAHKGt4SmbedCSrMP
 cy8TWFkOThuByFY0bwitjOaTUyt6zBZYM0XMaMcinDYm9n6R156HcrYn2cLJqFOZZ+UX
 xsCnUAfzqqrLPADwl6el9ufoPVh3Wqib7iTE4/nx65a6UE1jyYmmpMamsVuTPAQoJMkk
 1/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J1Vt0n3Xj7aKrd0m0W0pivNkeO1i6Pu+6tItym+hE28=;
 b=Tsl+5KA5+sNk8sPbcQgK/SkHTXgSkZG79mezSfWnCXNEXYKy1Yvphk+Ytf/Kfbp2mN
 nRkD+Qs4ElqFYZr3N3L07uRbmv0UsT7eyVhjzYIjKf4kKnttscrITZRfV1mkaAUKMnaP
 Ow8HmrLhKRHmEbii1ThHZXLkpOIIfy+Oy/U07gifAzZ6oG/ug+UnVKzecwDKG2RT/hPx
 Ulahz3W71ASyzTkFXS/K8EehLGFiljhCMrCeGx8ZZIl2LoLqh6rHusTqKlugSPQdKi8I
 br11xQyy/+5tTXoEBhERTk9C/ic3nlJpuKxLwhmpC/Hxa9c5HDkb0Y3CgHxkmNW1VlwH
 Ce0w==
X-Gm-Message-State: AOAM532KqiwBHbpEWiOXKmtxVOGvXzARJbjhkeOTHXCUb1C1JRlG6mLo
 YrkqnUazjgcN+kVTCUxcptJRYg==
X-Google-Smtp-Source: ABdhPJwqhHle0TasW2iBLdjl+yaKxt6YJ8qgO+afGZNc3XUfY8uQpojrqJUMrXlQ4etdNobUiHVyRQ==
X-Received: by 2002:a63:525a:: with SMTP id s26mr505177pgl.155.1595434753797; 
 Wed, 22 Jul 2020 09:19:13 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 b14sm77733pfo.28.2020.07.22.09.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 09:19:13 -0700 (PDT)
Subject: Re: [RFC v2 07/76] target/riscv: Use FIELD_EX32() to extract wd field
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba5ce958-8b01-7b97-f8e2-09a2ceb9ea8f@linaro.org>
Date: Wed, 22 Jul 2020 09:19:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2020 16:19:16 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/vector_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEDsd-0005YZ-2y
	for mharc-qemu-riscv@gnu.org; Tue, 17 Mar 2020 11:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jEDsa-0005Ut-Uf
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 11:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jEDsW-0000eu-3d
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 11:11:40 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jEDsV-0000T4-8w
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 11:11:35 -0400
Received: by mail-pf1-x443.google.com with SMTP id b72so12093478pfb.11
 for <qemu-riscv@nongnu.org>; Tue, 17 Mar 2020 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tta7EC21Fymxe6MQDAH1hWkr88blEIewHExq5yASP0E=;
 b=eymm8XtQiI5HEMbR6UtNQUbCmYcMFj3GOk2hCkvFrjaKhhnPfJaUfSr4q7WfRJAWcI
 Q/x4HXISuatPO7+G4woHBfjdoCXluP0IRNiw19rM7EzeQWjG5CLs482kN/5MlEIZu8Z/
 g/MwwcYY8C7i3zaoT+3T6fhmQqWKPkLtUR/+j6TjEFzOpeQXs0LhLwgRh5fYkI6lzCgY
 covhyViWpFdI9DGZFUW4PhK/F13EQswuwA0oZZaaqyJau34EUg16xPzbsS5KpMcTO0m7
 mJCJHN2PxsQJOIdnVzg8jmpZJ1M8k69hAQ8H63FeZvGIrcYuFCK0z0FXAfJ8dNawIiPd
 mF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tta7EC21Fymxe6MQDAH1hWkr88blEIewHExq5yASP0E=;
 b=WboABJJkQYN05k0msuflIBHl1tzPNSyxWZLeHpL3ptWjVsX3tbXYKCNgVEcSRV5l3R
 pHhti85nqYHNfs7XotRuCxFAnHTx1nuevAqp8LtEO+dBWHjJJnlCrpSaPNhiBj4vWa+1
 5tqbfT+ilkiiZAALnpcEDagKYuFp3J6cWE/p+BZJB5MIbKsgH9z6aPu0QkIvyXcWi8wA
 j2kr/rzQrLa1J7dJBHahTi4pzS2UFZNB4i19wh/3O+w+Puu/+vymSwMVd3vP+KutV5AH
 kvZcbkqiz/9TCEfr7yxohn/3opF7chje+aShBxyr5NWRwaY/OphVuXdb5a2WZtbAcWOB
 QRbQ==
X-Gm-Message-State: ANhLgQ2pZT3b0T2zqdSewDYrFEN3Of3oveBQA9BkrA2W76gYpWU03oPt
 5eG5HovsAzrTnOIWUEM6FEBGwGv4YsI=
X-Google-Smtp-Source: ADFU+vumVlcmLzxrLWRFzRsLLMYuQHyeX++NvPFh7Xn+2D3XzkQr7YvkfMxdOvBsGTYzsJreaoz9qg==
X-Received: by 2002:aa7:8156:: with SMTP id d22mr3155152pfn.69.1584457893074; 
 Tue, 17 Mar 2020 08:11:33 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 h19sm3430803pfn.205.2020.03.17.08.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 08:11:32 -0700 (PDT)
Subject: Re: [PATCH v5 56/60] target/riscv: floating-point scalar move
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-57-zhiwei_liu@c-sky.com>
 <8b9161d1-f64f-5677-70a7-ec197d9d3d43@linaro.org>
 <f09dfcee-3ac3-80f0-938f-30654d418605@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d90d6cb-ff65-5c63-d76d-dc375f9dc5bf@linaro.org>
Date: Tue, 17 Mar 2020 08:11:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f09dfcee-3ac3-80f0-938f-30654d418605@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Tue, 17 Mar 2020 15:11:42 -0000

On 3/16/20 11:01 PM, LIU Zhiwei wrote:
> Two questions here. I don't find the answer in the specification.
> 
> 1. Should  I check RVF if the instruction uses float register,  such as all
> float point instructions and some other instructions?

I would think so, but even the 0.8 spec isn't clear.


> 2. Should I check mstatus_fs if the instruction uses float registers, or just
> for instructions that write float point register?

Definitely, just like the regular fp instructions.

This trap is how the kernel implements lazy fp context switching, so if you
allow access to fp when disabled you may be accessing values from a different
process.


r~


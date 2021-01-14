Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzzPX-0001LO-TE
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 04:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzzPP-0001JJ-4Y; Thu, 14 Jan 2021 04:59:15 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzzPN-0003s9-Ls; Thu, 14 Jan 2021 04:59:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id w5so5085194wrm.11;
 Thu, 14 Jan 2021 01:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=keVhnryVt2H0asSKa5VEmd8Dk4m45NkmEqSQuwlm0Hk=;
 b=Ec182EYlUvHqVCC5r/6klxDDKMQK9pqFzKx2WrVyXmfK3GGNqEuAlw5v4S7JM6kR4z
 s5Gc8jixFWkv4O6v+UUhUCDZO6cZ5WIrbrzs/OVmHHfU0TflQM5QT/fB6o/z1/katOrP
 LArVewL6zQTn4SSFHDSUq54iIP6ouzUu+X9CN767JyClTSlA0dlrdmnTq9EcvN03KUWq
 iqaXHQBsCP+dLxAoQiXIHWztwLZYAnD034GGAJwPDIJoRGdyelV16h1HHg1GRjDHg0dh
 5vOmMAuO8dA+Ll8wExBP9kIxnzznARxLnvsBw6m6bsyVlOSkxzBafrVhW+rOTGeqG6V0
 qsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=keVhnryVt2H0asSKa5VEmd8Dk4m45NkmEqSQuwlm0Hk=;
 b=N8r6y2evqGH17REsEexjrwE1JUPS9+VfC7kzoBxlm5x7iR2S21mMiuUtmMY2BWi1MM
 oBPznvcWnxaiPGn/MapIc9jjvLyY8Secm6zbgG+CF5BuSgS25qZ7ArHeVlj0omV/0w3+
 03IJG41uvFODCNT83L1HVtyXN/os6sXV7AFeXPpOZYLsQT/wbKvC75AcoqOH/d5GWg7H
 J/NDoPW75p+RIxSdfahmKCM12NlGoGGt3Gfq+JJbpSTZ1TO3LRVHixMnqffcRe088dZi
 WFIHL4Pmrbl4/xCvqoyt5B/6avZ6RYoIZoNsregAOrJyzUIRDen6fPKgwiBjsPGRMB7Y
 ACFg==
X-Gm-Message-State: AOAM530jZYXmOmpqPCILpJRKoouvoVAq2k7mBWysRZhaKGl9+4hCZbuy
 qq2zwj7t6ZTQlg9Y0kIt/C8=
X-Google-Smtp-Source: ABdhPJxUMS5SGO/yUaYd3ZJf4skNUf5FqX0146FZ8+fXLNwuaFnu46DtLyZaaaMzsOwFmWQO6FP1Rg==
X-Received: by 2002:adf:ffc8:: with SMTP id x8mr7022867wrs.158.1610618347131; 
 Thu, 14 Jan 2021 01:59:07 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id 125sm7468040wmc.27.2021.01.14.01.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 01:59:06 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 3/6] tcg/ppc: Hoist common argument loads in
 tcg_out_op()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-riscv@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Miroslav Rezanina
 <mrezanin@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210113172459.2481060-1-f4bug@amsat.org>
 <20210113172459.2481060-4-f4bug@amsat.org>
 <bc9f392a-5b4d-899e-f34f-392a3c2b3379@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fb6ba745-e291-3a12-4fe9-53df0a433fbe@amsat.org>
Date: Thu, 14 Jan 2021 10:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bc9f392a-5b4d-899e-f34f-392a3c2b3379@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 14 Jan 2021 09:59:17 -0000

On 1/14/21 1:28 AM, Richard Henderson wrote:
> 
> Let's just drop the hoisting parts and only do the signature parts for now.
> I'd rather think of a way to split up this large function than waste time
> optimizing it.

Agreed :) Thanks!


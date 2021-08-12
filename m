Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mE2Y9-0001oG-A7
	for mharc-qemu-riscv@gnu.org; Thu, 12 Aug 2021 00:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE2Y7-0001nf-Ul
 for qemu-riscv@nongnu.org; Thu, 12 Aug 2021 00:42:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE2Y4-0000wq-T6
 for qemu-riscv@nongnu.org; Thu, 12 Aug 2021 00:42:35 -0400
Received: by mail-pj1-x1036.google.com with SMTP id nt11so7402595pjb.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Aug 2021 21:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ujN9ekONKJ3TXT9v5nk2PmyhOey3+5068fE2lXWoIzM=;
 b=BZgQRRtwUBEyVp54jDHKyJzWQFJk8si8rJ0oQrCV+olmwUJXWnqXjLuZlMs5RdEEhc
 yMntWYeb6yFNjlu24Pql6P0B8AIXChSnJGSsEdWG9yfCBwplLWD3Um0fgO9xyJO3Vu9P
 4a+P+IFjwptRUSbufBI02uCbNUwVlA9TkbdDMyV63DOEtDuOQxYsk7Bq2Dw/uMn6KEUg
 tY2J01ByKMj9EzTR6b1Xh7Xam28g1fWvqpTjpw4U+6gv1RxXwo2K1KERJ2kFqbploiaD
 BHClpG86l6L4iJnIuk3NxHlG7sEPhcFk/ak4S+uhyoohvMf5lb5Y0DvJawImYsW2xzoo
 6N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ujN9ekONKJ3TXT9v5nk2PmyhOey3+5068fE2lXWoIzM=;
 b=f8YgALE+da+CYj6HFnrNPww7owKJV4+h+JWuEdx4pAiDyBGi95tUwQ+FqugE3shY9A
 xHfXbog0ejJD9ySzrQ17+cJxTyFUzyVQ/mH/3/GNbpD4z72RrnTaP4AAzu1ZAREomnC0
 uIkx8JYZPUyWuITG3k2cCuXgdSZmGxkuWCbL/amlzgXuVPRPaq5cRldOoex8RU5xaXay
 bWCKy5bnTaw4YzgAENkvhmd0VxcTdNJGgoLV/GTrS7x4EDBQsp4rZpJvnfem0Xm3Nof1
 J78ttif36GB6YbT3ueRfxKqBu7z8iHJ/MECmF8Kpdlds5Flrh5zWXw562CJdOBwHTju0
 jXBw==
X-Gm-Message-State: AOAM532qd9NiEq6pb7RfzSR66RYsqbrQ21q17YoNa0/F23IViFh1SEYz
 KkuPjdvjJwAePFz7OimDNyVgUQ==
X-Google-Smtp-Source: ABdhPJxc3oF6rKenFF9kx5RR6V7QXfzgs7zbIWkGiZM5zQnuL1cUUddRPOanBrmFUhC3BGkdO2/Nuw==
X-Received: by 2002:a17:90a:ff94:: with SMTP id
 hf20mr2319308pjb.64.1628743351060; 
 Wed, 11 Aug 2021 21:42:31 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id f16sm1319759pfv.73.2021.08.11.21.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 21:42:28 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
 <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
 <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
 <15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org>
 <bbc67da3-3eef-6e57-8610-6b496f30b777@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6cbece33-7f92-0247-7efc-41b34b0b4d7d@linaro.org>
Date: Wed, 11 Aug 2021 18:42:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bbc67da3-3eef-6e57-8610-6b496f30b777@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 12 Aug 2021 04:42:36 -0000

On 8/11/21 12:40 PM, LIU Zhiwei wrote:
> If the software doesn't use the high part, who cares the really value in high part? Do you 
> know the benefit?  Thanks again.

I do not.

I simply presume that they already have the hardware, in the form of the addw instruction, 
etc.

The mistake, I think, was changing the definition of "add" in the first place, which 
required the addition of a different opcode "addw", which is then undefined for RV32. 
They should simply have had "addw" and "addq" as different opcodes that didn't change 
behaviour.  Etc.

But what's done is done.


r~


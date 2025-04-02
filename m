Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F79FC28B20
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 14:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tzz2J-0002Pe-GU; Wed, 02 Apr 2025 10:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzz2F-0002O5-9d
 for qemu-riscv@nongnu.org; Wed, 02 Apr 2025 10:25:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzz2C-0006bk-6n
 for qemu-riscv@nongnu.org; Wed, 02 Apr 2025 10:25:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so5197762f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 02 Apr 2025 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743603937; x=1744208737; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aVfP5vQagloycdbrJi94vMQgixg8z85JM0ycrLK/NEw=;
 b=ojFjgOJtBkaCwhR8mQ6FAkXkWzLLj8OXLVpnfX7oHVENyEfgKMP6OjFA9eklrGJBjB
 PoB1P70fshyHM6MiXISYKn8KUUZNCzYgLfGc+FtwgoKGAwJG/taOBIYyAw6bi9tY7nfU
 oEXY+CdzHAc5oAstFRFAAXqPgbNqxITAaW79NAdhHwZcjVdy5P/mRyS1Dare2j78XAED
 G9jh+UuioYJPyV+kRau6eAoAS/LRES0V395lCAv6SsdF9xldMa0jxJErB7naldSJOoJu
 O2vnNUwMISyKePVg+ojkA1jJ5uBVtGXo66XECgjpL6yvbTX2GFVcsB6OrNAi5q2hjwGR
 tOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743603937; x=1744208737;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aVfP5vQagloycdbrJi94vMQgixg8z85JM0ycrLK/NEw=;
 b=Awpv+ZJEnFgPihyCL5qtbeNQ2+ZwcnTOnZFM5oGh6Q/QhLPWn+cqf7iijTaXSNwKua
 H+VQ7Z+/0NlQin/mEsTiGAxX6QVnF5HbqWZnm/AHLjcARj2Gkamc/Bb9Zjxya3JvuSeL
 NQJLqyDKgZf6IWyalD59J7gdhNxYJjfzAv5fkDgqwki8AIA8q6hwer/15PxAKpyAXyj6
 5tj8CgRvD01W2pYu/2u2c6X9icw3wYV1nPNHWGnzkgjKbBn+9ouUM2ytWrx32ONdcSDQ
 DJU49oZKS7uDJwvbZquIQ0GYKUzqzSXt6LN9yGpMsLStyRvthsb3BaBnl9Ty8+6u/hm0
 kGZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8R+gJHggYiFi71dnvTNgngxNHh5z2V2VRhWS6kCkqiyfdGFJnYLqyHt/AFnA30Pwb7rAhQzT9WhAS@nongnu.org
X-Gm-Message-State: AOJu0YwD3xUPtm3yMDtA51CoPJkb0u9WdsUk1HyHfVfHi2njD/KmBgGe
 qrDJ83qW5oYry4TsXDUZzk+X9gBvyy9RZnHIiAla2FyoGdBEdNJL8wMFpLznDbQ=
X-Gm-Gg: ASbGnct8tmHuH2olsauwCY27ceqya1HLfyiBElThv9+YFkZZgJ255p3GVD9ptH/aA7Y
 p0UxubYLi3FC12SmPIfkPsfpplhGYjypFNadmz6luCl53pJgOBHENP3myXCf3Q3nvfAsz9+gBfQ
 Ed9/Ezd1xBrtfK2fxCgf6sPxKL1J3/jGCIaCZd1BmH9gD+hwk23Jg7s1SANCZoCCWmU3UfJu5Cd
 YwneHkssDRmfjVTiIWg4pxkqNE/SA1ta1KGRqo9CHGsnyaySXKWc0OJXZQqqmgAk2Rk8ogOgJdq
 Kfgn5kyDIbUgEm58ugUWkX6D4s9qUxdipgL9vFkBym1RY5MdHVsx4SfGXPQkgSlxKxCNvxaoy0V
 jP269X4JszfuLlABaV0qBigY=
X-Google-Smtp-Source: AGHT+IFxW5+8rD2QX8PIoO2bG/PGlri1/BUHwL28htfp/qXi8y4TuaW5IDpu8wotklfyI0LbO4/t3g==
X-Received: by 2002:a05:6000:480d:b0:391:4231:414 with SMTP id
 ffacd0b85a97d-39c297e3f85mr2048249f8f.40.1743603936692; 
 Wed, 02 Apr 2025 07:25:36 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b663860sm17340281f8f.39.2025.04.02.07.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 07:25:36 -0700 (PDT)
Message-ID: <43e170ad-d4e3-489d-a049-22361cd34f13@linaro.org>
Date: Wed, 2 Apr 2025 16:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 1/4] target/riscv: Restrict RV128 MTTCG check on
 system emulation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv <qemu-riscv@nongnu.org>
References: <20250321155925.96626-1-philmd@linaro.org>
 <20250321155925.96626-2-philmd@linaro.org>
 <2650b68f-e705-4994-9791-0bf8b2e01d74@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2650b68f-e705-4994-9791-0bf8b2e01d74@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 23/3/25 19:08, Richard Henderson wrote:
> On 3/21/25 08:59, Philippe Mathieu-Daudé wrote:
>> Multi-threaded TCG only concerns system emulation.
> 
> That's not really true.  User emulation simply has no option to
> run in a single-threaded context.
> 
> I really don't think we should allow RV128 in user-mode at all.
> Certainly not until there's a kernel abi for it.

It seems to be safe since commit 905b9fcde1f ("target/riscv: Replace
is_32bit with get_xl/get_xlen"):

  #ifdef TARGET_RISCV32
  #define get_xl(ctx)    MXL_RV32
  #elif defined(CONFIG_USER_ONLY)
  #define get_xl(ctx)    MXL_RV64
  #else
  #define get_xl(ctx)    ((ctx)->xl)
  #endif

Should we undefine MXL_RV128 on user-mode?


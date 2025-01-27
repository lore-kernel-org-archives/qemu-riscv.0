Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE7C0218A
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 21:12:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcWOs-0003Sp-Sb; Mon, 27 Jan 2025 16:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWOo-0003Ri-9c
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 16:12:02 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWOl-0000XM-LY
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 16:12:02 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-21634338cfdso9799795ad.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 13:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738012315; x=1738617115; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YHXrFO01udUWOdVZsXmElRITU+8+c7yUY0YpXp00ds8=;
 b=R+fqc4w3NxculqNWk714sebQ6oV0VVhVdGv+cpF3p8OdYzUpIzKfEO4U8ER/2LGVJW
 v68lQxMBEAUaB7JkCdZ2m+fY1zpgqUBaxYOSbWDaa8YXoS0gNBBgbESxZp8E2Hvr+OL+
 yC1WrfNxUm2UQ58RNcepIEYgV+aJ4NRDnwHAHOXA0VogmuzVEl1spcEWpqQYAZhgtElT
 6u0TYbzSeThEX5loNn9i85Aqtk+hmwPar3OoNBBbetOz3kWN0mJseNzFye7GnnT7qzAR
 ORkSnNK5M0jai+TmLN26pJuFzAwLD6EwlJ/Y+VASBVni5pED1faPojOmaR6o6xnQZmEx
 Wdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738012315; x=1738617115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YHXrFO01udUWOdVZsXmElRITU+8+c7yUY0YpXp00ds8=;
 b=tEtMoGnCST57yRdYM3+CC+XS8cLAcyHNFFNUGq1SOkqHTgZT6MoZfviQgy5JVS4A8N
 JvJ3EloQ9DX2/rIXRMPE+37Dkw4OeOqFwn5aCZOgPMl5/t91OfuqdaGHEl5QWQgNHhUc
 Yeeyanudz1BXHfm2nFjou94fTdxXTqNFUPWhACjjT02sXzJbcAXHQfz4un9uSpec2ySB
 c4xSubjySpDMf+JTyx3qqLmbFoe8e8nAdvkG4wPa3hPbN3aFXG9bgdobvRKrkIsWEFVM
 LbR1RuEhu0b1LrkGCoOB5dhveBX4m71o27BoHBFjwIR9Lfb11PJ6MkCTPDVifleuGBF+
 rLJw==
X-Gm-Message-State: AOJu0YxYmoQ7kU0TVSyvfy2WO46m2TSyEB4O9zwW4FbBl4nSDunMyM+d
 co0j11Kanyxuy5i7xdMIiv8ZqeO134JiEcELQQLd7kCnOcmkwV0qttGaztBf2Bs=
X-Gm-Gg: ASbGncsEpSOX/E3kmZAshphCW97mh4FsNXRVANWz9uAAS/3lH6Iymho83aP+7ycQFmC
 WOx/CAJ5qLYs2FUiTyrEA8l6dUaFtSCW7ssU4MKXO5DTQjauF5HJlJqJzfkO9R6mU8ODoxIoo7Y
 9C6kpvCwYL8glRukunj7pPbYjR9kYayeMYt7lYHba6AfCznJkawetOWM9T45GureE6LZ4q41XGg
 mIo0/KbafTsAI5PK+TY67YFaQpY2XvztBakOjOILu1wGtrp/EWEaNgZ49ymYpwfBZzaQSOH+GGO
 AyaMB5hyicCCqIweDmbHHINTt54WBaRlL0cbobqUfJYlIWs=
X-Google-Smtp-Source: AGHT+IHGO1zGdIUPwg3jAv2ILnL98KJweMQmI50V67myX89VUrjHdFT9Db799h0TJabmJmMeBmwAYQ==
X-Received: by 2002:a17:902:e546:b0:216:281f:820d with SMTP id
 d9443c01a7336-21c3553b6famr677739495ad.11.1738012315608; 
 Mon, 27 Jan 2025 13:11:55 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3ea3b3asm68426265ad.85.2025.01.27.13.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:11:55 -0800 (PST)
Message-ID: <44cb9946-c49e-4695-9ec2-7f3b415626eb@linaro.org>
Date: Mon, 27 Jan 2025 13:11:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] hw/avr/boot: Replace load_elf_ram_sym() ->
 load_elf_as()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
> load_elf_ram_sym() with load_rom=true, sym_cb=NULL is
> equivalent to load_elf_as(). Replace by the latter to
> simplify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/avr/boot.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


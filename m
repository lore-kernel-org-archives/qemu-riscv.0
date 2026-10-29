Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68212606A332
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 12:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rxbvcvWA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMP9t-0002Mm-Sl; Thu, 29 Oct 2026 08:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP9s-0002M5-DK
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 08:23:04 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP9p-00016x-Pu
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 08:23:04 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-70b875f6f13so1530598eaf.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793276580; x=1793881380; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y+y/ky5dwzEGW2bjtHs8iNoSQngyrtGr3W8HCpbUL7g=;
 b=rxbvcvWAwudSGg+iwm02kdl5JmJYHRlPwiUgdGzW52UdZSBjGt/AtHdBh5pdu6LlFg
 WJmB+a5z+xIS+5pLTPkSWm/43S2o8iYtulIYZnSawaowBIkyi4J6nTUaw015CZ3UVygk
 ukXz70hFCaXJi92Z3edkwRNbDqebiL/SmCN3/JUzrR2CDgdHElCduGvxBj2TT7dMQX0Q
 cXl081XLxGGIuXE95br42nnBtuk4CLY8E9rcmGtTwSnFYOdX0TvJvw5VhbqFeV7Aoecw
 uMZOj+zZXjvNlagVhdW3y6ZyELxz+UhKQeqMt9umi47Y51r3yuXiBajP4QZ3oeiRo2CX
 q9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793276580; x=1793881380;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y+y/ky5dwzEGW2bjtHs8iNoSQngyrtGr3W8HCpbUL7g=;
 b=h3l1gbW6yueta5ZYO4pHpnw1qs5N9XP9E/UzURh/WKO/LNyJr/WPWmdBYIKmVA8OY1
 oFaAYSnBOh8XYaPQl6I3um+ODOeP9x8fnc9EjEacynJtM+sHARvYulWdh7F0qR0cJ5et
 Emc9gg6sEs8VZwDi+odlUbV9VD2lNOkUrOGRAex1S3+DUQ/X+c7lsPnevToi863wPH6f
 UUAEgq6Ib9lIzWU8/YfvZeBr3syUEdK+aF5Eid4ldiZSxmIlwYhgKbwGS3xTQEYEN5Ct
 GepuSM/fxks4g1gXY7jEqUjfOWlwkp03CVHW82KUAKh3Xs009CjoQk/NELAAd5mC2nLU
 NnDQ==
X-Gm-Message-State: AFq9FYL3ZRuW7Mt7S2CxP5sUtGBxF9RHhvBTcZ7xR9ebI4dQ4lKIY35u
 4+VI6OvafxBkjXdoNIxIVIwOearkfClZxvlLtabuvNGreYEcQRjfoDf7qigeI+j0QY4=
X-Gm-Gg: AYBFou2UiyhMqB5FqRQDi2qlwcUcUZY63RZ7GAw1MW9pEWtZgu7Wyw7aMIGgpGZZPLt
 qKCgbu5BJBp8CeBeAa/RbFxZCbm5/SWpgEt6EtFOe8+VbZSejX+pIf7Y9wK/aIkXVej3aLOrgmx
 Co5XmFFGindn3BsGMKsVBlk54AD5swjy0KUGTpNP4vdWJF8xL8ELSymQQoLB9YVymhvJMVxyHR3
 44ABYXDJDem6YcyTGUunDnr7vgXEv5Td2mD2ww+aJXP5+QnpWbSUNE58ErXlmuH89tilFVvgu2J
 fwpqPzMHSzq5Eky8yfAchcwHKhneOA+Gvkhn2kXNKD9jOkG6UE8VVtqj/tk4MVxbEhbdSIF4/0W
 3q6p1dN2i8SlNrz6cRUJ3pO10HG/PwaOOiEAfcWgS6bVXFengZBhZzXyMz+1E2waXdMmRjM5E4U
 6tHBoQkI/uW9hN+KOwviN4iiLsUNhzxnq/PHG8nZPlnLFow71xpUfsKqBmc1s19tISOqU4UhXRa
 LoadMhEs5QN+7VP5qrE0+OI/s5UCbJmWABsxkKL2XBEsskhoQE7cIKjUTiD7hLB8VWuVlUb3Qua
 n5vJ4p4CHCFgl0dPEWiw7L5rEF5KP7c8VZ13fNh2ib3EU7FLrTyv3zfohrZ0Hm3k7Q==
X-Received: by 2002:a05:6820:f00b:b0:6e0:fb60:d5c1 with SMTP id
 006d021491bc7-713eef427a9mr3000823eaf.11.1793276580204; 
 Thu, 29 Oct 2026 05:23:00 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a8b77abffcsm4949251fac.4.2026.10.29.05.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 05:22:59 -0700 (PDT)
Message-ID: <261d3c31-e08f-4bb4-99a6-cdb01cdc5171@linaro.org>
Date: Thu, 29 Oct 2026 07:22:57 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] tests/tcg/aarch64: Add vector immediate regression
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-7-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261028143330.6518-7-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 09:33, Philippe Mathieu-Daudé wrote:
> Run SVE/AdvSIMD immediate operations after an operation
> of another element size, at every SVE vector length,
> against scalar references.
> 
> Catches backends encoding the replicated constant or
> using a stale element size, as tcg/riscv64 did.
> 
> AI-used-for: Regression tests
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   tests/tcg/aarch64/sve-vec-imm.c | 233 ++++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/meson.build   |   1 +
>   2 files changed, 234 insertions(+)
>   create mode 100644 tests/tcg/aarch64/sve-vec-imm.c

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~


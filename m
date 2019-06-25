Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfnXh-0004sz-Kz
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 11:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34938)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hfnXe-0004o5-Bg
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 11:39:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hfnXc-00016C-Cq
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 11:39:30 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hfnXa-000139-KL
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 11:39:28 -0400
Received: by mail-wr1-x443.google.com with SMTP id v14so18429030wrr.4
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 08:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lCDJTC6WA+l8tBCmzLMSHsK4MkvDe8DwdEoZdZKwBkE=;
 b=pizo1+BFwkEzlbY2wkUShLk7cWZqWy1pYEPGkNzPlEaGgcx6BmbbeXjgg7/R5x2H4R
 XNu6QoFA3DwhzH308t9eEwlNZWWAVvnsdfuP1pHRJk6a09LxPW6hYKxe+uaDRD8MXaeK
 2dG57RUueET6MgQS/pGUeTcZhSuueXUX87lgZYu+0Av4mvZ/lFhiEyJK7KdIRomCJpp9
 //0xws3MQH4vzABBGptkCdmbHFRf/tW0GjYp8JJKicF6sVCHoIITMjEbCuzW4SbT0ooA
 N/50xtbEEC6X1OYBZDIy5aUjT5xfA6+f9xfBi3vHMZ6X1bPvE1g5W1l361HbZJ2rDc8Q
 bzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lCDJTC6WA+l8tBCmzLMSHsK4MkvDe8DwdEoZdZKwBkE=;
 b=IzZ/gE0fE+IKLf+NioVOgABCQDigEvXlIRpoliocM0koLmlKfTwoTPFDSVBilRfZOZ
 yna+T8wFVWa/fjJSYew49y9jjAi6UhhHjUWkGYlVbHJDO/irobBRi/OZtlbzi4INMXCl
 kaefLZsOKOwk6qVfU9AnwkvHDmDUCbOdKgLzNewFlPzckBVdAdPeRNap2nnAWHOvq4jD
 5F9VSvMhvCpoAaKZdAvq9J9j25Uq7xLOwrnTIzwbHs+fkBTCVyJTw0FjY8oE5gbNkGqv
 D9rwpdvf4RteeS6UUdBjDfyRihGg74o6QWw1r0A7nv09gjwplhsUfIn8P6MPECksd7xi
 irlA==
X-Gm-Message-State: APjAAAVHP2t3DvQMwV9hOsBaQA055tqkWBkZZj0eXl5GDenGX1FPSBC1
 ICe/uTxXoDZ0VWDutpy8VyZQpg==
X-Google-Smtp-Source: APXvYqyat9rGILno5raa15hBSeamTMcNmvl24nhZYjbFdI6cvKCYhH/HuBo/Euu9J3tFtW8O+wDKOQ==
X-Received: by 2002:adf:fbc7:: with SMTP id d7mr7961685wrs.224.1561477163765; 
 Tue, 25 Jun 2019 08:39:23 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id x3sm15194507wrp.78.2019.06.25.08.39.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 08:39:23 -0700 (PDT)
To: Joel Sing <joel@sing.id.au>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, me@carlosedp.com,
 palmer@sifive.com, Alistair.Francis@wdc.com, marco@decred.org
References: <20190616191900.GH61734@hippo.sing.id.au>
 <41ef5fbf-f438-e60a-2fba-a72e3ad422f9@linaro.org>
 <20190624180837.GM61734@hippo.sing.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8ec410f8-d2a0-69ef-e3b7-925ef09717df@linaro.org>
Date: Tue, 25 Jun 2019 17:39:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624180837.GM61734@hippo.sing.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] atomic failures on
 qemu-system-riscv64
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
X-List-Received-Date: Tue, 25 Jun 2019 15:39:32 -0000

On 6/24/19 8:08 PM, Joel Sing wrote:
> From 8ef31a2ce8ef1cbeee92995a0b2994f480e9bb6d Mon Sep 17 00:00:00 2001
> From: Joel Sing <joel@sing.id.au>
> Date: Tue, 25 Jun 2019 02:44:24 +1000
> Subject: [PATCH] Clear load reservations on qemu riscv target
> 
> This prevents a load reservation from being placed in one context/process,
> then being used in another, resulting in an SC succeeding incorrectly and
> breaking atomics.
> 
> Signed-off-by: Joel Sing <joel@sing.id.au>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    /* Clear the load reservation - otherwise a reservation placed in one

Excepting this line, which will fail checkpatch.pl.
Needs to be formatted as

    /*
     * Clear the load...


r~


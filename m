Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyJ2h-0001Zo-Hl
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 14:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyJ2g-0001Wl-0E
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 14:00:34 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyJ2e-0002YG-0f
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 14:00:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id md7so1809046pjb.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5n2fCFqddpQ+teBXgKuSxKVIND558u1pltuSIXE1Cpw=;
 b=v1wdUZAfB5aJI68f/JvMtz/fG3lpLMdmB4sWqm3dA6i2O/2uNm00w76Btux9GQqOki
 gyvPfaZY0EflfyzxK6p1Bb/CkBqHntka4GYhFyoF+fPWum4/P/ex8Ums/1rtLie1h6Vm
 7zqM8/g/rGaqyOK0ceAh88TNm6APzOhZYa8hkJ5HFm9BMPrUhgsAwOwFPe4FXXWJWqr+
 lJAmTyiJrz33fvnTDssDMUTwJWO+Q4F092X+HWySEQzcgxemTsU+pspG8uMcWEOG8oSo
 XZZwUF3K8L3QEmLzQg+h377Vp6lPfNHGbrx7tjXqBv6xan1M6ElZEDPE55Z5RU2/nDR4
 GRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5n2fCFqddpQ+teBXgKuSxKVIND558u1pltuSIXE1Cpw=;
 b=RC6xP34XeV+f0ALQAWg10d5qJ0AB4IasMR9MmyPFkVwFcSoUoh4XbSYFMwuLaMKpV+
 trpiJBsV+IvG4q/120LhfTx+lY/+RFqZ+Fdcq6xNh6j7wg4SrI4JhsnfPZAgRIz4XrP+
 7rmWBpzxru4ufl599TgVQvCE7Y3thOYDj77xIa46wDOymXbFJ9vCKiiGrQ9sKYMmeTH9
 9sFNNUsGQ0lToV20TE2Ws//AyEPI9IylKcSa6QTOleOA7lVxgUFEmovlwo0/YojMFq9j
 t5q+fs9NxoXQWUIWdB/VXKliurbeyVuk+RXAKQ15dVtI3TFd1hC5meZ4JvdlAn3rvrEl
 r+hg==
X-Gm-Message-State: AOAM5326p8PQo0PsTkr2BV+xxrzqL13n4GZVGlLuP45SaB0tP+MDxzU0
 gKeCyjP4s6F2M8u3mdGfyG6Iww==
X-Google-Smtp-Source: ABdhPJxYCdeT/WMIz458kfVHPLhyQHkDZQArmYpeW8U1towrVbYODQmAGY452od3A3kONhg4CIBezQ==
X-Received: by 2002:a17:90a:db0b:: with SMTP id
 g11mr552552pjv.11.1595440829447; 
 Wed, 22 Jul 2020 11:00:29 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 w18sm256605pgj.31.2020.07.22.11.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 11:00:28 -0700 (PDT)
Subject: Re: [RFC v2 16/76] target/riscv: rvv-0.9: add VMA and VTA
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-17-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05c8267d-f22b-6714-8806-92edf228091e@linaro.org>
Date: Wed, 22 Jul 2020 11:00:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-17-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 18:00:34 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> -static void vext_clear(void *tail, uint32_t cnt, uint32_t tot)
> +static void vext_clear(void *tail, uint32_t vta, uint32_t cnt, uint32_t tot)
>  {
> +    if (vta == 0) {
> +        /* tail element undisturbed */
> +        return;
> +    }
> +
>      /*
> +     * Tail element agnostic.
>       * Split the remaining range to two parts.
>       * The first part is in the last uint64_t unit.
>       * The second part start from the next uint64_t unit.
> @@ -152,41 +168,50 @@ static void vext_clear(void *tail, uint32_t cnt, uint32_t tot)
>      if (cnt % 8) {
>          part1 = 8 - (cnt % 8);
>          part2 = tot - cnt - part1;
> -        memset((void *)((uintptr_t)tail & ~(7ULL)), 0, part1);
> -        memset((void *)(((uintptr_t)tail + 8) & ~(7ULL)), 0, part2);
> +        memset((void *)((uintptr_t)tail & ~(7ULL)), 1, part1);
> +        memset((void *)(((uintptr_t)tail + 8) & ~(7ULL)), 1, part2);
>      } else {
> -        memset(tail, 0, part2);
> +        memset(tail, 1, part2);
>      }
>  }

"1s" surely means all bits set to 1, not each byte to 1.

Is there any reason to do anything with VTA/VMA at all?  One alternative for
"agnostic" is to leave the values undisturbed.  So the quickest thing for qemu
to do is remove all of this code.  Then we don't have to pass the values in
translate either.

Which is exactly what is recommended in the 4th paragraph of the notes
following the VTA/VMA description.


r~


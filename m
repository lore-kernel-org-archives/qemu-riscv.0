Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGiUi-00026P-I3
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 10:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGiUg-00021i-GN
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 10:58:38 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGiUd-0000fm-R7
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 10:58:37 -0400
Received: by mail-pf1-x429.google.com with SMTP id e16so16319995pfm.11
 for <qemu-riscv@nongnu.org>; Wed, 27 Jul 2022 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PzovVKseVB9JC32aLD9B1lGdna4ZydVFC2xGT4if9WY=;
 b=aEoIVqPpgp+VodQfiMNn4BEJ5FgRGLm/iIhUVabkCbKZla/1QbIFM9D/4eBZqyFLLb
 vcaxxh9ZX8BAw8nVr9IeSqVLJ1pdgtqI1W1oWCtskmxsLf4ek69GhysUmCQj4Nowb5xe
 NfsdfK/J5nEJ+wZQ7ZGCGFYFBId92VfJXz0j0WNCkHgty6U/gEjzuGwLhQZXkUBLmwv1
 gnSbNtrQBJy4E+mKR4gtavPrIfyOw+lyzjMyaCY0glN8QYwWf8c0Rs9eHlKHWqerjaeS
 EydJ+ALdjwBCY+dTgGsaGJyynouVty6qoHbD3kzeJTynGrxypH4g7iXx+7CJUdgeYAkN
 S3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PzovVKseVB9JC32aLD9B1lGdna4ZydVFC2xGT4if9WY=;
 b=poBtPvzVO/V0gqNNEC9cmsdJ2i7XEq6rIRaKL2HIFwsoWpQRD7il+doEJd/KqPiyKJ
 hzIcKbgS3c3K1vFpW+9FmLAaLHxs9/dFVZ8hQxXjptBgE4bx6LTE1ibdUWNf1w1IKiWA
 SgZ5QSXV9BC/3v5OffGOMetwSXtOObIJ0EZYQi6ERkOIvmeQ2yeXqSNPL8g4vbmIpApv
 qJqLJvt0wQftxCG05nvUxw/G95GoB5kcXckZYW4C/N3SEl/g/fC7hdL4W6n8jRUqJxXF
 G5iHqdxVNf+Bo1BjShStgzk1h9UhSoFUAuYgHlQaPLXpWC/1WOPX56cnRAU20Z7prYI9
 b6NA==
X-Gm-Message-State: AJIora9NGVE/rdDTrOHPORS0++6di0Vt/K3prDmXC79V9RzjnwLYB8F0
 Ukiq4Ero+CZxsuML2YrrLanWyw==
X-Google-Smtp-Source: AGRyM1uSUXIGfAmQAE3Qp3/U9JoLHZqSTA9sAltl4lFhKaZkBODfDw0Su1BjA9KzRoIq9TvvTUVXRw==
X-Received: by 2002:a63:6e81:0:b0:419:f7b1:4b12 with SMTP id
 j123-20020a636e81000000b00419f7b14b12mr19115137pgc.406.1658933913824; 
 Wed, 27 Jul 2022 07:58:33 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:e03e:8ef4:1b74:a7ff?
 ([2602:ae:1549:801:e03e:8ef4:1b74:a7ff])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a17090311ce00b0016a4db13429sm14212274plh.192.2022.07.27.07.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 07:58:33 -0700 (PDT)
Message-ID: <077c6111-6b1f-bc36-9ada-7e00f672fd53@linaro.org>
Date: Wed, 27 Jul 2022 07:58:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/riscv: Ensure opcode is saved for every instruction
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20220727032524.101280-1-apatel@ventanamicro.com>
 <ae29e548-c3a6-dca1-81aa-68c4cad27384@linaro.org>
 <CAK9=C2Ut-_6_ARpVFKcjeLgau2eqUL5Cbu3FD96hZ-EFD7RC5Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAK9=C2Ut-_6_ARpVFKcjeLgau2eqUL5Cbu3FD96hZ-EFD7RC5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 14:58:38 -0000

On 7/26/22 21:06, Anup Patel wrote:
> I see that decode_save_opc() only saves opcode in an array
> through tcg_set_insn_start_param(). Which brings me to the
> question about how much are we saving by distributing
> decode_save_opc() calls ?

It's not about tcg_set_insn_start_param(), but later when it is stored into the 
TranslationBlock -- see encode_search() in accel/tcg/translate-all.c.

> If we distribute decode_save_opc() calls then the code becomes
> fragile for future changes and we will miss adding decode_save_opc()
> for some new extensions.

Perhaps the several percentage points of data savings are not significant enough to worry 
about.


r~


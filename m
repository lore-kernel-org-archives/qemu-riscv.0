Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1S1X-0000Xi-Mp
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 08:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1S1V-0000RJ-1P; Wed, 15 Jun 2022 08:21:26 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1S1T-0001v0-HL; Wed, 15 Jun 2022 08:21:24 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 15so8539905qki.6;
 Wed, 15 Jun 2022 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/mC4dFkFJN8U8JgPcv6AeeLTo+nEJy3q0aK8CSDXtKk=;
 b=IAw+0uKrInO+TrBSVySXJwiQe77Hbt+3Ld+hwJZ5Kk4T0wAe6IGymaRg/Rzjg4qxEb
 KuJMmDZy7ItZpupTCwI5NzVOSUEqupBnFIamGpySPiXtSxNrC7b7uVqdlf6PR5iuhL9q
 RXXxfFzq8x+5Rg9B0jfxGNT6tjDdZtwoVKRajWyqFJFqTozLxYZEHvvRb1fX/tY4OTtJ
 k1/xGoiuyk5ltmWpdW5c0kwQJZdi2Mr90txKcORP34E9oe9uHXb0jVkCXRQYxnHowVIc
 +I+nTyJ2sMf+iRc0JekGK8KjGQQKWUnoNSaf29bKSNlWcUaQJObGr43Tsxxso8Om46fD
 eUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/mC4dFkFJN8U8JgPcv6AeeLTo+nEJy3q0aK8CSDXtKk=;
 b=SvJIr4KBUIlkShfFBCXIUgQtbQp+AnaqQf6NDSQAb2IDzxTF1p1CMXBeVpxmvPkmwN
 VRQwu5oLGL1J2fO5dRPulnOm8TPoGp5UZFJln+2mf/4mAADTT3sXNr4zFZgZJOdJNalx
 XXJa53gqZuMmDiYasDM1ftbfGDQwKzmNtDOgEnnC+LixANAta4LMy4VaGEc64sUsJu/z
 s90nV6sQ5EQfQpip/yn+29xe+eBP9yb+YzIu6fP2yrcbQ8bUeYfyCWWYe5IRbMXDhlRM
 EvQySRYFLITbdPL4pZOJgkfqpsCaJ2j2pEg5HjzRnIj5PS77Mn0hFae1w8aC1ZsPduur
 KZVQ==
X-Gm-Message-State: AOAM531XfmP8TqOuwZM1+y+BFaKnyOlZyGODlycoU4FXYM2ChFuhRtlJ
 S6hoLZtmKkwZBPg3jvqS8KWCxbUTPzlwQJeWXC+Bpdk2Klc=
X-Google-Smtp-Source: ABdhPJz9m5EVxxzFzM5glMzujU8q56guToAw2EdPJ34hbSYHWtlxy9RYoVPZCelRBO2YwdKaEV40OryzZ7DERpkYkHg=
X-Received: by 2002:a05:620a:13a2:b0:6a6:f149:6d82 with SMTP id
 m2-20020a05620a13a200b006a6f1496d82mr7906995qki.342.1655295682130; Wed, 15
 Jun 2022 05:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220610051328.7078-1-frank.chang@sifive.com>
 <20220610051328.7078-5-frank.chang@sifive.com>
In-Reply-To: <20220610051328.7078-5-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 20:21:10 +0800
Message-ID: <CAEUhbmW_WDuxiRG1mb2MhXE2A0==2oP209AAwsHV7GMFkCTsGw@mail.gmail.com>
Subject: Re: [PATCH 4/9] target/riscv: debug: Restrict the range of tselect
 value can be written
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 15 Jun 2022 12:21:26 -0000

On Fri, Jun 10, 2022 at 1:14 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> The value of tselect CSR can be written should be limited within the
> range of supported triggers number.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/debug.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mFu0P-0003fY-Mo
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 03:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mFu0O-0003f1-FE; Tue, 17 Aug 2021 03:59:28 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mFu0N-0006vu-11; Tue, 17 Aug 2021 03:59:28 -0400
Received: by mail-yb1-xb35.google.com with SMTP id z18so37862482ybg.8;
 Tue, 17 Aug 2021 00:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bJ6W95dmT060zYltV4yuPKUtPgtgDeDIbDrK09w8OpE=;
 b=uj+V+mdiXKA/LwXEuWDTsTmg37s4P8wUNx50f8hwpcFyd5LzqWrnFo9CEDJFb/Cro6
 ecI1461t8VO7eid+fSIXcZVWwgC236L/JO1z7nvU+Z49uHF81mTpsAScByVftI0/0xpY
 tbp6z/d0eomI10dd0QyVj5V+F/OerHkwYaadHnGElVUo61VGVGr/9g3tl3ubzlrSLBFK
 sc5F4/BlE9NME6w+N3Kbavz5hv8+Nx+hS/6Z1O6URzE51t8CVp91xaGX+5lVJ6eN1A0f
 aHioJHedGt+p93JKjU4u9qn3CGm+kaE8ZuTc7SajZgGAj2Dd58NCdwzXQGWdh+EEQDv1
 A/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bJ6W95dmT060zYltV4yuPKUtPgtgDeDIbDrK09w8OpE=;
 b=k7QccekjTHwoBef99nWM0wLUVNLB8Ld154vNWAHYDispdSnX8CM9J+Wt/Ra4mr7TCY
 qjSRD1VDkkWxem7r+NyD6OUgM+4Tz+f0t89HYH/z7Y5w5jPKfPnoXn6++uT4IHFqszcw
 IblJ7BdEo8ID3oRBFNQWJprR1udu+hc2E9tpoAekoAz2dHd3oCr1dXSVVkhEHaXmkDyx
 Wcj65NSGncYCyBlM0qq3HPbaBLnWV0Zm0Jd+3PHRSP3AsmPPex7+D27uchUt9THTnSuh
 1aOTxqSErczY8UjqDSqlpuk6wXdMCFaxjG4gxDG5FOfHh/6F/4eVUkWBkyNgsk+BZok7
 UaRQ==
X-Gm-Message-State: AOAM531D3nJfzIKfgZDTutrqOGTTw3vbyN5d14oNsCeuz68C/xi06WWf
 mdjx6K/NetsJmrm1TvwQV8CJ4auik4+6GXpvnUo=
X-Google-Smtp-Source: ABdhPJwVjV4mmygLjLlO0UiLlhciQK2qf1ubeDMYlFvNTA26zXb+aUXy80DjVXljNnwtpZNzCj7wvsLcDf3poTU/8rc=
X-Received: by 2002:a25:2646:: with SMTP id m67mr2847478ybm.122.1629187165804; 
 Tue, 17 Aug 2021 00:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210816183655.18492-1-david@salt-inc.org>
In-Reply-To: <20210816183655.18492-1-david@salt-inc.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 17 Aug 2021 15:59:13 +0800
Message-ID: <CAEUhbmUKRD3quokpurMPBhfuONu=DRBcL29WLUPQu6fy0iiM1A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/intc/sifive_clint: Fix overflow in
 sifive_clint_write_timecmp()
To: David Hoppenbrouwers <david@salt-inc.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 17 Aug 2021 07:59:28 -0000

On Tue, Aug 17, 2021 at 2:38 AM David Hoppenbrouwers <david@salt-inc.org> wrote:
>
> `next` is an `uint64_t` value, but `timer_mod` takes an `int64_t`. This
> resulted in high values such as `UINT64_MAX` being converted to `-1`,
> which caused an immediate timer interrupt.
>
> By limiting `next` to `INT64_MAX` no overflow will happen while the
> timer will still be effectively set to "infinitely" far in the future.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/493
> Signed-off-by: David Hoppenbrouwers <david@salt-inc.org>
> ---
> I wrongly used `MAX` instead of `MIN`. I've amended the patch.
>
>  hw/intc/sifive_clint.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


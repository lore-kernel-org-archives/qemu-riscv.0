Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMoFy-0003zx-Sh
	for mharc-qemu-riscv@gnu.org; Sat, 13 Aug 2022 06:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMoFx-0003yZ-2U
 for qemu-riscv@nongnu.org; Sat, 13 Aug 2022 06:20:37 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:38804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMoFv-0000HL-JZ
 for qemu-riscv@nongnu.org; Sat, 13 Aug 2022 06:20:36 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31f41584236so30098057b3.5
 for <qemu-riscv@nongnu.org>; Sat, 13 Aug 2022 03:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=EHvhqbBto4j/Ck4brw7fMdYJaRhkdjcB+fQKD9pzJsY=;
 b=mSerJvHvxyeuxM92p7OlLVmS0piQrQ3CXvZO8IuwW1VWEds2xiTsdxguKYctP+OjWQ
 uLHVkcqJG2At2hIAIjDh9j4MfmH8DvBUfhyP+YNdEtIFW4mRdQ6ouHBBAvwteru/VpOJ
 7m+/FeJ8iY42krBlLqSgM3/J7/3ItfeRuV1MNG8v2OR8S9BpGNH4Pct6Udi8OleG52oD
 g7QjFnoojSepiqa4REIMu0a25ZsF2l4myXLncwj1v5aUsDaN8AXR+4YodTCxaNLS6Idd
 JP1bKgusNC00IeletaMH3L725YOlyFBjM6bJC7hR4hX/lkXBk4GTJsbMaGov2NR3tWtI
 HDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=EHvhqbBto4j/Ck4brw7fMdYJaRhkdjcB+fQKD9pzJsY=;
 b=VAPiKnWTlqFDKDf4xX5JM7cQHTGfwLp9155yv9kxb1JgAR0CT5KY8cBtWuHh92RyGK
 ApOTXZ8JzNh3/QGcKCUy91RkWnTgzJX3eIOFZDzreNfuLf8kOzPnPDrESLlkb58qge5o
 KJISDICJ0KxL+j4D3NhOaMh0lkIqCJk3jdAMd/5kxVsTki4Y6kLtO3ZdgQkwxWbvYzBq
 eWUmisTxI6zWrAVQpqsMdBPwOxxz9tzyFYRjZxHX9knI9Kn1FsRhJbPT9/isWtfBb7l7
 5Js0u4j7A5ViKTNYtYr/sspw6zOyv1BOOOsdlG0Srg6VoFkzaZO7FUJqyg5Mb/trDpW0
 l55g==
X-Gm-Message-State: ACgBeo0bin+h6F3RU0k6Mu/qoAzAIe7wuPrqxOvGdh1HIp3brkRvmEme
 ffiasXnpK1mUDBNM9kKRxMvr4v3xqa0wy7KkcRjTWQ==
X-Google-Smtp-Source: AA6agR6bwJJe10++q0pR06AX5vhqFwOUqFmZitdC9flcPLfoC3oFn7Ttwj4BOoBcjc5xfqVycHpQ1prz4wgxw9m3XDo=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr6873774ywb.257.1660386033788; Sat, 13 Aug
 2022 03:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
 <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
 <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
 <CA+tJHD6gNrtcrZ9bkDet8NuiR8mcSQfeN-Rk3dtm3LmeakKnvQ@mail.gmail.com>
In-Reply-To: <CA+tJHD6gNrtcrZ9bkDet8NuiR8mcSQfeN-Rk3dtm3LmeakKnvQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 11:19:52 +0100
Message-ID: <CAFEAcA--QMVgw0ZH6S3=jHsazM-AJQX45Hm+aJ+EhDhDrzNubA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Furquan Shaikh <furquan@rivosinc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sat, 13 Aug 2022 10:20:37 -0000

On Sat, 13 Aug 2022 at 01:53, Furquan Shaikh <furquan@rivosinc.com> wrote:
> I ran into a problem when I was testing a project (with a microkernel
> in M-mode and tasks in U-mode) that uses semihosting for debugging.
> The semihosting worked fine for M-mode but not in U-mode. As I started
> digging into this, I realized that this is because qemu restricts
> semihosting to only M and S modes.

Right. We should fix this by having a generic works-for-all-architectures
semihosting config knob, because this is not a riscv specific problem,
and we already have issues with different target architectures
developing their own solutions to things.

I'll see if I can dig out the half-done patchset I had for this.

thanks
-- PMM


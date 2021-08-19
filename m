Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGY1m-0003mv-A7
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 22:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGY1i-0003kw-Pe; Wed, 18 Aug 2021 22:43:33 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGY1h-0005V6-Gf; Wed, 18 Aug 2021 22:43:30 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id m193so9386717ybf.9;
 Wed, 18 Aug 2021 19:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V/Hd/2luIo1ePCEqTRWUmoBaJZrWz0Sx/UZ1WB+1go4=;
 b=RSZ+USof3LL7kYyAfqKyrju5PRstyrAFynXJ9Xafkat3vdo97sw+mcr7ISSZPtE8mq
 J+HVg3qGX3oi5CQtbD8AzWefMW8tvxlc/hbrOhcKqPTheNvO7IfValh+mV98rJLUQnhv
 vVR+XXRRpiHPW5JLShNQRHvFu929/qRfPOf7fXmiXwV1dRpQySjG3bigSVSnSWrpoIpR
 jqb1HOoIGAwFqlSw58yo6wYlcna1NZfQMF+uuMsIs6FoZo7WuvlWSYY0DokNuhb5x8mA
 rwomIX53OPFuEU84JN+t9LfgZzz/kcjAkdcnlAWeqef9gWvzjVaLYMER3HuBOxlBf8DS
 29zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V/Hd/2luIo1ePCEqTRWUmoBaJZrWz0Sx/UZ1WB+1go4=;
 b=swV2MYAW5zQg8wO+oc6lMcAldA2eLuRu23vWoVztlJj1Ry1JzeQZGjBvA5HErlD0cF
 Zddzb7W8Xqw1ZsCTzOanJY7qxtxk8G54bt1hz9TEbEZhF595juBhh5m/byj08prMrVun
 qsyhIZv7Ize2yPvNzMWYmyEHtZinNpSqOgT0em5SYLreUguRLqAsREoFveGFXxbbmnsu
 GibhiuYkWGxcZ2v2gLCscMuaI6mYhagUmQMMTBaH0BbH7ZTvsR+4yBenCDMnHY4UoHrt
 fbRNDmsnMWoO2E8ZESwvua48N+bsJRseayEQlgw+UvtBl1qKCecShzAPwANSCXfJiUjb
 gmCA==
X-Gm-Message-State: AOAM531OaJcukxfhrXrlvuw9UvN0almDOOhWhNNyovDXhFOEph67jxg1
 PfZZiwBpVHePMD7X9rAuJA0UDas05OblqIWEw5c=
X-Google-Smtp-Source: ABdhPJwAc+H+TFKzJRRyCP+mIDn24pvgOtVXkWp3uKX1iI11H4WeY4Mdc8FZ82+neWS6rPW1pD8QtYV7c8dF2HTvdRI=
X-Received: by 2002:a25:2646:: with SMTP id m67mr15311803ybm.122.1629341007765; 
 Wed, 18 Aug 2021 19:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-7-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-7-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 10:43:16 +0800
Message-ID: <CAEUhbmXwgsmnD+x_E4fBwycH_BzOsMLv0KZkOBhpDG9S-tO_bQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/21] target/riscv: Remove gen_arith_div*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 02:43:33 -0000

On Wed, Aug 18, 2021 at 5:20 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use ctx->w and the enhanced gen_arith function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 42 -------------------------
>  target/riscv/insn_trans/trans_rvm.c.inc | 16 +++++-----
>  2 files changed, 8 insertions(+), 50 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os4g8-00040D-Ql
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 11:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1os4g0-0003yb-Nu
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 11:08:45 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1os4fw-0006qF-OD
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 11:08:43 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so10229186pjs.4
 for <qemu-riscv@nongnu.org>; Mon, 07 Nov 2022 08:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oKTyNf0hulrdI9MhJjylaUZHswoIVZvqvxXF6/Tspcc=;
 b=to+7NjBq5148e7sR68PUnrPVYUq3fI6RDfDou8WrkfWrz/9M8fJ3Z+u1poO/8iWVCf
 /wrIKJccuA3L4A5bxanqjaIVWtTSQIGniF4/Mr8KgQvbsEFHAgMk8BkbhMIwfFFwpaBc
 tgfG1eEZZ6TYSH49dhnsnMsgLZyR8nFoLReCMC3KkhxAoAionedPuUCzz7iqKfB0hCpM
 yS8AFkQh3T9VA138AQi9lOkp+rJYSTkbGK0TrpmhPMQVp7Id42vekLe2I6BNLAZFEjWH
 WSKaHnzVlk7IBOyGi39lM2DR3nJM5cHluMBbVLM1N+EzUXk+ogsFqjciPVBYI8rytY9m
 3TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oKTyNf0hulrdI9MhJjylaUZHswoIVZvqvxXF6/Tspcc=;
 b=yrWzis8W1NzWFIYzGXO4vo4bV8RR9LUk90bCUgUQ92SkYgx8yzj5fXEqIel7A+sHhb
 cCsJt7L8ZJxsIA0UhX3+txFsC7Lv97HPw9lvRd3lFugObnzRtFggZT8A5n1feq16AYTb
 JIdTN8qIFnieoXLgllKXbxj6Qa3S6Wih09QUwgOU1shOuz0BEVGY8521n1WQSN3A8Eeh
 9mIVV69dP4z7WmU9eeN3zdCY2NkkV+QxHgZdZ61DHSwDtgqsMSxc0w7dJ1rGQRjYkiQt
 M5X+4/LsFzZ9OgzieWz2idB2yNXaYb6iIcsOu2O0IsqwJpN/vgiVCdAbWZXCDQOWVfGh
 jlKw==
X-Gm-Message-State: ACrzQf36Lw2BN0XST/ifbXsfsKfuK767Ln0kh2g5OBiZCYBz/omt+BfH
 hMbZyszsHfhU7jvo7b7KapgW2yQK2d2+P+AUVaLUTw==
X-Google-Smtp-Source: AMsMyM4aliTTMvwWsyVSlMxQ3+x8Y5mXYn86sdZe3MDv1ikO3pQdl6kGMlxnCmDCdqcFqXFI8bXbdlAQZuyuhMay1Wc=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr51988030pjb.19.1667837319251; Mon, 07
 Nov 2022 08:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
 <Y2kRWNnk7wDxPnBK@sunil-laptop>
In-Reply-To: <Y2kRWNnk7wDxPnBK@sunil-laptop>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Nov 2022 16:08:27 +0000
Message-ID: <CAFEAcA-121P8gwOHRsbp4swP9ah1CZO8rVP75+WyvgF1pou8Aw@mail.gmail.com>
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Mon, 07 Nov 2022 16:08:46 -0000

On Mon, 7 Nov 2022 at 14:08, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> On Mon, Nov 07, 2022 at 01:06:38PM +0000, Peter Maydell wrote:
> > On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >
> > > The pflash implementation currently assumes fixed size of the
> > > backend storage. Due to this, the backend storage file needs to be
> > > exactly of size 32M. Otherwise, there will be an error like below.
> > >
> > > "device requires 33554432 bytes, block backend provides 4194304 bytes"
> > >
> > > Fix this issue by using the actual size of the backing store.
> > >
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > ---
> >
> > Do you really want the flash device size presented to the guest
> > to be variable depending on what the user passed as a block backend?
> > I don't think this is how we handle flash devices on other boards...
> >

> x86 appears to support variable flash but arm doesn't. What is
> the reason for not supporting variable size flash in arm?

Mostly, that that's the straightforward thing to code.
Partly, that it avoids weird cases (eg you can have a backing
file that's an odd number of bytes but you can't have a
flash that size).

If x86 has a standard way of handling this then I'm all
in favour of being consistent across platforms. What's
the x86 board doing there?

thanks
-- PMM


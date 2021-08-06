Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBplv-0007M0-KC
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 22:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBplu-0007Lm-Ke; Thu, 05 Aug 2021 22:39:42 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBplt-00089A-9q; Thu, 05 Aug 2021 22:39:42 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id k65so12483707yba.13;
 Thu, 05 Aug 2021 19:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pr8llsXm8pIDycBJMwDAm//3aoJX3ZOBbG+azTHxNbs=;
 b=EgcuRc3+/nYvEbDNQXVE7A3pTxzHw1JRY1aUceMsPr3jlSu5x8TCj1zra1QlHECgQn
 cQQcctJvodeWEZ8b+bN8JStjDJSnmsCI0oKUFOD+odM+oDWld49q0xRwOnwuhdbpFNFA
 tz/EjkQhvIpp+FzeaUo4buk4Kx+LmTWKlTANNpgAjlTi5VbgEatJQ+gPUS6ed01Y0aGN
 qKN5Vp7E5qPhsKv/O9WS5K2NSmTO0eSPnjQ+BjNnbJ1npAFEpaaEYVJJdIwIGV8qDPrx
 IQ/pDDxmyxVyyN0DsxXJvgg+SNsaPfoHGD7gkTmT6+6uXa6eneBbDFEz6cciwLzybcRX
 hEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pr8llsXm8pIDycBJMwDAm//3aoJX3ZOBbG+azTHxNbs=;
 b=h5DY/1fWdG7DQiDEzdv/mw4Eda995pzuMFwwMYLqJYbU1ZIxQjUnOWn7ctNHIwrTvW
 3WzNS9micVk/beP4Bv/40fdK3SV29R8lJ4MS1hQ5OtR9ePongnGNjGdznGlfKl4CZYgD
 lsXv5tGe/pEDz7n0o2wkcVlhKwWnrH+LGMqUAfjhlQTej6w+jSJCe9QLvCKJ72eQtUnV
 DyyrIFTKWej4lHorAoNw0sTgVnvZQ2yAMYBoAIXO9fXMQBhXzjSyFmv+I2t+RaKy64Dl
 2FsIXuomfYtTS6JpVn4kIf8TFRJcJMIgo1YlaFH8HTMUHbkKX/4HnEg7IHMoF26uhabi
 oGDA==
X-Gm-Message-State: AOAM533s47v5b0keFCiAAQ+9pjhb3TBh0Bcg9Jm5EU6cH45VbGrKkqNZ
 w9FTzEyY6bpOotiaWVfP90FEpplNw4uyU8t+2Rk=
X-Google-Smtp-Source: ABdhPJxuZvbkVgBc3itw+0+IVkc8mVPziZV/n4YgMir4ydR0YED71MfI7dRNxq2wKrrDSjWyohMW33LCdyMugIRaCTo=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr9805316ybc.122.1628217580178; 
 Thu, 05 Aug 2021 19:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-2-ruinland@andestech.com>
In-Reply-To: <20210805175626.11573-2-ruinland@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 10:39:29 +0800
Message-ID: <CAEUhbmV=owj70jHsmm2N-qKcCOZyH33citKn_4UcbdkoTvZgKg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/4] Add options to config/meson files for custom
 CSR
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Fri, 06 Aug 2021 02:39:43 -0000

On Fri, Aug 6, 2021 at 1:57 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
>
> Adding option `riscv_custom` to configure script, meson.build and
> meson_options.txt so as to toggle custom CSR and will-be-upstreamed custom
> instructions handling logic.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> ---
>  configure         | 6 ++++++
>  meson.build       | 2 ++
>  meson_options.txt | 2 ++
>  3 files changed, 10 insertions(+)
>

This sounds like unnecessary to bring such a config option to the meson level.

I believe a Kconfig option should just be fine.

Regards,
Bin


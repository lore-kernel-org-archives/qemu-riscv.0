Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWaRP-0000Qg-3c
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 04:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRN-0000MV-2m; Wed, 14 Apr 2021 04:00:01 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRL-0001nV-Jf; Wed, 14 Apr 2021 04:00:00 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 65so21171432ybc.4;
 Wed, 14 Apr 2021 00:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L5iI7QYKKzDA1z2h2cIrwKtonNbj+WbNwXqkcU3St/A=;
 b=WoNDhld9QQI+Taj3lPrHriBcYrB9QcZ2AW/OsHhLeGFi86tQvlBCAbnEk4OTF4wOIJ
 nJ64ycVWgpCrs40wr2YLdUCtqo9p+3lOPTxm9vjr9sEdQmLfuHPb0yJD4RWcXPEnMUoa
 8AgeDqcZGub6xx0tKQOeqbBxlbqtmJy/3HTDkJ5AAfX3MG7XHTnqEFwxhourd8ZG93YD
 4bPg7090fIdSCJuV0QLz+0jp/PzKkGYRX/PJMdZF6QSP0dnoxC6BrMVzzyn/mzQRGcjK
 DlPTIrhV0NvI6bKWe8NhXUxSJcJ/Er+7oK9HFB4w4xT2MgeIg0mlA/fs0QIFPkgNbKjh
 7tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L5iI7QYKKzDA1z2h2cIrwKtonNbj+WbNwXqkcU3St/A=;
 b=dcdZH18BtZRNcXqNPam57J9Ogtvr3IMoJIOU7rKHbDL560NimKgTpl3mQV9MABF6Bl
 ANLo1J+sjclyTFeoWkZw9d30aC0RvO5FHLrOpEGk1981XV/6HwiQqc5VnfBK9KODv97c
 cu0a2EkPUQuxvG3ODo9QAj8jTbOlEKhbuKGlHbviGbXhxzeW6uzMpYWJR4QWdtaRy/eA
 SJb4IPla3D4F81vyLmsT985rrdvaSH1TR2YwECnKCUJJDJo9XE6ITFXQ6Qbp6bnYofqx
 r11zxe3pkhjCtbr9wLNFJiYvcCZy4sAN/77iGyRBr4iXrDMMQgTimwT+lYOmk4Q8fAMG
 LtAQ==
X-Gm-Message-State: AOAM532cwAb07/G+keGPBknHIfgAZerfb8Tk5jgQlx47OKaXs2x/1x1s
 bv9sQ5Qby5ICt60s6YTQRQecZoYl+/H23AMnRV0=
X-Google-Smtp-Source: ABdhPJwP6mKTSFBK29DRe5J3WwDoKX/yeisilLZMeWVQZKi9EVfx0jxbRqwjL8MJC/YFNLXcc0tpC6Tj8WaMu7OdYVU=
X-Received: by 2002:a25:aa14:: with SMTP id s20mr11663461ybi.306.1618387198488; 
 Wed, 14 Apr 2021 00:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <c699df25d8349bf9fef71c940501bff98d5f21c1.1618356725.git.alistair.francis@wdc.com>
In-Reply-To: <c699df25d8349bf9fef71c940501bff98d5f21c1.1618356725.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Apr 2021 15:59:46 +0800
Message-ID: <CAEUhbmWxzwk=u7kf+iK368Vqaq+3K-bST51Um-hMzcZ52LN33Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] target/riscv: Remove the hardcoded SSTATUS_SD macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Wed, 14 Apr 2021 08:00:01 -0000

On Wed, Apr 14, 2021 at 7:33 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>

Worth mentioning that this also fixed the issue of a writable SD bit

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu_bits.h | 6 ------
>  target/riscv/csr.c      | 9 ++++++++-
>  2 files changed, 8 insertions(+), 7 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


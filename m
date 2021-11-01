Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhR4R-0000gJ-Gl
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 02:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mhR4N-0000g1-0T; Mon, 01 Nov 2021 02:45:23 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:35716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mhR4L-0004jg-Ih; Mon, 01 Nov 2021 02:45:22 -0400
Received: by mail-yb1-xb34.google.com with SMTP id y3so31138506ybf.2;
 Sun, 31 Oct 2021 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H8Y9TT6SsleJwlz3/J0rkDOF+BlHseO+BUinjbK8gsY=;
 b=m8z6lE9VhLhgccXQMKd5RH0k7E9ScXeUDwU0NHnDDWSMUF8P9+t6yLecBqOE+/TAz9
 cDZIcr9x0FNX1SN5aVzd8mdYtf6BIz7N+o8PPmgqLIeM/4YzQrQo23S9P1KGEfZUMXSL
 aVgQFjHhZyLf8K9WRW0RDNtgO2gH/3jruG9yXn9BcVrIdBPaEqA6aDagRc405vPegXZc
 gnUcs2FpTWN0FSGgGHMkgrhwyl66V5Arx2EuknHu7A/OSM4LggDyAjBiMWn+dgXKrM3Y
 GC9vkrSGIBQOBacW58Q3zWdKt1LHpLUFOp+4zubYF9QMjN1BzqoU5BmN1ApfAGkSZAyd
 z0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H8Y9TT6SsleJwlz3/J0rkDOF+BlHseO+BUinjbK8gsY=;
 b=38gcfDUx3VmPDDsQ2HLLuzENO1d/Uw/mTYtQBf2R480+S9PFD9Kb16flNBtGQFfXSf
 6KdjzZa2BIl01103WE0HgR3RDkZhn7+pwDvy37AV+DVm/9DRAp98Sa5AL6RAue+MZOjS
 /5cTezIaP0oML7NPoKhqulasTZCDzSsmqxRvFitXqUeqKdxJGwNWrTvdYTTWSvZp30lC
 0zXDB5wP++6qRTMMP2MWPfkFM4SGUwQvTCsH4osIzq97MClq7NDVPfPjaS/MKv+odkXH
 qKbBcgKkXKPBdI4vtyZ5626uchoOgevR5z/X7OsRGNuH5IsL4X58nJaPTLNrYcHwWIxr
 k0ug==
X-Gm-Message-State: AOAM5322MD7FJjtzhGWPjJ7EIEcScP05ES9R1WLzaQMiSycqFlmojsYr
 kJcLyoOETUk4NEzSF1Zm6PE18o8bjR1GjRS6fDY=
X-Google-Smtp-Source: ABdhPJxN/b7vggoPXpX561634cBd9kwhMJIOW0a8rG59R3VzHo/elAKaVhIKwgpyR8Z4vkgy237L4+mTgLLbi2vUxK8=
X-Received: by 2002:a25:11ca:: with SMTP id 193mr28217354ybr.453.1635749119677; 
 Sun, 31 Oct 2021 23:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211029085922.255197-1-frank.chang@sifive.com>
 <20211029085922.255197-2-frank.chang@sifive.com>
In-Reply-To: <20211029085922.255197-2-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 1 Nov 2021 14:45:08 +0800
Message-ID: <CAEUhbmXjUReY1Am-y9jzuE2VxBxsyXRnoJ1W6nN9Y-q=+=JZLA@mail.gmail.com>
Subject: Re: [PATCH v9 01/76] target/riscv: drop vector 0.7.1 and add 1.0
 support
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 01 Nov 2021 06:45:24 -0000

On Fri, Oct 29, 2021 at 4:59 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 16 ++++++++--------
>  target/riscv/cpu.h |  2 +-
>  2 files changed, 9 insertions(+), 9 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


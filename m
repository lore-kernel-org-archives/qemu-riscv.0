Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIQmu-0006PF-LB
	for mharc-qemu-riscv@gnu.org; Tue, 24 Aug 2021 03:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mIQms-0006NF-KK; Tue, 24 Aug 2021 03:23:58 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mIQmq-0003Nj-Sh; Tue, 24 Aug 2021 03:23:58 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id z128so39096497ybc.10;
 Tue, 24 Aug 2021 00:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dAZvGJkUmxcYSzaf9C97dAypRht058l+IuqH7O2PPuk=;
 b=hkOPUiDzhyRvGxzK+FHXfSilFW2ZsCJtJa+i+AiWqb/BhAOKJDwTR9FVXO1rFZf4Eh
 1THClMkfowLoU/NcYi3rIX0YFzaN3gcazg1eljgS8azlutWiOE0zDs1wL2MBlWgMOC5t
 sv1GfTTK0BvwiIQ8Nt27oP1siXO9GXEYX/lPDxD+CYfDEvOASotAvlaCUlOzviQa++fH
 6P3Zv9J1TMvV9zoieFh7peA7RJb+SBkWcI96223uvvVRsZGoKHtg7ngRzfpnwX5pHbWu
 aPLA+prB4IFjZeYXE2XyI7NqN4lYba95fBj4x0TMmyS8SbtmGvlbqHlba4o2XQTWMtiY
 zswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dAZvGJkUmxcYSzaf9C97dAypRht058l+IuqH7O2PPuk=;
 b=ssI5kK+qfi95bBC8EUoh4vuJYdRViw8RfwUjAay6zStBeykwZMs1qw5oSUPSaKDrH9
 xY6oXKISxs+8jJrXpgvF3fPA5WTIh9c0NiqGL9b5/9yayeTCMCXq1PaCTONLUoQ5ouxg
 4gg12OZ0OYmIGex1iW7PF5ct4y9PeVJquqEUB4GLBgp04e0yZLkjM6c5Lpf7ElrLniJy
 rJlCvy1c9Y20sYgU30UvI+U3PGHApQsUSpfdnYIVBOjE7f3FD/3NBIOWjACtC5gGehDr
 SwwHgt17WSZQL6GUjfJuv47PvPAT4QKzjKza8n83J7FhvWt01+7JJEm700J63k4HtHLY
 VxJQ==
X-Gm-Message-State: AOAM53286tSxSOr5izUFCWUp7BMYdTIUWWAZhVxZx/RNQNIzAttnJZFg
 TWmjDF3qBS9TZmD74zfZKTLSz5Y1vc3jqX+jTI8=
X-Google-Smtp-Source: ABdhPJz1wHJ5zJdpOxwrAe1odRUsTjE6Z/60SQI4wj/PWimzNIUGvrBGq3/zSAhdTBT8XU5AnMBdiibXMepVUL36+RA=
X-Received: by 2002:a25:d712:: with SMTP id o18mr9600049ybg.122.1629789835374; 
 Tue, 24 Aug 2021 00:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-14-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-14-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 24 Aug 2021 15:23:44 +0800
Message-ID: <CAEUhbmU2d6UsDPBrCUOVpRDeieY-Mnp8ZB4_UTDKx2b4zdLCNA@mail.gmail.com>
Subject: Re: [PATCH v5 13/24] target/riscv: Use extracts for sraiw and srliw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Tue, 24 Aug 2021 07:23:58 -0000

On Tue, Aug 24, 2021 at 4:05 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These operations can be done in one instruction on some hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


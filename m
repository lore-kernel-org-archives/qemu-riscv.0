Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lThAs-0007Fl-Iq
	for mharc-qemu-riscv@gnu.org; Tue, 06 Apr 2021 04:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThAk-0007DJ-M8; Tue, 06 Apr 2021 04:34:58 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThAi-0007Lr-Kg; Tue, 06 Apr 2021 04:34:54 -0400
Received: by mail-yb1-xb34.google.com with SMTP id z1so15323675ybf.6;
 Tue, 06 Apr 2021 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+xTxYtgPeQmsxrZge3ue3vONxQKuDOrPzllw/tQa2M=;
 b=LSyT4nupothR/vy7FUeTXA65B9kPCUndKqHMFRSzqTECmcIY1EsDL4oxMo2W+lQN/6
 lqxqoviXZgXO+cQhnbtXLLHqYBjkYVFWQGslv6Z7QOfBnrgP8/BgKGQocxS5cuVpkJxX
 oWlJIv3pBncZHhWzlLA8BgZN3CQRPzgOQcng1mDCsTarJYcPylUqqHYkTo7w3AJbCUpn
 axRhzvVwaYb7ZHIOo7t3LnGpgPf+AnPYO04tOXkcm2EmSo9RfrmQ1OzdRoS/NY3yR0ot
 t1sTrmsstP3Li3wbEEfVz0w7kEQgdB4esKnRK8ARtVyG8ceys9muumcOPgDWdF3oIckY
 ssRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+xTxYtgPeQmsxrZge3ue3vONxQKuDOrPzllw/tQa2M=;
 b=ArOEs7ERIF4k/0JJRtZquuzqrmk9FQkM1AHtCGLHJmfNK98rGLeCfGLDwEOjj7VzCu
 AgQZuLJ8xGC1eQNcKoJVgHITIyfQ2VwG/u8K2aBSW07EPw0+WleNO3s1M0XmieapsGuo
 Vv+4epcKcGvmmHlLH6EGmM2TONqGGNJo3V5EnK6kcT/KPl07a33cFr0gkPijP2Cbbl0F
 CvC1DjHsxKHLrt3lMONzqEqa/+rX1/vnyufZiHD8ACScV3O1xyNYgL9E6NlQ67ZL3mO5
 p6yzqV6lsxFMsOHSpGl4qTORoZe18yuUOVh/35nh9vzNWfGfjO8xzKtdWsrAkMPopvJQ
 5+2Q==
X-Gm-Message-State: AOAM531C3ttwCwRMuwMScgB50hv9PscIgkwWXdmnedY4soNCisGpjxfv
 IrTx4XZYLEGieAf094Jnpe6+OYwZb0RmTXnjD9UviSkm
X-Google-Smtp-Source: ABdhPJzsgfWIx0k6lukHXlA2nNukGzN3/9o9dcAxRxIHPaJm6BmNKdSutWjTwu6ZwXpZ/F4gwAP+BvCtgYwE0dRXs4E=
X-Received: by 2002:a25:ea0c:: with SMTP id p12mr27068506ybd.314.1617698091423; 
 Tue, 06 Apr 2021 01:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <8566c4c271723f27f3ae8fc2429f906a459f17ce.1617290165.git.alistair.francis@wdc.com>
In-Reply-To: <8566c4c271723f27f3ae8fc2429f906a459f17ce.1617290165.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Apr 2021 16:34:39 +0800
Message-ID: <CAEUhbmUoYNkc_WugRtzkO2Xx8zibJKykEz0REPZYHGHrJKiY6Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] target/riscv: Use the RISCVException enum for CSR
 operations
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Tue, 06 Apr 2021 08:35:00 -0000

On Thu, Apr 1, 2021 at 11:20 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h |  14 +-
>  target/riscv/csr.c | 643 +++++++++++++++++++++++++++------------------
>  2 files changed, 390 insertions(+), 267 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


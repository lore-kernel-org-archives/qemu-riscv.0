Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0Hue-0006H3-FD
	for mharc-qemu-riscv@gnu.org; Mon, 05 Jul 2021 02:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0Huc-0006EM-Us; Mon, 05 Jul 2021 02:16:58 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:38433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0Hub-0006sR-FV; Mon, 05 Jul 2021 02:16:58 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id m9so27340333ybo.5;
 Sun, 04 Jul 2021 23:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B5flYUe/P4h1ItbhTe+mlVcN36hcOCgL9UcDDWt401w=;
 b=fUdXzYWBVtnsI5PFVcQdTu8pgfgvgvJpziRjp8G6g3nDCwrudlPWI48P4mQlfqPtbi
 zXskR3mq/thYyiNdtbBVY2Oa4A+BX+xDJNF4dgfm35SjXig/wh0LabAbZZ4kuVHX3JFW
 iySoVvU+1qn1e/9v71HbdHXBeoWrM3MioskyToLU7VvPHIoQPtIn7zjLt0vuu64NknJa
 LDbAPsDayxHt0dauDhIFtEhyZNAPL/bAu9vrM39O9633s/2tW5Oz9vnHVFJI+6Aq7/Bz
 0Hoy2i/Fv+Z4C027gyXRZFv6iIOSRlASrT5ROvXMlPxJf1bIWfqR7FDOEZChqm4/x1tt
 OyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B5flYUe/P4h1ItbhTe+mlVcN36hcOCgL9UcDDWt401w=;
 b=ACZIVhsqRjZZ5aEF/zXTX4ZA1zonw2xppaHii3hRxg12uG5FkqMWj3pwGNbsTRTzoc
 qTw6Oh/hyjbzNs9y+GJ9PXCDvn0+YPVKBpzX4MGA68GgmulslgVOPipy4/Nf1siXvZf9
 zpHgM3ZDXE6+/Y3upTQ4nFi8T2Yj8IkLcfhK0ByQlvynBulwQEQlrp7rGeeaQr0wh9rk
 Dl4gRCSgfKc6MIk/xZyXEm4aS0DtXrY6ui0kLKtaaz+3K2pXCrlIgKEPdBaHO9S15fy0
 Ae2jJFN/yp0ECvhLKxXGoaux1l14cRl6/pUIoBcGG2+RZsNNcUV/LTOJs/jVvpJFBANX
 sbcA==
X-Gm-Message-State: AOAM532kL4DbkL7kq9z8bw1rD2k0AEcubfmMj6hTK3NFZL+nFynph/Xg
 5tQ4IQgNmYGabA4dSrAlON4BMss1W7bIIMD7zRw=
X-Google-Smtp-Source: ABdhPJzoE/aeLopR3wReUnWBfUyILKQS2lsJgjFrL9XrZ/DKeoAXk2GzBUL97razr3i3f4M/ucLHzkNbpy8npi0qNOw=
X-Received: by 2002:a25:2c01:: with SMTP id s1mr16915171ybs.387.1625465816258; 
 Sun, 04 Jul 2021 23:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625202999.git.alistair.francis@wdc.com>
 <95a65b30416ac27416ed551f499e14b85284573c.1625202999.git.alistair.francis@wdc.com>
In-Reply-To: <95a65b30416ac27416ed551f499e14b85284573c.1625202999.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Jul 2021 14:16:44 +0800
Message-ID: <CAEUhbmWDLS+b_GHNQnsOdzuYaDJ7TXz3-U7VJHjZr1X=A0WLTA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] char: ibex_uart: Update the register layout
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Mon, 05 Jul 2021 06:16:59 -0000

On Fri, Jul 2, 2021 at 1:19 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Update the register layout to match the latest OpenTitan bitstream.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/char/ibex_uart.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


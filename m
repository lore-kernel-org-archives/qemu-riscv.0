Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6pID-0007z8-FS
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 02:40:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6pHy-0007nY-OH; Mon, 10 Jan 2022 02:40:25 -0500
Received: from [2607:f8b0:4864:20::b34] (port=44674
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6pHw-0004lv-Om; Mon, 10 Jan 2022 02:40:21 -0500
Received: by mail-yb1-xb34.google.com with SMTP id i3so35562646ybh.11;
 Sun, 09 Jan 2022 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m7dKT7IIcvSqBeMDd5YMI0ivThxt0lVbt20roNXHgtA=;
 b=l6kC+FoFaLRw+hgSgzVvh+wPdsk6IsNO64zipK0lDVwBBMghSyDHdtoI4oYohe8vv9
 Thm9Lt3lK4UANt9Gh0/jh3LFGb5cQgR9IjxO0Kb+UzxYFwmTOF4MDOxPye8u795mDS3Q
 gj83FZ26/pwOr4M2fri5P0i4gGa/jpOXDBGD7dcpLxgfuvg1LRPWUF3Z0UGNduBRuzxB
 MHmk5aO/CfZ4B/NVggoPhZOm7Mmflj3pQklx3LQgbEhZrcZlIneZQ5Xg23PgNtFR8yF1
 XM+23lmrdKFvUkwcQ7UAYA8XHZlblhznM4Sd5PQQoSNdzBzMI2CIwAa68lbwrjzeX4Vj
 aPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m7dKT7IIcvSqBeMDd5YMI0ivThxt0lVbt20roNXHgtA=;
 b=IGSTAXSqsTmpUqEBAhDSAtCGT1RFZgkeOwLtU8QXOZ0mKLo6o4pYFJwNbZDJwEeY9D
 thuI/VyseYLG2OmroW739n4NwwURgCZJ6MrYcyZLuqGuMqjhgcjeevtdAoL3jMmkX++x
 gzgQJtUVV4UNt2kQ2tL8uVsV4JTtyqD0hAOTk+YIO3vpgSEWamjUJCWWZO+u8K3PrMB9
 qh41brXImBKaqIxkybUheLW/IEJUVBW+jteGZphOPqtwIfD7i7dfsgP4PIxo4ZaYWo5Y
 DiU1TX4sPKZT37Ae1zNp3PK3EXTBNPwKcbSw69s30qvO574VoLQ8/Up/L8w7zpDFOwKb
 +lqw==
X-Gm-Message-State: AOAM533Jm2nqthPYxsjnWMksq45GOO9lfXdy64UgJ7LAOUdx1ulIuzql
 kKBWXrgcdVMWzmNm2NNMdEHgH6wNLQ8Q03AeDJ4=
X-Google-Smtp-Source: ABdhPJzcLGtnWZljiwbFOrAqIgdjHnaYrrnigH4ixDHe3KcIWCX3y24pqZ7LVbvV1/ZGe9Omesr9H+ey51G6MWGAHM0=
X-Received: by 2002:a25:d153:: with SMTP id i80mr81637946ybg.622.1641800417489; 
 Sun, 09 Jan 2022 23:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
 <20220110061321.4040589-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220110061321.4040589-2-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 10 Jan 2022 15:40:06 +0800
Message-ID: <CAEUhbmVwaWExigOyvbptCU9TJhfXUMsFSjCMPbLhhDSdPjSaGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw: timer: ibex_timer: update/add reg address
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 07:40:32 -0000

On Mon, Jan 10, 2022 at 2:13 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> The following changes:
> 1. Fixes the incorrectly set CTRL register address. As
> per [1] https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table
>
> The CTRL register is @ 0x04.
>
> This was found when attempting to fixup a bug where a timer_interrupt
> was not serviced on TockOS-OpenTitan.
>
> 2. Adds ALERT_TEST register as documented on [1], adding repective
>    switch cases to error handle and later implement functionality.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/timer/ibex_timer.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


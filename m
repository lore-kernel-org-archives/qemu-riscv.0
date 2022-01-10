Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6pCD-0003O5-Mq
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 02:34:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6pC4-0003M3-CK; Mon, 10 Jan 2022 02:34:17 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=35838
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6pC2-0003r5-MK; Mon, 10 Jan 2022 02:34:15 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id j83so35690167ybg.2;
 Sun, 09 Jan 2022 23:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+j7IfziZ6uWB2bo7sc4T3tNKt38P1h3b4hmZ6iMB8fI=;
 b=lKMLKE1OVnmnvu6ruiPilJwgG5FUOIS0icDJRgyk2qdLJUVh0CHs9GHuGBTWzxE3lk
 8UmlgfswhJMbqYGZ1LEOqkKD7zx2tC2qKDUGSXQaQ8DF/dI3ZiRD8M58JJxUJwkB4pAq
 2QVMJIr/yOIjHKfMWwhJulU9ZabZ9p7e32LIqpIMQXK+9Vccwxzx2GpuJx0zsm1gFj8U
 8yvxjNLEQYNF4kd6VjGxzXMBlbhbirb2rBm2dL7ny/7vIAmwOv3Y1mPkjBFPFEmVuHVq
 hocGQPE8yOEAFM8p5rqQJwPrUHmDFYX+kxL5+enJjACuLjFSgcTmP+fSZgUjSnOWXif3
 Y2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+j7IfziZ6uWB2bo7sc4T3tNKt38P1h3b4hmZ6iMB8fI=;
 b=Qr2jcPDre0Gx7jYmmChY4pum2Low7IuE3Y6eQYYMHlFetAzN0zxnW+cSqtWG4W57iI
 t2rmkR0YXPc8SSfqOconU3XHEwcE92LIBbMFI41Y9fObEdNxJLajwGatCn3hhwXCcVJb
 INhGqdsKGXXfiQOITbKlQOiUrXu5cwuQAFpgRbH8TJiM/6+cYZ3QkQi9MkI3m0t/5ygY
 us/o6QYP/xT7PzVdnItKc+O+Nqas+9BiFHhqS5lgrSYR3iFU7P/ur+M8tEj5NzqiiN3w
 nu12Wz7QtFt0H9vVt6Cm4WmfHUaiy2nATzv+JnG+Srl0q/bLFTeTe03ngdvrPGOBrBho
 6uUA==
X-Gm-Message-State: AOAM531mic8na7Cq6bqtdQEMDCUFA0Da9hstIprttOB/TKXgA+PEGFOE
 qeOfBf2wihlJxR/kw540hoz+W0ygA1xEC++Wsjc=
X-Google-Smtp-Source: ABdhPJx+W1/Bts3bss/GMr7+/dxKmCxfXb+LlXURf3x38m7X5V1EEsHsglW/pWA1Yr4VVYzryO/8TcdnRS6OjRUgjEw=
X-Received: by 2002:a5b:3c2:: with SMTP id t2mr86043716ybp.747.1641800053310; 
 Sun, 09 Jan 2022 23:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 10 Jan 2022 15:34:01 +0800
Message-ID: <CAEUhbmVjdMfF5G-xbjBCFWE13PGtVG9WveXfDSyAAO3Q0Fpukw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: opentitan: fixup plic stride len
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Mon, 10 Jan 2022 07:34:18 -0000

On Mon, Jan 10, 2022 at 2:13 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> The following change was made to rectify incorrectly set stride length
> on the PLIC. Where it should be 32bit and not 24bit (0x18). This was

PLIC [1]

> discovered whilst attempting to fix a bug where a timer_interrupt was
> not serviced on TockOS-OpenTitan.
>

[1] https://docs.opentitan.org/hw/top_earlgrey/ip_autogen/rv_plic/doc/

> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/riscv/opentitan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZN96-000864-A8
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 20:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZN95-00085u-76; Wed, 21 Apr 2021 20:24:39 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZN93-0007D8-Qk; Wed, 21 Apr 2021 20:24:39 -0400
Received: by mail-il1-x135.google.com with SMTP id e14so12656722ils.12;
 Wed, 21 Apr 2021 17:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3zbWh4Rydj8nOM38D6Jneohe+oSMFLypR1BlokvmsHc=;
 b=TOWm5YiWB6ogXaEmYa6rX0vguWY/dtxWNqgM+SRO0nUZ/M3JdYD1FPsVT8/TryAXVd
 zAcCZzjpGc9CJIHYjbgwk07OpeSCs2d5ei1zAmxMCNG1cv7S8XwpIKlvtSjiucBaFPlm
 lBqoxKG/eSr9i5w3naEk+l9lo1G/mOrR3Nnwy++dEfgjg2O/A9LgIlKcEpGbSmQjzAVC
 5Ia3cIyF1pguaN2YVYwcpWzQFU3NG/h0bdeiRT9bXL7zK0el2vGCdB1IcSFgX6AyW66X
 zo63djpYxfIV9DbPBhYEcIv1PBOZe0Qdkc5IhksTCLuYL7pmNvut+IYQOp+4ShhV7HMv
 1G1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3zbWh4Rydj8nOM38D6Jneohe+oSMFLypR1BlokvmsHc=;
 b=W5xdoaJtQb/Oav4AnAAgCvblpHczHokbb1nFUEaQP3yI2qf9tZcK/dAQEYPNLLZVmR
 fJJTRdbQjDfRtaZDx5rOpTUvtvCYYzE48LRY9Ksns1ckog/QDK3FqF4c5jxY4lw5kHSQ
 FutK/byPHvKKZaBecEFmYgWUGjFxHTg2PH9YLx9tnLI5eT48hLyexWzf1uLAXLieVKQ5
 XJa4qO4r7KYpFy9ceMYmxFOo9FDShWHljQUenc3G0Rjsa6PglNYtjVd21sQrN6J1cFLk
 2f6xcTpC2lQ07AWJY1RFwbNJQo5nE/0xuUqKka6p5odDRcYR/pFXHCa5Bih0YfKrBeom
 utEQ==
X-Gm-Message-State: AOAM531ngDEbil8HedbFxWWUyV4VZ0eHVjNOXCDQiyOv0jOFVsRkg60y
 h9oSIW9vXyrBmtVJE73cTsGCyPPqd4PmLiw8apo=
X-Google-Smtp-Source: ABdhPJz8bNyKSkoXKhlQiecRriyo+98FSlGaBlTds4UpRNKqjWpO1mH3oFmMsLVi54d6W2GNp0eZTKlj98GVmCo3uVQ=
X-Received: by 2002:a05:6e02:5a2:: with SMTP id
 k2mr516568ils.177.1619051076402; 
 Wed, 21 Apr 2021 17:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210421133236.11323-1-emmanuel.blot@sifive.com>
In-Reply-To: <20210421133236.11323-1-emmanuel.blot@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Apr 2021 10:24:10 +1000
Message-ID: <CAKmqyKNFjS0k0BTqW1tkkDyCXvPX5mLZ28F9gJ2w6DE6LNzWdw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix a typo with interrupt names
To: Emmanuel Blot <emmanuel.blot@sifive.com>
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 22 Apr 2021 00:24:39 -0000

On Wed, Apr 21, 2021 at 11:33 PM Emmanuel Blot <emmanuel.blot@sifive.com> wrote:
>
> Interrupt names have been swapped in 205377f8 and do not follow
> IRQ_*_EXT definition order.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d6ed80f6b6..c79503ce967 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -88,8 +88,8 @@ const char * const riscv_intr_names[] = {
>      "vs_timer",
>      "m_timer",
>      "u_external",
> +    "s_external",
>      "vs_external",
> -    "h_external",
>      "m_external",
>      "reserved",
>      "reserved",
> --
> 2.31.1
>
>


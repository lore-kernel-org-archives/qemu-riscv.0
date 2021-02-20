Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDIB5-0004mn-1Q
	for mharc-qemu-riscv@gnu.org; Fri, 19 Feb 2021 21:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDIB3-0004lm-6Q; Fri, 19 Feb 2021 21:39:25 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDIB1-00049e-Og; Fri, 19 Feb 2021 21:39:24 -0500
Received: by mail-yb1-xb32.google.com with SMTP id l8so7392211ybe.12;
 Fri, 19 Feb 2021 18:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FqxQ7PB9iD3SovyQxcxQvVtYY4i0x8pG6VGHXH3Zwv4=;
 b=IJNVt8zek8gepm3FnCAiytimu89lBnscrRUcVicyMmeeboL1UO4uD3caaaS1bb3P8L
 vNV8Uhr4l/MDKzdQqW/gTW6BsIlH/tEAnlJsDfeMIdrmLuLQNCR3tR1ZqHMLEdwPfeAp
 ora6NSykzPZMa6fkvHtaU6NEBi/9pViD0WPkWjWEOQsm66cg3oglgq/DhyR2vrGcsMO5
 9b6J4gfjAj4wXn5eEJWLKaO3ACgeyvGrcHFFEtafSW8RZ3uB0O4/jKT5IHYhKyVzG7WY
 qhq6ZW1wK3t9ZmgCJf48bY5KRM7murzRYfqOCM7rnYQaA4IUBGajj4zYE/JfLnfoRTo5
 ZEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqxQ7PB9iD3SovyQxcxQvVtYY4i0x8pG6VGHXH3Zwv4=;
 b=Ax1AOefAGbULQ8xwhL+w4y8tW55eegy+YyBsMCXPZs6dIDUuslvM3j7Ii0c+oaQu93
 kA0XpwOI4EOh7ChJ4uw7O1CegyYmRBO/dT2dZXx7mMD6MZrBduEwIvL1st8FkA0+wNbo
 TYu8TDKSFNfUOov9X/qHIdyu4TuzguTOL4rcYHrXWz5ddRKgr5ih9rCQUQ5OqcFffm4l
 XIAKDnQQgH1xtTtLt3zQnpETNXgwGQRi6e0jz+jwtdUwK+WoHz3LOcyfrJW3o1+tzXXt
 3vnzS+mIboCD3BkCwQLrru87v1s80RyEz77WI4eaIwBxPnmJ2wtBxNGezoF4FYMr4Uxc
 MO3w==
X-Gm-Message-State: AOAM531GQEOECUXO4r05L7pR7QJU9W0LcbE2WzpOY5wnN+qJ/EQ/YOtc
 XQRiIGCi6LlmfKX2RhmbgN/eFpapEkKzp/xRgvg=
X-Google-Smtp-Source: ABdhPJzFxUU9uCH3UCK6UhHLBdKsBXPOXApUcNFK3+/X+kYxjexZPG1cuMP0t+YwC6aREFTp0qvtHDXHW+aaUjHCa2Y=
X-Received: by 2002:a25:c090:: with SMTP id
 c138mr17566293ybf.314.1613788761818; 
 Fri, 19 Feb 2021 18:39:21 -0800 (PST)
MIME-Version: 1.0
References: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
 <1613749155-84250-4-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1613749155-84250-4-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 20 Feb 2021 10:39:10 +0800
Message-ID: <CAEUhbmXhSZvmrnaQ4_N8DMkpY92uAHmSgmMUy4s2Rvzcm1LNjQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/riscv: virt: Limit RAM size in a 32-bit system
To: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
X-List-Received-Date: Sat, 20 Feb 2021 02:39:25 -0000

Hi Alistair,

On Fri, Feb 19, 2021 at 11:39 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> RV32 supports 34-bit physical address hence the maximum RAM size
> should be limitted. Limit the RAM size to 10 GiB, which leaves
> some room for PCIe high mmio space.
>
> For 32-bit host, this is not needed as machine->ram_size cannot
> represent a RAM size that big. Use a #if size test to only do
> the size limitation for the 64-bit host.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v2:
> - Use a #if size test to only do the size limitation for the 64-bit host
>
>  hw/riscv/virt.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>

With the v2, all 32-bit host builds in the CI pipelines passed.

Regards,
Bin


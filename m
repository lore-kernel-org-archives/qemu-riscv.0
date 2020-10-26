Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kWyJ1-0002VL-8B
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 04:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIy-0002R6-A8; Mon, 26 Oct 2020 04:56:40 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:44687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIv-0005qF-V5; Mon, 26 Oct 2020 04:56:40 -0400
Received: by mail-yb1-xb43.google.com with SMTP id h6so6978445ybi.11;
 Mon, 26 Oct 2020 01:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvExcYMn6d5AGLYRzy6Xnbw5G+UujgsZbLBTIOKD6Jw=;
 b=dj4Domk9P2sgp31yeKXgqC8qGFsfUzjrgTyK/PZQ2AmXXywXeHr8dUfUohANUTOeeM
 XTkOlIWYXGrCIOF00VdGgaLL9HfHHutKKdMpvQAf98uiN204WB5SLJecsAXPUQJjGvZV
 SdSwlKIC5rvL76SvbcNoKkLx4dBRPqbKwsXFil8V+KXo06gJYBAnodYkuIcr/U9lYEff
 mR4HrB/3Atsb+2Y34GX5lsIlo+Qa/MGLBtBEOP57S3Ysc8hkqd/0bV1g7AjNpWjM0Mfb
 QzIuVyNLv2WRgprYjWXSA8YfGYjpl4dAHcm6Ch72zmRHmiRA7xihU9Mqfc2qvnPBHOzr
 wrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvExcYMn6d5AGLYRzy6Xnbw5G+UujgsZbLBTIOKD6Jw=;
 b=tlrXu7uPyu5e3zdCA9AYyfDvuuoufJA5qqb7AYpV39CnKMkUn0pDjTzv41iwTWPeYF
 npOripXBQuOCYQLfCBPAWjLUq9ETyyyIznFhjMOPL4QAAofHYvigvqp0k6Yn3i8CltGS
 Er+V5bqBvY1S0OOGsNBubORoXP9/lnnYRxh8tZAZpcmtKgMI49BPpqzH3YtGOQIS3CeL
 ddzrDiCQW+QaI37XcvtQp9SAvinjtH3N8yiSWJpBhxXtExWGqIw/9u58dCHlhnvNDmFr
 uaAaFNQ6eo6f+otPjvfK5Xrm9IC6a1hbtkrlikw0RPMqEKh6Ns5N7RyazNLjSwKcBNIw
 v9UA==
X-Gm-Message-State: AOAM530SlLUx4YYJIgC9vy7405JxszhDwT4pWSj+jlQrgSovlZ7RU/vb
 uPOtNPigYktqfcRHJGediE803tsjlAbosYo1tpcATA4g
X-Google-Smtp-Source: ABdhPJxcLFwgUXhgqiDRi1m+3PvB7WQHDcNBinNfpnJ014LSQ1LhCSv5Rdkq9gmdcngYhI3jKUdzgeMjP3s1QiGogso=
X-Received: by 2002:a25:328a:: with SMTP id
 y132mr18123435yby.306.1603702595338; 
 Mon, 26 Oct 2020 01:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603467169.git.alistair.francis@wdc.com>
 <0316e1e7b7d81d1e6265fc125983a1e2872c0fe1.1603467169.git.alistair.francis@wdc.com>
In-Reply-To: <0316e1e7b7d81d1e6265fc125983a1e2872c0fe1.1603467169.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Oct 2020 16:56:24 +0800
Message-ID: <CAEUhbmVaAsj6w=q3+ry5Y3OaLbfV53Eq4Vw786wVnqd5K=f2Mw@mail.gmail.com>
Subject: Re: [PATCH v1 14/16] target/riscv: cpu: Set XLEN independently from
 target
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 26 Oct 2020 08:56:42 -0000

On Fri, Oct 23, 2020 at 11:45 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5U62-0001vX-N3
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 09:50:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n5U5u-0001sZ-Eu; Thu, 06 Jan 2022 09:50:24 -0500
Received: from [2607:f8b0:4864:20::b31] (port=41709
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n5U5t-0004wC-2H; Thu, 06 Jan 2022 09:50:22 -0500
Received: by mail-yb1-xb31.google.com with SMTP id y130so8009838ybe.8;
 Thu, 06 Jan 2022 06:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ztRfInFr/BFTEFbI+H+ZdQUEXvNgj36MIMMt9VFoyAU=;
 b=kQfp/INEu+oZ8jBDVeyGNhiBPnHAKDGYIRmJPhsCa+FjcUSlh+i6pji5WpBB7R3/gv
 R0FOsxFyQ8CtsimDf+75zJmM4Cf1DuTml4N83KgjLDSrFasaEPFs+TkqLlEsLSKf+I4I
 pdjcsXxRYAkDqCgb0K47gO8WuePht7YkGm40SXY2cDCnjUpfxWxq09hi1TbsFwin9Dac
 Yq5NFZb4bkhW51tKLv5sWuooSI2aoI/gMq7Mg00Xk6vjlaqHp2gbVzlkjJa8yMp5y9ik
 fgJELBJTKn/dE4NdjxY28YPzgUE2XDvKI8eFlKp27hLyvq6n4RZE7GdFneLqNSO3noeg
 M3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ztRfInFr/BFTEFbI+H+ZdQUEXvNgj36MIMMt9VFoyAU=;
 b=ATC6dKxfcZQO5cTc6raxs21DxvcdwdDWYGbEbQNy/513k6EFw3mw2KCSFr2+uoH/V/
 ZwPpb+kpcpbzaQUXWK86XV3vCVmg7mZprWAf2RafbxKiulwBjAp2hNjE3+yAJ1OSQtZn
 45nGc4RzNoQHKydLbknN2rYHm9y/fa/J56dRwMq74Vkuh43Bwzwp/kBO2qvzttsjmfMp
 os2yZf3bQYCHL1W2NZ6n3ogFYT4TUZKOsRsinrGHB09uf8VFOpN8vzE0IyxUEQIe19mF
 rZUjMYZf4/OhjlnsUdaooDbNgUDrGEOL5ftXF+VGjfd2w5Tp1vlDCFG35ajU8+YEhIkd
 dFEA==
X-Gm-Message-State: AOAM5320z64FKmGphRfnu/UkuUaB3cgNBXToM2yZSQS/fN2tupiAf1A1
 /9iU23bW1zmHU0RgdHhsKGKZ76c48MXyTEss5XY=
X-Google-Smtp-Source: ABdhPJz2Pb6sLfv0ouuSrAJF4aS8sFXmLFJkrX+SkB23jECw/PBOw4oVcPRKtx+sagqvv2mdyUgsTgPZc4V2QMgyzu8=
X-Received: by 2002:a25:3242:: with SMTP id y63mr61835732yby.670.1641480614248; 
 Thu, 06 Jan 2022 06:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20220106134020.1628889-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20220106134020.1628889-1-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 6 Jan 2022 22:50:02 +0800
Message-ID: <CAEUhbmU3Xrj-wYMRzteHmFp_fqmzZPFC_JgmYZq1eVBLxbNgZQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix position of 'experimental' comment
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Vineet Gupta <vineetg@rivosinc.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Thu, 06 Jan 2022 14:50:28 -0000

On Thu, Jan 6, 2022 at 10:29 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> When commit 0643c12e4b dropped the 'x-' prefix for Zb[abcs] and set
> them to be enabled by default, the comment about experimental
> extensions was kept in place above them.  This moves it down a few
> lines to only cover experimental extensions.
>
> References: 0643c12e4b ("target/riscv: Enable bitmanip Zb[abcs] instructions")
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
>
> ---
>
>  target/riscv/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


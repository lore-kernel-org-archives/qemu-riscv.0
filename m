Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1niQvQ-0003lA-LB
	for mharc-qemu-riscv@gnu.org; Sat, 23 Apr 2022 21:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1niQvP-0003kG-7r; Sat, 23 Apr 2022 21:20:31 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:34734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1niQvN-0006Vl-L9; Sat, 23 Apr 2022 21:20:30 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7c424c66cso26822647b3.1; 
 Sat, 23 Apr 2022 18:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDlUdZ9UFIKsEh5V4UvPkZeHdMhYrvkRaBOzqRsZYok=;
 b=RpWMb1vXRNbSqHs16jzqEBtK1J54ZBRS70IYQm1DvC2Y7Kw2z4TGKR1KLywqLj6ImX
 duGY9fTe+3RY8zFFuEWHOD0htREjIXd1t3OYFwwCXX7BWtW1WjUdxD9cgTg29iDXlSBd
 pwyFSgM+U+RS9YDCGTcLU1MbFqWPO8+POB0NaL2S89j2mqNlgHYiP6otH1zUZYZmqhfQ
 Et/i1rfxvv9yypcna8T4IMANl298Q/J+sO/Am5RyRHNYF2TlTgNHDyN4urwFqwnbTKCh
 ZOkO5QDxJFWh0sv7Uflzm+AEhk+/wXEuhbL1usNWiRPBIeJT/N15E8/PNAxXUgAFzgYB
 E8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDlUdZ9UFIKsEh5V4UvPkZeHdMhYrvkRaBOzqRsZYok=;
 b=FVBZFnsCRJsRqh00EoLQqg8YdgvsvDgMioQ8F8k0Gy/sb3WwYfdWHC9Wbnpk+vD/lk
 bAOgvZblvYnDiANfVacKv9rbA3dUYNavr31x3jDigZXZQGXaWIFSgu42Lxq3gPo3N/c3
 i2M/yR6RjQzr9XIirzIUid2CIIEcv+h22oracVe/wtG3JVonlgvz97KLKhic/mBFwLjd
 LOjFJYgMNLr0ON5ucMv2EZh9kSTWyslhpD0gNvvtsDjcZM0X/Z+AnhoEVtDpfgmamCJd
 dTASB2Ik+48VQ2khyLsJUOzQn5ZMJDctnfTlkK8SSYunfLWN4uKoHHNRUhF2WnJB1o/J
 0Qnw==
X-Gm-Message-State: AOAM533kKlzfRlVaRzdZLRuz6VKmF9T5T6FbI241B20BGh6FsZoU5uVu
 CLSxdUFXhmD+4v9zS3H/T2PFwqbOVZb2JCaZsXU=
X-Google-Smtp-Source: ABdhPJytmGkoHlqpjur4jO+fvxIN8fxID2EIjsswF4VlmMkZJ5/lcRGOe5ibrq5U3DGgSyFT+yBILFsc/tk10K0Diok=
X-Received: by 2002:a0d:f103:0:b0:2eb:488:f0e1 with SMTP id
 a3-20020a0df103000000b002eb0488f0e1mr11136010ywf.487.1650763228072; Sat, 23
 Apr 2022 18:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKNtcV3MN0qzVEOgty=o137-QfYm4_c_hHmb1O9YfhSiQQ@mail.gmail.com>
 <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220423215907.673663-1-ralf.ramsauer@oth-regensburg.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 24 Apr 2022 09:20:16 +0800
Message-ID: <CAEUhbmUMTBuMgToupEssSsqaQtbjzNKP5Vhfi2J-wmCgzVxyUQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Fix incorrect PTE merge in walk_pte
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Huber <stefan.huber@oth-regensburg.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Konrad Schwarz <konrad.schwarz@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 24 Apr 2022 01:20:31 -0000

On Sun, Apr 24, 2022 at 5:59 AM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> Two non-subsequent PTEs can be mapped to subsequent paddrs. In this
> case, walk_pte will erroneously merge them.
>
> Enforce the split up, by tracking the virtual base address.
>
> Let's say we have the mapping:
> 0x81200000 -> 0x89623000 (4K)
> 0x8120f000 -> 0x89624000 (4K)
>
> Before, walk_pte would have shown:
>
> vaddr            paddr            size             attr
> ---------------- ---------------- ---------------- -------
> 0000000081200000 0000000089623000 0000000000002000 rwxu-ad
>
> as it only checks for subsequent paddrs. With this patch, it becomes:
>
> vaddr            paddr            size             attr
> ---------------- ---------------- ---------------- -------
> 0000000081200000 0000000089623000 0000000000001000 rwxu-ad
> 000000008120f000 0000000089624000 0000000000001000 rwxu-ad
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> [since v2: Adjust comment, rebased to latest master]
>
>  target/riscv/monitor.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


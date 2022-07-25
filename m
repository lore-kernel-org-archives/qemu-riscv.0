Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oFpsB-0003Jb-Fl
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jul 2022 00:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oFps8-0003I9-Vh; Mon, 25 Jul 2022 00:39:13 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oFps7-0002R5-A0; Mon, 25 Jul 2022 00:39:12 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 12so9096413pga.1;
 Sun, 24 Jul 2022 21:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=meSFDG/bt0pIr9cTWifX8fmUBmFc2b0R0GJh3gR5Jpg=;
 b=OREGh4VtieAQVc+Zk/ekiEfltCNsf6/NCL/YoTivTcDKaoHG/Vfqq0frPMLATUhkii
 AkcXHQA4eDB5k4wmxTQCnasFsP+XBD+M4xNt4WyK3rt4JWWSza7Cb3hwNdJosB9BoozK
 MVoZkSg9LVa2ChXmNEHkStXLUj5hGspgQHAW7H7s20Hf9oWwQt2mgkIQQcDGEldGb1S+
 X3A44Cbtjz4hjB/xjIZs91e/94rFEOtVgUVQ3gL069l4pNLL0sCQ8XRf2m/uVY3pRr48
 +cQDkUGaW9V5jmnUzPnxLPc6V25bkOutZ2HsbO/vaC7G6+jUS8CvbDLhmglrkpBKJaPm
 IdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=meSFDG/bt0pIr9cTWifX8fmUBmFc2b0R0GJh3gR5Jpg=;
 b=oK+CJg0bj/bk7Pq5gbq5eJL6kpZJQODEo/QcIUvODmxWTyTERGAhBZ/yTylgMqrHxs
 QS50VrG+cMnRBdxfl+Rc0EBe2mIITNO1I4YB5st8KAQP1ZarR+gxLL71BbkL6Xq7LAA/
 d4IonnaDWc0BLZaXBX/8AtChAxlAFjI+yuZW4uEHgN9fhkvP/92Co4oHYER6soIzSZnz
 fwnvrJYpBngA4cUy/omjZNLx8+TJzQfjkWFicVbcp1nJmMdG65np7MlHimIlxhhO9s5O
 HDjXA1c2ZdlReO4lnECF81XLU2d5H44tBJWZNPQaGygLFjk/9vN87RJofktZEp7swkuJ
 HCqg==
X-Gm-Message-State: AJIora/2humkp9Fz7u6qF9JjszNnE94M0Tj2fxBdtDFqcEv3WDscyZQ6
 +9SHvNjqO9sIeEh5ko6zAdtVt+28r1VGfkBGoHA=
X-Google-Smtp-Source: AGRyM1sW5cIXBti5WYpHeaXLPy1xKmTi7kCvajlLmJLSXH//c+iCtUVcvC3GRYYD1yYJcagOX9YksN2+4ivAAMLm4lU=
X-Received: by 2002:a63:f14c:0:b0:41a:b83d:a636 with SMTP id
 o12-20020a63f14c000000b0041ab83da636mr7965264pgk.361.1658723949280; Sun, 24
 Jul 2022 21:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220725034728.2620750-1-daolu@rivosinc.com>
In-Reply-To: <20220725034728.2620750-1-daolu@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jul 2022 14:38:43 +1000
Message-ID: <CAKmqyKNOtYLubJ0hMaMHY9YO3w21d-S5z3ABKV5KS2UvjA+dRw@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] target/riscv: Add Zihintpause support
To: Dao Lu <daolu@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 25 Jul 2022 04:39:13 -0000

On Mon, Jul 25, 2022 at 1:48 PM Dao Lu <daolu@rivosinc.com> wrote:
>
> This patch adds RISC-V Zihintpause support. The extension is set to be enabled
> by default and opcode has been added to insn32.decode.
>
> Added trans_pause to exit the TB and return to main loop.
>
> The change can also be found in:
> https://github.com/dlu42/qemu/tree/zihintpause_support_v1
>
> Tested along with pause support added to cpu_relax function for linux, the
> changes I made to linux to test can be found here:
> https://github.com/dlu42/linux/tree/pause_support_v1
>
> --------
> Changelog:
>
> v1 -> v2
> 1. Pause now also exit the TB and return to main loop
> 2. Move the REQUIRE_ZIHINTPAUSE macro inside the trans_pause function
>
> v2 -> v3
> No changes, v2 was lost from the list
>
> v3 -> v4
> No longer break the reservation in trans_pause
>
> v4 -> v5
> Rabase on top of https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>
> Dao Lu (1):
>   Add Zihintpause support

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                      |  2 ++
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/insn32.decode              |  7 ++++++-
>  target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
>  4 files changed, 25 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
>


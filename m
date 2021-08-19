Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGY0d-0002LO-0e
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 22:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGY0b-0002LC-O5; Wed, 18 Aug 2021 22:42:21 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:45851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGY0a-0004e7-6y; Wed, 18 Aug 2021 22:42:21 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id l144so9318466ybl.12;
 Wed, 18 Aug 2021 19:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFTGxnjrBAKsZjjygBOr4v/5ZZ6y5gk1a86/IN51sdY=;
 b=BTol7tH35KP7K+FOF5cfiXfmEL9yCy9LwGcCWHdGE+vrSJVR2uJXqzShFAWWAe6A0D
 3LL1WgBwlSgI5Bn/e1Llsx4srBdPh7fCsVzKVoz1Cbc+4hbzzxWqhWOP+SsCVNomm6mG
 2Cj3ifyddG/WLyeMxx6qqgV0cJDxoQaEMcdAAm49v4ix5apcgZI7W7cDMDkr0u5MvPD+
 y1T3ttCcNTjf4aiq/iDnk6WpCkoJlcl3X+rkVrbSyOvZBJ6gIRYLW0fCsTqe8QLVLQgA
 yP1Aq2l3NXnoC7b1UHsPeMFMsLowsHe8byliATwSEFKRZiAKMx49z2xfBcQfBN+aVi+O
 md0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFTGxnjrBAKsZjjygBOr4v/5ZZ6y5gk1a86/IN51sdY=;
 b=TJGNCawwkPX5dv8a8NzJ4rsFolhg3OEPq6X0+sVS+BLn429QljXdbsoA2MCup54E9S
 9y7kBpJFdhSklmp2s6QUwsLz/pHjNQPAmjvD7I0uyKsbhglmejtg51AbtghS98t1QHdc
 3g1Jl7l4ZXUub+HyZCJ1t3CqPGINOjidfnG00+MT+y7BhJjh/GBiZqHgO8Eh+m1ZDeBq
 5JE0sA9Pe6FMyQywMGkY9lAKD6mX86nylHiIal10+COlEiDFG4lM+9SH/I7stJL2fkw1
 NFEIEFqLzgqIruYtgjt1Z75dcvIWxqf6TdJXD0GKd05DSyEX7GmwI+GGrmoywG5JocTs
 IBTQ==
X-Gm-Message-State: AOAM532ndIqqCxkNX9tX+yokZN+azM4sLekZrRJ9cqZC8drRy7AABmXC
 vjPelxAtsq6Jpd+iI5k52880Tzacr8qvEi8WauI=
X-Google-Smtp-Source: ABdhPJxqyPrsgFhzga86ps03aEFteokThy+O1mB8//v1lvagtpE8gHumhyGPxLNVY+Eh7f/kZ90vXY8sk9ziZM3dLL0=
X-Received: by 2002:a25:6d44:: with SMTP id i65mr14765368ybc.517.1629340939140; 
 Wed, 18 Aug 2021 19:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-6-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-6-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 10:42:08 +0800
Message-ID: <CAEUhbmWoJcWwsVGMfjL9f6fdv1Zw80hD7c=NmjYzWousSk8JOw@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] target/riscv: Add DisasExtend to gen_arith*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 02:42:22 -0000

On Wed, Aug 18, 2021 at 5:23 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Most arithmetic does not require extending the inputs.
> Exceptions include division, comparison and minmax.
>
> Begin using ctx->w, which allows elimination of gen_addw,
> gen_subw, gen_mulw.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 69 +++++++------------------
>  target/riscv/insn_trans/trans_rvb.c.inc | 30 +++++------
>  target/riscv/insn_trans/trans_rvi.c.inc | 39 ++++++++------
>  target/riscv/insn_trans/trans_rvm.c.inc | 16 +++---
>  4 files changed, 64 insertions(+), 90 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mI1yk-00068I-52
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 00:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI1yj-00066U-6t; Mon, 23 Aug 2021 00:54:33 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:36862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI1yh-0003lv-Op; Mon, 23 Aug 2021 00:54:32 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id f15so3424744ybg.3;
 Sun, 22 Aug 2021 21:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=espU41oB8nx3yBQ5vRolREFGFqDcY/FQVwWvkbWSHnc=;
 b=J54avKt17Iqs75MAXF0T46qgWE8zgBW5808nQYwMX/n+blbl8tnpq3RwUJdcPu3DKF
 dQZWzFc9ue0hdGcZw0KX9XwRyHHGrYQx6oUgcxRUIoRUvQU0tYhDUAsQ2Z/p/MwsDX9G
 feH02SHkqmopk+jEhCuzwud8nrF4YOA3p9E+lbtx5bXg3BGENwxEJW9dGMZXZQiqt+zs
 pd1QnN0Q4dFgofUuPn3gKpwBsRcsnf2I2tx5h1kwzEMP5E1M0KDN6mlwVXuAE70VN/Wn
 f2Hf5GKj0MD1o0KsRHbRcfV4pqjJnS0sJipXoQxXi71LGvoLbzi02Lq9yl6r+/r6Q+cl
 lH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=espU41oB8nx3yBQ5vRolREFGFqDcY/FQVwWvkbWSHnc=;
 b=mY7mG7ZsYJS8pJi8yg1B2dkaw0o+y1YReTXHc3Tos5ix5BE/ZPkHdXJYU9EHUSeqZ5
 GuIbWgSup1HKWv50jc0AoM/p8hD3OSTryXCd6l46OUW+nDiEatX92d6q2EGDVc0G2H3I
 p48rFJj6eWh2PVXvhMDBAtPJxjcp8Sa2YhhVKzytAOz/u1E9cvMawJP2x0W5KdN/BErU
 x4Ve/xYOyiZlLy/SSC5ZeQ+EGhMuBemcyAnX2LMc8oa/biDFRl+FYkS4QMWyJPQcYDIn
 TGzbrILQAHQG4XJCHpldzAiZqE4YE1/Fr/AVICbdSHaUOzjoNLuvqChbRf4WJTkg2osG
 BLLw==
X-Gm-Message-State: AOAM5317XoQQuRtDmqgxifmDFYrX7ZniKQ+veeGNb+RvMR7yfHJFLW+/
 sqqeCV1tWCI40ZN9tWe/MpcNmI99xCpam+o+Hk8=
X-Google-Smtp-Source: ABdhPJwdbDKOpNzS4OlAfLrNq5ZYjsF7dyO9f3/SQZ/GvvqsuWODvhpis9z1CdwIYPaVuYhQqA/UaonRRHg6ZofxJ/0=
X-Received: by 2002:a25:d712:: with SMTP id o18mr2117316ybg.122.1629694470284; 
 Sun, 22 Aug 2021 21:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-16-richard.henderson@linaro.org>
In-Reply-To: <20210820174257.548286-16-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 23 Aug 2021 12:54:19 +0800
Message-ID: <CAEUhbmXw1yHj42wubAg0zA5WO_3mXg2dYudD7G8ofLPgQ33JWQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/21] target/riscv: Reorg csr instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
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
X-List-Received-Date: Mon, 23 Aug 2021 04:54:33 -0000

On Sat, Aug 21, 2021 at 1:43 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce csrr and csrw helpers, for read-only and write-only insns.
>
> Note that we do not properly implement this in riscv_csrrw, in that
> we cannot distinguish true read-only (rs1 == 0) from any other zero
> write_mask another source register -- this should still raise an
> exception for read-only registers.
>
> Only issue gen_io_start for CF_USE_ICOUNT.
> Use ctx->zero for csrrc.
> Use get_gpr and dest_gpr.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/helper.h                   |   6 +-
>  target/riscv/op_helper.c                |  18 +--
>  target/riscv/insn_trans/trans_rvi.c.inc | 172 +++++++++++++++++-------
>  3 files changed, 131 insertions(+), 65 deletions(-)
>

When testing Linux kernel boot, there was a segment fault in the
helper_csrw() path where ret_value pointer is now NULL, and some CSR
write op does not test ret_value.

Regards,
Bin


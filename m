Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9avm-0007vZ-SJ
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:56:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9avZ-0007jR-QA; Mon, 17 Jan 2022 17:56:42 -0500
Received: from [2607:f8b0:4864:20::129] (port=42971
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9avY-0001ZJ-Az; Mon, 17 Jan 2022 17:56:41 -0500
Received: by mail-il1-x129.google.com with SMTP id u5so11769560ilq.9;
 Mon, 17 Jan 2022 14:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=joYxvGMSfQq5SJzhwpwJXhn+Y2hQqq2kmwT1jhKdEds=;
 b=NR3ea9IarLdVL/q5jDWUD6efUSolT4KQybr+dTyCb+S7ly0/JyVHs8Tv4CVwuKvCrG
 uBZjZT+tgXj51jgKqE172C+GCDs7w5KhOELuw9cF2csHrQmRfbKTPXK9QBR3yjxDy7ua
 +d4tQcbLIDe9ONMDS0XCKjk/9o4b4Bj9DVqXEXNZqBwUPTaIXiVwqxfL+fZdJ7PDeXXZ
 YFSJCgeXVTQq9lEL6TlQXoRtLLSR80i0M2N5iit/Ngsk87djOZrz8/R6MHbYIE7DyrvJ
 cmhhxVPKtL8TGlH049qChN+XmcMQCUOZjwRicC4/mSiuRTRWH8dMAU6K4RLvAq3tRjH6
 QbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=joYxvGMSfQq5SJzhwpwJXhn+Y2hQqq2kmwT1jhKdEds=;
 b=HpTk2zsg4xowk65lin2sBaATv4J8yPVaYbxC7WTx/a9/jt7TkZ4b/mbHNTpj1a/+Xn
 MXrc01Ce25uPgOV/LN8ENt1994t3nE7YE/QYksTH+hDUK/AC5fnTrL8+OUpTPOYn8QIK
 Cexgxh8q0rfwNfN9bPnPJKiPjby/UfIvw/HrCE28a6VWitwI0n32nv71TKpoCpcfJS/W
 rsn1sqY93uF9fEyJDDKFH+PV9JQb+R/r9pAxuDgvyg19/4Mg2DPFHCJzPTjClbdBNT1y
 AXrHgqUDOcEKu/nUGX2GZuaRnlCu+De82cUSZMrxjoAdJ7+K86GmiMs8VLTYOPT+gPr9
 GOIg==
X-Gm-Message-State: AOAM533vFVjzLBw+tjcM0x98gzKWJlL7tfXvGotRJ7l9asmZxcgJ0lkh
 YprzhxONU2Ak70vnvNAsMmtCVBYGIQULS1/K/VeeCfeAAZRxygLn
X-Google-Smtp-Source: ABdhPJz0Hd3MKIrbjLAR+Z5K7luKIRFVzCaC1xZPL+JCZMVkzbJ/T/JhFYAhwQX8UcsDPWzf5rCh0nRQUx5aY+Nh8ig=
X-Received: by 2002:a05:6e02:b4c:: with SMTP id
 f12mr12436096ilu.208.1642460198930; 
 Mon, 17 Jan 2022 14:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-15-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-15-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:56:12 +1000
Message-ID: <CAKmqyKPC++e6S-12sf9S+7wnCtv4dNkv9zMMKCM4+8eNKVBc6A@mail.gmail.com>
Subject: Re: [PATCH 14/17] target/riscv: rvv-1.0: Add Zve32f support for
 single-width fp reduction insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Mon, 17 Jan 2022 22:56:43 -0000

On Wed, Dec 29, 2021 at 12:48 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Vector single-width floating-point reduction operations for EEW=32 are
> supported for Zve32f extension.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 1f5a75eca7..c3f4dabf36 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2974,6 +2974,7 @@ static bool freduction_check(DisasContext *s, arg_rmrr *a)
>  {
>      return reduction_check(s, a) &&
>             require_rvf(s) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> --
> 2.31.1
>
>


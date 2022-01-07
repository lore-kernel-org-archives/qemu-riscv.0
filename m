Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5k1p-0004Zs-RB
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 02:51:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n5k1n-0004Uy-Nw; Fri, 07 Jan 2022 02:51:11 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=38477
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n5k1m-0001uN-6y; Fri, 07 Jan 2022 02:51:11 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id w184so14543687ybg.5;
 Thu, 06 Jan 2022 23:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e8tpjh1/aFjGWY8ueIIJdh1cBYBoULnE1/B6ihI+1Ek=;
 b=NxQMAOrIieT/XhpkjCPx0W4XJyoA7PAtHSZzuhKySDp5BPyf23naWjC3qudsmSseKQ
 G6X+hpnH8m0Sz7A6HZAZFMmzBmO5XyNhBhNI2nZN4QAFQO/cAKRfv5YnUYNC+nVz3V15
 QiF3ImUlYxQsQ+RdNipBkGPOrnE5WksXvYmiRe7Uk8WG0L++hSW9noRLwTHnlXA/1vZ4
 m5o+1EKmWZWVrVcFptCQr4lyZT9ajpo52ePpi8jtnMBjfdRyM6EYr//C0JLDKOZABi6X
 KAKw/r4wmMqRRm6+36twQ+XKxa6wRgvS89uigedp0VMboaYeyO+Ibd1DLbS3CfB9KRWO
 k9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e8tpjh1/aFjGWY8ueIIJdh1cBYBoULnE1/B6ihI+1Ek=;
 b=lgmHfjevd7jnAGdKixJi5c2AznRxTuIYYRV5bgKFxRxhxxa2Itv1Cf6wxV+s+TPWgp
 oL/cmOASkWBCLFpX1uVWSZX72hmnbkpuff03hAlu4llq3sKGL19+6qF2wwQEd0Wfeffx
 x8vLAwwur/sl4Xi/yYQsl7o/eoN/VV8EYL/Ob9TBOD1mWVmbFTEctCOa0INKyuztI6VN
 ZJmGD2rffo6Z1s6VvEsemaBc4ULUf+DQzNmUuOl11ht5dUAgeF/h5RxYD2dDLScXlsRP
 7433yMdLnd8WNfFpfYwHd5p+JhmN0Vi5IxS+En0jj43KbwiZv+0zmk/UOKvzBJIxkLAC
 /v+g==
X-Gm-Message-State: AOAM533YCmFupXjC63e2FJtQcWQbIa8N9ciOzWaFfdBw/RCjV/5ieRqN
 7x7my1Wu7/LqXleVL4Z3NlooSUsGJWxBi6wdYWw=
X-Google-Smtp-Source: ABdhPJwOABlJ0nyEyw675h0o4cHszCKDJ1PfVXPIDQhpqeolRQ3BpSs0hzJj0mm+GlqgsoU0ayAkN1ArAZCUcj0QDcE=
X-Received: by 2002:a5b:74b:: with SMTP id s11mr25699850ybq.90.1641541869203; 
 Thu, 06 Jan 2022 23:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-5-atishp@rivosinc.com>
In-Reply-To: <20220107004846.378859-5-atishp@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 7 Jan 2022 15:50:57 +0800
Message-ID: <CAEUhbmUkpqeLntB_5d85+1nyjxWAs64FvbfmCft-qKvjK5t3dw@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] target/riscv: pmu: Make number of counters
 configurable
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Fri, 07 Jan 2022 07:51:12 -0000

On Fri, Jan 7, 2022 at 10:18 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The RISC-V privilege specification provides flexibility to implement
> any number of counters from 29 programmable counters. However, the QEMU
> implements all the counters.
>
> Make it configurable through pmu config parameter which now will indicate
> how many programmable counters should be implemented by the cpu.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.c |  2 +-
>  target/riscv/cpu.h |  2 +-
>  target/riscv/csr.c | 96 ++++++++++++++++++++++++++++++----------------
>  3 files changed, 65 insertions(+), 35 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


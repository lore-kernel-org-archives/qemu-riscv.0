Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1na5cg-0000fj-6P
	for mharc-qemu-riscv@gnu.org; Thu, 31 Mar 2022 20:58:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1na5cf-0000fG-7K; Thu, 31 Mar 2022 20:58:41 -0400
Received: from [2607:f8b0:4864:20::112e] (port=35319
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1na5cd-0006Z7-JR; Thu, 31 Mar 2022 20:58:40 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ea1b9b3813so17024957b3.2; 
 Thu, 31 Mar 2022 17:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aleXK0rtIzUvI0ila9GG5UF5SDZf///TMrabEoOU3PE=;
 b=ipIsf0d0pNL6WGK2X1ZAXrXaz63JeGZuDYLVTA/dNTT+4h+RQzSQ5BsoOYecXR7kCu
 pJk3vWxFGRayGRQQn0U0eKArgCd3LEIT0TASrT70vxugPQRvqLnf9yeXoQPYLXvjMZzS
 p5Ujx2c4E/3I8c5fmEmFiFfA0LcmM9yoxRSpST0A+AVQqxXzF2yCEInBEYHwOyf62Dyx
 EmMtOfW5Qm+QPxbQiC/d3Xj8/wsKFRGWlu3q6t1Z22S5GfJKd3r6Rl6b6J/5WyjamJyU
 rYHnOpcwg5/zc4Xxx8ugzyZREHsB71Q8uRPN2aqfDtlCb/BHIDwpLdoIZzIqao5AO7Fx
 RRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aleXK0rtIzUvI0ila9GG5UF5SDZf///TMrabEoOU3PE=;
 b=YQYMmv29QEmeJgWOlVh7mj6JomDsS4H0OJJq2hHWnbN7se2xVAQOQBG36jpu/qZRYv
 r5y5wYrw/ADC+GEj8J3u0u5kXjOP5JQsP20cx9UhpKPakAiyfiaOANC8JUwSTcPnKsuE
 0Imlk03DjvxX0AYh8pdzMXXA89VsDhTHgT5W9pev/N3JVADpigauwyGIQunp7iXN7j6J
 /gsrVAUsSY0sXwpoywI+K7+Ya+3pQoLIOs6MSYDX5S/mhOQ9LFA1f+KLlOaMWQYVe9+X
 kXtJ1K5gIQKveFopJGIorndI2lDOVa5q3toTlYV5W+FUuYkVGQGqp+BngVIFBOjAhjrO
 LfjQ==
X-Gm-Message-State: AOAM5336IB60A6l5QCLvADY40Jvqh05yj/7V1BDu/FhpFp1Yw1nKfgG0
 Zlr7xkaVFWnGHSZ0g5C6CjhBSC8lqJiESdHquUo=
X-Google-Smtp-Source: ABdhPJwEEaQ7ImA7Hasa/wRlSY1aMv9bbkXTRUDILHVdxow5Q/FquRuFZpqXsCoJN6zo8dLByDxOiK0IaYwpVwkyddg=
X-Received: by 2002:a81:e90c:0:b0:2db:d63e:56ff with SMTP id
 d12-20020a81e90c000000b002dbd63e56ffmr7911625ywm.60.1648774718012; Thu, 31
 Mar 2022 17:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220401001904.415226-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220401001904.415226-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 1 Apr 2022 08:58:26 +0800
Message-ID: <CAEUhbmWeTG3wqf30M1t-K714_6JTN5-WGJSGg=xjEehi3QBp=Q@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Enable TPM backends
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 01 Apr 2022 00:58:41 -0000

On Fri, Apr 1, 2022 at 8:19 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Imply the TPM sysbus devices. This allows users to add TPM devices to
> the RISC-V virt board.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


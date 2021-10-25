Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1merPI-0002Ci-C6
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 00:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1merPF-0002Ad-47; Mon, 25 Oct 2021 00:16:18 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1merPD-0003Tf-Lg; Mon, 25 Oct 2021 00:16:16 -0400
Received: by mail-yb1-xb32.google.com with SMTP id t127so22380749ybf.13;
 Sun, 24 Oct 2021 21:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+rjhVYTOwg9Y4vHzFnURRow3L+NpHb+0yqAvXf86MFA=;
 b=qiGb/Eg3r09IA1zisjya8ACIUROR+5sA5oXXcfJ52dBydfDaU2aCtWaJfwpmAT4Ljj
 kzx/x+LG9iQb2qh463rG1RQu53nJ6BLMdqebS7R9EXyyRTvWVQph8qxZb9Aw0nbjfXp5
 yus3aaMGTbwJmol1pe+XVJbJBmyglD8HBJZsTqHecWwEOVFo/7sHPtts8syoAAMbR2V2
 fGMvt78o20VTmdTwTZr9eipaDrkhN8XwvMmuqZ8JTzWzDz4K85ydgXGa+b/SXGTwgdPd
 mC+sExlNR0VB/d0W+Y4DK2ou+iedYoVlSJZpZm5DX9TMz7+bBzpPmsi06stDN8KJTuck
 1tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rjhVYTOwg9Y4vHzFnURRow3L+NpHb+0yqAvXf86MFA=;
 b=nzuGBg6KZYTEYPKn54zrxmKpOwf0K4UhgVI+E5leTM0ogH1uxFaIYqUx9czwr2fnLd
 6RzggnadIrH5ReFBbdN/aW7+zDNPv/vpld0ZzyDbOlBjAi9H6hfiEiQbLS+T9yTBCEGB
 1so2nHLMd3ZG/mvYaulWuQeqp6mNjoqaqUR/dYvYsa+6V3Fg9QdYwSLsX0h6B3brJFK1
 Clgdr95jVB4rBHcKDozIKuoiL3Sr0Hj4YWPzeX+sxRJIVAL4Svlq3yXgti74j3ZFDqMh
 SQ2sKoO+7euTWSfL3fDloTi53k68zK9l3uIFIBScBKWbnf9Diru4jOY4QkP4kqsFCKMe
 l5pg==
X-Gm-Message-State: AOAM533yvVf3gZxGx9DRWi1pDgF7nEWRU2z4DiPmLWcOnc65lDHBbHcV
 KHH+7he87oPJjyym7R3tguhwcvo+6bOXFmpxzn0=
X-Google-Smtp-Source: ABdhPJzGrL/u8vo5AJQGqvKzumK7yEpAaJ2OJU939YLloVlwCjweYx+G8qc8vDGqCWOUGGW5ilecyJYW/Z/Qe8awf88=
X-Received: by 2002:a25:3b16:: with SMTP id i22mr15166310yba.467.1635135373322; 
 Sun, 24 Oct 2021 21:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040657.262696-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211025040657.262696-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 25 Oct 2021 12:16:02 +0800
Message-ID: <CAEUhbmVGDtkBAC1cTEno_cCcC_RW30_0xMGS+z5uLOiiwJw9Sw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: opentitan: Fixup the PLIC context addresses
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>
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
X-List-Received-Date: Mon, 25 Oct 2021 04:16:18 -0000

On Mon, Oct 25, 2021 at 12:07 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Fixup the PLIC context address to correctly support the threshold and
> claim register.
>
> Fixes: ef63100648 ("hw/riscv: opentitan: Update to the latest build")
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/opentitan.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


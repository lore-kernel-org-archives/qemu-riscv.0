Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljujl-0001EC-Fj
	for mharc-qemu-riscv@gnu.org; Thu, 20 May 2021 22:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ljujf-0001DF-EK; Thu, 20 May 2021 22:18:01 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:45622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ljujb-0006hG-Le; Thu, 20 May 2021 22:17:59 -0400
Received: by mail-yb1-xb30.google.com with SMTP id g38so25436461ybi.12;
 Thu, 20 May 2021 19:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/syS/icGFyxqTWAgtJ2TnUzN3/74MiGo37mk1Qlyr8k=;
 b=rWoV4daxzXSWt8E+fOO+zikd16j2gozddZMFVPQVhOgCFEeesC8daT/89AMe3nBYb7
 YUCRZh3vIzq301vvNd+kUMEVeJiES3ohGNjQj4kNl4cbmusieV5rzecP/psiMTttNJnG
 wqNhXizxV/7yOOQuUwkjZ5dE5ZqOf7mLBxSJqVb6IvNnHZiTzlveY+BbcroXcMt8MUm/
 wU8e13S5UPZpYMyPok2ccIG9Rb5Nc+WeLtjrmWz4vbs6GMQlX2301CcUzVE6+1y/63cm
 lWBlX7AHQu+dJXb8aIdRAQ07Z+5BMAb0A1o/jg9aqNuOL5jHEIfD6OICQzJUnhxgPX+a
 N4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/syS/icGFyxqTWAgtJ2TnUzN3/74MiGo37mk1Qlyr8k=;
 b=ecyYM3UwwEsEUwTL9JsLVdEWqohbGO7bHzLxyIhNySeeobHHst1eT11sJKsIglC6Ib
 AUyKvyn1Ttx2NnciNEnwZZIE5+9GpiFjKyWSPF/liMG2Cn3b7e7jNMk2zQNXv0LVGLHm
 rNnnm+55TGGNF1c048TPUkqUWec0LzjkxDB2YBVsK0iy/29s21z5EXpt/yrQhEKQtz/z
 YGQ+8g1mYDAUlyiUkF5sDTSUyTLJx2JGyhQuAqbwttftr4yFlcoqdWzhfPiX8bcGiCvW
 MiBvHEYwNqBjMzMaSQkF9h3Wfkfgy5IMpuQGkgfszL1pCK6B/VZAZZsVeoGNxBwntq2E
 U0LA==
X-Gm-Message-State: AOAM5335pKLC6C/ddQ8i1xt4CMQ6eOZ07j5a3LcyRX82Ioe81jj9xaSy
 W4Q9pE90YK3Q04Da1EGJ+fTheuC3hDmlCdMESZs=
X-Google-Smtp-Source: ABdhPJwaRj72QYcUK1a5/ZnLPCi6QM70r4VN3iuFcxo4fFvhjkeCye3iLujWYkJLAXQzRknYAltC7Pmh+Wk3eCOQbH0=
X-Received: by 2002:a25:744c:: with SMTP id p73mr12148613ybc.306.1621563473901; 
 Thu, 20 May 2021 19:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <ec5f225928eec448278c82fcb1f6805ee61dde82.1621550996.git.alistair.francis@wdc.com>
In-Reply-To: <ec5f225928eec448278c82fcb1f6805ee61dde82.1621550996.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 May 2021 10:17:42 +0800
Message-ID: <CAEUhbmXh3M28AUyCEVL-SSJsFbEz0QYj+vKzH7rw2mNoHmAMFA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv/pmp: Add assert for ePMP operations
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Fri, 21 May 2021 02:18:03 -0000

On Fri, May 21, 2021 at 6:56 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Although we construct epmp_operation in such a way that it can only be
> between 0 and 15 Coverity complains that we don't handle the other
> possible cases. To fix Coverity and make it easier for humans to read
> add a default case to the switch statement that calls
> g_assert_not_reached().
>
> Fixes: CID 1453108
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/pmp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


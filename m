Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbaH8-0000s4-Qh
	for mharc-qemu-riscv@gnu.org; Wed, 20 May 2020 21:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jbaH7-0000rs-Om; Wed, 20 May 2020 21:45:33 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:42063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jbaH6-0003Ss-VM; Wed, 20 May 2020 21:45:33 -0400
Received: by mail-yb1-xb44.google.com with SMTP id i16so2001760ybq.9;
 Wed, 20 May 2020 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PGOPz01eGt2UWTZY2JliWS6PzPaplAXkbHrZ0kWKSqM=;
 b=dveqwqNO/wcATlfB8sxVh9ynno9tZaw5XQmLEDWZs1JIpl+1fonJ4tO94RS7hvCwOA
 dVL2C50XeaAxQ8TfiMie4GKpYq0FyIC5eJ7On9ZQI/gSupXCNByoYoVfmalI2EDLTlAR
 Gh/yjduRvlpeCSFOJTAjHIeo9VXJMAt7ggcqCl6nWwoZMXgRE5aO6jeidNeupihpKrzL
 m40AjGhTGF10NcfZU9hEO5odZim7I77cOWNKDm366Ete/XOAgk4tuR9d0ihrpCngThRJ
 l4ARE3btgZqY657syMSO3enJ9dhVv9txQl7C6Bxq8VevVAruotR4pHnwGLnSb+eJxuOc
 ZLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PGOPz01eGt2UWTZY2JliWS6PzPaplAXkbHrZ0kWKSqM=;
 b=Bnl2dAZgEaspRcuDVDhIcizlAkwVF2kr+RingAYFytf0Bjv+d1OWNwJXRap3QuXYRv
 mZ9PEaDdSNfqadR3a00ik1bFVwEwWDUUlJ1vXjIP7N9l6UawGSumZhHwReSYe1LYrbLA
 42ooYHktrlaYBKuzjDL8s/E0CNrTn2A6p/YjqlUxRJ5HKI2u78V+GD8KYXJJl3cHYIw6
 7IhIdksCxcuvD0b2yPbAqty+BH6dV+uipvtzQQmmxzqtsmnycebckvMk51U+SZW++he1
 aNpl6Z3t8xa+Ik4Qu5JiaBkCySiVyvqtVWd3RIb0syQKIEt3upxc45m4WOjbQ97re/BJ
 U9TA==
X-Gm-Message-State: AOAM532Hf+bLLbAqiM1h92AVdc2kRw1BgGYhwE9u/oPQ81NvdijQcXnb
 dwW92sxIY+wge0PU6LwHjO71gOyN0qdovGXZNxE=
X-Google-Smtp-Source: ABdhPJzkt4WFZCJpCkVHQfEvGfxpdJ2X9V/S0xwMtpzPCGGjNvPQ1+JmcFdXtFxV/dKdQkVlX0KKC6KeUgZDp98WZmE=
X-Received: by 2002:a25:593:: with SMTP id 141mr1101590ybf.517.1590025531674; 
 Wed, 20 May 2020 18:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589923785.git.alistair.francis@wdc.com>
 <8ad7eb9be23b7483797f82d58742100ca40bf0b7.1589923785.git.alistair.francis@wdc.com>
In-Reply-To: <8ad7eb9be23b7483797f82d58742100ca40bf0b7.1589923785.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 May 2020 09:45:20 +0800
Message-ID: <CAEUhbmVZKNaASkn6bx2aWAbqiGP6UkQ6cAMwciVEtvUF53k7WQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] target/riscv: Don't overwrite the reset vector
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 01:45:34 -0000

On Wed, May 20, 2020 at 5:39 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The reset vector is set in the init function don't set it again in
> realize.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>


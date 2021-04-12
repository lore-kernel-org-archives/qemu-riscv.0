Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lVsbG-0006FP-Dj
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 05:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lVsbA-0006DR-8S; Mon, 12 Apr 2021 05:11:13 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lVsb2-0002qR-GM; Mon, 12 Apr 2021 05:11:11 -0400
Received: by mail-yb1-xb33.google.com with SMTP id l14so8038396ybf.11;
 Mon, 12 Apr 2021 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1hXwot+n1Oe3312UOiS7tIwSVSqEPxmcKidERgn8eqM=;
 b=iKYKV9MWgXLCM7gRy+0/rkC+mY68emEYNMx69i7XakwEg9Pzr1ywUFNE2drTBxUY0G
 PZggX+1i0q8wGSB0SW9cp+BQvSJtzVvvpWOsftuFzkbjK23fXMkkkT1LoL5+q/9oDzzi
 NvFu73RCDWCtUpc4LXhw1yCRxsjnfFFu2qwAaGAHHG5CPaoDwIlyjkUo94JbdYeWj5V5
 ESJSs7qghQQGzFyy5icbCDRpDoOazWv3U7xAmGZCzltd8qXudiDVX9UUfYX4EXPvY0Xf
 hypQ/G32rqSkVs9V5/QJWGdnASU5iaVNNrPnzaZgBkl1us00xvmjQpT96cSDheQ34kjG
 zyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1hXwot+n1Oe3312UOiS7tIwSVSqEPxmcKidERgn8eqM=;
 b=dxkwlxAJXpYWIex2f7eDkTp5MGm0S4AAJcuzMdX7cz/Asc/LQ9edN9PFiyhFkdUdHi
 1tJt4X0utbi/++n16kJF9WLR1rqZ0RhFREqEQJ+ets98d94J61ERWfNiEqX0rxXCxvhh
 GYhZ4UZ52+3FTIPi5Q6FAYPC3VQ8MQFGGamHDPEtxD53zjDZxDlJurRaEkZ2qt1HX64x
 5gVKOEf2oYtF8GieWfu1CHPR3bjIBUC9z9l89vyyFm9oKpIieH4LbMIqX6+uZdv7aZb8
 QyRzQpxEhq0d2iUQ7LzBlKYGgZsg0K3RQSDHtdm0U4XVCUCHjF6MYCssDOcdl/sq0Ncw
 5nRA==
X-Gm-Message-State: AOAM531nRBwWMJIp1J487mtggxb469GOGTOqu7NxTWpqROSUD3ZTdsqI
 S3mFjVMjwDBRwHtcjaq3unUFhu7QK1GiAqRntms=
X-Google-Smtp-Source: ABdhPJw8uAnQTzKAXrwyq++ByX713T0vqhsvfYnQsRaDDaWM03Rg+IhsYVjeFis3GA7qHBIMKXFc9oNoufhJjFxzxKs=
X-Received: by 2002:a25:d181:: with SMTP id
 i123mr12058221ybg.387.1618218662789; 
 Mon, 12 Apr 2021 02:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <f9d643f4f0bf3b84aca49fb0373bb050f7d401a4.1617393702.git.alistair.francis@wdc.com>
In-Reply-To: <f9d643f4f0bf3b84aca49fb0373bb050f7d401a4.1617393702.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Apr 2021 17:10:51 +0800
Message-ID: <CAEUhbmVGbUT7UaGofAX+1xEB4CWfZXfOo3WzH4pxoAtegs=tzQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/8] target/riscv: Remove the unused HSTATUS_WPRI macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Mon, 12 Apr 2021 09:11:15 -0000

On Sat, Apr 3, 2021 at 4:05 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 6 ------
>  1 file changed, 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


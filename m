Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnK5Z-0005qW-J2
	for mharc-qemu-riscv@gnu.org; Sun, 30 May 2021 07:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnK5X-0005lb-Tr; Sun, 30 May 2021 07:58:39 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:37825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnK5W-0000OQ-Ca; Sun, 30 May 2021 07:58:39 -0400
Received: by mail-yb1-xb31.google.com with SMTP id b13so12480951ybk.4;
 Sun, 30 May 2021 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=erqablZO5V4k5TJNNBoXzEQQrsTz3FSyaOEd0qDberA=;
 b=hGX90sLAD6QwWL08miCb6y9rS6tgT4K2OlcfzXK8cMzP2sbfJ3SdQUO/Pho19IrBk1
 mwlIR9wqGkKeP/noDjpPBxLL45cdquiCJKL9QxoQIGdNNBGWJo4MDrNc6B1hwii/tIOT
 XUvbpN9gB8zNVe68rh323Z6LG8I4rtNdGnPKdd7TdGhqh95VN5TDETDjAaEqGSq4tD3W
 AbaoPpqj3Kq/lsC9k4ZO5o8UfRP1CbM4gv5cy3R7lPvujwMqrXFPyvAt1CYYZ7hyOnoG
 VDPOl9abXOakdvmx8e2LCUblSn3tEUIp4fU+FVMoYpFKReO1AoZzKIE66jV1G9+SCFIe
 i03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=erqablZO5V4k5TJNNBoXzEQQrsTz3FSyaOEd0qDberA=;
 b=SxqwmlSVoUufF0TJTYEgpURUJynJ6AHds9b4P8IpNHvGIRAlQu7Lz4EjMw7N3/Ulp5
 rIl5zg7JiquJpPoa6r/4sYTK4pf2QqpB5eKbJxykk+WJYVxQaWwP6pc2y5/YkhVFwU8C
 QcDwH0e7e6QVlpOwCrEiQXN0bzQJiq8m5RGLeEdjCUI/fAyGDLAtATGBqNmr63ElgnEU
 37fLXMbx2dKSVbghpVn4f+XicsuqWNnV6Ulqzq28p5B7owrCN9DK8OwNvDnjNVr6F9k/
 iuwtEcYHu4Fv2PpqzGwHFHANlqg+s8yhtcPR6eKPzFzGSllt29iDbJn6/5KXWM+rHHxG
 9NVQ==
X-Gm-Message-State: AOAM532zurqmG/yKSWjrcNramoX1v9ov7qthVu/2m78LSYbw9G1Afhgf
 I7T6mRXo+2W1vV75MKjrHUSjGEQdZgffkXSVfkE=
X-Google-Smtp-Source: ABdhPJz2W5SUbv/Y6HHnS+rz5QKMdpemSjYF3p3OVp9xmkWreswzsp6OkSRNu4QgJ+0zlLR0TTVLNuJ5O10hQ7rWy7E=
X-Received: by 2002:a25:412:: with SMTP id 18mr25362283ybe.152.1622375917296; 
 Sun, 30 May 2021 04:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210530104922.466175-1-lukas.juenger@greensocs.com>
 <20210530104922.466175-3-lukas.juenger@greensocs.com>
In-Reply-To: <20210530104922.466175-3-lukas.juenger@greensocs.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 30 May 2021 19:58:26 +0800
Message-ID: <CAEUhbmWN6kKp2CsgNgCFk4OPqz66e4htfNoQv5GVtzheHeRXmQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/char: sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, mark.burton@greensocs.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Sun, 30 May 2021 11:58:40 -0000

On Sun, May 30, 2021 at 6:49 PM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> QOMify sifive_uart model
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> ---
>  include/hw/char/sifive_uart.h |  6 +--
>  hw/char/sifive_uart.c         | 72 ++++++++++++++++++++++++++++++-----
>  2 files changed, 65 insertions(+), 13 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


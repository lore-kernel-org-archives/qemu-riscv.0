Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhMNP-0004pU-Sy
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 22:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhMNO-0004o9-3Q; Wed, 20 Apr 2022 22:16:58 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhMNM-0005N7-Mq; Wed, 20 Apr 2022 22:16:57 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2eafabbc80aso37701177b3.11; 
 Wed, 20 Apr 2022 19:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9ABZFwDq0uPB5O4ZPz/ZoyjaahzgNb/hHXIof00VHI=;
 b=iD+uuMMpd9iRRP6Hlaf2GeQzTO2pUTi10phVG5l20yBpnk7vI2BY+wMMo2eLD9uJ2G
 D1LswOUuysHK21Y/jXJkDnzsCoVZjb/BrhOzg5AkpgQazUQ+fACGHOAnMKGRv+RDRioK
 TiwwUiSoEZFL8tvXVv5hzJvDUQRw01XbGg4gsQu5M639NORp+rVWOt3rGvTPOjDaMssP
 1PSnR+VTvnUtWB3SAMS3YnGWts5gOY9u7i9YkFaYbtL5FMNtI6+3piAFA5530gnRGqX/
 oUx/Cy4QmQRK2rZZA7XiRHoO7qJh+k0OOkIZSEKdMOK8FhJBb0+5zzKhVlOhp66TcIw8
 Le1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9ABZFwDq0uPB5O4ZPz/ZoyjaahzgNb/hHXIof00VHI=;
 b=L8SBA6fVmnXzIB6k0Wtg/mHF6ImeoBkAwpT6lJDz0o/qTlc+ne1XuRLZFshEucUK2Z
 X3tvjF5CVFg00ydbo66ynTY/gqZE0/08Yh9+oVuIaAIZqTJybfPsjreb7c/FXvnNy9+W
 zfwwU4vdxr3tgGqREWd2kFnnlNnBy3bzjfXAsRkQGJjHQw7MHJfce51BJjmK6RTTJOID
 FBw6S4xL+V01oXB7b2Yp7g+iVpfkc7N7GwIm2KPk5ux3zhXxNM8nhz6NUSP7YiIP404T
 RqwSAb3hm+tW3nYxmZzwVP613XsitdAsvFWw4FNcqG0Aj/ld03zOa90R88zp4jv1/9NB
 IM8Q==
X-Gm-Message-State: AOAM533oRHX0BuvOayTBfMw3T7OJ4ZC3l5ecQlyn+AQh4v9Jr2eN+FJZ
 qIH6rptO9nFkM7Ac2SsLHYpdIztvcDFCCTgeClk=
X-Google-Smtp-Source: ABdhPJw+ZeWycZJTKI0b99Mhk3qle6tLbnyYl1pz7GXPVnihnPwGVgDCocz4ZEHyMGlZduoZ2YbpUyCO7iXVRvJR61c=
X-Received: by 2002:a81:2443:0:b0:2eb:4ffe:fab2 with SMTP id
 k64-20020a812443000000b002eb4ffefab2mr3409019ywk.330.1650507415471; Wed, 20
 Apr 2022 19:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220420095718.26392-1-frank.chang@sifive.com>
In-Reply-To: <20220420095718.26392-1-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Apr 2022 10:16:43 +0800
Message-ID: <CAEUhbmXfoWOpjt6YyVztxv49P9-xQjmHgD6OZ8TgJ-yUTbZd8Q@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Support configuarable marchid,
 mvendorid, mipid CSR values
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Jim Shu <jim.shu@sifive.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Apr 2022 02:16:58 -0000

On Wed, Apr 20, 2022 at 5:57 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Allow user to set core's marchid, mvendorid, mipid CSRs through
> -cpu command line option.
>
> The default values of marchid and mipid are built with QEMU's version
> numbers.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c |  9 +++++++++
>  target/riscv/cpu.h |  4 ++++
>  target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
>  3 files changed, 47 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


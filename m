Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPN6e-0006IR-9k
	for mharc-qemu-riscv@gnu.org; Thu, 25 Mar 2021 06:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPN6c-0006Fo-K1; Thu, 25 Mar 2021 06:20:46 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:42653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lPN6X-0007Y3-La; Thu, 25 Mar 2021 06:20:46 -0400
Received: by mail-yb1-xb30.google.com with SMTP id t8so1698221yba.9;
 Thu, 25 Mar 2021 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GE8guuyj7ANqXvKJVne5cGrA5b63qnFa0rdaVyFNFh0=;
 b=rAfDEbPSUOV6sXHxUOUe800sFpt+D0SOu5LLr2wIvX6guL0TYkzMbmk3UvartIO9Ps
 Wx8V6uzI9pIP+htj+UgN0oP/cs/ibpQT+D6MH72E9v/3Q0okh8ZxNniidVGnLxAbPpCh
 QVw22D3KZhpUdv1n0CWcXQ9R3jCSqb+XdTC6S5geKG0s4d+wqwavwFqmpj6/gJHdmEjs
 ThkZaBc+Hg7xNS++/mfyT0GLXFdaLKuI5EVfUeiVxbIeGK4kOD8EAQ5ysINOeHhh8SiB
 NGS4HpWhAfxbFK/Mt7CB78b90G+twz8Cl+WYF0U/pfUXJsJiAazix9qSHRp1ktRjXolP
 CDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GE8guuyj7ANqXvKJVne5cGrA5b63qnFa0rdaVyFNFh0=;
 b=chjObmlaGTI9THkrZYlUcPdpJvhk5g5QY29aFHVdEKFZrXlObw+ItFa7hsb9Nvnusz
 vP9KulwWQqh0Uzdj5JJ/GHoThqJd44jqT2F0Et6/9TAaaKL9bUjS8dA2cFjsEgVGYnUE
 0b7P+iPGnfKnTBJ3+INTBMA93vMkoCcSPfDZyQX3of6Co5/tIh42ztOefOapIsghNFaZ
 yXZRR0b//FAqNAH7nyQr9BnCuF4k0DIzyw2isJ5tYZgTYRyRkcuzeTqAyZ6cHMksSYEX
 rin00/Zj3Y4hTaZnwt7Z3MrwxAeZKHkMklRBmSBfEdBGGD2VitovtrJQSkXOejiDEchG
 PfXQ==
X-Gm-Message-State: AOAM533hTkRQx1Xs+aKjcvuKjmfg5QKl+a/S3Ggz7eCA+DKs2kcvjsHl
 fEnUhsuZMyUflJm11aXq8ntaa01dtdqRlmapjio=
X-Google-Smtp-Source: ABdhPJzv5xkI24pIi5PWSsGqzGl2gkGOkyy8ArRcrDXaypAfW0gK83vymWZuc58a3CQGmHLYXul7Qx1TZ5hXHNG9XEQ=
X-Received: by 2002:a25:bd8:: with SMTP id 207mr12279805ybl.387.1616667640423; 
 Thu, 25 Mar 2021 03:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210325094150.28918-1-dylan@andestech.com>
In-Reply-To: <20210325094150.28918-1-dylan@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 25 Mar 2021 18:20:30 +0800
Message-ID: <CAEUhbmUYAKv34eR1zFPJ95ygCd9u5GZfqEmVU2ixDJVeewtZLA@mail.gmail.com>
Subject: Re: [PATCH V3] target/riscv: Align the data type of reset vector
 address
To: Dylan Jhong <dylan@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Ruinland Chuan-Tzu Tsa(((((((((()" <ruinland@andestech.com>,
 Alan Kao <alankao@andestech.com>, x5710999x@gmail.com
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
X-List-Received-Date: Thu, 25 Mar 2021 10:20:46 -0000

On Thu, Mar 25, 2021 at 5:42 PM Dylan Jhong <dylan@andestech.com> wrote:
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> ---
>  target/riscv/cpu.c | 6 +++++-
>  target/riscv/cpu.h | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIQ4w-0003wi-I5
	for mharc-qemu-riscv@gnu.org; Tue, 24 Aug 2021 02:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mIQ4s-0003vH-Hf; Tue, 24 Aug 2021 02:38:30 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mIQ4q-0002xj-G0; Tue, 24 Aug 2021 02:38:30 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id k65so38869752yba.13;
 Mon, 23 Aug 2021 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rbCsTz7MMZjquuVFJNC9+dHMTBW1mBzYRLH2a8/KGfo=;
 b=KlrVTPQWzIOHv3ZuNI56g/ddSFRpzURZ+56iPneCiCcOtLsyDC9iUKm9mX0rCN09h4
 w7WvWup8hVtmmRuaduQzk9U6xc4WWR9mDaLhvtrzHBTeQKR/hqwoA91YUmL9Ko8usfNL
 0bmjkzmGbTlVG1TGynemueQ1+ICKYfZvInnYT5pZiRR7SqlCEYTzLUy/u8Yx4IIJOcvL
 UV4vM4KRQY+adOK2GDF1BdVd9TJuLrsH9vp8H83haiIYO8znm1EDmD7g0F0uare+DGmb
 2wnnaSikkY9gu6hJXJ7fGiPDLD6iql9mozEhIDGovTd5t+b0B+zQmyLD/jG+LrASi9Je
 IG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbCsTz7MMZjquuVFJNC9+dHMTBW1mBzYRLH2a8/KGfo=;
 b=JF7HMkgmzQc4CfCGNp7y9c8RJiAmP4JGj+tDEDx0ouhQEvTZM3vIyAE6p7fNf22Nix
 6T4NkJ50qc3ML1A/6b7/GhUer69XRL4jl7U4NLraIf6fBz6ItTEJraYJmcQD/bN3oe9Q
 9favWHT5et9VFhBlg+M6vOn7zE6xtJtZqIe2yP0TAYZBwO3DVAWTDi9iK4vb2ysZqgaA
 IfC97l1h1MWJ/cau5n/CLzIkPKJMnKJyZ2ZYkUiBIwWG4H8T5+m81ZXyKYm8mf4q0ql+
 DN6+nAHjmNk2r743mtvueabf8ruPU6UdCHtdFqWpaX2w7IT3R3a+ALRvlM9KHzakj6N0
 O+pw==
X-Gm-Message-State: AOAM533oF9nGewD3QK9HpF8hMR6HAsq3rj1fJdiOwGI3DESl87Ad5qnu
 xw18mfPKfakn47jKvCLf7jl1MVMS4FUdX4xPQjM=
X-Google-Smtp-Source: ABdhPJxALP/O3Mye11qrgxjloPbMoy2oJw3AWY7u2jiWS0/ldGl3ELmeWKfvubkaxM+ltZIC3eMXGVxuzRdV8O4GfEk=
X-Received: by 2002:a25:6d44:: with SMTP id i65mr46201920ybc.517.1629787107303; 
 Mon, 23 Aug 2021 23:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-18-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-18-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 24 Aug 2021 14:38:16 +0800
Message-ID: <CAEUhbmUE5EsV9092U5BAhbRpOSh0POHbKHkQMpD+MGYOeWRFPA@mail.gmail.com>
Subject: Re: [PATCH v5 17/24] target/riscv: Fix hgeie, hgeip
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Tue, 24 Aug 2021 06:38:32 -0000

On Tue, Aug 24, 2021 at 4:08 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We failed to write into *val for these read functions;
> replace them with read_zero.  Only warn about unsupported
> non-zero value when writing a non-zero value.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/csr.c | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pusok-0004og-Ea
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 06:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusoj-0004np-0Z
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:37:37 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusoh-0004um-GT
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:37:36 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bc4bc2880so2499981a12.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 03:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683283054; x=1685875054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lQFl/hfaokX6bWVDMMA0Liw7xdcfO7yVzbh3vEMN0ng=;
 b=CnicNmACePipY/HbiiDXqJ8853Y5kSFJHKLX4nKx1qOAJOqFqg/lnT/seHgegVy1e5
 K12LgtMNLz0TVxtvBKOzPhEMesZ4I+O7/2x0fshrVcBBgTKuW+7QsKsEEcHEohpbao/3
 pA7a+2iBWNirE8rIhTDO6qJo6PgPjbKxbJCchEU4fyoxZh43pwXnJjjZ1dGfB6Z9ifHu
 oetUgFhCtYBg5Zv4yfCfJPzA4AKxbIjg7uK45LuR9uHrJyJs6jCN6HLJXqSj3hG4o/VP
 RTJE+xgeKjLPmdfUO4V8grddcg0fxGOYW7b3kstIwIO1TeJEbpyPXJRxNliAzjQaK64r
 5v8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283054; x=1685875054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQFl/hfaokX6bWVDMMA0Liw7xdcfO7yVzbh3vEMN0ng=;
 b=ZxAUacfjz/YkrgdZrUrntx74S2Z30JLK32Furda0MOm5Yg5WatCZitrVc5bwo79kj8
 VOJ5cHKe+Mtf2K/bZ+ItdIRqY9bKKA9Cb6XB1rNUzSIHoKdx3C9WP8xI0TQ2G0nPhgRB
 VJjzZT9c76ttT8fX5hGp+N2RrVxS64WwmQZ5aUiqqmiHRAD+LNMx8qp+gNg+WjyWuGCR
 fkljnpBkKZc8YuEkefpULeMFlscIESDUCyov/IS4YnrflqVsK3J7MIcfq2Onx82deYMD
 Gb/nfnJvWMnR4LAJBegoXhEtODx4CFHRWLt61Bx8YQDKN8WiOv2QTpM/enyDFgWEGuzL
 CGAQ==
X-Gm-Message-State: AC+VfDzsYanFrL7KhoKM2eT03FTvSgzXx9TgmRVP3LHwHLj89ySWsy1U
 wP38gfpHQBUKXTL87VlFkL9QVwxlNqnGlS+VnFJOQQ==
X-Google-Smtp-Source: ACHHUZ6XeKuoAmKBc+GF31yiQuuv1+CjRQuFSk6tIw3yJsHjUJ7d6oxI9P/tNiKi3y4FGYfAcsaosqGmzwkXLBjvO3Y=
X-Received: by 2002:aa7:dbc8:0:b0:50b:d305:3788 with SMTP id
 v8-20020aa7dbc8000000b0050bd3053788mr798666edt.11.1683283053934; Fri, 05 May
 2023 03:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-16-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:37:23 +0100
Message-ID: <CAFEAcA-qe+5+eDdjFUxrOqE4URwsBYdN7Q1_BLbAusGDnaudGw@mail.gmail.com>
Subject: Re: [PATCH v4 15/57] accel/tcg: Use have_atomic16 in
 ldst_atomicity.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 05 May 2023 10:37:37 -0000

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hosts using Intel and AMD AVX cpus are quite common.
> Add fast paths through ldst_atomicity using this.
>
> Only enable with CONFIG_INT128; some older clang versions do not
> support __int128_t, and the inline assembly won't work on structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
>  1 file changed, 60 insertions(+), 16 deletions(-)

Inline x86 asm in a bit of generic code seems rather awkward.
Ideally the compiler should be doing this for us; failing
that can we at least abstract out the operations to a
set of functions that we can provide (or not provide)
implementations of?

-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mI0UC-00006v-Da
	for mharc-qemu-riscv@gnu.org; Sun, 22 Aug 2021 23:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI0UA-0008W9-6x; Sun, 22 Aug 2021 23:18:54 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:47018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI0U8-00009K-Td; Sun, 22 Aug 2021 23:18:53 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id k65so31314706yba.13;
 Sun, 22 Aug 2021 20:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l2XcfZcIHrAjrtnkBJeIqFJJrWY0yuDnW4rXYLRh+Oc=;
 b=HvXUu6Id9uY0qRxooOoZepZ2xiICW1r317PqELoNcM+MN8e5ShK0gLrGGjVXcSXtXh
 UlGgfFAVuGQ2+zj1+/UERfyWHGXQA5LMczCvJ2KPT7hX2LHAkyLDVCeEfeTt5xF3B2g3
 jlU+e6bwBzzWuOnxXRfIIo3YRK8MyRa0LiV1kTyF2rt8Aq0b7rLEyc+1Y47yeAh34DcD
 QpoKVpGAPLs+nNL4GyiKnsV8K8x+EhQZrnXft203zNBlySozBRpw8CPugh6DAThT10AX
 +UszT9rMTE1YbGPK+xz6ugNpySwaBAF5D8yNJw6a9u3nWRx0DZLZkg4yhbls7K1o73NZ
 CDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l2XcfZcIHrAjrtnkBJeIqFJJrWY0yuDnW4rXYLRh+Oc=;
 b=Y4eqcg5NIoPdwYP7r1hKYMlMeHcdxlR+2LdtGzU0z7TF09cZ7AWIoctjYkwEf3+CA1
 3TgyNwnh6Ay6qZH2RX8DT7AxkmZUHTacfZ5fReHpkIUuwuVvy0zw/ZKpi2kf7gpomybU
 i0Szva5fKcmAUW3mvBJ2s59aZzpS/MLPr3DE9jPDIu0ZB2Fz7Y1z+nwPUqy3K1cFCLyy
 VkKzPViJuv/rUs7f2lvR/Zt9qKug1ZDeCPhnXpyqyP6/+ytm8gj4H21+C4+1N0VdzSGE
 Yuz5VKtLxCc1zFSiIP5nNFTYwspcNQvXnwcSF5spXg7fpmMj8svwMnzKpnYM1hN9731X
 s2Qg==
X-Gm-Message-State: AOAM532ddWNCQQGGTUX139JmSDyRIWSOMznFTzXtvAiGaa54T4kN20mV
 mgcnH12PVo5idcSQC7bdngj2xG5P9kK2dgP0N40=
X-Google-Smtp-Source: ABdhPJxKB2jpB5BEQlVxIP3lXIiVn5xx3zdTU3B9Om1KOqcwPAkDlartlv70uVhhx8/pnYsUcF93mKpc8n9U15oCJmE=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr42961860ybg.306.1629688731451; 
 Sun, 22 Aug 2021 20:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-3-richard.henderson@linaro.org>
In-Reply-To: <20210820174257.548286-3-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 23 Aug 2021 11:18:39 +0800
Message-ID: <CAEUhbmXzz5ptCzNit9hQtUkyJgb77wATN=5CSCcYMBnwLieSVQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/21] tests/tcg/riscv64: Add test for division
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 03:18:54 -0000

On Sat, Aug 21, 2021 at 1:43 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/riscv64/test-div.c      | 58 +++++++++++++++++++++++++++++++
>  tests/tcg/riscv64/Makefile.target |  5 +++
>  2 files changed, 63 insertions(+)
>  create mode 100644 tests/tcg/riscv64/test-div.c
>  create mode 100644 tests/tcg/riscv64/Makefile.target
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>


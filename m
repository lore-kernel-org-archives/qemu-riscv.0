Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5k1l-0004Qu-M6
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 02:51:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n5k1k-0004PH-7T; Fri, 07 Jan 2022 02:51:08 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=41503
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n5k1i-0001u9-Ix; Fri, 07 Jan 2022 02:51:07 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id y130so14504064ybe.8;
 Thu, 06 Jan 2022 23:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FRBYGbDtzfwoRZcR7Y3lNak+EdqBpY4b6aDYpv2M2YY=;
 b=juTHa9FmfysEapvSy5pUVvLv0VhFNDzi8vwuorysNuA2tghWfkbznBZYHHqHZ9Fbv+
 KsWdsFo1hM2UcUh/VQuRwH4AoOE7IEz6EHk/EEW1gglVZG0nghNJ45mox4bH5smkJlwO
 EvX6E+ZaWuV0FA1iIil2TUvzdOHsk1WnZy3sRPzOB7GPBrWagmPQ/sSlB4T2OASkjahu
 TmqbA24dpHJtE6GaNJtQ4oSdgawNSyW9bA79sdE6k5V1/RoDUkMMLLGMWmI+7uGN3zxw
 8TWGGAo8GeS+5ys1RtrQ54C02hy2+yL+nW0BCl4UkLWuZVs8Ul5omeOcbGuaNWnXipMD
 f0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRBYGbDtzfwoRZcR7Y3lNak+EdqBpY4b6aDYpv2M2YY=;
 b=El01VslvcTMarT7rpsQClkD0ta7V1NQW7UuU6n319sRewtOvtUdIkjZIj1ZKcj/r0U
 KJOd7TiCMim9NXi29cK1rJINY4hWMrN3l+4Z3GGwt8I50dz9LU5ELHddtBciogAOTp9c
 2m4O95cnTcXo02EcR4m/KPx1omU0KbO/iLf5WgmehcRh36yzBGmvWFjCpvEq2A5MnhFb
 82lolg6zcBYXFKiOCotUHbplT989Lcp8mj71tOm9MzzhHkWCV8NjiyVdMXfYoKynnQt+
 vzJV8zEWPJrvRv4xdsL2KBuQ6uJ0113t74TnkC1Le8Jc60zZ7/qU7UmRnoXurWb3m3yC
 IdkQ==
X-Gm-Message-State: AOAM5315Kp9S5Kvy+Md/6gHiXqC57N3aN5C9za5UzlJOMDXsfJslbfRl
 02c33jWhUHjVp2taBuSsPCdMdi2UK67Hk61VXTs=
X-Google-Smtp-Source: ABdhPJzUYsKniKMGzMkacAwuSDG7eYeaG1MRKLs7jG/lRGOu6qHA+F2CcSWGKfwUki7qMF+Tto2f+OyAiTR4XORwKng=
X-Received: by 2002:a25:bcc3:: with SMTP id l3mr52816738ybm.148.1641541865133; 
 Thu, 06 Jan 2022 23:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-3-atishp@rivosinc.com>
In-Reply-To: <20220107004846.378859-3-atishp@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 7 Jan 2022 15:50:53 +0800
Message-ID: <CAEUhbmWSY_Tv09uNhyghvKmTYvFWjRdAF=f4PDriRFhh4MCNjw@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] target/riscv: Implement PMU CSR predicate
 function for S-mode
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 07 Jan 2022 07:51:08 -0000

On Fri, Jan 7, 2022 at 10:14 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> Currently, the predicate function for PMU related CSRs only works if
> virtualization is enabled. It also does not check mcounteren bits before
> before cycle/minstret/hpmcounterx access.
>
> Support supervisor mode access in the predicate function as well.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/csr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


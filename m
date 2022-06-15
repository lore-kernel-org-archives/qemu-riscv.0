Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1RmN-0004zs-Lz
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 08:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1RmL-0004yS-06; Wed, 15 Jun 2022 08:05:45 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1RmJ-00046d-F7; Wed, 15 Jun 2022 08:05:44 -0400
Received: by mail-qk1-x72f.google.com with SMTP id o73so8514085qke.7;
 Wed, 15 Jun 2022 05:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NMYX2qUNsfTaICP3nDDmWQw35FEry3h6t05C6RAsRpM=;
 b=dUIdTPDZFc2X2nqF8lWHKH6pyF2tqjCI+aGQDQnqX7KgdcacFdzA4g5XIfUOSxx0Jh
 uMr8gWNd6zeu42mFRf24VRiyRPtiahfQPgTAk/99O9HE8P2P/qxmkWMGEqN+jsbjZ7SB
 iKica75uVqetrAnH7Qp7PTrNqqS1kkPcT0ZdJBVWFYBzCKseEB5e8IU9BNSb7avgwgVV
 kqN+83b0L8/YNk6EudLTJiFp1O8x1wX61G4YndYr8ZfqQ3AkWlpibLj0GMY/jNlaaUxs
 kQoNWcfliLPc0GcRJxGhjqR3XtS665zVc0DmgXFVWn/RVdKkrmOUt7JavQqqhhVCFT3q
 6KKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NMYX2qUNsfTaICP3nDDmWQw35FEry3h6t05C6RAsRpM=;
 b=nw4J5RBsMmcHFPHrrTNXXh4OLKs1qSGwFvyI547OM6PRUBRvOPz+1BzTofnI8J6ydU
 /uoOjGQrrU70dsu066Lc9vqpG59O+1ZGu+vnNbtODeBvGl+IpuKlTKLhC3KOvbhLr048
 DTjNiRcycOrAkYUjkgU23TYsqCDjHLCcoX+uXGE3UZlkUQBN/480r2uUINe/2h/GcSiu
 vMepabUS3Zz1QOvpWeVGhALFeoF9aasGfcbvx9LmkhIIvkyWd1Tz5nJbhJ/qJ1Q+wPUi
 1dNea+uQ5cKNsKiioXur/oVd123qmrHAxAMM05edWcAAcxMtASkCcDcuqUWS2gaTe4ul
 03dg==
X-Gm-Message-State: AOAM531K5ZInJ+h55FuE0N6gE/OEMZS/d78yGEUWk+Uat0+qnEroISJG
 JtXTN/4r6T0ILK28MFiqIJD9kRdSCu5DdzH1OZk=
X-Google-Smtp-Source: ABdhPJzJjIF9kJDzmNJJzh3ATs3DS3C3ZdtbkUoqabfCH9uWnqJvQDPPVssG9rxRwPTY/mXT0PDpnCGLlBhXcmRTpUc=
X-Received: by 2002:a05:620a:13a2:b0:6a6:f149:6d82 with SMTP id
 m2-20020a05620a13a200b006a6f1496d82mr7842740qki.342.1655294741634; Wed, 15
 Jun 2022 05:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220610051328.7078-1-frank.chang@sifive.com>
 <20220610051328.7078-3-frank.chang@sifive.com>
In-Reply-To: <20220610051328.7078-3-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 20:05:29 +0800
Message-ID: <CAEUhbmUeFWFGNqq-nT12ZPKLP8yzBXdFb4G3+kXh1OOtH64hJQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] target/riscv: debug: Introduce build_tdata1() to
 build tdata1 register content
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
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
X-List-Received-Date: Wed, 15 Jun 2022 12:05:46 -0000

On Fri, Jun 10, 2022 at 1:14 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Introduce build_tdata1() to build tdata1 register content, which can be
> shared among all types of triggers.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/debug.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index abbcd38a17..089aae0696 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -94,18 +94,23 @@ static inline target_ulong get_trigger_type(CPURISCVState *env,
>      return extract_trigger_type(env, tdata1);
>  }
>
> -static inline target_ulong trigger_type(CPURISCVState *env,
> -                                        trigger_type_t type)
> +static inline target_ulong build_tdata1(CPURISCVState *env,
> +                                        trigger_type_t type,
> +                                        bool dmode, target_ulong data)
>  {
>      target_ulong tdata1;
>
>      switch (riscv_cpu_mxl(env)) {
>      case MXL_RV32:
> -        tdata1 = RV32_TYPE(type);
> +        tdata1 = RV32_TYPE(type) |
> +                 (dmode ? RV32_DMODE : 0) |
> +                 (data & RV32_DATA_MASK);

RV32_DATA_MASK should be introduced in this patch

>          break;
>      case MXL_RV64:
>      case MXL_RV128:
> -        tdata1 = RV64_TYPE(type);
> +        tdata1 = RV64_TYPE(type) |
> +                 (dmode ? RV64_DMODE : 0) |
> +                 (data & RV64_DATA_MASK);

ditto

>          break;
>      default:
>          g_assert_not_reached();
> @@ -490,7 +495,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>
>  void riscv_trigger_init(CPURISCVState *env)
>  {
> -    target_ulong tdata1 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
> +    target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
>      int i;
>
>      /* init to type 2 triggers */
> --
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


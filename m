Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOoyu-0002fE-Ag
	for mharc-qemu-riscv@gnu.org; Sun, 05 Feb 2023 19:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoys-0002ev-MQ; Sun, 05 Feb 2023 19:03:34 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoyr-0005Z1-3h; Sun, 05 Feb 2023 19:03:34 -0500
Received: by mail-vs1-xe30.google.com with SMTP id v26so3275956vsk.8;
 Sun, 05 Feb 2023 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DHH2gLmtB9ROiVFuoryCAehBmeVFlX9Yi5WJhUpEpRg=;
 b=oURn8pm0ynQ6uy/FRwDQMv9imjULBrJv8zSJWqrUxfKawYPE91JTm6UDx9q2URpylD
 NwYq3lxnIUbOvVxIpJCksffzqcP1cttXyEPcb91QHMhAH5H8qBr7xdd/rd183ONGx3Q1
 Ee1w7zbGe0GYD336rOeJJ5FC6/T+Z4F56Wx4UMRqHERz59+ix4MVANxdcP8ySKeaESWf
 B/xxfzL+yS8fg7aUS13J8d+BAC/3ssU3n9XLtloLUgcurHaMwpmBFzvmO4Kilx2UnAml
 /e9zsCMNO8CUKtlBOKUYLWz24KHdhPvxC0GSnVH+n+OdXZjWOeUxR64SUYMsg8eupJ96
 9Kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DHH2gLmtB9ROiVFuoryCAehBmeVFlX9Yi5WJhUpEpRg=;
 b=8EXWLaVZReP0xT0l5lT2+TyZhlrlPtncUCCWDqOjQNjdKXosjVpiNRSZroe2iqpBp4
 3hx2vacgSxwI0YtluBxizc9EHo5YIXi578OHTxpGm9z1PwLxt5yUpTdRKLTHQLmI+Wkc
 79ROct7x0Tgl7YtKlLQhSMUTHBqlYARh6frAOFG7N0zdtLTzqIYpkYzntz6oEG6ulyvI
 GeObD2TYSYBY11OVZio6iIJ/hNXNqhM8OhyeXj7EEA56lEQ0eiE9PedmkxSlfBz7pwhX
 PIMMBIGaZ1gvis+BAgM4q0gFmI1bSeQgV0/UgCjJm3vQUl2EDNxFLWourctuv+1EBJ0L
 WQfg==
X-Gm-Message-State: AO0yUKUk5R66S3dTRWlPa6uIUKl6MepQ46xqWz088xOLGnPk+xYgexgy
 2yT9Xj6E1L8An/bca2JbCcbJ1SrDDSgjAmdwmCY=
X-Google-Smtp-Source: AK7set/g4H2QxAGiJmzFoBGjNNj+L0jGamFnhdeUOdKlk0frf1OK26oTCegOE2mNzcLpbh2RQvW0iPo14hUm053M6cg=
X-Received: by 2002:a05:6102:1:b0:3f9:3f38:ca46 with SMTP id
 j1-20020a056102000100b003f93f38ca46mr2856797vsp.73.1675641811628; Sun, 05 Feb
 2023 16:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20230204082312.43557-1-vladimir.isaev@syntacore.com>
In-Reply-To: <20230204082312.43557-1-vladimir.isaev@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Feb 2023 10:03:05 +1000
Message-ID: <CAKmqyKPjjowAAk1d1azRiHdEqpBYbM8D59L2Ga4HV2=anD=w9Q@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix ctzw behavior
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 06 Feb 2023 00:03:34 -0000

On Sat, Feb 4, 2023 at 6:25 PM Vladimir Isaev
<vladimir.isaev@syntacore.com> wrote:
>
> According to spec, ctzw should work with 32-bit register, not 64.
>
> For example, previous implementation returns 33 for (1<<33) input
> when the new one returns 32.
>
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> v2:
>    - Use simpler solution suggested by Richard Henderson
> ---
>  target/riscv/insn_trans/trans_rvb.c.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index e2b8329f1e5b..990bc94b9840 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -401,6 +401,7 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
>  {
>      REQUIRE_64BIT(ctx);
>      REQUIRE_ZBB(ctx);
> +    ctx->ol = MXL_RV32;
>      return gen_unary(ctx, a, EXT_ZERO, gen_ctzw);
>  }
>
> --
> 2.39.1
>
>


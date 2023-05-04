Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puaNZ-0002J7-S3
	for mharc-qemu-riscv@gnu.org; Thu, 04 May 2023 10:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puaJq-0001MO-Rh
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 10:52:30 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puaJo-0007Z3-37
 for qemu-riscv@nongnu.org; Thu, 04 May 2023 10:52:30 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso1087849a12.0
 for <qemu-riscv@nongnu.org>; Thu, 04 May 2023 07:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683211946; x=1685803946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1B2FvgWAY8kZexn4DUNfwK8A+zUkKYUqoSQ25ES1gXQ=;
 b=EeyyITikCWVvyGsXCeHqpo6ZKAwjha76TE5ohfZGJT1wv8BmibvlhZUednv1B/Fb4s
 g2Y3830rB1c7b9xqAs3WKh/jfxhRXvsGPW1yWKlos7oeK8+u7w/JiiAO0NQVn5bDOktu
 XxNrnFbQr8j0wHWrTM4QbqtgR1bdak7xUhiY2LmVdd8l+rMMkbvXrrmz92N+ulvgr5oO
 TSNBnh93EEfQB5y8nkmRakD7Se5HgI5Bsp69Fx7dVANutlSHHNK+cRwhF02gC7GxKvBX
 Iv5aFXyuGYOt6unM5O7AhbxJmaiH5eKXMiF8Lo1VLjT0sRKsgieURqNNVCbtWXKhzJRH
 3y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683211946; x=1685803946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1B2FvgWAY8kZexn4DUNfwK8A+zUkKYUqoSQ25ES1gXQ=;
 b=ervmpD0tugggaRAwDEhK4swL124tE5eyFOrr2kzhulV+5ZzQMjWiuGzpDddkj05+vA
 Zid2Y1XL9XmRI4zxnIbNY00NF48nbTJJLkSCScVEMysOkXcdtFnCV5Rp+B5THPqjyLg4
 zVyp3xE+NXhHI0b67hAgqhWPpdGCu0aduEg1CUCACQfgFJC21uivVByp7AmkXNz5+t1E
 Pm7pv7Yf2ePMTIYO03BAFNP3bm8paF6cXW73o3ZxtHdJ9mFJj0l1M9EyNJjp8R7IGtRa
 lQXB0u4KGmsxptFqQCeYY9+S2QkeqlOh8FF61F4sd3ri71e+d/cXYrRMSxnKbakgDPx5
 Aksw==
X-Gm-Message-State: AC+VfDwF7DYwLXtL1EutsvvFaYLJo7QkoLpPOOYfollFicMkOO1VB5kb
 RioMrc51Pq6hMvEvhudCKNRVXTz7uc81W0SSBckaDg==
X-Google-Smtp-Source: ACHHUZ4ctO8tcI2bcUG03yRTCTfOpKiGeoxdPptrjnNleozGXeclD/XYlWu4X2kNshXZAvMkh6fNhSZkQed89QTtdsw=
X-Received: by 2002:a50:ec82:0:b0:50c:1e2:4a42 with SMTP id
 e2-20020a50ec82000000b0050c01e24a42mr1720198edr.15.1683211946558; Thu, 04 May
 2023 07:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
 <20230425193146.2106111-3-richard.henderson@linaro.org>
In-Reply-To: <20230425193146.2106111-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 15:52:15 +0100
Message-ID: <CAFEAcA8YaS1HRypydW25tTtB5D0XdO-m9y1OHxVCDOcpWtWgQg@mail.gmail.com>
Subject: Re: [PATCH v3 02/57] accel/tcg: Add cpu_in_serial_context
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, git@xen0n.name, 
 jiaxun.yang@flygoat.com, philmd@linaro.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 04 May 2023 14:52:31 -0000

On Tue, 25 Apr 2023 at 20:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Like cpu_in_exclusive_context, but also true if
> there is no other cpu against which we could race.
>
> Use it in tb_flush as a direct replacement.
> Use it in cpu_loop_exit_atomic to ensure that there
> is no loop against cpu_exec_step_atomic.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h        | 5 +++++
>  accel/tcg/cpu-exec-common.c | 3 +++
>  accel/tcg/tb-maint.c        | 2 +-
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index 96f198b28b..8250ecbf74 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -64,6 +64,11 @@ static inline target_ulong log_pc(CPUState *cpu, const=
 TranslationBlock *tb)
>      }
>  }
>
> +static inline bool cpu_in_serial_context(CPUState *cs)
> +{
> +    return !(cs->tcg_cflags & CF_PARALLEL) || cpu_in_exclusive_context(c=
s);
> +}

Can we have a doc comment that defines the semantics, please?
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIHJN-0001aE-Us
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 17:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIHJG-0001R3-EU; Wed, 18 Jan 2023 17:53:35 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIHJD-00048s-NO; Wed, 18 Jan 2023 17:53:34 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id w72so93295vkw.7;
 Wed, 18 Jan 2023 14:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xfwvUVbaN5MjMKlFmeSjn3Or3UUiNn/hAoNZcmsCrfs=;
 b=lmtBZavnqrV/0kKVC42BAbN7WX9rhXAVosi4+LoXIm1WeZ2egAIMHI7fHgWeY6W6WI
 UY17l9f9jMMgA63FJQ6woEjnDUWHH4dSqyppzsH9Tj3Ms1hoNMQ5eC81pHtoO/o76HS2
 pckcZNdxSv42t5PFuzUTXsv1r0Y396xIFXd/UxQUM8SVwxrq5MiRbpEysZLPNOd1RqoG
 hm2Lp2iB2sOCCOkTUkMN0jHSint++CyWosfDUKG4oPbkxVYxyp43khP72RVlj/IHJub7
 pUq6tRpPSAAzrTuuECSv3G9bkyWbwyHcclLQAJYDtcF7m2pgY/FDv+jNTHiHBVf2W00a
 Uxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xfwvUVbaN5MjMKlFmeSjn3Or3UUiNn/hAoNZcmsCrfs=;
 b=KxTL4jd9ZEMvDSv+OoAzYL9U279lXU3PprwbqaGsa5O9GjS3nqx1ziv3X8TVItC30Y
 6Ld/4X/HEpmAl1ZnKGeFGKKqdfrKqfehX8u3ipWzAk1vQNI3w0AFMDVYu5Eld/2c9LUu
 guWUH+/cFLTftsbVoJZu3Hz0Oo+q5t93g89yFMPcRNbOAQTUdod5J0TJi/Rj9PKIIISE
 tKoNK+S+/iHhHZa5adhVJscjV2RSjjlpGg2D+WMIynr91Dk3jXFv4PSOXdr/7TsiSHlP
 45d2cVJqbmzhFHd0jEvJRKfQFOXiz/zYstb7idXMfuf3wNQVCY6tN79adRHgsf8mQgcR
 1DWQ==
X-Gm-Message-State: AFqh2kqGSAvrJ7ekDXTGtnRVfBXEDcH9VZHLDQltQpiRg1gkKPXvUUJN
 uViG8G+dJMOCqdSCuGB4zQhlIVtsNeXkawv81M0=
X-Google-Smtp-Source: AMrXdXtehBMi0+pQUZRqrxR8tmsy5XGMO1qN3a/roArbFSEG0GGpl+v6+EZK4EEGw0MODNFjFDSzWTQ96a46d/r9jLs=
X-Received: by 2002:a1f:2c0c:0:b0:3e1:7e08:a117 with SMTP id
 s12-20020a1f2c0c000000b003e17e08a117mr1204976vks.34.1674082410205; Wed, 18
 Jan 2023 14:53:30 -0800 (PST)
MIME-Version: 1.0
References: <20230115160657.3169274-1-richard.henderson@linaro.org>
 <20230115160657.3169274-3-richard.henderson@linaro.org>
In-Reply-To: <20230115160657.3169274-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 08:53:04 +1000
Message-ID: <CAKmqyKOiuc49zbG5ZOJswzqi079iUMT0BN3A_uY8G8NBb55gow@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Remove helper_set_rod_rounding_mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bin.meng@windriver.com, abdulras@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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
X-List-Received-Date: Wed, 18 Jan 2023 22:53:40 -0000

On Mon, Jan 16, 2023 at 2:08 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The only setting of RISCV_FRM_ROD is from the vector unit,
> and now handled by helper_set_rounding_mode_chkfrm.
> This helper is now unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h     | 1 -
>  target/riscv/fpu_helper.c | 5 -----
>  target/riscv/translate.c  | 4 ----
>  3 files changed, 10 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 9792ab5086..58a30f03d6 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -4,7 +4,6 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
>  /* Floating Point - rounding mode */
>  DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
>  DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, i32)
> -DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
>
>  /* Floating Point - fused */
>  DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index 96817df8ef..449d236df6 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -118,11 +118,6 @@ void helper_set_rounding_mode_chkfrm(CPURISCVState *env, uint32_t rm)
>      set_float_rounding_mode(softrm, &env->fp_status);
>  }
>
> -void helper_set_rod_rounding_mode(CPURISCVState *env)
> -{
> -    set_float_rounding_mode(float_round_to_odd, &env->fp_status);
> -}
> -
>  static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
>                             uint64_t rs3, int flags)
>  {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 493c3815e1..01cc30a365 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -672,10 +672,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>      }
>      ctx->frm = rm;
>
> -    if (rm == RISCV_FRM_ROD) {
> -        gen_helper_set_rod_rounding_mode(cpu_env);
> -        return;
> -    }
>      if (rm == RISCV_FRM_DYN) {
>          /* The helper will return only if frm valid. */
>          ctx->frm_valid = true;
> --
> 2.34.1
>
>


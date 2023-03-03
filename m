Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAhR-0003Xn-R0
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 14:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAhR-0003UW-0S
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:04:13 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAhN-0007FK-S5
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:04:12 -0500
Received: by mail-pf1-x42f.google.com with SMTP id c4so2245338pfl.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 11:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n2J3wBfnS9D62Jug7rilIGkXLvaZLQkBK8tQ3uA5ZPo=;
 b=nrKNqLVcEVja41SbtllV+K2AeiwxN0vwdm+wqNfYTOg2h4blhyvjirdfYGHPM+386E
 EQuay4fWkPdGpehwvYYOTnHJqiQEE+6gBKr5w+N0dY44eW9MGwvEoGkgjFyERSIR4oHs
 sVNm25vPEMa7ZrFHYM9N990MgiQKuCmG/ippMs06SSOL6pLPi9++w8XXN4+ekfzMBnCa
 54Q0IKDmClJxfB0cqo7hD2AdhcenzftV/pROBsKF43CP76SOWQ31bu7PVs4+PEqxZT5T
 V5AbpHBQvqj1IrbvWZhWIU9AfgSLaFl36XuWEUpif9QzVvD6bYcMa21lD/IqWW4GWuLW
 hHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n2J3wBfnS9D62Jug7rilIGkXLvaZLQkBK8tQ3uA5ZPo=;
 b=QiWY+MozCRxVlyVFlPikZUkmAnfq+KIHf9fmE0mONhrsnUjSHqnSJOpE/LLSbLydod
 CnSTuHW0G7MqZb+xQYLlBySIPUEhxbpOyeh2MesXN3gzWZOuipCBt9tR+Ne2erIioSFP
 PsnGZeBEoaT22I3Yono2H9kJSac6aR0gGpRQwlvpy+xRl94DlLEzWUMQr/41Zk8pLUxo
 ZJs28xTbKItDPPWATKrR0IPqxU5/w9NY6zYu15eZTEa7JQmorgoYGLwqMuCIFmF8NBjQ
 rrYX0DHtRXG3a1OkTWjqx2P0ffbg9vsZIGNZ3jE9f6V8xBqP36UDGnPDEbCb/vEMoKB8
 IzcA==
X-Gm-Message-State: AO0yUKU7g9RJyi3QMtcg/QIFOF2WiqY2ZlOni5L5n9laeDtUNIJjuycc
 QeND0EUGHxFmzVEbUtQGs2Y4GeTJ9SLbm9ht+KVItQ==
X-Google-Smtp-Source: AK7set/LK0LB10czP0zyWa2luECmeA9GRruNS133Ja/NM6k6/VR7w86Bz0gSn3NTdGnDWI8stCgNJEKiySS5AxI+8ZI=
X-Received: by 2002:a63:2953:0:b0:502:ecb9:4f23 with SMTP id
 bu19-20020a632953000000b00502ecb94f23mr913452pgb.5.1677870248299; Fri, 03 Mar
 2023 11:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-36-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:03:57 +0000
Message-ID: <CAFEAcA-mbUBH4VuobjqAtmspsGtMedcTQuvz+4Ls=-=mF+Yr5Q@mail.gmail.com>
Subject: Re: [PATCH v2 35/76] target/m68k: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 19:04:13 -0000

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 181 ----------------------------------------
>  1 file changed, 181 deletions(-)
>
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index d7237b6a99..3055d2d246 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -138,7 +138,6 @@ static void delay_set_areg(DisasContext *s, unsigned regno,
>  {
>      if (s->writeback_mask & (1 << regno)) {
>          if (give_temp) {
> -            tcg_temp_free(s->writeback[regno]);
>              s->writeback[regno] = val;
>          } else {
>              tcg_gen_mov_i32(s->writeback[regno], val);
> @@ -163,7 +162,6 @@ static void do_writebacks(DisasContext *s)
>          do {
>              unsigned regno = ctz32(mask);
>              tcg_gen_mov_i32(cpu_aregs[regno], s->writeback[regno]);
> -            tcg_temp_free(s->writeback[regno]);
>              mask &= mask - 1;
>          } while (mask);
>      }

I wondered briefly whether now temps are auto-freed the
complication of the 'give_temp' argument to this function could
be removed, but it was too unclear to me exactly what it was
doing. So never mind...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


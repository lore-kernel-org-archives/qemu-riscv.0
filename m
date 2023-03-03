Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9MJ-00061Q-0K
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9MB-0005zz-Mo
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:38:13 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9M7-0002O5-8N
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:38:09 -0500
Received: by mail-pl1-x629.google.com with SMTP id y11so3504387plg.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677865086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9je84Zq3E8tnA0U1J9Pfoxxl29B84Ox8ThKlHgDuPb8=;
 b=QYYmMcM7XDIiAgIMQcPmt+vy3IHDjWeY06gqG/znioqbrF7ISqW8cFYrewL7kdyLNm
 0f6oW9CRloKKh/GiYVy4KtDO1cJKWiRCBCsLCYtjD8EpU/olvJoEh8P658M/67+FlNcj
 uM1CxiZ5XOfZqk1du9PP5Rfdx7DsacPi2U+qGY83wvjGjwOggtnuepEMo+f9esWox040
 4VkNVLoZofbzXrym97Tu74oulLc1mZ3DrsUz9ugG1AieoHsmJjZ/qVOxZ4l7SZlj4X1t
 nrFWb58B7A89jShj9yXHBg6iMr/zB+JmJR+mCHQVvQgbI6Q99R2pIxkmaouiM324mbax
 Ld1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677865086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9je84Zq3E8tnA0U1J9Pfoxxl29B84Ox8ThKlHgDuPb8=;
 b=CUuRlLx0uBrblLgC1WTvlT9DCQGbYz1KvJWl3YDFsFaDcPiWVPCtwF9VgkHYGIm6WV
 lgDrGuPqLj5XsiYJESVWKNBW5bwu4dvoA50lHUApmqHCWEpGG/24mg6bO84jBUaM4Xez
 CPZmoKQqwhfflfWlDhNldnJoWODsCO/dkSHH+0OXPusYbNGaWZSLPQR+0TSjaFRDR8iD
 9pwFYVV5FxCUHUX5N5OqSZCfnmuPBN7Q1dbpAaK5xFZp8lmf0xWYRCrlI8BQVNhVivRo
 8BfRxXyGoxc1WeXgdPBUPN1eERFiiNIEBwwfadzrFbjJhE9a34GBV+MhsaevTiqLSUMY
 b1Jw==
X-Gm-Message-State: AO0yUKW8rdcz4VtTvphBfemZooXJU/1oRdw8Qj/HUDGH5Sd7BQCLp+1T
 p7BZt2SZZ/KNy/nLBkaFBFBE+91SbrPLMOmE1oniDA==
X-Google-Smtp-Source: AK7set+8Ebxr2zBRyQ9hNgNQRsiQYWdUDZaIAxpPkfoUzmjq9QE0irRsWC3BSG0Xmx7e1tV85Cb1rcpfean71xuRQE0=
X-Received: by 2002:a17:902:ab05:b0:198:ec76:e249 with SMTP id
 ik5-20020a170902ab0500b00198ec76e249mr1045233plb.13.1677865085783; Fri, 03
 Mar 2023 09:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-14-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:37:54 +0000
Message-ID: <CAFEAcA_qhH1xikZhVijg0xC=5DQd3sa0LNQ6T0a7ub2QkGwAAQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/76] target/arm: Drop tcg_temp_free from
 translator-neon.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 17:38:14 -0000

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c | 131 +-----------------------------------
>  1 file changed, 1 insertion(+), 130 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


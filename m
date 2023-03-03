Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAPw-00047Y-AY
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAPt-00046G-41
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:46:06 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAPq-0000av-Fb
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:46:04 -0500
Received: by mail-pg1-x531.google.com with SMTP id z10so2054707pgr.8
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QaA0GgfQE3v+jgTFbm+2hJo3CTuezX2gi8MsDE+jjYE=;
 b=nnB82iG5KcoA6OfvAkdZbKudLIqu/Fuu9xkDKCABDjAthlm5noNemYkaUWHZoHZvKp
 CwELsSDVIoLUcCktPd5okUNV/i69VpDAuAJHuB8L8j05IF8veexYd1CztKxOgDDt+WOR
 /yfPGe3cYrSx/0x2u6LiNVGfW2L87NVAOoL/MPgdFWQ9oTDnbKqEuot6nkAAzaLXt3X2
 T56ovc3Z5Wl/S1F/Ski7v14FpNJ+eONsj++imVziT8xhDF/ZrNd+kSyhBndhD/eQwkXG
 bBUdNWV4ixkYaEbRzs3GNaKRPrGB3Xj1qi/BUb6oxK9nHQyx/XYfXbyLHr8AUTob2srh
 Uh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QaA0GgfQE3v+jgTFbm+2hJo3CTuezX2gi8MsDE+jjYE=;
 b=pc/quaP8rC8ukCgxrcepIIdrqUjG120D8ONn19lNZjquGo4n8fItOYaQUSgFTYMUZe
 jxveI/Q42DFxyfGwGm6RY8D4wOdEl32qGeVy7qtDDpWH96hSfHz/xixhKqmcB3zC802I
 nnUYNnIZln5ktxzoVTkQhKv3xqlNxeK6dTcAxW1eVj6KzCNtiIvqPUI7nZr4BJu0ymzb
 9Nnva8YDB7IFdmA6hjhqlUPyx8GOIUqgT4peCUbndZy9VJmxOwWww92UuNvrv5PmaHAe
 nbhdyo0JBjUCBQGfjp1Niup0E+3u6lPz2MQA0xIp0/0YcKCq+TRDCKIm2bhGLS1Tb7+R
 bXig==
X-Gm-Message-State: AO0yUKX4oOMS7EDy4B2RiZZnBjFzqYxj5gykBbEgXn1tIFpOkw8EKt8u
 CvdlcIHJjj+2bKJtwqqycyYQpqvUo19KJqOsrRyklg==
X-Google-Smtp-Source: AK7set/LTEs7niba4UKwAkXSs2sd5LsWsC0NJw7IC9mZdOEaZVCZSIG+dSUGuEjkvgd1Ag0hzyphheuAHXOuYDrBM4E=
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr827958pgb.9.1677869160248; Fri, 03 Mar
 2023 10:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-21-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:45:48 +0000
Message-ID: <CAFEAcA_tGP3qAxCwK0p9C_EzGu=T1XAnWYhQq-gqqpekfztxNw@mail.gmail.com>
Subject: Re: [PATCH v2 20/76] target/avr: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:46:06 -0000

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 228 -----------------------------------------
>  1 file changed, 228 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


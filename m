Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYARh-0006tT-W2
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYARf-0006je-GF
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:47:55 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYARc-0001AT-V6
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:47:55 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so3184178pjp.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rf+8rqOwxr93bf93w7OyIDbD1iQfXmmQLHIMjh/TBQs=;
 b=jna5ALF/9a7celLZCkknk7CNVlrVKFHwDgoqVC9VPQyDjxJzxXtO24ZTBP2RB9EYrO
 rxD2OAKy1V4yOVhG5ogPn7xS1BT7a25y1vSJqLzN8MyLXDWXqAkYo46K4J4hxviDF7Iq
 0ppA5PEB6AUosdd/4YSuXOjjbvc5uNPzmxSshJ6TStDrQ6m0bAbX/B9u1wvImx2CgR0+
 VNEckocVBlnvDje9ByLj9aZ4jfXVDLdx2S6kSCYKN9s1TxFyWYb9BAe1mTOwjEfQnZHn
 73EM9sb5hnluq96iabZGddLjnrTJSlkGvcxnQO4baQD+KxUvLwk4lzkKfK09BZ/e6dUT
 MAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rf+8rqOwxr93bf93w7OyIDbD1iQfXmmQLHIMjh/TBQs=;
 b=wKCQYEBuPhQ5WIvWu72IJfEHt1jHLJVsGlOELvQlyy9MkzAk17Us1eOYZ+Sx4sQgVW
 1rCjsd3CrVsYD577uj0oki46IAkkLN26F/WQGd1GdojsIWi6PGv5bNl7CJKxonHxsQEv
 ypRhhpcLrRs6oIw+Gpd3LSpM8A90SrHcIyAXOduCj3HWRo3p/19gQ8lndgoOWgbk6iNM
 CBFxR5HziaxDzpC4yn51AwcGBOMqthcttg2tYuRsnFnmBKK+sPJQsipLhMy/ZjTn3GLs
 TXss5qbTkUVX+jcK/X811X3sWZU4X7Lr6m79DGRja//gFCR81LHzPVG6ndaqLFIrfIgy
 WAXA==
X-Gm-Message-State: AO0yUKUo8myd1qrCRcEHKwCzDZk2Mm0UMQgLh7EDTsEYzPwyhdyeWU2/
 F74eF3OnlELNgyWWFfVLIk5ufNk3oCJ0KYFUIzdRYA==
X-Google-Smtp-Source: AK7set/NTL0tXjglBC7JptIS8mgBkcC75vbIneYGfnlAX56jYOofFGqn1W12qSnrhNuCaJIoNhWpfgX/YUn4OkUNlCA=
X-Received: by 2002:a17:903:428b:b0:198:dd3d:59 with SMTP id
 ju11-20020a170903428b00b00198dd3d0059mr1075684plb.13.1677869270628; Fri, 03
 Mar 2023 10:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-25-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:47:39 +0000
Message-ID: <CAFEAcA9mq4zGgvZ+xfQdC3tTjHM+T8qECbLuxNj8pA-waGxWyg@mail.gmail.com>
Subject: Re: [PATCH v2 24/76] target/cris: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:47:56 -0000

On Mon, 27 Feb 2023 at 05:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c         | 70 ---------------------------------
>  target/cris/translate_v10.c.inc | 41 -------------------
>  2 files changed, 111 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9G9-0003d9-Q1
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9G5-0003Zv-0k
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:31:54 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9G2-0007qH-2I
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:31:52 -0500
Received: by mail-pg1-x530.google.com with SMTP id 16so1917825pge.11
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=krSc7l70xY7dnqBNWAzGumQOCMWgGjAAkQshh4BmM3o=;
 b=K0ivzmLb2vnD5NAjEYPF9S6XnGN/7WM3wIpFlrteoT9lss3lXJ7BSXJW3H1xMMeVdK
 Km0uTjMC0mwuvNDeMq097zk3V0O/u8jAtMKdCXoBjnBKGAmdbWJI0w5+HLYm+hsN32b/
 TdnPpBCoTFdKysMBDoafAaG4FYBqupVHyfHZPbkNnYhyHt2LciNMWxXG7hx1WFXWisQc
 fRXelE1EyVqi9Irn0jw0nqm+Lx+fBFTXgPaCtOS6SLt5OlL9KslKZQsVG1pK1PvNXSsR
 dTN0BPHRD9h95a3PT3vFFko23SX4nRAUmKqz/pOO0gVTmIYwTW+Z+KzyaTYSFrXnFh1O
 W2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=krSc7l70xY7dnqBNWAzGumQOCMWgGjAAkQshh4BmM3o=;
 b=oSalvgB1BG5Kqu7TOImev0rvNNEHyNMwLPnB2bohOTnJi1SIlYgmc4lgUdsf1ahpd0
 XltMSJJ3Q+oz1QnLBVky7f+78uFDGCJdXvy0AlmBiBSpiNaxZVVKPeBLHigq1DSh2aEt
 h+LNsgUskU8DT+JdlJkaxpMnIABj1rBVUvrvIZDG3YF9rzoS56coautDaY6IbqgMZqV/
 LWkW14qF2/+CHfYxuRAO/ztkCNSlRnB9HJsG7au4HmdJBeEx73jV1YAKqY0ai2FP8GRw
 mZk5OXT5mFUQwV/buzSLju1JxZvFh2n90vHfaPfYXJ6gAPJniV1H+jhO3LgdHe8MALat
 fOnA==
X-Gm-Message-State: AO0yUKUb6IMb010BPirK2xFz46G9CmEnFqqvr2zSF20CcUmD7yvMMLno
 UxOQVa2v+h1ArqX8tyMhyF2Jljc8Q1Mek71/CnF1ig==
X-Google-Smtp-Source: AK7set9tq74e7ccQkd2I74xPvZHMLVBmLgn3dtkKrWamZx92WO/iTJWuVFf3CikyyVmsHpBXoHMDuXGFCteOteIFcdg=
X-Received: by 2002:a63:2953:0:b0:502:ecb9:4f23 with SMTP id
 bu19-20020a632953000000b00502ecb94f23mr817586pgb.5.1677864708643; Fri, 03 Mar
 2023 09:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-8-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:31:37 +0000
Message-ID: <CAFEAcA9RER1TP3XLsfeN22_B9UO+TPVxi1HOQaBLvxWtgnKG8A@mail.gmail.com>
Subject: Re: [PATCH v2 07/76] target/arm: Drop DisasContext.tmp_a64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 17:31:55 -0000

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


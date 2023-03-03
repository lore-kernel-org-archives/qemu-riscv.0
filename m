Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9HF-0004mF-Kx
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9H2-0004Zu-Qb
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:32:56 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9H0-0007y5-CC
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:32:51 -0500
Received: by mail-pj1-x1036.google.com with SMTP id y2so3285154pjg.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aj8U0OhWmYk3psFTHxrKO9h0uci0aJEwA5Rppq7iSfs=;
 b=xRDa5Kwdu0pjHPxV1AjNwRTEz2qhUhIl+rXeDahbXZA5F2sIXbTBsBqdJW7XnxzPqu
 JOF4jZ1BCI/Gfj3CPUY11oEhd6pi4vFXV+d4Az7rbgPYw8SVEGWghVnPyIf1n2Chj5IV
 2TuP+YRg/LTH0NWa8KtMrrRFeDsfeEmLtLMHX//BVUcGu4VyL2ItxpSD/eP/DhpLjQE2
 2qcHQJzV3Y2XACRcW0MDjETI9EofwCIbLPLxHFiEaQSP0Xfch46DFgDluSihfJq018i8
 W+a0R3Q4PGk2bBcu3NfxGkSoRmpE8qg3fgYWp0NZrt8cmMGiqyBunxwvH2W8CBNUMYPm
 jXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864757;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aj8U0OhWmYk3psFTHxrKO9h0uci0aJEwA5Rppq7iSfs=;
 b=lm8fDjyNdYeqEhUUdtKobSTEouW6YIwLWud+1ZeE/3jT5f6Y5EjehWPjfVtAvw6sSu
 OP3s1teX57WUBglmwp4CXyNvMOpfSD3JQv6J2rn1Pvd1gp2UIMe5P/SakpQdZC4pBVrT
 HWuM7Yg68XNhewrUaMilVRxOUj2G/ON5SsAGzwS6X0Hz0B5pjboEB8aIUTEavwlkASuV
 1v5sTsRyqPvhiiODh9lDt2QB38vNYKhsyOHNSG/7xM6Oogj9xnwAHcaYD9B0WWa4RGua
 F1d3dqFp6Piw0wZJdbnEwl0rj5R8a+QjP3xz/NZSKgPeZh6zNNj4c7jHk9mVM4pjjaRo
 Kjmw==
X-Gm-Message-State: AO0yUKXmjr+o79O1gMHu5MYPdcgbImKeB3EJS1iL+WNPSg6rglU6nGIW
 CFLeTz+PuOjJgrKi+Yvw7YfaWgTUCF5WywF57sZHzA==
X-Google-Smtp-Source: AK7set8o8rQpJWbXVE+epFGzf7mMv3EQCRgZNivSi6+yQIplJL5v31RqDbgmO2Iv2QkiUKh5M01Sn+32PiCkMEy9Vkg=
X-Received: by 2002:a17:902:efce:b0:19b:5233:51d8 with SMTP id
 ja14-20020a170902efce00b0019b523351d8mr1034251plb.13.1677864757531; Fri, 03
 Mar 2023 09:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-9-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:32:26 +0000
Message-ID: <CAFEAcA-QBk6d22a-TdHQ3m22C0qMqJybob3kMMmp6Q+HPwp-xQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/76] target/arm: Drop new_tmp_a64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 03 Mar 2023 17:32:58 -0000

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is now a simple wrapper for tcg_temp_new_i64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h |  1 -
>  target/arm/translate-a64.c | 45 +++++++++++++++++---------------------
>  target/arm/translate-sve.c | 20 ++++++++---------
>  3 files changed, 30 insertions(+), 36 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAbg-0004Qt-Ud
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAbg-0004QX-4s
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:58:16 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAbe-0005di-9J
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:58:15 -0500
Received: by mail-pg1-x533.google.com with SMTP id d6so2090437pgu.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GfA3i0EmxeH++b2Q192tc6RbJRiSyD2bk1j6HbEja+I=;
 b=PRz4spGeRvfcxUkeMsThb62DGoOt+Q6NLG57kpMUkAIvsbAho7GayP86/hD4/2eHbs
 VC2jDfivdibNWclyldfnI3v3w4TBOfaf7WBrGsgKlIQ3AeoQeimp9Mrg+1SXFIMPdKx2
 d6U09XgEiGWsuCfwVFXpw1le+kIKn6HpSM7VqIMJCBG/nB0tRALgu6D/BVJXo1ncq4E0
 gmaAX7fB/j9txjnNbU7VYHlhpN6lsM5iDInEerFt8gwJTLEcKLsD5G39MuIKeIr1rmYh
 DjfpeFbYjglbHr27gP41Wnwx+Trnr3OufMKYZydx43Q4AxCA86NdM6Rd845FBiIGjBKI
 diBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GfA3i0EmxeH++b2Q192tc6RbJRiSyD2bk1j6HbEja+I=;
 b=M9YRmm7VvB12vAmVsYywGD5o/ONjGymob4NRWfh9r+5njSw0otJEa2N5W239juw9Gv
 Yf02HMFqqXZU7ur00qBX1nGUBbrzmXpvLHSQA+NLsyOvWODw5IHT36FkQZtjcXuckea4
 9Z8XqP4iOkIvEO4914q/t5hMwVPQRKh5X/XjCgk8RST61kZg7o8eqrcGm0QtboFfcNqJ
 IALmAiS0IAF3jguQBR2Z4Digdqqjd3DID52Af98TbiWPYGaxar0XGjvJp2vbVs8S8+hr
 oFoQ1aFfvO1KUIxGmMDh3iQJ+fVYmO7B3AZ9fzG3ikMVBIi4nlEy2fxMDDJIsHvvwdvf
 UuPg==
X-Gm-Message-State: AO0yUKUGm5syfzyGt1oBdDRsWmQPCjALoBUhm+7w8AiKHzrmHcYYUAYz
 N+aGddGE3t3wKi6SYU0GWvmD+vinq4wwvGZsO7SIdg==
X-Google-Smtp-Source: AK7set+C5Dy+V+LaZgSvSSfTdT/U22+vVvF3Z3MaRiMsXPzJg7GDKGKhLM3nB9zwn80IPe4urbua/InbSSup7ab+5OU=
X-Received: by 2002:a63:2953:0:b0:502:ecb9:4f23 with SMTP id
 bu19-20020a632953000000b00502ecb94f23mr909019pgb.5.1677869892789; Fri, 03 Mar
 2023 10:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-35-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:58:01 +0000
Message-ID: <CAFEAcA-Zy+svcJgBXDu_VQm=f2cyYRyZiiEw6pYD0zqy+jV3FQ@mail.gmail.com>
Subject: Re: [PATCH v2 34/76] target/m68k: Drop free_cond
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:58:16 -0000

On Mon, 27 Feb 2023 at 05:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
> Remove the g1 and g2 members of DisasCompare, as they were
> used to track which temps needed to be freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 40 ----------------------------------------
>  1 file changed, 40 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAkW-0008EH-M7
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 14:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAkV-00088m-Q1
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:07:23 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAkS-00085d-Fr
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:07:22 -0500
Received: by mail-pg1-x529.google.com with SMTP id q189so2081064pga.9
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 11:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870439;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9Vi35FYk9pNKyUa+wOyjhmmd7pel0e3d+ja0uD/0MA0=;
 b=mGHe0PnDQmzI75F04Kngi5Rs5YIDIsdyMvAxEbGzeB3nsHb8+vESy5zM9vwus/bydC
 boXs2dAtiRwo0NgZjO8XB89kGV8YMEA95m0bAX9f8RIy1SHF5NQnU5eQxGw3mM66sa8h
 VwPG47Z9fzuJaHuH9BJE2sEfMIxLer6mVFt4Y8avAFSzGSI+WBvX3eba9uLFzZhSUrZQ
 6uGrD2MD9jah6rwgfPB1OIQW9JqLewlh+64VjMGfdZI2YiGpCzCXn2+HfuN8gE+Yh0jo
 EmP2A+x4B7R674ajY2BGXsc/twAqvWqxnuAI36UgBy+Xqj3Ul2dfEzPNE93BjoDGNQhN
 wa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870439;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Vi35FYk9pNKyUa+wOyjhmmd7pel0e3d+ja0uD/0MA0=;
 b=wivi06B3KDkqYxFIxkNEiN9xKK352asKB8rvn2cOt4neCyzMRB/xoQ88XL9B+PoSgx
 M9kff4rOqB45xL0A1TdQtXP2EK7UAaY1ofXW7YS9Kw/xQdAocsEHDDBdOZVutAdrhKdn
 DM0ASLJFD7BT2zIrwJXOr5yBPQaOzBYGh/R9l9KLx+MqLpUHOLnWlBWCrLQJrdslP0hV
 VhL9Zjv+P9oROGhEhmnjAegrc90d3QXv5dnYKjYgsMAkTb9XXiCvOyPMbGsPHy2ufTFd
 Qk4pprGsLFtXM3jdDJUTDvG3DnJb1iqAIHmBE/SrJO9STO77Q4fMx5UKFSRfqyJGzm8s
 3olw==
X-Gm-Message-State: AO0yUKXCnEtPn8aA3c1jGkAtggVI2HGfGywWWCbH7sUwNAIJjh17rFTt
 tVWHzvRDZ/cASisUuK5gyO7p/ugEuqTj0UDb15Jo9g==
X-Google-Smtp-Source: AK7set/NKjXNYahgqJzq9Zxb/CEDFjFI6uRYmVF2C5+oU656lgk3VIVaArVNwMcXmfQ/h2MEqsJjDjqfMxRz54F+Sh0=
X-Received: by 2002:a63:f0a:0:b0:502:f5c8:a00c with SMTP id
 e10-20020a630f0a000000b00502f5c8a00cmr818667pgl.9.1677870439202; Fri, 03 Mar
 2023 11:07:19 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-68-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-68-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:07:07 +0000
Message-ID: <CAFEAcA9HssTDrvV6H=NYRd0YC+H4AQ2q2ym2J1JBjEjJhjC94A@mail.gmail.com>
Subject: Re: [PATCH v2 67/76] target/sparc: Remove egress label in
 disas_sparc_context
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 19:07:24 -0000

On Mon, 27 Feb 2023 at 05:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


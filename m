Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9AP-0001sK-Vj
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY99z-0000tm-JG
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:25:36 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY99w-0005ic-Fb
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:25:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id i3so3402601plg.6
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864330;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=raqoH4xnGC35ms6zXFn3a1ISCKigouTArbSSUf/deY4=;
 b=OA+E4IELnfNcQfbsHXoAI+7BVSv/InEaDzNALq7lj5GP7jOog1wOh0IYXlk1IxoU5t
 sOwNesKYdpb7VDdO3XQ+i2uNXMXc1czH1FWf25xdLx0QrUAEKc6+oEhe0wdbNO62c8kc
 VUC0uv08kxlzuxB7CLs5Gn7IymRXMJsOHC8JCLDnu4fA9ROVhOq9eTZrd2wD3jpPqgXZ
 vl0NSqtzHNflkcnvY9HXroRg7ILzI+y6JOaXUfhmIuZ7plPvdM5n8G+bOt3OdlTd2u1A
 hlYnaTDIEpMUzioVPrJQI+dXbSPibrGRhtavqvndXJCEqHeCQPaI+L5+baoZq/Kl9QnD
 eWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864330;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raqoH4xnGC35ms6zXFn3a1ISCKigouTArbSSUf/deY4=;
 b=DUxUi+NbcSyACXO6QspNncJx6fIZqmjCHT5sM6b3qWK8sqpJxtZiwpRlzHmMyn52IJ
 6KceA5eRRXCG5n0uUUq/MMvalAsuB6KFIzjx0yoeezJxjiHauQd17olHRBFiDqu1cQN2
 OlwEzlCmGjnKDZ+yvRzzlMKuOgYzucVI5wfM5RxUTQ0TjmqrwOFVyxzRMT8pMpHsbm3E
 MQD4IrJpPCbFUH2/nNmQxRiMXzZ9ZXkvW5QDMWNgsLbCSZg6oVAZbPL8yaTfff8K6pDK
 iN3keWpPHk9TYdZ73dwXzXWb2YgHtSboautKpVrg9Xg5LUT86+MOBCS1HE8T6i+3XJLA
 2Ixw==
X-Gm-Message-State: AO0yUKUI2jCpAPpxcAtxAKYYjrwe+rUqASGqHWTm1DHj6YbB/080HWrY
 ID6RT/lm0GyLR7K+TFkBkNc55xfQK0asf7dMChX88w==
X-Google-Smtp-Source: AK7set/eojrNH1fSUVifJX8Vboip1gHfsgXOeK+j57JWn5t5Q8QdFq9V+vhi5/cbEL9kLCHvD0PqxBnfjv3PBblFGro=
X-Received: by 2002:a17:90b:893:b0:237:7edd:2e08 with SMTP id
 bj19-20020a17090b089300b002377edd2e08mr901355pjb.0.1677864330484; Fri, 03 Mar
 2023 09:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-2-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:25:18 +0000
Message-ID: <CAFEAcA_+PNfRrYR3=2rHtg2w+BRWRmeP8_kpzec-Xejb4Loidw@mail.gmail.com>
Subject: Re: [PATCH v2 01/76] tcg: Remove tcg_check_temp_count,
 tcg_clear_temp_count
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 17:25:36 -0000

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since all temps allocated by guest front-ends are now TEMP_TB,
> and we don't recycle TEMP_TB, there's no point in requiring
> that the front-ends free the temps at all.  Begin by dropping
> the inner-most checks that all temps have been freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


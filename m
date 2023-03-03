Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9Db-0005uL-SY
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Da-0005p4-7B
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:29:18 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9DX-00075G-Gj
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:29:17 -0500
Received: by mail-pg1-x533.google.com with SMTP id 132so1905734pgh.13
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aNps1/FowZmxOx2hlK5agPTOt7fAGsvKEYSNaTUjzYg=;
 b=cf4pvQciX92KSrmXZmahY9k8P3fBP4VR2zZ5DWYntYI152R9pBZQIGzXpATPv1ZI7n
 JbpdV/he3jrvHKX7WuzZbgxfUKgt11eM1FFRzTRGizWRi20eE8m3fcMZ/QJPp608Wxuf
 3n/Z7kczicP9O+4C93a+A/VTNiRdUix+BWTir2YS7fVMbi7IWl4ivwNtS9V4OkO2zjnO
 qVMP8YHVOs9wOcj3rmOKthD0ARUmK3uzbgZWPJQ/lt5xuaKEAFizfPtsopkSx28TWDRb
 cI9/u5su+7OuP3+8EpAOMo/3sF2zuD3MJMp+4coRAKZYYLsTE7NZg2mVfKk4jKhYXKIF
 8M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNps1/FowZmxOx2hlK5agPTOt7fAGsvKEYSNaTUjzYg=;
 b=mFfIKMFQDS5Iz1QVEYPXAPtiZrrO9EQPULFTOO8RGPycKiv2rBiuZGswm1AGWw3wLo
 NWMrKlXv7hxnAuarFVctfAotqb+UcO4zvC3lbWhDLLT2EY51nrWfIR42K3rv6lBQOZuX
 3WTEZXe1rBMAROsc3wZt8G/PrqakObBopJ2t6sGao8LbJLM3xWU0iTIOqwbGe+UUnudF
 FW0f75mmIf/qepuNn7UEMGsSSwCLLIRClycRii/0A1TbZpCMHsoHTqPkTCxFhXCOMGoO
 KwwO2IRwr73JdMnf1VYPK9R/uAuB2yxIclB7f0vzdWXJBsTR+bn0yBMjIsKkk/mh0Xky
 5mAQ==
X-Gm-Message-State: AO0yUKWrIDpLRwSLsVf0mcFvR86vPa2xA3qlwG8+LfoJ6070bvz5OsAS
 Ls0cohtdHqhfM+tby9IKO/mrmToBCEq+yfvdT5IDFA==
X-Google-Smtp-Source: AK7set82x40Ko3S3a7VXwbvS2PfV03a9vjPmoWD+YqP0CFB8c957YgCFwOFifXq3AIKoX/59Y6jlKljawhI2F0x8k4E=
X-Received: by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr1203980pfe.5.1677864554075; Fri, 03 Mar
 2023 09:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-6-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:29:02 +0000
Message-ID: <CAFEAcA9RY-_h_xCYpmS0qh_FSOkL8CvzJhifZ1TQi2W2Gx4cCA@mail.gmail.com>
Subject: Re: [PATCH v2 05/76] target/arm: Remove value_global from DisasCompare
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
X-List-Received-Date: Fri, 03 Mar 2023 17:29:18 -0000

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This field was only used to avoid freeing globals.
> Since we no longer free any temps, this is dead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 1 -
>  target/arm/translate.c | 5 -----
>  2 files changed, 6 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYA6C-0006jw-3M
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA6A-0006df-Br
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:25:42 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA67-0002Sw-WE
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:25:42 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so3101306pja.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677867938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fnGoF8YLB/nvxFfUrxZ6aikhdToPm0b/4C20nXAG+4A=;
 b=v2nVC9tOUVDOGQHxwr8QZy0mwtJMv830e02aylIJZNPEWnGzhhgcpKmejS4jZXHlwv
 6eMuh+Uj1CFsuxPMCwdgmrQ1mHpsz8E6RyTpZr2ZJAWuY+qmC1SOTjmjceAtozc8uD1/
 KLDBrd336xv7bsa6hOZYz9xlJqi3lmFp1sPsGgRx8x0g7HQzRWKLOjn3eyQ+Q44qgD77
 OtbkfMtxJ5I+JkEOUW8nbJAh+2B0Q6WfulhzodbvgDsqA7lX3WdG2KRswKYWitqipMO9
 dFcQQ+6Jbz/SGMmntoLLFWh6ZT00V7bHKw9nknuILzjEiJYGRcOmT416++EWqgO3GuMb
 /iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677867938;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fnGoF8YLB/nvxFfUrxZ6aikhdToPm0b/4C20nXAG+4A=;
 b=r6ijVEvvrzBcHmQP0WwR7Jsjusfgy5bmd2XfasEpb4zgQvIKeCegdHhVOhaCjjRbXr
 +nihlAfFmoQYgOJKV+wRsUQuzemUqPyZLYd0+HTEYaWRhlRMZ42Yy6a3XageJxLipFpc
 T7p5EwQhK+hF6FZM/cBvi8IXbpulzcL9npQTo2Lkb7RKtDK2BxtNlPGbFx9R2QDdKNhz
 4G4Q/X8CH0p6emkCVOYM/WOrJV4Luvgz8n42QZF+IQx0JRE+A+9anHWRm+TGQkKrImdw
 WyNhUNPcH0D5tQVeFgeksJroeyGEYKIKeBJKMvoA7Ad9c2AHHrXC/qmSBX9tgJVlWzB0
 w5+A==
X-Gm-Message-State: AO0yUKUxuhVheofguQ8i8WqceYxQeHXxuGlGLqSY/cABdrUoUkO82Tbk
 zNHuw9AhkRMb47UY/Bx56aYrS0PN0uitBi5ZZCBLJQ==
X-Google-Smtp-Source: AK7set/S63Otfg6CUo4P221sWoaAnV2aUL9x5F2lAuWQe5UMarLFxkdmzGrY6RVM2CJjOhrDoq0sU/2ey2R+2nLppxg=
X-Received: by 2002:a17:90b:f12:b0:237:5834:2808 with SMTP id
 br18-20020a17090b0f1200b0023758342808mr987776pjb.0.1677867937990; Fri, 03 Mar
 2023 10:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-15-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:25:26 +0000
Message-ID: <CAFEAcA_-d1yr_afCNHNSaHTmWAzjS85OX8gXwHC1Z4ybGvLE0A@mail.gmail.com>
Subject: Re: [PATCH v2 14/76] target/arm: Drop tcg_temp_free from
 translator-sme.c
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
X-List-Received-Date: Fri, 03 Mar 2023 18:25:42 -0000

On Mon, 27 Feb 2023 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


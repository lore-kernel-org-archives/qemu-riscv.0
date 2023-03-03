Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAUY-0001aY-Bb
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAUW-0001Z6-L8
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:50:52 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAUU-0002L8-71
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:50:52 -0500
Received: by mail-pj1-x102c.google.com with SMTP id kb15so3554658pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3tedVeNjogK4knQjMdZiXbJqYYoMooAY0dZ0PwBr1fM=;
 b=k9MmJtlhVO57bp+C8Bosmderp7rQxPt9Pk0n6UrZERM7iin6QwiwFJN5J+9hZjWHC+
 aSEvq4mlVdfAZn0Eb9kTDwMeIVbWMk2+LnYpk0BmDhcjkfayoO+fSPIwntkbeU/rwMvP
 Ky+eDPvbOOzjxYHKrVyn4vnoPSWhvn5TQa/Mexsb3XoDmsraZq4cgPJbxAkxKBlKDPNr
 ld1AxSnIcC3aiVMEo7HdNmOaZQNGmse3cj05fiscaLXqgJYnUCnkgEvlBQIUJVnKMRwW
 SC1QHXQoHYAvHr2uXznEa6AsZTSWiARccH06wKhxKYWgDn1Ew82IagiTPHo1wVlCn4Ok
 6JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3tedVeNjogK4knQjMdZiXbJqYYoMooAY0dZ0PwBr1fM=;
 b=ekVlVdlI7/DmMely+HP/xfCbYavEsMaTHF3IP9ReKpORY24zgioHHsomozUm/MYw3R
 P89OYkKjYiHeX5BAC/kNyb0xDe7csMzMyYcB79oUo6Cd0RPYGF7GvQnJWRqhmjpluO+O
 aU/JmakiC+HEuhsRYUtCxOk6wdgmS/CT7WtjelIwmM/eD4LLX2I3TToF0HWotv+LRcIs
 hfxLoFEXswCCaaydxc1WPOsoKP4pPBqfs0Yzt+7l+FeXBKQQIsoUUBt7vmzlnF5pP79j
 6la3PpjIhLJryukiaKfQAj8Xj/toNHm+ZiinuTThNE8VbeSeJ402qjui54WtUr7YYA3M
 NBpw==
X-Gm-Message-State: AO0yUKV70dl5oduxJJZ20QMes0B9UbyksWSIU+VDD06N9qnfxz861IxY
 KOJQGAvSOd6Oh1QcT7p2brAmmrQ3FTOCCiHiPFc6Xg==
X-Google-Smtp-Source: AK7set+TqCilDYIKZmBl7pKK6zaSDm//damYHvtwR77RanLgJ6NTTe+HoCqhv6BBuVx5BBo9zt09/5XfOQSU2IGvFsc=
X-Received: by 2002:a17:903:258f:b0:19a:98ea:5ef1 with SMTP id
 jb15-20020a170903258f00b0019a98ea5ef1mr1067363plb.13.1677869448571; Fri, 03
 Mar 2023 10:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-55-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:50:37 +0000
Message-ID: <CAFEAcA8Wc1_kmgakVTtL0Xcut+fnFFqN1ttot05F7q0kcLioJw@mail.gmail.com>
Subject: Re: [PATCH v2 54/76] target/rx: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:50:52 -0000

On Mon, 27 Feb 2023 at 05:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


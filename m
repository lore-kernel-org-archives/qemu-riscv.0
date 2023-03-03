Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9KP-0003Ey-5I
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9KN-0003E5-Sd
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:36:19 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9KH-0001aL-Lo
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:36:19 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l1so3319973pjt.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n2uzFW9k8BefPFcSpW3FfpQkumhKuKk5wcl0yvFDZIs=;
 b=PKU/oOKjFSmAT3MEyaSd36VK9jdl2q0iX/nWcUGvaS857ovup/RX3NuCQYxwOeIVlh
 ba4KdBD+GJUNQHaMtebPBx7XDuwBi3DX7FSMCEAJDTac6KVxV3z9WeVS8kYhKMi8uIe0
 hNIfOTgXIF1OM6b7kHWudkyHlAMnCkOgTwcCJu/GMnCP9jl0Ip/Lu5kbzzqrVqPI+kXu
 7FUd2iKYtHlq7zux4JteufqS+6AV3ooXN5o7/6GApGr4vopHrTUzAqNkXbXnQMSczo02
 WP5hG9dIYw+nE1YS23AsEWj+nlkaYuCiAb6sgLAlDWlePGikMNeXT4LVpMfeDzdyqVfy
 kMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n2uzFW9k8BefPFcSpW3FfpQkumhKuKk5wcl0yvFDZIs=;
 b=MmIRW6Oy4NBABoXkox6zSEfPJ69jjmFa28tDx9foKihVbgH/6G3jCdJwbHZdPtEqcx
 TrPSL89FUXJoXZf7s2EmVsA0DaewKY/ukn5BkrPg4I5WP3idOzi/72GDqkiE+KeDIruL
 YBiHtyNiKrFahw9uTFa1M9tr9B7wC7keMvQMgJLDaPajxY6PIGrZUZsg8gfwmq9e2aIO
 yImDUEobczgMZfVErzUVKa3dcXwXxBCeuCGGvZ4cwcxjt3TwDCeFgpDOEJPKdecRPC0h
 dfBan8O+bex2bOv6l5C0/WcIa99dpj/n5anyAbXdouVkl3FeEqYUlhtBFB6YboaUQoJU
 yebA==
X-Gm-Message-State: AO0yUKXWZiFjv163zzUJ4KAKM+0hR59fz8d1l2nofG7KcHr1S6zg43BP
 jvMjAbD5RxEPu9kHGfJf2HTXW2eQGuytdZJWtdIVrg==
X-Google-Smtp-Source: AK7set9iFts6h/m1zRglWvYIkM2E1tbejK2+qyJhMK2cEKyc4HOKYiiKtoEspFXutegzZW1EjHMHkH8Znl/OpWgK9p0=
X-Received: by 2002:a17:90b:241:b0:237:ea76:41ed with SMTP id
 fz1-20020a17090b024100b00237ea7641edmr923483pjb.0.1677864972091; Fri, 03 Mar
 2023 09:36:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-11-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:36:00 +0000
Message-ID: <CAFEAcA-0EgYyMEt8a92b7qdxfoghgWLrAp3Q_vmLjhJbi9NYsw@mail.gmail.com>
Subject: Re: [PATCH v2 10/76] target/arm: Drop tcg_temp_free from
 translator-a64.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 17:36:20 -0000

On Mon, 27 Feb 2023 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 468 +------------------------------------
>  1 file changed, 11 insertions(+), 457 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


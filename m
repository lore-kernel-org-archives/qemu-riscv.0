Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuDf-0001Kc-GP
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDY-0001IY-Lk
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:07:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuDV-0003oC-LW
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:07:19 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso3248486a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288436; x=1685880436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w0IaBi6Jr8BoxklZXBMID60jI0oj2n7Ge9iH5OB+DzY=;
 b=rQvMIOcFBrOBuJx6oP+SZJaCsQyggA25KsA0qCqPq5AP5CnZoiiE/zbgvm1WYrtl56
 oQQvVp2TLFIsU0rH6Knd23hDc9+PNWwH8GX4kqAuqUeKW6F+FcMLF8AQFiYDo/Kj/vkC
 h2zoz/xnKDAFJZCRubUnEs5cyyZSRgcYcNfgZjJzR1y5btwyU93YFw1tUxvHUavwvNqW
 EZjEwWjqSDbbdmLGRw1iuFVCMyqYf9Vj89KkMJWtJN7QldR7VwLlAbLCIkYnb5ZXqLj+
 kl8xKkipSUA/v9xoPUR9UnZJKn52kWdjc1JtciiVa6L+3J74RQxJc4n5ALtBbR6iZWtz
 wyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288436; x=1685880436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0IaBi6Jr8BoxklZXBMID60jI0oj2n7Ge9iH5OB+DzY=;
 b=aj1bwSFOAfEUhmR9MClboy2qZgtNiJdq0RVnZzUVu+M4AT+efoPJkTJ2e2M5E3Gp9a
 Y7N9rvS41eIdLNTPKpemFzij+gSPj8cLTRY6PzO3UR/+faQOwtpEkwiV0gKEL+fF4CGU
 ow8jGNHaoXasRMAiM+xEU1Bgm3iF5RPXIoev8NXCmjP6RZXr6S2hHywcfifpkBrb0jkN
 svxOzfx0MoRN4bHLKmtJ/S7qCLeqEnjvoASmNnHOuvLi7/No/+prBi6QT9DZ72FjTM2Q
 gc2CoGf8zgG4FSNityUT37JN5NE1WcdxMZD6VR94BaTOwiGB9slTvrJgpfxmAmRziTJ6
 zpAw==
X-Gm-Message-State: AC+VfDws5q45MNxBeMinc4VX3AiqTiHt4GdD1tixDvXZyu1jzNwSsVLy
 NzqMmmlZFdbZwEr/0OgZ+O+h5DqEONH7SHTHZyCbtQ==
X-Google-Smtp-Source: ACHHUZ6leE8ngd6GVRvFkRnZSmMHSoCWsUrMHMu8nLDcIipkZN7Hg6f7QvPmLk09KbbN8CaL9m8QtgbcVqtl6kDVKXQ=
X-Received: by 2002:a50:ed99:0:b0:50b:d30c:c595 with SMTP id
 h25-20020a50ed99000000b0050bd30cc595mr1213814edr.7.1683288436152; Fri, 05 May
 2023 05:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-24-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:07:04 +0100
Message-ID: <CAFEAcA-Dnct2C_DnYDOT6mTAYXpnY=jN99SWZvMTc3+_0iNDuA@mail.gmail.com>
Subject: Re: [PATCH v4 23/57] tcg/ppc: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 12:07:21 -0000

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 44 ----------------------------------------
>  1 file changed, 44 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


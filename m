Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAig-0004uu-Lu
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 14:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAic-0004pN-8g
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:05:26 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAia-0007fy-Nf
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:05:25 -0500
Received: by mail-pl1-x630.google.com with SMTP id h8so3725334plf.10
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 11:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rY8hg+ZDfbay23UtjvXiQyvBkil5VxYpNYFPij2yIH0=;
 b=m8sVZdBdj20lLIG6GVfo2GmPd+/ll5jPqioG3Wus4r48CN50yc661GZUX3yaWSWmWd
 f9mhl+mZzIsTD/HGi5cSb6r2t8lxNGaecDmUwBF29SYjQlR8B6ixi+XSSLwaWC3g5UxZ
 huiuyrDchCZK6onJ3Cg6bAYb6rVEBDtBlvX1ru2UsncggkDZF4zhkxd6PGOCT5ewM9Cg
 pBu2yj0gq3oKXKW6N7Uq3zNb6IMukxPxJKkzGazGvNL9PkckCqXgsXx1dfrO2PCnTyty
 kfXTbBHombjdYmaPHrcYF28g0Lfglk8PAc+7K2nmM3GOqjiBY2AQbJ4Br4KvD8J9Mwh/
 3Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rY8hg+ZDfbay23UtjvXiQyvBkil5VxYpNYFPij2yIH0=;
 b=n41iBWPph0UU/mbfwxb1JW615KzfAYUAVdHHddu7mJXQqw+SkL91o9LRBrhfmTw/nl
 d3Z5vQnlFPmkNREHu3JBQbDPqEqvqoQ7qWcS1Vb40ijJKidIdTLx9fDslfyzhpu8gMyU
 KpE81SGSoVSYYNwjLFcpL4mzfdJLLBrNaybP7PBi//CXg/P2inR5VOvEA85HuCt3t11t
 wRKeHpBz3uhYHn9kEr0E4K99xXRhSw9AmUkwS9ovNBLlvl3dxRG2FF+B4NJZHJDfvYI5
 FwJNj0F78aK2jOpNj9nuTRK163/8b58g6aZQ4haQyZsf9CujAe7bpgmACCcwLNf+77I0
 7fUA==
X-Gm-Message-State: AO0yUKXYEvA9fgwA67/bYry+crqPBdWKd8yyBgqfhoj9g+90DA960XJl
 hvVDX7t4/RsRqdJWSN1QpBDUmwYqwZhcULFhIvM71g==
X-Google-Smtp-Source: AK7set+vM8Br44mLjU/3jC285H0ieON6z0ifxraVV+sSivte50olq4mhb2YeMAbVYPWeVTlyALk8y/Imx7B2D7FqmYs=
X-Received: by 2002:a17:902:a3c6:b0:19b:8cbb:30fe with SMTP id
 q6-20020a170902a3c600b0019b8cbb30femr1085402plb.13.1677870323363; Fri, 03 Mar
 2023 11:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-66-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:05:12 +0000
Message-ID: <CAFEAcA9hjD_WRv3Aoh9xy0MS+BB7Ps2s_+ksimzBQKryZy20hw@mail.gmail.com>
Subject: Re: [PATCH v2 65/76] target/sparc: Drop get_temp_tl
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 19:05:26 -0000

On Mon, 27 Feb 2023 at 05:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 53 ++++++++++++++--------------------------
>  1 file changed, 18 insertions(+), 35 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


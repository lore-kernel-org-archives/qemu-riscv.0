Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAl9-0000NP-1S
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 14:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAl2-0000Hl-Ie
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:07:57 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAkz-0008AX-Ou
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:07:56 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso3212104pjs.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 11:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YCPjftmuDx5185yydi5K+Y88ic/ONbxXSEdEnUUydhI=;
 b=sn4cDp/nlCDynuPI/b72eulruLBTUsZCQBlOigqTKUhH0ct+S2/m9YYzvi51gTr2JC
 KBA6PL5fS+I4Jnt7hTWKAzu3apJqREMzw60+h/4jnla3cGE+BBXtGmWsxXNTNUVwLKPJ
 ZO+EqVkExa4sO64gl02PcseKWj5BDp18P6SFteiSZPQoqKhnVqv79fBmrqrNlf3pagye
 gtzSVH0PXAXidHlk8w5Aw6E5ehC6PXFh1aQxX+wl1mSt5KhZtoIBtd8/88Ru90FsefkH
 eSbG7rnt6qr6FbtTz+ENsNA0IreslnSOi3lM4WLvbcz1+gIilKomKIIAVnoP7Usd10hL
 WXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YCPjftmuDx5185yydi5K+Y88ic/ONbxXSEdEnUUydhI=;
 b=7aXRNuKTLJTrtTKVzSbt8ls8HZMXnL+Ic2+2H4lOd7ZHbU3n6Aj+ePnTN4nKGApzKj
 m0b5zqspP9PCW8cl1Sy3+A9q1jgQH9HH+KS6cDAx6pRQeDsl1xY2JHYQbK4hk6u11UTl
 T/8Sw21JQHIVg2PTWyLxXO6hvGwy8BJdP2tpZ2Z2nn9sXvyb1MAZSs6LbTuqlJyR7kEL
 I8wPMvDE3vjpuKI86608CJkAiyAovc0G+876bo0WJUp9SLTlE53mzDrDr1fZ8tcrVU2W
 IFRqB/JLsDSq1puGokgx91QC/fh8nrrwn3MK9mod4P7KcwbiOQ+XNsFLTRNcm7hZQjY5
 xY1w==
X-Gm-Message-State: AO0yUKUn8ilO/4Twqpbemeyr8GSP5BUEWu7fEmljS0J3jOvOOiheuCDY
 jbNVH5Ez8VEppqR4zGnGr8a9z+z2U5Rwi+TEuNfOGA==
X-Google-Smtp-Source: AK7set8Bom2ldJgiaayy5WM5r6EXc5WKxR+smBnnalQLwzOstGHgkC75kOMfF3v7WNF34cVllN6k4zeCgk+V4uxbCIo=
X-Received: by 2002:a17:90b:46d2:b0:237:ae7c:1595 with SMTP id
 jx18-20020a17090b46d200b00237ae7c1595mr1016024pjb.2.1677870472234; Fri, 03
 Mar 2023 11:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-69-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-69-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:07:41 +0000
Message-ID: <CAFEAcA_-NHYrD72fvJiS5e_SwuZv=V68kcUb7HGxTCDCuOkpmQ@mail.gmail.com>
Subject: Re: [PATCH v2 68/76] target/sparc: Drop free_compare
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
X-List-Received-Date: Fri, 03 Mar 2023 19:08:01 -0000

On Mon, 27 Feb 2023 at 05:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
> Remove the g1 and g2 members of DisasCompare, as they were
> used to track which temps needed to be freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 32 --------------------------------
>  1 file changed, 32 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


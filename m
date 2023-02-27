Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWZkC-0000vh-Vq
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 04:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZjt-0000bV-63; Mon, 27 Feb 2023 04:24:09 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZjr-0005dt-Ni; Mon, 27 Feb 2023 04:24:08 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so9396104pjb.3; 
 Mon, 27 Feb 2023 01:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2JYB7wd0C7G+C0fx/3D6OFcV0BKjr5AqgTZnhw2T7U=;
 b=AruuY7MzKLZky6suHUxEaAqsti3BypbPJMYKaKjTPjguhRQxp2H0nc7laoCmgam8YR
 03iTTnYBgtR+GitEupZyoCHdUYDmLfH5ruqZ7sZYxaVyQ8A6hinAJjQBUP/grgnKAU7M
 mpXqTgpIb/n0mbHwLTwQ09CK0dnsD0m7UOVn5K+jl1uFGPb5ywrbYVB+hzMnR5sF2rB8
 hX9l36lrQIWXDPkt1Be6OLve8f5s0mweEb0QJS1UxmuK4cMahoRypEqe/sA6PmRdNXaY
 E82WT4L9V7p8Xhga2+fuhM3rDzaYhWSCG1pgCDwLcGuMBgN+r9ZHc5iAK//rylQC21dk
 4YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2JYB7wd0C7G+C0fx/3D6OFcV0BKjr5AqgTZnhw2T7U=;
 b=KUtw/h8+N6vseCmA0xC+/lu3PPr3IHQeGC5pZl//8Ct8ZU4XRmqA/HusDW/BInT9hV
 9S74ymPHRArvB/WFc3onnCn6P5Cdg5LITwLGThXtbL2bTO3slxqJy5OASABBe5xjgqrv
 coFduUidHOPIZkSoKNTWr/PVrZALpRmZcdIHYk+07DoxZt34dY/82xhyIU7rAONhA+2Q
 qyBbm9f6cwuyTGDeOJnzmUN3tFEuloGYArewQYOdTDCW85uhzYqZvEaB/fjtIrMRqnln
 gvR2pgb1Oo4ifEi2yEQAScNtwWq4eHI+wXBiaNQNVacgQomtjdpiPrVMuuLNHVXuQCTf
 u5ig==
X-Gm-Message-State: AO0yUKXjZ4e6ppdoc6a1R1i4825DhcUtHCTYPnjIGhEG13y8gowFTTJs
 t4IJ1EsqZRKQ6KzNvztReCr/yh1Wk2Sr6zu3DIU=
X-Google-Smtp-Source: AK7set9mplhUbiSGJ5fb6OwEZIMGX4yHITenFlUM69ZfWexhJZLHWdp+c5L6EoZH3mjUZ5P40VTI+xCfTOagAZcQ3MU=
X-Received: by 2002:a17:903:3307:b0:199:4a4f:9d2a with SMTP id
 jk7-20020a170903330700b001994a4f9d2amr5944050plb.13.1677489844990; Mon, 27
 Feb 2023 01:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-65-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-65-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:23:53 -0800
Message-ID: <CAMo8Bf+fuAoqXgrZsUJj4tZ6dF5Xo8kJDgPP5p0aNWBia01bBA@mail.gmail.com>
Subject: Re: [PATCH 64/70] target/xtensa: Avoid tcg_const_i32 in translate_l32r
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 09:24:27 -0000

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use addi on the addition side and tcg_constant_i32 on the other.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max


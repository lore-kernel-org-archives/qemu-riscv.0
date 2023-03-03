Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYA7H-0007jM-1h
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7F-0007if-Gh
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:26:49 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7D-0002un-HE
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:26:49 -0500
Received: by mail-pg1-x536.google.com with SMTP id 130so2039327pgg.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SzaEFIaH936rmwztYfs4EwnPvbhx0KiInX1KmJ6EAuo=;
 b=alZ9+Z+YdFIi7E8Qrk0CbujKj5CTqe2L3q4e1V/5yjUKgLYEma9EaQxGqMiRDuZMhv
 YeNjO4pGRQ64up0Q/b2Zv8BlOda8M2nxiRSbTEfh7CH89a7S+7B+nQLhv/fPdiaHLCb1
 L5RXi8iy4OXAkQp/3lporiY1Tzl49jIXAFDxrqWmIwU20WyEGowe9jiv0uIyeyyCT+4w
 4apkCfX01GQdRyeFHdzx5JAjRl9li9pCjLgkoVE0vtQGBtixyqdGK7u3S5DnXqjFpWiY
 89xsdOiWYl6wrA3duL1Cn2ZKfp4g7A/egbfhtUVldRJ7hYZ7kddtrLsLNvClRFeUhi5F
 ROog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SzaEFIaH936rmwztYfs4EwnPvbhx0KiInX1KmJ6EAuo=;
 b=6jqeGNZXYhpbQ7sjuqfVhxsDruhUur9Guw4cZA1ZaRc4ztDlsolCzehj2Xa8n/tZDp
 Igunp0bOE0w0oAGnBTHqLseS2Orhe2TQAY/QF5FdPaXa0VxcYHTWpoopmpOYz7nNW/dh
 V4Y01OWniMaZj4QGxr8DRCU/JwNVNLydnaqxl6gz8uGpNbe6EUPKTYDTKUB0bMdmYxO/
 ER5yfX8v3WefywQpjj7v5HoSCMYdrp10oKox+HHpbMkxQLat2uAykZ0WHIlB35jm3hdC
 HJwMZqk918rVNeLMOXbYZ+++AztvI8wwPYur9PqdNSzVhlceyhwOEtKEVPePjd3NHc6n
 7kQw==
X-Gm-Message-State: AO0yUKUTwvKPI/JrW+9bY7ZMrMlH9DEiZHYkup1NcR4Z5CgRe2GcFrYD
 H1R/U68kwdBSpY3liobUDd42fJLD81LqUY9h7B+ocw==
X-Google-Smtp-Source: AK7set/RXgKxcK6T1zyckdpwvxpWB7Kd8DhQWPQO70+mDIAM70IHIxlsYuFX7HYGf69Q/W2X+O8taO1yoPFJ1S3lokw=
X-Received: by 2002:a63:8c17:0:b0:503:7be0:ea51 with SMTP id
 m23-20020a638c17000000b005037be0ea51mr826674pgd.9.1677868005877; Fri, 03 Mar
 2023 10:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-16-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:26:34 +0000
Message-ID: <CAFEAcA9EFEErB-C4_E30pedkQRFgT0z3A-zvPqMV5jZuSkAbvA@mail.gmail.com>
Subject: Re: [PATCH v2 15/76] target/arm: Drop tcg_temp_free from
 translator-sve.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:26:49 -0000

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 186 +------------------------------------
>  1 file changed, 2 insertions(+), 184 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


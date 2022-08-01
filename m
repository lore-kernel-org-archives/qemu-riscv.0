Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oITdf-0003EF-Ss
	for mharc-qemu-riscv@gnu.org; Mon, 01 Aug 2022 07:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITdd-00037s-Qn
 for qemu-riscv@nongnu.org; Mon, 01 Aug 2022 07:31:09 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITda-0006B7-1V
 for qemu-riscv@nongnu.org; Mon, 01 Aug 2022 07:31:09 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id j63so18377046ybb.13
 for <qemu-riscv@nongnu.org>; Mon, 01 Aug 2022 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sfMvC1fmM99uQNOPXZ6oX6GZ/7gfkj3DTq9Wq3MObkU=;
 b=nF8h7HZP8TFNl0JFcQ/onEkOFOMx+y5ev32NeAzJ7/7rF4ezEdXbUhXYVP0V4eJ0TK
 bsHdn/+sW1YIlhr2jFoUk8tTtOAQeQNnXRVnvV2pKoJs/CzF5WWvwBQ9x5XFbBCWtWOh
 0zp4YM/Ne8jZVJEXd1f6ka8ug57RClqKbhv4O1lpxt8QAJDb1IIgExd3s6scHrM+t4aF
 u4V5sWgAj9L5H31HltmlE8vHIni7igK6s8adhZjo8yBI+nalfxayVC3Ttwgfvu9jfqHl
 4W2Q5KWma2Pqgp/Roe8NNGepcHqqGe9bA5ymZnHrY+vPcLaeQixmrNx/i4LtknQmtyqp
 EfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sfMvC1fmM99uQNOPXZ6oX6GZ/7gfkj3DTq9Wq3MObkU=;
 b=5y+TD5lF95tSBehuiLl5fNk1LB2RTzLLh6TFZh7tOKaoFY7bdLPLudwwRxkM4wBAJt
 +kPcGdt/usZkZu1nyC8eLKHKugqP1qKpTtdMGNdK9cjPSF8mlO2d54XKahslo62KHccg
 9TkACIpbzaWQqjH4D/rOrbTQxGHKHVj3jHxVYdZ9DqvpB3EEmO0oBmPPQm9fvuDmxrsh
 N3LdaMieKLS8ozdgbAGJ4TJ4EqVvqhhHfwDY2GFvxWXSB7t6RN28KnWJvCeUWfBRtyJG
 E0AGG2Gg6d4/njc25z0bM78lGCUedgcVKXoqdH/NzoYHkEPr8/D6NWrxF1jS6bqapZn/
 gQeg==
X-Gm-Message-State: ACgBeo1LXnYWYisjfBCAJA8XHAjU9lYgy6aeHH2PFwDwEsFAr9QxzkTP
 8wE+127KQlrO3FwnLXT/19wPch4upr7ZyZc8hovCEg==
X-Google-Smtp-Source: AA6agR5Tt2UEpAe7tNj/VUIKuenfBZH85WAMurnDF5WF5B6eWrM+pnZZ+C0xhiMZIYfmya4Y6JC81ip1v5TmYYNmWt8=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr10583789ybq.140.1659353465054; Mon, 01
 Aug 2022 04:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-5-qemu@ben.fluff.org>
In-Reply-To: <20220727223905.624285-5-qemu@ben.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 12:30:54 +0100
Message-ID: <CAFEAcA8JLLcPfMSfnKhsZdtXzWCkfLEFrzwL0BVh9+4ncZCTDQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/mips: use qemu_fdt_setprop_strings()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 01 Aug 2022 11:31:10 -0000

On Wed, 27 Jul 2022 at 23:40, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Change to using qemu_fdt_setprop_strings() helper in hw/mips.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


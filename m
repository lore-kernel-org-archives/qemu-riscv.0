Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz8fw-0007FQ-DU
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 23:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nz8fv-0007Dt-Ic
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 23:17:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nz8fs-0004vu-Kd
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 23:17:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id a15so22058870wrh.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Jun 2022 20:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PdFxZG9+PfTsMCWus8hNIRSWpSN6wJusipxVJX2hyDk=;
 b=o8cqmcY4a6JSgx96+qFjFPp/pbFczpWYsYML6SNz/MCpzR3Yt4Ih+1pmT9WZT9EcHg
 Lgt5JXccXhFRBppVTEcKLjoa0cSWvf34JkaA8tBHpcFp18mH92fQD+H1WvP1PYLaL7U0
 SLU4DMR6w43+CyttK6Y2ST48fret6OyvkcYbxtbKjaEa7IDZ4c1ahbbrBXZ5jYMXMteS
 5gtC9fM5zghBN4/WP+fBN7T68kPPPOSvfoHIHz1lc5BHCNPhqYiOcXen/R5zvBVaHbRa
 ykcPEzODM6mQO2zaBouqtr2Oay+GzU+FIPGMpVKgwKXt/Dgmwa79ZPIG2fLD1rq+haVk
 ogDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PdFxZG9+PfTsMCWus8hNIRSWpSN6wJusipxVJX2hyDk=;
 b=MEHCRHja5Xyq2bLXSmciwkfmIK/rygwhH/uaUHl4eerR7yGwKoYqdSrb4a8sSsYW3q
 J+yqXmxH6oZv2/t3ue2+nCdvGIkJNBA8W1/NZYVoCFrWvbILoJXQHHJ4Bgt0jEZ+ssW9
 B1U/tezUUh+hBKUMWv/O51okSTcv9iDFHv0MESR5xw/l1/kMQeQvsPlTFN0Z7QwgHFDP
 IvISGaDcvy4zcrTDEkQkHp9UukXqMn9bFgS2tANFAiCi2M6oUSTODSJVlfpi9qURuRUW
 6FAaCkYiEdxoKN/sKFom1ErQx+PxE5ZD6gZN9dG5eCXgzlmTeo/sP1oo2YHIAA+SI291
 peOg==
X-Gm-Message-State: AOAM5317OfuGBkz6ozbMLGBNnLxoIotRhQACRTQrA6RhIZEYNcrIwYyp
 Hr4fQnNkM/VcXMk9ztdTY+uA2X4NtM38FPFPXD3oww==
X-Google-Smtp-Source: ABdhPJzIyjgyvQsau0w5ZPnlNWWjYZuiNWB7jtkA1MjH2my9BVsmX2y/E39SHF5Ilkp6BbN0jNM+TWqq/ztBsT2JdZM=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr36504354wrz.690.1654744649614; Wed, 08
 Jun 2022 20:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220608161405.729964-1-apatel@ventanamicro.com>
 <20220608161405.729964-5-apatel@ventanamicro.com>
 <6455580a-7344-8531-cd2c-708f8ddfb04b@linaro.org>
In-Reply-To: <6455580a-7344-8531-cd2c-708f8ddfb04b@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Jun 2022 08:46:28 +0530
Message-ID: <CAAhSdy1JeAuz0YtMdKQjeJHpEG5_BL35v+OWiGsiPn4WgAsOaQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] target/riscv: Force disable extensions if priv
 spec version does not match
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::431;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 09 Jun 2022 03:17:35 -0000

On Wed, Jun 8, 2022 at 10:23 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/8/22 09:14, Anup Patel wrote:
> > +    struct isa_ext_data isa_edata_arr[] = {
>
> static const?

Using const is fine but we can't use "static const" because
the "struct isa_ext_data" has a pointer to ext_xyz which
is different for each CPU.

Regards,
Anup

>
>
> r~


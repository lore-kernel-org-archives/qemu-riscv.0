Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lPkNk-0002E2-2L
	for mharc-qemu-riscv@gnu.org; Fri, 26 Mar 2021 07:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPkNi-0002Cf-LK
 for qemu-riscv@nongnu.org; Fri, 26 Mar 2021 07:11:58 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPkNg-0004lt-25
 for qemu-riscv@nongnu.org; Fri, 26 Mar 2021 07:11:58 -0400
Received: by mail-ej1-x631.google.com with SMTP id jy13so7826658ejc.2
 for <qemu-riscv@nongnu.org>; Fri, 26 Mar 2021 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GOUk3GnseeQJhSnamSlavjU29reDc0ENB5hzvG5GaQg=;
 b=txH0cIKLzDSouvhIsuUK1IX24EOwoTRWy8r9uZISjRF8YGAWLsU8y644kM/WSmwuTZ
 dZlDzStsoGZJVc4oh2k57BhETfxlzQlAWtbdaDgEeBUnSTa865PDyT5T1WTaEdSVVLzI
 A+ot/hJsFO2mQQL/vPyc8a6A/dNOYRmpjKEUiLeLAZE7UiiM6viWeCHjI7X/wwEFtWmb
 stnRy9DWHwLCriKzoU3lytSYIUxTe2uY4nYzp7Q4eawgitjahqN7F6Kw7FXUSwryzPGa
 9zVGjbb9NAX9Fg6qs4J3HZEB4gS6hdnZNLp/ZdU9rbUCIy4/JaP7GanA7jj9aRcj36cF
 RwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOUk3GnseeQJhSnamSlavjU29reDc0ENB5hzvG5GaQg=;
 b=hPIDqJEsX7rwkyX0yaJmXlaFulydHRhkuX+FVvALIWmUeV+xDkY04iQgVU7f3VgSb5
 tF9ldVA/83In2jxYiT8EDRedho7LTpxBYbuYk7+LznJHmIZ22P4F9jBw1uwD0yx/eJTj
 NlhXBKLWtpJe8xtXskAji5p/mphNWS5Rz5p47/P+6TeapQP/j+SbdHMJWTJuVH+gB8GD
 5fGOpjYTnQl6QXBHAmJdK7oixLC3P9PGMRTE+2JGw98zsDspyJ1ZRVY7k4QdS/xWlHr2
 W8Fym9CkS9H/d6EsgxvMTsIKBDL1M8Of6RWVAhwXNMIFt8rvZyRMU94KCaXCJ870bTTF
 jpIQ==
X-Gm-Message-State: AOAM5306tmgG8Xuiv1GM3V+O/KImRZSuRunaKB5A3agVUTTaFTeTCc6z
 ooVq6dHiIjR2cx0udKkMOaKHRLdjUOOBmQJ/22vzfw==
X-Google-Smtp-Source: ABdhPJxEq8dZUXZWbAbrLVwTqj4G0REhDUUZgSIfWwPKyTXGS19gAJ6WffQ1MpewH6WO9wi70CNANjp0OR6USdEtW9k=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr14874868ejd.85.1616757114568; 
 Fri, 26 Mar 2021 04:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210325094150.28918-1-dylan@andestech.com>
 <CAKmqyKMGROe+k8=f=_Vw8eLwo-PF-ENQeoD+WSte_G8dRHmatg@mail.gmail.com>
 <20210326101833.GA21700@andestech.com>
In-Reply-To: <20210326101833.GA21700@andestech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 11:11:26 +0000
Message-ID: <CAFEAcA_FeHarfkO31=OS-gdBFKgQq4U7pPj1HBeuVLPkeMZj=g@mail.gmail.com>
Subject: Re: [PATCH V3] target/riscv: Align the data type of reset vector
 address
To: Dylan Jhong <dylan@andestech.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxhbiBRdWV5LUxpYW5nIEthbyjpq5jprYHoia8p?= <alankao@andestech.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "x5710999x@gmail.com" <x5710999x@gmail.com>, 
 =?UTF-8?B?UnVpbmxhbmQgQ2h1YW4tVHp1IFRzYSjolKHlgrPos4cp?=
 <ruinland@andestech.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Mar 2021 11:11:58 -0000

On Fri, 26 Mar 2021 at 10:21, Dylan Jhong <dylan@andestech.com> wrote:
> Currently, there is no structure like "qdev_prop_target_ulong".
> So, we still need to use an if-else condition to determine the attributes of the 5th parameter.
> Something like this:
>     #if defined(TARGET_RISCV32)
>         DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint32 target_ulong),
>     #elif defined(TARGET_RISCV64)
>         DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint64 target_ulong),
>     #endif
> I think this is not be what you meant.
>
> The other architectures seem to ignore this, they just choose one of the attributes(qdev_prop_uint32/64) as their parameter.
>
> So now we have 2 options:
> 1. Use "qdev_prop_uint64" as the 5th parameter
>     DEFINE_PROP_UNSIGNED("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC, qdev_prop_uint64 target_ulong),
>
> 2. Use if-else condition
>     [patch v3]
>
> Or if you have other opinions, please bring them up and discuss them together.

I would recommend that you just use DEFINE_PROP_UINT64 for this property
(and store the value in a uint64_t cfg.resetvec) regardless of whether the
guest CPU happens to be 32 or 64 bit. In the case where it's 32 bits you
can just ignore the top 32 bits (or if you're feeling enthusiastic, report
an error if they're non-zero). This is simpler to code, avoids ifdefs,
and tends to mean that most code doesn't need to care about the 32-vs-64
difference.

thanks
-- PMM


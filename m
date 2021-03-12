Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKf5n-00028t-Dw
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 05:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKf5l-00024X-Gy
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:32:25 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKf5j-00046b-H5
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 05:32:25 -0500
Received: by mail-ej1-x635.google.com with SMTP id mj10so52375917ejb.5
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 02:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xW/OLYeeQPD+vP4TJ82gujvOsb8Ulam83lpLmGem+1E=;
 b=OkcU6Biq9KP+qKqQXNfTMcf47LVfBYtq0gBS1r8EsoM5Qzdf/mLogJ5KkrCZAith4Q
 K7JNhhUzqkdNNHsmU0LexMortmi4nqplmyxDOzCp6ktjLTKyEB4uRao2A6Ev8/gYl63b
 e9683dv3LEneppvCuTPO7wdgBMExPorECy3oGjcz3DbOnIN4WwteORf2ZhZ/c9jjg7pw
 UwnU/iMMMxSia0SeI2rQZqm1Twk2xaDHPfoLcjhzljem++/YtJzoDi04Ty4vkIu6UvPg
 uDMiVz/TJJP2MMKOLysaMaXGEGw4o4pMo+3VrXTkfR0WrG7Mft5uVou/Tf+9uFGDwQIB
 hjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xW/OLYeeQPD+vP4TJ82gujvOsb8Ulam83lpLmGem+1E=;
 b=PCmAsH9bBWCh3q8NT+NHrqO5ko554njOk4/HQEaQvKijLSCjwoig0PonnSbCVjLsjZ
 mTrkfF1RG3tFv9xJLVqXjAjNJykWpEbFdc967DlQZKv2gWG0ceF7eN6iTuhq4dTK+HUU
 CCHJ9DSJrFfdEx/qNEJw0F7zcL/CEfblcYW1JOw5EtTLTSs7jJZY9CLeQz5hLIQHWxps
 XXds2jSTQMluQl//1CCmNu5ha4pe5J1lSN+bNkLe6FvVRO8kteigx4VFTldtLFMBfESQ
 QYl84v2KtHJ7pE2FxhhxLMlzpLaSUzh5kwfAgjkmDvxMGedYIk2CFoK395qHYcEtOsZx
 80Zg==
X-Gm-Message-State: AOAM531nVSd13Slq45YeN/6xXOEaGDW1AV23y/uW4ppSLxNBe1UdR6z3
 ftQ0wgZX4Cws3+ukUflbwhf2PJi9XTc9iuI43XFMKw==
X-Google-Smtp-Source: ABdhPJyJQlZwaqobrG5ig7GgkT2qsSjIKZ7zgSX7RqurfPYwA1FTsWJAdZX21rSBVOL7YVbMCgKYzqoqPouRTPophiQ=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr7885207ejd.85.1615545141929; 
 Fri, 12 Mar 2021 02:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-4-alex.bennee@linaro.org>
In-Reply-To: <20210312102029.17017-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 10:32:03 +0000
Message-ID: <CAFEAcA8JP9venwOkUT9cSLTkTFFmGxVN46nekk0mr4c8PUhxNw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] semihosting/arm-compat-semi: don't use SET_ARG to
 report SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard <keithp@keithp.com>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bug 1915925 <1915925@bugs.launchpad.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 12 Mar 2021 10:32:25 -0000

On Fri, 12 Mar 2021 at 10:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> As per the spec:
>
>   the PARAMETER REGISTER contains the address of a pointer to a
>   four-field data block.
>
> So we need to follow arg0 and place the results of SYS_HEAPINFO there.
>
> Fixes: 3c37cfe0b1 ("semihosting: Change internal common-semi interfaces t=
o use CPUState *")
> Bug: https://bugs.launchpad.net/bugs/1915925
> Cc: Bug 1915925 <1915925@bugs.launchpad.net>
> Cc: Keith Packard <keithp@keithp.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v3
>   - just revert the old behaviour

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


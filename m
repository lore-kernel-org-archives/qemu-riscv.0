Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKick-000649-5i
	for mharc-qemu-riscv@gnu.org; Fri, 12 Mar 2021 09:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKici-00062j-0z
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 09:18:40 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKicf-0000Sl-1G
 for qemu-riscv@nongnu.org; Fri, 12 Mar 2021 09:18:39 -0500
Received: by mail-ed1-x52d.google.com with SMTP id j3so8183460edp.11
 for <qemu-riscv@nongnu.org>; Fri, 12 Mar 2021 06:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rKJB4AlkfGyI7OxCAlY3Z8/EtdlEO2pG+pgv4m/JM0o=;
 b=eXqha6wvbupBe/niPMhAZIljBsIGKDxpCsf31IoGwlFHO8g3LcNSsDgCLktyywxfvF
 flG9xQ+5UwtT031SjS3tzi/ZhT6RWXNblsOwIJXcFye0TKT8C/VHIyJHOBmlkvorIjTg
 8+R1nqe9P3uvL5MisVwtma6qhl71/QL6LdpMq5jpb0dLQcE+Yh2qxfpDKjfjW+DBaTIr
 Y56jIAZNDelxMWy0B+clozy100qOVHT747A0kBzTZvrBp+syBjA0zh1Sjcju3PsBOwOv
 56sVCnRSkuXxQnlkgt37OolNrTu1kpGDsrYXw1NI4vLGV6syfZh+STUgk8H2zfUgVAgG
 bxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rKJB4AlkfGyI7OxCAlY3Z8/EtdlEO2pG+pgv4m/JM0o=;
 b=QTNFNlDP6m9pytvTN+bx6Ww5zNM3kWurUJ+XpyKWUDfiV+rA3bPVBVWApmGgCXFoJT
 2wnGKF4Y7MAFYRwRHpa9g6EifhqzDllsHZC/Hyc7a95tU0zUSNJ7O22dnM6QdxQPlIaz
 hVbT2vrHlsE8rBB6SH02vFZOoBuHJ29ayOtKUNUgZOf2o9vQ1DxbEJlU+asDBkzhqx1k
 T2VifNB/jdzNGJfhcl1WQO8t9Rw3uRLlM0vMT+uJV0bz5G236bAuss9BF4kJ5EL0FDQn
 ec3BjEx1Z+EjXkLPChdvo/W6xF31o4krd0XCLzYLssuI/WCaKBBkTCpAemMWgjaILPIy
 DWNw==
X-Gm-Message-State: AOAM530u1TjkIK99GD7Ein2esrnKLuiOZSrUncAhuU64N3IjbaxpzctO
 34Hz4v3+Kp5QJ0VeVRS9c56Eww==
X-Google-Smtp-Source: ABdhPJxq9a0StzpDKgNgFaKzUZVm1dMLrHrQnDbjxGEs3fxvYtZ8wlqjGtkPUrXBIT/FFCmdc5b3rw==
X-Received: by 2002:a05:6402:646:: with SMTP id
 u6mr14760263edx.250.1615558715275; 
 Fri, 12 Mar 2021 06:18:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lu5sm2837358ejb.97.2021.03.12.06.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 06:18:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53CB31FF7E;
 Fri, 12 Mar 2021 14:18:33 +0000 (GMT)
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-6-alex.bennee@linaro.org>
 <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
 <87a6r8ehsi.fsf@linaro.org>
 <CAFEAcA_0wKRcwpWODM23QaQi5qu86k=Y-2NHk4hWiz08oL98zQ@mail.gmail.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard
 <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting
 test
Date: Fri, 12 Mar 2021 14:08:38 +0000
In-reply-to: <CAFEAcA_0wKRcwpWODM23QaQi5qu86k=Y-2NHk4hWiz08oL98zQ@mail.gmail.com>
Message-ID: <877dmce9qe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Fri, 12 Mar 2021 14:18:40 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 12 Mar 2021 at 11:24, Alex Benn=3DC3=3DA9e <alex.bennee@linaro.or=
g> wro=3D
> te:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Fri, 12 Mar 2021 at 10:31, Alex Benn=3D3DC3=3D3DA9e <alex.bennee@li=
naro.=3D
> org> wro=3D3D
>> > te:
>> >>
>> >> Query the SYS_HEAPINFO semicall and do some basic verification of the
>> >> information via libc calls.
>> >
>> > Are we both testing system emulation and linux-user, or just one of th=
e=3D
>  two=3D3D
>> > ?
>>
>> Currently just linux-user. There is no inherent reason we couldn't add a
>> system emulation test but I felt that was already reasonably exercised
>> by your semihosting tests.
>
> Do we run those automatically anywhere ? I agree that probably the
> best thing is to get those into the CI loop somehow (and then put
> a SYS_HEAPINFO test there.)

Not currently. I have toyed with series that make integrate the building
of external test suites into the source tree. There are a number that it
would be useful to have a short "make" away including:

  kvm-unit-tests
  LTP
  diy7 (memory model testing)
  sbsa-ref tools

and I guess the semihosting testd would be another good example.

--=20
Alex Benn=C3=A9e


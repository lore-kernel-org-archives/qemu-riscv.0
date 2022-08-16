Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNsI1-0003x3-U7
	for mharc-qemu-riscv@gnu.org; Tue, 16 Aug 2022 04:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNsHz-0003vs-Vg
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 04:51:09 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNsHy-0007Ag-C2
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 04:51:07 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso5043536wmb.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Aug 2022 01:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=DmvxusCTC3J2nD2S/wyLAY2fo9yz8hBxorV9F1mSXMI=;
 b=HAXfa6MSFdCXiQ2yVhpsmw+lcYJR/MHFdFaOojM3R6j2ba1Q1ufjdy/CYsDrAGbEts
 grcQKY7yeXAhwCuMwD3lLswLRIfvDYgsRgvA154vdxOEJZQeWDFRxvPGqmBss6OS+C/y
 H6yO7TBCmt608b62QuibbOCbldh8nhJU8u20TUyRjufj1UKHleY0RUTibHRUc/GzKf/c
 gNJAvFuD4u+DOIoPDnuTchZOmqxylPtM9vPdoTU467Gh5oH/RsxJEbv1lyqLWE40qwtH
 FRVpdvpTNt87YDiNSKMmR5RD2apvv8iwsetQEro9t6vXRcfq6Ikr3qP5vJfZDPDDwrB0
 Zz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=DmvxusCTC3J2nD2S/wyLAY2fo9yz8hBxorV9F1mSXMI=;
 b=tZz7yXSWX/ArSpC2aUm1jrg2WFnDiAspva6qitTqzAIUpp0vwFpHbnvzcsPDE6oSqo
 XUoo1EE45N9QENFPXxs9M7j/23EmQYgWF7K4EEjJLbTxZd0vXAK1cvxM0wkGVs628592
 0Goqctaqhis2i3nxIUm8I7nW30jJpUI0eeWmJcJyw5V9jjnNRZXlPea8fmLYahgt19PR
 iuQRWIkNoWEc96z8Hmu3Z80HUD0h0Q14/AK/4T57fEdLZZtlG4Sv8eyjhEzSC/7GsQpn
 Zi8bZs4yWbGQWqNYB+bH0/OF9ouT3+afJ130VJdxYsGOcR5zhu3cxIo7yTU5K9bEEpEm
 Um2A==
X-Gm-Message-State: ACgBeo2izZoNZNMnvco6KQ5hdEtXBP0e1UpFDTscbEw2+KLMVwSsY3j4
 KO/+xW/oWSuF8igSqtx1mWGPwg==
X-Google-Smtp-Source: AA6agR6rdIM6U12Rmok5uOTP4Ibf4YpsACj1ftMdX11CWbBjf2pw+bNNDxQ1MThrlnAU2RBrkf0gww==
X-Received: by 2002:a05:600c:a43:b0:3a4:d07e:1151 with SMTP id
 c3-20020a05600c0a4300b003a4d07e1151mr19014646wmq.169.1660639864800; 
 Tue, 16 Aug 2022 01:51:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a5d4bc4000000b0021e6277bc50sm11717580wrt.36.2022.08.16.01.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 01:51:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A53A1FFB7;
 Tue, 16 Aug 2022 09:51:03 +0100 (BST)
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-2-peter.maydell@linaro.org>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>, Stefan Pejic
 <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
 <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Furquan Shaikh <furquan@rivosinc.com>
Subject: Re: [PATCH 1/7] semihosting: Allow optional use of semihosting from
 userspace
Date: Tue, 16 Aug 2022 09:50:57 +0100
In-reply-to: <20220815190303.2061559-2-peter.maydell@linaro.org>
Message-ID: <87v8qsbmh4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Tue, 16 Aug 2022 08:51:09 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently our semihosting implementations generally prohibit use of
> semihosting calls in system emulation from the guest userspace.  This
> is a very long standing behaviour justified originally "to provide
> some semblance of security" (since code with access to the
> semihosting ABI can do things like read and write arbitrary files on
> the host system).  However, it is sometimes useful to be able to run
> trusted guest code which performs semihosting calls from guest
> userspace, notably for test code.  Add a command line suboption to
> the existing semihosting-config option group so that you can
> explicitly opt in to semihosting from guest userspace with
>  -semihosting-config userspace=3Don
>
> (There is no equivalent option for the user-mode emulator, because
> there by definition all code runs in userspace and has access to
> semihosting already.)
>
> This commit adds the infrastructure for the command line option and
> adds a bool 'is_user' parameter to the function
> semihosting_userspace_enabled() that target code can use to check
> whether it should be permitting the semihosting call for userspace.
> It mechanically makes all the callsites pass 'false', so they
> continue checking "is semihosting enabled in general".  Subsequent
> commits will make each target that implements semihosting honour the
> userspace=3Don option by passing the correct value and removing
> whatever "don't do this for userspace" checking they were doing by
> hand.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


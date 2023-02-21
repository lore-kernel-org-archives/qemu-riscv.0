Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUVkJ-00070u-Sg
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 11:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVkI-00070P-Gn
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 11:44:02 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVkG-0007j1-Pt
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 11:44:02 -0500
Received: by mail-pf1-x429.google.com with SMTP id n20so2869052pfu.12
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 08:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676997839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jjdSKPp9FxkPWOd21Y9/AorZCY0zNQLE4fvgnvwAo20=;
 b=GqIW6HyaFX0Pbuut2kStDzPM7zb7/6MdDLitbI9igHXwMlExTCa7E/HxQG08CKMI19
 Ygxcm6vfCC5qyjDmyOhVQhCreqhjDGKIKBVV3cZYNZhcHC9ryfeMW0SOT4fkVJk4017B
 T4OTOX50cdv62VuEBgMpmMH0A2QfJ6KxzGNG92iV6V2easODMB16hJpzteumUOhqXWSR
 qsr2SZj2lGCC7f/QQdE+rQ7u4wogBLNM/M1xlMKLAIXJ8Y92pj+YjmIAUYmj9R+kFE+S
 WFfYCVkcCWQsjAuQmRUq2C+GQg1GdJFcB5PJirz1UvwsAeeCJmB51cWYFTwb0DHQ94Us
 oRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676997839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jjdSKPp9FxkPWOd21Y9/AorZCY0zNQLE4fvgnvwAo20=;
 b=iwncgVzn4eYPyuymqxP3Gf5nMIZEmupTwQ8kLrpN52Hf0GHTdoRFoJH6QrUjEU8U/2
 HibPPcfj9uO3E7K6tBNXbUVPS42EE2ETouwyXoUPOWtByK/vXMp/zabpZZ4jiEkxqe8f
 vJ7WSwKA0Sbmc0Vl8VgBV+XTlzeWWjhHWS8j9/gVH0F3AvDdbZ92g2C0k6BVOHI8KCrW
 1Gc74WPHXnOPJay1UafK7McSd05rZzRfifssi+ab7J4uVMTgrpD1t/5pLpySkYHbim+b
 h/XGPLLCeJkejRIvUKx2lAhDUEenx+tpOGykV/XLCiJ/5gLdiR31+TCWDixxYFK3nwup
 asZg==
X-Gm-Message-State: AO0yUKXX+duU37tMeoAhaoV7DwKT0QisxsXDcfXtTAsBllKCVaem6Vzs
 Whq1wnHNfrNQf54bcTx2gFH3aaD9Nu52IjH+clLfqg==
X-Google-Smtp-Source: AK7set+tzR40SWZ1x2c387tU0IZplq0ivnAhKZSQGhQE8C9oihZaRrRiHqQPCMuLC7OFQhlOcpGrQIM42G7zfsKSLgU=
X-Received: by 2002:a62:164f:0:b0:5a9:babe:6cb9 with SMTP id
 76-20020a62164f000000b005a9babe6cb9mr907879pfw.48.1676997839026; Tue, 21 Feb
 2023 08:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20230217175203.19510-1-palmer@rivosinc.com>
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:43:47 +0000
Message-ID: <CAFEAcA_DvrOgKAdVcF8OxpxUv9aPB5hOWjWryOt_SpFiNzY12A@mail.gmail.com>
Subject: Re: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 16:44:02 -0000

On Fri, 17 Feb 2023 at 17:53, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>
>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230217
>
> for you to fetch changes up to e8c0697d79ef05aa5aefb1121dfede59855556b4:
>
>   target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-16 08:10:40 -0800)
>
> ----------------------------------------------------------------
> Fourth RISC-V PR for QEMU 8.0
>
> * A triplet of cleanups to the kernel/initrd loader that avoids
>   duplication between the various boards.
> * OpenSBI has been updated to version 1.2.
> * Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
>   reviewers.  Thanks for the help!
> * A fix for PMP matching to avoid incorrectly appling the default
>   permissions on PMP permission violations.
> * A cleanup to avoid an unnecessary avoid env_archcpu() in
>   cpu_get_tb_cpu_state().
> * Fixes for the vector slide instructions to avoid truncating 64-bit
>   values (such as doubles) on 32-bit targets.

This seems to have caused CI to decide it needs to rerun the
'docker-opensbi' job, which doesn't work:
https://gitlab.com/qemu-project/qemu/-/jobs/3808319659

I don't understand what exactly is going on here -- Alex,
Bin, any ideas?

Why do we build the firmware in CI if we have checked in
binaries in pc-bios?

Should .gitlab-ci.d/opensbi/Dockerfile really still be
starting with Ubuntu 18.04 ? That is already older than our
set of supported platforms, and falls out of support from
Ubuntu in a couple of months.

(.gitlab-ci.d/edk2/Dockerfile is also using 18.04.)

thanks
-- PMM


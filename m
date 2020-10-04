Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kP89X-0005Nr-OR
	for mharc-qemu-riscv@gnu.org; Sun, 04 Oct 2020 13:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kP89W-0005Nk-Ow
 for qemu-riscv@nongnu.org; Sun, 04 Oct 2020 13:50:30 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:42443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kP89U-0006cE-Tm
 for qemu-riscv@nongnu.org; Sun, 04 Oct 2020 13:50:30 -0400
Received: by mail-lf1-x130.google.com with SMTP id b12so8172840lfp.9
 for <qemu-riscv@nongnu.org>; Sun, 04 Oct 2020 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=G4BPbaq5D2iIH/73ntUEhqvsKUgBGudcKQHqcZPzIws=;
 b=TRk7seLlnT6wb0czIyazdD52zyjgkWWh6ZTPCsA2jvAn2zzx5/menr7XIRsJfxCS1q
 80BYaDli/iLvJAYVrzzi7neOGzQUw2VyJCwRYRFEFjm6Bsvr1VrgYwILUBoY6loNh3hj
 Y/kjgA3t3j0M2D4u+pXSybX5XdTeDNVInScjaugCLrvuERXPVixQ8TVnark27KK747Ge
 L4Ma/9bvjVaz+SffgZheeKKw146KISBLLPj0M5EiaYG1AdU8ceAQ2oRjCs0k0E+jvJlM
 q2qvWPL3lwSL/3cxfKi55g/pMBEazIVkvLHf2O0OsQPS2bRrZM0jwxHGQXDSSQEWJRlN
 FMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=G4BPbaq5D2iIH/73ntUEhqvsKUgBGudcKQHqcZPzIws=;
 b=a6pagCy7DVZe2UuUNKkP5cLZcH4wolRDsF9UWG2H9csCNoa4+SYwIMsrplKvpdtEa2
 Ho4KNwopnnCcWpaopftbae6SYzWbOdxuCk1LsFUjB037MMkMAzq5u5dlF8/YVN2Zx9O0
 UbUfnX/en8fwPLk6IrdWHi9sZ0ukWNzcyT0Pif2WxRizy0Xl7UdaO2oKbicifwnuSkAc
 DHfdbDKSoCuNj0iIKF1TH/kclZc4NfmSdDL4AcKoxbgHDlMJCMM6YOnNgdEH1oMIHIrf
 OnwS1UcjCeXEWhXRu4lTL3b7Sv1tA72NLN4pneTiCVkINY22Iu1TXVmA6oqNuVm8FnJS
 GroA==
X-Gm-Message-State: AOAM5305pJYCN9QtD0Lz5zRDM31khGmVrzlgNgGYRbprYtSqgFL9awf3
 89L2ooiHaBp9UhbFVg2BqCl9zMCCOSbMIqlxyJDKODnnlf4xJw==
X-Google-Smtp-Source: ABdhPJzQDs1Xc6qSXeyi2J6U5anSDqoR0axUH0NAnIR5z50+CNnYNR3O61meV4kAUw/wiKWm0/MOAgLUMSC1r8Sw118=
X-Received: by 2002:a19:6419:: with SMTP id y25mr3942972lfb.333.1601833826264; 
 Sun, 04 Oct 2020 10:50:26 -0700 (PDT)
MIME-Version: 1.0
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Sun, 4 Oct 2020 20:50:15 +0300
Message-ID: <CAFukJ-Cra_MELxo6Xr=g2S90UvpNg=m6XLjNWQs1hF4iK3mmYA@mail.gmail.com>
Subject: Pointer Masking prototype for RISC-V QEMU
To: qemu-riscv@nongnu.org
Cc: Dave Smith <kupokupokupopo@gmail.com>, richard.henderson@linaro.org
Content-Type: multipart/alternative; boundary="00000000000034287205b0dc00da"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x130.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 04 Oct 2020 17:50:31 -0000

--00000000000034287205b0dc00da
Content-Type: text/plain; charset="UTF-8"

Hi folks,

I've implemented support for RISC-V Pointer Masking proposal developed by
J-ext workgroup. The initial prototype was for QEMU 4.1 and later I moved
it to the current vesrsion(5.1).
Could you please help me to clarify some things:
- I'd like to commit this functionality to the QEMU(mainline or separate
branch), do you think it's possible at this stage?
- Could you please describe the proper process of commiting such new
functionality to QEMU?
- What are the requirements for test coverage of this new functionality and
what test infra should be used to measure it?
- If this functionality is deemed to be acceptable for QEMU, how does the
review process looks like?
- Also it's possible to implement Memory Tagging extension similarly as
ARMv8.5 has: it would reuse a lot of part from Pointer Masking. I've done
initial prototype of such extension, does it make sence to try to push such
experimetal features to qemu? If yes, what are the prerequisites?

Thanks!

--00000000000034287205b0dc00da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi folks,<br><br>I&#39;ve implemented support for RISC-V P=
ointer Masking proposal developed by J-ext workgroup. The initial prototype=
 was for QEMU 4.1 and later I moved it to the current vesrsion(5.1).<br>Cou=
ld you please help me to clarify some things:<br>- I&#39;d like to commit t=
his functionality to the QEMU(mainline or separate branch), do you think it=
&#39;s possible at this stage?<br>- Could you please describe the proper pr=
ocess of commiting such new functionality to QEMU?<br>- What are the requir=
ements for test coverage of this new functionality and what test infra shou=
ld be used to measure it?<br>- If this functionality is deemed to be accept=
able for QEMU, how does the review process looks like?<br>- Also it&#39;s p=
ossible to implement Memory Tagging extension similarly as ARMv8.5 has: it =
would reuse a lot of part from Pointer Masking. I&#39;ve done initial proto=
type of such extension, does it make sence to try to push such experimetal =
features to qemu? If yes, what are the prerequisites?<br><br>Thanks!<br></d=
iv>

--00000000000034287205b0dc00da--


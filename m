Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZYNb-0000Cd-4Q
	for mharc-qemu-riscv@gnu.org; Tue, 07 Mar 2023 09:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZYNY-0000A0-VY
 for qemu-riscv@nongnu.org; Tue, 07 Mar 2023 09:33:24 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZYNX-0007oM-0h
 for qemu-riscv@nongnu.org; Tue, 07 Mar 2023 09:33:24 -0500
Received: by mail-pg1-x52c.google.com with SMTP id d10so7675895pgt.12
 for <qemu-riscv@nongnu.org>; Tue, 07 Mar 2023 06:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678199601;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w9wxrfQuiOQGYwkZ1LO/qi8Lyo3pJL8fsSmvzQ1AN5M=;
 b=dMJU7lLZF68m+jqptwWb8v/spbf7EIzBJWcyuL739l3CSt2rAXTOgxmihKz9xT+uIR
 vv8Erz5qzR5IBgKoxXwnvgDvw6N4OS63I0LuuFN0Fpnxn0crRegUysicc7AcESgCB8eJ
 n8925baDLHEqgp/UzmiJ486V7P860mIP6IZwwdlXstYKOjibMEXYC37HwhZ+DbO5QIHp
 er3aoEjGNNLhOiP+3NSCOTppsFX6N3C7KA7R8MISKL0oNFN4DZrPc2GC4qbLVvkWKA7k
 N4Li8gu4upqyypLqrSJWBmMQFwNf0kDXshOOqKZ4akSMpHsj4X68KQW5CBQ6ILdOhOXj
 TfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678199601;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w9wxrfQuiOQGYwkZ1LO/qi8Lyo3pJL8fsSmvzQ1AN5M=;
 b=uu3/A3QDIxP8i6eRF9dMj319IlUg2eL/5v16rOwoThFAVUA85oK/lJXXjjoHfDz+fI
 ewlrVDAQd349QwM53ebL92XmCpU8zigx8qltQdjxjXam3nqCIkUqteigrSxEZxf1Mhyj
 RGFFMzsECJ2JBVEwaCSb9gwjogMNk0qFT0pfECXanYpwUpKedrnbWwTAe9eyK+fia9dt
 r0pGsAbIKUlWitYZYl12A39zrZLTgNToXc8ShdyZpnDTFPvhk167/K2CWA9/l22hRsjN
 NiG5Zfi1sR8z8uL/dc9yi+vUHPpOv4x2CX3fwUwERzNgtRu81nszkYq5Z7cmbYKiE9hk
 /AYw==
X-Gm-Message-State: AO0yUKVAz+LdkwGJ2vdUx3zgyauJgzjCEHqoFRMuRmEz9JhNn0Xh2pjt
 cBDeT7Ee9at1jj8hE9DVJPhUK+qy7vjQrB5MrVMsTw==
X-Google-Smtp-Source: AK7set9HwUiGL/++1QpjqJA9rF66ui8/GJtXuvlS8DZibUg0wjuwmk9rnSRaTiBGu+HsNDlbDzLA5kGcWhYhkEGZ9ME=
X-Received: by 2002:a63:a80c:0:b0:4fc:2369:811 with SMTP id
 o12-20020a63a80c000000b004fc23690811mr4807205pgf.6.1678199601290; Tue, 07 Mar
 2023 06:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20230306220259.7748-1-palmer@rivosinc.com>
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 14:33:09 +0000
Message-ID: <CAFEAcA_0GdN1_1Q+0URiQOa11PAS31rxvRiEoVBnsy7mdvWrfw@mail.gmail.com>
Subject: Re: [PULL 00/22] Sixth RISC-V PR for 8.0
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 07 Mar 2023 14:33:25 -0000

On Mon, 6 Mar 2023 at 22:04, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:
>
>   configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230306
>
> for you to fetch changes up to 47fc340010335bc2549bc1f07e5fd85d86a2b9f9:
>
>   MAINTAINERS: Add entry for RISC-V ACPI (2023-03-06 11:35:08 -0800)
>
> ----------------------------------------------------------------
> Sixth RISC-V PR for 8.0
>
> * Support for the Zicbiom, ZCicboz, and Zicbop extensions.
> * OpenSBI has been updated to version 1.2, see
>   <https://github.com/riscv-software-src/opensbi/releases/tag/v1.2> for
>   the release notes.
> * Support for setting the virtual address width (ie, sv39/sv48/sv57) on
>   the command line.
> * Support for ACPI on RISC-V.
>
> ----------------------------------------------------------------
> Sorry for the flurry of late pull requests, but we had a few stragglers
> (ACPI due to reviews and OpenSBI due to the CI failures, the others I'd
> largely just missed).  I don't intend on sending anything else for the
> soft freeze, this is already well past late enough for me ;)
>
> I'm not exactly sure what happened, but this tag managed to pass CI
> <https://gitlab.com/palmer-dabbelt/qemu/-/pipelines/797833683> despite
> me not really doing anything to fix the timeouts -- hopefully that was
> just a result of me having gotten unlucky or missing a larger timeout in
> my fork, but sorry if I've managed to screw something up.
>
> I have no merge conflicts and the tests are passing locally.  I've got a
> CI run here
> <https://gitlab.com/palmer-dabbelt/qemu/-/pipelines/797922220>, but I
> figured I'd just send this now given that I had one pass from just the
> tag.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM


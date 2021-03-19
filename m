Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNFD4-0005oY-9q
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 09:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNFCy-0005kj-4Z; Fri, 19 Mar 2021 09:30:33 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:42733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNFCm-00064y-Eo; Fri, 19 Mar 2021 09:30:28 -0400
Received: by mail-io1-xd32.google.com with SMTP id r193so6071040ior.9;
 Fri, 19 Mar 2021 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qwLHykpUmFB7IB3b/dL1gSIP/z7Qua33eYoQ3w5FwA0=;
 b=pQuJDgfkePlVdCt9UYJT0jCV+Es0NteRbbI1ICp1hkAigjHGa6X6WhHpDkEmwn69ao
 hTk/6Sp8jHsqn7hu6UeTj3VG5SIID37RUKI6P0fXqE3jXk0BQ3JVwWa7Fppv4Gw8NEJS
 P81BkUowSEJRufY4j750APxCzQ6KJ0oMbFFOrkps5qhPUWVs5ruUpipZ1st/SY5i0wpI
 dACFpUKA/grFgsLsLqO1YIt5I8jImugwZb+E/h/y1gi7svJzHI3CHBWmepQnAPRlE/Vx
 2zPBC4/3VBsWq2K4amRYnfS6sqNZoasCnB/e7ipAwoqOymycleEE9Sc8wK0QuIUW8Rbe
 Y+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwLHykpUmFB7IB3b/dL1gSIP/z7Qua33eYoQ3w5FwA0=;
 b=fFnU05DNFBo88UmjOnsV0inBRejz1D1XUqr5EyUBgbxgcEM6xav42su1A7y3dEPUFM
 mOWQ/MeR7NX0FncNKkk4OvZ2jeya7HKg9WPvEIjKx/lV/7kjEBqiqPSPzvTlTQNchLKn
 yx+nX6Q9AzHAlvIEUvu6tdgav5Pi2pJyUQYIcFLDPDrC6YhuTOMyMa/TYLmWpTQgWdfd
 /Jj8O63FsiP4XJhQLDUwHWZsJd9frXrG3k11yH1+dhYtpoZOqRgytuY7bmfiFMEjOEVp
 8jbqh3WAp0pvGFA8hyfdYok0ncNGjIeRi0VrNIXy/TwbkUgfnQxow3xCEaX+STvmgW9g
 5Z3A==
X-Gm-Message-State: AOAM531i+eP+AFH73lyva+eI2xWeitWUafShZB9NyCnR4Rz/QDLVJToi
 j1NNz3uuRcbxJ6QSS+Ku3968UHKJDlGhyoDuK2wqkY8cUAc=
X-Google-Smtp-Source: ABdhPJzj7hZLGxkTM15gVLWnWtClK3ORblwvPghSgbhxY34k+KcZLO0Ia5eT+i/tKugPdYEqpPUoQtQcMU4fXnYQkrg=
X-Received: by 2002:a05:6638:224e:: with SMTP id
 m14mr1417274jas.8.1616160617502; 
 Fri, 19 Mar 2021 06:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210309072925.4314-1-frank.chang@sifive.com>
In-Reply-To: <20210309072925.4314-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Mar 2021 09:28:29 -0400
Message-ID: <CAKmqyKN0BDEXeJ-C-P4mRR6e+kKTYtxQoDomiu9ZCH3b_=HJnw@mail.gmail.com>
Subject: Re: [RFC 0/1] target/riscv: add RNMI support
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 19 Mar 2021 13:30:33 -0000

On Tue, Mar 9, 2021 at 2:31 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> This patchset add suport of Resumable NMI (RNMI) in RISC-V.
>
> There are four new CSRs and one new instruction added to allow NMI to be
> resumable in RISC-V, which are:
>
> =============================================================
>   * mnscratch (0x350)
>   * mnepc     (0x351)
>   * mncause   (0x352)
>   * mnstatus  (0x353)
> =============================================================
>   * mnret: To return from RNMI interrupt/exception handler.
> =============================================================
>
> RNMI also has higher priority than any other interrupts or exceptions
> and cannot be disable by software.
>
> RNMI may be used to route to other devices such as Bus Error Unit or
> Watchdog Timer in the future.
>
> The interrupt/exception trap handler addresses of RNMI are
> implementation defined.
>
> The technical proposal of RNMI can be found:
> https://lists.riscv.org/g/tech-privileged/message/421
>
> The port is available here:
> https://github.com/sifive/qemu/tree/nmi-upstream-v1
>
> To enable RNMI feature, add cpu argument: 'rnmi=true' and specify
> RNMI interrupt/exception handler addresses with 'rnmi_irqvec' and
> 'rnmi_excpvec' arguments, e.g.
>     -cpu rv64,rnmi=true,rnmi_irqvec=0x2000,rnmi_excpvec=0x3000

Can you include details about the software you are using and how I can
test this?

Alistair

>
> Frank Chang (1):
>   target/riscv: add support of RNMI
>
>  target/riscv/cpu.c                            | 40 +++++++++++++
>  target/riscv/cpu.h                            | 16 ++++-
>  target/riscv/cpu_bits.h                       | 19 ++++++
>  target/riscv/cpu_helper.c                     | 47 +++++++++++++--
>  target/riscv/csr.c                            | 59 +++++++++++++++++++
>  target/riscv/helper.h                         |  1 +
>  target/riscv/insn32.decode                    |  3 +
>  .../riscv/insn_trans/trans_privileged.c.inc   | 13 ++++
>  target/riscv/op_helper.c                      | 31 ++++++++++
>  9 files changed, 224 insertions(+), 5 deletions(-)
>
> --
> 2.17.1
>
>


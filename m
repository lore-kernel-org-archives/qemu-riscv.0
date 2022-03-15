Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU30T-0002u2-Ng
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 04:58:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU30P-0002ei-KQ; Tue, 15 Mar 2022 04:58:13 -0400
Received: from [2607:f8b0:4864:20::32a] (port=44607
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU30M-0007M2-Mp; Tue, 15 Mar 2022 04:58:13 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so13547917otq.11; 
 Tue, 15 Mar 2022 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxOEQfZVJLNaRctYkAAyLvlRiQbfX0SvKSZNFz8JPPM=;
 b=cMfWedGW4Vp/Np9j35MaWcGP0mOX6liRvaPfJBQa19qszqaxf1lwG9xWyQfbSTI/g3
 kItll2acz4Yi2XACSSxlBKBOFfjKZvbEhtKLGUTqBJS1q6Ni4dlwMBegcuIV/Uel1SAq
 mI+lKvm0rlrg3rKK+6cAa9I2nQzISfL7faEx6yUBRD1fY9rvSv68xA0YNUefex4U1U2y
 hsCVwaOV8qcwElL8CHPuj3AhqZyK/AzZGACUokHRKHRMqICJPfZZWJouLPNs//BsqAXD
 BPY45t11pOkRK+i7PBaaH73OAHeOcxulHP7ueCCRGqppbn2DAbqczYBzy2SoIzAs7ypD
 KZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxOEQfZVJLNaRctYkAAyLvlRiQbfX0SvKSZNFz8JPPM=;
 b=KfLSZ9Gpsj8eILc+54W7Hi1Tua4gSFdGlQY9Sd0DjP3cygB4OUUCS4COn0QZs21Hfd
 h67MTmW/Tb4k2PWzAQ7MhfdZwzbmOLHVNSYFQJ5nYzIjBtFOlUS2xC+bFcxzJBe5deac
 2GhvzMRhbPJ0U+QiK9vRx9DXdv5alZszdSl+zYVU74PT59QlKG+IP9e7NaHetLsrlI01
 WfDB0mv7/CW2idzvyHszXfUUEmN85+bhdD4hG4U7aujgaEfBtmNQjdSHVP7UNCJpoPDt
 4PyrDBmMoQTrSqwfFJWMefqgD4Iw6+bcbZmvSbOmnnEJJ6WeK/WFs3ZmEKXP8r5THxeL
 198g==
X-Gm-Message-State: AOAM5322sxOeYyb70c/rpO8KLXmVvWyhWaqRzb4K2oUHHA9dlsyrPddb
 QM/2IS7WeBO0iWtfibmHD65oM+3GHiY0kzEJjAJ0mwN6vXOKbw==
X-Google-Smtp-Source: ABdhPJzYh+2yzRXCEuCyBlmJQxKgjtKK0zwVLoW+xEzKt0GTYkfecOYEvtd7QncdoK9Nwp/8J7NgEknQK6g4SnwGejk=
X-Received: by 2002:a0d:d987:0:b0:2ca:287c:6bf4 with SMTP id
 b129-20020a0dd987000000b002ca287c6bf4mr22533448ywe.153.1647334310687; Tue, 15
 Mar 2022 01:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
 <20220315064007.3600746-3-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220315064007.3600746-3-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Mar 2022 16:51:39 +0800
Message-ID: <CAEUhbmVxMDQgoEpLbRswK_x+edvN3YWXeiX121uYDmddtMyUog@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Allow software access to MIP SEIP
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 08:58:14 -0000

On Tue, Mar 15, 2022 at 2:40 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The RISC-V specification states that:
>   "Supervisor-level external interrupts are made pending based on the
>   logical-OR of the software-writable SEIP bit and the signal from the
>   external interrupt controller."
>
> We currently only allow either the interrupt controller or software to
> set the bit, which is incorrect.
>
> This patch removes the miclaim mask when writing MIP to allow M-mode
> software to inject interrupts, even with an interrupt controller.
>
> We then also need to keep track of which source is setting MIP_SEIP. The
> final value is a OR of both, so we add two bools and use that to keep
> track of the current state. This way either source can change without
> loosing the correct value.

losing?

>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/904
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h |  8 ++++++++
>  target/riscv/cpu.c | 10 +++++++++-
>  target/riscv/csr.c |  8 ++++++--
>  3 files changed, 23 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


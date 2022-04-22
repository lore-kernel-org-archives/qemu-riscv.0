Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhhTs-0001RW-1p
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 20:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhhTn-0001O4-H5; Thu, 21 Apr 2022 20:49:01 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:45999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhhTl-0006qA-Q8; Thu, 21 Apr 2022 20:48:59 -0400
Received: by mail-il1-x132.google.com with SMTP id t4so4116961ilo.12;
 Thu, 21 Apr 2022 17:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x+fsgNTB6olaKvV+oDMdXm5Srrlc9yW4VyHmWRUP7gA=;
 b=nhOvWnCyyuA6DJiGr6u+7GRhtpZ4Xfxl7vLoVu6tzVy/uYghMV0UIXYDAhcarVF93e
 6W/DGK5unnJWHEyU7g74w79M6CYxpukD50PBS5i/bIobzMp6CqTqVnpz9wSv0mNjsAkF
 Zgr0D/en/A12hQUx+B4D76tggVmv8lmUgBGtrVlN5q0dVmSMcRSiK51RFDUP401YQH/U
 RcypH6VfVngY+ZPhEN+fQlmnMimXOcV4JNx5CBHKHLZOHLckPlggYXP1TNDX4hO1C1+N
 jJ/kmdYSI2CHoP/5dSI0LMP1fcuUPbbuGAiwZWCijapHXnc1ZNfrRV2Tex3DY4jB5cbZ
 d1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x+fsgNTB6olaKvV+oDMdXm5Srrlc9yW4VyHmWRUP7gA=;
 b=5f+Fjbcj2COxnpatypW+JeGgmmSrO+qe75BDnQaauBzI16XpaOgDid+GP6vvDBwRQ5
 jBfqnXqL566PVvuIoNBSCtmb4GVdK0yuO383VQjfbhuMblS+4ZlyjWgt1R5QJKFbcuXl
 ig+gHodob8wHkJUtxhQXNo4n55vT3s9iqeQwLl6w84XeFJXWhsFshVRBeAqGtMg7IKlS
 7EtvS4YP9RJxoFlUyMgHYeGmtizfO4UxgCPSzjFPMhBgcJO7g80vO08qXdQuTB9SH2zi
 eiyVGF3Nv8PszSqvIaL0Kj3lZ9Gp3Ng5JrEO3E6p4X2UaY8XkiQepRF1OzC8F0RBEZe8
 lVRA==
X-Gm-Message-State: AOAM5331Ueds9Wxi5djigPRKnqMtWqxDw2Lqlw0SoEAspGcMuBHDVAtq
 RK+BT7SPQ27Lbz6oq2aVyYdmg2WiJA4nqIJRca0=
X-Google-Smtp-Source: ABdhPJwqhuL9KhrT7XyOTGjO5y9lSuS66FsnH+M/DoEUbgnvrU3oABxF8V8axR+1lhIR9LaxI4rpWs9XgrLMK7vLO+s=
X-Received: by 2002:a92:db0e:0:b0:2cc:2590:767b with SMTP id
 b14-20020a92db0e000000b002cc2590767bmr975039iln.260.1650588536310; Thu, 21
 Apr 2022 17:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220420095718.26392-1-frank.chang@sifive.com>
 <CAEUhbmXfoWOpjt6YyVztxv49P9-xQjmHgD6OZ8TgJ-yUTbZd8Q@mail.gmail.com>
In-Reply-To: <CAEUhbmXfoWOpjt6YyVztxv49P9-xQjmHgD6OZ8TgJ-yUTbZd8Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Apr 2022 10:48:30 +1000
Message-ID: <CAKmqyKPVs4zG9vn_6haH2DcM2XW1M9tSP4c81inEd_pZtF0c2Q@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Support configuarable marchid,
 mvendorid, mipid CSR values
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jim Shu <jim.shu@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 22 Apr 2022 00:49:01 -0000

On Thu, Apr 21, 2022 at 12:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Apr 20, 2022 at 5:57 PM <frank.chang@sifive.com> wrote:
> >
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > Allow user to set core's marchid, mvendorid, mipid CSRs through
> > -cpu command line option.
> >
> > The default values of marchid and mipid are built with QEMU's version
> > numbers.
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu.c |  9 +++++++++
> >  target/riscv/cpu.h |  4 ++++
> >  target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
> >  3 files changed, 47 insertions(+), 4 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next ?

I have sent a PR and hopefully it should be merged into master soon

Alistair

>


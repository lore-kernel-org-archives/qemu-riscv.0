Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBpZW-0001xP-GG
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 22:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBpZV-0001xC-KS; Thu, 05 Aug 2021 22:26:53 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:35466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBpZU-0007YP-Db; Thu, 05 Aug 2021 22:26:53 -0400
Received: by mail-yb1-xb32.google.com with SMTP id z5so10756657ybj.2;
 Thu, 05 Aug 2021 19:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9+5CsOu8zRMsG48qAVr21sMXOOq6L74tQddFEXBDUuE=;
 b=uo5D/Xfmwb9MKsrA+//kj+dtwaC7cJfSI2NwMXCakpiJhHq3FvyU5SLfAga0+zhquo
 iZufrm4ERUISFexZ+P6qX2oxxbFP+MSoOFFT1srMglIlUtXhwGnyH9NW+NM0hKDUbSzF
 9BBBzjzeizUmD8hWAIcvYIS+B7AA9t2sEXiuiIVcqrA419VoDIFvg7j0jWEPqk9xYpus
 VyHMhalZe3sii+FIjXAmog9OLk+k8d0q7ZVDm7FweeYeTV879FymPNgq/H82tTk/D4HJ
 Pu0wDpg8vgSbJ7BnYUmgheZQ3waiUsdAO3YmUbnpLGDmFWdPDDoHbuabWqo1BxBRrmFm
 J2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+5CsOu8zRMsG48qAVr21sMXOOq6L74tQddFEXBDUuE=;
 b=dfF14IRdw5DAmwuU4ZwllBomGRWwwWptLvLGyDnm4bzKtu/8mUB9XdXnzrWeBQzR53
 wl5OwQC8SFwjrmegiOj7KjWdkrra6zuksZ2Ts8orgL008LXiEQOJGDXyPZOo9/i99kZV
 ctEXdrFgYGWtDhDxu8OPtAK7G7SUwHOgjDDQf0OWR2km89qRKoVyxNRFNI4KfVCrBN3V
 jL3qWQ8MZA5uMjCQFHuMe1Iw29s4Gd3grKzW6ZeSxEMZWg1Gla3evlD2uAKeDRkt/k17
 VzifcDtxyv9jv4Pn2Zb7TLwg5GUptmJ7/HLEPj/vjMP88maXwlGt8mm4bwk3YgTQdMj4
 wOhQ==
X-Gm-Message-State: AOAM531cqXBvjk/8ClT+pXpbI8LzpyJPwMlGMtZGdOMhQP6Cts7pBUEb
 vVB67GbXWxE6WQuuTEsxcT+0FYtQkMgUgtazT+c=
X-Google-Smtp-Source: ABdhPJzTvQ5L5/6wnKdCtwwvxHnVJBP1olVAtjw9GWcYUobg8LDDEu577n7s1xsDH5r8TwPy5a0Y0+4c6pCcD2qJIyw=
X-Received: by 2002:a5b:391:: with SMTP id k17mr2293018ybp.152.1628216811191; 
 Thu, 05 Aug 2021 19:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210724122407.2486558-1-anup.patel@wdc.com>
 <20210724122407.2486558-4-anup.patel@wdc.com>
In-Reply-To: <20210724122407.2486558-4-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 10:26:39 +0800
Message-ID: <CAEUhbmWZxOnOoJ0E33PjQwm_VV6wnZPaB=Z9scGk5ghbA=oZyg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/riscv: virt: Re-factor FDT generation
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 06 Aug 2021 02:26:53 -0000

On Sat, Jul 24, 2021 at 8:24 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We re-factor and break the FDT generation into smaller functions
> so that it is easier to modify FDT generation for different
> configurations of virt machine.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  hw/riscv/virt.c | 521 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 324 insertions(+), 197 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


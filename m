Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLc19-0005h4-Iq
	for mharc-qemu-riscv@gnu.org; Wed, 01 Sep 2021 21:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLc16-0005fl-PR; Wed, 01 Sep 2021 21:59:48 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLc14-0003CB-Uk; Wed, 01 Sep 2021 21:59:48 -0400
Received: by mail-yb1-xb36.google.com with SMTP id z5so765771ybj.2;
 Wed, 01 Sep 2021 18:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+S6tQWW4zLInEU7qRs5MmcxuWh78BTuotdODNnedTVk=;
 b=qPdmTfCTufO5T1dVzxf5XPNYzQbiZIBgk/6RW3yF1B8pdXy/3E+P6UhdXM8IJwlzHS
 vG/0Q0SOCOgLWa6EPKtBY5XfcdtcANyIopjc8FWNJEp99mx6/kMGcs9gFMRR0ouRj3AJ
 M7PPHsT4iGXU0tLTZS3cDP3jthebKHqrf4d99oDcJkQ6J301nd/KvbflQKGbDrG8iwOA
 Jq74Ub+8MyAikMuC+8GLFbq/glcnyeQyN7HcTy43oFVenokIuOQRXM6RTEGFUbwaKmpo
 gv0XqEjHKV2eS7fdWGlibJoxNfcArGetyHLhEtXYnqvvGip9SYn5LdbSINTCdQo692st
 htLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+S6tQWW4zLInEU7qRs5MmcxuWh78BTuotdODNnedTVk=;
 b=tNjIK85ZJSEQ3OReNnCjAc3lbMcZ0cJbtTEtJ4I6dQrjfaf3b7AMvT+swE00dtRYZ+
 FGSwvcE9+Zt4QaESea76VHIMxXFzqBW5hjSIuX9MCQE/3UlfMA0uH39F9CeboKJcJZAs
 gLHVtVpuocsAlfIheDHWc1Ks0CjL+9rBRCF6CZwcyfY/lrA8P4nA+DOiiY92StDWaIWa
 yuu6RIVc/kwytW0uN4Y3taFpDWC2+rPtUswghS17h/YaX6mzSWYcMgxuWUmZ5U67UixK
 NEB05lknk9PX+YXh4NjaaSMJv5OzDfZsInqIAp/j5sMdTP4L3zAvYNS8gSJPjuyKAu1z
 +KaA==
X-Gm-Message-State: AOAM532jybxJDdHWEbjYVA8T+oDTpUFLWOolvZ/UgROhEHKPbR6hAKRZ
 /R2OSJkJXhkzUaGRIM0u97G+H2+ONCy2mq4UxcM=
X-Google-Smtp-Source: ABdhPJy4GRqdAfXUcaICswfgzcf5gQo+972QW84Oe5aewGeKphSZqk/n4VFQbL6+xn8RLYqR6rGrewWJgEy/iCYg9ig=
X-Received: by 2002:a25:1d06:: with SMTP id d6mr1259708ybd.122.1630547985791; 
 Wed, 01 Sep 2021 18:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
 <CAEUhbmUvb4_tmevGEcK_YgyA9_g5LumRVpMc7+rwuD4D7FSBBA@mail.gmail.com>
 <a61c6fef-4bce-0c5b-7aff-b9e2fa75aa5b@c-sky.com>
In-Reply-To: <a61c6fef-4bce-0c5b-7aff-b9e2fa75aa5b@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 2 Sep 2021 09:59:35 +0800
Message-ID: <CAEUhbmXULr_mcdfh6x=BGLNcNM5Q7YrFhnHOuLatbrokqP0Taw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix satp write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 01:59:49 -0000

On Thu, Sep 2, 2021 at 9:02 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 2021/9/1 =E4=B8=8B=E5=8D=889:05, Bin Meng wrote:
> > On Wed, Sep 1, 2021 at 8:51 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >> These variables should be target_ulong. If truncated to int,
> >> the bool conditions they indicate will be wrong.
> >>
> >> As satp is very important for Linux, this bug almost fails every boot.
> > Could you please describe which Linux configuration is broken?
>
> I use the image from:
>
> https://gitlab.com/c-sky/buildroot/-/jobs/1251564514/artifacts/browse/out=
put/images/
>
> >   I have
> > a 64-bit 5.10 kernel and it boots fine.
>
> The login is mostly OK for me. But the busybox can't run properly.

Which kernel version is this? Could you please investigate and
indicate in the commit message?

I just tested current qemu-system-riscv64 can boot to Ubuntu 20.04
distro user space.

Regards,
Bin


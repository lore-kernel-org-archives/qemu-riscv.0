Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGKTO-0003U1-5F
	for mharc-qemu-riscv@gnu.org; Sun, 28 Feb 2021 06:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGKTM-0003Tn-Bg; Sun, 28 Feb 2021 06:42:52 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:39005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGKTH-0003Iv-BB; Sun, 28 Feb 2021 06:42:52 -0500
Received: by mail-yb1-xb35.google.com with SMTP id u3so13944276ybk.6;
 Sun, 28 Feb 2021 03:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lIpSv/qdDh94OOBo3bFyvAyk+OT7dOjyWzoJ+bAVQCI=;
 b=oxzsi1/z6aNSnWe5RhQu7Da+AJEhncQkStrhae1h8GSFEyEZQO2qeZOr3/1rHdQlaz
 wHUiv/5xIHZHyQkLTDxxd2AeJYvNhANHNCbs9qezC6+EpLy37SMJL7217sjMgt/bjzS1
 8yiIRHfugiakvpeWoD96YzazyzgQAj6OSEK85nDVxfFnorjpm/P6oOIE6e218ydg0/Dk
 Np/fzGsUjBiFMmJ3vDJkcH51Yb+cVVcV35FAgaQ6Abz1tpx80X9FPwPOc4CR6SIO9ZXl
 cx6zGtsNXK2B4kujE5bGq1As5QLyg9myazRDxHq9vpucg7RVxQE8euIvnAoRmT9jRwjh
 5m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lIpSv/qdDh94OOBo3bFyvAyk+OT7dOjyWzoJ+bAVQCI=;
 b=NVsVJmjUjSwwJbbsZihO34wN5dQg7q6vfrHqLQgchZW4bX2R7Tla1WQOL+ol4MuUt3
 wBpEOcaogKppVXx/pqnvD8Y8PaXkdpnzpitmps8AGQUVB3AIAP0KwujgHEzQ578Ya8TM
 YTBQl9hBtMoyDfifaEU810GkWClUrMxSuw+A/+VcO4+grpn6DhXD1MzyPNkovNtFYfLP
 iW5MNJJSmlkfqsgHL5uJxltCyMXu08Etk4NS6jODv2BtkSkvi/XS90b2x3/K2c2GlQO4
 A6HlCyKwwPysd2SKai7eg1Dhs0DzNgvwcXRIaXguNh2NNX7SdAH/3t3XPKMLLICi3CSR
 K3NQ==
X-Gm-Message-State: AOAM530AMFqRRNslKSx3+ksQcSnJmEY/mdXc5H3LRxRuYbzyjACZ6Y96
 FSWby4OtTZpPKsE/ePWJZmYQtKUPivlw9KyAi0Y=
X-Google-Smtp-Source: ABdhPJx7eJxI4fZmlN/VMsY+vGt5iej/By0ikBsXcvMsck/Kce1AnkSuZxq8MFfSRfeGZpyUnnjmvVeyxNJ8Yicdny0=
X-Received: by 2002:a25:abce:: with SMTP id v72mr17711256ybi.152.1614512566054; 
 Sun, 28 Feb 2021 03:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20210226035447.1252-1-ashe@kivikakk.ee>
 <20210226035447.1252-2-ashe@kivikakk.ee>
 <CAEUhbmWBPGNQ0J9P3OzV60BW23YCatbU9PZ0whs2ut4bXLPU4A@mail.gmail.com>
 <20210228111806.s6pyxk3iyhvfatzh@talia.n4wrvuuuhszuhem3na2pm5saea.px.internal.cloudapp.net>
In-Reply-To: <20210228111806.s6pyxk3iyhvfatzh@talia.n4wrvuuuhszuhem3na2pm5saea.px.internal.cloudapp.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Feb 2021 19:42:35 +0800
Message-ID: <CAEUhbmULkBvBKg9haizdHAN3r=wveHC67=M62vhsAUMF=00p9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/riscv: Add fw_cfg support to virt
To: Asherah Connor <ashe@kivikakk.ee>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Sun, 28 Feb 2021 11:42:52 -0000

Hi Asherah,

On Sun, Feb 28, 2021 at 7:18 PM Asherah Connor <ashe@kivikakk.ee> wrote:
>
> Hi Bin,
>
> Thanks very much for your review.
>
> On 21/02/28 02:02:p, Bin Meng wrote:
> > I guess this is put here because riscv_load_fdt() is trying to touch
> > the device tree, and creating fw_cfg has to be done before that?
> > Maybe a comment is needed to prevent whoever later wanted to move the
> > codes around?
>
> Done!
>
> > > -    VIRT_PCIE_ECAM
> > > +    VIRT_PCIE_ECAM,
> > > +    VIRT_FW_CFG
> >
> > nits: insert this before VIRT_FLASH
>
> Done.  I've included your Reviewed-by: on the unmodified commit in the
> series; I hope this is the correct thing to do.
>

Yep, that's correct. Thanks!

Regards,
Bin


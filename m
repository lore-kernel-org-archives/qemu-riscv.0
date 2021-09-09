Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mODuW-00055a-RA
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 02:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mODuV-000550-AH; Thu, 09 Sep 2021 02:51:47 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:34691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mODuT-00026F-NY; Thu, 09 Sep 2021 02:51:47 -0400
Received: by mail-il1-x129.google.com with SMTP id w1so98591ilv.1;
 Wed, 08 Sep 2021 23:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UKDf9uhx1V+FWB0zvmTv/1NTwsnUc+O3q8M0eRgzIc4=;
 b=EDAF+H14N6hmOosAmdEz/cbIHG4i+RfWU4y1I3rv0tNbewmZHfPYNM6j3BcduboxFf
 fUP5HaHs9Q8KlJ5Wv5Mzcyp4n2NYSllJoEBg/AO/Mi/IkulJUyJqaopVjFSE7iptKAxx
 E6bdZ2cfDyf/wnFToI0DTlbG8e3b3oSIhNz1RoCNoEsFNELk1FMEd3ZS5AV/CnL6RCA1
 hBoSDId7oF9Ha/DpWHgJQQ/zCrOuQSh2iYnVa7L8K9P7hafHfjCDIpch2Bwk1+rL8hbF
 zPai/lmD1gS8/jqdYpSq4r17d38gTBSKD/NniWJYcDyfgrfMZY90c/G9CYFUWcxMIEMU
 ua5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UKDf9uhx1V+FWB0zvmTv/1NTwsnUc+O3q8M0eRgzIc4=;
 b=hsKj5Ium7kgMPop8i4waZ3vTmGOf0DRFYDoD04OjLyENdVf7604WbriYf2F7jA7zv6
 xkvkxcJpGlcqrF6en1EQ82h8ipaps0wJ6jj3T81v5yyz1hJ7VKXoRfFYb0OqnKbIpm02
 y4wezrIwXmMVkJyh+nvvrk2uav1nv5boIw6Bfvm/nADLDQf2+J1P+FtoUr/PGBQsKpOH
 0ssfPffMFah71XGD0VMq0M76LZH7eVv0QPUYaaEBooGc41BAFGfzIVXBIpQ4+11LwzwP
 VfL+5+Ea6ZbYnru4ms6YA3BZ6DKw54A9jf70gBCSb/ZlQpesXi//RVq0WTWNEB9CqHl2
 DeSQ==
X-Gm-Message-State: AOAM53013bjfiEDSvcAtT0BvibCdewEd7sEjIFYRmtxvtEtNlWh1L3Qj
 S9HrIxo2bIYyYfVRPzkyVzsmU7UYIOOVpSicMYw=
X-Google-Smtp-Source: ABdhPJyzgnq738mQ5hBr58F8yIkVPw896Ctgi5EWFsZT+GulpTqMMLFltAVukr8Zgc54Vkg7IrxXhcMSdU7YntCab5o=
X-Received: by 2002:a92:730c:: with SMTP id o12mr1245600ilc.208.1631170303338; 
 Wed, 08 Sep 2021 23:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-23-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-23-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Sep 2021 16:51:17 +1000
Message-ID: <CAKmqyKO_AuY1UgE6-qKzajTYQY_dN7LXpSz6hRSbd4J9=9UxaA@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] docs/system: riscv: Document AIA options for
 virt machine
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Thu, 09 Sep 2021 06:51:47 -0000

On Thu, Sep 2, 2021 at 10:07 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We have two new machine options "aia" and "aia-guests" available
> for the RISC-V virt machine so let's document these options.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/system/riscv/virt.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index fa016584bf..373645513a 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -63,6 +63,22 @@ The following machine-specific options are supported:
>    When this option is "on", ACLINT devices will be emulated instead of
>    SiFive CLINT. When not specified, this option is assumed to be "off".
>
> +- aia=[none|aplic|aplic-imsic]
> +
> +  This option allows selecting interrupt controller defined by the AIA
> +  (advanced interrupt architecture) specification. The "aia=aplic" selects
> +  APLIC (advanced platform level interrupt controller) to handle wired
> +  interrupts whereas the "aia=aplic-imsic" selects APLIC and IMSIC (incoming
> +  message signaled interrupt controller) to handle both wired interrupts and
> +  MSIs. When not specified, this option is assumed to be "none" which selects
> +  SiFive PLIC to handle wired interrupts.
> +
> +- aia-guests=nnn
> +
> +  The number of per-HART VS-level AIA IMSIC pages to be emulated for a guest
> +  having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
> +  the default number of per-HART VS-level AIA IMSIC pages is 0.
> +
>  Running Linux kernel
>  --------------------
>
> --
> 2.25.1
>
>


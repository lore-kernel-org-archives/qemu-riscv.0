Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYcKu-0000iI-AY
	for mharc-qemu-riscv@gnu.org; Sun, 27 Mar 2022 19:30:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYcKs-0000gB-KH; Sun, 27 Mar 2022 19:30:14 -0400
Received: from [2607:f8b0:4864:20::d32] (port=35358
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYcKq-0003Bj-WE; Sun, 27 Mar 2022 19:30:14 -0400
Received: by mail-io1-xd32.google.com with SMTP id p22so15175552iod.2;
 Sun, 27 Mar 2022 16:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vCkGbmiXRMtambl/Dpj3MrVN9F6TMmtxOwYQf0SiSdM=;
 b=ktpWxGqye7esVLgvOUCv4h4GZ3fU1HaBN08uLifmVufFHLWf1Z2OvSK6JK2TZXDqB7
 LvXOJhATuJE8050YSeCdbEPtuXYSowipqDUccY0Qnhlwf1IdPo3GQC8/HnuYz4Zk5j99
 bCuRkBet7iTUNcJDwUT0IAqDOv4PmA/npSwbYmO1X9OWCzLIOZOH4T6sr5fUoaLb2n5f
 p3bU4xdBKFO1Ib+fgko1xDHcGF4zO2qcnTkxmviG82y6qK0ERUSjNglJJxX3RiFU4wLF
 6Rm/eo3ZkiP69e6F8CVz3xn0B+oByjRc1Cv117bNj27ruTHRZXIC2TDbw2LKv5868FpI
 hgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCkGbmiXRMtambl/Dpj3MrVN9F6TMmtxOwYQf0SiSdM=;
 b=DisYYn/3/Aty/yneh4KOyoSX3c/BFlHhNYE1/DgSB77MCsaKtutihPqIYlHZh7NqBk
 wE1H1GNJLSw6QnTOl5Fadw9QXM6yLvspUdkb6B9XiHLeb+MUgI1Kl6Z1a2ZCoR0MIUPq
 ZZQN+M1Mi/bPxjLLp2rthg191RoeZb1Zalev0XbAxHhFZ9BzDkivFbqlToCQrjnlZg6p
 nCbFiUSR4ybpeFXfQe58mr8TlsCx7F7RKmdT5hL+CNN87naQMHdcPwYbf4OGgC8LnE6N
 uK7AGQ2XlePjy1F+8rEbC3Yq2YYZWoOVVoTPe9o2MqxUtOdvL9SVQtyUOiZqnMiOX/jZ
 2sEw==
X-Gm-Message-State: AOAM533rVUEegFTv+mqTErfmuNPGZVCdOFe1HmOtVQTeNHJ1kXld8xCE
 IvC7ywgmkHKRbujWDgTK3YR3EPp+gVhcH6H/zsg=
X-Google-Smtp-Source: ABdhPJzHO3Q+0EYOcYjpUF7jvWOzZCAvw31IEPoCyNEsQUte306p1U43UJFMyVC1JVlBcqaQ+EFNO7IedLxU4KhfcKw=
X-Received: by 2002:a05:6638:134c:b0:321:3eb8:f68a with SMTP id
 u12-20020a056638134c00b003213eb8f68amr11674205jad.66.1648423811644; Sun, 27
 Mar 2022 16:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648270894.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1648270894.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Mar 2022 09:29:45 +1000
Message-ID: <CAKmqyKNhXjGX4PyTXTmyPArEfZeb4FgKX-6pjdwVk8avnN6cTw@mail.gmail.com>
Subject: Re: [PATCH (PING) 0/1] target/riscv: misa to ISA string conversion fix
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 27 Mar 2022 23:30:14 -0000

On Sat, Mar 26, 2022 at 3:46 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> [This is the same patch as previous ones]

Hello,

Thanks for the patch!

> <https://lists.nongnu.org/archive/html/qemu-riscv/2022-02/msg00098.html>
>  (qemu-riscv only)

This never made it to the QEMU mailing list

> <https://lists.nongnu.org/archive/html/qemu-riscv/2022-02/msg00097.html>
>  (resent due to configuration error of my mail server; qemu-riscv only)

and neither did this

>
> I hope this is applied before the QEMU 7.0 release.

Unfortunately you have missed the window for 7.0. This patch will need
to be reviewed then applied for the next QEMU release.

>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>
> S and U are misa bits but not extensions (instead, they are supported
> privilege modes).  Thus, they should not be copied to the ISA string.
>
> I am truly surprised that this patchset is the THIRD attempt to fix this
> longstanding problem.

I'm sorry you feel this way, but this is the first time this patch has
been sent to the list since 2019.

I'm not sure why (1) wasn't applied, but (2) and (3) don't appear to
have been sent to the QEMU mailing list.

The separate RISC-V mailing list is confusing, but patches should be
sent to qemu-devel, as described at:
https://wiki.qemu.org/Contribute/MailingLists

Alistair

>
> (1) August 2019: by Palmer Dabbelt
> <https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00165.html>
> <https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00141.html>
> <https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00259.html>
>
> (2) April 2021: by Emmanuel Blot
> <https://lists.nongnu.org/archive/html/qemu-riscv/2021-04/msg00248.html>
>
> (3) February 2022: by me (this patchset)
>
> I feel this is urgent to eliminate this bug now considering it required
> a workaround to RISC-V Linux kernel as I pointed out:
> <http://lists.infradead.org/pipermail/linux-riscv/2022-February/012252.html>
>
>
> Though my patchset is first developed independently, this submitted
> version is influenced by (2) Emmanuel Blot's patchset.  Thanks to this,
> constant "[n]" can now be variable "[]".
>
> It also fixes an ordering issue where 'C' should be preceded by 'L'
> (order: 'L' -> 'C') as per the RISC-V ISA Manual (version 20191213),
> Table 27.1.
>
> It clarifies the role of `riscv_exts'.  It's a single-letter extrension
> ordering list.
>
>
>
>
> Tsukasa OI (1):
>   target/riscv: misa to ISA string conversion fix
>
>  target/riscv/cpu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
>
> base-commit: f345abe36527a8b575482bb5a0616f43952bf1f4
> --
> 2.32.0
>
>


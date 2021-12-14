Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxGrZ-0003zu-89
	for mharc-qemu-riscv@gnu.org; Tue, 14 Dec 2021 18:05:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mxGrX-0003yW-9t; Tue, 14 Dec 2021 18:05:35 -0500
Received: from [2607:f8b0:4864:20::d33] (port=46831
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mxGrV-0006Rd-Hy; Tue, 14 Dec 2021 18:05:34 -0500
Received: by mail-io1-xd33.google.com with SMTP id x6so26816107iol.13;
 Tue, 14 Dec 2021 15:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+ITWRUmIHQWVBRxImwEIdNh8qETyqn/2WsI66fHIu4=;
 b=HJfA7oW6LAbesnLp02w2ZMEV8AXinHEx0X6n+VuuldxXSGDMYJ9lgiWdTef5m06/k9
 bH59liLT9YFMa7JHKsl3vWeeA2aboEFkdxXILY2+FpV52E5M/EtEDtn0Mi0L5tsXhNtn
 rtQ+vuSPTjuccbEn1sNLPQUTHZA1NS5wvUaiEbdUnMIeUBRoecpcaIRE4X8caZZ8ySnz
 yKQMa8l1d9DjB3kqe1ta/Wvk7oOU3woNSvc6TQipTuWmVzCJ8Fsa10bc+fjzaLp9zi3b
 sRhjAAbRPGqK49SIiO9aqejUk9pRil8Fs2MCu67Cq+cbsXFjikCSBOfqpFsc86Qe1JM8
 N5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+ITWRUmIHQWVBRxImwEIdNh8qETyqn/2WsI66fHIu4=;
 b=75uyWARVJ7gwUdCumXX3e6c+3GH+96PmfJHCV/yvLH7vPjZy9OCbFzJt9KX14XOj51
 RuJJRrerWB2sVQSBKPcz7LDQBSr/JIHs389NdMe/Cdn9ILbxOIwYXn4hXYZyRXvCKLwo
 JqJ2W28aIzlDQDA7R7b8JsaLkS3AurBpXTrWDeVU44WqZFf9D1Du5DxinsXqX3j8ZyKl
 7iiZNfabjY1FmKRA9Y3OkE6uAgPBqziQeUCW4PVD3jRYZk6d8s6LWgRfE1KgQxZ1goAv
 Mn0Ev2diWxgn7EEG2ysvsxB3J7GHvOoi7gJ1XMUGo7NaVUO3ief/hQl3oKSEbqWa+AuQ
 CNpg==
X-Gm-Message-State: AOAM530Dbj6cMh/zM9RUX7WFtxo3UzvRewoTOLUhPu+dpbMtjwD7Cvtn
 JZvIpkyX6+EOjoXl0LM4EUZ2Ij/5z2+Xv8RTnOQ=
X-Google-Smtp-Source: ABdhPJxeB/G5R2aLbzwglPWe7iRb/srbcwhkfOpfML6VnCA2BXFJkc96b9kGQeqr3NHhpP66RGFi58oCPOZsLDjXwUo=
X-Received: by 2002:a05:6638:6a8:: with SMTP id
 d8mr4347912jad.672.1639523131571; 
 Tue, 14 Dec 2021 15:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20211210074329.5775-1-frank.chang@sifive.com>
In-Reply-To: <20211210074329.5775-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Dec 2021 09:05:05 +1000
Message-ID: <CAKmqyKN5VFD9aaTTAQA15c-0yjKvk9-Ekpo9M8Fz_PWMv8WR2Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] target/riscv: support Zfh, Zfhmin extension v0.1
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 14 Dec 2021 23:05:35 -0000

On Fri, Dec 10, 2021 at 5:44 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Zfh - Half width floating point
> Zfhmin - Subset of half width floating point
>
> Zfh, Zfhmin v0.1 is now in public review period and is required by
> RVV extension:
> https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/63gDCinXTwE/m/871Wm9XIBQAJ
>
> Zfh, Zfhmin can be enabled with -cpu option: Zfh=true and Zfhmin=true
> respectively.
>
> The port is available at:
> https://github.com/sifive/qemu/tree/zfh-upstream-v6
>
> Note: This patchset depends on another patchset listed in Based-on
>       section below so it is not able to be built unless the patchset
>       is applied.
>
> Changelog:
>
> v6:
>   * Rebase on riscv-to-apply.next.
>
> v5:
>   * Rebase on riscv-to-apply.next.
>
> v4:
>   * Spilt Zfh, Zfhmin cpu properties related changes into individual
>     patches.
>
> v3:
>   * Use the renamed softfloat min/max APIs: *_minimum_number()
>     and *_maximum_number().
>   * Pick softfloat min/max APIs based on CPU privilege spec version.
>   * Add braces for if statements in REQUIRE_ZFH() and
>     REQUIRE_ZFH_OR_ZFHMIN().
>   * Rearrange the positions of Zfh and Zfhmin cpu properties.
>
> v2:
>   * Use {get,dest}_gpr APIs.
>   * Add Zfhmin extension.
>
> Based-on: <20211021160847.2748577-1-frank.chang@sifive.com>
>
> Frank Chang (3):
>   target/riscv: zfh: add Zfh cpu property
>   target/riscv: zfh: implement zfhmin extension
>   target/riscv: zfh: add Zfhmin cpu property
>
> Kito Cheng (5):
>   target/riscv: zfh: half-precision load and store
>   target/riscv: zfh: half-precision computational
>   target/riscv: zfh: half-precision convert and move
>   target/riscv: zfh: half-precision floating-point compare
>   target/riscv: zfh: half-precision floating-point classify
>
>  target/riscv/cpu.c                        |   2 +
>  target/riscv/cpu.h                        |   2 +
>  target/riscv/fpu_helper.c                 | 180 ++++++++
>  target/riscv/helper.h                     |  29 ++
>  target/riscv/insn32.decode                |  38 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 537 ++++++++++++++++++++++
>  target/riscv/internals.h                  |  16 +
>  target/riscv/translate.c                  |  20 +
>  8 files changed, 824 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> --
> 2.31.1
>
>


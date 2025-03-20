Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF79AC35FFF
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 14:41:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tvH5O-0001JB-E6; Thu, 20 Mar 2025 10:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tvH5J-0001IO-Uw
 for qemu-riscv@nongnu.org; Thu, 20 Mar 2025 10:41:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tvH5G-0005kR-3B
 for qemu-riscv@nongnu.org; Thu, 20 Mar 2025 10:41:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3996af42857so1344856f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Mar 2025 07:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1742481679; x=1743086479; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iw9Z75CIOMUO/tCkC23afpdlxqKaY1pd0aqtp4cxuRQ=;
 b=Kw+SxWeTKMM+eXC8cxmVWYMy6GAh5ulFCClWZO4dMoVFiUOpM+Zk4NNE3zR5bfH0y4
 b/OACCYHxJnkhrOjUl0KC/ZNvuVpxeQ4JGC8iLjy56gkMLI8qCrN62DpNxMbRAbmSdFl
 MmtakwL9q/kjPdMNqfYRK/f2t4F03cJHB9UxCS27PkjN0xVUlLQOfKqjkt2YvOvt4ON7
 NEAzFVWypa8mPn4k4WWboqo6J8zikPIGNaqyD2BfV7Pni9kDtQ/nNMSFRT7Ss5evjUdA
 /ULrg7MAh4wxAXhKpkOgQ/ywTEyzdwvLd8GGiDJ1iwSsggoTes36Jc7XJtbJYSaVVeBH
 Y0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481679; x=1743086479;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iw9Z75CIOMUO/tCkC23afpdlxqKaY1pd0aqtp4cxuRQ=;
 b=cGvO//ejZsqjlpaKm7hT+iMwrrqbpCA6bShIAy2MLuqjPEL4JKvTtkF7Z3IGwie3hc
 4ImWebw412Wr2jN/itNoxNmRk1FQ8YzcFv3X3xNq7N8efM6GNNT7ewyGZlCdF8sIwFTJ
 JVwNuSaGfsqw+Aud1cKeYd9/9P/UQ5jCQdRpxJtdVWKx7x6XWJH/hZpLXBhMxNimhy5A
 D5EkvJ8PFUr2FNb5VElJ8dIMQ61uyFJoLbIbmXP/GQuI97jOBjf/tYAVpjxqrPMEgV9h
 7+EU1mGUCkkfCx69sVCJ++sbJwX51zrcjRgd4XnqVPGwxbHOkKd5GfccX3yKnko0fIu8
 polQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3wZyp8M6ps5j+Xa9ER476OZ22IS+pmHVAUHe9pFbwU8s7TeXkudTOw8hIy8ZWaHcNwL0CKPdi4cQG@nongnu.org
X-Gm-Message-State: AOJu0YzdsKBFe55Z+NGao33pJUbOXpORLfgXmYawmYZiDXtpbEsMA0nl
 3YFT49EmMCbAR5MggDHPK0Nu+Hs6BPFgszM4/uMVeiekT3CRWAI1LK4QKq3tzsQ=
X-Gm-Gg: ASbGncsd0EcNnVHEVzhfaPhVonPgusbWm3kHFNzagn7PjE70L1WLWf780FIadVovQ9W
 H/p4vu843X5pc/jPE5wofzYoPrf+UW/5Wm4XfRZg685EPj+plFooID11KEAFsEHsEKUXcOxkCKg
 BOIWC9Mb4d8i2t9mEkV8mjXy1ZIni3wGr38ybwBDxMMqcVYmYqFyv3xgSiifMl+WHijtXBukTrA
 +X7mlAcymUiGx6OqY+9NBu2Y/EYKmDS6gyaVQHZFTcStBxhCmFs/grWBO+93Z0nQfR3pTq/7fiT
 Tyy6/URF8YmoaYZsDbwU/9ISjr0w8sbe
X-Google-Smtp-Source: AGHT+IGWOAjndC2UvhjijXPAtK8R0pWBwWO38qtA9H3IsWk075TkJoNWFGZaRRxl7gUcgns4aI50mw==
X-Received: by 2002:a05:6000:154d:b0:390:f025:9e85 with SMTP id
 ffacd0b85a97d-39979586dc7mr3332058f8f.21.1742481678506; 
 Thu, 20 Mar 2025 07:41:18 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43cbasm50305025e9.9.2025.03.20.07.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:41:18 -0700 (PDT)
Date: Thu, 20 Mar 2025 15:41:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Alistair Francis <alistair23@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v3 3/3] target/riscv/kvm: add missing KVM CSRs
Message-ID: <20250320-3cb60e99a0abb54e2bb56838@orel>
References: <20250224123120.1644186-1-dbarboza@ventanamicro.com>
 <20250224123120.1644186-4-dbarboza@ventanamicro.com>
 <CAKmqyKNmpRA8kphbWnA-AqTSUSGf+koSbCmuk6VgZEWde2NFBw@mail.gmail.com>
 <CABJz62OfUDHYkQ0T3rGHStQprf1c7_E0qBLbLKhfv=+jb0SYAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJz62OfUDHYkQ0T3rGHStQprf1c7_E0qBLbLKhfv=+jb0SYAw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Mar 20, 2025 at 07:25:07AM -0700, Andrea Bolognani wrote:
> On Mon, Mar 03, 2025 at 01:46:53PM +1000, Alistair Francis wrote:
> > On Mon, Feb 24, 2025 at 10:32 PM Daniel Henrique Barboza <dbarboza@ventanamicro.com> wrote:
> > > We're missing scounteren and senvcfg CSRs, both already present in the
> > > KVM UAPI.
> > >
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> 
> This patch seems to have broken KVM acceleration for me:
> 
>   $ ./build/qemu-system-riscv64 -display none -M virt,accel=kvm -cpu host
>   qemu-system-riscv64: Failed to put registers after init: No such
> file or directory
> 
> Reverting it makes QEMU work again.
> 
> My host is a SiFive HiFive Premier P550 board running Fedora 41. Note
> that, since the upstreaming effort for this SoC has just recently
> started, I'm using the 6.6-based vendor kernel.

Ancient :-)

> 
> Perhaps the KVM UAPI additions mentioned in the commit message are
> more recent than that, and we need to make QEMU's use of them
> conditional rather than unconditional?

scounteren has been around since the dawn of riscv kvm, but senvcfg has
only been there since 6.7 (just missed your ancient cut-off).

The true fix for this is to start using get-reg-list, which should
hopefully work with the 6.6 kernel too since get-reg-list support has
been around since 6.6.

A quick fix for this is to just drop senvcfg for now since nobody
noticed it was missing before (well, I noticed it was missing, but by
inspection, not test).

Thanks,
drew


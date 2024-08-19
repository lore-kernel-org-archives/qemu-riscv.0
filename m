Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C79C52D7C
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 07:50:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sfx9s-00048c-2i; Mon, 19 Aug 2024 03:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sfx9q-000486-N8
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2024 03:50:30 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sfx9o-0005M5-UL
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2024 03:50:30 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f0271b0ae9so50785931fa.1
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2024 00:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1724053826; x=1724658626; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nECs+7LwfoTa4p0TWabtRthPV/S5+LZtDbyRSLrkM7k=;
 b=Xx5bj2VFpqOydamsZ39kAc0Cjk+DIfQ2ns2Ww2NfouHJ/9bnrk6qG9/ZJzZMFyRZup
 rYaWEKVJxvRYpQWoFEKUARejYJwiLuimxcjsZYmZAI7RqjIL9wmCnrRmHng6xmcTl0U+
 ydKxc9Ym5YeuSXZt6s5yDtcmk/7ZbfQGA0fusTGwIeQnag69HRW/ZLKbnM3nehpPoHCO
 Al2m3U3PyCpp5W3n1teCYT8Hqj4SQnols5kFZXgSewKcw0prEKGz15XCLoGXB8wgpcw7
 4KHs/ucgI+MU/YSncuNRAyqdr3NTiGy9nx78YZnzsVx6BGrH+1H0sKjpqj9r78kECQQ/
 fhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724053826; x=1724658626;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nECs+7LwfoTa4p0TWabtRthPV/S5+LZtDbyRSLrkM7k=;
 b=tKMSwmTAsEsKH+5Cl7EH/dAGFKjs+jgfqz3NWnlqvb79reSWa4GfonInJOGI8i87OR
 y1yzEM2CDFa7Pad4fxvcZn28O9v0B06w8M0eUBccGPyzfRG5fMub1zi52QBdntlD/wZ/
 XuuQTPl+P+mk/4S2P0YhzGlUyBbtLGIVeuxvdyrj+riGo0Evb3aRKEi37/cpL6ajIyaN
 +1O44/mMCLexjSJNMcTSTKAxm/EKUJMIbieLTGjAjYDSoybBPPU53JFwWhEqQKy9rOZQ
 wukQJ6ipnD7dVLkCpJvKvOzNKrIFWIKPkf0s0KmRYSj7+WxdRuZYDX2SA8d+Q1jAUeU4
 yF1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeERXwH1n+Hu5i9w1pQmH2F+mVCJn8KkwN0Bo8XIwtEQxPnR39UggI46yqRNeIqGLsr/z57Rj7irUW+RkwgIwbFKoNGaA=
X-Gm-Message-State: AOJu0YyE2cQ2Uq/dFnQZbD6NSUnpxc4SPCmxQhXWz0w5XQRVCmvyeaWu
 jG6zB3BQ1p7sO3M0KfbdhGlrkeswPN4+ctyMvSMk/gIzrqLW6+J91QnaGUC4/M0=
X-Google-Smtp-Source: AGHT+IFnBZuOrw8K1GawLWOJjeFZoWHyJc5kWrgqeG7CrLQygKlDUg08+mb0ksOTvjhDzuzGrvo5iQ==
X-Received: by 2002:a2e:a990:0:b0:2ee:7a3a:9969 with SMTP id
 38308e7fff4ca-2f3be57219cmr73570981fa.5.1724053825371; 
 Mon, 19 Aug 2024 00:50:25 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbe12eccsm5507855a12.58.2024.08.19.00.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 00:50:24 -0700 (PDT)
Date: Mon, 19 Aug 2024 09:50:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bmeng.cn@gmail.com, dbarboza@ventanamicro.com, 
 Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/2] hw/riscv/virt: Introduce strict-dt
Message-ID: <20240819-2773526929f81da7a462d10a@orel>
References: <20240816160743.220374-4-ajones@ventanamicro.com>
 <20240816160743.220374-6-ajones@ventanamicro.com>
 <CAKmqyKOXS+Fmb1Jxzwh3fAkeKi5eXQZ+JKkc3H77XjKrrKXe-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKOXS+Fmb1Jxzwh3fAkeKi5eXQZ+JKkc3H77XjKrrKXe-Q@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Aug 19, 2024 at 11:19:18AM GMT, Alistair Francis wrote:
> On Sat, Aug 17, 2024 at 2:08 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > Older firmwares and OS kernels which use deprecated device tree
> > properties or are missing support for new properties may not be
> > tolerant of fully compliant device trees. When divergence to the
> > bindings specifications is harmless for new firmwares and OS kernels
> > which are compliant, then it's probably better to also continue
> > supporting the old firmwares and OS kernels by generating
> > non-compliant device trees. The '#msi-cells=<0>' property of the
> > imsic is one such property. Generating that property doesn't provide
> > anything necessary (no '#msi-cells' property or an '#msi-cells'
> > property with a value of zero mean the same thing) but it does
> > cause PCI devices to fail to find the MSI controller on Linux and,
> > for that reason, riscv virt doesn't currently generate it despite
> > that putting the DT out of compliance. For users that want a
> > compliant DT and know their software supports it, introduce a machine
> > property 'strict-dt' to do so. We also drop the one redundant
> > property that uses a deprecated name when strict-dt is enabled.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  docs/system/riscv/virt.rst | 11 ++++++++++
> >  hw/riscv/virt.c            | 43 ++++++++++++++++++++++++++++++--------
> >  include/hw/riscv/virt.h    |  1 +
> >  3 files changed, 46 insertions(+), 9 deletions(-)
> >
> > diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> > index 9a06f95a3444..f08d0a053051 100644
> > --- a/docs/system/riscv/virt.rst
> > +++ b/docs/system/riscv/virt.rst
> > @@ -116,6 +116,17 @@ The following machine-specific options are supported:
> >    having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
> >    the default number of per-HART VS-level AIA IMSIC pages is 0.
> >
> > +- strict-dt=[on|off]
> 
> Hmm... I don't love the idea of having yet another command line option.
> 
> Does this really buy us a lot? Eventually we should deprecate the
> invalid DT bindings anyway

I agree we should deprecate the invalid DT usage, with the goal of only
generating DTs that make the validator happy. I'm not sure how long that
deprecation period should be, though. It may need to be a while since
we'll need to decide when we've waited long enough to no longer care
about older kernels. In the meantime, we won't be making the validator
happy and may get bug reports due to that. With strct-dt we can just
direct people in that direction. Also, I wouldn't be surprised if
something else like this comes along some day, which is why I tried to
make the option as generic as possible. Finally, the 'if (strict_dt)'
self-documents to some extent. Otherwise we'll need to add comments
around explaining why we're diverging from the specs. Although we should
probably do that anyway, i.e. I should have put a comment on the
'if (strict-dt) then #msi-cells' explaining why it's under strict-dt.
If we want strict-dt, then I'll send a v2 doing that. If we don't want
strict-dt then I'll send a v2 with just a comment explaining why
#msi-cells was left out.

Thanks,
drew


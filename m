Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0A5D767C7
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 13:50:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t6VZJ-00008N-3c; Thu, 31 Oct 2024 09:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1t6VZG-00006D-Fk
 for qemu-riscv@nongnu.org; Thu, 31 Oct 2024 09:50:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1t6VZE-00012a-TG
 for qemu-riscv@nongnu.org; Thu, 31 Oct 2024 09:50:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4319399a411so8314285e9.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Oct 2024 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1730382627; x=1730987427; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=duKTB6d8nWTy7cNKPOI7bfcN3ngKi9eUkLUS+Iab76o=;
 b=dupzzygw6TRYBcC8cM2MLaV0YAQQpizGdvpqVhq4xEaIM44qYQVj2Mf2oEubaP+szC
 8qWp/dmDEEj9YniQMtzihBv3ol2ry34gcSaFWFV6Vg5n/0sS7l7NhVRNZCaHlEl+gckA
 ORsRxkCqtgrgbDCFmkwgSeeC87B4V9LmLZRPVHTzsNkgWFdKezk+xMVgGDrBd9SL8PgG
 TZ3E+hfI5qlzIgHRzIe2M61J92Z8WeoW6VR3ii7cXrSb979rzn8Pp5wGmvIp3h9xJ16L
 BIWOxPK4n33ngbg/ysxEStGTsJ1W5FcepqEgzXuq3Tw3UAxv5L5frY7gEVyI3VAzG9h7
 xyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730382627; x=1730987427;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=duKTB6d8nWTy7cNKPOI7bfcN3ngKi9eUkLUS+Iab76o=;
 b=P2mrC4iYd0rk96A4t44AQEtXyah2Mc63x84wMdnpVM3ycErf+C/LC+0bqBBAhjuMi5
 ZMqbgrgl/asFdsEhXvnFPaAzndfIzVGDp4+J2HDUtbQsRLgcAm0RHUdXQoMT3UONYRGE
 yX5z1FsbEEakG5nv4mrEBNzFrUkxeMCHyJXUCqsC5XwNOMTOF4AhcLdj42HRJ1H4ccZy
 Bg2+lxdY/radNYSZsPD4jHd7rhyOR9cOlyiuugfezFlzOQSyEAE96+QQiRqmmoKFwIPM
 P6N88qfhpSOTQz/XdCJUX7UWp+kjXpML2byKGIG3Ml2nnY12RqPo3aE2hjij2Mhxf1/l
 goTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWudT6obAgsetmz9i8O6zg/jagnKKj/bZRfFdI+qV5ABc+D6Re6tieMvJhGYoI5CE2F4tiW52c91E0@nongnu.org
X-Gm-Message-State: AOJu0Yzgm4CtJpEIMaD7iteXXbtJOmXA3OnHSAXKJ9YZqz2uwmEqjHyG
 5/FPHm6Zptbp53xWICqFphnvYvMtAfuf5z3Jd7NatzvfxH8zn19U3e4sjh8pX+g=
X-Google-Smtp-Source: AGHT+IHQt5E5d0fFpFXgrihL2aM9NBwI6kU43T2f2TrhLfNy3nC0GlcpH7koWamsa8CTLYi6ZboDQA==
X-Received: by 2002:a05:600c:3b9c:b0:42c:bb10:7292 with SMTP id
 5b1f17b1804b1-4319ac70754mr186786145e9.1.1730382626719; 
 Thu, 31 Oct 2024 06:50:26 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9ca818sm56699215e9.40.2024.10.31.06.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 06:50:26 -0700 (PDT)
Date: Thu, 31 Oct 2024 14:50:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 3/4] target/riscv/kvm: add kvm-aia bools props
Message-ID: <20241031-df22b8f334312420c2dadc09@orel>
References: <20240924124407.766495-1-dbarboza@ventanamicro.com>
 <20240924124407.766495-4-dbarboza@ventanamicro.com>
 <CAKmqyKMMRCFvWYa1GjwkbJsBh8q_OgtA2UVdaNEJsr=N66hvkQ@mail.gmail.com>
 <b7271701-195a-461d-ba64-e2a02c634177@ventanamicro.com>
 <CAKmqyKPvfm7fxa7cCtNWpQaw_=SBvmUFJ15hfJemNg=-YQCbNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKPvfm7fxa7cCtNWpQaw_=SBvmUFJ15hfJemNg=-YQCbNA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
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

On Wed, Oct 30, 2024 at 11:40:57AM +1000, Alistair Francis wrote:
> On Fri, Oct 11, 2024 at 9:19 PM Daniel Henrique Barboza
...
> > In case someone tries it out with multiple -accel options, this doesn't work. Only
> > the first '-accel <type>' are parsed. This happens due to a known command line
> > parsing/accel globals issue that I tried to fix in [1] and [2].
> >
> > For now, using the existing 'riscv-aia' string option:
> >
> > -accel kvm,riscv-aia=emul -accel kvm,riscv-aia=hwaccel -accel kvm,riscv-aia=auto
> >
> > This will set riscv-aia to "emul" because all other "-accel kvm" options aren't
> > being parsed. You can do silly stuff like:
> >
> > -accel kvm,riscv-aia=emul -accel kvm,riscv-aia=this_is_not_an_option
> >
> > And the guest will boot normally, setting riscv-aia to 'emul'.
> 
> Both of those are unfortunate, but I do at least feel that reading
> them it's clear that something is wrong as the user has listed `-accel
> kvm...` multiple times.
>

I wish that multiple '-accel kvm...' would work since scripts can be
written to set reasonable defaults, e.g.

 qemu-script.sh:
 qemu-system-riscv64 -cpu max -accel kvm,riscv-aia=auto ... $@

but then anything the user tacks on through $@ would override those
defaults. For example, 'qemu-script.sh -cpu max,some-ext=off' overrides
the '-cpu max' in the script, disabling an extension. However,
'qemu-script.sh -accel kvm,riscv-aia=emul' will not force KVM to use
use AIA=emul mode since the tacked on '-accel' is ignored.

Thanks,
drew


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA424C9832F
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 18:32:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAtfl-00050n-5N; Sun, 27 Sep 2026 14:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAtfa-0004zl-TC
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 14:32:15 -0400
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAtfZ-0001bU-4w
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 14:32:14 -0400
Received: by mail-pj2-x0c.google.com with SMTP id
 98e67ed59e1d1-3a0eeda3e03so420588a91.1
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 11:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790533931; x=1791138731; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cb97crgsQr+aLgUxmLs9iL7y2lpF1mcB8yK9mFA1qyQ=;
 b=EiLRygBrx6tJ7U6k3DrJQ4XZYLrw3vdrb4vESJC/avA5p8iJUGaN4mcKYpSbYkenF0
 llWQl0zFAYyCLOF97c61wIpXx+xfZeu+qx0tfZh0B8JoI9Cx3OTfBnjbswEOvxk/IsSf
 UNpSYgoBbHgPHbcKIqFhD37DwxxfXYplmWrkCRWUSIFZpWWuvHJIGehcY5bn3w+1J0LN
 UeWN3zVJHSAOZPluhVwr3h8qvTsGM2cZw8Vs/3SxxSonxahNt0BCnV6VF+0l8igNX5NS
 CTtq4nSuaNpPkSbC2PN+bUUYWpvp1kmWrX+OjWUTxrietu9/GaTyHnqBdIszlnF403nR
 WJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790533931; x=1791138731;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=cb97crgsQr+aLgUxmLs9iL7y2lpF1mcB8yK9mFA1qyQ=;
 b=t1q0VP/AbZOBE2O3Y9R6pvFba5IjemIqiMs80+qGUH9hb8oyRkX3VnEhrY+8s+xgM7
 flA7ccI2se/q+sUylmbpE496MieLa3gTTD0r8OkW9PfXT1WYtWa7G7XY0vVBVT323GLX
 lOAIV8QgK3pCOBFTBUiZOwj2VSiJUsljeehlb0yonqr3zbDiXSiHzMSthfAutftnSDJR
 Pm3EIhWosK6TsO96W1NtONQMamynCoWmUFbRYdEDQiEQyx9N+mup445sxYqoEb7kyAjj
 M7+vKz0Jk6TlmjjXzcDIOv+hT8fVWJX9v+jl/w5sbOarWb/NqYFkKjHUL1G0UsLCceKN
 Q8OQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByVU/a3/Su2Bc6NLQuAJmzhucN7VqIVgHsleQykx/UZXDm69NEva3pYMEts2NRnXrCAaWgNCOL3V8mz@nongnu.org
X-Gm-Message-State: AFq9FYKIclN71jOGbOYgfEzNcloxZADxY9gJnOdpPl+Tg782L1Z9CW+K
 ENUPYpj8qs9bq7UVVj+ZDM261QjufDeG+D73OgnQ74Af8NVP6PboZgfq
X-Gm-Gg: AYBFou2Q48cB1HMTJlWDLFZsapdMlGR8Ny4K0ZY7IQNh5LLDS82GosENJLd0P4+n6s0
 l3XEV9pbbPZaRO4Sq9ZM569nWlLbALi8A9pNON57X1TBmVE3eQeJsozYKZ5rq/aABokxMFLpYE0
 5Dvj4fu98OqUTR5+O+D99OQ/cewadjcZKeoNjjK+6z74QTz9eoiIdJArB1Xu6yponnsiKDoTnbW
 7EXqKtI39NiPWzooulsXYUTdMlKMwBthJmUoMHilVgwr4j2//GPRMgzGRdDk1M+yMZMX7i/T3cO
 IQHHyhC7kSYnh5ufpx61zu92lo0Vp+kwgYK6JJyAgC6Savo5pkgOkh+kz3X+uGLX0KaMpRobypq
 FVO/YsluGpuJHS5TGFmZQW29fy/3FVfb0nHJaOmzFqJYo3yBfdV+TSgHxifabGGbTeHy7N9aolJ
 v70qf+cossAKv8R6pgvAcRIkiWiuQNdUAB72YtAKn1bVEHua2NsCrtZ38VMwFX+NbjsAIyJ2w=
X-Received: by 2002:a17:90b:53d0:b0:3a2:590c:a85f with SMTP id
 98e67ed59e1d1-3a2590cb587mr1609679a91.21.1790533931274; 
 Sun, 27 Sep 2026 11:32:11 -0700 (PDT)
Received: from google.com ([118.150.148.19]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0b9589f7esm15980365a91.10.2026.09.27.11.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 11:32:10 -0700 (PDT)
Date: Mon, 28 Sep 2026 02:32:05 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "farosas@suse.de" <farosas@suse.de>,
 "pierrick.bouvier@oss.qualcomm.com" <pierrick.bouvier@oss.qualcomm.com>,
 "almer@dabbelt.com" <almer@dabbelt.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>,
 "wxchen0913@gmail.com" <wxchen0913@gmail.com>,
 "marscheng@google.com" <marscheng@google.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>,
 "jserv@ccns.ncku.edu.tw" <jserv@ccns.ncku.edu.tw>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>,
 "eleanor15x@gmail.com" <eleanor15x@gmail.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>
Subject: Re: [PATCH v4 6/7] tests/functional/riscv64: Add boot test for
 Milk-V Duo board
Message-ID: <arlhCzaJLNneiU3Q@google.com>
References: <20260822194315.2550260-1-visitorckw@gmail.com>
 <20260822194315.2550260-7-visitorckw@gmail.com>
 <66512e37ad227defe5d5512b2694ea0fe5f0a21a.camel@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66512e37ad227defe5d5512b2694ea0fe5f0a21a.camel@wdc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:39::c;
 envelope-from=visitorckw@gmail.com; helo=mail-pj2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 25, 2026 at 04:02:45AM +0000, Alistair Francis wrote:
> On Sat, 2026-08-22 at 19:43 +0000, Kuan-Wei Chiu wrote:
> > Add a functional boot test for the Milk-V Duo board to validate the
> > end-to-end boot flow.
> > 
> > $ ./build/run ./tests/functional/riscv64/test_milkv_duo.py
> > TAP version 13
> > ok 1 test_milkv_duo.MilkvDuoMachine.test_riscv64_milkv_duo
> > 1..1
> > 
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  MAINTAINERS                                |  1 +
> >  tests/functional/riscv64/meson.build       |  1 +
> >  tests/functional/riscv64/test_milkv_duo.py | 50
> > ++++++++++++++++++++++
> >  3 files changed, 52 insertions(+)
> >  create mode 100755 tests/functional/riscv64/test_milkv_duo.py
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 245eb7bb58..3f79334c59 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1861,6 +1861,7 @@ F: hw/riscv/milkv_duo.c
> >  F: include/hw/char/dw8250.h
> >  F: include/hw/misc/cv1800b_clk.h
> >  F: include/hw/riscv/cv1800b.h
> > +F: tests/functional/riscv64/test_milkv_duo.py
> >  F: tests/qtest/milkv-duo-test.c
> >  
> >  RX Machines
> > diff --git a/tests/functional/riscv64/meson.build
> > b/tests/functional/riscv64/meson.build
> > index d1a3e6c2bf..8a4f1d00f9 100644
> > --- a/tests/functional/riscv64/meson.build
> > +++ b/tests/functional/riscv64/meson.build
> > @@ -18,4 +18,5 @@ tests_riscv64_system_thorough = [
> >    'sifive_u',
> >    'tt_atlantis',
> >    'tuxrun',
> > +  'milkv_duo',
> >  ]
> > diff --git a/tests/functional/riscv64/test_milkv_duo.py
> > b/tests/functional/riscv64/test_milkv_duo.py
> > new file mode 100755
> > index 0000000000..aff247e61f
> > --- /dev/null
> > +++ b/tests/functional/riscv64/test_milkv_duo.py
> > @@ -0,0 +1,50 @@
> > +#!/usr/bin/env python3
> > +#
> > +# Functional test that boots a Linux kernel on a Milk-V Duo machine
> > +#
> > +# Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> > +#
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +from qemu_test import LinuxKernelTest, Asset
> > +from qemu_test import wait_for_console_pattern
> > +
> > +class MilkvDuoMachine(LinuxKernelTest):
> > +
> > +    timeout = 120
> > +
> > +    ASSET_KERNEL = Asset(
> > +       
> > 'https://github.com/visitorckw/milkv-duo-qemu-assets/releases/downloa
> > d/v1.0/Image',
> > +       
> > '3f157ecfcb86d28bfcff9fd3c1a43f60a8513b1919739fdc9a4d946aba35b2af'
> > +    )
> > +    ASSET_DTB = Asset(
> > +       
> > 'https://github.com/visitorckw/milkv-duo-qemu-assets/releases/downloa
> > d/v1.0/cv1800b-milkv-duo.dtb',
> > +       
> > '2a5d165f64c4b2d55bba282b2974941ab223f6f5220c2e7721e35ab81311c098'
> > +    )
> > +    ASSET_ROOTFS = Asset(
> > +       
> > 'https://github.com/visitorckw/milkv-duo-qemu-assets/releases/downloa
> > d/v1.0/rootfs.ext4',
> > +       
> > '9e7de9222ab4a79d1291866453aa47cd67a543216df6159bf9b42d055240a676'
> > +    )
> 
> Is there a more official source we could use?
> 
I initially tried booting the board using milk-v duo's buildroot SDK
release. It failed to boot probably because their downstream device
tree and kernel rely on many custom out oftree bindings that differ
from mainline Linux. This is why I originally hosted my own mainline
compiled images on my personal github.

However, I just experimented with switching to tuxboot assets similar
to how sifive_u is tested, and I can confirm that booting with the
tuxboot kernel, dtb, and rootfs works perfectly all the way to the
shell.

I'll update the test to fetch these assets from tuxboot.

Regards,
Kuan-Wei


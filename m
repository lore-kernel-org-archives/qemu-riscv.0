Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5981BCE7AF9
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 09:33:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1smVLj-0004rt-GL; Fri, 06 Sep 2024 05:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smVLi-0004oS-1R
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2024 05:33:50 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smVLg-0005Hv-7y
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2024 05:33:49 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso1909630a12.3
 for <qemu-riscv@nongnu.org>; Fri, 06 Sep 2024 02:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725615225; x=1726220025; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5NeGGOPt+wbuyo+RfxZ0AhzIhlUQ4hqN6sT8cYUd3AQ=;
 b=VwRxbmwXCe6YUDSwDM8cMfJHXoV5vqOGzLkupgkxNKGvlN5F1iQ67astrrZ7myenc6
 m5taRev5HYl/C9RpLMM5HL35XtHS0/ZAjDN1IrxbtZyzXYgvmp65XrHP9/JQCwlOKl/O
 KSKvXniETqs0cGq7dqeQ7XwEpCLX1zZ5Tv1tSYEZQLYKzI7+E5ewWUX+QpBU0i6HpJAd
 l3Lxmtizl1LihyQZ19nMifmNBPAybfGezI7iF8HYYoaRsPrOzhxm0rUzJj4DgZexV186
 L4ZLv0t0eMmIFS0vnnHsPkyLk1MLVEy5QrNfZQOIoHB1idngHCrGSvb/531H5diYcVuG
 I3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725615225; x=1726220025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5NeGGOPt+wbuyo+RfxZ0AhzIhlUQ4hqN6sT8cYUd3AQ=;
 b=diwlS1bhS1472Tu+WKC7ucSMoaYbb6x6KVxKHUT9EAQTtMHghKL+i62LOUAp8eRkGz
 QR0NzpAV0gCcY97p1J77B+XOgFFzOnbUhaegCcT8J4yq/BscY8jJWQbWsmtDWZNIgNQy
 YdQfSooSJ7PFS0D54EccLNS7T7FCeDhnJMIN6Xw/OEJQ4B/IdLOgCdKajq5GepafWQXX
 rgXbyAe9W6aEfdtyxzVuK+mzBhPe4cWoxACGrgEkYFEeiGqDaRC7+l2X/hzNJjZjYQjC
 AprevAZu/XkXG4Pgp8lCAhruJLxHgCVbFnT6zzOKQyDWPGLqzRCeNMHFPeQiP6H3CIJt
 JjRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf90FZq3krbXcQPO87Hj+/IuANpf8yL9MWcnB3cddPd8Denb1tCXO0UpKWShMSlOQ0mROffinHr4da@nongnu.org
X-Gm-Message-State: AOJu0YwAVyMyrEC4j5gEJ1eJgNGu6yuPOlPkEVx21HotpisJl8DrOZav
 DQtZQj9zf9rOv6ECmU2LXL8SyA53zcYg8DS2QSyWgzkE1cAqLdKc9T38GY7+Pd7lBDOjeSvLKDw
 PsPMdbQwlE+S+/QgY+PF3CaJJy54aI29Pi2vm5Q==
X-Google-Smtp-Source: AGHT+IGSJnqZgrQbB3QdwrlGsil39XKGqQyewSEYGrJumv7iqhJ42E56QMbtXdN4iGnh/fXpwaz7BHk39gL1r61Peaw=
X-Received: by 2002:a05:6402:50c6:b0:5c0:9fca:9352 with SMTP id
 4fb4d7f45d1cf-5c3dc7e4a2cmr864744a12.36.1725615225090; Fri, 06 Sep 2024
 02:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240906080928.710051-1-thuth@redhat.com>
 <CAFEAcA9b5V8xY0bOn7VdMUuuhSsBF8xmagYxqhgzAyXbFjLNrg@mail.gmail.com>
 <229d09a5-afbe-4ee1-942c-77e30d629e4d@redhat.com>
In-Reply-To: <229d09a5-afbe-4ee1-942c-77e30d629e4d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2024 10:33:33 +0100
Message-ID: <CAFEAcA_7SMZ=OiV4RbVoDxqKos63iS-7pyqGFCWCcZUXW=JP2A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu_helper: Fix linking problem with
 semihosting disabled
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 6 Sept 2024 at 10:30, Thomas Huth <thuth@redhat.com> wrote:
>
> On 06/09/2024 10.58, Peter Maydell wrote:
> > On Fri, 6 Sept 2024 at 09:09, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> When QEMU has been configured with "--without-default-devices", the build
> >> is currently failing with:
> >>
> >>   /usr/bin/ld: libqemu-riscv32-softmmu.a.p/target_riscv_cpu_helper.c.o:
> >>    in function `riscv_cpu_do_interrupt':
> >>   .../qemu/target/riscv/cpu_helper.c:1678:(.text+0x2214): undefined
> >>    reference to `do_common_semihosting'
> >>
> >> Avoid calling into do_common_semihosting() if the corresponding Kconfig
> >> switch has not been set.
> >
> > This would be inconsistent with Arm, where you always
> > get semihosting if you're using TCG. (For KVM, semihosting
> > is up to the kernel to provide, which is why we don't
> > want the code in that case.)

> > If you do want to do this thhen this isn't sufficient, because
> > you would also need to change the code that generates the
> > RISCV_EXCP_SEMIHOST exception so that it instead generates
> > the "behave as if we don't have semihosting and the
> > semihosting-trap instruction sequence were executed "normally".
> > But I think the best thing is to use "select if TCG" in the Kconfig.
>
> Ok, but I think we then still need a #ifdef CONFIG_TCG here, otherwise
> linking will fail for KVM-only builds?

Yes, I expect so -- the equivalent code in target/arm is
wrapped in #ifdef CONFIG_TCG.

-- PMM


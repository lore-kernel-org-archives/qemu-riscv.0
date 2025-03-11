Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6207AC282EC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 18:41:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ts4Xr-00087b-2g; Tue, 11 Mar 2025 14:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ts4XO-00081k-LX
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 14:41:11 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ts4XM-0005VC-Di
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 14:41:10 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e5dc299deb4so5205575276.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 11:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741718464; x=1742323264; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9Ud0FKd3zeRdaYRZH6CT8xOBJbHe3ZdulDPSR2uTzq0=;
 b=kGvwS/5vCZIsjdM7cAso7iRoGXAmSLovqrux9+PTe6r7ba0mX4jl0D64c+5SpoFILt
 Ctttj0QeFpzutFagCTkljft2lxtvPnxK0bdDv5O92o0scdXNxCfwknmhGv3QGNMBYvHQ
 A0smZWyDj3pg+6VZF4/jHmMq0ZDDRj77b+DYjJiYIDG2Juczx0l6983SCola+ROt+vQj
 aRR1wnledEQrqDodzbO+rUeKD8Tl5NQkN9ZtFcjX4HqEPz4W8FVa6nh+vFvIVfUOBJkI
 iCu+9Ia9dS7BXINyfLfNn0hNxzIY8SQOt9k834bz8S6DaWfqLA6m53xKqZ7rm/3S9pbP
 x5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741718464; x=1742323264;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Ud0FKd3zeRdaYRZH6CT8xOBJbHe3ZdulDPSR2uTzq0=;
 b=lSExuKaEnrJfal5OAj62CE4w96aPlTerBnuKUtqr3ibUlReZmBFG00zaLBO3WLD/Vm
 bDP4pyhxPVmvfZX5suJv8kJAlsB4KoA8euPERRKLcscFDg18K7ARzYHFlQIEKjT3lqZ4
 EpyMmFMvNFyf4C5CVV2umqTiKw2hixLVsoaohU4C4QPRVBJt2zGqfug3uD3ZogEQ/AJ2
 ii1EAWmNJbjAGjVG8+G9T5olVNrNkdpmTmnooXAeJVXeQEhDJqtRYerThs9dlR55zSFl
 Hj7/9nlWJWejn5a50NoGRJwWeWBqQBrV0sGv6rbaKIYOmicIhon818f2QmVBtyoJVCWT
 CB1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrhzcTXBTH2H1kquUsmH6zrzU3I+lM0kn/XqtJdoAWs+ST2zjPUkJvqupJevapbMJ3NnEsR93Cf0kn@nongnu.org
X-Gm-Message-State: AOJu0YxwPp2MBBpCJdJ7l9Xvv4SPQ0rH1Fsu2N7pxtBi9DGnCykqR5jS
 QsYhllzc2wvIcft65STQjrK0/lMXvTeqhUAG/RK7lJo57DrgLZrO29w+iW1fnGOFnbyXmfV7Fhv
 hD/OaWp1RVROjyFEdWNe9DWO71NKO6IuU3aGuvQ==
X-Gm-Gg: ASbGnctPdZArUoZCS/Q0ZPAhFLAzOvCAfeSMGD19uaJBJ6NsOZRoKwIS+VIBlA+Ord0
 4ySoEg2GIpb+E3cNPoLoZ0c8AB8dMouT2rHl2k7A/8XAR7wrFlKvs5lkoLup0jaUPARLDqudZ6/
 tici1tTtHUTZf58JkddHxpTeWlK3Y=
X-Google-Smtp-Source: AGHT+IGuKevcUIvXFEzyP3o1DXyCV+QKcNpVG+elMJi28R5FlAxroa4Y3OmYf0D8Z4dzUVKQTQkCVL5ZhxFg3mv92ic=
X-Received: by 2002:a05:6902:2784:b0:e38:c0ed:8128 with SMTP id
 3f1490d57ef6-e635c0f9194mr25472869276.3.1741718464175; Tue, 11 Mar 2025
 11:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250227073049.32655-1-jason.chien@sifive.com>
In-Reply-To: <20250227073049.32655-1-jason.chien@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Mar 2025 18:40:51 +0000
X-Gm-Features: AQ5f1Jo7nCMLSopVLhXpvlFyjSRhVDC6klkfXYushm7Xc6T7hWrVU6nH8ZDza3c
Message-ID: <CAFEAcA8LPHEmLxDMUNN7DSHCw8pwvA7kUOAH+Ef1mDvOVH-dYQ@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/edu: Rename macros indicating the direction of
 DMA operations
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Jiri Slaby <jslaby@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Thu, 27 Feb 2025 at 07:32, Jason Chien <jason.chien@sifive.com> wrote:
>
> This commit renames the macros to accurately reflect the direction of
> DMA operations.
>
> EDU_DMA_TO_PCI now represents reading memory content into the EDU buffer,
> while EDU_DMA_FROM_PCI represents writing EDU buffer content to memory.

The EDU device is a PCI device, so if it is reading
then it is reading data from the PCI bus, and if it is
writing then it is writing data to the PCI bus. So I
think there's an argument that the current names make
sense.

Plus, presumably this device model is implementing the hardware
half of a defined specification. The authoritative source for
what names the 0 and 1 values of the DIR bit should be named
would be that specification.

Where is that spec, and what does it say? If it says 0 for
FROM and 1 for TO, that's what we should use. If it's the
other way around, that's an error in our device implementation
that we should correct.

thanks
-- PMM


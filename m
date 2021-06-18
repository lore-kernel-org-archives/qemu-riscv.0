Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1luBHf-0002U7-Ck
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jun 2021 05:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1luBHd-0002TZ-8K; Fri, 18 Jun 2021 05:59:29 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:41771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1luBHb-00054v-Mc; Fri, 18 Jun 2021 05:59:29 -0400
Received: by mail-qk1-x72e.google.com with SMTP id 5so9533822qkc.8;
 Fri, 18 Jun 2021 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSFryb9OQwAJBFxM415hEovXQGqqQbP8HEFFcFjtg48=;
 b=VdIlp/AICTPHJJN695lCZj/3ysi2gVFLYgFi91BvJlYz8UG6tDVG9CUXoHAfS6tjlr
 6xj/BHPU9IIxPVl/0vV7hOYH915yMIjp5ThQJIQ0snLuI9jQ+ifT3C/4PmFjhz94UiMz
 fgdDb/2F7xJPr7hHeYxp1K0QiZWrw8CJ1luCRh12RqjfZe6o0gtioGHVP0QzWo9iLZwB
 a5pbrAiZCpwanaIAb0UTz3XeReAF/4ei0zMIeTTSAvrPJ50y9Lh8+0EOBSR2iAyCoCsx
 KTlmD9hI/lOo648St0QxzQs+RwGE/qbxJ8flecLkdB983vzmaEXQHhG1vM/WFYL8gRLH
 snMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSFryb9OQwAJBFxM415hEovXQGqqQbP8HEFFcFjtg48=;
 b=uVUod2NAllcJmJeDMUjm4voFPMlmeymcJ6S/dsPV3+UlT5eZPCRY1GAKK4P6RLi4wt
 EUwUOCdhuPldAn8VmYeHsgYraXX7LCg9SSptnRVMKHVug1FsI+g6ZJFAIHwwNp0q3m4r
 4oGOF3c7SQjeIuiibHMN72t/mAKLHjT9U/foKMpovpMdgJzFK5575xXb4D+/7icqCrY/
 IDWDvXU/c9FoRXCUipNrnReeU+g2aN0lTUS+RaVfMesBwW+hXfaYipK540bMX6DzK6+c
 bdgljVoIspE7DmEE2QhNqzeP4FbXDNdieIqYlSdhNzX8WT9BaBkGLELiaREtaoYD9g8R
 rvdw==
X-Gm-Message-State: AOAM533WoqAcC9qnNGiyS+AGTSOghvHyRJMetzpASdSvhSCHSMN9gonD
 5nIKDJD1m0xPfJ2k8jT7dCoTeNugOGIziplBRaQ=
X-Google-Smtp-Source: ABdhPJyuc2fxE/M+a2R2kVq5Mo8Hrns4aSuARYoEFnNramxncXRwysg/IcG8flxoTCTM4oD+T+GZVd+49ZPmPZvpmNo=
X-Received: by 2002:a25:2e43:: with SMTP id b3mr12014198ybn.152.1624010366104; 
 Fri, 18 Jun 2021 02:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624001156.git.alistair.francis@wdc.com>
 <716fdea2244515ce86a2c46fe69467d013c03147.1624001156.git.alistair.francis@wdc.com>
In-Reply-To: <716fdea2244515ce86a2c46fe69467d013c03147.1624001156.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 18 Jun 2021 17:59:14 +0800
Message-ID: <CAEUhbmUFs2bFp1EqJL9LKEjeCNFqgtdyT29k03gpDBqN=VrOXw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hw/timer: Initial commit of Ibex Timer
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72e.google.com
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
X-List-Received-Date: Fri, 18 Jun 2021 09:59:29 -0000

On Fri, Jun 18, 2021 at 3:28 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add support for the Ibex timer. This is used with the RISC-V
> mtime/mtimecmp similar to the SiFive CLINT.
>
> We currently don't support changing the prescale or the timervalue.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/timer/ibex_timer.h |  52 ++++++
>  hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                   |   6 +-
>  hw/timer/meson.build          |   1 +
>  4 files changed, 360 insertions(+), 4 deletions(-)
>  create mode 100644 include/hw/timer/ibex_timer.h
>  create mode 100644 hw/timer/ibex_timer.c
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65418C61D97
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 17:42:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6aBT-0007mW-PE; Fri, 24 Nov 2023 12:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r6aBS-0007k0-IY
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 12:41:42 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r6aBQ-0006Ou-Om
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 12:41:42 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1cf6a67e290so16519825ad.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 09:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1700847698; x=1701452498; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0doE+xU3LQuc6URq/RcUDO+8m89F+MxaAiNXFDpzIfw=;
 b=QRHLvWDtGjqSPjD79gbjnzJtTykM/EcaKYUX9uKul8yTRLieBq4kXrdaOVJQL3uc6r
 O4a8ZDpvl4iglP4uHbyXzLEWir0Grgt/MYP8SfS/UuVTYL2SWDkmZ3dd7sCROwNMOK7D
 sDl4u/L+u/a1+9gaB2CWghkrwrjARCOzRE7l3oRNWU4tO81uQmPVTeUUiTfsV/j8s+ko
 kcN0iMJ/RuLZo4PjI7TKuUGylzRrmXsAV3lGITGO6prQMBAZE7FcXNvhx//LIsph9XrX
 Aa8p4nEp/ZSGh9vFiEbv38MOGZe51IZ47u4irOjV9zYZCzOgmwA7UZWXcUFh9ULwJIDG
 uV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700847698; x=1701452498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0doE+xU3LQuc6URq/RcUDO+8m89F+MxaAiNXFDpzIfw=;
 b=BgjAAnkYU3zzT8SlJ4V5JbjFhssSnwBcJRbEr1fSqaizeed2Kh1oBgQytHo3P/yoO0
 fqiIn4GTGgurXbI/P8g91LzeAmezKWkToBySQbSInEIjQSxclQQ0crzOIjJkmxgDxWpk
 xYHaULG8q+yGRfcp/mXEh3LW8KV9bNMkaheQr12/4ZmPRa8rJXTwlTGmjB6A6mQFYq9S
 5mSYadJGa+T2WP6gYs64qYGH59nPTfdXCZR0yKPpLnSSylCOBXbFiwZ5v5Rh545OxcT+
 8Uz9cHxB0h7KzRWDl4ZVmju9Gq/ZQrSt55H+OmbDa1gtb9dOCkW/FVDuCBByNhqkcev/
 7XTA==
X-Gm-Message-State: AOJu0YwNFen0IxcqwrP7+eqNx5uoHVDI4lfdTf6+7CEzIWMfml+dSqq+
 2NxBrQUs0O+8rxCBnWo66r6MPFaUZZ/0/RO1s2xELw==
X-Google-Smtp-Source: AGHT+IFroIa6m9vEOR6kCl8od4IepRuFGkhTwMXnjCrPAW5qYu8BHhkuhKHT7TY8RYlYZaITRIJXUOQ0xgR4OG+r6m0=
X-Received: by 2002:a17:90b:1c86:b0:280:cd7b:1fa5 with SMTP id
 oo6-20020a17090b1c8600b00280cd7b1fa5mr3788293pjb.4.1700847698386; Fri, 24 Nov
 2023 09:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
 <20231124-b892dc7ca5a5f9ff4cceda6e@orel>
In-Reply-To: <20231124-b892dc7ca5a5f9ff4cceda6e@orel>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 24 Nov 2023 18:41:25 +0100
Message-ID: <CAEg0e7hy2Z+X7TR8iaQckCHZ2NGyPJV8dioco-FB2aPErMpnOQ@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user/riscv: Add Zicboz extensions to hwprobe
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-pl1-x632.google.com
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

On Fri, Nov 24, 2023 at 5:59=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Thu, Nov 23, 2023 at 07:12:59PM +0100, Christoph Muellner wrote:
> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >
> > Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
> > This patch introduces this for QEMU's user space emulator.
> >
> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> > ---
> >  linux-user/syscall.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 65ac3ac796..2f9a1c5279 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long=
 arg2, abi_long count)
> >  #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
> >  #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
> >  #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
> > +#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
> >
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0     5
> >  #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> > @@ -8855,6 +8856,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState=
 *env,
> >                       RISCV_HWPROBE_EXT_ZBB : 0;
> >              value |=3D cfg->ext_zbs ?
> >                       RISCV_HWPROBE_EXT_ZBS : 0;
> > +            value |=3D cfg->ext_zicboz ?
> > +                     RISCV_HWPROBE_EXT_ZICBOZ : 0;
> >              __put_user(value, &pair->value);
> >              break;
> >          case RISCV_HWPROBE_KEY_CPUPERF_0:
> > --
> > 2.41.0
> >
> >
>
> We should also add support for getting the block size with
> RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE.

Hi Andrew, this is already upstream, just the EXT_ZICBOZ is missing:

commit 301c65f49f9602f39b9f3ce0ad9ff70d4bda7226
Author: Palmer Dabbelt <palmer@rivosinc.com>
Date:   Fri Nov 10 09:37:16 2023 -0800

    linux-user/riscv: Add Zicboz block size to hwprobe

    Support for probing the Zicboz block size landed in Linux 6.6, which wa=
s
    released a few weeks ago.  This provides the user-configured block size
    when Zicboz is enabled.

>
> Thanks,
> drew


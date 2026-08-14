Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C8EC5CFCF
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 05:02:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuk3s-0005Ux-LV; Fri, 14 Aug 2026 01:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuk3n-0005Ti-HF
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 01:02:28 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuk3m-000730-1H
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 01:02:27 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-836ccf53ef9so5284477b3.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 22:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786683744; cv=none;
 d=google.com; s=arc-20260327;
 b=HQKg3Am+ejpe8NEVhZdbaWkBUVTAj4NEkicAnvUP5Xu6EwMTgmV34Tr6fQsGIXawoC
 9niyr2IzD5Gx0qO+8RSGhXexXoC8A4mC6Vvn2prELmtfSHm0T7Nx0hsJoYJPgrxAjZ0V
 KEs3NTRrK+aVsKhIlPyJNDtohLRk8n4h265Z6/jK9mz4keCSLVlOK/46JXYfu+561EBq
 MKmI6WSrf5SlXrKJolYNaiKt9icq2xgHqj+yhAWeaaebSXqQ3K07Zb6sty88owj0mtsw
 c1tTFUf+iLfzG031gML0Stcn21psoiswaRta6V59VnUl7UW0zRnyJk0OxgnueMVhJoPX
 J8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dNgofWQnLPkFtMt3ZXR0GlQHKpzwk0/r/K0KUvcZom0=;
 fh=hfWgyKtApfcVzP8A6JVezReLN8nzYooFbZFDD8TUi0c=;
 b=SFJxYmIWpfke99U6UMV9sO+AWhfi8jc2hAUrCZMFLWLgRq53PUDYOT4bVI8PlYSJHx
 1BZtlORD/XimVPDVywMK+4OBeD7TrFGHdc+lFe3VNvUPyivUTL7flaR3l5jStqZNu/pD
 Ybpicf+Q9zZ4X1uH/4+BS5hiwn6/rp/rqZYKNybZvXZnfS6q/DBqyPsfpJoDSh5vL/o7
 0oEdBXYvAHv2mvtKSoxEJHM9ZLLMP3o49ehyUInnhBWJzBcamwc6Dlt9MNgkLIY9CaR0
 SsSQc+8Qi3pqH9BwvJiZVvr959qqe3bq1zCFI3V9/FN8QYqrg6AOS76E8ICrRreKYk1C
 bAJg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786683744; x=1787288544; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dNgofWQnLPkFtMt3ZXR0GlQHKpzwk0/r/K0KUvcZom0=;
 b=mjY/wssPD3mS2qIGkkn0IJMyWGv+DEiEecemz4VzwD58+V1UZiEPiD1mILphpAinpF
 nWd03b6vdV1MnnteVIY+/7g9bUexpbuA2z8fbMZlNLxy40SxPIjtI96sWpnsGB5zKn5/
 DbA97RF51vvwndOBYFBUsiQqoTFD8eIqb3MUDw8Q88ZjPXRs5WLsfNfpnuct5sUJgmpt
 Hjkk0vEgtP68YFwcrkWtSWnEp9crh3a6OqeQACmC/ZrunCtpAFDHyODL1LGClOMk0kq0
 tT2fqmXM91nUOdbZ5hEa40JE7U96mape7i51Tqe5EiWcpPQoqGvNjOKCOg0MQ1nCsQxC
 3f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786683744; x=1787288544;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dNgofWQnLPkFtMt3ZXR0GlQHKpzwk0/r/K0KUvcZom0=;
 b=P9zoC9/1RWgGzkcfRm1i5vP4bYtZBlAg1ITQvzhm9loWh5A3c+szW72fNMCIjqwEpX
 DTusEL7itWM0T9hw9eiLtngCK1/DCZz7+GmEpVelI+noh0RpuG1C25Smwn6czA9d+l4L
 S0QVhiVK9vj+UFe1DqJpXE5CSYkexeTT7RXvx4sv+yAxWQr7fWbtmnYmqBG5BrQ6ZYoA
 I2m6J64bAsbRpCrI7lLp8X1aUaKkgo+DrZEOltCgDSCFiQ4lU/lGCsdQflXh7k1oqzfm
 BC58do685nG86/DCxmJoTyVHvuCwbVAKQVtULiLSQ/STqvOuA8s2MyPT/rz4ovHXxqGy
 3WMQ==
X-Gm-Message-State: AOJu0Ywop/ojMi6itjFZi66129YERHFtjqLDOFtn6rBD9zqgIeJEsWmq
 9Ec6zzqPmEQyDrg9fOxYNRzYJANP0Fjg7ibCd+iLqobVxglnG27F8FCzun/wfvj/rW9uYsogIM4
 DZn4L59wjMypxU335hqIH0ifx+NbCilM=
X-Gm-Gg: AR+sD12/s2xK025OIm0FkV/FelYaOyzx/uBczLnMZxCyIu8Roc8zqnYd2JLBE6zFtRn
 WYHzR/mvZiYdZa9KmmlDTZyRipCPqAhh1gPoJDlBa1sHZQ7jgak1brfg/fi7ZdgjGoQuy4szl7V
 Csh+8vYRylY1zQQQVBOXAzX1oRIAEOyMNJSQyAv6Eyy4Qi07uM1fqaxMaITg8x6sSN6TEz/+ugT
 quSR0drDJhE1ZTdLDiJaSpfSFE9OZULg7jIzzcw7WupEIeR5glkPKXpXoAriPp88Wik8doCnj5t
 KB1bn7k7r5YtiIaMSpYpCy3DTYCR+KmCm2v97hRHEBL8QIUQZYKo4g==
X-Received: by 2002:a05:690c:e68d:10b0:80c:ebd4:762 with SMTP id
 00721157ae682-8370ce2c2femr9822057b3.7.1786683743651; Thu, 13 Aug 2026
 22:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
In-Reply-To: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Fri, 14 Aug 2026 13:02:09 +0800
X-Gm-Features: AUfX_myBIojZkn2bltD2j2WChdyNcL_vfYBIdsklq8O1tGfhj9-ZGUGaxOv7uIo
Message-ID: <CAAW0U4azckLqyWEy=bGRH3Js8AOeW=rpN2+rgkhVStzC0Jv5mA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/riscv: Add K230 DWC SSI Standard PIO support
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bmeng.cn@gmail.com>, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Kangjie Huang <flamboyant.h.01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Kangjie Huang <flamboyant.h.01@gmail.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=889=
=E6=97=A5=E5=91=A8=E6=97=A5 02:30=E5=86=99=E9=81=93=EF=BC=9A
>
> Testing:
>
> * Built qemu-system-riscv64 and the K230 DWC SSI qtest target.
> * Ran all 14 K230 DWC SSI qtests, including Standard PIO modes, register
>   contracts, interrupts and PLIC routing, and Standard SPI NOR reads.
> * Standard 1-1-1 transfers were also exercised manually through the K230
>   SDK U-Boot and Linux SPI paths against the attached flash.
> * git diff --check passed.
> * checkpatch.pl reported no code errors; its MAINTAINERS coverage warning=
s
>   are expected because this series does not modify MAINTAINERS.
>
> Suggested-by: Bin Meng <bmeng.cn@gmail.com>
> Suggested-by: Chao Liu <chao.liu@processmission.com>
> Suggested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Hi Bin, Chao, and Anirudh,

  Just to clarify, I added the Suggested-by tags in this patch based on the
 concrete suggestions during the v1v2 review. None of the tags was explicit=
ly
 provided by you. Sorry for any confusion this may have caused.

  Thanks again for your suggestions. Looking forward to your reviews!

  Best regards,
  Kangjie


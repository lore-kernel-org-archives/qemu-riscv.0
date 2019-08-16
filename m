Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyclT-0003gI-TQ
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 09:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclR-0003d1-IL
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 09:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclQ-0003mM-HP
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 09:59:33 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:42880)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hyclM-0003i3-NZ; Fri, 16 Aug 2019 09:59:28 -0400
Received: by mail-ed1-x542.google.com with SMTP id m44so5188054edd.9;
 Fri, 16 Aug 2019 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rIwiC4qbY3bqYq0SjbeWTlEQKmrs5ap8J8fc9Sr7aPE=;
 b=U84EafszFs9vz3Kry3Jv8LJ4o1qbzGaqAZRarL5J10+jjR/xFb7TFfQBrYwQ8Hk8BV
 6BcSYT2P4+wj1rqe99kOgPIfSqcbnFMVfWepav3PSZuPtJ0iWAOY9edWyH6Hc9jDSe8r
 nVQIA+NpcDa03Lv4HtuC7QeQ52gIjZNvQ2w8FkT90hFjQ7qiVlCKotxdU5fgOI7nLLxm
 Y4xNdJjL28cVRgjAOBd65YSTf8RbMLUxh2g5qgVcAg7iE583XWA2BmE83laIF9pBrWpJ
 RyzPX0icEtnEmFAwFj8z1ZLhoFTyUbH4yEPaWOp1oVO0cyXVBF9/YVRUholt0tOKg7Ta
 GxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rIwiC4qbY3bqYq0SjbeWTlEQKmrs5ap8J8fc9Sr7aPE=;
 b=lCq/GxNl4rattcHjwo/BOKdGXCeBV5ZL2yK2kI/tl4EUDRt8MpB3TjLvqTqT5VnZOy
 nBUSptFpKsv0qJvZbhhFBbfl1pjKwnrPwI9ffp2sB9Kaf5H+rkHQpiSFxEiBjsZADgex
 +KW29UZ4C3Tu5MqcB0/BJazyE0BvUD1WpVWcN+N60M055TIiiDhA0b8NCsU9Hp7mfU1k
 0X7JNvKV5uVg6ZcW3U7w3BQInqTUwFoGhUa2qD9MUDwV30sk80GTFNR2XsPRRr0L4rnA
 iszP1sb+xVulKT80WhlPKslTo+FHmgrEIgxCNfN3h8ovsO8Wjee5T92ck2vGEBHgejQC
 1tKw==
X-Gm-Message-State: APjAAAUKz8GMuf8flBlmF/C4KRjg4+D0BcRdKJj8/gEdi5II9dySe5Yy
 f9mB5CzkWw8LwU65+0TuUYtSTrkSgaYrOot/svA=
X-Google-Smtp-Source: APXvYqxNiNFkSJdUl4hFsGonGLqk8sYHnk3wtSoGcDKJqGUadHgP9DHtK1eepaPNYpJ3yUCt+Jgk5bwseBiVgttjEP0=
X-Received: by 2002:a05:6402:128b:: with SMTP id
 w11mr9331242edv.182.1565963966918; 
 Fri, 16 Aug 2019 06:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565904855.git.alistair.francis@wdc.com>
 <59bed3d7342ef7513a60285e2711c162be5559fc.1565904855.git.alistair.francis@wdc.com>
In-Reply-To: <59bed3d7342ef7513a60285e2711c162be5559fc.1565904855.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Aug 2019 21:59:15 +0800
Message-ID: <CAEUhbmUZ8Vjaqc9mOE0O6KhsUF2-nGUM+YVymSnez6Dh449Fig@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 4/7] target/riscv: Update
 the Hypervisor CSRs to v0.4
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
X-List-Received-Date: Fri, 16 Aug 2019 13:59:34 -0000

On Fri, Aug 16, 2019 at 5:41 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Update the Hypervisor CSR addresses to match the v0.4 spec.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
> ---
>  target/riscv/cpu_bits.h | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


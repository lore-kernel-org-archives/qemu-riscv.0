Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwi5z-0004VE-Pe
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 03:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56004)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwi5x-0004SW-Jm
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 03:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hwi5w-0006mK-Aq
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 03:16:49 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:35924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hwi5u-0006kL-IZ; Sun, 11 Aug 2019 03:16:46 -0400
Received: by mail-ed1-x541.google.com with SMTP id k21so100654032edq.3;
 Sun, 11 Aug 2019 00:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ld6PszFT0O+amH3KJepQ+12+Fy35W2GOiLV4MJr6xq4=;
 b=P6BBuV8opZVwY+/XHBVwoDyt9A3PpNaKSXBjvq1HmrR4bkwcxei3OtArE3P0e6FjSs
 K8m04RkxsCNDn3EttB9iGiTdm6jH6PDD/blFVKYrJ2cQgr8zSBKwD6ttfY2y0vYEPVo1
 WqIgRpzPATHHSlLQOz6yXcYpOf2Uky2EZE8k6SSK+stjOIU4TVwZslG0lq2MnUGhlvo9
 oMPzZP+/absdaSWgSKHRrHWf3ABDKkogy8ruiOOle4gsrXnT+wW/8Ex+Y+EgcAqnxoT+
 ttJ9RtjQ/N2oLLrnUESeP4A3hPWNBBd45/903RXENZP8bB+ZQ6cae5kKT9KDGrAFAEFY
 UFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ld6PszFT0O+amH3KJepQ+12+Fy35W2GOiLV4MJr6xq4=;
 b=GLTD9Wlh1pwSzFwTaF6JmvxldoC3HME0eq+inTs8q9W5bF1idbfzKbV8i2jClzAlT1
 80axZ/WQsdWdk0QCzMko0BZa4rFo3zMFyFmZmpq2INDt3zP5UOdrP4LFBOy2FwCboLqY
 3J/+oRdEU9pFNeaQRYALQxIQMpzyUNDCYrbOc8maW367ePsllJZlVYJm4jk5XzL3DrVn
 2Il/xelTLnTiN7lAfwXMNxqXOp4Wx7vt+R0BPMrBAXrex0Nm0VWeyIZNdideJfekcT4N
 fC79tLkD9/eC9HlenfinTnFlILRv/7WdsptekaHljfE1zYljfH7rnaEVN2V9kMnc/Tot
 uAHQ==
X-Gm-Message-State: APjAAAU4UqXn1jjK8Cqwp/FTj2WvSXflX9UCk+gfDbUqDJGUNCujh5fe
 /7xlM6veJ/9nS3zCJBP1k1WBQjznzpo2O+lDsdw=
X-Google-Smtp-Source: APXvYqwBQlmho+CctWi5TatiUYAYTBmydD2XsHefh20Y1LfZ9KpP0zgirUfmCgcwvR+Hcy2ayDSgz1MSeJokBFiOjvU=
X-Received: by 2002:a05:6402:14d6:: with SMTP id
 f22mr10992812edx.180.1565507805037; 
 Sun, 11 Aug 2019 00:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <1564812484-20385-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKPW-nMc2zV-VwG_sY9ca7uSenUJW+mEcV2qaKT5dELmgA@mail.gmail.com>
In-Reply-To: <CAKmqyKPW-nMc2zV-VwG_sY9ca7uSenUJW+mEcV2qaKT5dELmgA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 11 Aug 2019 15:16:33 +0800
Message-ID: <CAEUhbmWwkMR4xKu9v=10ePj=feJ7b7e5Ko75zv1xMBf+JrVwwA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [FOR 4.1 PATCH] riscv: roms: Fix make
 rules for building sifive_u bios
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
X-List-Received-Date: Sun, 11 Aug 2019 07:16:50 -0000

Hi Palmer,

On Tue, Aug 6, 2019 at 1:04 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Aug 2, 2019 at 11:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Currently the make rules are wrongly using qemu/virt opensbi image
> > for sifive_u machine. Correct it.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Good catch.
>
> @Palmer Dabbelt can you take this for 4.1?
>

Is this patch merged for 4.1? Thanks!

> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>

Regards,
Bin


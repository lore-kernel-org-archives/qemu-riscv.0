Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hx5qq-0000lA-H2
	for mharc-qemu-riscv@gnu.org; Mon, 12 Aug 2019 04:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60490)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hx5qn-0000kT-Mm
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 04:38:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hx5qm-0008Qu-Sm
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 04:38:45 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44122)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hx5qm-0008Qh-OC
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 04:38:44 -0400
Received: by mail-ot1-x344.google.com with SMTP id b7so105731291otl.11
 for <qemu-riscv@nongnu.org>; Mon, 12 Aug 2019 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rt4wMHJ1FkT8oaLcosvpZeywUxaWn5M/xN0sWm1YguU=;
 b=QMDJ6Hh1HIZvEpOscypa2a+AKzxcqcfYRf4D4Wy58HzifHq5FnC4NSdXd2FsFY4Y1g
 JJBRzWaIliSIHwDlbAO/mmQBrw7N01WPhtI9T9WI/hnDQceAeejPWyoaYhY6XBNnYyJ0
 ob1y6C/V6kZZDKktq3T7bIaEVQoN6OkChXPWNtLx4xkemKRfwJ5vCf7G19fB7NCotjPE
 1QmSvcBT+UaNB/13Ol/zS9uZQYaH9sjLKj49ki5akEB39xlI/+q79fmV0ihVHjgqA4o9
 dFtie9MpSvztDypGUT1wvwv5WBdSudxeNtGHCRPmYh8q7QVku3rJkMCEAV4F6J1rY1h2
 E1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rt4wMHJ1FkT8oaLcosvpZeywUxaWn5M/xN0sWm1YguU=;
 b=j7sSeL6XWHsf+M6SKdUgAeIABv9XCng377YxbudkPzwARAZMjI5m8f5zv0HfabN5Nk
 W2KQHB6trYOUiZ9rSeFQF8CKcAUvUl7n2CWb06rV7Z5Yy9jU3Pc1AX9lwYB6gT+9Arfa
 1SA4Zpq9Zon98b6hww9N6khmYHjwbG6h4Ckjv7Is2kgfEz1g2AHX70Hbr0uHLmJS185m
 w13O/EddptThsuKFpYYvc2nvSrYCooGUJx2Ly+pEClpS4H3bvrEdBKflxy1Whe6Y5rfU
 yA8Hi/1E8+YkLmpANoH697vknF/oUybkrPc/gWoLKzXdYFE5pj/odw4hfjVwDgZH0Q4c
 n77A==
X-Gm-Message-State: APjAAAU1dZnsGt4rL+xp2rugOgFQMUh/vO6420gnfu8MBYOY/90476j3
 jrMazc+wxGiXZpXm+KGxDVdMjwy1N6vb0UtUJU9CMw==
X-Google-Smtp-Source: APXvYqzYL6YIVtwh8OyWtbKZeqLJJ4FA9RNyh8Q7x3lXqSrM+xVXWXJXVN815UVstS59xsLs3LZ0QZ8RluU5AOjCK0A=
X-Received: by 2002:aca:4bcc:: with SMTP id
 y195mr12706070oia.146.1565599124103; 
 Mon, 12 Aug 2019 01:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <1564812484-20385-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKPW-nMc2zV-VwG_sY9ca7uSenUJW+mEcV2qaKT5dELmgA@mail.gmail.com>
 <CAEUhbmWwkMR4xKu9v=10ePj=feJ7b7e5Ko75zv1xMBf+JrVwwA@mail.gmail.com>
In-Reply-To: <CAEUhbmWwkMR4xKu9v=10ePj=feJ7b7e5Ko75zv1xMBf+JrVwwA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2019 09:38:33 +0100
Message-ID: <CAFEAcA91uvheC1gdu7DZSkaVtgA3Laoob6G+bQMQOdfsQj9aSA@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-List-Received-Date: Mon, 12 Aug 2019 08:38:46 -0000

On Sun, 11 Aug 2019 at 08:17, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Palmer,
>
> On Tue, Aug 6, 2019 at 1:04 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, Aug 2, 2019 at 11:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Currently the make rules are wrongly using qemu/virt opensbi image
> > > for sifive_u machine. Correct it.
> > >
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > Good catch.
> >
> > @Palmer Dabbelt can you take this for 4.1?
> >
>
> Is this patch merged for 4.1? Thanks!

Sorry, it doesn't look like it is, and it's now missed the
deadline for 4.1 (only critical showstopper bugs and security
issues would go in at this point).

thanks
-- PMM


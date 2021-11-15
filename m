Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmcce-0004Ym-Cd
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 09:06:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmccZ-0004Vd-FS
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 09:06:10 -0500
Received: from [2a00:1450:4864:20::32d] (port=44825
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmccV-0000Kg-7d
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 09:06:07 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso12552875wme.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Nov 2021 06:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RY2hRT48gdZJuYsWLkZG9JkbwGwmtcjgFQte940q5f8=;
 b=VNjBZgU7EsObm+wER0S9dsO7xHS90Ov9HOVnkMtAlQO+HKEMZNUxrXvtVytz58f0bp
 YMaBTWe12XsEAlFBy3Y2jXxONJk70Xa9d1gCnoo7rs3pX1ctzWVdxHl4byL933FtjSRg
 zL8e5PNqXlpWVnYKlgLywQgmiLHWv9sEmIPgjGDb62+gHpKRJYsEiON8URzwB/94EukW
 fR01RFouBgrxvl8J//Cj04lOehafTEZfLjSAB1mxk5MB6tF1wzkTx0jY7Sb06hSjAv0g
 zo0TnnZZQUm79At/6aW68hgASL6VbCT20XhGzCtDm6Hv52QqmhgAQusfNKcETL3F2QlS
 HpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RY2hRT48gdZJuYsWLkZG9JkbwGwmtcjgFQte940q5f8=;
 b=iD0JqKSmvfLr07urn2p/hiFdQekb/saGxHRR9YwfqohpiXGLeG1ysG1/V9KyFR2Crn
 ef6ZhqkZD8IHwh/jhD2LK6014ziNJ09+kEieqCJWNrdUTraJhfPaZrAfHgsVP559CENE
 g9YOQfZCJ69+aiRhuSqInNtI6ymLju0ofROSKuk4T5ZdYFweRgVtiYohZZ191B6Y4jW9
 DcBkGBDRuxmbFtbHR6E1Pehtr8dLke5bSoV4y+cNjVmE0xe6lbi+V0/n8woqQhYHMKBn
 d3klNhMqryYc1JgoO5IKOfG6yfzMAhJ8xrBDLms28XUqYvKjET2PsD0q+u9rFDwil4Gv
 XyXA==
X-Gm-Message-State: AOAM5328Vh8E6+iSZgFF4mogfR3KtvXY6E2K6kCHZ/zcmkeJCfwyYSXC
 PG7AgRzlr3bNKpU5IwjgonFrPx5OVZdWOk28Qj6r2A==
X-Google-Smtp-Source: ABdhPJx5Q/ZPhHDSmq3RV7gMXNgX7lSWzoOrQrxBHMxKYvs0HgoS0+obST+9nnwIL8wrjb9T62PmCLvNTsjSdgGd5DA=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr60223753wmq.21.1636985161288; 
 Mon, 15 Nov 2021 06:06:01 -0800 (PST)
MIME-Version: 1.0
References: <20211115125536.3341681-1-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 14:05:50 +0000
Message-ID: <CAFEAcA9gQCQv7XENgT-ap+2qhiggZTt-yEHQ1WJ6__5hHRRU1A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Eliminate drive_get_next()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com, clg@kaod.org, 
 andrew@aj.id.au, joel@jms.id.au, b.galvani@gmail.com, jcd@tribudubois.net, 
 andrew.smirnov@gmail.com, sundeep.lkml@gmail.com, hskinnemoen@google.com, 
 kfting@nuvoton.com, nieklinnenbank@gmail.com, Andrew.Baumann@microsoft.com,
 f4bug@amsat.org, edgar.iglesias@gmail.com, alistair@alistair23.me, 
 bin.meng@windriver.com, palmer@dabbelt.com, atar4qemu@gmail.com, 
 mark.cave-ayland@ilande.co.uk, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 14:06:10 -0000

On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>
> This is RFC because I'm unsure about the removal of
>
>     /* Reason: init() method uses drive_get_next() */
>     dc->user_creatable = false;
>
> in PATCH 1.  Both users appear to wire up some GPIO.  If that's
> necessary for the thing to work, we should just replace the comment.

Looking at the code, it sort of is and sort of isn't. The GPIO line
is the chip-select line. If you don't connect it then (because the
ssi-sd device configures cs_polarity to SSI_CS_LOW, requesting an
active-low chip-select) the device will always be selected. If
the machine created an SSI bus with no SSI device attached to it
then in theory the user could create an ssi-sd device and connect
it there and have it work. But in practice it's really unlikely:
machines create SSI buses with specific wired-in devices on them,
and the guest OS knows what it has to do to enable the chip select
for the device it wants to talk to (often some known GPIO pin on
a GPIO controller).

So I would keep the user_creatable = false, with a reason of
"user should wire up GPIO chip-select line". But see below for
a pile of contrary precedent.

(The chip-select GPIO is created in the parent class, incidentally.)

> Aside: there may be devices that need manual wiring to work, yet don't
> have user_creatable unset.  Bugs if you ask me.  I don't have smart
> ideas on how to track them down.

Me neither. I notice that the TYPE_M25P80 is also an SSI peripheral
with an active-low chipselect but that one doesn't set user_creatable
to false. TYPE_SSD0323 also is user-creatable and that one has an
active-high chipselect, which means the user can create a device but
it will then never be usable because it will ignore all transactions.
(More generally, looks like most subclasses of TYPE_SSI_PERIPHERAL
don't set user_creatable = false.)

-- PMM


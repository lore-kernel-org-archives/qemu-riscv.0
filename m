Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNNTB-0004fq-Rf
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 19:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNNTB-0004fe-0B; Sun, 14 Aug 2022 19:56:37 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNNT9-0004gY-DC; Sun, 14 Aug 2022 19:56:36 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so5468967pjk.1; 
 Sun, 14 Aug 2022 16:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=UtZLRVi7vFAr4yDmH5urPRvOjkJo0aeqHbD1nZ3tyoE=;
 b=bzBH9fsp9ae6LRFoL/LtaHSbj7G1zGxhSSPxXZ5HEXy0CcqDS51+7M9UrM4r+jT8yx
 9kk7aIH6X3R32zQYBxUo5fjq0kNa31OSqOIdtk6w6+XpuLVtZ3/C9kBCGAs0DHlks3AH
 oIippF1mZhlFRIfUz7hlNklqTWm4oUw2SocVq3y/qHY4z8F9pzBzV65KguTcRup59iyS
 D2PeOu4YdFvC2RvYY3nXjw8KZ0p8O/cp4jgWLEqP7066gvTS1V85QzF1j4LnGZutToAS
 iEEelF6+RJNO5zkivPV9feWAJ1sxY291TvUbvZw6QrqDdcQcxLYxfdwUCoDO/SCmUUM6
 t0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=UtZLRVi7vFAr4yDmH5urPRvOjkJo0aeqHbD1nZ3tyoE=;
 b=JST/MRCN/KdAnzp2p6VqMxHHt3GUUp7yTOkFBPVflrhzWkBuBXzmAAAydZg2FJZqwb
 Yf3E94M2zBEKSfdnaA+Y701ODStEdPdDYRkZMBxBZf4en5VDKbrIlzj4qy+qDmprOsjC
 EC4mDfRV/TOPn/jT1eYRx/Ex86EylgkamQEeNQLkfkCHNfULiFR4eFz8VxT9RxFMSHNs
 mmEvGqAgKVt+hWnCLiLI/uSU/JwlfvZZE/cnPt5++8Hm9LU9nEwq2YzlV2lRR89hJ9QD
 GRChbuGX88QUmky/j6AhuWhJECmPru4IcOU4tKZV0LPAmO2TBlWossyJW1tjCNM7XPJJ
 88Xw==
X-Gm-Message-State: ACgBeo1biAD7cXYhYBrPfrKjcArLt36TfW0pC6fHnIs8qYAuL2Aci/pn
 ihjc04hP1G/r8tGOwbSKAsmdeRdSCbws+hdkaN0=
X-Google-Smtp-Source: AA6agR65jdm+7uO9XVK57nTvI3U6n9crgHpZcI68KeZxNBO0w+fCCrQdvr3QxjGmEttZs5BQnUecwZ+X6O00dMJ33og=
X-Received: by 2002:a17:902:d4c1:b0:16f:8311:54bc with SMTP id
 o1-20020a170902d4c100b0016f831154bcmr13614227plg.25.1660521393502; Sun, 14
 Aug 2022 16:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220813135127.2971754-1-mail@conchuod.ie>
 <CAKmqyKMoQgpEcKSLuLrTT-bbeiwzySNSaeHt12Ou+wuHf7xzpQ@mail.gmail.com>
 <2dd018bb-3026-49a9-3938-3bff62a31179@microchip.com>
In-Reply-To: <2dd018bb-3026-49a9-3938-3bff62a31179@microchip.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Aug 2022 09:56:07 +1000
Message-ID: <CAKmqyKPVee_0WadwmWEgpTONHrGkstxDVOVEy6KdSLv=DVYnUQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: microchip_pfsoc: fix kernel panics due to
 missing peripherals
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Conor Dooley <mail@conchuod.ie>, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sun, 14 Aug 2022 23:56:37 -0000

On Mon, Aug 15, 2022 at 8:48 AM <Conor.Dooley@microchip.com> wrote:
>
> On 14/08/2022 23:08, Alistair Francis wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Sat, Aug 13, 2022 at 11:51 PM Conor Dooley <mail@conchuod.ie> wrote:
> >> QEMU support for PolarFire SoC seems to be fairly out of date at this
> >> point. Running with a recent HSS, U-Boot etc doesn't work, partly due
> >> to the unimplemented cache controller that the HSS tries to read from
> >> (it needs to know the ways configuration now) and the rest seems to be
> >> down to 64 bit address DMA to the sd card (not 100% on that yet).
> >> There's some patches floating around internally that supposedly fixed
> >> things for QEMU v6.something but I could not replicate & they're fairly
> >> conflicty at this point. Plan is to clean them up, but no point sitting
> >> on this patch until then as I have no ETA for that at this point.
> >
> > Awesome! It is great to see Microchip supporting open source projects
>
> Better late than never ehh..
> As I said, no ETA yet as I don't know just how far off the sd card stuff
> is, but it's in the todo pile. In the meantime, I'll keep an eye out here
> which I am ~certain we haven't been doing so far. I've added QEMU stuff
> to my build/test scripts now that I've got the direct kernel boot working
> for me so hopefully once things get fixed, they'll stay that way.

Great! That is good to hear :)

Alistair

>
> Thanks,
> Conor.


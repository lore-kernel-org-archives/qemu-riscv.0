Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3qZ9-0002Xk-JB
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 20:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3qZ3-0002UO-37; Sun, 24 Jan 2021 20:21:09 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:42275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3qYt-0001pQ-Ry; Sun, 24 Jan 2021 20:21:08 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id b11so11755944ybj.9;
 Sun, 24 Jan 2021 17:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tn4n9t1So1fss2GqIvU2k+hDWGc3NbMMYBG45LaWWNg=;
 b=NQS1FgEnxiszQ29LS4PhUBGkpWUohkma5i9nXkAaAGSBuD8DyTy0/UVB+g25WjXFMK
 eik2NsmPdUXOI0+DPsDI7+IfJy8QcZFBJgmiwgRSMRevHDEng1Dh+Ingn/mg8GxGJnw/
 lRQQ3MGRA985zaFMhOeHkrYiIK4oZOYqUjNCSNxGYDZ4POfoWZtCnbgms4k5scgMtehu
 bG95ni/VvwU+w9V4DLrmP21Po/+awVOP9eH0MN63mM24w/RZtwbbnAYEl9wFaepPv4u+
 32pidmqshFQhcRSn88y4+uxChdz5FTjw9D2UZ+BTOwXfjd+luVcqPLo3Dr+SDgvV+//K
 6EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tn4n9t1So1fss2GqIvU2k+hDWGc3NbMMYBG45LaWWNg=;
 b=SVHA0jKvftvgi6mX8op1qj99JV1TEzPIpkc04XVenl2mKLYCYZo8dN0hCixhZIkM8p
 errzKPzphtuyrHwbp+pgFClzEhN9TJwW1Iw1C7v16BmvPB/PkbkF8ydiN1iOyKX71Hal
 zUoMz6lOcTmAL6hY7yGCUU9YwX09J19/ufxAqlq4R0LffJj1O9Vvu2pnAyn+Wf+lzcTA
 vpQ2CbtTFDjkU2u8ASYaSplAsig8w2Na1UcJOjJpRJiKJWMJ8i6A4Kvhn9UNXlsCcSSm
 1MirhQPkFxyLdf1K5fFgEY0p7hsgHKBUt6/6gT2JFpAucwHIoiRTO/0dnWpNktyd0bCp
 gHUQ==
X-Gm-Message-State: AOAM531udM4lje3FobOVuEVi7vEGk+elW6/kiHI5CcUOlbAsdyBHO7Na
 xfes7Uk3Qpn4zqk3JgLI7pHRqsUF8ILICfWlka0=
X-Google-Smtp-Source: ABdhPJxutKDnbdh16UcfjemipOPkuIYtEkRnI+LZQjDIV/Cdrij91MTbIYlcCzStdLAxLd8WjAsxLuTt+rogkBaBBKs=
X-Received: by 2002:a25:2041:: with SMTP id g62mr298327ybg.152.1611537657965; 
 Sun, 24 Jan 2021 17:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-19-bmeng.cn@gmail.com>
 <634d629a-999d-b1e2-28dc-f9b49f9918a7@amsat.org>
In-Reply-To: <634d629a-999d-b1e2-28dc-f9b49f9918a7@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 25 Jan 2021 09:20:46 +0800
Message-ID: <CAEUhbmVaeMeOcACyKg7q6dHVn+Pue7eKzu0RW7mGx5PQyVWg=g@mail.gmail.com>
Subject: Re: [PATCH v2 18/25] hw/sd: ssi-sd: Bump up version ids of
 VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Mon, 25 Jan 2021 01:21:13 -0000

On Mon, Jan 25, 2021 at 12:59 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 1/23/21 11:40 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > With all these fixes and improvements, there is no way for the
> > VMStateDescription to keep backward compatibility. We will have
> > to bump up version ids.
>
> Unfortunately this breaks bisectability (think about downstream
> distributions cherry-picking patches individually).
>
> I don't think there is a problem increasing 2 -> 3 -> 4 -> 5
> (Cc'ed David in case). Could you respin increasing the version
> on each VMState change?
>

I definitely could be wrong, the reason I posted a single patch to
upreve the version is that, I was under an impression that in each big
release (like here 5.2.0 -> 6.0.0), the incompatibility version id
should be bumped up once.
It does not look correct to me that in a big release we bump up the
version id for 10 times.

Since this is a series to fix issues in the ssi-sd, I don't think it's
practical for downstream to just cherry-pick some commits while
leaving some other commits there.

Regards,
Bin


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mewac-00007r-FY
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 05:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mewab-00005f-0N; Mon, 25 Oct 2021 05:48:21 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mewaS-0007zK-28; Mon, 25 Oct 2021 05:48:20 -0400
Received: by mail-ed1-x52b.google.com with SMTP id 5so24212711edw.7;
 Mon, 25 Oct 2021 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l9Mb7xrUw5tmK9FC0zY4WPRtuX0enKpxN6T2u3KNfg0=;
 b=iHqVaQSMZSC5+L+R+v1FOx8kwQ5o/Rdcfr6jiLyntpyiVlG4DldR4p9WuecQoVeRYi
 yD/10YAvBlSrN/dy8bsphCcnWMKOBVpoN0OPuN8ezsp/VVu5BNOamymzwpkkbgof+sRn
 ieReHaEEgSZLrsv5X7NGY30tsZO/JzdCyl8zL1lTIRjX93xI3RoewQLdEAubw8oyw1+Y
 gqC4IMY2G/A+c/GSx9+6PAnIVtf14UhvyCBG84nqgKHtP7BDYsjzaQxWKWnykluBRtGu
 oXdKw6qoWGo/RUQsPwQM1j5fjewU1DyPYk2YfmcBXe7OmLgVINeNQRmjeP+bqd9H0W/b
 8zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l9Mb7xrUw5tmK9FC0zY4WPRtuX0enKpxN6T2u3KNfg0=;
 b=gYZ0D3BB1vVjBiAxp2ky436FTAZHl2HwsdvVvry3O8cw5fbkVtVVnq+mUcPnlO8EPW
 DF8HAf/59deU3rZmSjZNLAyCGNlPg+kZRR3UKNEgvxr0bvWTfZL3E3rtAijWINvj6dsh
 rCLc4+v+SXgeI2rcNb9eLC0Qw8z9gASeIEDm3PARKvNqrtm7XWL7Ojw+QsDV20vO0KC/
 cJd5lWk4V9klSQPAm6QZXVy4bhD9OW74oSjHrgviN+RTFrkhvgq26gK4hAxAYimZObgi
 9w+rgAdfU7SabTC5us+4dLh6RdoY2c/NWJKZi85o8uJj2A916QZkZgwwHyQ5uctiKgZU
 MVUg==
X-Gm-Message-State: AOAM532BHIzlAJmOVjv6nYGVDqhPsFVAnIbrxGBFL0C++6dmnWMtie/e
 GDYKF7hXV1T3KYCQCzgVnQJ1YqDIZBCZiY3qh1g=
X-Google-Smtp-Source: ABdhPJw6huN9Vbsa/hwULyMl9UaIUfRi/usf65jTiNf0RwngjcXWKLHQIkdZaGbEG4AB8dQSuyoXwk2UdMSeyGJ9q6Y=
X-Received: by 2002:aa7:ce83:: with SMTP id y3mr24237482edv.43.1635155289448; 
 Mon, 25 Oct 2021 02:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210522154429.361235-1-josemartins90@gmail.com>
 <CAKmqyKNSG4ACk-QQ9_0XzAXWr_NPE3sijxbs+6Kz3J=N_k+LMw@mail.gmail.com>
 <2e3c4d2f-475f-4d02-6be5-a89628cd6815@c-sky.com>
 <CAC41xo1ftM_WcjNOio2ii-BtqtDh6RTEvsmwO69GU6taOCzYRA@mail.gmail.com>
 <CAC41xo12s+uHEyLkc6vO07iBAC84o6aHBFFdqxDm3NQjBYjuAw@mail.gmail.com>
 <CAKmqyKMb-VNiQZv-ZFeCMwPQ3hkm1ODn_w55pGdBgpxtwg8tnw@mail.gmail.com>
In-Reply-To: <CAKmqyKMb-VNiQZv-ZFeCMwPQ3hkm1ODn_w55pGdBgpxtwg8tnw@mail.gmail.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Mon, 25 Oct 2021 10:47:58 +0100
Message-ID: <CAC41xo2yWzJgttwEn6rG_wmkarN58OLmV0nh1ksbbjRG1gpuYw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: fix VS interrupts forwarding to HS
To: Alistair Francis <alistair23@gmail.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=josemartins90@gmail.com; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 09:48:21 -0000

> From your last response I thought you sent a different series that
> replaces this patch. If that's not the case do you mind sending this
> patch again?

I already sent the patch series here:
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg00553.html. I
got confused, I should have raised this issue in that thread. Let me
know if you still want me to resend it.

Jose


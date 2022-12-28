Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pANwq-0007G6-9Y
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 23:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANwo-0007Ci-Qj; Tue, 27 Dec 2022 23:21:46 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANwn-0002wD-6j; Tue, 27 Dec 2022 23:21:46 -0500
Received: by mail-vs1-xe29.google.com with SMTP id h27so817556vsq.3;
 Tue, 27 Dec 2022 20:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=om6++fhGYohPmhujXENLod87RieuvvbFJU+//MVJSZg=;
 b=ESlkway6QrRjbUWRzNTIcH14TfeKPYGhgkXZReACAa2XW6A9hr6Q2ZvFMfMf9zDl38
 V7rJmP/NvDS73A3hjCMwz7y4FWi8hSc/8XFsCnp4R8mSHvDHvDYN9pNub9zPEpph2/21
 0GTSH+lGSHu/lEfw8pvM1+XgRda5P6TM5vb9WvPOt0kaOtcJsC+GGgYQ7FmWCqZCAz1c
 wjzt7lgXIMiY4rAtEwcF7JtIM27X4lLmzPQ/bogdigGKsu4TAj4shu6zkegko9HSKMdG
 XtUyfAQoDTpLLIJYzzPoG3tkpKves4bXV7eOJ0GSbJ4i3AOX5QsU62e9v2KuoGz4i6ZG
 nPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=om6++fhGYohPmhujXENLod87RieuvvbFJU+//MVJSZg=;
 b=2thCk41bMeYMRYJlOJ0xJClOQ9hxmJ264MYu5Hm98kjTkUj5pfdYQ0BPt8dDJ2h1UA
 TPXn8GhdzeYLWEvmiLT/a5ZF98X3TyHoQqnhermgMlDMhb+tLUWSlPFUTn/98uN28WhB
 KIPPM9kUvt3DraYMdsY7nPRFM9HLFnNnnvAQw5f5bSRoxXNlwZDGaY+yvYesOKgHKMFE
 QKTw2zY3mNs8vPOeZEkWeyE6tMMtjfgjdF954/28CXmvygrF99uZfFeK+8dPBuDJDzfv
 hpUBqly2VQNS3H8WHFzBrN75KrLv7hJo/HiWaRJf3kd3p9H4/d6Hgp1huIK3iBB8XUPN
 uwUw==
X-Gm-Message-State: AFqh2kqk6XBUBebz6VGy7Zzuha7tqo7oP5+Ai5c8Yx6pfWbnfDwGQAgB
 p2Ri7Hrrk9GSMW8hq0A3Iwl+pRwJeSyMHM3P20s=
X-Google-Smtp-Source: AMrXdXtlZEixt21/C0ctTHBm/qVXOXUEzMuJHJSowLMXGtBHXK7ivRovfnOeTYy/y1m/z0XEikzue2EH5XlQGXyY52k=
X-Received: by 2002:a67:be0f:0:b0:3c7:c5d9:b841 with SMTP id
 x15-20020a67be0f000000b003c7c5d9b841mr878260vsq.64.1672201303890; Tue, 27 Dec
 2022 20:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <670a96f5-b703-5c20-3cb6-c95f55249e4e@ventanamicro.com>
 <CAEUhbmV4z_CD85Cr8phySXR8Ts69e13Si4TVmz6z0j-Cg0+7HQ@mail.gmail.com>
In-Reply-To: <CAEUhbmV4z_CD85Cr8phySXR8Ts69e13Si4TVmz6z0j-Cg0+7HQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 14:21:17 +1000
Message-ID: <CAKmqyKN83bUZHJQBEW-gsr8EvD+g7h=SWiWBy8em8s60pWtSjw@mail.gmail.com>
Subject: Re: [PATCH 00/12] hw/riscv: Improve Spike HTIF emulation fidelity
To: Bin Meng <bmeng.cn@gmail.com>, Anup Patel <apatel@ventanamicro.com>, 
 Anup Patel <anup@brainfault.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 04:21:47 -0000

On Wed, Dec 28, 2022 at 1:59 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Daniel,
>
> On Wed, Dec 28, 2022 at 1:52 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> >
> >
> > On 12/27/22 03:48, Bin Meng wrote:
> > > At present the 32-bit OpenSBI generic firmware image does not boot on
> > > Spike, only 64-bit image can. This is due to the HTIF emulation does
> > > not implement the proxy syscall interface which is required for the
> > > 32-bit HTIF console output.
> > >
> > > An OpenSBI bug fix [1] is also needed when booting the plain binary image.
> > >
> > > With this series plus the above OpenSBI fix, both 32-bit OpenSBI BIN & ELF
> > > images can boot on QEMU 'spike' machine.
> > >
> > > [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
> >
> > Aside from a nit in patch 12/12, LGTM. I've tested with a patched version of
> > Opensbi including [1] and I can get terminal output with riscv32 spike:
> >
> > $ ./qemu-system-riscv32 -M spike -display none -nographic
> > -bios ../../opensbi/build/platform/generic/firmware/fw_payload.bin
> >
> > OpenSBI v1.1-112-g6ce00f8
> >     ____                    _____ ____ _____
> >    / __ \                  / ____|  _ \_   _|
> >   | |  | |_ __   ___ _ __ | (___ | |_) || |
> >   | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> >   | |__| | |_) |  __/ | | |____) | |_) || |_
> >    \____/| .__/ \___|_| |_|_____/|____/_____|
> >          | |
> >          |_|
> > (.......)
> >
> >
> > Speaking of [1], it seems like the fix went a bit too late for the opensbi 1.2 release.
> > Assuming that [1] is accepted, it would be nice if we could bake in this fix on top of the
> > 1.2 release when updating the QEMU roms.
> >
>
> Thanks for the review and testing!
>
> Regarding whether we can cherry-pick the fix on top of OpenSBI 1.2, I
> am not sure if that's allowed by the policy.

It doesn't seem like a good idea. Maybe it's worth pinging Anup to see
if we can get a 1.2.1 with the fix?

Alistair

>
> Alistair, do you know?
>
> Regards,
> Bin
>


Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiLMK-0006Ix-Tp
	for mharc-qemu-riscv@gnu.org; Tue, 02 Jul 2019 12:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45483)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hiLMI-0006Eb-Od
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2019 12:10:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hiLMH-0004MD-Js
 for qemu-riscv@nongnu.org; Tue, 02 Jul 2019 12:10:18 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:38243)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hiLMH-0004LV-BR; Tue, 02 Jul 2019 12:10:17 -0400
Received: by mail-lf1-x12a.google.com with SMTP id b11so11804711lfa.5;
 Tue, 02 Jul 2019 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e6GUwIEJRJInD6g30ZmNZWphRlh4i8Ly/oky3N51j50=;
 b=Nob0cM7yqPSCu1qJdBNYPbq6ZUAKL7syZEhZj+7D6FAHvyEDn7k2X0w21HXPv6Ux0O
 wgQZpK4ki92IE30jCC0YsnlJOEU/+HYYemkXdKzewOOj7qQGe8F4VJQrBYyLM8t7XvVf
 IyylY1uAc7nJkk2/Pafo7HQr/8qw9CQI1+Ez098DGXKnBu5HSm4csdAYE+aFYf4cPqvq
 SB5q22Linz0G9l+w2y5RBWlNbhN+f912BhampRMstD3dubAAKbBDMV5+ezRVzfa0TPXB
 0zd+ltFEW+jWdqThS+pcGj9Sws58tI3j98Mlkq8XKnvhsTDZKMD/qThcBOyfAQtr8t8i
 4rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e6GUwIEJRJInD6g30ZmNZWphRlh4i8Ly/oky3N51j50=;
 b=JWe9tZMtnff6aylfLju8lnO22mwyqNp+KfBTPHm/8YLmlnHNEg/7uTpdmf5BVR/b66
 SB4+0HFP0I5oBLA1tVwVEPVu3b2MBvRCaD/Tak8wqioDQH/nSqoLoSP0fhl8yv80XGV/
 lTdlN4gPSxuaFQJ+LQUal2fdf4g509vSquiPfVntzmLh/TIAlVE+6SKl5lwGVIabCsQb
 tXtWPJP/KT0pJ6YmRmnwT5YlcCeIMsgZE5uaKJ1CUqJjm0wBRen52DVTFWa63t6iWnog
 MyMC8JccHGzDIEA/EAiL0L3nrRpPPkWf9UPEHOzfSqhJFeqXwW7MYZS9NRvAjEoagOPO
 MeOQ==
X-Gm-Message-State: APjAAAUads8MmCYPeueOI6ibiCJPX7aBVuXdpt0wKTEa4BHPWBXNJ4Iz
 skCgIOxiYTdiGfuLukGv76BJGMahoJCERr1YNOw=
X-Google-Smtp-Source: APXvYqycel78Ncmhi84E+YrexHfY/PmgpYqeTshoevtDYxL/2/wWN/2OVM8lIKbEUe4hZzV9KH3KvoBt+jtTVeGwlwQ=
X-Received: by 2002:ac2:4990:: with SMTP id f16mr14702963lfl.93.1562083815887; 
 Tue, 02 Jul 2019 09:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-34-palmer@sifive.com>
 <CAFEAcA8sscJQ2GCwL1gM+EcRtfHQb1v0BwORt6ncH54x51TCVg@mail.gmail.com>
 <5896113812cd914308e5b617377f8e8205224cfe.camel@wdc.com>
 <CAFEAcA_-h6b_f1fuWh7NkGo+FT0xSyCDXgd3b4pwEvNDN8HcJw@mail.gmail.com>
 <87a7dxqdl5.fsf@dusky.pond.sub.org>
 <d5fb05ba-e313-b9db-9cfa-2c6f7c1b90f8@redhat.com>
In-Reply-To: <d5fb05ba-e313-b9db-9cfa-2c6f7c1b90f8@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:07:11 -0700
Message-ID: <CAKmqyKONeFL2YVeKPFW0Z9U=hEmJ6uz1RJs+7Eg==vf9X_qKVg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Jeff Cody <codyprime@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::12a
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 33/34] roms: Add OpenSBI
 version 0.3
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
X-List-Received-Date: Tue, 02 Jul 2019 16:10:20 -0000

On Tue, Jul 2, 2019 at 3:34 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 02/07/19 06:12, Markus Armbruster wrote:
> >> Yeah, if we're not building the apache-2.0 parts then I think
> >> we're OK, and as you say there's the question of whether QEMU's
> >> GPL affects what we ship as mere bios blobs to run as guest
> >> code anyway. But it's sufficiently not a "really obviously ok"
> >> that I'd like a second opinion; cc'd some people who might have
> >> second opinions.
> >
> > You need an expert opinion.
> >
> > My non-expert opinion: we can't distribute anything that's not
> > compatible with GPLv2
>
> Guest code is not part of QEMU.  We don't say that SeaBIOS, SLOF, etc.
> are part of QEMU; it constitutes mere aggregation with the GPLv2 QEMU
> sources, so it _is_ possible to distribute APSL2 guest code with QEMU.
> IANAL, but I'm fairly sure about this.

This is my understanding as well. We aren't linking OpenSBI with QEMU
so we should be fine to release it with any license.

>
> However I agree that LICENSE needs to be updated, something like this:
>
> diff --git a/LICENSE b/LICENSE
> index 0e0b4b9553..81b9b3572d 100644
> --- a/LICENSE
> +++ b/LICENSE
> @@ -1,13 +1,18 @@
> -The following points clarify the QEMU license:
> +The QEMU distribution includes both the QEMU emulator and
> +various firmware files.  These are separate programs that are
> +distributed together for our users' convenience, and they have
> +separate license.
>
> -1) QEMU as a whole is released under the GNU General Public License,
> -version 2.
> +The following points clarify the license of the QEMU emulator:
>
> -2) Parts of QEMU have specific licenses which are compatible with the
> -GNU General Public License, version 2. Hence each source file contains
> -its own licensing information.  Source files with no licensing information
> -are released under the GNU General Public License, version 2 or (at your
> -option) any later version.
> +1) The QEMU emulator as a whole is released under the GNU General
> +Public License, version 2.
> +
> +2) Parts of the QEMU emulator have specific licenses which are compatible
> +with the GNU General Public License, version 2. Hence each source file
> +contains its own licensing information.  Source files with no licensing
> +information are released under the GNU General Public License, version
> +2 or (at your option) any later version.
>
>  As of July 2013, contributions under version 2 of the GNU General Public
>  License (and no later version) are only accepted for the following files

Ok, I'll update the QEMU LICENSE file in the next patch version.

Alistair

>
> Paolo
>


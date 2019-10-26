Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iOHj0-00080n-Ke
	for mharc-qemu-riscv@gnu.org; Sat, 26 Oct 2019 04:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52467)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1iOHiy-0007vA-OP
 for qemu-riscv@nongnu.org; Sat, 26 Oct 2019 04:47:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1iOHix-0001gV-Hs
 for qemu-riscv@nongnu.org; Sat, 26 Oct 2019 04:47:04 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40391
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1iOHix-0001ft-EG
 for qemu-riscv@nongnu.org; Sat, 26 Oct 2019 04:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572079622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=diUYJmZRk0pksHe8k5n9ZBmMfm/EANcpFE4v2Thes2E=;
 b=U9AbPI8Msi+c94zYtg5O5+y9+zkFBsT5o7h7HieBdrnsWHQHXKh6otq6y1vfZeWBmeE4HC
 RcBZ45OpUGP0zRKceIG84YynMvv73sZBfKLhjMKNdXN8hcPz35+FL7qnSp1CSE44jekiC3
 N9Xf9/6HH6OvLslE4Zuu1Xfx98CipYA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-vHdU_fA-PQCnGe78aPr1uQ-1; Sat, 26 Oct 2019 04:46:58 -0400
Received: by mail-wr1-f69.google.com with SMTP id i10so2600181wrp.7
 for <qemu-riscv@nongnu.org>; Sat, 26 Oct 2019 01:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=diUYJmZRk0pksHe8k5n9ZBmMfm/EANcpFE4v2Thes2E=;
 b=ijPoHlnt5cg2Ay7lx9NkRlm/SYIKEfsIy8jkTx21KoPD3MSurpooQhnETkVnQGEcR/
 C8cdg2R36SLsaOrxVlEd314rX34KvlTvV5W57VkFSWOJ1HLa/mVdh6WwpYqdA/0+G9JB
 1DrhBoJ+q7dBvQqbxdkXNYa1hIlygUKbgYOgkJZ3uNF4Fdm/4ppBCYr7XVAuURwYDBQl
 P4N1NqmCUPlkUhoqJJhWtYOVa7jS8LiRyCh9FK85U/825Xv2qFOEY2/MTF82pr9yYJfd
 NBzRPo5AefExqRKei4T9thQMkP1DQYLnchNXQ2MN4g05yQPjm+C+IPv5J1fl3QiBq3QX
 q9Qw==
X-Gm-Message-State: APjAAAUIHxuqWpwMumzuSaA+5yU4q+dK7TGB4MOEIGH5gG4NUaTb57E/
 QG9m9T2KhvptZKvnf0SBsKb5oaFQSYLgzdvMSBy4bY5P/I6uOg2dU95F5qpUbBCHfuHiFnF2qWY
 8oT5WuMFN49NFqe1br7+9S4rn4moqjAM=
X-Received: by 2002:a1c:a791:: with SMTP id q139mr6874557wme.155.1572079617249; 
 Sat, 26 Oct 2019 01:46:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcG8jZ98YOOgXfTPGgerhIr/n8s/kWy/M8h+71znvc7MvlV6V3zJa/ZGTw7Ay2GNndBhac6sefogq1mi3qliE=
X-Received: by 2002:a1c:a791:: with SMTP id q139mr6874535wme.155.1572079616986; 
 Sat, 26 Oct 2019 01:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <a88742acd6969991d44f897f7232a847e9768f57.1572045246.git.alistair.francis@wdc.com>
 <0178d892-dbb5-8970-08eb-416466b53002@redhat.com>
In-Reply-To: <0178d892-dbb5-8970-08eb-416466b53002@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Sat, 26 Oct 2019 10:46:45 +0200
Message-ID: <CAP+75-XUbnCDp-JH6JRnGLqVMxDWTFa9kPHJaZXm3NfCzZUbYg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] opensbi: Upgrade from v0.4 to v0.5
To: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
X-MC-Unique: vHdU_fA-PQCnGe78aPr1uQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Sat, 26 Oct 2019 08:47:06 -0000

On Sat, Oct 26, 2019 at 10:45 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Alistair,
>
> On 10/26/19 1:15 AM, Alistair Francis wrote:
> > This release has:
> >      Lot of critical fixes
> >      Hypervisor extension support
> >      SBI v0.2 base extension support
> >      Debug prints support
> >      Handle traps when doing unpriv load/store
> >      Allow compiling without FP support
> >      Use git describe to generate boot-time banner
> >      Andes AE350 platform support
>
> Do you mind amending the output of 'git shortlog v0.4..v0.5'?

Err this comment is for Palmer, if Alistair agree (no need to repost).

> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > You can get the branch from here if the binaries are causing issues:
> > https://github.com/alistair23/qemu/tree/mainline/alistair/opensbi.next
>
> You can use 'git format-patch --no-binary'.
>
> >
> >   pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 36888 -> 40984 byt=
es
> >   pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 45064 -> 49160 byt=
es
> >   pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 40968 -> 45064 byt=
es
> >   roms/opensbi                                 |   2 +-
> >   4 files changed, 1 insertion(+), 1 deletion(-)
> [...]
> > diff --git a/roms/opensbi b/roms/opensbi
> > index ce228ee091..be92da280d 160000
> > --- a/roms/opensbi
> > +++ b/roms/opensbi
> > @@ -1 +1 @@
> > -Subproject commit ce228ee0919deb9957192d723eecc8aaae2697c6
> > +Subproject commit be92da280d87c38a2e0adc5d3f43bab7b5468f09
> >



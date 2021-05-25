Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llbCt-0003YQ-Rm
	for mharc-qemu-riscv@gnu.org; Tue, 25 May 2021 13:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1llbCs-0003Xu-Cm; Tue, 25 May 2021 13:51:06 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1llbCq-0000Wv-MT; Tue, 25 May 2021 13:51:06 -0400
Received: by mail-ej1-x630.google.com with SMTP id z12so47224423ejw.0;
 Tue, 25 May 2021 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zCazhjUIYJgDWeojUAbeJa77nLmeLlOGmhCRhW2QppE=;
 b=lKLshnfWw+UDyHEvnpc7cusMP4AJHs64EneerrYeowMDyi9jL+7TPb6r40cISfko4K
 Jb3CH1q6WzgJh0KlBNj7pIDERLynH/upE0yl0I8fIOOgor3Ve7hn1tiiPtISmCt5r1la
 Fr+FWM1QX/yqzmWGu3iHWxNVGwCeJTzj3bBpyrWOIqYTNb6FsDLnixKWrkLLkvy8nJAA
 2Xq1eh+mBWkbc+DeUtdFEoHH6uSlrIKwxPMGY+f+gcJwwgc3T8yNAWAFsK2zYdrzVH6I
 Hmj+bR07x7t+adN4p4hjWRuawgJrj2/TQDrcFGFD+/sLGeobZ6ddpsxf2hd73eYLKO6y
 ocxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zCazhjUIYJgDWeojUAbeJa77nLmeLlOGmhCRhW2QppE=;
 b=DM0q6YKShKAN6F3VMMEnO1GvF9gmNZVS8e4+VUbKVx9MDCnB+JI918/PVSprVH4u18
 CTyvViKeKU0B+rv8TbiA9/GUDwsgm5fuhw0YdhuUgw5xhdzWRjz4SJUeq68I1/Eileng
 q44YnMpVsiGp2GaimtQ1JsxVYtuVO0NRgiJlQ0bzJZDwq1rDYz0lQ8Dub2c8f8wiRfyz
 UfJfV9AHTW9yeN/dDQcKWD0QU2C/3tQsw26A6QndbVyHXHEmMz4/lsdfxpZTLE5XevkB
 OPZ4j54s5eYcrBhowiwHuICVxHrdi1lDHtXgdC6hNeTYNG+4DNWop0SAbYU7od7siqUW
 aJGg==
X-Gm-Message-State: AOAM531tDxBVv4VmHM6icSWaqPLLe0K8bgGqRdFqwUQpN0KUSSMv1vI+
 YIJ3a6A6X2fo6sS85Hml5BdhbJbbpzrlZurW/Xs=
X-Google-Smtp-Source: ABdhPJxN8PSU3n8OzEv/bGjjQJ2DE3whKb1C4jraYFMXtOR2w9LdpHobB7D8YyZJYM+/MjHb3uxSalWTsvMUM8H/4fg=
X-Received: by 2002:a17:906:6dd0:: with SMTP id
 j16mr9280673ejt.208.1621965061486; 
 Tue, 25 May 2021 10:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210522155902.374439-1-josemartins90@gmail.com>
 <434d8825-8bd6-5344-aea2-e176fad6183e@c-sky.com>
In-Reply-To: <434d8825-8bd6-5344-aea2-e176fad6183e@c-sky.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Tue, 25 May 2021 18:50:50 +0100
Message-ID: <CAC41xo2v7kU92+MkZfB7f_86X58k8R5Ft=2vSO3OORT2OJ-Exw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: hardwire bits in hideleg and hedeleg
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=josemartins90@gmail.com; helo=mail-ej1-x630.google.com
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
X-List-Received-Date: Tue, 25 May 2021 17:51:06 -0000

> We can use it directly if only one macro VS_MODE_INTERRUPTS.

I wrote it like this to be more coherent with what was already there
which also makes it more readable. Furthermore, the compiler will just
probably optimize the variable away, right?

> I didn't find that the RISCV_EXCP_VS_ECALL should be read-only 0 from the=
 specification.

You are right. I had doubts about this also. The table that defines it
in the spec is missing this bit. I raised an issue on the spec repo
(https://github.com/riscv/riscv-isa-manual/issues/649). But in my
opinion, it wouldn't really make sense to allow this exception to be
delegated. What do you think? Is there any use case for this to be
allowed? Maybe we'll need a clarification from the spec to reach a
final decision.

> However, as hedeleg is WARL, you had better reserve the other fields like=
 medeleg:
>
> env->medeleg =3D (env->medeleg & ~delegable_excps) | (val & delegable_exc=
ps);

Isn't the patch's implementation of hedeleg/hideleg providing a WARL
behavior already? I don't think we need this preservation behavior
since in the case of hideleg/hedeleg there can only be 0-wired bits. I
believe this won't change. For hedeleg the spec states that  "Each bit
of hedeleg shall be either writable or hardwired to zero". For
hideleg: "Among bits 15:0 of hideleg, only bits 10, 6, and 2
(corresponding to the standard VS-level interrupts) shall be writable,
and the others shall be hardwired to zero."

> I really don't understand why medeleg codes this way. Is there anyone can=
 give a better explanation?

I don't know if I fully understood your question, but I don't get why
you would need to preserve non-delegable bits in medeleg in this way,
even to keep WARL behavior. Again, the specification only allows
medeleg bits to be hardwired to zero: "An implementation shall not
hardwire any bits of medeleg to one, i.e., any synchronous trap that
can be delegated must support not being delegated.", so a bitwise-and
should suffice.

Jos=C3=A9


Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815CD606A323
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=lNrJlcJH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTFbm-0004Bg-Tz; Tue, 17 Nov 2026 04:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFbk-0004Ax-RK
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:36:08 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFbj-0007Of-7Z
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:36:08 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b7a488a0a4so4916571a12.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794908165; x=1795512965; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=CQvfj4kC8vQo0POu6cYh6RIpfb4zrs4hh0THgRagOFw=;
 b=lNrJlcJHz7qULSCXGKDfg73OEik3Cyon4bbULYWRoR9wJ+z3618jwJjcaTuo3MYdoJ
 6mwG3bv9Id5W7vfJZHMZ89kEuVY9VJCVLtoJYBVefiloJUPy0jv7bDpvrZQZwU033ZqM
 TYT4+YzwVPjN6dWIhwXdXczBbIXRoWh2pRi2l3SlNquhi8+5yFw+hEkqR5kjgojJhSO5
 WNhOeJwMYqdAOIYJHmuYxRicgrT5aHTcMpbEW6otUZR1XKF6+A0cHNBDUOvY5A2UoTDK
 4Atm4p4qDxSo7BBrlurT3aimsgVvB8MyU9YBMkzy1kd9BP7qUO1jhdL/yu/glYkfwsNF
 Vp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794908165; x=1795512965;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=CQvfj4kC8vQo0POu6cYh6RIpfb4zrs4hh0THgRagOFw=;
 b=NE8v3l7kX6bNkLdEVyl2MqEPjeMIBT16iBEF1z8BDnwUp4o/tyromPvOpjG4fCdqUV
 PFQD6KyAbT1FyHfDYSfcP5OTX0+Qocm+zy8qIC9ty1P8a4CLI9Udpm5u/FNC1G3G7moJ
 5zd55TtXXS8qT5WTE2nYtM/aO6ztYuiI5G2CBKEiZIBNxYRzxG0kyrljJXtnXKuEzPv4
 Gl2hFNmeGoy0RTUZqjyuobU7P8W5RwVJ/m8Fsl1pvJHHcslF6r7RfmK1bcUzaUR6lv90
 hqTJy+6EGDpGszHnWrjE+xFbdaPIvpuEqIPud7Lq85azkYXelKeWBI0q3E6a8aNbSJ7i
 BD/g==
X-Forwarded-Encrypted: i=1;
 AL+hErGxaBSCE8NcnTF/y27hXQNTguusENfJwekAe0Rq6MvL3fC5vDZAkfhHkdmm0dBYU7d7/toBcPigjXEU@nongnu.org
X-Gm-Message-State: APuU4Z+PR7ZZZ9nDoTuSeig7smtTnAzRLZdfjFy6axPRWI5zd9soF65H
 HQXD5DHF26w5pC+OK2G39jTLBQkZy+4iHNjd9ZQcGbz+zoHRykAdCK+rc/uNYoPhBgyCCAAFkJh
 5YXyR2OWBSonfVnqGVxJof6TInjBxj2BHbflVmC5V1T3Erz+JPRH6Zk7ghmCd2DGALc9oZx9IoT
 UAdAwFvdjHGGcOgZmi4UC/yklzDeJlw3cZIbXHoHus66o=
X-Gm-Gg: AYBFou0z9HTQJ1hasDDan0BWJqzJ6wEuyvNemEYdoRWH414Gmww3bnz7QTRn7lt9G9T
 p6P+u1FzjyFWVKottJJsshxrWr5ze/F/ri8hREhUUI5qNJim+gG/XtFKoTCWHZmDdv//kCBckh+
 sQXIxq3+9PeQsQlhVdIYEUa+rbWuLQ7kPVXKdMz8N6wYZ9zeb1xTGeK4G5TQNdAglcrjD83Bwc6
 DwkxvOD3XCrKIC5lukJ9rXuNzijGEODocWjpRE2rFFrdlzhY7EwzGRL6pl8LwmDEztZONr3Qs0X
 kKRUlw6XZHAGdsKDAsumgqHfN1SeF4qM6803aZnJji5pAT4Py1XMbYqZND5WzxiG9YZVrYQiL6A
 ZBWh4IMiVw/1amCpO4HcNkTWIRw7YrUDHty3afJq+MDvvG3FWPoYdaPACarsyKjdeEx3KqoCF95
 aRvuZU6DW1mUTaFJ2IvWUeH+9PU71z1J+F2cA1/HdfaG0xMHTGOI7odaHUn/ydNFTczqlTLdpoS
 sBR3VoWOdIoauTI3/To2mxFx+X7urfW1ONWTwqhSOfaWtAMqm3PueeJWucoHnC9Qrhai0IeFDU5
 9e8qT7DeUXQuIAhvSPtfbHKDWrg0F1XqRac8HBkS/jhw1KT9N56xD5rtMT+oDuHUb30=
X-Received: by 2002:a05:6402:191:b0:6b5:97a5:c9ea with SMTP id
 4fb4d7f45d1cf-6b7c0bbd5ecmr7821899a12.7.1794908164654; 
 Tue, 17 Nov 2026 01:36:04 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c23cf6e9sm5689446a12.20.2026.11.17.01.36.02
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 01:36:02 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c4d28f75d62so857921366b.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:36:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErGLKYe2Wz5UqMhknwDOG+Vj1hY8xbXvN6Fg4Gp9gEemNVKOVaFetR68plynliekOlvI1wFqjVGpnotC@nongnu.org
X-Received: by 2002:a17:906:7309:b0:c25:afb6:2d91 with SMTP id
 a640c23a62f3a-c509614e541mr1048610166b.2.1794908161503; Tue, 17 Nov 2026
 01:36:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
 <20260825-upstream-ntrace_core-v1-7-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-7-f8be2f40d2fd@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 17 Nov 2026 17:35:49 +0800
X-Gmail-Original-Message-ID: <CAMXXpfbH=02pBVT_RCW6eLZaLqEFQCMzzA77Xfn8eo9xdHwn8w@mail.gmail.com>
X-Gm-Features: AclHuK_nJZYDNFS_dxfJrZCugsptRtZ3hlCBVNE6viA_mrDVPu3Z4O6EKmX9RRQ
Message-ID: <CAMXXpfbH=02pBVT_RCW6eLZaLqEFQCMzzA77Xfn8eo9xdHwn8w@mail.gmail.com>
Subject: Re: [PATCH 07/13] hw/riscv/trace-encoder: add interrupt support to
 N-Trace encoder
To: Konstantin Semichastnov <antikostya2@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexei Filippov <halip0503@gmail.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="0000000000005efa2b0660759f32"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000005efa2b0660759f32
Content-Type: text/plain; charset="UTF-8"

>
> +static uint32_t get_inst_len_at(uint64_t pc)
> +{
> +    bfd_byte packet[2];
> +    uint16_t opcode;
> +    MemTxResult status;
> +
> +    status = dma_memory_read(&address_space_memory, pc, packet, 2,
> +                             MEMTXATTRS_UNSPECIFIED);
>

 Could this be an issue when the hart is executing in S/U-mode with paging
enabled? env->pc may be a guest virtual address, but
dma_memory_read(&address_space_memory, ...) does not appear to apply the
CPU's MMU translation.

Thanks
Jay Chang

--0000000000005efa2b0660759f32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">+static uint32_t get_inst_len_at(u=
int64_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 bfd_byte packet[2];<br>
+=C2=A0 =C2=A0 uint16_t opcode;<br>
+=C2=A0 =C2=A0 MemTxResult status;<br>
+<br>
+=C2=A0 =C2=A0 status =3D dma_memory_read(&amp;address_space_memory, pc, pa=
cket, 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEMTXATTRS_UNSPECIFIED);<br></blockquote><di=
v><br></div><div>=C2=A0Could this be an issue when the hart is executing in=
 S/U-mode with paging enabled? env-&gt;pc may be a guest virtual address,=
=C2=A0but dma_memory_read(&amp;address_space_memory, ...) does not appear t=
o apply the CPU&#39;s MMU translation.<br><br>Thanks=C2=A0<br>Jay Chang</di=
v></div></div>

--0000000000005efa2b0660759f32--


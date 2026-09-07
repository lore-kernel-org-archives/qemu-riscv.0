Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E5CC79F9E
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 07:27:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3Tlf-0001Dw-2X; Mon, 07 Sep 2026 03:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3Tlc-0001D7-UB
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 03:27:49 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3Tlb-0002Ki-6y
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 03:27:48 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66c744a00edso2493382d50.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 00:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788766066; cv=none;
 d=google.com; s=arc-20260327;
 b=K4wLOiprRkIWZDnxSIrvPkUSnKn3HhyhnGPkolV/Cj1PQdTEXZCYgIWUGv5VapJSxP
 z8JJp6f0Kk0dyuq3gsUBOfuzPPhlPw07IfYIwsvuMfrwA04HYO6dNFyRALcBjV9r683d
 0/LyU2RiwHSq8IeAACn1l9D8700nnQ58EFz7QANaUkhhRCZr4XUiw3rfeC8zMBV5dBxW
 8LslsVTYiIEcWq/u6boKuG6UODawXOrQNgy6XrcfM1FRKss7hjktKr7m3O9tlmuQ4lUc
 8sXsK49bgrQZBdo+WRtlxFTan2h+a71a8ksHmCds2qS1arQGiOLxYWa9rFxVnYcjE5JY
 CeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4FaTlUWDVjkPnqBZK6+CQD1ELMYVOOzDwSl4e2vjXk0=;
 fh=8XlIB8yzz3p+ziRYrowIl76DmmO+LzuZBVDxn7oT8dM=;
 b=A7CaVd4ka3JCdMZy8PfGWI8FAAYsqYtiPnNFx1+6RYMfzXyN/YLeX5Mwi/kgiXVI9W
 IxiAY69HsmOtjOs1AHUDYjLrdFIWmR7c8tsrmT4c+XhxGg43FlM2Fye+tVxyHJDhHnV9
 qBkj8WS6l7eqR2uNoe9oAPffeIdU3mX/kELaejn1+RTagLrTthwLEdkpxph2FM4cexgt
 ySxg+aGp04u2jm/XS/AZ4jSlKNrLtkIV2AI3igo1KmL2ux1tu2UP4duKTMOqI8JPbBlE
 6xtcTtxQb6r8P5NxW0zCpToHBXGLXgVqWiwJwnZCtaOyQlUdtLPAjt1FaWrio2P/7dfm
 pbBw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1788766066; x=1789370866; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4FaTlUWDVjkPnqBZK6+CQD1ELMYVOOzDwSl4e2vjXk0=;
 b=O7khH4QJJcCU2+9piydLi/zpmamjq2rs+kVv+TyfLH4EJ130bALrmFSKvHtgsuXIq2
 727P4I4ztqIr6EmauwlS+OzcZnJ/FuvXND/cOkQJuRKiMZiDGOQdS3NfEPYa56bHB6DP
 YUVAPgQ5cwJBA3PhYp2WbMcgl98Rb6C3TxdoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788766066; x=1789370866;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4FaTlUWDVjkPnqBZK6+CQD1ELMYVOOzDwSl4e2vjXk0=;
 b=J0pSBoCAE1QhmPNt6eWtyXzbAx+4vTFP3Sap6Ih/1wpVYC3xthHgxQZc9ncxOmuSLX
 gsGf5rYrYwF4jponSL8kJVj+TVT/itksgoMfDbIcUuLSrXmTW03dz7A3pN46XgZvPj8L
 AD/Eg/Z4xpd5CxwDztFduDoy0RkG3rZybbBDGBb4tNXTu3hb8hoYVWB2OUznPuKfgXCY
 ydQkMVHZ/D0sadGb0lXIY6RAaVvAkeyfO8bf+5W6eBs2z50+jChnhUJdrUKZVisIfKcM
 DMJv0Ip+cr0piEVb/A0FwBmlXpbiXwRHz80JaNEajC8+CFpbrRZrDvrxDkHm4YzIYnoz
 a0qg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzbUtTIHAscVwVVKga8N1cNrbrgYpXlPVV+QqLR/T9rAp0o0FCPpjJSItNuFHxgW3/ieO1EJhmEgcXN@nongnu.org
X-Gm-Message-State: AFuF++kkh+YGcOJ1SGohbfkBIczWBOjJ9jI/h6APTPzEFDEvJqx/WMkW
 uG7tLOo7NFFpi3pI4tMKice0LLvCPJ7tnUv/gAV4Esf0juFoQJ5n32IFytJnj8Ah9BYDWaLbokH
 tBXhA8dBUGTvIsNasnvAeCjs771R5kOk=
X-Gm-Gg: AYBFou1hJvUxk3cltsiQpc3R9lVAXNXhkKhbsuChIlEScHE6ThMGFLmwu1Pav3BZlpA
 loMRTIq2TjqoOYkaP7M+SEh6LDM0UXuSRZJXOm2f8MJTo4Plo2J1FBRMmXwBLOJ6w2vTyQvKViK
 oJtGF+pQe4UtNsnmMg9pNGCtWZSL3wdZl9MZZPz3sbPEIU17UUR/WvLURLp6ln1chNtUa8SmZ+9
 ZBJNOJ+Fb7Ea8URkDPjc7yDSz0DyaAGL2OvWdMqFKD/p9suinRaRmEPfVamfqE42OlA/+8KAymh
 l3ypDypl3Ii1sh/axbqwVE0Ac+D9+q2hK05cW1ez4WUODaQUO63VQazK/58QBgJnsqI5xuHMilX
 tA7VzjACK7zOf4fqboetKfathbdmf2wUv+2A7OColJxPBkXIBSwcQOzeF86FBz3udhQ+VLqTTUr
 toVvCbpqgbyar0PRNyD0JfYNMO4+U=
X-Received: by 2002:a05:690e:4283:20b0:66f:c1be:a663 with SMTP id
 956f58d0204a3-66fc1beadf1mr2802491d50.85.1788766065936; Mon, 07 Sep 2026
 00:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260903055131.257903-1-joel@jms.id.au>
 <20260903055131.257903-15-joel@jms.id.au>
 <a4b3c4a2-e359-4952-8b1a-34db4e2b3c9a@oss.qualcomm.com>
In-Reply-To: <a4b3c4a2-e359-4952-8b1a-34db4e2b3c9a@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Sep 2026 16:57:34 +0930
X-Gm-Features: AcwNN1XbKouwtUcJQbmHGY8llY8T9UYA8KYi7aof3H8oop9a8W8fi0muNztLxI0
Message-ID: <CACPK8Xd-GLWSve3_7ctEqAmLFRoNVG=WzYw6dKwGqPbHi-aE4w@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] hw/riscv: Add property to hart array to allow
 private memory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Michael Ellerman <mpe@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, 4 Sept 2026 at 20:13, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
> > @@ -117,6 +119,12 @@ static bool riscv_hart_realize(RISCVHartArrayState=
 *s, int idx,
> >       object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cp=
u_type);
> >       qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->reset=
vec);
> >
> > +    /* Use private memory instead of system_memory if provided */
> > +    if (s->memory) {
> > +        object_property_set_link(OBJECT(&s->harts[idx]), "memory",
> > +                                 OBJECT(s->memory), &error_abort);
>
> IMHO this logic should be inverted: we want explicit memory bus mapping
> by default, and if not set then take the global memory. Personally I'd
> even go further and assert it is set (otherwise programming error), with
> a preliminary patch setting global system memory to current machines.

I'm on board with this idea, but I couldn't follow what you meant by
"if not set then take the global memory"? That's what happens
currently?

Are you saying always set the memory link to the provided MemoryRegion
(with a fallback to system_memory, or in the stronger case with an
assert if not set)?

Then we could drop cpu_exec_init.


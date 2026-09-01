Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196F1C61DD6
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 07:46:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1JBm-0005I7-Cl; Tue, 01 Sep 2026 03:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x1JBk-0005HY-Nz
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 03:45:48 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x1JBi-0006yl-Dh
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 03:45:48 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-66de7e0bc85so575823d50.2
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 00:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788248745; cv=none;
 d=google.com; s=arc-20260327;
 b=MrQBZtn2g+VwZPpOffArJovNNmpNfQ1LgAF6gaTDC+Pk/jhjcJdjmyWUkzFscN7xWi
 4qOsylIbzO+n7fz9Ud3+JgE4Hc7vaK/KMD5rQipDnWdP91+fxttFcpWl6ZPB5Hc1tnEE
 LFEuw7o6C8yn1MGxbMzbINRkgwwizQkcgC6bEDa4AqmKhybXvT5KsRaUX/dr4NuLK2EW
 OwsNBGDFYUdxGG7NsxrxGXD7b0LLUnx6AyAxUJb0Bmyb/DevyrrroTdLJ+3a3CKrqcAF
 jtKOrchfslcUf2eiYZrtz248qM4JooSqulwiU0tm/Dcr09ynEUWlWuD/jOwatSDgy/Md
 kIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=U48hKlV1cRP43rKRiCqIlG/RIdxRBIvcw8d20WllOJI=;
 fh=tJXbOTbr+rqCjhZf0TzEDOP8uptdfzqBwJyUS428YwU=;
 b=mvA8MD4zneZ/kQBI+a2TE0T0KR8MJA4fvgCY0nzZKLpWqmamOUSs3+xLgj2MT838Sh
 bfrYs7GHVa9N5ZAZAW7n4sYjX2Atft0BFnNGhw7mHORStG58allQhl01oR2OVrITkRbW
 E0GFH98Ow4kvZnULubXDCgf0/4jTHA5TZi9OrCT7SY3NQH1D+1zNyBiOVqgU+RscIFg4
 MsaEGSFGUC4WkwQjDC+xWffteNADLXOHxXcSVA+v/Ip58cYi2HvJGDR7P6AqjQn2Wl3y
 yyyZQu75lUtiDPExSgofVzfINlNCqcN2UPB0SzwTvu5OOm5tQ0SNjO32wKQUeldLF/qb
 LU7g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1788248745; x=1788853545; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=U48hKlV1cRP43rKRiCqIlG/RIdxRBIvcw8d20WllOJI=;
 b=CzJgD7F293TdsJyL+yTQQT0dOK9AEfV9XA5Sw4szVlnCVrRU29LxwOMKerWW9JmWG7
 7mCZvVigTgjSQAk9m0O0zb7G22wWkF+OzYlv/q0OlkQYnNkPnw9vOX0YX/6uXat+eGeS
 WPJqQ2xThrjjFqk+AlcTg52HbzRmTYffQBXrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788248745; x=1788853545;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=U48hKlV1cRP43rKRiCqIlG/RIdxRBIvcw8d20WllOJI=;
 b=Ca5q/SzT0Wgsk46Id50MKG6sCfXGb2slBA7hiQK09ztVVm80X/qTWIVID7qwIT05BI
 dNq3HYJX+np5X2Nn6hAEmsx3AGwUXPJNwqdvCE5yoBbgj1eHiyNfkGIE0wXhnhp2wMKX
 sDTkPhLGNBZEFqzlij46DRbqI9ms4DGqM3dqfawV7BqUd4ZCjjUXcT0NFSmoW7WInnA5
 6rMhb4BbA+M8qWyogh0iHWRZF4+gpktwFdXbER5h+BiYhVUZqwG0/O+oWvkzLnDEkBko
 MUt2ckeGeh8yy/4rAD+HAWi3loRgZbyosz1a7HvRxVU0tUAH+oBu94HgbT1Ui0zws5iN
 dbNQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwJuHGYeQNFTUgj2VMzIiD6yWKpQ73bvZDZGKKxq10SEyq8Fe7PMFljIl7OzljkA7XwYEigN2fXuyOi@nongnu.org
X-Gm-Message-State: AFuF++luNfQ7P+RguJEJcftOKr+1G8DF5+IfZAeU7enCEvCJ9GKKYjsk
 DOiXcZA5Rn8KeROn8pZfp5WC/OSlQQZkVvkyqU8n4qJCoch7FT3X25ucLqKlQR2XihUiNU8whlF
 eAiuyH2zr5I5p+Mk+JwxYxqTPRlgIBNk=
X-Gm-Gg: AYBFou3VQXpEd+461cbZR50bfhoMEGB/1+d9Jz6KAEJh+QGzqLG4q01m/pfAYM36fUR
 WPnq2mYfqXBGb0Eh/ylqK7VkP5g7sk7bLvoSayOQFCGP9AV7EGwuy+RrSRnABPo/s8bC6bWwvEX
 Ldul4ydosHx1cBGkVBSQ64XnW0rG8ykQj0PoM76KAfdPVNI1etn3SgxP/Y3db4oyOGB90CO1aCa
 LsEFSDsP1yKCH6Ud8Z9z7MvEAy9fgXnJU4vpF1LZc8nwv8wAex07mwowVdNXnAH5eDB5LwGcdTF
 L1YpJsiwqc/uWYZqR5iJ+6PfGbZBfy/3nLNnb5QT64vapPWbx6VyIM2XtC388/PfkezClFIAiCD
 I576CbiHsFglfmNwVivG+bxX0wao6Yeu4q6MhXTPDQP4sR9lIT09rgkNkFmp1aL4WnakH+YIEgO
 Md7mJqHYvA/1hutk7w
X-Received: by 2002:a53:a2cf:0:b0:66f:7d7f:508c with SMTP id
 956f58d0204a3-66f80c61e8amr2529567d50.50.1788248744728; Tue, 01 Sep 2026
 00:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260831021500.82565-1-joel@jms.id.au>
 <20260831021500.82565-3-joel@jms.id.au>
 <bd0e113a-6495-4f4b-9ed7-bfd206a6acf7@kaod.org>
In-Reply-To: <bd0e113a-6495-4f4b-9ed7-bfd206a6acf7@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2026 17:15:33 +0930
X-Gm-Features: AcwNN1VdMoeETI9xhtG6mjaODAq76yAEzKe1JEV7ydmW1S5HiKtyQXku9OH3C0w
Message-ID: <CACPK8Xf5UVHuwCo9gyXNUCqH53F2zji5ZZ3K6h-1Rz7bELzYTQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] hw/intc/riscv_aclint: Take a MemoryRegion for
 the created devices
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb129.google.com
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

On Mon, 31 Aug 2026 at 17:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 8/31/26 04:14, Joel Stanley wrote:
> > The riscv_aclint_mtimer_create() and riscv_aclint_swi_create() helpers
> > map the device they create into system_memory, which prevents their use
> > by SoCs that map devices into a memory container of their own.
>
> Since these routines are going to be used later on in a realize()
> handler, I would add a 'Error **errp' parameter.

Seems like a reasonable thing to do.

I started having a look at this and plumbing through errp is a bit
more involved. I think I'll do that as it's own series as a follow up
to this one.

Cheers,

Joel


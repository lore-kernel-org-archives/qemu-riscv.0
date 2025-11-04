Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF02FCCF9E3
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 23:09:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vGQ8v-0005Iy-5H; Tue, 04 Nov 2025 18:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vGQ8s-0005I8-Ps
 for qemu-riscv@nongnu.org; Tue, 04 Nov 2025 18:08:46 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vGQ8r-0003Ta-2W
 for qemu-riscv@nongnu.org; Tue, 04 Nov 2025 18:08:46 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-640b2a51750so5616132a12.0
 for <qemu-riscv@nongnu.org>; Tue, 04 Nov 2025 15:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762297722; x=1762902522; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pCLJZEgcYlWw9iD4ORoR7xWg2PSQRU6gFRhviyQ6RU=;
 b=lep7H/0rGc1bfCob26K3b4ECicvgC4qe5SlTBtrMwecrhMAITCH1bRPX9mL7pAxMhh
 EzbLv9/vW5T3uLTYnBBm1mBTEYapGYb2oUk0z7NqmBBepNA3CUfXXfDNTwXR/yOOqlp7
 c99ujjxTUURoHtPCkO8Dl0Byif7RO5GWQDdSlL8foVYCPQsHdK5LUFRzWlZ6zKbOcRnW
 Jg2oa6E+QHnLEfcGVUfpxRZFZaLAsc/UYkgdRH9ktVzn1mB+oqwRJMWD1aPbmrweO5ql
 Bg/3VPE2wYWdoNV6KQMNxe628ElcfVK9z1tGy2PeMq5Qu+YA4eulaz/QaZdDD5yGAKq1
 6TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762297722; x=1762902522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6pCLJZEgcYlWw9iD4ORoR7xWg2PSQRU6gFRhviyQ6RU=;
 b=ZAiLdCl0cBkZHhXFPX/p1K/1sGoohby8zw9onkELmnYY6UuCkpBE+JZ0omD0ENUYoH
 Ar9LQqh006+V5T3FlYAI8Z33rsoIHZXuJHswagPmmJ9o01kL7b3frrBSM0KWzoN7/WYX
 mC8Iss3lpYASsGX3EjuNI9ATw8RyrNa9T4/dyQqOHBuRS4Cj+xFOC8R8m0N0BvDl4lAf
 fQAQLs8W+N6HkaY/usFef4GgAoFkMmHOs0UP2JrdyZ+HhFTpTpPlhb1NBGiQT3Xn9Ywu
 iWtQQ4NfFT80xhLPTOovOBSe2Bq/qGNhTw60pYkLLKeYSnN2wjn1VfmMrdyDW2tDxI0o
 RFDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUek1TJM2MFzEjEY04uH+K2faSBozt6Opi3jT8BdklVsVBeOdg5q9mpBicJjIOYKsdAX5oPBBc0eB8D@nongnu.org
X-Gm-Message-State: AOJu0YxXQnIUhPNCotZTdaZAhO1RzfDPX8Ul/ZW4Htp+tTNBGKN1D6rH
 lDr7zTbgjNnsK40ajfxg1EyZehhgopEAKNNRMi0TpwitZ/fJQc+uhe97y7ma6VWEfNKZ9/tEY6S
 m9TA573tjrVWFoiBgxcTgq2/HTVc89Wc=
X-Gm-Gg: ASbGnctP5PHhHQOyASNP+04mY87+zlNzh8zO4aFc8qDNzvMNxZB64MIRH3x8pq1Zgo+
 em8OzB7S3MAfR8dZ+7joN7yrdkmaxm2MHeEOKg/nmfq+QbQGlG1sN7Ku7m0jySVZfXcsxdkuhfU
 JX0GaNJNqCi75sLznFykeHBkp8k+tAL4J8M66lmK5beLDNo7lQGT5hI0Ucy4wYPwIuh6VBC4UrS
 LrnsrODBY7UFKWS5ufpBEc6ozzAnl3QSNnkTt0RBQnRKtJYxroGf5DN7GhRp38HhQ3qG6sK2BiH
 1lSqk18qpssgFmM=
X-Google-Smtp-Source: AGHT+IGR9WTdxWuM0ZHHHtqhW7vy8alVg+PuQj8KrA3w3kiBWA1ehja2I1G06PIIxSqIUUl0w/qjZ64xlWsCccD5poc=
X-Received: by 2002:a17:907:6ea1:b0:b71:1420:3357 with SMTP id
 a640c23a62f3a-b726554b5eemr84819066b.45.1762297722273; Tue, 04 Nov 2025
 15:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20251104150708.3345289-1-djordje.todorovic@htecgroup.com>
In-Reply-To: <20251104150708.3345289-1-djordje.todorovic@htecgroup.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Nov 2025 09:08:15 +1000
X-Gm-Features: AWmQ_bk99fJnp4N2O01t1o1H511gdv8d6pNwG_BXjsLF2cYpjFKmj21VhnfAHQk
Message-ID: <CAKmqyKNV9Dc5-mszwg8aFCkqLiASLZ_u+dbLLyG_59usMAL6Mw@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] riscv: Update MIPS vendor id
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, 
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "philmd@linaro.org" <philmd@linaro.org>, 
 "thuth@redhat.com" <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Nov 5, 2025 at 1:07=E2=80=AFAM Djordje Todorovic
<Djordje.Todorovic@htecgroup.com> wrote:
>
> We have already sent patch set for introducing MIPS's
> p8700 CPU in qemu at:
>
>   https://patchew.org/QEMU/20251018154522.745788-1-djordje.todorovic@htec=
group.com/

That series was dropped as it failed to pass the CI tests:
https://patchew.org/QEMU/20251023041435.1775208-1-alistair.francis@wdc.com/

You can just include this change in a new patchset

Alistair

>
> So, this is a bugfix that should go on top of it.
>
> Djordje Todorovic (1):
>   riscv: Update MIPS vendor id
>
>  target/riscv/cpu_vendorid.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --
> 2.34.1


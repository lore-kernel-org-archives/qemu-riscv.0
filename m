Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5848E606A321
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=VFArBynu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWJCN-0003vn-KM; Wed, 25 Nov 2026 15:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xWGxE-0005qk-3Q
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 12:38:49 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xWGxB-0007UR-Vd
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 12:38:47 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-67df3b1ca06so6845266d50.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 09:38:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795628324; cv=none;
 d=google.com; s=arc-20260327;
 b=gS0Y9S4U2PMgLZIWJmTQC0Ok6vHhBwhipNkMmdXrtHsQkHQ7o28QD6Swpn1c2b2EfG
 2eUTuQdixoBeqhUvkPpUnCFhfWqq+aLY5YmzUSN1bM2/c2VasTdxrNzxMtZYGChndE/g
 zj8Cc0TbAFP8lGym+gbhJ+bxPcosYdUu9JjyzFOjseYaTpy9B2Z4T1RHUaCrlLNNWK9s
 B8uH5UoujEDUZlyzeb1lf5cefMjO1WahGB7HETsnO5Zh6i8bjTip9UY4p0Xd7J8ZcIv7
 65tkIkrqWJDaklWUbglRWx97Z/ZOxBjTdQurjVGUsRa+hlZRKOUtwUsogfUkoNNC8c27
 P6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Yg2rtayaj+yDc6xyYp07Hyzvzpn7tMq3vAWY1vPC+bA=;
 fh=9snwuK0pTGxIARO4fwMJAmSOerpeM3xAL4cs/jGuWHE=;
 b=Fh1KfyHggL1jI9YC8CSRZPmaiNuIVGNQnOTHa1eSU1GmZTHBOvPb8lPrNgsNQBZZsR
 EIATRzvvezcE9l7gmMhWARKVsVAnzWwVjUscm0H+3vb4nUTeYgf6tBZQwjXmQjgl6vEC
 jadN16nM9AdUET+d2x57Z+VRKh3Y6YJKsHwZz+KWSw8tgnFmHfdRwOPwGFxGrBsPFz8L
 feiVWcB1Eh1CQ5nnlSl1A+xl6rIb+VLDSCrVITnPkQwrMP9NRpH22Bd6lNAHaa0QqZLG
 HG4zxDfr1Z8DziFjAX74FPlRhf2gxz/t52ioy6TQzaq6GtlTfH2OS2tA5fWoiK1UlBIS
 TWKA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795628324; x=1796233124; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Yg2rtayaj+yDc6xyYp07Hyzvzpn7tMq3vAWY1vPC+bA=;
 b=VFArBynuNp9fwJ30tp8LNLWky4hE5vIQVq5VsYIKOYZ1IM7Mi9OszocOnH5iS3uEHy
 gE0nzdW2PwXwmhq5moDcDfz04SqtedMrT39mJpjt24uTeKAKjWFCzemproLf9ax82d6y
 EZAyq8HvazCeZ5768zO9w317Jx4XhE39mVE5YlqTZ0ivDmA7kDVkqKFbo/nI1iGIrVLq
 ooWTZMHk/ILR5f+aHbJNZnla9ORO3bS+KBq1PgaQmu9v4CR4kgDkKenol/eLXOGd56XW
 mzhTDEKJnsM3UNdNGbY5OaCDx6jwWj/lQ5WLkMMQ2qavefImc177TECyw1mpH4eUXBhg
 5YYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795628324; x=1796233124;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Yg2rtayaj+yDc6xyYp07Hyzvzpn7tMq3vAWY1vPC+bA=;
 b=wBnZBSK5XaTXWIRHJdwY5JBTC0SKIJ7cxfm2kM1O1mbZNZ3HJ0mWAVuj0XkQTWo8ay
 7ZPfMt5tV48zwHiK8mY0kMiRgwsRM8dst+Nkyww5pZRrrh6swyfybOMhjVtPJNRQ+DV6
 4ImSDVeBXplIm6JVdC3PJJm/oyydVf/7Wo4RNLBEylX6cuaKhVQ9q38qtVUPKNlsxsfS
 flGGDeqqv4Kmj5tY+lomMJJeLuyGp8va03PoGZSrwQ1Rg42Y/LlHBPm4MQUaGkTGMsDC
 iCwSl8ZL8Pybi2/bWN53GSd76Q/QL7HkgO4ETx8fptdEV9T6dXG9APhmfve80fGsQIUt
 gQiQ==
X-Forwarded-Encrypted: i=1;
 AL+hErF74/s3haMJ110R77h9pMLBqim6zNRLC38nSUfiLaU6veqx7Zhrsa4RCYJTgHU4tIygDvjfE/HZCXQB@nongnu.org
X-Gm-Message-State: APuU4Z9fstB2aLP8JAv3dQMqztMTxXzaJfafWJd/XvFwY5KXBBLQeDFM
 KMQ29EnWzHacmieO2MCUZh8c35JRjUWoNrugH+68EahuVrM7aE20QyhMlgGVyalbcx2MTwAD41Q
 SyJpxIuHPJUpwlcXpsy94pR0FqIkY6Dnt3HD7jjSONQ==
X-Gm-Gg: AZFdTZeZKMmO9+e15SS1DFz0LexE8arsKU0Byhyw/++tNPlGwno61I1lKT111/kuNRB
 NnQjFMpMRk/HDwBpm0cpNNAX+J9k8piNn3U0BlsalJcjB870KLguPd+hdt6Et906Um62NDaS1Oq
 78uHyvLwu8Cwju/HCVgn+XfDol4zVIl9VllGxz8aWMzsNDRLei6WhcX2juv1whu7AvemU9F3Lo0
 uxosmftBV6FeTMpj567sCwvbvcPcxdzha0EFWraaJP0BsUNgHiGOmH6uuHgPaHBlbUhWYe3q/PJ
 4Jl7NJJg45ZLyyVSxsYlBDtEbHk8aGWIaedc+ao4+iuJZm5K4ktE7mspEmJXTEB8phJKi99nL54
 trilEeA6winOKgNqk3uCi2bSpa7Xtk+CmxtwfniFXSg+9P1ABjT6twEh2+L9ruFQ8d0apfuPncb
 iMArvwCz7ITsQ9/u6ol1T8rv8CXQ==
X-Received: by 2002:a05:690e:b84:b0:67d:c045:d0c4 with SMTP id
 956f58d0204a3-67df43d0811mr8510530d50.19.1795628324363; Wed, 25 Nov 2026
 09:38:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-spacemit_k3-v1-0-e911d6e88542@oss.tenstorrent.com>
 <20261125100604.128764-1-w1355457260@gmail.com>
In-Reply-To: <20261125100604.128764-1-w1355457260@gmail.com>
From: Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Date: Wed, 25 Nov 2026 11:38:32 -0600
X-Gm-Features: Aa3M54puAqjfTj-0Ucj035gGMODhbk0Tuntpvz1M-3rvT8iwGPSu0Yk6VtdsU3o
Message-ID: <CAEev2e9YBm-rA1+-mmw-qF-5dLw7uO0o=knHh30KAyDVepBsfQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] Add Spacemit K3 Machine
To: Zixin Wang <w1355457260@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Jeuk Kim <jeuk20.kim@samsung.com>, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Nov 2026 15:02:34 -0500
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Zixin,

On Wed, Nov 25, 2026 at 4:06=E2=80=AFAM Zixin Wang <w1355457260@gmail.com> =
wrote:
>
> Hi Anirudh,
>
> Thanks for the series. I have also been working on a SpaceMiT K3 machine =
model for QEMU (a Linux-first subset that boots Linux through OpenSBI), and=
 I have qtests and a functional boot test for it locally. Since your series=
 already covers the K3 machine, I will hold my own version and not send it,=
 to avoid duplicate review effort.
>
> Would you like help with tests for this series, or do you plan to add the=
m yourself? I would be happy to either contribute tests (I can share the qt=
est/functional-test setup from my model) or boot-test your series with the =
K3 SDK images and report the results, including a Tested-by tag if the test=
s pass.

It's great to hear that others in the community are also interested in
a QEMU machine for the K3. I would suggest helping review this series,
get this upstream and then add features that are missing.

I decided to take the firmware boot approach since we already have
many machines in QEMU that boot OpenSBI/kernel via -bios/-kernel (you
could use the virt machine with the x100 cpu type for that if you
wanted), and the full firmware boot approach felt like a more
interesting problem to tackle.

I do wonder though, the tests builtin to qemu use kernels from
tuxboot, and the newest kernel version available there is 6.18 that
doesn't have any K3 support (and no dtbs either). The builtin OpenSBI
rom is also older. How do your tests work then?

I will probably add a test that boots the fw via nor flash (with an
image hosted on my github possibly?), loads in a kernel/DTB/busybox
initrd and check if we reach a shell. I need to figure out where I can
get a kernel/DTB for this.

Regards
Anirudh Srinivasan


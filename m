Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E77CDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 23:10:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbnm4-0007eE-Ps; Mon, 22 Jun 2026 19:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbnlz-0007dt-Hm
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 19:09:48 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbnlx-0004s1-98
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 19:09:46 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-697763eeafcso4523592a12.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 16:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782169779; cv=none;
 d=google.com; s=arc-20240605;
 b=HZHthveWjE4Ov5KplrK+GgxxZg0s4p9WO6hSG6hSDk0ctVqNF6om8jZmkb7wYFmPGz
 sL+xgPLmqzDXMl9HJygW1PF6qZpvwsxgFpG2AqIcu2CMeO0kvwokCHSR62nl2NZiZzMs
 QKy+WMQtfPiLh2PNt+cQPc7EFlfWtYSULXOsMo/8LdEeDpRn6KjQvLyDiQ8GXBQY+QmE
 UnCct5KoWSm/Ol5ZjKMQtQXwwgE0vuItVnKqCzsIaktBP/N56JbHOw6q8Dure1CjaXbG
 lgziHAzQkIx4Rt5udNppzaqZsE0JOxnH9SkNs5t+feSUR7c8H4BDYD2jw3iRC3KcNgSt
 izzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VF3TG2gtqIyGbdIS4yQwutDPq2xLOLzvSeDXg4wDbX0=;
 fh=bSnhJr5RhiuAwh6OKmhVAxIPlxaU2reTfn/kyubXlkY=;
 b=cbJlPeuq1a5IRcEL0QD6QaRhkvIs5EnLpNsEsNIIEcGAFaKKXO55KhbYx0aZ9xAVL/
 4fhCVp2+7X5SrMvOEckT26uKb4uKVVZ1nF4oK93XeT20D5JNHNt9qLeSm+KAwm8MzNf0
 CP4psZ41aIRaZVkazuZukIZ1+Do/2ME0AjNUB1o2M0QFKpUYQ2CgGF85sO4PMDWV99iU
 LFASjj31QhzRIJ8CN5U4CVxll6aNg9Bqb+yQXkHnO7zxgipj4cyf0Fgx3Hy3pEdgr7xn
 GwxI+VQbJH4KmXUyPajN22JNU8mL4m6/JwhSzimP5fR2H0h5EUJMMHWEwTJtIAHQSacd
 zaOA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782169779; x=1782774579; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF3TG2gtqIyGbdIS4yQwutDPq2xLOLzvSeDXg4wDbX0=;
 b=EAYvSZkP+f4dsCgGoh1M63zLrL+VWUOESR1cJfMwPXLIYHXlGwsnf1LtPfk7uMzuCo
 IIE6oSZid7b/o7lql41wOHq1m7Z1onhnA+50PFkddrC4dXigw4UkWeIcSm09b5ZPJ00T
 KgGR/f2G2o1eDqWCuvPN1rFQEzLXGWsAaQ3Lp0EuKw1Z7k2BJC37TaGCY28Sc57TJ9Jv
 xdnFLRlDsx8NOYerWEG5eM5Fr51OZGhLya33Apa7ZEWDB8E3vlAhHjwE6Nzwp0XMhukL
 9rwlyk3gISMHCMhEraRBSbZgRftWLMPRjxsREKod41iaohdXx5Jc9SGO0xydgbu2djmi
 4hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782169779; x=1782774579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VF3TG2gtqIyGbdIS4yQwutDPq2xLOLzvSeDXg4wDbX0=;
 b=Y5sn6TOqiaXySdOHKd42LK9IeWhSbut3SewiM7LAoaTrRhs2+14MgDYo3B8TF5TsqJ
 VpF6GBcJPE+vw8WdcEd24G/z/Mo1/zPbTattTbe5QZ+JMu86zbAMYDffrVaIIrq09aNV
 JDu1rw8sICG/2r2gaT0VNoxPyxaTJAKYbiOft5zIZ2gNyVjtCjwpt6bYchbtOV85XEId
 fg1KX7nTOYEYK5FHUD21otdS/JjgMX2x/m/nJrtf2w0vtDDmvPOsKYkhfDPAh32pPQrv
 qU5mg4LYLreGUmtfyxSod4PVCnyQd8xoVHCRMTOqiKK3Yk090Al+aCHsViDLtwhrRl/P
 VcJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kTF8u3jcLYQJkP1FQLURc1nUCBDac67FfJp3oAi9LaJFI3ECK9N75d/CrSQD3lPHC8fh09Z4On7OG@nongnu.org
X-Gm-Message-State: AOJu0YwcCM5UqBrEu1R0T+/72fCHj2KNPnZCwDxTlMHCLnVBtEW6V/Iu
 vWEX31yh5ygw9bF4ifwe6xn+iNTBGkqitvYm/nLrZ0R4X99y3nLQAsQGxUQwm2+7dDGMSNQeRmR
 OZ4KDwKTffr+/izc3ZxooGn3x2OXfOXw=
X-Gm-Gg: AfdE7cmjbF61uRQ+a2CFnRJCZ4MJUlzJfGatkfG/iqqj76rMtSNgIxnmwnLGZjwJrUR
 2jpR0jOL5G5eIajvcGIiP+mW3+ln/7sWizGoD64bjBLmYMq8fWRNL8nPtVOEDVPgOYCAjbXkemQ
 9F9rXHIvavl06fbmWf/BBWE9PtWjn2MN2Gv/LIbSaToq9SxB5iMIE1FfntKdzwiSdZSlLNd0ALM
 4/jqta3AAyapWtGnd0Md8qHKjueUM0TmQKQL0aC9FL+yuBUhqHznSgxgY7V3H3RUbP1dIpjJ4fQ
 YagFCP18lZ7rdCl3GIxlvArBUns=
X-Received: by 2002:a05:6402:40c1:b0:697:dbed:d57f with SMTP id
 4fb4d7f45d1cf-697dbedd8c9mr29144a12.1.1782169778983; Mon, 22 Jun 2026
 16:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Jun 2026 09:09:12 +1000
X-Gm-Features: AVVi8Cdvx5HfqsWa9PRR8D-LIAUE5LmaJjxA56zqAg7XcoISteQIu4NaZYdsOaA
Message-ID: <CAKmqyKPvAqdH6_PEJnPJOCraiq4LZ=DWsdTWUME-cdxWb9UZTQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/riscv: more FDT cleanups (PLIC)
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jun 17, 2026 at 10:00=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Hello,
>
> Here is the follow-up I talked about in the first FDT series that was
> just merged [1].  This short series handles just the PLIC controller
> FDT.  This time there are 2 FDT bug fixes in the mix (patches 3 and 4)
> that we were lucky to find.
>
> Expected changes after this series are related to patches 3 and 4 only:
>
>  $ diff virt.dts virt_patch.dts
>  189c189
>  <               rng-seed =3D (...)
>  ---
>  >               rng-seed =3D (...)
>  285c285
>  <               plic@c000000 {
>  ---
>  >               interrupt-controller@c000000 {
>  297c297
>  <               plic@c600000 {
>  ---
>  >               interrupt-controller@c600000 {
>
> $ diff sifive.dts sifive_patch.dts
>  >                       #address-cells =3D <0x00>;
>
>
> Patches based on master.
>
> [1] https://lore.kernel.org/qemu-devel/20260615203734.954428-1-daniel.bar=
boza@oss.qualcomm.com/
>
>
> Daniel Henrique Barboza (5):
>   hw/riscv/sifive_u.c: remove unneeded qemu_fdt_get_phandle() call
>   hw/riscv/sifive_u.c: use intc_phandle in plic creation
>   hw/riscv/sifive_u: add #address-cells in PLIC FDT
>   hw/riscv/virt.c: change 'plic' nodename to 'interrupt-controller'
>   hw/riscv: add create_fdt_plic() helper

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/fdt-common.c         | 30 +++++++++++++++++++++
>  hw/riscv/sifive_u.c           | 42 +++++++++--------------------
>  hw/riscv/virt.c               | 51 ++++++++++++-----------------------
>  include/hw/riscv/fdt-common.h |  5 ++++
>  include/hw/riscv/sifive_u.h   |  2 ++
>  5 files changed, 67 insertions(+), 63 deletions(-)
>
> --
> 2.43.0
>
>


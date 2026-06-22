Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75799CDB46B
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 05:00:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbWly-0004sz-AZ; Mon, 22 Jun 2026 01:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWlx-0004sW-91
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 01:00:37 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWlv-0008OW-EQ
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 01:00:37 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c07d76ffd0fso366533966b.0
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 22:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782104434; cv=none;
 d=google.com; s=arc-20240605;
 b=DtEh19xlsfxbg1xrxu4p2fqzbMgfWSf0qWuWUapK2rj2Q3mPlj9loKWMvO1by+/PkH
 A9Xi7A/9bKq0TaczRziGne1bD1T3/UF7mxTPY7Te14Ot6oSBp0lCZRjGESVYG89lo2v2
 qp/ag7KmJet9dQ7OoD4+4//ydN0CNc/NKfubhb7ZDs5nOzGH7Q0K/Q9IaKN+r7XhM3Kx
 YZo2KgxBhVrI66G4JQsOfABRHMA1xVauOfClXpF3NJiZ0NQZn23Mt58npU76BaWAR98m
 M5+N3NRcoHHEAEMTYL3KWOG+5fYHRHDU7Uaai/7B1n1AB3unCkmChxeC8E2jKaQs6lIF
 XWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BhqkaOqXBinUIqi3QUMQOFwpWUMds6go2D7ktKXVaqc=;
 fh=FC+FVoL24U/rxYaKym4voX/9byc6PiPm3d7aZK7KSl0=;
 b=RA+ic92daXbtbTswirvDCcF3quWpNVSJNfqPg1sBh8sbEolqY3NPehFPGsBBj1Zk3D
 dunnS8M3+yeSAFqEaGwgBDaVIOrc98my8DxNFkVuSJ+KeVL/dC+Bm4DQkeemlkBXhfQG
 iEDeJ/neendFzFqdE6uzUzpssIzFgJz/EXccm293qUXIZbESDjMUYgOtFRXG3mUaCzR0
 anRJ+tW7uY2nwbfs+FZ0CmsOkBOeuiYmnf5bM3l/QVr/e5a+mTOC7KYx/yKCzAylG5UU
 cadohOIVZltYapJgO70cprWISr8LEiC3VSSxdeRCa2tI+0ZmlLyG+tIfcmNJxgmjlWvM
 Xfsw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782104434; x=1782709234; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhqkaOqXBinUIqi3QUMQOFwpWUMds6go2D7ktKXVaqc=;
 b=VE+W5QrInidYbFWBpRRwaGBwxtr8hem+/GxORdsDbiFhT2kdP7jebUbAcNI8w1X/Y4
 ZtJKflkHfHcQqxU31PIrm4x6M9zey0Y9itBSxcN4mxocZOmB8Zz8B6UanTi6TJIC0sa8
 13OoLeJEfORFPrf01xI6Uj0C83u2bd9WDCX9Ex0fYOQakF7HIvZQktnlmDw+Kmamd/hZ
 iUSFyQI+7PB9wCfuHwWdfD4iBR6EkGY8PFg9MipBtDzEpwS7IUNGsKZr6wmw3T9gD0hR
 6nIka6yBpC9WLtXc6xKwLQ1RLmxBsdGJaOjT5OX+tgZL/v2E4MUTs/xbfYIarrJO58CB
 qFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782104434; x=1782709234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BhqkaOqXBinUIqi3QUMQOFwpWUMds6go2D7ktKXVaqc=;
 b=pWcbRbpusleUs7HCNYJE5pHcHaBbVW/OQSfSWSzEQKtpFI/GiF8MMbetLMZyL1EO4U
 xDI4ltEkreHRoueyKmSKJfxCwOJtw5jKSjJM+376ukln2miK7YwKrd2YQsBUub5dQQfe
 kbVFVtp8sNU1XRqmJol5tQO4fE+JcKKxB0fMxIDFo6CiS3W5RnhsLk1X6KhhCaAwC8Bz
 oVA3akMb6TeCbc/Dq3JkHoLKhgwqPGoBYcjyVhgG0BlLormgho9BlxLUrgIzMRTby652
 jYT0ssruwtlxLd+2spjMlLU/w3mM8aes7/+0zNHxblX9OjpxzljkK+MzN5f9gIhTgfR5
 +xbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7wFrGhF0Jsnhcfp58uISZPYlIYbd9+CH6b422T9JlEng6e1e/k1ISX5lXEZdsrZQlIbOiGRvUK/dG@nongnu.org
X-Gm-Message-State: AOJu0YyZXr9meADjYeRVNb2MfGTxpnKsXPMEsZI2Jogsb/vLAZrBO1Kz
 uInUcP8/7uy7VpZJDCrLOGYmVvHRmX49Lybw+fhTZ7pYrrRz/DZ9HAFySM7tunmhonM3W08Ruwa
 FQUsvADw2kvRAOEZbF0GCdy175VhQCwI=
X-Gm-Gg: AfdE7cmQVO98hmNJxGk69XhFMw9h6oGJ6M84gSldcN4poHG2dPnO3UjyZU1/01vFCq/
 vb0sbj6q30gSRDjd70i+JPKpy99wspCV/GtiS87TIfvQPqFFYbstx6l4f7+Ybk/4OfNSv2cUi6N
 WbXXjLB3BQv3PinyHQyJF/n8NF8SLeB+ki+9GN9z/lS0Vx19SWcXO7kwvDcqgc2iy8wGAFM1R+Y
 GNq7vSF9G6EG7PLoyKWxW7oSYlekiBYbpkP3m9Y/wHI96eErSpxVXVhwJnnZ7aOZO70ZgX7W7B9
 qHPIc89T3ijsTPnTB75TgFtURSU=
X-Received: by 2002:a17:907:7b8a:b0:bef:87ca:aec5 with SMTP id
 a640c23a62f3a-c0b75785b9dmr643252166b.47.1782104429338; Sun, 21 Jun 2026
 22:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
 <20260616235939.1358663-5-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260616235939.1358663-5-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 15:00:02 +1000
X-Gm-Features: AVVi8CfR7fOc4rHUydlOD2g0D_97RleexCXhz_lQ1BOeAjHsrLhenUrHK5zjztI
Message-ID: <CAKmqyKM-J2VTRqm0s9LqtsePvU-U0Y0FPoaJovF=YS2d04XkXQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/riscv/virt.c: change 'plic' nodename to
 'interrupt-controller'
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62c.google.com
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

On Wed, Jun 17, 2026 at 10:01=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We're still using "/soc/plic@..." as FDT nodename in virt.c.  This is
> not the right nodename per the DT docs:
>
> https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-co=
ntroller/sifive%2Cplic-1.0.0.txt
>
> The nodename must be 'interrupt-controller@...' since the node inherits
> the 'interrupt-controller' type.  In fact, ever since at least the 2020
> Linux kernel commit c825a081c169cc7f ("dt-bindings: riscv: convert plic
> bindings to json-schema") the correct nodename has been
> 'interrupt-controller' for the sifive PLIC controller.
>
> There's no deprecation needed for bug fixes so we're just fixing the
> name.  This was the policy we dud when fixing the aplic [1] and the
> imsic [2] nodenames to 'interrupt-controller@...' as well.
>
> The sifive_u PLIC FDT already uses the correct nodename for PLIC, so it
> is safe to assume that available SW is already aware of the correct
> nodename and this change won't affect well-behaved SW.
>
> [1] commit 29390fd ("hw/riscv/virt.c: rename aplic nodename to 'interrupt=
-controller'")
> [2] commit e8ad581 ("hw/riscv/virt.c: change imsic nodename to 'interrupt=
-controller'")
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 33775a61fd..fa464e644f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -335,7 +335,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      plic_phandles[socket] =3D (*phandle)++;
>      plic_addr =3D s->memmap[VIRT_PLIC].base +
>                  (s->memmap[VIRT_PLIC].size * socket);
> -    plic_name =3D g_strdup_printf("/soc/plic@%lx", plic_addr);
> +    plic_name =3D g_strdup_printf("/soc/interrupt-controller@%lx", plic_=
addr);
>      qemu_fdt_add_subnode(ms->fdt, plic_name);
>      qemu_fdt_setprop_cell(ms->fdt, plic_name,
>          "#interrupt-cells", FDT_PLIC_INT_CELLS);
> --
> 2.43.0
>
>


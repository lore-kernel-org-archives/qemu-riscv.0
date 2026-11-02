Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC8606A324
	for <qemu-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 03:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmlTzYeL
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNiP6-0003gQ-UC; Sun, 01 Nov 2026 22:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNiO9-0003Pw-6e
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 22:07:15 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNiO6-0006XV-GR
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 22:07:12 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so3208947a12.1
 for <qemu-riscv@nongnu.org>; Sun, 01 Nov 2026 19:07:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793588828; cv=none;
 d=google.com; s=arc-20260327;
 b=O54ttnRbfrjWU4QR7IenCZtNeSSRsehaUC5y8VyaDdjGG2rlzjRiqb1AQyjA8MoZPj
 /swQ67BfEUP9ilFCuB3L7x8uPTngrZfyV9/CixQkjeyl9pGSs4wiGLl0QagT/4mw9zCH
 dDaP1SrkaycHxOwagaO/H5jmV/VA0QOXZz6OxPJo02DCYNy4cAEHStH2xbi23ir60ksp
 F7os0+kcOKW2vm9QaNWGogkxpvIMztppYWutnxAeE8EgL2ePh8Ovv2AlrG02Q0p/6O+w
 Z4Jq3YY8BMbWTUmsR/uLjd3/vkqK/P/jBTetTt4kigBqmjzr+0IQjto27nguLgVRCDqc
 dsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=Ysznio8LIhbrNhMwmFi6gLvF+hQtGM6cCyNInXytu+8=;
 fh=SPtGnfSWoGu5E8Ovy6U0R/eEFkNanQuvFtGXUCaU/xs=;
 b=gU2l+yFX7E64e3B4y2NO6dCKyTXoig1OdKBxYQJaob7Og4JcC1jyU3gn8kgKCTe+55
 804rCT4iW8Y9/D1Vk25ATo14EiDWnc6h9SZ7uBzZrBNnc9uElbl9/gVRX2p2HNMccMi/
 zZ9QlkWk0ifK3kRHVGTFlAcD3MGCEecsXQDm78GG4f+85Ag33n5luQ3VWTbYKTW2itcS
 Sw5/4C+b6AaAAfF0ggdNC5SIEq1OqUXdt3H8OBsD6U36UHV7U8pJzauPHSgdJMYr6OAd
 icxLjXtym00kwnHGlBavlmeSiJ29ARCwyAyy3NK2ca/0axwEYXm/HBHQnXqRb0UmTxmJ
 k3Bg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793588828; x=1794193628; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ysznio8LIhbrNhMwmFi6gLvF+hQtGM6cCyNInXytu+8=;
 b=EmlTzYeLksk+ib29A3uFeA8n9+SLTHgajQPhSdgbOS3zZsOrMwZPpUbMa2yraquHEL
 E9L9UPi5OSQPL/dOB5Ms1dOsDkzagwvJoNR3PLoUTf8fCfj9/JAKnBUAQ0Agq+X1D1M7
 M9p7RyLbMq0vP8qfNS1ac4Osp2zn4XZU08V0ji+eVi4SQRUX95BC54EO4OPrqSbAGUz4
 NKlBF15VxCBTAWE/OaSbp/jcGBkMh7/qO1+SeHEFaRHWjmgF5gK9NiB4c5f2blGVEBlJ
 bxI0SGouWqGPVJr1KQANEUnjCvUZwcNnYVBP9c8UJw/w6O27CErW/7IMy/zceOeqsdc/
 E/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793588828; x=1794193628;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ysznio8LIhbrNhMwmFi6gLvF+hQtGM6cCyNInXytu+8=;
 b=fteiNI6P4dzPCwNrJLZSma56/SxQqDNK8K+IfCAQeFZfCSk1mOuAmDQf2LJ7c1ApHm
 6E9kw32edTLfhBPkVtDn4+MyukTr6+TNe1eq1VtaonTANzwXClC/4RvwFjI1lQ9abWO1
 0rdpHvzXviYswQkfFPDO3pZZc42zcZ1DQAa/jyNw64A4MQXcqmWW5WDAI1DcXVnvXx0/
 qCsuJjpyCnzRau27LSwiLlaZj3SpRS3Hi+pB7YoXbmD/eaEXO8il6fHo5CQp08N/Ug5R
 23oQDg+BfXysfUwo3Dlm00MJcesn/Az+yvRATLZnBXxht5x3O3z3KHh9wLcORNz67Nab
 on/Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwIOQtUSNxEmL2IV/bAVm+4SPzGOrnGhk/lpDa+2vyU7lvUL4R0TxP1vzTQ0JdeSbppQiGuz6X2DgDa@nongnu.org
X-Gm-Message-State: APuU4Z9+lXeJN9uD7Ly7kAmXneimH+k5i9E9H0E7C6IWyeG6INyfdAeG
 wEp1d/w+9Y0I9oMpPc6NeLExvWxSTDf+EiZ9sa7pCbVx1UJ4nWezICdDBbR0Sijg/XF1/0VkPfX
 wnU9EN04IEBb9x7QPHRmDKcrge136afc=
X-Gm-Gg: AYBFou1lbKtS+veNKShMaBV97+an4Jvlu7H8FlrO4ALT0CntMNofUVVTe2sItL+o68Z
 UYCEEctMjjxJ2b/Fw002MaKlrmGKTacZuHy8RwWXhBlCEjsWNURxakbSipOzIqfui2skBx33JwZ
 bTS3/Gs8WGkG4UObgihMxMhcQ3Rx/41/t97kHJexzRwuLUBeA3ZIVHT6i/2Wt1lGYMvuiZpTs0T
 MX4583+TcHX+4rjwyRacywQa0/O4i1o+5ux3bOPnrQOIdU/3A4lahT3IG6zi6lbgEW7zcMdu4C5
 7RA5S/3JwGLQg0UvO4Q8NGaTSP0kG+cC8EK4s9wgAGOKg+QRxOY01c4N+/LHU8eF/9AehuWGKfM
 PLKUz7A+8vNS67p7dXqHh+JLvtQwefxdLmGZ7
X-Received: by 2002:a05:6402:1cc4:b0:6b1:c774:58c0 with SMTP id
 4fb4d7f45d1cf-6b4d4d812f1mr6163810a12.31.1793588828434; Sun, 01 Nov 2026
 19:07:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
 <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu>
 <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
 <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu>
 <CAE2XoE-2w3A4=BeskGgp7NYUtkRVNkNufu4SZjW_OQ-KAQZvhg@mail.gmail.com>
 <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu>
In-Reply-To: <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 2 Nov 2026 11:06:55 +0800
X-Gm-Features: AclHuK8P8SDKQOupp80GFDOIHp3NTFl6EuHgXjfpXxX0vFgO-CLq7hQlTWSRT8g
Message-ID: <CAE2XoE_Nf0bpoyYuW9G_OWAx1J83iANRf_=2vr4G_BqgRZThPw@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
 Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 4:57=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
>
> Is this conversion needed for all machines using all DEFINE_MACHINE
> variants or only some of them? If the latter why not convert those to

The is_avaiable add/remove no need all machines, only a small number of mac=
hines
need touch DEFINE_MACHINE, I'll do(expand) them when needed.

--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo


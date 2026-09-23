Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81063C982EA
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 05:58:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Fys-0002SF-SX; Wed, 23 Sep 2026 01:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Fyn-0002Re-8o
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 01:57:17 -0400
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Fyj-0007Xc-Ab
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 01:57:16 -0400
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a60590a85cso1164483a12.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 22:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790143031; cv=none;
 d=google.com; s=arc-20260327;
 b=TfY0jSasN96ejlgmvLxqdg/4VnqaVxkeHCkxWm66bk10F5QPa+kp6KImrlTj9CKOrW
 6fcPMJssADELrr42Dx337bHMVXh5ODRUEtuTC+BdaaTMWLT5Uj89wEOvREqalhclk6J4
 iv0nz2mX2uOXyEuMv3VGfV8GKK7djTGrBJC21Zl03FzVMwUA4fP5eHmKaUDMXIi3Qzbf
 bsS3JakZJFQVW/P9/eny3Jxhhza2I+Lvlb/9fdlaSYUraXAyLoN0W+7vDmfDpNCvWKo1
 M9utHYhNsFDMF7hcMP4DFCS7a4aSKNr/g6Q/dlZJCEYUHj/fpONy4jI0obgKjEjuT/Dc
 uZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=P6Kl0f1VUK2svuDgbEWk+b/FJveOKRfnruyud2X7jk8=;
 fh=a8TXBSyVCum/4BJoTtbp7iFsTkDcarbizPSLpMP6Mg4=;
 b=PnXUe8wm59jkESWwwOdb626HrCmc5oIAu5NqUPS8UUNYLZ0UC8jGzSYxwMafOY+GKb
 FFmMyJMvQyPOzhnRY3Wb9RS8p+YYxuR0nfgzMn83Myi5/MIc9bZQWAmoU9b9GDFlL81z
 amqFvtQRg9/RbO2pAuZFmLVL9ZH2F4rQ6mLLFfd66GoMT0m07oqUF681h+ch9sFhjbAW
 XJsdNLZCBbq0gcM9GQQlDusOBUKZmJClzaqIXban6N+WNaRIP4pDI7Ux4q+Vyyv0MPdP
 4FbOiDow9LdABUm8VyOKB1PfG43jpRFp0FUM/+a+x0xWVsHxSjWaNyc7JJeUNuU3e1pm
 vLbQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790143031; x=1790747831; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P6Kl0f1VUK2svuDgbEWk+b/FJveOKRfnruyud2X7jk8=;
 b=dm1QJlqT69X/lkxNuADtGPkKAjwnz9sXbJllZSar0YrzVBCeIksjaZmGHrYgaTgP81
 aN68loSxq/W0OozUsMLYwSagmEn+ODepH5kYdUR6hAYZtxCv+9gtnmQfqZVo6Rw8WA6P
 BfCHGTqFLvlA3K1vlhrixxqzoWXeErz/uKmftNo7bi2ztwqiZ/dGVvw1EQ7fW4VE+CxB
 IBX8WpcxD5HtIT9dPw7kHyj6JxZoWzNQMymvYJuPrg4qLMBQEHKTPp2VVUgvZpAMWFku
 MoI/YhrDPq0iA4c09mPCZEBKyQ6P2Vg2AQ4qos6KJHvtC0+IhPU8ubQDoHAV9jJd5ADs
 3Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790143031; x=1790747831;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=P6Kl0f1VUK2svuDgbEWk+b/FJveOKRfnruyud2X7jk8=;
 b=BFl9b5EnM0FXoZPctXKASbap+owsYho32xTPz7vZ0HEYkkgrhRPbbgqAykSmfQh+K/
 yurIGBO4pPLM9guDs6shgcInS2XtAMO4u4tcSKSyfA5kVW349P9f4tJaAdaNgBI2C2ns
 iR7FUPS4/rFtXXd4L00ktQAxOOPkW1Ltr1P1JYMlwPwDwmA/YuoWo/QgMTdveH2Cq4gZ
 Ky0OLBf1cG3BrRQ+IzoTe8iNCY7+HyohIC2uqUw+aasc4g6uduRsboL6fypyQa6pta9f
 dG0/JR4K4GWu7ctMpq/GSQ1Hh48GIjvIFEP9HjP1NcZrWc1RRC8MM2tj7jQDqqclX7lX
 wCdw==
X-Forwarded-Encrypted: i=1;
 AKwUvByR3ODkX2eGLWhy8G+vp4KlluUJKL04+9lO5lRyPgL9iVRdk7OaxW72dBVuBkTpaM8GhnoKwduyDRJr@nongnu.org
X-Gm-Message-State: AFuF++nCwRQ5nUGAjTPkomU/2pIL1yKDgrlxEpZqBujt4IHvPlTAG2qi
 WXQELcSZeSetvoeky02aWz3Ii4BZa0pfQ+mXsggGZLPGgKHQ8eheS5FRycICvr3ksGdmlW2i5z6
 U+gxocr6tUREYkIQROh7moMQloAu+gmQ=
X-Gm-Gg: AYBFou1HQxtYYosU8DzHeRmUNLEKwh1FTn8nowHOLxqAToRtzTVAAMvq2ERft28ln2d
 LbzbW+UTQw8x+MUP4RUt3RPft9QB2awZ7b5EDUKn4CsGe03V+W08qpuxXy7cwCK3ASZrDcIXE7q
 OFDoAwIKiyo1Re44/PjZ4apoY5F5cr9Y1xY1ZROh3C6LY/TaqFIlzCLeC9FPuSiUD6/Yp1RI6+Q
 eAfjYLVvGLM5mrymYRHDERBE5HAr8wHwmEfpADG7oPNJIgWAhj928UONh1SyyYreupIzcHqGK3S
 451uPy5ISRUKeHwxrY1XV31Xhsl4XTk/wCQsWijm1GEKbTNYc9yG9Ko=
X-Received: by 2002:a05:6402:3508:b0:6a9:cb55:c594 with SMTP id
 4fb4d7f45d1cf-6aab3b7fc01mr1222699a12.37.1790143030851; Tue, 22 Sep 2026
 22:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260922215533.641-1-luoyonggang@gmail.com>
 <20260922215533.641-2-luoyonggang@gmail.com>
 <5e3818d6-c2c8-4450-a5dd-8ac8ce1d6cdd@oss.qualcomm.com>
In-Reply-To: <5e3818d6-c2c8-4450-a5dd-8ac8ce1d6cdd@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 23 Sep 2026 13:56:57 +0800
X-Gm-Features: AcwNN1X4-hX5qNXbZdXK_AEGqMd-iBYuFYFlUBxCX90w7ygF_5eKx5RSbcjhcIw
Message-ID: <CAE2XoE-HztrQY2=0tsjO82OpXcKkubQBVo4FGvgwHRUQcyFj9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] machine: allow -M name to differ from QOM type
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <lvivier@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>, 
 Song Gao <17746591750@163.com>, Markus Armbruster <armbru@redhat.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 Stafford Horne <shorne@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000737f72065c2027c1"
Received-SPF: pass client-ip=2a00:1450:4864:33::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000737f72065c2027c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:01=E2=80=AFPM Pierrick Bouvier <
pierrick.bouvier@oss.qualcomm.com> wrote:
>
> this indeed allows QOM types to coexist in same binary.
> In such binary, how are we now supposed to differentiate two virt
> machines from -M <name>, given they both have same alias name?
>
> Regards,
> Pierrick


# Machine option demos

Intended design for combined `qemu-system`. Implement to match these
rows. Last `-M` / `-machine` / `-readconfig` wins. `qemu.conf` is
applied first.

`arch:name` binds `arch` and picks `name`. `arch:` binds `arch`.
`x86_64:` and `i386:` then run that target's default machine.
`aarch64:` and `riscv64:` have no default and exit with
`No machine specified, and there is no default`. A later bare
`name` keeps the last prefix. Help / `?` after `arch:` lists that
target; it does not leave the target at `none`.

Single-target rows are historic `qemu-system-<arch>` and stay as they
are.

## Bind and run

| Command | Shows |
|---------|-------|
| `qemu-system -M aarch64:virt` | Bind `aarch64`, run `virt`. |
| `qemu-system -M x86_64:q35` | Bind `x86_64`, run `q35`. |
| `qemu-system -M riscv64:virt` | Bind `riscv64`, run `virt`. |
| `qemu-system -M type=3Daarch64:virt` | Same as `-M aarch64:virt`. |
| `qemu-system -machine aarch64:virt` | Same as `-M`. |
| `qemu-system-aarch64 -M virt` | Historic. No `arch:` bind. |
| `qemu-system-x86_64` | Single-target default (`pc` / `q35`). |

## Default machine (`arch:`)

| Command | Shows |
|---------|-------|
| `qemu-system -M x86_64:` | Bind `x86_64`, run that target's default. |
| `qemu-system -M i386:` | Bind `i386`, run that target's default. |
| `qemu-system -M aarch64:` | Bind `aarch64`, then `No machine specified,
and there is no default`. |
| `qemu-system -M riscv64:` | Bind `riscv64`, then the same error. |
| `qemu-system -M none:` | Target `none`, empty `none` machine. |

## List

| Command | Shows |
|---------|-------|
| `qemu-system -M help` | Grouped list. `none:` first, then each target. |
| `qemu-system -M ?` | Same as `-M help`. |
| `qemu-system -M aarch64:help` | Flat list for `aarch64` only. |
| `qemu-system -M aarch64:?` | Same as `-M aarch64:help`. |
| `qemu-system -M riscv64:help` | Flat list for `riscv64` only. |
| `qemu-system -M none:help` | `none` and `empty machine`. No other target
group. |
| `qemu-system-aarch64 -M help` | Flat list for that target only. |

## Empty machine

| Command | Shows |
|---------|-------|
| `qemu-system` | Target `none`, empty `none` machine. |
| `qemu-system -M none` | Empty `none` machine. |
| `qemu-system -M none:none` | Same. |
| `qemu-system -M aarch64:none` | Target `aarch64`, empty `none` machine. |
| `qemu-system -M aarch64:virt -M none` | Empty `none` machine. Target
stays `aarch64`. |

## Properties

| Command | Shows |
|---------|-------|
| `qemu-system -M aarch64:virt,help` | Bind `aarch64`, dump `virt`
properties. |
| `qemu-system -M aarch64:,help` | `No machine specified, and there is no
default`. |
| `qemu-system -M virt,help` | `machine type "virt" needs an arch: prefix`.
|
| `qemu-system -M none,help` | Dump empty `none` machine properties. |
| `qemu-system-aarch64 -M virt,help` | Historic property dump for `virt`. |

## Last `-M` wins

| Command | Shows |
|---------|-------|
| `qemu-system -M aarch64:virt -M x86_64:q35` | Target `x86_64`, machine
`q35`. |
| `qemu-system -M aarch64:virt -M virt` | Last name is `virt`. Keep prefix
`aarch64`, run `virt`. |
| `qemu-system -M virt -M aarch64:virt` | Target `aarch64`, machine `virt`.
|
| `qemu-system -M aarch64: -M virt` | Bind `aarch64`, then bare `virt` runs
`virt`. |
| `qemu-system -M aarch64:virt -M riscv64:` | Bind `riscv64`, then `No
machine specified, and there is no default`. |
| `qemu-system -M aarch64:virt -M riscv64:virt` | Target `riscv64`, machine
`virt`. |
| `qemu-system -M help -M aarch64:virt` | Help is not last; run
`aarch64:virt`. |
| `qemu-system -M aarch64:virt -M help` | Keep prefix `aarch64`. List has
`virt`, not `q35`. |

## `-readconfig`

A `[machine] type =3D "..."` file is another machine option. The last
of `-M`, `-machine`, and `-readconfig` wins.

| Command | Shows |
|---------|-------|
| `-readconfig` with `type =3D "aarch64:virt"` | Bind `aarch64`, run `virt`=
. |
| that file, then `-M none` | Machine `none`. Target stays `aarch64`. |
| `-readconfig` with `type =3D "none:"` | Target `none`, empty `none`
machine. |
| `-M aarch64:virt`, then `-readconfig` `type =3D "riscv64:virt"` | Target
`riscv64`, machine `virt`. |

## Wrong target or machine

| Command | Shows |
|---------|-------|
| `qemu-system -M virt` | `machine type "virt" needs an arch: prefix` |
| `qemu-system -M riscv64` | Same. Bare `riscv64` is a machine name, not a
target. |
| `qemu-system -M aarch64` | Same. Bare `aarch64` is a machine name, not a
target. |
| `qemu-system -M aarch64:q35` | Target `aarch64`, then `unsupported
machine type: "aarch64:q35"` |
| `qemu-system -M arm:sbsa-ref` | Target `arm`, then unsupported
(`sbsa-ref` is `aarch64` only). |
| `qemu-system -M aarch64:no-such` | Target `aarch64`, then `unsupported
machine type: "aarch64:no-such"` |
| `qemu-system -M no-such:virt` | `target 'no-such' is not available` |
| `qemu-system -M AARCH64:virt` | `target 'AARCH64' is not available`
(names are lowercase). |
| `qemu-system -M none:virt` | `machine type "none:virt" is not available
for target none` |

## Odd strings

| Command | Shows |
|---------|-------|
| `qemu-system -M :virt` | Not a prefix. Same as bare `virt`: needs
`arch:`. |
| `qemu-system -M :` | Not a prefix. Unsupported machine `:` / needs
`arch:`. |
| `qemu-system -M aarch64:virt:extra` | First colon only. Name is
`virt:extra`. Unsupported machine. |
| `qemu-system-x86_64 -M aarch64:virt` | Prefix `aarch64` !=3D `x86_64`. No=
t
available for this target. |
| `qemu-system-aarch64 -M aarch64:virt` | Prefix matches. Run `virt`. |

## Intended grouped `-M help` (no target)

| Group | Contents |
|-------|----------|
| `none:` | only `none` |
| `i386:` and `x86_64:` | pc / q35 / isapc / microvm / xen / nitro |
| `arm:` and `aarch64:` | `virt-*` and 32-bit ARM boards |
| `aarch64:` only | sbsa-ref, versal, zcu102, imx8, npcm845, raspi3/4,
ast2700 |
| `riscv32:` and `riscv64:` | RISC-V boards |
| `microblaze:` | petalogix and xlnx-zynqmp-pmu |


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000737f72065c2027c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Sep 23, 2026 at 1:01=E2=80=AFPM Pierrick B=
ouvier &lt;<a href=3D"mailto:pierrick.bouvier@oss.qualcomm.com">pierrick.bo=
uvier@oss.qualcomm.com</a>&gt; wrote:<br>&gt;<br>&gt; this indeed allows QO=
M types to coexist in same binary.<br>&gt; In such binary, how are we now s=
upposed to differentiate two virt<br>&gt; machines from -M &lt;name&gt;, gi=
ven they both have same alias name?<br>&gt;<br>&gt; Regards,<br>&gt; Pierri=
ck<br><br><br># Machine option demos<br><br>Intended design for combined `q=
emu-system`. Implement to match these<br>rows. Last `-M` / `-machine` / `-r=
eadconfig` wins. `qemu.conf` is<br>applied first.<br><br>`arch:name` binds =
`arch` and picks `name`. `arch:` binds `arch`.<br>`x86_64:` and `i386:` the=
n run that target&#39;s default machine.<br>`aarch64:` and `riscv64:` have =
no default and exit with<br>`No machine specified, and there is no default`=
. A later bare<br>`name` keeps the last prefix. Help / `?` after `arch:` li=
sts that<br>target; it does not leave the target at `none`.<br><br>Single-t=
arget rows are historic `qemu-system-&lt;arch&gt;` and stay as they<br>are.=
<br><br>## Bind and run<br><br>| Command | Shows |<br>|---------|-------|<b=
r>| `qemu-system -M aarch64:virt` | Bind `aarch64`, run `virt`. |<br>| `qem=
u-system -M x86_64:q35` | Bind `x86_64`, run `q35`. |<br>| `qemu-system -M =
riscv64:virt` | Bind `riscv64`, run `virt`. |<br>| `qemu-system -M type=3Da=
arch64:virt` | Same as `-M aarch64:virt`. |<br>| `qemu-system -machine aarc=
h64:virt` | Same as `-M`. |<br>| `qemu-system-aarch64 -M virt` | Historic. =
No `arch:` bind. |<br>| `qemu-system-x86_64` | Single-target default (`pc` =
/ `q35`). |<br><br>## Default machine (`arch:`)<br><br>| Command | Shows |<=
br>|---------|-------|<br>| `qemu-system -M x86_64:` | Bind `x86_64`, run t=
hat target&#39;s default. |<br>| `qemu-system -M i386:` | Bind `i386`, run =
that target&#39;s default. |<br>| `qemu-system -M aarch64:` | Bind `aarch64=
`, then `No machine specified, and there is no default`. |<br>| `qemu-syste=
m -M riscv64:` | Bind `riscv64`, then the same error. |<br>| `qemu-system -=
M none:` | Target `none`, empty `none` machine. |<br><br>## List<br><br>| C=
ommand | Shows |<br>|---------|-------|<br>| `qemu-system -M help` | Groupe=
d list. `none:` first, then each target. |<br>| `qemu-system -M ?` | Same a=
s `-M help`. |<br>| `qemu-system -M aarch64:help` | Flat list for `aarch64`=
 only. |<br>| `qemu-system -M aarch64:?` | Same as `-M aarch64:help`. |<br>=
| `qemu-system -M riscv64:help` | Flat list for `riscv64` only. |<br>| `qem=
u-system -M none:help` | `none` and `empty machine`. No other target group.=
 |<br>| `qemu-system-aarch64 -M help` | Flat list for that target only. |<b=
r><br>## Empty machine<br><br>| Command | Shows |<br>|---------|-------|<br=
>| `qemu-system` | Target `none`, empty `none` machine. |<br>| `qemu-system=
 -M none` | Empty `none` machine. |<br>| `qemu-system -M none:none` | Same.=
 |<br>| `qemu-system -M aarch64:none` | Target `aarch64`, empty `none` mach=
ine. |<br>| `qemu-system -M aarch64:virt -M none` | Empty `none` machine. T=
arget stays `aarch64`. |<br><br>## Properties<br><br>| Command | Shows |<br=
>|---------|-------|<br>| `qemu-system -M aarch64:virt,help` | Bind `aarch6=
4`, dump `virt` properties. |<br>| `qemu-system -M aarch64:,help` | `No mac=
hine specified, and there is no default`. |<br>| `qemu-system -M virt,help`=
 | `machine type &quot;virt&quot; needs an arch: prefix`. |<br>| `qemu-syst=
em -M none,help` | Dump empty `none` machine properties. |<br>| `qemu-syste=
m-aarch64 -M virt,help` | Historic property dump for `virt`. |<br><br>## La=
st `-M` wins<br><br>| Command | Shows |<br>|---------|-------|<br>| `qemu-s=
ystem -M aarch64:virt -M x86_64:q35` | Target `x86_64`, machine `q35`. |<br=
>| `qemu-system -M aarch64:virt -M virt` | Last name is `virt`. Keep prefix=
 `aarch64`, run `virt`. |<br>| `qemu-system -M virt -M aarch64:virt` | Targ=
et `aarch64`, machine `virt`. |<br>| `qemu-system -M aarch64: -M virt` | Bi=
nd `aarch64`, then bare `virt` runs `virt`. |<br>| `qemu-system -M aarch64:=
virt -M riscv64:` | Bind `riscv64`, then `No machine specified, and there i=
s no default`. |<br>| `qemu-system -M aarch64:virt -M riscv64:virt` | Targe=
t `riscv64`, machine `virt`. |<br>| `qemu-system -M help -M aarch64:virt` |=
 Help is not last; run `aarch64:virt`. |<br>| `qemu-system -M aarch64:virt =
-M help` | Keep prefix `aarch64`. List has `virt`, not `q35`. |<br><br>## `=
-readconfig`<br><br>A `[machine] type =3D &quot;...&quot;` file is another =
machine option. The last<br>of `-M`, `-machine`, and `-readconfig` wins.<br=
><br>| Command | Shows |<br>|---------|-------|<br>| `-readconfig` with `ty=
pe =3D &quot;aarch64:virt&quot;` | Bind `aarch64`, run `virt`. |<br>| that =
file, then `-M none` | Machine `none`. Target stays `aarch64`. |<br>| `-rea=
dconfig` with `type =3D &quot;none:&quot;` | Target `none`, empty `none` ma=
chine. |<br>| `-M aarch64:virt`, then `-readconfig` `type =3D &quot;riscv64=
:virt&quot;` | Target `riscv64`, machine `virt`. |<br><br>## Wrong target o=
r machine<br><br>| Command | Shows |<br>|---------|-------|<br>| `qemu-syst=
em -M virt` | `machine type &quot;virt&quot; needs an arch: prefix` |<br>| =
`qemu-system -M riscv64` | Same. Bare `riscv64` is a machine name, not a ta=
rget. |<br>| `qemu-system -M aarch64` | Same. Bare `aarch64` is a machine n=
ame, not a target. |<br>| `qemu-system -M aarch64:q35` | Target `aarch64`, =
then `unsupported machine type: &quot;aarch64:q35&quot;` |<br>| `qemu-syste=
m -M arm:sbsa-ref` | Target `arm`, then unsupported (`sbsa-ref` is `aarch64=
` only). |<br>| `qemu-system -M aarch64:no-such` | Target `aarch64`, then `=
unsupported machine type: &quot;aarch64:no-such&quot;` |<br>| `qemu-system =
-M no-such:virt` | `target &#39;no-such&#39; is not available` |<br>| `qemu=
-system -M AARCH64:virt` | `target &#39;AARCH64&#39; is not available` (nam=
es are lowercase). |<br>| `qemu-system -M none:virt` | `machine type &quot;=
none:virt&quot; is not available for target none` |<br><br>## Odd strings<b=
r><br>| Command | Shows |<br>|---------|-------|<br>| `qemu-system -M :virt=
` | Not a prefix. Same as bare `virt`: needs `arch:`. |<br>| `qemu-system -=
M :` | Not a prefix. Unsupported machine `:` / needs `arch:`. |<br>| `qemu-=
system -M aarch64:virt:extra` | First colon only. Name is `virt:extra`. Uns=
upported machine. |<br>| `qemu-system-x86_64 -M aarch64:virt` | Prefix `aar=
ch64` !=3D `x86_64`. Not available for this target. |<br>| `qemu-system-aar=
ch64 -M aarch64:virt` | Prefix matches. Run `virt`. |<br><br>## Intended gr=
ouped `-M help` (no target)<br><br>| Group | Contents |<br>|-------|-------=
---|<br>| `none:` | only `none` |<br>| `i386:` and `x86_64:` | pc / q35 / i=
sapc / microvm / xen / nitro |<br>| `arm:` and `aarch64:` | `virt-*` and 32=
-bit ARM boards |<br>| `aarch64:` only | sbsa-ref, versal, zcu102, imx8, np=
cm845, raspi3/4, ast2700 |<br>| `riscv32:` and `riscv64:` | RISC-V boards |=
<br>| `microblaze:` | petalogix and xlnx-zynqmp-pmu |<br><br><br>--<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=
=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</di=
v>

--000000000000737f72065c2027c1--


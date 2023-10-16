Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48141CDB47E
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 02:24:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsDGk-0003wL-Oo; Sun, 15 Oct 2023 22:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsDGi-0003uw-OD; Sun, 15 Oct 2023 22:23:44 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsDGg-0000u1-EO; Sun, 15 Oct 2023 22:23:44 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-457e5dec94dso185005137.3; 
 Sun, 15 Oct 2023 19:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697423021; x=1698027821; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gggVllVZsRUE9SAozXOfdVt6AJq+gOzAotZM+CShfnA=;
 b=bMNc5sJymwies7ELwqcfq7aaJAH4Xk+NkXt+3SfnR75sUBjKlKiiU37Xk3r1dY5wfH
 is0F4K6Mw8qiiWfbjSD3NM2PMA0dQaoknOIfSmjLZ1rTO6HU76uB9soTnIRFYIqbT7iB
 txGYSswxLDHph3X73JvZYjiB41o31HdFhORLwfngG2lss5pqlwvpKCiamEwuajpdT9YE
 v7Wof8FjDbA19b4Uztd+Ve+EkiEDBkww+gXEardLYvhiYY90iTz/OmIHUfE4iN8PdS4C
 ho9wHAT3SZRa3Lss4TbEB4XPDspC9+y8kzjx0Oed3hANvwNo+y4oC6csR2rV41AoM+gp
 QeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697423021; x=1698027821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gggVllVZsRUE9SAozXOfdVt6AJq+gOzAotZM+CShfnA=;
 b=kaMMNIqQw/L7j0piFVmydq1vt4n9YNcFuCmOSJx44gvIV0zOjSHzkCuFqJn47T5ClV
 Fc17qF+iy8DlPE/NFZsxSF6MTVhI1cxrAiU/oz7Bjv8JsrqKW/fUlpyDxhz7mVOpwjze
 b9XG+flab6E1lcxdrBocFszK0DYP6Xs2Ggspqpl1d+a0Av2Ck8MxqVqqhcRfcUeABGtQ
 KTkPOAoLiodaS7XTyvKtmQS3wD4r7Y9qNGZJZ2fHDhG7bIUfZS0jevheywtYJxopJuJ5
 3tvYlFVnAEEhclBZKSk1oIoKJmUciczHkcCwe9xBm+A78HDGwX9Vn4IxqwbTCNlbQrs3
 4U0w==
X-Gm-Message-State: AOJu0YytFIoJMH27wr/WD5OGGoMUKCh50opHkQjoquv4kONwmQDSHqSG
 7YSzEXj7c0MoFPZaFJjFj+F5LJXw5U1AaiCurno=
X-Google-Smtp-Source: AGHT+IEF2q9xahxbrNKdrQnbJur3TYJi1vbfwaga2U6tnVKkBgNlS4z5WOJB1LHWa5e/js+FhwNHVq3TiN5Y0vn6x8g=
X-Received: by 2002:a67:e048:0:b0:457:c46b:8fba with SMTP id
 n8-20020a67e048000000b00457c46b8fbamr5345232vsl.5.1697423020793; Sun, 15 Oct
 2023 19:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <CAKmqyKP=4kGpO=8D13iJw7pJSkD9CFary_DHt236+e1GFMAngA@mail.gmail.com>
 <a89189d3-2975-487e-9d2e-bd8ea60feba5@ventanamicro.com>
In-Reply-To: <a89189d3-2975-487e-9d2e-bd8ea60feba5@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 12:23:14 +1000
Message-ID: <CAKmqyKNAPoe+X3w6TzpWZaMgkUj4dxyY=XubwguqbYrc0sLkzQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] riscv: RVA22U64 profile support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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

On Fri, Oct 13, 2023 at 5:07=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 10/11/23 00:01, Alistair Francis wrote:
> > On Sat, Oct 7, 2023 at 12:23=E2=80=AFAM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >> Hi,
> >>
> >> Several design changes were made in this version after the reviews and
> >> feedback in the v1 [1]. The high-level summary is:
> >>
> >> - we'll no longer allow users to set profile flags for vendor CPUs. If
> >>    we're to adhere to the current policy of not allowing users to enab=
le
> >>    extensions for vendor CPUs, the profile support would become a
> >>    glorified way of checking if the vendor CPU happens to support a
> >>    specific profile. If a future vendor CPU supports a profile the CPU
> >>    can declare it manually in its cpu_init() function, the flag will
> >>    still be set, but users can't change it;
> >>
> >> - disabling a profile will now disable all the mandatory extensions fr=
om
> >>    the CPU;
> >
> > What happens if you enable one profile and disable a different one?
>
> With this implementation as is the profiles will be evaluated by the orde=
r they're
> declared in riscv_cpu_profiles[]. Which isn't exactly ideal since we're e=
xchanging
> a left-to-right ordering in the command line by an arbitrary order that w=
e happened
> to set in the code.
>
> I can make some tweaks to make the profiles sensible to left-to-right ord=
er between
> them, while keeping regular extension with higher priority. e.g.:
>
>
> -cpu rv64,zicbom=3Dtrue,profileA=3Dfalse,profileB=3Dtrue,zicboz=3Dfalse
> -cpu rv64,profileA=3Dfalse,zicbom=3Dtrue,zicboz=3Dfalse,profileB=3Dtrue
> -cpu rv64,profileA=3Dfalse,profileB=3Dtrue,zicbom=3Dtrue,zicboz=3Dfalse

I think we should just not allow this.

I don't understand why a user would want this and what they mean here.
What if profileA and profileB have overlapping extensions?

Alistair

>
> These would all do the same thing: "keeping zicbom=3Dtrue and zicboz=3Dfa=
lse, disable profileA
> and then enable profile B"
>
> Switching the profiles order would have a different result:
>
> -cpu rv64,profileB=3Dtrue,profileA=3Dfalse,zicbom=3Dtrue,zicboz=3Dfalse
>
> "keeping zicbom=3Dtrue and zicboz=3Dfalse, enable profile B and then disa=
ble profile A"
>
>
> I'm happy to hear any other alternative/ideas. We'll either deal with som=
e left-to-right
> ordering w.r.t profiles or deal with an internal profile commit ordering.=
 TBH I think
> it's sensible to demand left-to-right command line ordering for profiles =
only.
>
>
> Thanks,
>
>
> Daniel
>
>
>
>
>
> >
> > Alistair
> >
> >>
> >> - the profile logic was moved to realize() time in a step we're callin=
g
> >>    'commit profile'. This allows us to enable/disable profile extensio=
ns
> >>    after considering user input in other individual extensions. The
> >>    result is that we don't care about the order in which the profile f=
lag
> >>    was set in comparison with other extensions in the command line, i.=
e.
> >>    the following lines are equal:
> >>
> >>    -cpu rv64,zicbom=3Dfalse,rva22u64=3Dtrue,Zifencei=3Dfalse
> >>
> >>    -cpu rv64,rva22u64=3Dtrue,zicbom=3Dfalse,Zifencei=3Dfalse
> >>
> >>    and they mean 'enable the rva22u64 profile while keeping zicbom and
> >>    Zifencei disabled'.
> >>
> >>
> >> Other minor changes were needed as result of these design changes. E.g=
.
> >> we're now having to track MISA extensions set by users (patch 7),
> >> something that we were doing only for multi-letter extensions.
> >>
> >> Changes from v1:
> >> - patch 6 from v1 ("target/riscv/kvm: add 'rva22u64' flag as unavailab=
le"):
> >>      - moved up to patch 4
> >> - patch 5 from v1("target/riscv/tcg-cpu.c: enable profile support for =
vendor CPUs"):
> >>      - dropped
> >> - patch 6 (new):
> >>    - add riscv_cpu_commit_profile()
> >> - patch 7 (new):
> >>    - add user choice hash for MISA extensions
> >> - patch 9 (new):
> >>    - handle MISA bits user choice when commiting profiles
> >> - patch 8 and 10 (new):
> >>    - helpers to avoid code repetition
> >> - v1 link: https://lore.kernel.org/qemu-riscv/20230926194951.183767-1-=
dbarboza@ventanamicro.com/
> >>
> >>
> >> Daniel Henrique Barboza (10):
> >>    target/riscv/cpu.c: add zicntr extension flag
> >>    target/riscv/cpu.c: add zihpm extension flag
> >>    target/riscv: add rva22u64 profile definition
> >>    target/riscv/kvm: add 'rva22u64' flag as unavailable
> >>    target/riscv/tcg: add user flag for profile support
> >>    target/riscv/tcg: commit profiles during realize()
> >>    target/riscv/tcg: add MISA user options hash
> >>    target/riscv/tcg: add riscv_cpu_write_misa_bit()
> >>    target/riscv/tcg: handle MISA bits on profile commit
> >>    target/riscv/tcg: add hash table insert helpers
> >>
> >>   target/riscv/cpu.c         |  29 +++++++
> >>   target/riscv/cpu.h         |  12 +++
> >>   target/riscv/cpu_cfg.h     |   2 +
> >>   target/riscv/kvm/kvm-cpu.c |   7 +-
> >>   target/riscv/tcg/tcg-cpu.c | 165 +++++++++++++++++++++++++++++++++--=
--
> >>   5 files changed, 197 insertions(+), 18 deletions(-)
> >>
> >> --
> >> 2.41.0
> >>
> >>


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWsHH-0000yr-45
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 19:21:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gWsHF-0000x8-Gw
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 19:21:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gWsHE-0008Bv-PB
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 19:21:25 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:37265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gWsH9-00088J-66; Tue, 11 Dec 2018 19:21:19 -0500
Received: by mail-lj1-x243.google.com with SMTP id e5-v6so14694916lja.4;
	Tue, 11 Dec 2018 16:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hJcS7kHLSqzTSWMVyhJmOmL4Jv2m6SSHpwneQf3aYWk=;
	b=WIomPHbIbspIcQXZk4L4VCLPTYoza/atqdLaHhfxjRpKPVM832gC3fpldDIEhAVdk/
	uehqB7ofUXhbI1x8dUyYBipEG2xlyAU/zGFXMJQwtX0uQTRrZNIymZnCvvqLuuA+Z2w4
	L36UGgKdmcjCwngDUsderQPW0Um+/UpqkEq8znEbBq02sKNDc1Ytrx5shykvJIjwmlmq
	+kXPBjoL7lXajtXP/UkqJxyhpZLIRvzEdD9Q5jneTQBVNweCxlXj32JGFIXXnEAVTMjk
	MmNCe2AF1bwbkv20BeCqunw89xci2CoV4MfUpNF4efySZX0ST7lct5XCjyygpnMX/PR0
	PV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hJcS7kHLSqzTSWMVyhJmOmL4Jv2m6SSHpwneQf3aYWk=;
	b=UNn9cRcgaxZm83TdQlZugBamjC/MQ0p2zpRqE8BuC0CwiHUAD9k7cTRnoMbdBxdiRF
	qzUUPzfdJwyvV/L/Nu9dhhvQJGbjGiLGuE6870kpg48tiNmei0bH0dn6LyK2UKX743HC
	QKKoVUXEiUMMJiD1yVjo/4m/3hE2q5T3wuWMrNkWVRGdUleGuMgDyG5B+3i0zuf2rQpi
	SXxfRjYZ1A5gXxhkf6iF0uFznsZ6AcolR0N5RoAMcu1KiUxofC6x8nWOvYFFDzma+Tpa
	qqDVKE48fyHFbip4izcg8jLZhGbWV/b6hlFNFNl5OAx7PSj3iOKmEKSo1xwrdN36TmIj
	ebTQ==
X-Gm-Message-State: AA+aEWb97TdMrLRPbCkoKArq9GPd9pj3ztFbZdgvFwL4h3v6xFgD2sTE
	GEeSCC3TVHs0ucn1On/j8IRY3nERI15Xszncm/Y=
X-Google-Smtp-Source: AFSGD/XStxPLTk4rRMO2yLAGuesHMicmFFi+GD9Usd9AnhYkClNypum0Ng/LHHrLelBSKznJPAVGd+r9LtyulPjsIt4=
X-Received: by 2002:a2e:449c:: with SMTP id
	b28-v6mr10798530ljf.47.1544574077637; 
	Tue, 11 Dec 2018 16:21:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<d6c491ecb5c0224c113ddfb2c06552ec89b68227.1544229872.git.alistair.francis@wdc.com>
	<b4a5e3e9-5e62-c0a3-67e3-891725db89d5@linaro.org>
In-Reply-To: <b4a5e3e9-5e62-c0a3-67e3-891725db89d5@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Dec 2018 16:20:50 -0800
Message-ID: <CAKmqyKMzgagUvJ-Zy-qMaMXk_2-3iLjuMyZwkOiu_ffb7mhH-A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [RFC v3 04/24] linux-user: riscv: Fix compile
 failure on riscv32 hosts
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2018 00:21:26 -0000

On Mon, Dec 10, 2018 at 9:04 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/7/18 6:46 PM, Alistair Francis wrote:
> > When cross compilling for riscv32 hosts using GCC 8.2 this error is seen:
> >     error: '__NR__llseek' undeclared (first use in this function); did you mean '_llseek'?
> >
> > To avoid the error let's ensure that __NR__llseek is defined.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  linux-user/riscv/target_syscall.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
> > index ee81d8bc88..af73f71839 100644
> > --- a/linux-user/riscv/target_syscall.h
> > +++ b/linux-user/riscv/target_syscall.h
> > @@ -47,6 +47,11 @@ struct target_pt_regs {
> >  #endif
> >  #define UNAME_MINIMUM_RELEASE "4.15.0"
> >
> > +/* This is sometimes needed to compile riscv32 Linux user mode */
> > +#if !defined(__NR__llseek) && !defined(__NR_lseek)
> > +#define __NR__llseek __NR3264_lseek
> > +#endif
>
> I'm not quite sure how this could be.  Upstream I see
>
> #if __BITS_PER_LONG == 64 && !defined(__SYSCALL_COMPAT)
> ...
> #define __NR_lseek __NR3264_lseek
> ...
> #else
> ...
> #define __NR_llseek __NR3264_lseek
>
> so this define should already exist.
>
> Do you have the wrong headers installed for the cross-build?

I'm using Yocto for the cross build, so I don't see how I can get the
wrong headers. I agree though that I probably shouldn't need this
patch. Maybe it's something to do with the glibc fork I'm using. I'll
drop this patch and see if I can figure out what's going on.

Alistair

>
>
> r~


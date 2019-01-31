Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gp90y-0005Fc-7o
	for mharc-qemu-riscv@gnu.org; Thu, 31 Jan 2019 04:52:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gp90w-0005E7-6z
	for qemu-riscv@nongnu.org; Thu, 31 Jan 2019 04:52:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gp90v-0000RJ-8e
	for qemu-riscv@nongnu.org; Thu, 31 Jan 2019 04:52:06 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34822)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gp90v-0000Pk-33
	for qemu-riscv@nongnu.org; Thu, 31 Jan 2019 04:52:05 -0500
Received: by mail-oi1-x244.google.com with SMTP id v6so2231284oif.2
	for <qemu-riscv@nongnu.org>; Thu, 31 Jan 2019 01:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f1Uy/v73Xrc6oCXkAZ/mQIR4wIY/0XMSyBIYUZ4eZ3E=;
	b=T/CyOnw0YwkjfsBcbLzA1j3ZXcvsRu7jL+kfpHrS4d/tPrbu4w/P6bz1VPIKxTxn7B
	a83G/hihxY/g2F5ykUEt1PuMgIyPv06bJRldh32pX9fyZTyxb+Q95B6k+EuyKh05J4pe
	cy0t/tpgD+AInMQUqoVRsTVuKlTPifEXzWHA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f1Uy/v73Xrc6oCXkAZ/mQIR4wIY/0XMSyBIYUZ4eZ3E=;
	b=eOOXXqKstx9sl4DZRHMF1BH5cNp7gURG08NKlqUXib8rJHzNZiwGS8xyhq5OXkL1R0
	pgzGIcqkTJsqjLB1Zzauo8+DH9a7AlldAEq8GkdK20+WGsQ46kLvIJrC3XDmS6KKmMv8
	QYuxHJM7MQGejfk7aKq1IGdxLTnSdx5htVv6ewBrNYMwLngsXPSUlsGUNCOVTxYkA/an
	8/I0wPPhNGKCd/GvL8Z5MUEMzms+1JKW+gLqYc9Yd6YGy5tEH68UomeE9+sbzjT1Zvpm
	r743WGMJ9SbsA9cDsXk0owNGw6OKzHdnztf+HYYJu9pbs18xWoATS/QjzNXANqjKQAOS
	/3wg==
X-Gm-Message-State: AHQUAuYS3VVkL+94BRAQxW9P5NLGOGw4zSrd7MwxgCUkxC6CL3cjxVD6
	VaS2J95O8P/Tck982LXDRQnVIwPDC/SX7yhwTnkiEg==
X-Google-Smtp-Source: ALg8bN4Qjt9Sh6Htf1rxyAsTLR5Wtgzn+HloCWmQr323Dg5RnxyHVheIicPLLzj0sYB1PrKpQ61U1AqFH3B1PleSh4o=
X-Received: by 2002:aca:b58b:: with SMTP id e133mr15160576oif.25.1548928323910;
	Thu, 31 Jan 2019 01:52:03 -0800 (PST)
MIME-Version: 1.0
References: <mhng-a324878c-b61d-4d8d-80bf-e15404469ef7@palmer-si-x1c4>
	<547f1afb-cce5-e456-5466-87ba333859b8@redhat.com>
In-Reply-To: <547f1afb-cce5-e456-5466-87ba333859b8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jan 2019 09:51:52 +0000
Message-ID: <CAFEAcA_hP=iuqWrVoqRjRhge27uC8VOJTjfATj2DMY0Hh5HHxA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Palmer Dabbelt <palmer@sifive.com>, Eric Blake <eblake@redhat.com>,
	qemu-riscv@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PR RFC] RISC-V Patches for 3.2,
 Part 3
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
X-List-Received-Date: Thu, 31 Jan 2019 09:52:07 -0000

On Thu, 31 Jan 2019 at 06:39, Thomas Huth <thuth@redhat.com> wrote:
>
> On 2019-01-30 20:01, Palmer Dabbelt wrote:
> > On Wed, 30 Jan 2019 09:45:33 PST (-0800), eblake@redhat.com wrote:
> >> On 1/30/19 11:35 AM, Palmer Dabbelt wrote:
> >>> The following changes since commit
> >>> 5385a5988c8a55bebdc878c05b96648579b5d6e0:
> >>>
> >>>   hw/virtio/virtio-balloon: zero-initialize the virtio_balloon_config
> >>> struct (2019-01-21 17:20:36 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git://github.com/palmer-dabbelt/qemu.git
> >>> tags/riscv-for-master-3.2-part3
> >>>
> >>> for you to fetch changes up to 461ab9de46d085a37b0da6f096aadc4e0dda4d4c:
> >>>
> >>>   target/riscv: fix counter-enable checks in ctr() (2019-01-29
> >>> 11:33:38 -0800)
> >>>
> >>> ----------------------------------------------------------------
> >>> RISC-V Patches for 3.2, Part 3
> >>
> >> There is no 3.2 release; the next release is named 4.0.  However, if you
> >> don't want to bother with sending a v2 pull request just to fix the
> >> merge commit message, that's okay with me.
> >
> > Ah, sorry.  I think I'm just going to leave it as is, I'll get it right
> > next time.
>
> Also note that you used "PR RFC" in the title ... so not sure whether
> Peter's scripts will catch this PR as a valid one...

My mail filter finds these RFC pullrequests, yes. I'm then
relying on my manual brain to not actually apply them.
(If it's a slow day I might do a test merge on them, but
usually my queue is full enough that I don't get to them
before the real PR appears.)

thanks
-- PMM


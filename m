Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHaCl-0000t1-1u
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 16:01:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHYAA-0005qg-2K
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHYA9-0002hw-5m
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:50:45 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:35099)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHYA8-0002gg-Un; Tue, 30 Oct 2018 13:50:45 -0400
Received: by mail-lf1-x141.google.com with SMTP id d7-v6so9582804lfi.2;
	Tue, 30 Oct 2018 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MObiaJSa6bnSj2efTjdDNgvcA8Itrlq0pu5rt2sD8qE=;
	b=dKKjTCgejYPA5wh56M13K/S7y1lXv17MB5vQM9gPgSNxzUbnO1tijVxeyuuH3Pk/eZ
	ndnNcJv4OE9PJP7y/7x8bTW2HTX7673XWSj3kMuWY6xv6JnQBomGcVHbhmqiYM/SPcq2
	aGmRH6YMkhCxjUW0Anl9UzL6XpmZJfMCYxOk1A+e+TJJ/Yt0OeuCSnH4IaY0nSudJz6j
	nteh0nP8M0P33GV9xi3uuUY9CnWIXOKvv67W/8i/4m5ugHgW4VezC9s6HT8FUJpwT6r2
	tBaxl4cGA+CinV0dkSdepgHbSnDFDuf9Y9mMSiaUw5rk3sFwbuwKb5Z4NY292J4wZ6SR
	qdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MObiaJSa6bnSj2efTjdDNgvcA8Itrlq0pu5rt2sD8qE=;
	b=I4vmqu5uykC76cQBZFd96HCKZtkcA5KlAqDuCzEkcCUPXl2S6JAlM+YVycI0DJY6y9
	YA93Mgo3YKcoE3EG8Z2tGzTvN2TkXXPKyGd++4pFMcfLC02Qt5fZ5IbqxZ49Vyy5PSHM
	rXxdNKd1qv/wPFIpPTMRtBQQ6offj8NPTdtJUVAdKLwjuv5IxMOTMvbDopioHB7Dud2v
	iwkValSgyGx7iN6+LQFwqxILWE5oI4HoQgR69TA5JsB7m432gdS9eRM5LWwd/jeCTmvt
	fcSheqhWAfoAjSpNgQpRWXoqiSLCqm9Nj0teLz86eT4cQRKbEi5HmlXDkSjeyFKyMXI7
	8cOQ==
X-Gm-Message-State: AGRZ1gLmZWIzvL8M2BMTxLg25PuszAf3Qnmv0LAK8BPKtlLWR2bm3X61
	1AaeIB2lkYZc9dwCI2Tkk0Jh4Q1DXRPKjWpqGsw=
X-Google-Smtp-Source: AJdET5cghlsRgzxXJjPTxrrZepb6ttLXEP4K0I1pMQcMBmTdU0Ax4flElsg0aj1R/zv/5zfiZ6uoSSgkHC+2nlNsjGI=
X-Received: by 2002:a19:4e9a:: with SMTP id
	u26-v6mr2446134lfk.91.1540921842824; 
	Tue, 30 Oct 2018 10:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20181030174356.16915-1-palmer@sifive.com>
In-Reply-To: <20181030174356.16915-1-palmer@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Oct 2018 10:50:15 -0700
Message-ID: <CAKmqyKOV5HaD-gegE1T0_DhBFffi27wJNa_pAg-xDHOS=L5gnQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
X-Mailman-Approved-At: Tue, 30 Oct 2018 16:01:34 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] Add qemu-riscv@nongnu.org as
 the RISC-V list
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
X-List-Received-Date: Tue, 30 Oct 2018 17:50:46 -0000

On Tue, Oct 30, 2018 at 10:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> We now have a RISC-V specific QEMU development list.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d550fd8b809c..10983bd52d64 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -244,6 +244,7 @@ M: Palmer Dabbelt <palmer@sifive.com>
>  M: Alistair Francis <Alistair.Francis@wdc.com>
>  M: Sagar Karandikar <sagark@eecs.berkeley.edu>
>  M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> +L: qemu-riscv@nongnu.org
>  S: Maintained
>  F: target/riscv/
>  F: hw/riscv/
> --
> 2.18.1
>
>


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3mBv-0004Cv-Nf
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 14:31:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3mBs-0004AA-T2
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 14:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3mBr-0003k2-Ui
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 14:31:52 -0400
Received: from mail-it1-x12f.google.com ([2607:f8b0:4864:20::12f]:39397)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h3mBr-0003iu-KI
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 14:31:51 -0400
Received: by mail-it1-x12f.google.com with SMTP id l15so6158759iti.4
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 11:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eliv2jE3NX7P8PQLeKY9FIyqxoOkvNrQPHcF5VwwRSE=;
	b=JGBVxsaWFpi2KEsOfsXaJHUYookWwJy1K9G7g2OBcj+dqfvT5NarpjSSU+OilhcAUp
	HZeGNQRIkH6OJ5v04TSTdJ3U4WA9YzQ6461UyPhiaUaat1IVBWmvlSkTpWlOgMLk2KWl
	B+ho9FVJlfF7MULQyMu84sW1Niwe6nkzZoAeG5IOBVheCmeY/ZD9M9uMmzrLN/c5+sI3
	OqgYw7WFFHXEkdY+T15bhKtxgL4kk6R1fMN6aGqngAU2QKz2etvJph2IRAdxGsKlNTJt
	oFFKHg0bRA1A4XBojrA6CknZ7pkjOBKSCfY9WAlyys+ibRUnTzNwTnixakIrOCdhS7cn
	MIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eliv2jE3NX7P8PQLeKY9FIyqxoOkvNrQPHcF5VwwRSE=;
	b=l0uDTYy+U/Ne74k3LL1PgqsufXsMOUHNVzkQlFxi0b/4Urthb1aovBhPVmRt2SFk8N
	HNVgpAtiEhigwhbQsNstLr3iv+YcEOe6MieByHhy7mZHSlntAwro70in/Qlp9Jq+jR2N
	4ebmvd9hx1d29useENUl7A+DR5CWXI/o2NVVrifPwDO8/4AYkku8PJAz/e1JXkxkhhiG
	PoQ4e6RTKsxUIsrbifjmDx+BcwJk9cTWRjyrdFo+ZBw+IR5Wk3f3ng9C125IgGMOzpGT
	srWo1r+tcIq63xOYDxuFkvlpNWxFqoK3edr2DpnGX4Avt9pbBsOPu6YzymJVYt03vQDo
	/Vlg==
X-Gm-Message-State: APjAAAVWcxsAGyLLbgUzt3Al6rW0BuvUlhVVFEmlPdgLI3EeLjK1k8NF
	ImOU8ebbv2TJeMw5h0JH6p/ioJ4gBgnsjNoloWWiaQ==
X-Google-Smtp-Source: APXvYqzQJgVEOcc5plh8+2cc7U5HCKjAJzCO5+/IOLgvRlTq8hsJjKAFmR+TARMrcAC7Nb3sQvmjouWQJp9awnq5lDw=
X-Received: by 2002:a24:4087:: with SMTP id n129mr2808942ita.140.1552415510221;
	Tue, 12 Mar 2019 11:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190312131526.14710-1-palmer@sifive.com>
In-Reply-To: <20190312131526.14710-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Mar 2019 18:31:38 +0000
Message-ID: <CAFEAcA_hZLO032+gPuoy6enJvssjiZBUtBaC_pG4BGUPR3F0kQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::12f
Subject: Re: [Qemu-riscv] [PULL] target/riscv: Convert to decodetree
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
X-List-Received-Date: Tue, 12 Mar 2019 18:31:54 -0000

On Tue, 12 Mar 2019 at 13:15, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit 377b155bde451d5ac545fbdcdfbf6ca17a4228f5:
>
>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2019-03-11 18:26:37 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-sf3
>
> for you to fetch changes up to a971f8ae0e8ab6fab1eee199961b1ea2f4d876f7:
>
>   target/riscv: Remove decode_RV32_64G() (2019-03-12 03:08:34 -0700)
>
> ----------------------------------------------------------------
> target/riscv: Convert to decodetree


I'm still seeing some errors about redefining typedefs, I'm afraid:

target/riscv/decode_insn16.inc.c:102:28: error: redefinition of
typedef 'arg_c_addi16sp_lui' is a C11 feature
[-Werror,-Wtypedef-redefinition]
target/riscv/decode_insn16.inc.c:122:17: error: redefinition of
typedef 'arg_c_j' is a C11 feature [-Werror,-Wtypedef-redefinition]
target/riscv/decode_insn16.inc.c:134:26: error: redefinition of
typedef 'arg_c_flwsp_ldsp' is a C11 feature
[-Werror,-Wtypedef-redefinition]
target/riscv/decode_insn16.inc.c:144:26: error: redefinition of
typedef 'arg_c_fswsp_sdsp' is a C11 feature
[-Werror,-Wtypedef-redefinition]
target/riscv/decode_insn16.inc.c:102:28: error: redefinition of
typedef 'arg_c_addi16sp_lui' is a C11 feature
[-Werror,-Wtypedef-redefinition]
target/riscv/decode_insn16.inc.c:122:17: error: redefinition of
typedef 'arg_c_j' is a C11 feature [-Werror,-Wtypedef-redefinition]
target/riscv/decode_insn16.inc.c:134:26: error: redefinition of
typedef 'arg_c_flwsp_ldsp' is a C11 feature
[-Werror,-Wtypedef-redefinition]
target/riscv/decode_insn16.inc.c:144:26: error: redefinition of
typedef 'arg_c_fswsp_sdsp' is a C11 feature
[-Werror,-Wtypedef-redefinition]

thanks
-- PMM


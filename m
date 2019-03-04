Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0lMg-0007JC-0H
	for mharc-qemu-riscv@gnu.org; Mon, 04 Mar 2019 06:02:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h0lMe-0007J3-0x
	for qemu-riscv@nongnu.org; Mon, 04 Mar 2019 06:02:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h0lMc-0003MA-Sp
	for qemu-riscv@nongnu.org; Mon, 04 Mar 2019 06:02:31 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:45227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h0lMc-0003In-DY
	for qemu-riscv@nongnu.org; Mon, 04 Mar 2019 06:02:30 -0500
Received: by mail-ot1-x32a.google.com with SMTP id i12so3852831otp.12
	for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2019 03:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8ebtU+jhK5Iv+XUZwnzQSblhY0/M+8kw6FN5BLJyAIw=;
	b=PTWw3vaWPjpQUZoxsIrM/bSdfIAgooLTzYp79eA0aEFUtwCfFtm5hhYfB41erSm99U
	rrTOJ9JPZ/tdzW5E4KKoN73RXzXV1+eERP7SKTdolyx+6lboJgL82bOUehkk4G3AidQe
	XgyGPYGdRwJzOsdFifpAPna5sijDDOQ9+i6Vd0dUnynKlpKH2icU9uggByfYrraP7CJc
	stnsqcthWdFf2E8ayah8w4+P2xDRKvNl9j490b39iHgewYRwn77Em7hDkoWk/4Go4pDw
	/f2FIzLTE6A4sJEN55tbK/0kp2CrFp5DyjnUWAKE04o7/J3u6oIpzsnbf1SGAspGJAhc
	jV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8ebtU+jhK5Iv+XUZwnzQSblhY0/M+8kw6FN5BLJyAIw=;
	b=kprjkVGWkdDyySZ32AbrnTtnlSOYOqE4d2BXAHq/9C3X5LEstDYG7qSajsczcSzWzI
	/byu0KW4HLCxZ7LpQLokfK3D1OpWl3MKLnnaYwFzSJDlElrNhCt846IvID8UcJiwcK1J
	/w5qgrh6gCEj7RseW0P0PO7aKkbK0Zf2pcrUlDBa2lKQiXnaQVjgAiqaOUn+wL0yvch3
	QdY6041ZEntMXSdlQ1kBn4Ai7Zfv7NYnE8ciGhQUz7Soh1wTPIyHWcUtTeDKsK28Ixcw
	XWnZxHBiDjmVYkkR+I8yK6FTkrp1u4Kia5S+xD42pTw0V4f3LysSiPUQiVXAK+00eAd2
	eGPA==
X-Gm-Message-State: APjAAAX3IIFkgxZD1XNbfvtTZN3pRbiXg87H1ndWK1S+rw1z4UfK0UEC
	7kQFoLrxCoRhanzXRblnkJsz/y/QXyZgov2vGm0Crw==
X-Google-Smtp-Source: APXvYqyq3Ib4rR/hVfoYL5UWChPW3Xw5A6RSWvj4nR2CZYkBHWaDlAtC26gMzTekM4XnQqgtQNnEDjvNawfwGooaTe4=
X-Received: by 2002:a9d:61c7:: with SMTP id h7mr11283286otk.363.1551697347238; 
	Mon, 04 Mar 2019 03:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20190301214945.4353-1-palmer@sifive.com>
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2019 11:02:14 +0000
Message-ID: <CAFEAcA-ZbFf+_Bt4QGu6ZchOZtvizWPR_5pFz4vOVVYAf23mgA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32a
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
X-List-Received-Date: Mon, 04 Mar 2019 11:02:33 -0000

On Fri, 1 Mar 2019 at 21:49, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> merged tag 'i2c-for-release-20190228'
> Primary key fingerprint: FD0D 5CE6 7CE0 F59A 6688  2686 61F3 8C90 919B FF81
> The following changes since commit 20b084c4b1401b7f8fbc385649d48c67b6f43d44:
>
>   Merge remote-tracking branch 'remotes/cminyard/tags/i2c-for-release-20190228' into staging (2019-03-01 11:20:49 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-sf2
>
> for you to fetch changes up to 0bcba29464ea9969fc69cd729e4c8bddfb2e18e3:
>
>   target/riscv: Remaining rvc insn reuse 32 bit translators (2019-03-01 13:16:18 -0800)
>
> ----------------------------------------------------------------
> target/riscv: Convert to decodetree
>
> Bastian: this patchset converts the RISC-V decoder to decodetree in four major steps:
>
> 1) Convert 32-bit instructions to decodetree [Patch 1-15]:
>     Many of the gen_* functions are called by the decode functions for 16-bit
>     and 32-bit functions. If we move translation code from the gen_*
>     functions to the generated trans_* functions of decode-tree, we get a lot of
>     duplication. Therefore, we mostly generate calls to the old gen_* function
>     which are properly replaced after step 2).
>
>     Each of the trans_ functions are grouped into files corresponding to their
>     ISA extension, e.g. addi which is in RV32I is translated in the file
>     'trans_rvi.inc.c'.
>
> 2) Convert 16-bit instructions to decodetree [Patch 16-18]:
>     All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
>     we convert the arguments in the 16 bit trans_ function to the arguments of
>     the corresponding 32 bit instruction and call the 32 bit trans_ function.
>
> 3) Remove old manual decoding in gen_* function [Patch 19-29]:
>     this move all manual translation code into the trans_* instructions of
>     decode tree, such that we can remove the old decode_* functions.
>
> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
>    by Richard. [Patch 30-34]
>
> Palmer: This passed Alistar's testing on rv32 and rv64 as well as my
> testing on rv64, so I think it's good to go.  Thanks for the cleanup!
>

Hi; I'm afraid this has compile errors on the OSX build:


In file included from
/Users/pm215/src/qemu-for-merges/target/riscv/translate.c:377:
target/riscv/decode_insn16.inc.c:37:15: error: redefinition of typedef
'arg_fld' is a C11 feature [-Werror,-Wtypedef-redefinition]
typedef arg_i arg_fld;
              ^
target/riscv/decode_insn32.inc.c:293:15: note: previous definition is here
typedef arg_i arg_fld;
              ^
In file included from
/Users/pm215/src/qemu-for-merges/target/riscv/translate.c:377:
target/riscv/decode_insn16.inc.c:39:15: error: redefinition of typedef
'arg_lw' is a C11 feature [-Werror,-Wtypedef-redefinition]
typedef arg_i arg_lw;
              ^
target/riscv/decode_insn32.inc.c:137:15: note: previous definition is here
typedef arg_i arg_lw;
              ^
In file included from
/Users/pm215/src/qemu-for-merges/target/riscv/translate.c:377:
target/riscv/decode_insn16.inc.c:41:15: error: redefinition of typedef
'arg_fsd' is a C11 feature [-Werror,-Wtypedef-redefinition]
typedef arg_s arg_fsd;
              ^
target/riscv/decode_insn32.inc.c:295:15: note: previous definition is here
typedef arg_s arg_fsd;
              ^
In file included from
/Users/pm215/src/qemu-for-merges/target/riscv/translate.c:377:
target/riscv/decode_insn16.inc.c:43:15: error: redefinition of typedef
'arg_sw' is a C11 feature [-Werror,-Wtypedef-redefinition]
typedef arg_s arg_sw;
              ^
target/riscv/decode_insn32.inc.c:147:15: note: previous definition is here
typedef arg_s arg_sw;
              ^
In file included from
/Users/pm215/src/qemu-for-merges/target/riscv/translate.c:377:
target/riscv/decode_insn16.inc.c:49:28: error: redefinition of typedef
'arg_c_addi16sp_lui' is a C11 feature [-Werror,-Wtypedef-redefinition]
typedef arg_c_addi16sp_lui arg_c_addi16sp_lui;
                           ^
target/riscv/decode_insn16.inc.c:7:3: note: previous definition is here
} arg_c_addi16sp_lui;
  ^

(and a lot of other similar errors)

thanks
-- PMM


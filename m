Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBpJc-0006bW-Ut
	for mharc-qemu-riscv@gnu.org; Wed, 03 Apr 2019 19:29:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hBpJZ-0006aT-Q2
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 19:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hBpJX-00041v-P0
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 19:29:05 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:40816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hBpJQ-0003Vg-8l; Wed, 03 Apr 2019 19:28:56 -0400
Received: by mail-lf1-x143.google.com with SMTP id a28so355989lfo.7;
	Wed, 03 Apr 2019 16:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F09JXLIt+jQxMGVUOzzqPEvj1I58ecKZOwHxdNFKIp0=;
	b=WdcOGgXFf5AwGkRhiZ8wLX1Ctsimk3lmdANKmux+tWuboatkRRFU/KrZh6bE11bSKK
	Y11MnahHkCrMlV1A+rvU+gndGY1XqNbTSPgd/SH9+GbLcMt5idTrIAxgP0dZXWO+PFXc
	oXXHuI+XLAe4F5O57qIXMV+ReX2F7z4sWyaK1IrAcyP34Pqb7htlxKSl0CRwdby+x3KI
	Z4ou+bGZ+nlURy2bNJgcv3F+Ic3n0Xpv7O146UoZNnbO+eiQCxMStdzFITGc+IVuWCVn
	8kgzwW01wiDsAKVR6K62zn4B6G5SNUXJy5nL3iYUmsxou6J6xZP4a+EjGuhxrgg3PeSG
	SZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F09JXLIt+jQxMGVUOzzqPEvj1I58ecKZOwHxdNFKIp0=;
	b=lAzdblVKNXIHUriAbQUeXS3+wDKNcL30jjcRo9qcofX3SYu1PMIMtW8YJ/Fv9hZnuw
	hVaJ1IAJf1gBmBPGTMZeQoIly/laVwRt+JzlKf/UcQ0RwtrllfFVRl74uoYI/tk2Uip7
	BucxWdvSz0NMBoUAwS/Oe8wu3wcRwJ+QVx6ezRcttJzMi/I05quC8F03LUi7ZtVhEVdS
	k1lnGQdvc5uopX4BSraPnghAYwQPl+QHnxRbRqEc/5VH8j/hZumfro/sjErcfUBVLHGv
	Blip7USxNHmaMKr2XEj0Fb1w1JG+tUCiBqxSIgH0E+iiaw3l2WIWL2IiQI3WPelVezto
	tjnw==
X-Gm-Message-State: APjAAAWO22kBx3seySbS2P45OPlgXYg/vEfu4qczhU9+LFo0NkuUCqP6
	DJSDRmcTPRLC3G1lzlSMQlSAv7od3Jagvrr1E2Q=
X-Google-Smtp-Source: APXvYqyMvN8g1+fjk5bhTgZGgrSs0VTeJlrqkUyinSyylvu51Bxa1kpVq8lwZ9AQ2PYOYJE6WO2LfxW55qflaYPnP/c=
X-Received: by 2002:a19:9107:: with SMTP id t7mr1308777lfd.48.1554334128358;
	Wed, 03 Apr 2019 16:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190401031155.21293-1-richard.henderson@linaro.org>
	<20190401031155.21293-2-richard.henderson@linaro.org>
In-Reply-To: <20190401031155.21293-2-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Apr 2019 16:27:15 -0700
Message-ID: <CAKmqyKOAAC_NpxBCBwK+0R=GO8b2YxEfzU0Thh9QNSB_x1FAWQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-4.1 1/8] target/riscv:
 Name the argument sets for all of insn32 formats
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
X-List-Received-Date: Wed, 03 Apr 2019 23:29:07 -0000

On Sun, Mar 31, 2019 at 8:12 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 6f3ab7aa52..77f794ed70 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -34,9 +34,13 @@
>  %imm_u    12:s20                 !function=ex_shift_12
>
>  # Argument sets:
> +&empty
>  &b    imm rs2 rs1
>  &i    imm rs1 rd
> +&j    imm rd
>  &r    rd rs1 rs2
> +&s    imm rs1 rs2
> +&u    imm rd
>  &shift     shamt rs1 rd
>  &atomic    aq rl rs2 rs1 rd
>
> @@ -44,9 +48,9 @@
>  @r       .......   ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
>  @i       ............    ..... ... ..... ....... &i      imm=%imm_i     %rs1 %rd
>  @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
> -@s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
> -@u       ....................      ..... .......         imm=%imm_u          %rd
> -@j       ....................      ..... .......         imm=%imm_j          %rd
> +@s       .......   ..... ..... ... ..... ....... &s      imm=%imm_s %rs2 %rs1
> +@u       ....................      ..... ....... &u      imm=%imm_u          %rd
> +@j       ....................      ..... ....... &j      imm=%imm_j          %rd
>
>  @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
>  @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
> --
> 2.17.1
>
>


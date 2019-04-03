Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBpLZ-0007Qz-A6
	for mharc-qemu-riscv@gnu.org; Wed, 03 Apr 2019 19:31:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hBpLX-0007NX-6e
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 19:31:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hBpLV-0001OF-Im
	for qemu-riscv@nongnu.org; Wed, 03 Apr 2019 19:31:06 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:45209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hBpLJ-0000iA-28; Wed, 03 Apr 2019 19:30:53 -0400
Received: by mail-lf1-x143.google.com with SMTP id 5so336856lft.12;
	Wed, 03 Apr 2019 16:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3bfD+KQ+YtIfEmQKphRtL+XSPhWZcuP7XAWTJXxPIYg=;
	b=V9RXKmx3h+bSNDuMH1+UJXzph3Idfa3GqOQ03ZQA2sPKijhnFAyd1fBxw8TPphiXWt
	onH2zJeHrj536OHEVp1f3RNdDO+X2t7izizihKxY7efCRnMlpqKnHtBRuJmPtHbjAfSh
	bNaYlgzMFKG5Vb/Na3KmIX42fyvUsw3mAQQ1hJVpQ1VdYawXNSqwtsAXsYWWfMr3j1UU
	MaCeqvXq6y3OZM4ocnLGLCC7PKEV4xlGGRl/o/+fOgYSpmMO3NFafFh6IUfb9VggKFGJ
	7lpJJadmTh1tuOkasV/D97k1JVx1cnt9ZMv8PeQTHizhS5OqOu5ciHJlxbg5aMBwvSAJ
	6s+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3bfD+KQ+YtIfEmQKphRtL+XSPhWZcuP7XAWTJXxPIYg=;
	b=cDd0h0QHI8FYGIxZFteiEKtpv2R/dLwWd3berUxxURxWiSOeMW7yQBw2h6pRTgMnjv
	nyLmDw3fBqigKKWJkmGYoM8q1rVz8QCXNWDWyNBRM5irJ+C/V/Xu1ecCoW3iNFFroh6A
	1fTAcMyegMjN4ApCZJbFDIaZ5ZHX1K7NEWXvwn5uHkr4MDL1cZUZCJuSSEtF1RmDxVkZ
	7AjYEF1m/7edrNqRTMXVCJeUKS1bLkneWGl2bppOSk92/SALgwmfaIE65fk5ynmhWST8
	rA6kANxp8gg4/Nc6YEt+4HO37IAw9dv7t/U8pb5G0FzWUriTaFgQ2ZZgY8hCvY9+jP5N
	yMoA==
X-Gm-Message-State: APjAAAVT5T7Hso+Un1Hs3qN5YP+zm/NTdqC9WAYxDlRSsgDLwBeNtZ2d
	SefbwYU3UJ3LnUdDLjg1ZNwulUejD9GtMtMCVlKnHmEh
X-Google-Smtp-Source: APXvYqyZZoYdw3IvFL4IvUdMUtWWrA6yoIoz9Qh/9E6hqHYnK8/k3RB0S+MP7Um26cGOByq99xKxDgEqnUA6gloEG1g=
X-Received: by 2002:ac2:420b:: with SMTP id y11mr1330806lfh.104.1554334250508; 
	Wed, 03 Apr 2019 16:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190401031155.21293-1-richard.henderson@linaro.org>
	<20190401031155.21293-3-richard.henderson@linaro.org>
In-Reply-To: <20190401031155.21293-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Apr 2019 16:29:21 -0700
Message-ID: <CAKmqyKNZZGQnPy3hw6DWEif7Oe2Jz=owMTbGa9atnqu_tZwENw@mail.gmail.com>
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
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-4.1 2/8] target/riscv: Use
 --static-decode for decodetree
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
X-List-Received-Date: Wed, 03 Apr 2019 23:31:08 -0000

On Sun, Mar 31, 2019 at 8:15 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The generated functions are only used within translate.c
> and do not need to be global, or declared.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c   | 2 --
>  target/riscv/Makefile.objs | 8 ++++----
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index dd763647ea..7ebd590486 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -538,7 +538,6 @@ static int ex_rvc_register(int reg)
>      return 8 + reg;
>  }
>
> -bool decode_insn32(DisasContext *ctx, uint32_t insn);
>  /* Include the auto-generated decoder for 32 bit insn */
>  #include "decode_insn32.inc.c"
>
> @@ -667,7 +666,6 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>  #include "insn_trans/trans_rvd.inc.c"
>  #include "insn_trans/trans_privileged.inc.c"
>
> -bool decode_insn16(DisasContext *ctx, uint16_t insn);
>  /* auto-generated decoder*/
>  #include "decode_insn16.inc.c"
>  #include "insn_trans/trans_rvc.inc.c"
> diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
> index 9c6c109327..c7a1b063ed 100644
> --- a/target/riscv/Makefile.objs
> +++ b/target/riscv/Makefile.objs
> @@ -7,14 +7,14 @@ decode32-$(TARGET_RISCV64) += $(SRC_PATH)/target/riscv/insn32-64.decode
>
>  target/riscv/decode_insn32.inc.c: $(decode32-y) $(DECODETREE)
>         $(call quiet-command, \
> -         $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn32 $(decode32-y), \
> -         "GEN", $(TARGET_DIR)$@)
> +         $(PYTHON) $(DECODETREE) -o $@ --static-decode decode_insn32 \
> +          $(decode32-y), "GEN", $(TARGET_DIR)$@)
>
>  target/riscv/decode_insn16.inc.c: \
>    $(SRC_PATH)/target/riscv/insn16.decode $(DECODETREE)
>         $(call quiet-command, \
> -         $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn16 --insnwidth 16 $<, \
> -         "GEN", $(TARGET_DIR)$@)
> +         $(PYTHON) $(DECODETREE) -o $@ --static-decode decode_insn16 \
> +          --insnwidth 16 $<, "GEN", $(TARGET_DIR)$@)
>
>  target/riscv/translate.o: target/riscv/decode_insn32.inc.c \
>         target/riscv/decode_insn16.inc.c
> --
> 2.17.1
>
>

